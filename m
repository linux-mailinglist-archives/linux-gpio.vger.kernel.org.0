Return-Path: <linux-gpio+bounces-11671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED49A4E26
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12A82B225CD
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9292AD12;
	Sat, 19 Oct 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXyudrIV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8DDF44
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729344025; cv=none; b=ql8uDsqRVTl020G+ZpP1N7qPf0X6eupyJY1HNy/hOK4BWNHspkbBZ/fEHvUO3hzRpw/QlpKia2rkH8edvK5hVdZg0dRs5hwpDQuOruRkBgOmuD48QYuGfaPt/4uYLqp2MmzXRGO++Xzw81Qz7Eosollq3PnobsUOSga3p2qZWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729344025; c=relaxed/simple;
	bh=8rm4ZeIbPgbNYXkqov8UUlGm7z4mHkaAs50PDrckST0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqGA0+yiXMgQJrADUDTx06px3XY0qlUjxBk7Tfui29O7q5K9Gn6Un964LYjZoBEAlFNxttfwyhqNU40tAEpE2GGLQomrDqeKmpXr16vWCA8VBOuXymGIkd79Zw4oiP9JPus1QbgrW9q/XZl2z5MChMKFdpvUyGiA2c3YqlGec/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXyudrIV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so43471871fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729344021; x=1729948821; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJq3e6SEnuwEws2RPKu3t7mY9g3i4I3ApacQ1ZwzcMo=;
        b=DXyudrIVMRcPpe+NFaDXQ61hDKtTayoOXjQgcrktS7OK6drkIAvPVcf5wvf9BSbNrf
         W6hssX1yMFH2Kgxnw95bHFzVgiW9WZuoQo6H6OJUNZXRTpg5ZpHZANtcAPLVtZAenRfl
         iDKel92Fl2BJVaIDnUTHUNpZTQT7epjg2Bi3y5L+rr6Gt57+/lWkysxW2zxkrQoiH356
         DRiQQ1zlLpR1vNhIgYHvycD+ItfH84caUrTFUli/HnQ3LEe0RNgmWJX1vAuZvuGygbf2
         2P15npFg1ZWkhxqlMjdhi7pd7QgI+VbcKbfkkfanQBh5ho9EMK9edFLmoYWKp6kddVHA
         0IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729344021; x=1729948821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJq3e6SEnuwEws2RPKu3t7mY9g3i4I3ApacQ1ZwzcMo=;
        b=LN1Dw9/3Y4IUBC6D+OaC7Gv9LxWZ2p91vVXavviuiQONryi/H0soJlqmXEuK2XHSJI
         kr2ENCzwArs55McZDeVacg+h9gTNYnfWbO5/6m4c5KuduTGWFuyPpp0Gy5usfoEoBSfz
         sbTCJnIcFaRr7VvCVUBiN97/4S+2VXfUVDegJtrTS9EgiQkfvsug8WahE4SWmf7Hc68P
         GJe1yUe1ANphpSEbGaScDuG8DmsIK6CrHARMWzCoEh30zlXXy7z7kki7dG9yS54dw2QK
         8JQBGqdj5nGNUTmQpLf1g8W6lYWGpHx4FL9SjBDIJiTCbLUD9/QWWnOyCCk3hHeCHMiJ
         NKDg==
X-Forwarded-Encrypted: i=1; AJvYcCVXCPMR7pbEkRZL1YZ0myuON6HHF0QsvznuQjBIqbI4gslv2+9LKVTvz2JDbDla/YkeweCd4lUiRnN2@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5VMJd+2Nawcu5ek9wLQGFnzQ4GN3TQEh2onEGhsHZX4E3/vE
	/m7MAfKAns8MpDSllcoy4jFZP0L6A2RMx7WkFpe7KN2qKU5dtKJV/AWkm3Z+AYs=
