Return-Path: <linux-gpio+bounces-25030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC26B3843A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 15:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91C2E365590
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7EE3570A9;
	Wed, 27 Aug 2025 13:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FRU2aUbN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC6356902
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303141; cv=none; b=sjMtVAmTyL3mO+LToPk2/xyGpe9fXRMSvxmCLfex9+nkMf8PHPzMdGGDPmQYYdcG7ydjokHbp0YIHfbqQT7rjd1yd5WgbS9jajg/qDGvfLkRQ6yGfNjsW8wDpcHVNVvu8Vcu5jJpkw61iRufmXYkh7CL8sJyhYW1/pvRpDpcNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303141; c=relaxed/simple;
	bh=qxcTYmKJHv4ByCyIFFgFbatmeR6cwgdb5Z68rlcGFxc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqc30XSur/iMfLZUfAz65y8RLf7xOU9AU/qEAsJZyHOOJHyITdRF/UNp98uI3qDyIQkdG/BVFCdCSjPBUBFeyHTW2eyEoOgRcvETM7AxySTPbQ6ro5bAFvdD9ok3EPtSu/NuIXildP5JC/im6prT2S9/QJ+kgrlDQeHTZG4go6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FRU2aUbN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61c4f73cf20so7712410a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756303137; x=1756907937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CWSteu4ueuV0aIApfiAJbNQgjn5Egg3v9K0wNLPvCE=;
        b=FRU2aUbNAUF9jCdDsGbFP2xk6aemEDWaz4mN7cgG/eA88msOFwOomMxaRI+dmB4HoV
         p8pDi/ufcDMtUqPxlDYmI9aYe4JEIdT1r+Mj4f8NWdyCCReQenODwOGrawEckQTxfVde
         vkuyFUvnJWEwqBGFxpWhV/DliFZEWWt3eWxAuiIpqFA9z2RdSXaSGrB8A4m/8DPtVv3h
         RFSI5lDvSwWXp7uoSoIBTB0347cm/ZUDWR507UG0LyVEmb87WZkaCsTL+6R28yUdh3yS
         s3qxmD3x+LrkCiDNQdgF7LYL+SeeWhMi7e49Bw2EMTRXH90fO3vclhngr93ybTwl7W3r
         R7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303137; x=1756907937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CWSteu4ueuV0aIApfiAJbNQgjn5Egg3v9K0wNLPvCE=;
        b=gc0hwaOmLFCS/kLQVSW1caTW9GMx2RzVdDZslfQ+v783SKjAbatQdshLzjJGCKDFgD
         qkVfvPInk+xKgZMipmAYtiGWLsrcqqPm8a6wACo9az3X1qJfdM2Z8qFCpFhoJgPXqAx4
         s5uQ/Y9IsiyT0dbvlGy5itpoPjtmfXw0Mqj3FTJgSGJ7kx0AKHwzUhU/40cfESbVCoGZ
         QDaX6xtTA0WfAROUJ3Dln3hnrDOMqYY7itHpnixnuBD9+usCe1uWZNzJ/cbWRT7SmbS4
         rbHPEpgvjGfA6Smq1u2W/Pq5i2tdAjMcvWk3gnAJyoI9/7r1RIqP4rHHA/FN2M3CgK3Q
         jRqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdPdG6XVy2bSoT9EquHAXAULOOc8ey8ISxE7dukn7pqcD7Wu6RydAena8KBczuIRsf/DJQMSIWjvLV@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZDfUPD0mVkSN3Cz5DOEOFJRvUvOokSvixNQqZoUoxH8zfPQP
	69+0YbQnxzF3jJvfmpnVmSY2mkzSH0o1NtDMF14+S/g9qdkIBl0l45PqypF4EkpYFbw=
