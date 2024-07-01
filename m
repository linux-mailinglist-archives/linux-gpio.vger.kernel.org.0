Return-Path: <linux-gpio+bounces-7848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 846EF91DB9C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 11:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BE1928177E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A2E82C63;
	Mon,  1 Jul 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TISHuZEk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27455524C9
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826678; cv=none; b=Dp3lDlTcJJakrGqbJS0koFS5J4mbUoyDK5ws1u/LaSlkBXJXCPAlHzYrc1ETi4xGk8dmb/ZtIfV5zSmym52QRM39Cl0NynsQfJRnDjckeL8TVxiYTnutMTMeUMxfk4LiPD8Dr//GVzRUBHgbLwDn8m7k49G46Z8cdwD1c0R/62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826678; c=relaxed/simple;
	bh=hKv6tVc8E4BqXQaKNnCLDLpa8PnRPM3zy9QZ6JydbS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTGHtn33s+wYffi2Wrr00AIr6MSPPZW+T1a//g5jJLthZfhItfS30e9aK5eG7Ai9gP4hoQNps+hjsUA5egXNpgwv5w4cdwcM2tPJLvELq/RncxQVSgb/n82aXLHDMBy1Ckw0C+ov/Wa+ZrIQPd8ohMcyoQbySLr275H8YznIpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TISHuZEk; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec4eefbaf1so28110631fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2024 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719826675; x=1720431475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4aHITYnWjEob+PIw1d85o31l+wtm6yxDVioQ0T5OqA=;
        b=TISHuZEkgvHFY3Gwoa6zom7sFDIzI4gXyf/31h3d1OsFmPAB7FDGfGvjvU1tbbD6Nx
         hqq4HXeieXP6peauE95xHNyJUuD2T8GADSlxToRZ8UvnHD36WegwcCgLtBWpVhsnsW4s
         0Yh/TcxMVSo/AQi/PB8J8bHRJgkQs9ta3GtKQKNkmzBNZwclwnFDVmMGAadv+Rsb4jmY
         tds/gvLFYdy5Q2HVDPqy0x4c3Zm4EtvRO2pktCTrWlleYkWGUfFE3UwvrCQUlxTZWxig
         g/U+CuIzxq62zXKSR/un8XMBNeqBQWY/Lbj28nqNkAFBIU+29UEOJlv9g0zI1Jl13tdg
         gY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826675; x=1720431475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4aHITYnWjEob+PIw1d85o31l+wtm6yxDVioQ0T5OqA=;
        b=Krpr88X3VJpOL1yZ2UhuVzOd8A6UntDdt8HYamaB5qTBktOz+zRDgii9RBL1pzxc9s
         FKBE6mPuQ56mb+U4mQhL96m+wR6fYV0trXSBjTdJeC5jZkU9aYVodQSjDomdVZECCp1u
         NTwOdD5XK/WpUfYCYf3pFWyfhxiRSt6oompEBeACfpui4zMCPgWZAmVGAy4weyXTyD84
         TTuzQOx8HJ64PvrdoFBEFFsX9pqtNPB+cBk0LsYjdBY5JxPmVIq/5wsTz+QUg/T+thDV
         /Qx7TS5hOoM6N9oc6JY4yI4TDOpDbRLxdwmlB0KEjob+fbolE26IKOxbtwGVJkqG3t1T
         14WA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tqBZByg2Bwcvq1fFuAUErcjwCbj0NQoRnUq2W7GAlo1RjEv/gMumoNxB/sCTplrK8U0MJSjZ6bq4A4uyuiEqn13UBulAH3sr4A==
X-Gm-Message-State: AOJu0YxkKJI2cCae/i8PN3SUvs4ESyxAXrcXVQ64w3LLJK5lN2cY5wza
	vYHR5PxdJA+Kt1MeAQA7q1pCrHrC602pnn4eU4BLMClej2AY9Mbi4BtYuOPah1W97tZ7a2UZ1OV
	ttsPIHu/7urHHtpFTCJMLE/UFrPiyIpqtPZoqK9icDteHnDFt
X-Google-Smtp-Source: AGHT+IGWQc4j04RztvOmse4AZ4bShLtupsMufuAyVAsdQbExrN0Lj9/vRc0YERxQFIZn9VrJ9JEpW/4r9cPoyO0SUjA=
X-Received: by 2002:a05:651c:4cf:b0:2ec:4aac:8fd6 with SMTP id
 38308e7fff4ca-2ee5e3458e5mr38833761fa.10.1719826675288; Mon, 01 Jul 2024
 02:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617152606.26191-1-kabel@kernel.org> <20240617152606.26191-4-kabel@kernel.org>
In-Reply-To: <20240617152606.26191-4-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 11:37:44 +0200
Message-ID: <CAMRc=MdpJUaJ3B64TTdt8B=PeJwR+BjiCx1SJj+SJGOT=LtT9A@mail.gmail.com>
Subject: Re: [PATCH v12 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 5:26=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
>
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

This is one heck of a complex GPIO driver!

> +
> +#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat=
_mask) \
> +       {                                                               \
> +               .cmd =3D _cmd,                                           =
 \
> +               .ctl_cmd =3D _ctl_cmd,                                   =
 \
> +               .bit =3D _bit,                                           =
 \
> +               .ctl_bit =3D _ctl_bit,                                   =
 \
> +               .int_bit =3D (_int_bit) < 0 ? OMNIA_GPIO_INVALID_INT_BIT =
 \
> +                                         : (_int_bit),                 \
> +               .feat =3D _feat,                                         =
 \
> +               .feat_mask =3D _feat_mask,                               =
 \
> +       }
> +#define _DEF_GPIO_STS(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, 0, __bf_shf(OMNIA_STS_ ## _n=
ame), \
> +                 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> +#define _DEF_GPIO_CTL(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, OMNIA_CMD_GENERAL_CONTROL, \
> +                 __bf_shf(OMNIA_STS_ ## _name), __bf_shf(OMNIA_CTL_ ## _=
name), \
> +                 -1, 0, 0)
> +#define _DEF_GPIO_EXT_STS(_name, _feat) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> +#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_LED_STATE_ ## _ledext, \
> +                 OMNIA_FEAT_LED_STATE_EXT_MASK)
> +#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_LED_STATE_EXT_MASK, 0)
> +#define _DEF_GPIO_EXT_CTL(_name, _feat) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_CONTROL_STATUS, OMNIA_CMD_EXT_CONTROL=
, \
> +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), \
> +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), -1, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> +#define _DEF_INT(_name) \
> +       _DEF_GPIO(0, 0, 0, 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> +

One coding-style nit: can you add newlines between these macros?

I'm having a hard-time understanding the entire architecture of this
MCU but the code overall looks good to me so I trust you know what
you're doing.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

