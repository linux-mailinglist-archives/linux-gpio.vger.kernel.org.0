Return-Path: <linux-gpio+bounces-25934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76AB52AC0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D8FA07650
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 07:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6082C15A2;
	Thu, 11 Sep 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3ETJqR4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6B2C158E
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577404; cv=none; b=CdEiNIY+YwIuT1CHYGIJWJGIyzx7+UWjVQjsqG8ixjOf2i2IOob/H8slYRLHVKnLxDn6eLJRgYgVj69I1ug9C9WKgZ8mEYv3tRCL6QSW1bh94PPOnuuXEB9vZA6lstEe8rZ49By30x1mE0wTpi9cDKRXrHwdkBvREm/otmdBTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577404; c=relaxed/simple;
	bh=9XrvhsWNNRvcRClDoeF6Jt3/A7wdBGZCuSPlcTCRTrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB2X86ngzcS7uAOvLi4MFP8X1ldpm5a1O2/FLNOJv58bl4Ug0vSzCKcefqagXc63nBvbPUeA4iu6l2ub7BF0FL5Ef94EMx25ISy8sjpYrCclzXE2nZoN+S3ZMHhTfHFe8C2l4mRN6Ihm4eUlN/0lzYbavOJ01L0i28hicMr24G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3ETJqR4v; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5679dbcf9d8so368314e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=3ETJqR4vgoMaMqt+KEy7Te/f85X46tzQudrlEpUFN2LPx9p9UCLIERH8L24fjT0cJE
         JF6mO8kJXP9n38SxR9kfsYWiSHUxhP/xvV1JXW7v1S38hsSo+j1jw+eHvKd/UgyKD5h/
         vXUq/PMlMdm81/xpQ1cuxlWS8vTV2z6fdRDfaknIIsnHd+YPE2rLXFHPOA/6jbIE0rbc
         aSS9o6d1xFR/hnlaFV9e2Kj3mzYtxYuPR24Hdbo3A/PUUdzppNcFcMeGXHR1hqLf7BtT
         EIvkzzxyuXPzBzcvapeMgXNXaK9WecfSAvYoOBK2Q5+EvNiZtmALQFI7sb3yAagJf9FO
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=aMji0rT0spNV1WzBIvwMxJsHrNf7cjnVqHhqLsm1PV24FKPMyA1X/fRGXkGXliZLD6
         sCeUeT3fI8E12nGHcDxPS/vqSBi5FrRf10zwqNM+tTiJVHr9IOqJGFp6ypQZIIt7ezQ+
         eqicBMvZw2aqEEJAnaQUj+qTzxB55w+Xn9KrmbwCARsHSLoz7A/e7Lh6PVt9uUTK5FHl
         JDaDjZRHdHudR4+mNlhyBrz/O5S0cah17M2n0NaUuSE47Sbw/UwSsmjrG6WcATHW4eRV
         N6+fjisfS2Y7BEaiZdc/in4cu2SeWO/pbNLunyfITUXfu7KeTfn2ppsgg3OXNNb4K0S+
         1MVg==
X-Forwarded-Encrypted: i=1; AJvYcCXAE5zWSyPF1X4WdlgPNKaoAslCkDxrlJvubhlFzTrWgqSBXuvJNcvTwqic4mHFFOz0siSZWt4EKDM+@vger.kernel.org
X-Gm-Message-State: AOJu0YyveG+T8Gs5M/yOG4uKcH7OZwE09YWyhcNlxD+MByb/5SkvengN
	J73MfbdaThENytXi+6ehSz5kutwiP58j32rUHn7kYyP9zdlggf0EfHM67lBM8Ufeb47RCp6TKPN
	dCmwtcQViFedNNW2wOKTn55MOOIgVWJpM5tyPcOeHoA==
X-Gm-Gg: ASbGnctdk6F4TiIbes+hn9KKZvyljbpXL6UCcEEKwB4RXQXZ6DHGmJehjRKAQBATBQs
	45efQMzkGFLzS5iM9HOm7oUQTCADf2MM54J1brvdgJcbQ3sJsdXduuI+eVhk/KWK333IS6OuCZY
	dhw+e2lv2kCy2cD6kLiO6ig8l/LlXRaaHtE16TwARkzu1bA17AdIqcHnDKclqUYqOcJbdjVPaBj
	x69BHf/pbZBqp06ctkwwkzRg4Foj4Bs/mMmBwA=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 2:11=E2=80=AFAM Doug Berger <opendmb@gmail.com> wro=
te:
>
> >
> > @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_devic=
e *pdev)
> >                * be retained from S5 cold boot
> >                */
> >               need_wakeup_event |=3D !!__brcmstb_gpio_get_active_irqs(b=
ank);
> > -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> > +             gpio_generic_write_reg(&bank->chip,
> > +                                    reg_base + GIO_MASK(bank->id), 0);
> >
> >               err =3D gpiochip_add_data(gc, bank);
> >               if (err) {
> >
> I suppose I'm OK with all of this, but I'm just curious about the longer
> term plans for the member accesses. Is there an intent to have helpers
> for things like?:
> chip.gc.offset
> chip.gc.ngpio

I don't think so. It would require an enormous effort and these fields
in struct gpio_chip are pretty stable so there's no real reason for
it.

Bart

