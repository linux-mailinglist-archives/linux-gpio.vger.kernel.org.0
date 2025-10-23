Return-Path: <linux-gpio+bounces-27507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BFCBFFCAC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81DC44F53A0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236482F12DA;
	Thu, 23 Oct 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yvbhdzHC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186582EC08F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206869; cv=none; b=OOhPyohYOU+XuEdTFMabeEimeBKTsDwBVvWfgbOz2UgH4QvRQVVnytxC2J4nQ//PdXrd3MUmIaxwLbHNhC0GBtyBa0YrrEeo7Nqao8Th1+UBstSfv9GL7w3M2oDHczTsnlnwqwXR8eSpbDu3BayeOcMzA8MtcZKQJx3yvauiATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206869; c=relaxed/simple;
	bh=TraScPU6NU+V+ERcazDNhi6zxsgaktJMzK6mNUWp380=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpzoVN4+wZG7UnsUh7Fmn52c++EzZlnioq8BSm4f+wLPgB+6lQHUmfJJ2s94hJY3vDdkN6d7s9YBkFrYh2hVnNMQC68qvo/2PXe9wiAFgVu0Vu6CifpzHwy5SwD7MGkzIrlppTtOEAU0L+bgXCgFFSyBspdhBzeEvVrPIBhq2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yvbhdzHC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57b35e176dbso646235e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761206866; x=1761811666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxi1alXieAuC5J0/Q22IwFOyat4mAqclFNKwNnjUVSI=;
        b=yvbhdzHCX6/qXZK7kz/kJwTFFnQCVtpPM5bKYD5ZqgfIFmPrcxjynAVm+BcMfAHk++
         W2Gyg6ZQlBVOEITDBLqpMNGAE6qtDaYXeVMi4GHRDi69sjwSinDGSlENoeuzpb2fF+Uo
         Cw4sa06aaHHKZTgaScZ6An6hbw8GoygawjTnoMGx2Vr/Ed0A22iq4Q+z5V+9heHWYVSG
         37c4xLQ7Clf7ZvPXg+ZaHzDr3qidhLlZ/nx5WilB9e/XPPWj5O22P9IuQAW2S+w3tOXS
         BQs6iY6Z7brLqh3fQqEPwQahoOSgLsXBB/gOF2EMYcr55kiz3/U70TreFrY5XSgeJx6G
         /8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206866; x=1761811666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxi1alXieAuC5J0/Q22IwFOyat4mAqclFNKwNnjUVSI=;
        b=hFl2qrXdfQ9ByI/UaiK8ttsPm7/44/YY1Xt3U8qpqLidy+Z542o/tfFadBeqZv/Vhq
         hUI4eYtt/Y4uB3LLtqm3xnhzeOR5P4CZ6nC+YrolVpwdrYkMB1jsLF2NVNe923wur6h+
         ITDlYCyBSYW0+TJi+wkWWaYO/TBkHouva8Eu8r+H3WMe2N/o5sIPpuJMwF7X1bTM7tJH
         jXooGc2uSR6NoUs/gbUDq0z+v3JPQOgedi9/8yKm4EnSyVdayhTEcalo7rcpwlmCS3qG
         RYJXtjibtFKZ4tuTZ58eaj3/42LXw0K+npdo81EXXTqONp5c8wOcDr9m8iIpMSgmy510
         Ei5A==
X-Gm-Message-State: AOJu0YzKZ8EbKb35IfjMqpbMbHU9eheFlJuJnrdX8MYE8Yv4/JIr9wDy
	a7j0MllXPiHzOT7UD48NMaVxU+YG4sGu1y/ps6EsSg1QFl7Hrq6h8vg7e8jYKdsYKA3JbZpO46Y
	PKnNIQpT3DRqYsiR8vKCQjtOIuci6YccAbecDVcvSKw==
X-Gm-Gg: ASbGnctrxP7TwC7GYG3214pAgvi1ai7eQD2GL8/bhcbCjza/1c6ZTvDrDhbFMRq8bP9
	d9IK9C1J69aaxqLxCiVFnXqGfVUkYfdi5T51RAPZ8g04PU9wo5I7hob/atJVGIFdomUCENrZqnG
	o50GCgAZjxZ32vzWNfXfwshwWB/cSgP2ShnZQuLfYiNB+DOh2V4hkSkSrv7hJTphaz7QqFbtK/H
	kgQGY2hxDhToJCCgwj6bS3lVSas6gjzJJW1j0Zac9AbPA+YiDeE70xVFi7Mp/adE+HQBIivI+TT
	ejc9wXyV4T7aTdY=
X-Google-Smtp-Source: AGHT+IFboBR2csFNTbcg+eI2edktIPP9PA0qtG/QRxh0LZ+LM1+RSz4dwzEuGIww+Imm2W2ng0ZbKuCnEcJUIKg+dM4=
X-Received: by 2002:a05:6512:1394:b0:581:f381:4ebe with SMTP id
 2adb3069b0e04-591d84fcdf8mr7632684e87.22.1761206865976; Thu, 23 Oct 2025
 01:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPnfzZk30goFltb2@black.igk.intel.com>
In-Reply-To: <aPnfzZk30goFltb2@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 10:07:33 +0200
X-Gm-Features: AS18NWBMraYRxQiynRxhOjNu_Cqw1zXnCOPPqDS1nSIvSfN2az4E51Zlu8aeFlU
Message-ID: <CAMRc=Mfd_DxLfBqXKhu7B9-QLwUyB5mZH5Y=5=pzq-WEeDdkvg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.18-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 9:57=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Emergency fixes for the regression found in last cycle. Please, pull for
> v6.18-rc3.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.18-1
>
> for you to fetch changes up to b1055678a0160b2952c322ad1b61805562698f99:
>
>   gpiolib: acpi: Use %pe when passing an error pointer to dev_err() (2025=
-10-23 08:40:46 +0200)
>

Pulled, thanks!

Bart

