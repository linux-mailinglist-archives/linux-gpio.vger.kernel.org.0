Return-Path: <linux-gpio+bounces-37536-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HzpXA8iQFWpAWgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37536-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:23:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 738895D578C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 14:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C19B302BCCA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9AC3F927B;
	Tue, 26 May 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZPR3riL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E63F5BD0
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798213; cv=none; b=qncuTZqOQxBr5JP9qSbllf66LqsGAf5gB9Oko1akqkUKLmri3KX2xxowTuZb7KFK6LGyEaR3K+SPntJ3Ir1H5RjzY3mGHcoTqxPuGfZ78DaKcigSrTTMASKMqZiKx3C6jPSuFcjGq80XO6VW87pnDuVgFnygXxrLW0GFu+8RP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798213; c=relaxed/simple;
	bh=iGDQmirXwsVXqAciJSjXGrEGgNfDX2hiOOLxRSpT0f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkeBi1Vg/nXuSxPCL1xAYtxC4NzzFAAda9PftOnDGSPLpQUAaqR0nqXIIqyq1Pvt1EyC9r6DMxaXeDRed1Nv7ulBnck7ceS1sapQRe8A7DbmSHfxr70gry85mDwbiKeDSBpx0ct+cA7yU9s+EQMH4584KakfApjUhZqt1IA0eJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZPR3riL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so49569995e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798210; x=1780403010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCIY9sU4f3NHfQKfeX8dod9XT1LJXx2xAP5zQxt3BVI=;
        b=eZPR3riL+W3qzANtKqmOvNbGUks1goO8ojCdqBbVgQKNnexrOZ/10JxbUBr9dsJTIH
         ogkU9zT9/Qdtl7BCSsNZHDrG0MNwJmwBd0ZKos+BrB9ZHzVQeay4g8PsBgdvaVX/vIQ3
         xCmGrIW7IEnFtik3bIZkE+g76i4XNlVkczMIxGcLKKskwvemjd97gyWwxwHLzW45GwEd
         TeVypgBZSz/SzDGxqCblGMAw1AZhkMq5Vf9NNFVxcvUdAN1PawnP8O06FksdHOS/H9rv
         K8+7QGcFfhE+sa3rUATMM6AolENy5WtTN9QpghsOgykaLuTP6uGxl8L0DJehJu3kqOke
         lzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798210; x=1780403010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCIY9sU4f3NHfQKfeX8dod9XT1LJXx2xAP5zQxt3BVI=;
        b=ip1fDY2s5J43ANr14i+x1Q8cS0LjOLTXJnJo7Fx32xfuxjqUfc1YHSAlic4P8FZl0r
         aHd7JUtmoCVeYexm2wSfeRhr6+HmUbXWqT8xtRrBltASH1v6fiFyjR+4kZpWYOs7rBw1
         4uInDCkI6S0lzt4D9/la8YMuHGG4eSqnIlBSptaN9RP/pmUdUnys2NXxG3OzPRDxKmkf
         WMzrCG2n7+j8b+ISFmz414vnuWDiFSeC+gplX5UE9g4GMAmLgLAmp+z/OaS7SgovGlxm
         qz14Q27HXwpi+96yu/c2UkFdVK3PqATDGtFLN4ug0kMpWYKXP8Z1j6Qt6jKcrca8giqx
         cpRg==
X-Forwarded-Encrypted: i=1; AFNElJ/gzQM/PnecVPl2DIBfPaG1n3SDaIPzqiBi7Yi5PkwBGoB5Y9R646PjMiOYfpbD79EvJNHT6npJoUgm@vger.kernel.org
X-Gm-Message-State: AOJu0YzITKEtGNm9ax9L5HRUEu1L36OYfbq1eDBttvWcUkLQoGozxdcq
	NXbdujCmjJ7wayJaMr8WrR34UoSb+ukBYxxO+GqQRxD0W6IVokDmHtmEqG2rqHSBiqE=