X-Gm-Gg: ASbGnctlYYbzAw0XGth3gdrLYlGvdXFboLzOglJ/62lzZUjlwI3S+KPaPhwJy+bIpII
	GsY1MFHY6b03ZNZB6UthvaMOdRHy4qUrxbhG5M7WzsB/SSeJ5Xd8J7lubP0FSKxWmK4l6unYwWh
	49UCzwXPLH3EIaR+Z0XYLnZuOHjv8Ix5oH0XqR5n/6mMvGHg6CZXW/PYrO1oIToLL18yO9oMB44
	BQW5nvbVwHi4IvAxMnGDSULPR1RCQe1gRV1tQ2SKYpa4tGWvI84rVDezRrTfTKqfP++q9FtCjAU
	dx6aoZbbsTxj+UeLfN2aHRa4FCJjLgnuQkurxc8xce2j952sR2GvwVcvPGESbQeGsH/baoHacYl
	3cqtaRTpK1vGUAikoK4ghF7sJ1HnfU2OaYkKU4QWXmEo7P6HhEamjMGEWr2sthsLAQg1X5aFrzf
	KkZFd9Lt7SRqnZSg+P
X-Google-Smtp-Source: AGHT+IGGtd6YYOMCijKCql/Dy2HeWOPmF4F9YoTLQ2VQc4J0uyvBHN+XraLb2sKAIVxVgCjlHyK+TQ==
X-Received: by 2002:a05:6402:4312:b0:61c:7a9b:21d4 with SMTP id 4fb4d7f45d1cf-61c7aaa67e8mr6702103a12.18.1756303137280;
        Wed, 27 Aug 2025 06:58:57 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61caae5fc3fsm2016468a12.51.2025.08.27.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:58:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 27 Aug 2025 16:00:50 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aK8PkgiU0yRO-c6f@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <83d0f449-be3a-44ca-9722-d747969d96c9@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d0f449-be3a-44ca-9722-d747969d96c9@gmx.net>

Hi Stefan,

On 11:57 Sun 24 Aug     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.

[...]

> > +#define AGPIO_PIN(n)		PINCTRL_PIN(n, "aon_gpio" #n)
> > +#define SGPIO_PIN(n)		PINCTRL_PIN((n) + 32, "aon_sgpio" #n)
> It would be great, if there is comment explaining the difference between a
> AGPIO_PIN and a SGPIO_PIN?
> 
> In case AGPIO_PIN stands for AON_GPIO_PIN, i would prefer the latter.

I need to dig more on the SGPIO type, more on that as soon as I'll
find some more details. No problem in using more explanatory label,
of_course.

> > +
> > +struct pin_regs {
> > +	u16 mux_bit;
> > +	u16 pad_bit;
> > +};
> > +

[...]

> > +enum brcmstb_funcs {
> > +	func_gpio,
> > +	func_alt1,
> > +	func_alt2,
> > +	func_alt3,
> > +	func_alt4,
> > +	func_alt5,
> > +	func_alt6,
> > +	func_alt7,
> > +	func_alt8,
> > +	func_aon_cpu_standbyb,
> > +	func_aon_fp_4sec_resetb,
> > +	func_aon_gpclk,
> > +	func_aon_pwm,
> > +	func_arm_jtag,
> > +	func_aud_fs_clk0,
> > +	func_avs_pmu_bsc,
> > +	func_bsc_m0,
> > +	func_bsc_m1,
> > +	func_bsc_m2,
> > +	func_bsc_m3,
> > +	func_clk_observe,
> > +	func_ctl_hdmi_5v,
> > +	func_enet0,
> > +	func_enet0_mii,
> > +	func_enet0_rgmii,
> > +	func_ext_sc_clk,
> > +	func_fl0,
> > +	func_fl1,
> > +	func_gpclk0,
> > +	func_gpclk1,
> > +	func_gpclk2,
> > +	func_hdmi_tx0_auto_i2c,
> > +	func_hdmi_tx0_bsc,
> > +	func_hdmi_tx1_auto_i2c,
> > +	func_hdmi_tx1_bsc,
> > +	func_i2s_in,
> > +	func_i2s_out,
> > +	func_ir_in,
> > +	func_mtsif,
> > +	func_mtsif_alt,
> > +	func_mtsif_alt1,
> > +	func_pdm,
> > +	func_pkt,
> > +	func_pm_led_out,
> > +	func_sc0,
> > +	func_sd0,
> > +	func_sd2,
> > +	func_sd_card_a,
> > +	func_sd_card_b,
> > +	func_sd_card_c,
> > +	func_sd_card_d,
> > +	func_sd_card_e,
> > +	func_sd_card_f,
> > +	func_sd_card_g,
> > +	func_spdif_out,
> > +	func_spi_m,
> > +	func_spi_s,
> > +	func_sr_edm_sense,
> > +	func_te0,
> > +	func_te1,
> > +	func_tsio,
> > +	func_uart0,
> > +	func_uart1,
> > +	func_uart2,
> > +	func_usb_pwr,
> > +	func_usb_vbus,
> > +	func_uui,
> > +	func_vc_i2c0,
> > +	func_vc_i2c3,
> > +	func_vc_i2c4,
> > +	func_vc_i2c5,
> > +	func_vc_i2csl,
> > +	func_vc_pcm,
> > +	func_vc_pwm0,
> > +	func_vc_pwm1,
> > +	func_vc_spi0,
> > +	func_vc_spi3,
> > +	func_vc_spi4,
> > +	func_vc_spi5,
> > +	func_vc_uart0,
> > +	func_vc_uart2,
> > +	func_vc_uart3,
> > +	func_vc_uart4,
> > +	func__,
> > +	func_count = func__
> > +};
> I'm very sceptical that this enum is generic. I would tend use to
> bcm2712_funcs here.

