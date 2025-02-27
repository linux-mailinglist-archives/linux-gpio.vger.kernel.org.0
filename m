Return-Path: <linux-gpio+bounces-16715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E22A480C3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 15:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E83033A75BB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 14:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C8231A30;
	Thu, 27 Feb 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xdbx9PVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC4270047
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665450; cv=none; b=qWBE5C6znhgoX2xeu3KoFueDkmER1EUGVt5L7JX+8lveUfPVOzxw9uUcsSOOGtcFIG5HIqqdNInnPVaY4LAqJpoNOL1W3Yv9M2nh6Hmh/Is/p6OMMLeWmkchit24Fm8HsBLfIBQRl9Y7DgXbK3cS2sJFLT/fVGrw7W1yGpUzUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665450; c=relaxed/simple;
	bh=HvD0GdHLA3qGwMXFiIknEZVlkedmf7OUeodMIEjbRR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbQUwNeCvFTfTMs3PHw5SG77FwFJ/MXQeR3ELC+PQSnDXutSBuKW5uhnU9/se885N28rs+zMm40GHvuvPlNbrTUGZ1tMZaKWcfhqYy9oNg0KRUmPaa91OT5O8zw7xrAyDRxmCLM125YNPo0bdRL1kd9CtvctGOZwbocFPUODoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xdbx9PVo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54843052bcdso847678e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740665447; x=1741270247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juDHI0+8fEGnnjQA1BeXYd6MutVRHJOKOY+enn7+/qU=;
        b=xdbx9PVoAZAMRWQPjJvtrKmGBAL2x5O/m4RRtAILMgOHADoiu2jKWmh4JFP2FUkWVv
         QqpDn3/hbCIEcrptEh8PutNJ4AR2Lxrsbqcaf1vqVHZTB76KCQ+/a+6kCWOOHkT4waF2
         w3KjjlLOeXFNtdxurGgYaoSb+M6QBcZliWhr7cwaPODtLtrq1/qb2XfPaAw4yafC9hVy
         95pL72YLBSN/m87BCb5Wluic/UGprCotalgLUqYuJjzUD2maDTCkzhYSAxXQDaxXNOn/
         S2SHmZNt8r5YjYwBQoqSD0ROT5DeP+DtXE6PVHfdi1val6ELy8DFu1yIF7gVCGINeZ4W
         8bRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665447; x=1741270247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juDHI0+8fEGnnjQA1BeXYd6MutVRHJOKOY+enn7+/qU=;
        b=VYC5uz6a30UsS7BgewAyEj5EGBkNYgPPx9BFf7FqlJ7Qp4IWQ+XQsOXlBvshWvxCZc
         88ICwiE/nvlIP1LKRP5SuS4vlZe9Y1KMWaL/8g5oYEG+qVLXyr9bZzwHGa28zk8jCUD5
         wdrfCO3aoRHFm+cIm7E/X5khZ2Z+lLbv1PNbCemy1dkPkVJlHOUYSP80IWG7wpRZgNfP
         s5IVzArIz0wd25Ha4jq0bFJHhyUWzK1n4TnkGS/gksgWF8v/LSmziD38al8cBHqcBVgd
         lBsUA9fnsIsnM3tPRcuupU3xURKryZOgSwfVHvSd7Yag+TvY2DbfyPpuyHVMoXWfD/dP
         +PTA==
X-Forwarded-Encrypted: i=1; AJvYcCURYNkq6U+V5PDEDWNH7hg28z+b4dB/qg4XwfaPad4Yuze+vWw/OwqOU4zH8SLv4Wzq8QnBV11Pkz5/@vger.kernel.org
X-Gm-Message-State: AOJu0YyDndnPkOBSBH+13fqnJqckaW31KlZQAouTlffW2iu+DOsl/D3/
	KBV57h43QD07IUPrfhWCBwedCbZb1V6UKBJDOjiU1gJDeKT0L4KwcV6AO3w7Ia+iSYDRqQA+5xk
	vmxhbCMvplt2jtUcbVSl+2UYCzbJdzEWaSTbTgw==
X-Gm-Gg: ASbGncuAGojR1VEEpxvFrPJjZMISI5WSImHu9j3/8QNJ55IBIaKofEdbaRzAzOMzkq8
	0JY77jmwkfNe0LjrsGzm3sUHH6BP8xzxjCOeVBEWGD/3l+wrkWBg6ZZLPBltpkE7oTG+b21UuE1
	VgzQdFmzgWb6PBki/qmPmPzC45g4ftoEtcDxhaWLA=
X-Google-Smtp-Source: AGHT+IGtNGS5FduT7L3EZWOi1jJ+2DJDrbFGiQz7I+jgi0UOPNmby3BbFiuvhopvsKBURmlm7v0tD/b9aNnGJLrVrls=
X-Received: by 2002:a05:6512:1389:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-54851108679mr6710310e87.46.1740665446954; Thu, 27 Feb 2025
 06:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
 <CGME20250227140054eucas1p2bf6e3f2416e11e3c62a704682bf052bf@eucas1p2.samsung.com>
 <20250220-gpio-set-retval-v2-5-bc4cfd38dae3@linaro.org> <ab3e42c0-70fa-48e0-ac93-ecbffef63507@samsung.com>
In-Reply-To: <ab3e42c0-70fa-48e0-ac93-ecbffef63507@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Feb 2025 15:10:35 +0100
X-Gm-Features: AQ5f1JruPIGRSMvfqfGJCo4M_sF2CtpTvVrdot0dr0pbOujavSKKEh_CTipp8d0
Message-ID: <CAMRc=McnzfHHLUyYczaza1ao-9iPMoQNOmV3Bm2DSMULCmYBTA@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpiolib: introduce gpio_chip setters that return values
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:00=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 20.02.2025 10:57, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add new variants of the set() and set_multiple() callbacks that have
> > integer return values allowing to indicate failures to users of the GPI=
O
> > consumer API. Until we convert all GPIO providers treewide to using
> > them, they will live in parallel to the existing ones.
> >
> > Make sure that providers cannot define both. Prefer the new ones and
> > only use the old ones as fallback.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >       lockdep_assert_held(&gc->gpiodev->srcu);
> >
> > -     if (WARN_ON(unlikely(!gc->set_multiple && !gc->set)))
> > +     if (WARN_ON(unlikely(!gc->set_multiple && !gc->set_multiple_rv)))
> >               return -EOPNOTSUPP;
>
> The above change issues a warning on gpio controllers that doesn't
> support set_multiple() callbacks at all. I think that this wasn't intende=
d.
>

Eek, not at all, thanks for the report, I'll fix it.

Bartosz

