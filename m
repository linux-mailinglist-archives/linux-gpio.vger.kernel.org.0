Return-Path: <linux-gpio+bounces-12660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04D9C0199
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A236E1C21D54
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 09:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837151E9068;
	Thu,  7 Nov 2024 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BgcXldYx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957C1DB349
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973267; cv=none; b=DYSPDVQ7ZAzSKkfGY8KgnnWLDFCRJnfxsUu5aNwBUb3gghpydo9/fdJ/P63aV5Y7RV5TkqhPVXzCAEgiFdnoWgIrGIpPrraRN811X6mVNqzK+CLy7MJS+eh18sF7QZQcWOg2s4DX+x2wH8CVG+u2hsf86cFWXtAJU2a1x+DE+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973267; c=relaxed/simple;
	bh=rZG+qUpumh1N7bHbcwHQroHblYKAUapEq5+cs4Ijzfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxtwF04451J/uTbAtG2pFBN/EPgSn7K+1DjewIeRAZLPLux4oXaAt9yHu6RiIwsZgYiOv6bIDn3UlXyAvxQwEZnn73IjlGs6P8OaKiR3GIB+OXCIB94PF2QH+lPxDck/+tOcR0vez7o1a0F3V+SA+W4+eZbWwPoArimx+6AZAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BgcXldYx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e13375d3so791273e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2024 01:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730973264; x=1731578064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNZgwweTdh5lMjl8J2ZFJR8thP5OprmqS/2pXP+zgGw=;
        b=BgcXldYxuD7DU3EPEyNivNhKd+d5zbI1aAVpz1dNaOnVWPyyNePVIzm1U+L4R1cpPE
         /FJe/7e9C5PQz6SO1iTIUph0bgF3fxQSagcdFWtCum99ejIlrI1mKWsoo9mK5IeB3PR8
         rLKem+4tr4c9JmEZcbb0jfzb3Ap46OSTTG+FXbM/6w3lUto4WhRkQfeM1zi9tVkt3jEe
         N+ARKYzW2CuNa18qnitokq6jJEZZq5l3RX/wvd4H5idcQO/WCq4lG+rRwK9ImooEhscz
         Rci8APnegNWe+P2mnBB/gLYMoPsYxdSAvu7dB2puPw+HklulXRBb+dGlv4mjg3oeB/Qg
         iYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973264; x=1731578064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNZgwweTdh5lMjl8J2ZFJR8thP5OprmqS/2pXP+zgGw=;
        b=oKhZx8c7IaaJB0sp//4t6iScXkQrF6aQeTVEL1KgkEPcCbDKVI5flQkczN4n7kA2yO
         xlFUKag1ZLi08UySc5Uu/2SZILJyBvfAhcs/T0Pz8jXamevZav8O0bRG3YB3gBB28LKz
         ZAYWZEO9wDp5RX8F8xIMTwrtQ/2F0lNfibqzXwap/kn4cqQVa4piTPdTItaDKpKXfFfl
         1sJWyNl+Lc6EFebNc+g3uNrsMt1sXPQlN/aLmo2+LuxhMjEfS2gwLpCVBVmm8Mnn+/gz
         d20nMBIRI32nXcs5QACcCdTRSD2O4/velCXuI6lHuktq+fGu+HgHCxhzCijmmaZOrVLK
         wDgQ==
X-Gm-Message-State: AOJu0YzAB5xRAjmJnSxxhi/z0ETQcqGDWq/r5eAxJZiGL8rdD1VLkbmK
	Q04otsR8GC/nZYRjPUb0hh5ZqoDLqj7QSV/B2O4TwWf32kB/JXrEBw8bryrP5+vC1E7uz8xwFqY
	vfwfrfLbSOFaqIaU2RPH3D42CAJ64fK/43raGX646UJCOsRCP9IU=
X-Google-Smtp-Source: AGHT+IHO44xJZsCzvLBWR5rxVFIc9QwE3uNnyTyBySLz4/qhNvtTCX60cM7wV4WWpxDUMQCYOjTjn6pSWUcZf6Ho0hw=
X-Received: by 2002:a2e:be8e:0:b0:2fc:a507:19c6 with SMTP id
 38308e7fff4ca-2ff1a939441mr3932001fa.22.1730973263757; Thu, 07 Nov 2024
 01:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zyt0j1MZe_o7ViyK@black.fi.intel.com>
In-Reply-To: <Zyt0j1MZe_o7ViyK@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Nov 2024 10:54:12 +0100
Message-ID: <CAMRc=Meis72jVq9Q_e0PJVWQD-ifL0O1KnQM1sx-ux7SP=e07w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.13-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 2:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Tiniest update for v6.13-rc1 for GPIO ACPI code. Was a few weeks in Linux=
 Next
> without any problems reported. Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.13-1
>
> for you to fetch changes up to 12b0e305f50988b0c75f052f86d51b5353108ca5:
>
>   gpio: acpi: switch to device_for_each_child_node_scoped() (2024-09-30 1=
4:25:54 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v6.13-1
>
> * Use device_for_each_child_node_scoped() in ACPI routines
>
> The following is an automated git shortlog grouped by driver:
>
> acpi:
>  -  switch to device_for_each_child_node_scoped()
>
> ----------------------------------------------------------------
> Javier Carrasco (1):
>       gpio: acpi: switch to device_for_each_child_node_scoped()
>
>  drivers/gpio/gpiolib-acpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

