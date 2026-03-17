import { Controller } from "/assets/javascript/stimulus.min.js";

export default class extends Controller {
  static targets = ["track", "prevBtn", "nextBtn"]

  connect() {
    this.updateButtons();
    this.trackTarget.addEventListener("scroll", () => this.updateButtons(), { passive: true });
  }

  scrollPrev() {
    this.trackTarget.scrollBy({ left: -this.scrollDistance(), behavior: "smooth" });
  }

  scrollNext() {
    this.trackTarget.scrollBy({ left: this.scrollDistance(), behavior: "smooth" });
  }

  updateButtons() {
    const { scrollLeft, scrollWidth, clientWidth } = this.trackTarget;
    const atStart = scrollLeft <= 0;
    const atEnd = scrollLeft + clientWidth >= scrollWidth - 1;

    if (this.hasPrevBtnTarget) {
      this.prevBtnTarget.disabled = atStart;
      this.prevBtnTarget.classList.toggle("horizontal-scroll__btn--hidden", atStart);
    }

    if (this.hasNextBtnTarget) {
      this.nextBtnTarget.disabled = atEnd;
      this.nextBtnTarget.classList.toggle("horizontal-scroll__btn--hidden", atEnd);
    }
  }

  scrollDistance() {
    const item = this.trackTarget.querySelector(".horizontal-scroll__item");
    if (!item) return this.trackTarget.clientWidth * 0.8;
    const gap = parseInt(getComputedStyle(this.trackTarget).gap) || 0;
    return (item.offsetWidth + gap) * 3;
  }
}
