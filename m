Return-Path: <linux-gpio+bounces-1625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620B817548
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 16:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1770B223AE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 15:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59A43D574;
	Mon, 18 Dec 2023 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NU+qIRBb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D873D54A
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7c51d5e6184so964608241.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702913598; x=1703518398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOIzgqju8uFofUCDDly6gslT8lnwVtboFBFx0UJQJso=;
        b=NU+qIRBbklIMfV47OD519hAZqQLMykk+kTAQl260YB7iucDjs1BrxBRqEhelDHVd94
         WXHHvZPNlDCnwLXlcNIBWTex0DeRsFQcVYAmzhfR4q8NWwS8yrWVjBnVdEAwsPX8FFeW
         7O0C4Lnr1hEF8UZ5fhjCkyRyfmWJWafSuJudsrfHL/5fppRKawZ4b+K1XBaElvxTnO4B
         p8GWFUPiM3Fj5mBXBVt4aVCxkwVsIe0mjGE0OxGEcd7x9WoikOOft/SImhJrIlUgiA0O
         dAfcijvHH4yaUhImdguldqvIvpCowpQn86+P4cROxpNPYI1z+CyxPaRKZZcMhlDglPin
         J8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913598; x=1703518398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOIzgqju8uFofUCDDly6gslT8lnwVtboFBFx0UJQJso=;
        b=an25vVaa5uPcnFfYkGtWoPCGIAlHTD/yldTBVsaqD1a1hu/U3Uxm/J0P71sMwXYo64
         5otdZimmwaXWGwPSQQY88VImhbCZ1+xMdLlNc4Y39zljuREF+bOUWemL6LF5lmRRTe57
         XEaqLApGUBkMiSVRfGfU8AH0hFLp4Vc+7nNq/cIsiDAyPkkT3IXCJ+49HRcp/aaE+VYK
         gaVuvJw1y4k0UwYUVx4dhZgrOyTUVD3dRx9OqtMNdFEfNKHdSqE1Nh8TvhS9giGiFiuG
         rj6KQI0pBYcl4Ct/oWQz5bCB90QHMY3qWuEROxQVhgQYfGxgCytbQyYyvuEhdRyRF/r2
         fbcw==
X-Gm-Message-State: AOJu0YwcSXNFiZ4m1Sb25AxVcKMadw5nCz+eiFgXsharVTvPnSKMV7OI
	+i1qKFYgb7YWNhQZUduMkpaRNHti6AdtWTIz46kxEw==
X-Google-Smtp-Source: AGHT+IHxATbhN+Wr6VTcaavsfmOY38pBHoQqPyGGw/QyJZm0y6ZMpwn9O2gXuufEhDnwx9R65BqPsk+PMSYWHj7AeBg=
X-Received: by 2002:ac5:c819:0:b0:4b6:c781:a97d with SMTP id
 y25-20020ac5c819000000b004b6c781a97dmr826007vkl.1.1702913597574; Mon, 18 Dec
 2023 07:33:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZYBJzHyrI92KiPSP@black.fi.intel.com>
In-Reply-To: <ZYBJzHyrI92KiPSP@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 16:33:04 +0100
Message-ID: <CAMRc=MciMU+Hv3K9FVMYMRWZCQKUXCHh6bsSMBetfY-qYwL=Tg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.8-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 2:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> A small set of cleanups for the Tangier family of drivers.
> Has been a while in Linux Next without any error reported.
> Please, pull for v6.8-rc1.
>
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.8-1
>
> for you to fetch changes up to 92fc925f838660eec25862a7fa7e6ef79d22f3ea:
>
>   gpio: tangier: simplify locking using cleanup helpers (2023-11-20 13:33=
:31 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v6.8-1
>
> * Use RAII for locking in the Tangier family of drivers (Raag)
> * Update Tangier family of drivers to use new PM helpers (Raag)
>
> The following is an automated git shortlog grouped by driver:
>
> elkhartlake:
>  -  reuse pm_ops from Intel Tangier driver
>
> tangier:
>  -  simplify locking using cleanup helpers
>  -  unexport suspend/resume handles
>  -  use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper
>
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       Merge patch series "Use the standard _PM_OPS() export macro in Inte=
l Tangier GPIO driver"
>
> Raag Jadav (4):
>       gpio: tangier: use EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper
>       gpio: elkhartlake: reuse pm_ops from Intel Tangier driver
>       gpio: tangier: unexport suspend/resume handles
>       gpio: tangier: simplify locking using cleanup helpers
>
>  drivers/gpio/gpio-elkhartlake.c | 14 +--------
>  drivers/gpio/gpio-tangier.c     | 63 +++++++++++++----------------------=
------
>  drivers/gpio/gpio-tangier.h     |  4 +--
>  3 files changed, 22 insertions(+), 59 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

