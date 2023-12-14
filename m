Return-Path: <linux-gpio+bounces-1505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55033813C52
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 22:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0DAF1F2258F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 21:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C306DD06;
	Thu, 14 Dec 2023 21:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iYRrOIhB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7E6D1B0
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b3b819f8a3so407371639f.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 13:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702587942; x=1703192742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYSEL7MIgSG8trWNPr7NB5+x5xH37jHR4RltoDZ173Y=;
        b=iYRrOIhBA68YyyJHlWUUlgxTPLLZgUBmrsdxz9j7DinbKPiHy5B+b5l67KhumnxeuH
         S4adang1PkSlav5B4HsMJaCA3QcbAqXcFpEL/ohz4ZFrOdLrAhgBV/0znlYt5Ihoj7pj
         1JChNZsY8QtalPfEp0iiSG/StmEmwNA+4FXuWMYKGBxcvtSLCoOBNucV32DV/onfSJ5b
         WHVyE6492+PyMZcqa9kyAgpf3CBYMjtXxvwbw+FbSwV5ZxwcVI+iRMNZu1ZfBeIqYF9+
         ISR1yK3WDMdFhMnApB5ODyPGHoc79HyhPX4PhbFePTKbXMsEFXAjfTgAXe5lGeX7k/Zh
         j29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702587942; x=1703192742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYSEL7MIgSG8trWNPr7NB5+x5xH37jHR4RltoDZ173Y=;
        b=UXf/UEMg0y9bdPIscO/Tzo5Uj3nqUCAaJGhaSEDeg2Tls12xxOdSKOXfXMcvJiURc6
         zzvNkmMe7z0XWQHeqjx3hoMmyzA4OundwuYZLT2Yq231ZOifFxg34gPCow6W1fJDHBiW
         W960gzQFrjcFbuRWG5kRHEina2uTDBlvVFyNoOiU4RSeo/oGIgrZNTmW69Lmq2PDALPr
         UYaHFiSLdYS69G0FERKzzpPf4FlP1OwagyWWGNrn4iHZlTtG4GJgAZBm1iuRk2udWuEu
         k6uG3AHQRaG65zWdBLsJbDNMPbip0qIUOHzA3K1+4bFtjWrmd9e/wgBdUWOHjY9kuoMg
         7cwg==
X-Gm-Message-State: AOJu0Yx6542SYwnVEHSM/lbmI77xfSCAmbFXaLpFJmh2X7olTrOgpaSO
	q+TmKWijlGstNWW050ljJHj9ZIRaSkaB8p1hTBJzsg==
X-Google-Smtp-Source: AGHT+IGxr066RC4yxlfM9efuBAZLfPmRjNI8ZkOw8V4w3KW2qA8hkeyLMtUVXb3U6UCex4CgLOS6TSWV9tl6OAhk7Uc=
X-Received: by 2002:a05:6e02:19ca:b0:35e:7693:7a21 with SMTP id
 r10-20020a056e0219ca00b0035e76937a21mr10610379ill.83.1702587942177; Thu, 14
 Dec 2023 13:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZXsxc8953uAfizLv@smile.fi.intel.com>
In-Reply-To: <ZXsxc8953uAfizLv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 22:05:29 +0100
Message-ID: <CAMRc=Mc7fc2sM41oDNhCavvfZHCzwv2Y_ToquFwD+BhkVHwbhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Andy Shevchenko <andy@kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 5:47=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
>
> On Thu, Dec 14, 2023 at 11:08:05PM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 03:56:37PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > While I think of it, what tree should I be basing on?
> > These patches are based on v6.7-rc5, and I'm not aware of any other
> > changes they may contend with, but best to be on the right tree to be
> > sure.
>
> General rule is to base on the target subsystem tree. In this case
> it's Bart's gpio/for-next AFAIU.
>

Normally the patches should apply on top of

    git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-n=
ext

Any conflicts between maintainer trees are handled upstream.

Bart

> --
> With Best Regards,
> Andy Shevchenko

