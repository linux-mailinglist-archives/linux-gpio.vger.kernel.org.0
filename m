Return-Path: <linux-gpio+bounces-37805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hd5ECqjHmq3IwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:32:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8A62B9F1
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF893023322
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B0C3C9EC2;
	Tue,  2 Jun 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OW4YPKL9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FoNRhVep"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6335E948
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392410; cv=pass; b=e2ctIPEJDiT+N2EvUASitiQbIjycKSgTbm3Rgxp0kY2LUBhPlTTea8SqSyr2OIuJMzYs+hxg64bpp0yRq5suAoRqGGc0e4Mp6YR3gjA730TvSSwV0epR53YcVsmr76LgRalc2taVQI41H4+Pzp5XRHsfmxZIr34LLUQbXRKR4v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392410; c=relaxed/simple;
	bh=FqZftyIqaoXNMxs3pD4o5mVj6JJ3H742c7mcfeUsUQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ts/wS4FK00wjw0R+/hPmhEDurihkWt3RFGSzQDuUO6EQTEwT29dmxf0UuDM8lcbGMcW+olGbmbnC/SHSHvBYl4RUcwIQhCRtXeBEm1q7YJIJzGbHq+QzuW9eHWeteYNk5xhZsh1OMW+WarHAy2cUisMPz0LmoCRrR4APpCWDfHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OW4YPKL9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FoNRhVep; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780392406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erM29B/q/4TY7LekE/elitCLlJ0U5rKe/FuPyMus6Fg=;
	b=OW4YPKL9Etkt2gWzZljJx8q88FV9oV5zmWfCgNxNlbu6N/nep7YWIcmZgGYmmuA7oLXiLW
	Q53Q8VtF5xtTVYvAmoF38QCuqepjGW8L1wH8vFw/0Pmmt8WgBJPrKx605ZTWoWkeoCR+dP
	BcZLETtdSuRPAm5I6mWzt7FIIYm/E9Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-mu02xUXtMlSsWinjxNlKhg-1; Tue, 02 Jun 2026 05:26:44 -0400
X-MC-Unique: mu02xUXtMlSsWinjxNlKhg-1
X-Mimecast-MFC-AGG-ID: mu02xUXtMlSsWinjxNlKhg_1780392403
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3967726c2feso1627081fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 02:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780392403; cv=none;
        d=google.com; s=arc-20240605;
        b=jdG9OGJ24qF7zZq9SYrYlpRvs5GtLIiGqq5Ns5x8YgZxx/5NujnR9X7DzE3RfYbAK7
         AeoyRcTllgnCMPLewWR0q2IR0tHNozEQNRPWzLfb+dOFUPbODKBFSeHpcfZqdSdc5PNR
         E3d2q7Pc4j3dUqVA/5BItEYHL37f/+vmiMQ1fXorrLypq54XVuQFnLv9QJXo8V0qeFr3
         rOLn60wYBeWgmm4ihOvv8kLO9SyjxcsOUj13Ktmxj8VU87Q5zEp4m+AGbVks0/1hYqRj
         8EklCVAG4XMR0BUjpMV7z7CrSAvGEBWCswEEp9h9uGgSfMNKgq14o6YZu9ycunRu4WGF
         at+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erM29B/q/4TY7LekE/elitCLlJ0U5rKe/FuPyMus6Fg=;
        fh=UkPt1XeiWq5+MYi4FunBANWdeWTo2XVjptb/zbKbpCg=;
        b=GrvauwOTpGz0gHgoO0VRmibzW67U6e/xaLkkdtSOPZcWTCZahGgbFxipwZu3LSC2Pj
         AmkSwDtyZcXurA9nytkWJEk2QU0b0nQjx53Q+qYRTEl11l2wo7wKQjAeDXzL0Wsp0O97
         YuelnWOdnmw9HUUk7SuhflA4d7Gb5nRVqH3NDt4KsYU43UU4I7XzH7yanAvI6RKgX0Gt
         f9Hoy8/J2b7RKk7ZVvE4jI9tetWvpZXQYI42RVSgq229cSsy6J3WucdVYknD/SQnOXSs
         9c0RCUPBeCpL1RlKX8WitcVrMMyVDKciwaf++KagLuw2Tih9qSkDVeY8K8qoNr7+MZDx
         RIKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780392403; x=1780997203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erM29B/q/4TY7LekE/elitCLlJ0U5rKe/FuPyMus6Fg=;
        b=FoNRhVepXS3bJouIrqwP+KUFcAf7hbSuT7EQLSyGfBBrl5Lq2poOizsIrCid93JIxE
         7I+q84ewJAVk7rhLI773TUMEIMRTzOThJvhg1PNTjNb/n9NZmTuX29tfsqENechCeE9h
         qTaKaAu2poaS/dKnqbTNV90VcbxzehMaYoEBDNYX0L/bajrqWZDHFyAjbxwtJc6rg1lT
         tCUfnqMFFY3nvHj1A9qSjIJDHDgmHSU1xGpCBX8nkQ/2T5j79N6Vu7H/qRu7q3mUDonJ
         Cm6VFUCI6DU8sjgyHbKuL9zVOa6PR7PV9Cg9PiiVOqTqB/zleEuNXUdvsErQX4aGglss
         36Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392403; x=1780997203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erM29B/q/4TY7LekE/elitCLlJ0U5rKe/FuPyMus6Fg=;
        b=Dc1Ta5H1Wbv8Wq3sAfsURNJKBfoTKWb3m1jvf0gFfXt672vyq9ZrRKw2UdZRUxmJ5T
         1w+YrnCyIxq3rWvxBQidfH4AOpsNWEqyPHT7n/cPaghCVoGSTmQkIn4iOVf1PtW7HgEe
         7FjXl2+0gwvSlgVQb812q07CScW4idjHvtafGeMPa2ngx5HlsToRDRLhJwdo0BAlwJnm
         wc84I4ey+qhawpV2qdAQwxEc2ytvtZcX9LzIeyFB7pGiGinnstOpdHR8Fbi1dcKzOpJj
         wxitSpwT4D4kGpNRKLAjdMdgbhvC0Pf9S+ihFzP5nvltG2zVWIXog3nppRZCkZVIFbvH
         3GrA==
