Return-Path: <linux-gpio+bounces-21403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFCAD597E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 17:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A46188E456
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1F4190664;
	Wed, 11 Jun 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfZVUgB5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0B1185920;
	Wed, 11 Jun 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654207; cv=none; b=iMRpHEBQ0Je7LXyK2hgwROatc8qIKvGzosSNZTQnW4zpPqx6R38y9rK+cBbkw3/OFd/VOhadX8UEsa2goIIn7Z8u0qDcmmf7EvuTIXqgEJNxMzC1YVRnPhOTjRM0Twhhj/1B2clHFQNug6vIgcYBjSrhhamfPu33H+6wsTLma/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654207; c=relaxed/simple;
	bh=WLyNWYf5IcSY3WxP84heQHYPfpvQ58JTRkFiVKTi2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4zeqI2YCNNJCk9FItV5/rwERUqIVyWe/Zc7Mi2IoAd96EYqijMYAO9M0zgNKCSgpssH3rh29CwXX8EwWD7dFxlufonQM5jWFbrexJY9rX0Ccg8AlhyK3NlBBXNmC4uHY9Sz0A6A9+FtT2Xy7YhQ24lBbENKJw6epQkYkf8fsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfZVUgB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E13C4CEE3;
	Wed, 11 Jun 2025 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749654206;
	bh=WLyNWYf5IcSY3WxP84heQHYPfpvQ58JTRkFiVKTi2uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfZVUgB5ZeAy5mtLSI8+wD9clA43KAFlxujPll6yOjNwux6F1FKL/ebETxgexXAlQ
	 d/FNUCTjp6Yq/5vLRu7ztNSwKh2xvPSPFxuhrvW4mvtYVCF7DJny6OPYd8sC5pvUVE
	 MQ/lSc5TTmaPdMqckddgbOr7xFcet/yUCxPwWfzeddj7TxANixgyOzc1X77jjGC7dk
	 1cf6HWYJQuI3oFtKdhw1O8K/exQp+ZYzs/m31mryQF9cw7jgUi4jfMKheUaji97Kz4
	 jgpvIItLlrCJReybJRikJFgKIRYO67Rs1wG+UBSY6270T3T59S25ve+lrVQ2SVBzuD
	 75DilNsWkJJUA==
Date: Wed, 11 Jun 2025 10:03:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: msm: mark certain pins as invalid for
 interrupts
Message-ID: <3i6ni6jfq7vzij5cj4h35sy4ceegeekuv3lr5b3nmyqtheky6q@mlrspoyavfwt>
References: <20250611143911.48501-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611143911.48501-1-brgl@bgdev.pl>

On Wed, Jun 11, 2025 at 04:39:11PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> When requesting pins whose intr_detection_width setting is not 1 or 2
> for interrupts (for example by running `gpiomon -c 0 113` on RB2), we'll
> hit a BUG() in msm_gpio_irq_set_type(). Potentially crashing the kernel
> due to an invalid request from user-space is not optimal, so let's go
> through the pins and mark those that would fail the check as invalid for
> the irq chip as we should not even register them as available irqs.
> 

I had to go dig into the code to understand why there is a problem with
GPIO 113 on RB2 (i.e. UFS_RESET on SM6115)... I think it would have been
better to document the actual reason for the problem, which is:

"The UFS_RESET pin doesn't have interrupt logic, but is registered as a
GPIO. Requesting the interrupt of this pin hits a BUG() in
msm_gpio_irq_set_type() because intr_detection_width is invalid"

> This function can be extended if we determine that there are more
> corner-cases like this.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index f012ea88aa22c..77e0c2f023455 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1038,6 +1038,24 @@ static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
>  	       test_bit(d->hwirq, pctrl->skip_wake_irqs);
>  }
>  
> +static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
> +					 unsigned long *valid_mask,
> +					 unsigned int ngpios)
> +{
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct msm_pingroup *g;
> +	int i;
> +
> +	bitmap_fill(valid_mask, ngpios);
> +
> +	for (i = 0; i < ngpios; i++) {
> +		g = &pctrl->soc->groups[i];
> +		if (g->intr_detection_width != 1 &&
> +		    g->intr_detection_width != 2)
> +			clear_bit(i, valid_mask);
> +	}
> +}
> +
>  static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -1441,6 +1459,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_bad_irq;
>  	girq->parents[0] = pctrl->irq;
> +	girq->init_valid_mask = msm_gpio_irq_init_valid_mask;
>  
>  	ret = gpiochip_add_data(&pctrl->chip, pctrl);
>  	if (ret) {
> -- 
> 2.48.1
> 

