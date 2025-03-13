Return-Path: <linux-gpio+bounces-17561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F274A60331
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 22:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4104172A47
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 21:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB9B1F4717;
	Thu, 13 Mar 2025 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh6585jG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2551845948;
	Thu, 13 Mar 2025 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741899913; cv=none; b=YFXYgaCWZHXz8yfshK7THIWY/F1kKxi5qCOvawH0LfoRn2OJAj2RrUrhTarQP4ohKtfTtPRcdwj9wgnaTQKtFhMqXiN3hEbMudRmhwcOhx5cfmM4n17zkPAbfUfKbkSN3iqVZXTusurycP54CXCVB8IABGFkLinWAdKznS2lB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741899913; c=relaxed/simple;
	bh=2qAD5DPeZP4ry+qT2Ir/csKbmOrfdByQdkopzq7WRjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPOx++7vumFNw9kfpUORLc9Zj/lniIoEAuXTMXSGQpG3pvu2bdJnC5i4ZzJxUa6V+af6bmT7UdCoYQQ1Gljl/sodM8lB7ZUME+tyx6kosy5AvjjyGZcBP2IxsN2uIof05Sc7HhtlzW0Ze1kQh1fiQp6CK2wfeSVf1xhwKBMib+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh6585jG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D694C4CEDD;
	Thu, 13 Mar 2025 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741899912;
	bh=2qAD5DPeZP4ry+qT2Ir/csKbmOrfdByQdkopzq7WRjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nh6585jGth8Jd+7VKmXeMvWFSstv6JxwsTRdXuXKjV0D/sCE3YB3M7G2UzcLGIQJ2
	 BVE8Cb8x9B2Ym77LxbvZoGH5+Gkvgg0oCrD3JtZ7WNjw1S3vFAtJZpoW/6Y5eb2/KZ
	 MkG3jRcC0/LbGOsG7ricpY/wxV7P4Bna9Bq+7rgFSwf0Kn/qxFOKRPvRM6vfiyGZfa
	 qTq9bbj6sjr5Po1CYZZ4CmKjiKmr12XnZLUkqAsARVk8vzJsWGok5WZuWh8i0fy9d8
	 6jUEtrB38ySFw958jq4iSdFkoFVjdPnhHLSNd87dKVaVzkLxIqpWqa9db+liL0EdTL
	 QBnB7TJUs9s1w==
Date: Thu, 13 Mar 2025 16:05:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
Message-ID: <yff33h2dxrr6duel25kf6hqrgeiwhlk3uowyozk3dpfqawwo7t@f2g6dgzl3dfp>
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>

On Wed, Mar 12, 2025 at 02:19:27PM +0100, Stephan Gerhold wrote:
> When submitting the TLMM test driver, Bjorn reported that some of the test
> cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
> GPIOs that are handled directly in pinctrl-msm). Basically, lingering
> latched interrupt state is still being delivered at IRQ request time, e.g.:
> 
>   ok 1 tlmm_test_silent_rising
>   tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 2 tlmm_test_silent_falling
>   tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 3 tlmm_test_silent_low
>   ok 4 tlmm_test_silent_high
> 
> Whether to report interrupts that came in while the IRQ was unclaimed
> doesn't seem to be well-defined in the Linux IRQ API. However, looking
> closer at these specific cases, we're actually reporting events that do not
> match the interrupt type requested by the driver:
> 
>  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
>     configured for IRQF_TRIGGER_RISING.
> 
>  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
>         to high state. The rising interrupt gets latched.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
>         interrupt isn't cleared.
>     (c) The IRQ handler is called for the latched interrupt, but there
>         wasn't any falling edge.
> 
>  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
>         result in a phantom interrupt that gets latched.
>     (c) The IRQ handler is called for the latched interrupt, but the GPIO
>         isn't in low state.
> 
>  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
>     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
>         was cleared when masking the level-triggered interrupt.
> 
> Fix this by clearing the interrupt state whenever making any changes to the
> interrupt configuration. This includes previously disabled interrupts, but
> also any changes to interrupt polarity or detection type.
> 
> With this change, all 16 test cases are now passing for the non-wakeup
> GPIOs in the TLMM.
> 
> Cc: stable@vger.kernel.org
> Fixes: cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts when enabling")
> Reported-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/r/20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com/
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 47daa47153c970190b0d469dc8d245b3cbeace5e..82f0cc43bbf4f4d24f078af2d0a515d3a03b961a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1045,8 +1045,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	const struct msm_pingroup *g;
>  	u32 intr_target_mask = GENMASK(2, 0);
>  	unsigned long flags;
> -	bool was_enabled;
> -	u32 val;
> +	u32 val, oldval;
>  
>  	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
>  		set_bit(d->hwirq, pctrl->dual_edge_irqs);
> @@ -1108,8 +1107,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	 * internal circuitry of TLMM, toggling the RAW_STATUS
>  	 * could cause the INTR_STATUS to be set for EDGE interrupts.
>  	 */
> -	val = msm_readl_intr_cfg(pctrl, g);
> -	was_enabled = val & BIT(g->intr_raw_status_bit);
> +	val = oldval = msm_readl_intr_cfg(pctrl, g);
>  	val |= BIT(g->intr_raw_status_bit);
>  	if (g->intr_detection_width == 2) {
>  		val &= ~(3 << g->intr_detection_bit);
> @@ -1162,9 +1160,11 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	/*
>  	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
>  	 * Clear the interrupt.  This is safe because we have
> -	 * IRQCHIP_SET_TYPE_MASKED.
> +	 * IRQCHIP_SET_TYPE_MASKED. When changing the interrupt type, we could
> +	 * also still have a non-matching interrupt latched, so clear whenever
> +	 * making changes to the interrupt configuration.
>  	 */
> -	if (!was_enabled)
> +	if (val != oldval)
>  		msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> 
> ---
> base-commit: e058c5f49ceff38bf1579a679a5ca20842718579
> change-id: 20250311-pinctrl-msm-type-latch-6099aede7d92
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