X-Forwarded-Encrypted: i=1; AFNElJ9m3Rg7UqS0vcyEXfBU/aRKRmNB8aR3/5m37Wdt3LXUXh5dPsPHxWj2tgOIggFjm01e2bLtxJpXsGGW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fn95Wt/5/zFAJioIl/SlyLtQxkTQTOvy3azrE1k2CyyAW7rC
	aQZAsOzyBphhr8EervoXT/CfGfDCdOCQ8FXxnelV0ka6XQ2UvoXC8at/QaOuOX2wdTumbLIMxh9
	wKgYj3R7fqNd6RcjXE2cdZMVGqV9iTO50G/cmqwG4l1ruWvTzrMQkESx15952UWKKWGWMIkwaku
	ZcF7LtzZj5nl3vL31meTK70ONxkrVVgPD5R98g1g==
X-Gm-Gg: Acq92OGkWSWFmMBxguXI64fEKufOwmrTvY/5k2QQQYeD0YYsUz+fHjTuuVaOzDGIHR0
	TfukLZXjmGnpxXFv7zUec7zIkq2JeQXztiJHDlnKUSQuEt88D/jialbIQixrr/LcVDwJb3f22Ic
	WpZ4lM/LGeM6Nt5K3UK96CMj5fXpmr5VYQguwU0GQikSoMP8RLA5Xxic4ha47QFd/jtB+rC+4TP
	OdHEMRtVRkIdQ2q
X-Received: by 2002:a05:651c:546:b0:396:7222:d730 with SMTP id 38308e7fff4ca-3967222d8abmr17160661fa.6.1780392402431;
        Tue, 02 Jun 2026 02:26:42 -0700 (PDT)
X-Received: by 2002:a05:651c:546:b0:396:7222:d730 with SMTP id
 38308e7fff4ca-3967222d8abmr17160491fa.6.1780392401612; Tue, 02 Jun 2026
 02:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com> <20260602080132.3256239-6-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260602080132.3256239-6-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 2 Jun 2026 11:26:28 +0200
X-Gm-Features: AVHnY4Lf2PZgv3ScKJyTl4g9Ti_cdZcTHd7ECVSE1v2QlWX3JfB1RBx2u7TyJGw
Message-ID: <CALE0LRu1aJAY_-7imYFFPbEwWPpodArXbxtjE-ur3UQnVt5fHw@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8DF8A62B9F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37805-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eballetb@redhat.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cfg.name:url]
X-Rspamd-Action: no action

Hi Khristine,

Thank you for the patch. I got some checkpatch warnings, could you
take a look? And some minor comments below.

