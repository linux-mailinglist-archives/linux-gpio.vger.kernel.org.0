Return-Path: <linux-gpio+bounces-32618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOryMJUjqmkOMAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 01:45:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F5219EF1
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 01:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AA843029C2B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 00:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05A8126BF7;
	Fri,  6 Mar 2026 00:45:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75C2E11A6
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757903; cv=none; b=Wu3VpgxHV3HHhqXCiQ/rLqwWU3+vDvDd3VcdASyhXv8oUx56BVRQhoA8ddwLAWaWQ8sXJ4PWjsqPdltp/QnwqpYPRJtwYTEKp4egH0drmknpZxxMMFKtcjfLyXxn8dmwKMCdK7oEy2hXDgkYi9qLu7Sek7iTlcQStMXmHAYXNsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757903; c=relaxed/simple;
	bh=G9zzbkUUMAkORAuT7yKEFCmmFIF56otd76cutMRNMYQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mJCjUBlVOaDEwRDAGd61kMkj1mbFVusvhS/GxLw1vn8f3Jm1qOmEIMonQdXlgXCKbBiO+a9NE9gGt5QgNXsEdGj31+eOI5ngh9EutSFIJPkzOZ7rTrPI4S2QUlIRuRhe4gtDRucII0qqHSWu3Mt5tDZp5p3kTMJW9x5CgnlkTVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae8177446fso1473035ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 16:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757900; x=1773362700;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBIID2C3tYCLC3ROIp9HZ27Vwpuc9s7YKBLnBBIirXY=;
        b=skxa2tRxbH2gfNoDt/whpEv8oWxnNk6y9jnIPb1nb9LhLy1f5hzsDxmy2SqBoZ0QXM
         0AHe1MMm+iDQvdZ4o+89phxcAWkX4qGyI2++L8DI+Ds7UZNIEs7Z9W7PFa3ma0Jdvv5e
         nNOul3ysjSwrz0typP73a5Pr4/smbrGFn2j4vI35s22Ds3gK0LRCEmEqprg+gALhJYNu
         Qfx0kHap+SLemwCJugB7MPaOa6Z+vdY1eZk7qnjucwEMyYVzE5zDZkN2Bx05bQ5T8vSG
         5V+dzSt1SN/AduZP1Q/RuYD9GYTQL691+zxsPadpmTWJyPaP2dbz1Vrm4tVQJQp+V0XZ
         limw==
X-Gm-Message-State: AOJu0Yz+6PVQbjfZLUrg904TlO5Sd5/Jqvq02hhekgYehOi34PInZpHo
	5oqBOPJl9/sPqGKJ2knTRkAWEw83NDYBW4hemMyNFx/CDZXW5KCj6CdJf6R1HDo3p4A=
X-Gm-Gg: ATEYQzzJri+eRqnezSDbQ+Oazcy4vuy8kRVMmwL2XrkV84zoWUV1InytmCBKIwJcG9f
	dqwVeRfR1pRR8UenJBdUHsY/TjYSnnEivT99FVxP7evopeHkOgX6P0Voaw69QKnm5cnKVsuKli3
	GGVYedBYWkKsYH5qDbFwgN6S9RBr4vvGyxSd23DeoYjECBDfRcKo+8XzPcwJW3cQfva7eEaAk9v
	4V65olTSSMcJCQnU8d0FDSuiGNXqIf78gnAVe6aU6Iw9R3Svx6SE+Yo4c/1E9qWoH5S3wPwj9k5
	XvPBEnFQe6SWlKevplVl/Bh5YEPkKijRpB7VUslokDhTMdbj3APa31cF+JYaXPpAPRAo6lcCzDD
	WxNN8FHon73fRwbD8SIEtuU6hJ503yVydP+gOScNdJoqWmL4v19/ZGBteELmQe1ndWtk/XS8nKs
	gZYTi+RQy/jtAv6oitup8l
X-Received: by 2002:a17:903:18d:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2ae8241df4emr3858265ad.12.1772757900350;
        Thu, 05 Mar 2026 16:45:00 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4651e409sm180143885ad.44.2026.03.05.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:44:59 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Frank Rowand
 <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
In-Reply-To: <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
 <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:44:59 -0800
Message-ID: <7hy0k5okfo.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 419F5219EF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32618-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[khilman@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Action: no action

Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> writes:

> Setup a software node hierarchy for the latch2 GPIO controller defining
> the required hog and stop using legacy machine hog API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 16392720296cd224732450c85419c35bbab506f6..1bec4fa0bd5e8bfc58103d1f24b22176707fd26f 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -556,10 +556,30 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
>  	&ams_delta_nand_gpio_table,
>  };
>  
> -static struct gpiod_hog ams_delta_gpio_hogs[] = {
> -	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
> -		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
> -	{},
> +static const struct software_node latch2_gpio_swnode = {
> +	.name = LATCH2_LABEL,
> +};
> +
> +static const u32 latch2_hog_gpios[] = { LATCH2_PIN_KEYBRD_DATAOUT, 0 };
> +
> +static const struct property_entry latch2_gpio_hog_props[] = {
> +	PROPERTY_ENTRY_BOOL("gpio-hog"),
> +	PROPERTY_ENTRY_U32_ARRAY("gpios", latch2_hog_gpios),
> +	PROPERTY_ENTRY_STRING("line-name", "keybrd_dataout"),
> +	PROPERTY_ENTRY_BOOL("output-low"),
> +	{ }
> +};
> +
> +static const struct software_node latch2_gpio_hog_swnode = {
> +	.parent = &latch2_gpio_swnode,
> +	.name = "latch2-hog",
> +	.properties = latch2_gpio_hog_props,
> +};
> +
> +static const struct software_node *const latch2_gpio_swnodes[] = {
> +	&latch2_gpio_swnode,
> +	&latch2_gpio_hog_swnode,
> +	NULL
>  };
>  
>  static struct plat_serial8250_port ams_delta_modem_ports[];
> @@ -684,7 +704,6 @@ static void __init ams_delta_init(void)
>  
>  	omap_gpio_deps_init();
>  	ams_delta_latch2_init();
> -	gpiod_add_hogs(ams_delta_gpio_hogs);
>  
>  	omap_serial_init();
>  	omap_register_i2c_bus(1, 100, NULL, 0);
> @@ -693,6 +712,9 @@ static void __init ams_delta_init(void)
>  	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
>  
>  	platform_device_register_full(&latch1_gpio_devinfo);
> +
> +	software_node_register_node_group(latch2_gpio_swnodes);
> +	latch2_gpio_devinfo.fwnode = software_node_fwnode(&latch2_gpio_swnode);
>  	platform_device_register_full(&latch2_gpio_devinfo);
>  
>  	/*
>
> -- 
> 2.47.3

