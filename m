Return-Path: <linux-gpio+bounces-20402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D138ABEE41
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABDA17A6B4C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD82235049;
	Wed, 21 May 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bX76lSHT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201922B59D
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817072; cv=none; b=f7+MX+RtH+cgwYUUY4ga3C3RZ748WIaXAn8/uMzyyvPnNkTie7rpZmmTRf2XKeqpneb4aGP0b6bHli46wsVT5FMi8frfSrGSXW34Y2v04dcAW8szkn1rlpbZ9OY8pz1ZUAPk/JtkZtzQN8qiEyqol7SJqM0b7IiFaU8QewlsSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817072; c=relaxed/simple;
	bh=Xc6nnWeUENbIQdS8P6ujel/DEfYOqSdmKETp6S3e5mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcG1Mcd7QvFDzXZaUgTXHJc/LbouxXM0RlNgKu2IwViUjPqtmRcKt9Klg8vNDKY+CJpoxcSTAxe2EgYweUAxeYcWIVqviZduNFRqBE/5777oloKk1AwhYLhyg4b3uUcwrulSZIWkhfgSXjmzVUaO06zXVRlXxjJZvxewejH2cQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bX76lSHT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7539429e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747817068; x=1748421868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9orwXwStAfYa3jvkNTvHqJCh9mNzKgIEwjLmibaYs8=;
        b=bX76lSHTRUME4awC0SGe59DNeVsHhOKbG2/lH5PQvBdAL2szyy4uqSKB/E2N6F2+vG
         cCZHU6TySF5iGglhINv2LBzzbD1qeLX7kG+ZafMtChDOUl1W6ZwbTnY5Lw47P6HMekpo
         pWB2IFQSZmMB4/6ZjuVQVdz3Dbt/CzJMIVrQHwXFX0h3WPiMAISCUn0HLWHCldkUTdQt
         hL3D/QmNRjRuY+/vWWXKXO6C5YJISRaox6kEcRn1laVfje+iexIFUbdEFe7Gq336yGCc
         5NvYMiS77Lb/x83qANKW6DOYV7ZLiFhA+Lw3+iCmRZeJJjdzw862AYiHqdQfk/ewZPV6
         1RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817068; x=1748421868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9orwXwStAfYa3jvkNTvHqJCh9mNzKgIEwjLmibaYs8=;
        b=FPzZ7QYAUS9pdBwoTpSUivB8N9qniMloWMwOachuKSURM1B/BXsC6NsvMJtbhKClBg
         xy3wInN8ER3mWZ64ALA6kzO9wph4W6f/7orHgigyTIIqemHwRGCNW1VlSc5D80ZYASIq
         QbqTVE9U6ZGmegRlBWIGT0BENhnn9Zd8V8c0N5XNIq03V3KMdoRn1Sn86xj3DV17BWhR
         j+cLiIyVvo5MSkpTA7oNLDsY/W0n6zv7wAhE59hy/O4seC3QIyLiHTFVoB5odP5U/jWt
         owk83VhaAw1L+oR6t5Rxf4j3A3Ij08nMpJhsX+cCFDn8WHlmPVHA6Z0uw/SEhijkEIF2
         1H3g==
X-Gm-Message-State: AOJu0YxgovJdki2Fn5fdNTic92GB6rLklxreofZ4PcN5Vgg1gpMNMSjL
	927Ch2r06hkbJuSIiIXYK49GcH0XI0719rP/UKvmCYlDtKkeUYsEmBOY2oYSBhjoGOQgAVUcyqK
	CtQdZqq0wOEp43MyyLj4rbobv1rElgVBHmS0feJ1JW5ys5EZbDDTm
X-Gm-Gg: ASbGncs6YY0JCNYrPkmAyHnwGwytddtCBdTUVpliqtybKEOBH2vIr3qL1CiCeyFJCNZ
	BEN3Gn60dJKzw0JW4JWnOU6ViQBdFjGNzP+p13tb6AWvD3zH12iqUSfM5cfOroJl1PsPbjbPrve
	URtcFBjct+tOIHt/PVAZS3aM8PaF71CVSOl8sq5FVXitOCAPt50FjQ1xtgcYJFpwB8
X-Google-Smtp-Source: AGHT+IHZZIVzSQB850KQKv/yA7XCh8mK14xbBcNtsqiGT8sakdxdWxwd7VqPNsRnTA819Ed6VxMxeDvXB2jZRH+1sg4=
X-Received: by 2002:a05:6512:b28:b0:550:e5e5:865b with SMTP id
 2adb3069b0e04-550e727bbd9mr6445271e87.57.1747817067691; Wed, 21 May 2025
 01:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