On Tue, Jun 2, 2026 at 10:02=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> GPIO data access and direction handling are implemented using the
> gpio-regmap library backed by a virtual regmap. The virtual regmap
> translates the gpio-regmap register model to the underlying SIUL2
> registers: MSCR for direction, PGPDI for input values and PGPDO for
> output values.
>
> The existing pinctrl GPIO callbacks are used for the request/free path:
> they switch the pad to GPIO mode on request and restore the previous
> MSCR configuration when the GPIO is released.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
> https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea.bar=
bulescu@oss.nxp.com/
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/Kconfig         |   1 +
>  drivers/pinctrl/nxp/pinctrl-s32.h   |  32 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 685 +++++++++++++++++++++++++---
>  drivers/pinctrl/nxp/pinctrl-s32g2.c |  46 +-
>  4 files changed, 686 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
> index abca7ef97003..59fc6adf5b0b 100644
> --- a/drivers/pinctrl/nxp/Kconfig
> +++ b/drivers/pinctrl/nxp/Kconfig
> @@ -5,6 +5,7 @@ config PINCTRL_S32CC
>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GENERIC_PINCONF
> +       select GPIO_REGMAP
>         select REGMAP_MMIO
>
>  config PINCTRL_S32G2
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinc=
trl-s32.h
> index 8715befd5f05..c2fc5eda7eb4 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32.h
> +++ b/drivers/pinctrl/nxp/pinctrl-s32.h
> @@ -2,7 +2,7 @@
>   *
>   * S32 pinmux core definitions
>   *
> - * Copyright 2016-2020, 2022 NXP
> + * Copyright 2016-2020, 2022, 2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   * Copyright (C) 2012 Linaro Ltd.
> @@ -34,11 +34,39 @@ struct s32_pin_range {
>         unsigned int end;
>  };
>
> +/**
> + * struct s32_gpio_range - contiguous GPIO pin range within a SIUL2 modu=
le
> + * @gpio_base: first GPIO line offset in the GPIO range
> + * @pin_base: first pinctrl pin number mapped by this GPIO range
> + * @gpio_num: number of consecutive GPIO pins in the range
> + */
> +struct s32_gpio_range {
> +       unsigned int gpio_base;
> +       unsigned int pin_base;
> +       unsigned int gpio_num;
> +};
> +
> +/**
> + * struct s32_gpio_pad_map - mapping between GPIO ranges and PGPD pads
> + * @gpio_start: first GPIO line offset in the range
> + * @gpio_end: last GPIO line offset in the range
> + * @pad: PGPD pad number serving the range
> + */
> +struct s32_gpio_pad_map {
> +       unsigned int gpio_start;
> +       unsigned int gpio_end;
> +       unsigned int pad;
> +};
> +
>  struct s32_pinctrl_soc_data {
>         const struct pinctrl_pin_desc *pins;
>         unsigned int npins;
>         const struct s32_pin_range *mem_pin_ranges;
>         unsigned int mem_regions;
> +       const struct s32_gpio_range *gpio_ranges;
> +       unsigned int num_gpio_ranges;
> +       const struct s32_gpio_pad_map *gpio_pad_maps;
> +       unsigned int num_gpio_pad_maps;
>  };
>
>  struct s32_pinctrl_soc_info {
> @@ -53,6 +81,8 @@ struct s32_pinctrl_soc_info {
>
>  #define S32_PINCTRL_PIN(pin)   PINCTRL_PIN(pin, #pin)
>  #define S32_PIN_RANGE(_start, _end) { .start =3D _start, .end =3D _end }
> +#define S32_GPIO_RANGE(gpio, pin, num) \
> +       { .gpio_base =3D gpio, .pin_base =3D pin, .gpio_num =3D num }
>
>  int s32_pinctrl_probe(struct platform_device *pdev,
>                       const struct s32_pinctrl_soc_data *soc_data);
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index 89a4eb2000ee..8843926345ec 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024 NXP
> + * Copyright 2017-2022,2024-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -39,6 +40,40 @@
>  #define S32_MSCR_ODE           BIT(20)
>  #define S32_MSCR_OBE           BIT(21)
>
> +#define S32_GPIO_OP_SHIFT      16
> +#define S32_GPIO_OP_MASK       GENMASK(19, 16)
> +
> +#define S32_GPIO_OP_DIR                0 /* MSCR direction */
> +#define S32_GPIO_OP_DAT                BIT(S32_GPIO_OP_SHIFT) /* PGPDI r=
ead */
> +#define S32_GPIO_OP_SET                BIT(S32_GPIO_OP_SHIFT + 1) /* PGP=
DO write */
> +
> +/*
> + * [15:12] =3D GPIO bank / gpio range index
> + * [11:0]  =3D real register offset or pin id
> + */
> +#define S32_GPIO_BANK_SHIFT    12
> +#define S32_GPIO_BANK_MASK    GENMASK(15, 12)
> +#define S32_GPIO_REG_MASK    GENMASK(11, 0)
> +
> +#define S32_GPIO_ENCODE(bank, off) \
> +       ((((bank) << S32_GPIO_BANK_SHIFT) & S32_GPIO_BANK_MASK) | \
> +               ((off) & S32_GPIO_REG_MASK))
> +
> +#define S32_GPIO_DECODE_BANK(reg) \
> +       (((reg) & S32_GPIO_BANK_MASK) >> S32_GPIO_BANK_SHIFT)
> +
> +#define S32_GPIO_DECODE_OFF(reg) \
> +       ((reg) & S32_GPIO_REG_MASK)
> +
> +/*
> + * PGPDOs are 16bit registers that come in big endian
> + * order if they are grouped in pairs of two.
> + *
> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
> + */
> +#define S32_PGPD(N)            (((N) ^ 1) * 2)
> +#define S32_PGPD_SIZE          16
> +
>  enum s32_write_type {
>         S32_PINCONF_UPDATE_ONLY,
>         S32_PINCONF_OVERWRITE,
> @@ -72,6 +107,18 @@ struct s32_pinctrl_mem_region {
>         char name[8];
>  };
>
> +/*
> + * struct s32_gpio_regmaps - GPIO register maps for a SIUL2 instance
> + * @pgpdo: regmap for Parallel GPIO Pad Data Out registers
> + * @pgpdi: regmap for Parallel GPIO Pad Data In registers
> + * @range: GPIO range info
> + */
> +struct s32_gpio_regmaps {
> +       struct regmap *pgpdo;
> +       struct regmap *pgpdi;
> +       const struct s32_gpio_range *range;
> +};
> +
>  /*
>   * struct gpio_pin_config - holds pin configuration for GPIO's
>   * @pin_id: Pin ID for this GPIO
> @@ -98,6 +145,12 @@ struct s32_pinctrl_context {
>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin
> + * @gpio_regmaps: PGPDO/PGPDI regmaps for each SIUL2 module
> + * @num_gpio_regmaps: number of GPIO regmap entries
> + * @gpio_regmap: regmap bridging gpio-regmap to SIUL2 registers
> + * @gpio_rgm: gpio-regmap instance registered for this controller
> + * @ngpio: total number of GPIO line offsets
> + * @gpio_names: GPIO line names array passed to gpio-regmap
>   * @gpio_configs: saved configurations for GPIO pins
>   * @gpio_configs_lock: lock for the `gpio_configs` list
>   * @saved_context: configuration saved over system sleep
> @@ -107,6 +160,12 @@ struct s32_pinctrl {
>         struct pinctrl_dev *pctl;
>         struct s32_pinctrl_mem_region *regions;
>         struct s32_pinctrl_soc_info *info;
> +       struct s32_gpio_regmaps *gpio_regmaps;
> +       unsigned int num_gpio_regmaps;
> +       struct regmap *gpio_regmap;
> +       struct gpio_regmap *gpio_rgm;
> +       unsigned int ngpio;
> +       const char *const *gpio_names;
>         struct list_head gpio_configs;
>         spinlock_t gpio_configs_lock;
>  #ifdef CONFIG_PM_SLEEP
> @@ -356,88 +415,84 @@ static int s32_pmx_get_funcs_count(struct pinctrl_d=
ev *pctldev)
>         return info->nfunctions;
>  }
>
> -static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
> -                                        unsigned int selector)
> -{
> -       struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -       const struct s32_pinctrl_soc_info *info =3D ipctl->info;
> -
> -       return info->functions[selector].name;
> -}
> -
> -static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
> -                             unsigned int selector,
> -                             const char * const **groups,
> -                             unsigned int * const num_groups)
> -{
> -       struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -       const struct s32_pinctrl_soc_info *info =3D ipctl->info;
> -
> -       *groups =3D info->functions[selector].groups;
> -       *num_groups =3D info->functions[selector].ngroups;
> -
> -       return 0;
> -}
> -
>  static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
>                                        struct pinctrl_gpio_range *range,
> -                                      unsigned int offset)
> +                                      unsigned int pin)
>  {
>         struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -       struct gpio_pin_config *gpio_pin;
> +       struct gpio_pin_config *gpio_pin __free(kfree) =3D NULL;
>         unsigned int config;
> -       unsigned long flags;
>         int ret;
>
> -       ret =3D s32_regmap_read(pctldev, offset, &config);
> +       ret =3D s32_regmap_read(pctldev, pin, &config);
>         if (ret)
>                 return ret;
>
> -       /* Save current configuration */
> -       gpio_pin =3D kmalloc_obj(*gpio_pin);
> +       gpio_pin =3D kmalloc(sizeof(*gpio_pin), GFP_KERNEL);

Why? Isn't kmalloc_obj safer?

>         if (!gpio_pin)
>                 return -ENOMEM;
>
> -       gpio_pin->pin_id =3D offset;
> +       gpio_pin->pin_id =3D pin;
>         gpio_pin->config =3D config;
> -       INIT_LIST_HEAD(&gpio_pin->list);
> -
> -       spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> -       list_add(&gpio_pin->list, &ipctl->gpio_configs);
> -       spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
>
>         /* GPIO pin means SSS =3D 0 */
> -       config &=3D ~S32_MSCR_SSS_MASK;
> +       ret =3D s32_regmap_update(pctldev, pin,
> +                               S32_MSCR_SSS_MASK | S32_MSCR_IBE,
> +                               S32_MSCR_IBE);
> +       if (ret)
> +               return ret;
> +
> +       scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
> +               list_add(&no_free_ptr(gpio_pin)->list, &ipctl->gpio_confi=
gs);
>
> -       return s32_regmap_write(pctldev, offset, config);
> +       return 0;
>  }
>
>  static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
>                                       struct pinctrl_gpio_range *range,
> -                                     unsigned int offset)
> +                                     unsigned int pin)
>  {
>         struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -       struct gpio_pin_config *gpio_pin, *tmp;
> +       struct gpio_pin_config *gpio_pin, *found =3D NULL;
>         unsigned long flags;
> -       int ret;
>
>         spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> -
> -       list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, lis=
t) {
> -               if (gpio_pin->pin_id =3D=3D offset) {
> -                       ret =3D s32_regmap_write(pctldev, gpio_pin->pin_i=
d,
> -                                                gpio_pin->config);
> -                       if (ret !=3D 0)
> -                               goto unlock;
> -
> +       list_for_each_entry(gpio_pin, &ipctl->gpio_configs, list) {
> +               if (gpio_pin->pin_id =3D=3D pin) {
>                         list_del(&gpio_pin->list);
> -                       kfree(gpio_pin);
> +                       found =3D gpio_pin;
>                         break;
>                 }
>         }
> -
> -unlock:
>         spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> +
> +       if (found) {
> +               s32_regmap_write(pctldev, found->pin_id, found->config);
> +               kfree(found);
> +       }
> +}
> +
> +static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
> +                                        unsigned int selector)
> +{
> +       struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       const struct s32_pinctrl_soc_info *info =3D ipctl->info;
> +
> +       return info->functions[selector].name;
> +}
> +
> +static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
> +                             unsigned int selector,
> +                             const char * const **groups,
> +                             unsigned int * const num_groups)
> +{
> +       struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       const struct s32_pinctrl_soc_info *info =3D ipctl->info;
> +
> +       *groups =3D info->functions[selector].groups;
> +       *num_groups =3D info->functions[selector].ngroups;
> +
> +       return 0;
>  }
>
>  static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> @@ -649,9 +704,9 @@ static void s32_pinconf_dbg_show(struct pinctrl_dev *=
pctldev,
>
>         ret =3D s32_regmap_read(pctldev, pin_id, &config);
>         if (ret)
> -               return;
> -
> -       seq_printf(s, "0x%x", config);
> +               seq_printf(s, "error %d", ret);
> +       else
> +               seq_printf(s, "0x%x", config);
>  }
>
>  static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
> @@ -662,15 +717,13 @@ static void s32_pinconf_group_dbg_show(struct pinct=
rl_dev *pctldev,
>         struct s32_pin_group *grp;
>         unsigned int config;
>         const char *name;
> -       int i, ret;
> +       int i;
>
>         seq_puts(s, "\n");
>         grp =3D &info->groups[selector];
>         for (i =3D 0; i < grp->data.npins; i++) {
>                 name =3D pin_get_name(pctldev, grp->data.pins[i]);
> -               ret =3D s32_regmap_read(pctldev, grp->data.pins[i], &conf=
ig);
> -               if (ret)
> -                       return;
> +               s32_regmap_read(pctldev, grp->data.pins[i], &config);
>                 seq_printf(s, "%s: 0x%x\n", name, config);
>         }
>  }
> @@ -683,6 +736,450 @@ static const struct pinconf_ops s32_pinconf_ops =3D=
 {
>         .pin_config_group_dbg_show =3D s32_pinconf_group_dbg_show,
>  };
>
> +static void s32_gpio_free_saved_configs(void *data)
> +{
> +       struct s32_pinctrl *ipctl =3D data;
> +       struct gpio_pin_config *gpio_pin, *tmp;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> +       list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, lis=
t) {
> +               list_del(&gpio_pin->list);
> +               kfree(gpio_pin);
> +       }
> +       spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> +}
> +
> +static unsigned int s32_pin2pad(unsigned int pin)
> +{
> +       return pin / S32_PGPD_SIZE;
> +}
> +
> +static u16 s32_pin2mask(unsigned int pin)
> +{
> +       /*
> +        * From Reference manual :
> +        * PGPDOx[PPDOy] =3D GPDO(x =C3=97 16) + (15 - y)[PDO_(x =C3=97 1=
6) + (15 - y)]
> +        */
> +       return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
> +}
> +
> +static int s32_gpio_get_range(struct s32_pinctrl *ipctl,
> +                             unsigned int gpio,
> +                             unsigned int *pin,
> +                             unsigned int *bank)
> +{
> +       const struct s32_pinctrl_soc_data *soc_data =3D ipctl->info->soc_=
data;
> +       const struct s32_gpio_range *range;
> +       int i;
> +
> +       for (i =3D 0; i < soc_data->num_gpio_ranges; i++) {
> +               range =3D &soc_data->gpio_ranges[i];
> +
> +               if (gpio < range->gpio_base ||
> +                   gpio >=3D range->gpio_base + range->gpio_num)
> +                       continue;
> +
> +               if (pin)
> +                       *pin =3D range->pin_base + gpio - range->gpio_bas=
e;
> +
> +               if (bank)
> +                       *bank =3D i;
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int s32_gpio_pad_map_xlate(struct s32_pinctrl *ipctl,
> +                                 unsigned int gpio,
> +                                 unsigned int *reg_offset,
> +                                 u16 *mask)
> +{
> +       const struct s32_pinctrl_soc_data *soc_data =3D ipctl->info->soc_=
data;
> +       const struct s32_gpio_pad_map *map;
> +       unsigned int bit;
> +       int i;
> +
> +       if (!soc_data->gpio_pad_maps || !soc_data->num_gpio_pad_maps)
> +               return -EINVAL;
> +
> +       for (i =3D 0; i < soc_data->num_gpio_pad_maps; i++) {
> +               map =3D &soc_data->gpio_pad_maps[i];
> +
> +               if (gpio < map->gpio_start || gpio > map->gpio_end)
> +                       continue;
> +
> +               bit =3D gpio - map->gpio_start;
> +               *mask =3D BIT(S32_PGPD_SIZE - 1 - bit);
> +               *reg_offset =3D S32_PGPD(map->pad);
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int s32_gpio_xlate_pgpd(struct s32_pinctrl *ipctl,
> +                              unsigned int pin,
> +                              unsigned int *reg_offset,
> +                              u16 *mask)
> +{
> +       /*
> +        * SIUL2_1 does not expose GPIO data registers as a linear pad se=
quence.
> +        * Valid PGPD offsets there correspond to PGPD7, PGPD9, PGPD10, P=
GPD11.
> +        */
> +       if (pin >=3D 112)

The magic number 112 requires better documentation or a define

Or maybe, (NOT TESTED) instead of hardcoding, check if a pad map
exists for this pin

    /* Try pad map first (needed for SIUL2_1's sparse layout) */
    ret =3D s32_gpio_pad_map_xlate(ipctl, pin, reg_offset, mask);
    if (ret !=3D -EINVAL)
        return ret;

    /* Fall back to linear layout (SIUL2_0) */
    *mask =3D s32_pin2mask(pin);
    *reg_offset =3D S32_PGPD(s32_pin2pad(pin));
    return 0;

Does it make sense?

> +               return s32_gpio_pad_map_xlate(ipctl, pin, reg_offset, mas=
k);
> +
> +       *mask =3D s32_pin2mask(pin);
> +       *reg_offset =3D S32_PGPD(s32_pin2pad(pin));
> +
> +       return 0;
> +}
> +
> +static int s32_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
> +                                  unsigned int base, unsigned int offset=
,
> +                                  unsigned int *reg, unsigned int *mask)
> +{
> +       struct s32_pinctrl *ipctl =3D gpio_regmap_get_drvdata(gpio);
> +       unsigned int pgpd_reg, pin, bank;
> +       u16 pgpd_mask;
> +       int ret;
> +
> +       ret =3D s32_gpio_get_range(ipctl, offset, &pin, &bank);
> +       if (ret)
> +               return ret;
> +
> +       switch (base) {
> +       case S32_GPIO_OP_DIR:
> +               /*
> +                * Direction is controlled through MSCR OBE.
> +                * Encode the real pin id in the virtual register.
> +                */
> +               *reg =3D S32_GPIO_OP_DIR | pin;
> +               *mask =3D S32_MSCR_OBE;
> +               return 0;
> +
> +       case S32_GPIO_OP_DAT:
> +       case S32_GPIO_OP_SET:
> +               ret =3D s32_gpio_xlate_pgpd(ipctl, pin, &pgpd_reg, &pgpd_=
mask);
> +               if (ret)
> +                       return ret;
> +               /*
> +                * Encode both the GPIO bank and the real PGPD register o=
ffset.
> +                */
> +               *reg =3D base | S32_GPIO_ENCODE(bank, pgpd_reg);
> +               *mask =3D pgpd_mask;
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int s32_gpio_reg_read(void *context, unsigned int reg,
> +                            unsigned int *val)
> +{
> +       struct s32_pinctrl *ipctl =3D context;
> +       unsigned int op =3D reg & S32_GPIO_OP_MASK;
> +       unsigned int vreg =3D reg & ~S32_GPIO_OP_MASK;
> +       unsigned int bank;
> +       unsigned int offset;
> +       struct regmap *map;
> +
> +       switch (op) {
> +       case S32_GPIO_OP_DIR:
> +               /*
> +                * Lower bits contain the real MSCR pin id.
> +                */
> +               offset =3D S32_GPIO_DECODE_OFF(vreg);
> +
> +               return s32_regmap_read(ipctl->pctl, offset, val);
> +
> +       case S32_GPIO_OP_DAT:
> +               bank =3D S32_GPIO_DECODE_BANK(vreg);
> +               offset =3D S32_GPIO_DECODE_OFF(vreg);
> +
> +               if (bank >=3D ipctl->num_gpio_regmaps)
> +                       return -EINVAL;
> +
> +               map =3D ipctl->gpio_regmaps[bank].pgpdi;
> +               if (!map)
> +                       return -ENODEV;
> +
> +               return regmap_read(map, offset, val);
> +
> +       case S32_GPIO_OP_SET:
> +               /*
> +                * gpio-regmap uses update_bits() for set, so it needs to=
 read
> +                * the output register before writing the updated value.
> +                */
> +               bank =3D S32_GPIO_DECODE_BANK(vreg);
> +               offset =3D S32_GPIO_DECODE_OFF(vreg);
> +
> +               if (bank >=3D ipctl->num_gpio_regmaps)
> +                       return -EINVAL;
> +
> +               map =3D ipctl->gpio_regmaps[bank].pgpdo;
> +               if (!map)
> +                       return -ENODEV;
> +
> +               return regmap_read(map, offset, val);
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int s32_gpio_reg_write(void *context, unsigned int reg,
> +                             unsigned int val)
> +{
> +       struct s32_pinctrl *ipctl =3D context;
> +       unsigned int op =3D reg & S32_GPIO_OP_MASK;
> +       unsigned int vreg =3D reg & ~S32_GPIO_OP_MASK;
> +       unsigned int bank, offset, config;
> +       struct regmap *map;
> +
> +       switch (op) {
> +       case S32_GPIO_OP_DIR:
> +               /*
> +                * gpio-regmap sets S32_MSCR_OBE for output and clears it=
 for
> +                * input. Keep IBE enabled for GPIOs in both cases.
> +                */
> +               offset =3D S32_GPIO_DECODE_OFF(vreg);
> +
> +               config =3D S32_MSCR_IBE;
> +               if (val & S32_MSCR_OBE)
> +                       config |=3D S32_MSCR_OBE;
> +
> +               return s32_regmap_update(ipctl->pctl, offset,
> +                                        S32_MSCR_OBE | S32_MSCR_IBE,
> +                                        config);
> +
> +       case S32_GPIO_OP_SET:
> +               bank =3D S32_GPIO_DECODE_BANK(vreg);
> +               offset =3D S32_GPIO_DECODE_OFF(vreg);
> +
> +               if (bank >=3D ipctl->num_gpio_regmaps)
> +                       return -EINVAL;
> +
> +               map =3D ipctl->gpio_regmaps[bank].pgpdo;
> +               if (!map)
> +                       return -ENODEV;
> +
> +               return regmap_write(map, offset, val);
> +
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static const struct regmap_bus s32_gpio_regmap_bus =3D {
> +       .reg_read =3D s32_gpio_reg_read,
> +       .reg_write =3D s32_gpio_reg_write,
> +};
> +
> +static const struct regmap_config s32_gpio_regmap_config =3D {
> +       .name =3D "s32-gpio",
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 1,
> +       .max_register =3D S32_GPIO_OP_SET | S32_GPIO_BANK_MASK | S32_GPIO=
_REG_MASK,
> +       .cache_type =3D REGCACHE_NONE,
> +};
> +
> +static int s32_gpio_get_ngpio(const struct s32_pinctrl_soc_data *soc_dat=
a,
> +                             unsigned int *ngpio)
> +{
> +       const struct s32_gpio_range *range;
> +       unsigned int end, max =3D 0;
> +       int i;
> +
> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +               return -EINVAL;
> +
> +       for (i =3D 0; i < soc_data->num_gpio_ranges; i++) {
> +               range =3D &soc_data->gpio_ranges[i];
> +
> +               if (!range->gpio_num)
> +                       return -EINVAL;
> +
> +               end =3D range->gpio_base + range->gpio_num;
> +
> +               /*
> +                * gpio_ranges must be ordered by gpio_base and must not =
overlap.
> +                * The GPIO line space size is derived from the highest r=
ange end.
> +                */
> +               if (i > 0 && range->gpio_base < max)
> +                       return -EINVAL;
> +
> +               if (end > max)
> +                       max =3D end;
> +       }
> +
> +       *ngpio =3D max;
> +
> +       return 0;
> +}
> +
> +static int s32_init_gpio_regmap(struct platform_device *pdev,
> +                               struct s32_pinctrl *ipctl)
> +{
> +       ipctl->gpio_regmap =3D
> +               devm_regmap_init(&pdev->dev, &s32_gpio_regmap_bus,
> +                                ipctl, &s32_gpio_regmap_config);
> +       if (IS_ERR(ipctl->gpio_regmap))
> +               return dev_err_probe(&pdev->dev,
> +                                    PTR_ERR(ipctl->gpio_regmap),
> +                                    "Failed to init GPIO regmap\n");
> +
> +       return 0;
> +}
> +
> +static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *ma=
sk,
> +                              unsigned int ngpios)
> +{
> +       struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
> +       struct s32_pinctrl *ipctl =3D gpio_regmap_get_drvdata(gpio);
> +       unsigned int gpio_num, pin, reg_offset;
> +       u16 pgpd_mask;
> +       int ret;
> +
> +       bitmap_zero(mask, ngpios);
> +
> +       for (gpio_num =3D 0; gpio_num < ngpios; gpio_num++) {
> +               ret =3D s32_gpio_get_range(ipctl, gpio_num, &pin, NULL);
> +               if (ret)
> +                       continue;
> +
> +               ret =3D s32_gpio_xlate_pgpd(ipctl, pin, &reg_offset, &pgp=
d_mask);
> +               if (ret)
> +                       continue;
> +
> +               bitmap_set(mask, gpio_num, 1);
> +       }
> +
> +       return 0;
> +}
> +
> +static int s32_gpio_populate_names(struct s32_pinctrl *ipctl)
> +{
> +       char **names;
> +       unsigned int gpio;
> +       unsigned int pin;
> +       char port;
> +       int ret;
> +
> +       names =3D devm_kcalloc(ipctl->dev, ipctl->ngpio, sizeof(*names),
> +                            GFP_KERNEL);
> +       if (!names)
> +               return -ENOMEM;
> +
> +       for (gpio =3D 0; gpio < ipctl->ngpio; gpio++) {
> +               ret =3D s32_gpio_get_range(ipctl, gpio, &pin, NULL);
> +               if (ret)
> +                       continue;
> +
> +               port =3D 'A' + pin / 16;
> +
> +               names[gpio] =3D devm_kasprintf(ipctl->dev, GFP_KERNEL,
> +                                            "P%c_%02u", port, pin & 0xf)=
;
> +               if (!names[gpio])
> +                       return -ENOMEM;
> +       }
> +
> +       ipctl->gpio_names =3D (const char *const *)names;
> +
> +       return 0;
> +}
> +
> +static int s32_pinctrl_init_gpio_regmaps(struct platform_device *pdev,
> +                                        struct s32_pinctrl *ipctl)
> +{
> +       const struct s32_pinctrl_soc_data *soc_data =3D ipctl->info->soc_=
data;
> +       static const struct regmap_config pgpd_config =3D {
> +               .reg_bits =3D 32,
> +               .val_bits =3D 16,
> +               .reg_stride =3D 2,
> +       };
> +       struct regmap_config cfg;
> +       struct resource *res;
> +       void __iomem *base;
> +       unsigned int pgpdo_idx, pgpdi_idx;
> +       unsigned int i;
> +
> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +               return 0;
> +
> +       ipctl->num_gpio_regmaps =3D soc_data->num_gpio_ranges;
> +       ipctl->gpio_regmaps =3D devm_kcalloc(&pdev->dev, ipctl->num_gpio_=
regmaps,
> +                                          sizeof(*ipctl->gpio_regmaps),
> +                                          GFP_KERNEL);
> +       if (!ipctl->gpio_regmaps)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ipctl->num_gpio_regmaps; i++) {
> +               ipctl->gpio_regmaps[i].range =3D &soc_data->gpio_ranges[i=
];
> +
> +               /*
> +                * GPIO resources are placed after the pinctrl regions
> +                */
> +               pgpdo_idx =3D soc_data->mem_regions + i * 2;
> +               pgpdi_idx =3D soc_data->mem_regions + i * 2 + 1;
> +
> +               /* PGPDO */
> +               res =3D platform_get_resource(pdev, IORESOURCE_MEM, pgpdo=
_idx);
> +               if (!res)
> +                       return dev_err_probe(&pdev->dev, -ENOENT,
> +                                                "Missing PGPDO resource =
%u\n", i);
> +
> +               base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
> +
> +               cfg =3D pgpd_config;
> +               cfg.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpd=
o%u", i);
> +               if (!cfg.name)
> +                       return -ENOMEM;
> +
> +               cfg.max_register =3D resource_size(res) - cfg.reg_stride;
> +
> +               ipctl->gpio_regmaps[i].pgpdo =3D
> +                       devm_regmap_init_mmio(&pdev->dev, base, &cfg);
> +               if (IS_ERR(ipctl->gpio_regmaps[i].pgpdo))
> +                       return dev_err_probe(&pdev->dev,
> +                                                PTR_ERR(ipctl->gpio_regm=
aps[i].pgpdo),
> +                                                "Failed to init PGPDO re=
gmap %u\n", i);
> +
> +               /* PGPDI */
> +               res =3D platform_get_resource(pdev, IORESOURCE_MEM, pgpdi=
_idx);
> +               if (!res)
> +                       return dev_err_probe(&pdev->dev, -ENOENT,
> +                                                "Missing PGPDI resource =
%u\n", i);
> +
> +               base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
> +
> +               cfg =3D pgpd_config;
> +               cfg.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpd=
i%u", i);
> +               if (!cfg.name)
> +                       return -ENOMEM;
> +
> +               cfg.max_register =3D resource_size(res) - cfg.reg_stride;
> +
> +               ipctl->gpio_regmaps[i].pgpdi =3D
> +                       devm_regmap_init_mmio(&pdev->dev, base, &cfg);
> +               if (IS_ERR(ipctl->gpio_regmaps[i].pgpdi))
> +                       return dev_err_probe(&pdev->dev,
> +                                                PTR_ERR(ipctl->gpio_regm=
aps[i].pgpdi),
> +                                                "Failed to init PGPDI re=
gmap %u\n", i);
> +       }
> +
> +       return 0;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
>                                     unsigned int pin)
> @@ -710,7 +1207,6 @@ int s32_pinctrl_suspend(struct device *dev)
>         const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>         struct s32_pinctrl_context *saved_context =3D &ipctl->saved_conte=
xt;
>         int i;
> -       int ret;
>         unsigned int config;
>
>         for (i =3D 0; i < info->soc_data->npins; i++) {
> @@ -719,9 +1215,7 @@ int s32_pinctrl_suspend(struct device *dev)
>                 if (!s32_pinctrl_should_save(ipctl, pin->number))
>                         continue;
>
> -               ret =3D s32_regmap_read(ipctl->pctl, pin->number, &config=
);
> -               if (ret)
> -                       return -EINVAL;
> +               s32_regmap_read(ipctl->pctl, pin->number, &config);
>
>                 saved_context->pads[i] =3D config;
>         }
> @@ -736,7 +1230,7 @@ int s32_pinctrl_resume(struct device *dev)
>         const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>         const struct pinctrl_pin_desc *pin;
>         struct s32_pinctrl_context *saved_context =3D &ipctl->saved_conte=
xt;
> -       int ret, i;
> +       int i;
>
>         for (i =3D 0; i < info->soc_data->npins; i++) {
>                 pin =3D &info->soc_data->pins[i];
> @@ -744,10 +1238,8 @@ int s32_pinctrl_resume(struct device *dev)
>                 if (!s32_pinctrl_should_save(ipctl, pin->number))
>                         continue;
>
> -               ret =3D s32_regmap_write(ipctl->pctl, pin->number,
> -                                        saved_context->pads[i]);
> -               if (ret)
> -                       return ret;
> +               s32_regmap_write(ipctl->pctl, pin->number,
> +                                saved_context->pads[i]);
>         }
>
>         return 0;
> @@ -927,13 +1419,15 @@ static int s32_pinctrl_probe_dt(struct platform_de=
vice *pdev,
>  int s32_pinctrl_probe(struct platform_device *pdev,
>                       const struct s32_pinctrl_soc_data *soc_data)
>  {
> -       struct s32_pinctrl *ipctl;
> -       int ret;
> -       struct pinctrl_desc *s32_pinctrl_desc;
> -       struct s32_pinctrl_soc_info *info;
>  #ifdef CONFIG_PM_SLEEP
>         struct s32_pinctrl_context *saved_context;
>  #endif
> +       struct gpio_regmap_config gpio_cfg =3D {};
> +       struct pinctrl_desc *s32_pinctrl_desc;
> +       struct s32_pinctrl_soc_info *info;
> +       struct s32_pinctrl *ipctl;
> +       unsigned int ngpio;
> +       int ret;
>
>         if (!soc_data || !soc_data->pins || !soc_data->npins) {
>                 dev_err(&pdev->dev, "wrong pinctrl info\n");
> @@ -959,6 +1453,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         INIT_LIST_HEAD(&ipctl->gpio_configs);
>         spin_lock_init(&ipctl->gpio_configs_lock);
>
> +       ret =3D devm_add_action_or_reset(&pdev->dev,
> +                                      s32_gpio_free_saved_configs, ipctl=
);
> +       if (ret)
> +               return ret;
> +
>         s32_pinctrl_desc =3D
>                 devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_K=
ERNEL);
>         if (!s32_pinctrl_desc)
> @@ -978,6 +1477,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>                 return ret;
>         }
>
> +       ret =3D s32_pinctrl_init_gpio_regmaps(pdev, ipctl);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init GPIO regmaps\n");
> +
>         ret =3D devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_de=
sc,
>                                              ipctl, &ipctl->pctl);
>         if (ret)
> @@ -999,7 +1503,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>                 return dev_err_probe(&pdev->dev, ret,
>                                      "Failed to enable pinctrl\n");
>
> -       dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
> +       /* Setup GPIO if GPIO ranges are defined */
> +       if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +               return 0;
> +
> +       ret =3D s32_gpio_get_ngpio(soc_data, &ngpio);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "Invalid GPIO range=
s\n");
> +
> +       ipctl->ngpio =3D ngpio;
> +
> +       ret =3D s32_gpio_populate_names(ipctl);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D s32_init_gpio_regmap(pdev, ipctl);
> +       if (ret)
> +               return ret;
> +
> +       gpio_cfg.parent =3D &pdev->dev;
> +       gpio_cfg.fwnode =3D dev_fwnode(&pdev->dev);
> +       gpio_cfg.label =3D dev_name(&pdev->dev);
> +       gpio_cfg.regmap =3D ipctl->gpio_regmap;
> +       gpio_cfg.ngpio =3D ngpio;
> +       gpio_cfg.names =3D ipctl->gpio_names;
> +       gpio_cfg.reg_dir_out_base =3D GPIO_REGMAP_ADDR(S32_GPIO_OP_DIR);
> +       gpio_cfg.reg_dat_base =3D GPIO_REGMAP_ADDR(S32_GPIO_OP_DAT);
> +       gpio_cfg.reg_set_base =3D GPIO_REGMAP_ADDR(S32_GPIO_OP_SET);
> +       gpio_cfg.reg_mask_xlate =3D s32_gpio_reg_mask_xlate;
> +       gpio_cfg.init_valid_mask =3D s32_init_valid_mask;
> +       gpio_cfg.drvdata =3D ipctl;
> +
> +       ipctl->gpio_rgm =3D devm_gpio_regmap_register(&pdev->dev, &gpio_c=
fg);
> +       if (IS_ERR(ipctl->gpio_rgm))
> +               return dev_err_probe(&pdev->dev,
> +                                    PTR_ERR(ipctl->gpio_rgm),
> +                                    "Unable to add gpio_regmap chip\n");
>
>         return 0;
>  }
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pi=
nctrl-s32g2.c
> index c49d28793b69..0bd6e6ab5ad1 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -3,7 +3,7 @@
>   * NXP S32G pinctrl driver
>   *
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
> - * Copyright 2017-2018, 2020-2022 NXP
> + * Copyright 2017-2018, 2020-2022, 2025-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   */
>
> @@ -773,17 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_si=
ul2[] =3D {
>         S32_PIN_RANGE(942, 1007),
>  };
>
> -static const struct s32_pinctrl_soc_data s32_pinctrl_data =3D {
> +static const struct s32_gpio_range s32_gpio_ranges_siul2[] =3D {
> +       S32_GPIO_RANGE(0, 0, 102),
> +       S32_GPIO_RANGE(112, 112, 79),
> +};
> +
> +/*
> + * SIUL2_1 GPIO ranges mapped to sparse PGPD pads.
> + *
> + * SIUL2_1 does not expose GPIO data registers as a linear pad
> + * sequence. Each entry describes a contiguous GPIO offset range
> + * and the PGPD pad servicing that range.
> + */
> +static const struct s32_gpio_pad_map s32g_gpio_pad_maps[] =3D {
> +       { 112, 122, 7  }, /* PH_00 .. PH_10 -> PGPD7  */
> +       { 144, 159, 9  }, /* PJ_00 .. PJ_15 -> PGPD9  */
> +       { 160, 175, 10 }, /* PK_00 .. PK_15 -> PGPD10 */
> +       { 176, 190, 11 }, /* PL_00 .. PL_14 -> PGPD11 */
> +};
> +
> +/* Legacy data for old DT bindings without GPIO support */
> +static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data =3D {
> +       .pins =3D s32_pinctrl_pads_siul2,
> +       .npins =3D ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +       .mem_pin_ranges =3D s32_pin_ranges_siul2,
> +       .mem_regions =3D ARRAY_SIZE(s32_pin_ranges_siul2),
> +};
> +
> +static const struct s32_pinctrl_soc_data s32g_pinctrl_data =3D {
>         .pins =3D s32_pinctrl_pads_siul2,
>         .npins =3D ARRAY_SIZE(s32_pinctrl_pads_siul2),
>         .mem_pin_ranges =3D s32_pin_ranges_siul2,
>         .mem_regions =3D ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .gpio_ranges =3D s32_gpio_ranges_siul2,
> +       .num_gpio_ranges =3D ARRAY_SIZE(s32_gpio_ranges_siul2),
> +       .gpio_pad_maps =3D s32g_gpio_pad_maps,
> +       .num_gpio_pad_maps =3D ARRAY_SIZE(s32g_gpio_pad_maps),
>  };
>
>  static const struct of_device_id s32_pinctrl_of_match[] =3D {
>         {
>                 .compatible =3D "nxp,s32g2-siul2-pinctrl",
> -               .data =3D &s32_pinctrl_data,
>         },
>         { /* sentinel */ }
>  };
> @@ -792,8 +822,16 @@ MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
>  static int s32g_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct s32_pinctrl_soc_data *soc_data;
> +       struct device_node *np =3D pdev->dev.of_node;
>
> -       soc_data =3D of_device_get_match_data(&pdev->dev);
> +       /*
> +        * Legacy DTs only describe the pinctrl resources.
> +        * New DT changes extend the same node with GPIO resources.
> +        */
> +       if (of_property_present(np, "gpio-controller"))
> +               soc_data =3D &s32g_pinctrl_data;
> +       else
> +               soc_data =3D &legacy_s32g_pinctrl_data;
>
>         return s32_pinctrl_probe(pdev, soc_data);
>  }
> --
> 2.34.1
>


