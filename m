Return-Path: <linux-gpio+bounces-18088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F86A748DB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 12:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3D23BE26F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211D1F583D;
	Fri, 28 Mar 2025 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1JGttWrd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EC8F49
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159663; cv=none; b=F6k2vuZDFDn/7csmGcGGorddCWZHj1lyb0Aoj1D7nXJv8a61GsUPFGDD/ZYqy3+RE+lbNQo8Mai4+5+hGUFdzCEXjeu4nJqMj80B2sNDZHpaNG9vvvtEVrsOoMvk9aWe56ySpI2Nustyp+h0Y5e5xPztqvBVdH5ElAmZyMoA5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159663; c=relaxed/simple;
	bh=RTvrT163C/OYAULWUc0nbH7g2zdCKugNEGNlKYbvqYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odFV67x6iyD3LohCSuLILGX0DK6Yg2hgyLJOP3ET37sIgyvl40l0++YnYLMD5m0A5PHGt0SYNW2pcF+Y/HZfHwz9fI+UCaRjCb3WPv1tkaF6wPUMYB8ichoNGFF7MZjPYasBJY1EZpIgFvWsTKX5rjKh8ajZFeZKrKGuyT5MG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1JGttWrd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so21578351fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743159658; x=1743764458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOesqKZa3XJ61TBEmAO2k4CbFDtxNZRhw8ecwIaP1cg=;
        b=1JGttWrdSRmWgYuEvkMJDhRW0aj4w00dJOFZzFeMra75ZWkzaIdQlYUcUz8JOkAfyq
         DtuWJiZmnRjnQrHAWwl+QE27HYP7z77DdWN4P+uvmwIM2GW2pWJN4ypOsvThH4q4LKh4
         YllNDfLL/CXX85IGfLKUs1OD7h4buFpWQcCYdS+7hBOlAWT3tSAzD22MGHxfMIXySQzQ
         9A4EAiQygoxkoyhEnoLGYqbwvamzTI/nW48t9npfG5CUJRNQJ4nNeLGhsjLjlP6hrmLH
         Sd2TtU+j1CqPyoEsOVB9t2vgbk7TCVErBTLDS9o0OQq1Ky1ekpxVzb3fvxCnPjtYwb78
         r4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159658; x=1743764458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOesqKZa3XJ61TBEmAO2k4CbFDtxNZRhw8ecwIaP1cg=;
        b=tOVT5SGgBunvfSr1Jr5c/5OptrXBf+7lAIA+bezJ3c1ACIhtk5IJk+5Hy731zy99TC
         V7Jmv4TpvhRvpOdyZqoezajfFdatrw/ffXfyph5p3eGZlZVmBvb7qw0ImU76by8kt+eq
         tpIm3SgZ8dKK0RYu5Ymhspe+yAcoR97mfbMb8d86wEFHo58uaQNh5Tp5iKV8UvyvK7ry
         2h+lFXkvGo+YhEY3U0ydMtJvAYSxRcMWeiNdLIo2yp885P6/Vu2WcVT4ch/kZA1nD6kh
         0sdOL7HWvUO9TjGm0IyOlToNPtSFMtN/bDrleEl6q9qUhFzctMMk0j4Jkolpru9sdgcS
         Wb7w==
X-Forwarded-Encrypted: i=1; AJvYcCWBFqs31V4EIqo9DBsdiLe4ZU73CaMG3sN9Vi5wWARFU7isUONVfVTcOz57CSEBCcUxAdFpdqFYO7SL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4L51GJweZKEsVWmKy3caBCT04uX7FSaQDAZwK7VdT6nowHnpE
	0Eem9IALsfTeGKW+H5kST13QxbtAirIQX2fFIy8HEULAH8lmpnTQ40EfJMEUbKFzFOJtzeE2Gss
	grP29a2aW4HAFHMdTbUxk44Ywn4aZg90W83/0Pn21xthcWOjp6sY=
X-Gm-Gg: ASbGncvcVFReKmYhgpe1MZhhgf1RUBfDLIkb8gKFdnsifaoZ6NKowQj8k2rVBdpStbA
	siMKN28BF7eqXOCghRDYGACAFtT8BEbdtiPHeq01v9jz2S/IMz5WcUMBNDFNjAVYozY5aA0RFrn
	hEEI8IFvwO1MNMD8AQWGeWTtQT1ufs7yFbRdMVHb/2xno1tXD5pNLA0Om/sA==
X-Google-Smtp-Source: AGHT+IGUxoQfqtRs5BLZD1cStRR4vw9J/A9hMILMv3y1NEgPSz8NtoRMXjLDrd/LgBzWys+lYN+WJpH8IF6zibF3Hm4=
X-Received: by 2002:a05:651c:1258:b0:30d:b49d:7fb7 with SMTP id
 38308e7fff4ca-30dc5de6e42mr23133211fa.16.1743159658237; Fri, 28 Mar 2025
 04:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
 <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com> <81b162e821747d807816673f89a171fbd0a0bba5.camel@sapience.com>
In-Reply-To: <81b162e821747d807816673f89a171fbd0a0bba5.camel@sapience.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Mar 2025 12:00:47 +0100
X-Gm-Features: AQ5f1JotXGND5AKHZoNwK7zNDD3vr5pLn2oLc_RMaggJ-PAg60vLiVwT4l3chnc
Message-ID: <CAMRc=Me0-Tv3ZZDsdijuErYZTswbjQ0obMGh_XtUn+cT-uCZ3A@mail.gmail.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed -> missing pinctrl patch
To: Genes Lists <lists@sapience.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:00=E2=80=AFAM Genes Lists <lists@sapience.com> w=
rote:
>
> On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wrote:
>
> On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
>
> On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists <lists@sapience.com> said=
:
>
> On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
>
> ......
>
>
>
> There are two problems here. The issue you're seeing is fixed in next but
> not in mainline due to my omission. I will send a patch for that.
>
> On the other hand, the pinctrl driver in question should be fixed too.
> Can you try the following change:
>
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index d889c7c878e2..0c6925b53d9f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> gpio_chip *chip, unsigned int offset)
>
>         pin =3D intel_gpio_to_pin(pctrl, offset, NULL, NULL);
>         if (pin < 0)
> -               return -EINVAL;
> +               /*
> +                * For pins configured to functions other than GPIO, defa=
ult
> +                * to the safe INPUT value.
> +                */
> +               return GPIO_LINE_DIRECTION_IN;
>
>         reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);
>         if (!reg)
>
> ?
>
> FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> return value of gpio_chip::get_direction()").
>
> Bart
>
>
> Hi Bart - I don't see this pincntrl patch in mainline yet -  what's your =
thinking on this?
>
> thanks!
>
>
>
> Following up - same question - this patch is not in mainline as of today.
>
> Can you share your thoughts/plans on this one?
>
> thanks.
>
>
> --
>
> Gene
>

My thoughts are that this is in mainline as commit 0102fbf52b93e
("gpiolib: don't check the retval of get_direction() when registering
a chip")[1].

Bart

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D0102fbf52b93e609fec0dab53b1fb4fe69113f5e