X-Google-Smtp-Source: AGHT+IHRmKbzGGO7zEz9E8HtiiVQyP+3SNa2w9u82oD2SVqaE1yRmHTI0gyDCHmKG3J8y1ZHoPFzIw==
X-Received: by 2002:a05:651c:1502:b0:2fb:3960:9667 with SMTP id 38308e7fff4ca-2fb83b44fd7mr38402211fa.14.1729344020749;
        Sat, 19 Oct 2024 06:20:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809f995fsm5062171fa.85.2024.10.19.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 06:20:19 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH RFC 07/14] pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
Message-ID: <xznkzggkyygdcoezs3vv5zearurh6hlto4554ijakch375solh@kc2jiiynzbfk>
References: <20241019-msm8917-v1-0-f1f3ca1d88e5@mainlining.org>
 <20241019-msm8917-v1-7-f1f3ca1d88e5@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019-msm8917-v1-7-f1f3ca1d88e5@mainlining.org>

On Sat, Oct 19, 2024 at 01:50:44PM +0200, Barnab�s Cz�m�n wrote:
> From: Otto Pfl�ger <otto.pflueger@abscue.de>
> 
> It is based on MSM8916 driver with the pinctrl definitions from
> Qualcomm's downstream MSM8917 driver.
> 
> Signed-off-by: Otto Pfl�ger <otto.pflueger@abscue.de>
> Signed-off-by: Barnab�s Cz�m�n <barnabas.czeman@mainlining.org>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    6 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8917.c | 1622 ++++++++++++++++++++++++++++++++
>  3 files changed, 1629 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index c79f0c3c873da56e8c0e1de9f91bce4b552221d2..f53043ea213012447aaaf07e9f339a16493a1b95 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -137,6 +137,12 @@ config PINCTRL_MSM8916
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
>  
> +config PINCTRL_MSM8917
> +	tristate "Qualcomm 8917 pin controller driver"
> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm TLMM block found on the Qualcomm 8917 platform.
> +

MSM8917, not just 8917.

[...]

> +	msm_mux_wcss_wlan2,
> +	msm_mux_webcam_rst,
> +	msm_mux_webcam_standby,
> +	msm_mux_wsa_io,
> +	msm_mux_wsa_irq,
> +	msm_mux_NA,

s/NA/_/ through the file, see recent tlmm drivers. This generally
improves readability.

> +};
> +

[...]

> +
> +static const struct msm_pingroup msm8917_groups[] = {
> +	PINGROUP(0, blsp_spi1, blsp_uart1, qdss_tracedata_b, NA, NA, NA, NA,
> +		 NA, NA),

And here too. Compare the string above with 

	PINGROUP(0, blsp_spi1, blsp_uart1, qdss_tracedata_b, _, _, _, _, _, _),

> +};
> +
> +#define NUM_GPIO_PINGROUPS	134

inline

> +
> +static const struct msm_pinctrl_soc_data msm8917_pinctrl = {
> +	.pins = msm8917_pins,
> +	.npins = ARRAY_SIZE(msm8917_pins),
> +	.functions = msm8917_functions,
> +	.nfunctions = ARRAY_SIZE(msm8917_functions),
> +	.groups = msm8917_groups,
> +	.ngroups = ARRAY_SIZE(msm8917_groups),
> +	.ngpios = NUM_GPIO_PINGROUPS,
> +};
> +
> +static int msm8917_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &msm8917_pinctrl);
> +}
> +
> +static const struct of_device_id msm8917_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,msm8917-pinctrl", },
> +	{ },
> +};
> +
> +static struct platform_driver msm8917_pinctrl_driver = {
> +	.driver = {
> +		.name = "msm8917-pinctrl",
> +		.of_match_table = msm8917_pinctrl_of_match,
> +	},
> +	.probe = msm8917_pinctrl_probe,
> +	.remove_new = msm_pinctrl_remove,

Just .remove

> +};
> +
> +static int __init msm8917_pinctrl_init(void)
> +{
> +	return platform_driver_register(&msm8917_pinctrl_driver);
> +}
> +arch_initcall(msm8917_pinctrl_init);
> +
> +static void __exit msm8917_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&msm8917_pinctrl_driver);
> +}
> +module_exit(msm8917_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm msm8917 pinctrl driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, msm8917_pinctrl_of_match);

Please move this after the match table.

> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