In-Reply-To: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 10:44:16 +0200
X-Gm-Features: AX0GCFtPFtffaelCQC4jCLOI8VHifeC6jZWKmQvtWEfuYmWUsnngTDoo8uMghLs
Message-ID: <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 9:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> The GPIO ACPI code rework is in this PR. The patches are in Linux Next
> for at least a few days. However, one regression was reported and fixed
> immediately, which becomes the last patch in the PR. It wasn't in Linux N=
ext
> since there was no Linux Next on this week. Nonetheless, Randy Dunlap tes=
ted
> it independently, that's why I include it into PR (without this the check=
patch
> and make htmldocs warn).
>
> Please, pull for v6.16-rc1.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.16-1
>
> for you to fetch changes up to 6f09a17d60410e805ae112fbbfa3ed8ecd0636dd:
>
>   gpiolib-acpi: Update file references in the Documentation and MAINTAINE=
RS (2025-05-20 22:30:51 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v6.16-1
>
> * Converted two Intel GPIO drivers to use new value setters
> * Split GPIO ACPI quirks to its own file
> * Refactored GPIO ACPI library to shrink the code
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Update file references in the Documentation and MAINTAINERS
>  -  acpi: Move quirks to a separate file
>  -  acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
>  -  acpi: Handle deferred list via new API
>  -  acpi: Switch to use enum in acpi_gpio_in_ignore_list()
>  -  acpi: Make sure we fill struct acpi_gpio_info
>  -  acpi: Use temporary variable for struct acpi_gpio_info
>  -  acpi: Deduplicate some code in __acpi_find_gpio()
>  -  acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lookup
>  -  acpi: Rename par to params for better readability
>  -  acpi: Reduce memory footprint for struct acpi_gpio_params
>  -  acpi: Remove index parameter from acpi_gpio_property_lookup()
>  -  acpi: Improve struct acpi_gpio_info memory footprint
>
> graniterapids:
>  -  use new line value setter callbacks
>
> ich:
>  -  use new line value setter callbacks
>
> ----------------------------------------------------------------
> Andy Shevchenko (16):
>       gpiolib: acpi: Improve struct acpi_gpio_info memory footprint
>       gpiolib: acpi: Remove index parameter from acpi_gpio_property_looku=
p()
>       gpiolib: acpi: Reduce memory footprint for struct acpi_gpio_params
>       gpiolib: acpi: Rename par to params for better readability
>       gpiolib: acpi: Reuse struct acpi_gpio_params in struct acpi_gpio_lo=
okup
>       gpiolib: acpi: Deduplicate some code in __acpi_find_gpio()
>       Merge patch series "gpiolib: acpi: Refactor to shrink the code by ~=
8%"
>       gpiolib: acpi: Use temporary variable for struct acpi_gpio_info
>       gpiolib: acpi: Make sure we fill struct acpi_gpio_info
>       Merge patch series "gpiolib: acpi: Fix missing info filling"
>       gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
>       gpiolib: acpi: Handle deferred list via new API
>       gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
>       gpiolib: acpi: Move quirks to a separate file
>       Merge patch series "gpiolib: acpi: Split quirks to its own file"
>       gpiolib-acpi: Update file references in the Documentation and MAINT=
AINERS
>
> Bartosz Golaszewski (2):
>       gpio: graniterapids: use new line value setter callbacks
>       gpio: ich: use new line value setter callbacks

Hi Andy,

These have been in my gpio/for-next branch for a long time and the
ones in your PR have different commit hashes. Please remove them. I
don't see any notification about you having picked those up neither in
my inbox.

Bart

>
>  Documentation/driver-api/gpio/index.rst            |   2 +-
>  .../translations/zh_CN/driver-api/gpio/index.rst   |   2 +-
>  MAINTAINERS                                        |   2 +-
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-graniterapids.c                  |   6 +-
>  drivers/gpio/gpio-ich.c                            |  12 +-
>  .../gpio/{gpiolib-acpi.c =3D> gpiolib-acpi-core.c}   | 522 ++++---------=
--------
>  drivers/gpio/gpiolib-acpi-quirks.c                 | 363 ++++++++++++++
>  drivers/gpio/gpiolib-acpi.h                        |  15 +
>  drivers/platform/x86/intel/int0002_vgpio.c         |   2 +-
>  include/linux/gpio/consumer.h                      |   2 +-
>  11 files changed, 497 insertions(+), 432 deletions(-)
>  rename drivers/gpio/{gpiolib-acpi.c =3D> gpiolib-acpi-core.c} (72%)
>  create mode 100644 drivers/gpio/gpiolib-acpi-quirks.c
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