X-Gm-Gg: Acq92OGiCste1LQox/nc0WwX/0+6tnJkAURHuSoITuKUNSpjBJ0lsVcwuDm84oOmEEj
	8OdTq4l7iq37bA8/uPWtlffqEfHo2P+sXfKctDHKh52Wi0VE4UbfXAC4y+hmLpBrBElQWOMUwcI
	vCmk/v7N2FkesJuyd7EoWVY8rDbC8TVpTjUjHKH6M7lXcsW5PDT7Ctmth8p89XOr3qj3MVmOTs8
	J0u36dxNZOE/gnaIV4AI7zvX0N6ozoUfCScrsk4YA7bsGdte8utdwj1WTzJeDHNxk54hNNij8OF
	0scFe6z1D4sJr0I7KY/Gvh4XQzeS8s9t9BF73hhaPBqBuGOEfvgXYQzmRp5nXkTA5Maqpe4Mcrb
	U9a1BA1Y27H16EIgnSli31fiIHlKA8RmUzCmrS7436mHxhdnTwQ+XLJ+dgKAc9cEkmEShi2bHNy
	6wKvwgcuIfNRMrX7jwbC7C+HOHa+GiLKknrcSsFiY=
X-Received: by 2002:a05:600c:4510:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-490428ddc9fmr289822275e9.32.1779798210262;
        Tue, 26 May 2026 05:23:30 -0700 (PDT)
Received: from linaro.org ([77.64.147.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm33487487f8f.17.2026.05.26.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:23:29 -0700 (PDT)
Date: Tue, 26 May 2026 14:22:49 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Message-ID: <ahWQmTr-9a33b9FY@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37536-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 738895D578C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:24:41PM +0530, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 109 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 86379dddc5be..69ddd7d89a83 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> [...]
> @@ -135,6 +151,8 @@ static const struct pdc_regs pdc_v3_2 = {
>  };
>  
>  static const struct pdc_cfg pdc_cfg_v3_2 = {
> +	.gpio_irq_sts = GENMASK(5, 5),
> +	.gpio_irq_mask = GENMASK(4, 4),

BIT(5) / BIT(4) would be clearer here in my opinion.

>  	.irq_enable = GENMASK(3, 3),
>  	.irq_type = GENMASK(2, 0),
>  };
> [...]
> @@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
>  	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
>  }
>  
> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> +{
> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
> +		return true;
> +
> +	return false;

Can put this in one line:

	return pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis;

> +}
> +
>  static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
>  {
>  	void __iomem *base;
> @@ -232,6 +260,36 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
>  		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
>  
>  	raw_spin_unlock_irqrestore(&pdc->lock, flags);
> +
> +	if (pdc_pin_uses_seconary_mode(pin_out))
> +		pdc->unmask_gpio(pin_out, on);
> +}
> +
> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);

Is this guaranteed to be called sequentially, i.e. not in parallel on
another CPU? Otherwise, you need to add the lock here to make sure the
read-modify-write doesn't race with another CPU.

Note that since the irq_cfg_reg is also used in qcom_pdc_gic_set_type()
it would be safest to add the lock there as well (although since PDC has
IRQCHIP_SET_TYPE_MASKED it's probably unlikely to be called in parallel
with another irqchip operation for the same IRQ). In my patch, I handled
this for all users using a new pdc_update_irq_cfg() function [1].

[1]: https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14

> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_mask = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	if (unmask)
> +		gpio_mask &= ~pdc->cfg->gpio_irq_mask;
> +	else
> +		gpio_mask |= pdc->cfg->gpio_irq_mask;
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
>  }
>  
>  static void pdc_enable_intr_cfg(int pin_out, bool on)
> [...]
> @@ -258,6 +319,20 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
>  	irq_chip_enable_parent(d);
>  }
>  
> +static void qcom_pdc_ack(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +}

You might need a write memory barrier here and/or read-back here to make
sure the write is complete before the interrupt is unmasked in the GIC.
IIRC I added this in my patch after seeing some test tlmm-test failure..

> +
> +static void qcom_pdc_gic_eoi(struct irq_data *d)
> +{
> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && irqd_is_level_type(d))
> +		pdc->clear_gpio(d->hwirq);
> +
> +	irq_chip_eoi_parent(d);
> +}
> +
>  /*
>   * GIC does not handle falling edge or active low. To allow falling edge and
>   * active low interrupts to be handled at GIC, PDC has an inverter that inverts
> [...]
> @@ -510,6 +600,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		pdc->enable_intr = pdc_enable_intr_bank;
>  	}
>  
> +	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
> +	pdc->clear_gpio = pdc_clear_gpio_cfg;

What is the purpose of these function pointers if you always assign the
same function?

Thanks,
Stephan