Ack.

> > +
> > +static const struct pin_regs bcm2712_c0_gpio_pin_regs[] = {
> > +	GPIO_REGS(0, 0, 0, 7, 7),
> > +	GPIO_REGS(1, 0, 1, 7, 8),
> > +	GPIO_REGS(2, 0, 2, 7, 9),

[...]

> > +static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
> > +	PIN(0, ir_in, vc_spi0, vc_uart3, vc_i2c3, te0, vc_i2c0, _, _),
> > +	PIN(1, vc_pwm0, vc_spi0, vc_uart3, vc_i2c3, te1, aon_pwm, vc_i2c0, vc_pwm1),
> > +	PIN(2, vc_pwm0, vc_spi0, vc_uart3, ctl_hdmi_5v, fl0, aon_pwm, ir_in, vc_pwm1),
> > +	PIN(3, ir_in, vc_spi0, vc_uart3, aon_fp_4sec_resetb, fl1, sd_card_g, aon_gpclk, _),
> > +	PIN(4, gpclk0, vc_spi0, vc_i2csl, aon_gpclk, pm_led_out, aon_pwm, sd_card_g, vc_pwm0),
> > +	PIN(5, gpclk1, ir_in, vc_i2csl, clk_observe, aon_pwm, sd_card_g, vc_pwm0, _),
> > +	PIN(6, uart1, vc_uart4, gpclk2, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
> > +	PIN(7, uart1, vc_uart4, gpclk0, aon_pwm, vc_uart0, vc_spi3, _, _),
> > +	PIN(8, uart1, vc_uart4, vc_i2csl, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
> > +	PIN(9, uart1, vc_uart4, vc_i2csl, aon_pwm, vc_uart0, vc_spi3, _, _),
> > +	PIN(10, tsio, ctl_hdmi_5v, sc0, spdif_out, vc_spi5, usb_pwr, aon_gpclk, sd_card_f),
> > +	PIN(11, tsio, uart0, sc0, aud_fs_clk0, vc_spi5, usb_vbus, vc_uart2, sd_card_f),
> > +	PIN(12, tsio, uart0, vc_uart0, tsio, vc_spi5, usb_pwr, vc_uart2, sd_card_f),
> > +	PIN(13, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
> > +	PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
> > +	PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk,
> > +	    _),
> > +	PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0,
> > +	    _),
> I think it's okay to violate the 80 char limit in these both cases to
> improve readability.

Ack.

> > +};
> > +
> ...
> > +
> > +static int brcmstb_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
> > +			       unsigned long *config)
> > +{
> > +	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
> > +	enum pin_config_param param = pinconf_to_config_param(*config);
> > +	u32 arg;
> > +
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_NONE);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_DOWN);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_UP);
> I'm not sure this is correct. I would expect that "arg" contains the
> resistance in Ohm for PULL_DOWN & PULL_UP.

In this case I don't have insight about the current impedance value. Since
this is easily something that changes between different implementations, I
would leave it as it is as it's more general, i.e. 0 for disabled and 1 for
pull up/down enabled (which seems to be the most common behaviour for pinconf
drivers anyway).

Once we know more details about the Ohm values or a new STB implementation
arises, we can quickly add the relevant data in the specific driver code.

Many thanks,
Andrea

> 
> Best regards

