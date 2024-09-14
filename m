Return-Path: <linux-gpio+bounces-10108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A89790C7
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 14:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2372C285EC4
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F8A1CF5E0;
	Sat, 14 Sep 2024 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7zSDzxp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B491CF29F
	for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726316316; cv=none; b=LgEAVQW6LQSgSiX0wWy3FN2DEwvsoKMxPXBr1hxUtCOF8W/eu3Px2aVnNjk14cmWJLba1/wOWPehmcb61pUGD3ZvFhkCiLSE/iirNADWc72O2eYfTswUl0Yr91gWZcepM3eZBnYTxVLtBrTQcTwtSnWwuGiIRI15OykEFz3d4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726316316; c=relaxed/simple;
	bh=6WgcFIuXhZambpMrMXuiFxzrEsSHTzWg7o+MZz7Kr8E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WCsbjl2Oad1VMDM8UAqMmU54BnkBF8xkmI3chDCw2dWqII7Wvj8UbL2LMLgiUWRLgUrKBMQZmMtobEe3KR5PwjH4wCDMnc4reVhOMJ7y7hZ+2YaCJ+i7J1NKiwz7RboxPC4ooQPx/MhlPUbafaKu8cL8MzAkpTgRSeruiCgYX+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7zSDzxp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53658f30749so3370144e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726316313; x=1726921113; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3QgMqp/8uVFm4jkeSLqln/P/h5yrBagw+LmErv3bnxg=;
        b=R7zSDzxpZUXaLi1p7NoCM/zMvN2dfojwITWh9SUYEMxGXj+el1J8daJQBXEu8IcM4Q
         hN+nBz7rFYUk1g+J66fy63HZYQWum67cjyeu+vcZq/3E6oSUoOXrh9XLOCoWs642sccc
         bxxGtIFM9YCAAt999tFh7LtWZ2wM3HHmOmAcgE7YOULJaBFn+40rd4NMiKG0KrfJwIck
         gn6OXhAVJ1qEkxjblBzCdGPVSTAlRd3dtqFBMbOUsrhQZUySWRxSp+e9J0M/cK+w98uu
         DeDfHZJ4cM0hDRpYFHbeEGZd2dL8zrX3Efz0jDw9Z0B/6y4Fbp+3Bu2KOPhZ/fpi5iS1
         Y1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726316313; x=1726921113;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QgMqp/8uVFm4jkeSLqln/P/h5yrBagw+LmErv3bnxg=;
        b=LD2WONd4gOYZnt8o2dcAKi+lFEsupI1JupxI0Tt0X28TOD/0jO/X7D6Rokea77LlqU
         YSzmX7wTL3JQhRwYrf2NUbLQ2KXT13hZ+CS+2tOexXpO/e+krOPy3CECOiOnQCXnNFjk
         mc4+FiP7ciCPztyzgSPnXhbINq956nGVnjcLWGOh36PLvY1DrIRZyPUQZCsDCHGF/843
         k4yRjOhDkGCoCXI1LRDAdJrU7244yBo+8xGehvvs+7sNP7v5Dktk19WPTjJtSAkpPb4f
         wq2F0LyGdTlWWg77jwfyQ0kyND+VV7UWU976Y8KdyrHRvu8+yeX3wodZFXmt+2PSHKsu
         N5og==
X-Gm-Message-State: AOJu0YzkiP8XHXj+kwdapUrUXQiuvnm0rdCmGc786Rfz9wB44s2IqqNB
	Kynlywa9Gvve7QzRkruI+aHMYeDVvr5iqR0OiD3yPUXRA2YoJfElUK0U5pVOddvToQdzBV1wIhh
	ztJCoKnRPcxrFu6M/Nsta9je1VH24Y0XSEoXOBpi6PP2L0mSOEW8=
X-Google-Smtp-Source: AGHT+IFgp1e101wkvrRYAAv5mSozVdMrz4VSYt8xJVi54eyR6cour/J8MzsnwHiGXG95yg0rv1yFO1vg4AyDVI8N5NY=
X-Received: by 2002:a05:6512:4022:b0:533:4b07:a8dc with SMTP id
 2adb3069b0e04-53678fc230amr5819668e87.35.1726316311881; Sat, 14 Sep 2024
 05:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 Sep 2024 14:18:20 +0200
Message-ID: <CACRpkdZDSTDC8xThy5jRXtrYqaOTLPcc2fuoiGSMQaQ1B6FSaw@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for v6.11
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some late fixes for two pin control drivers that should
ideally go into v6.11.

Please pull it in, details in the signed tag!

Yours,
Linus Walleij

The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.11-4

for you to fetch changes up to 71e4001a0455ec2b6218715c81f374f1ab8b1b12:

  pinctrl: pinctrl-cy8c95x0: Fix regcache (2024-09-13 13:14:18 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.11 series:

- One Intel patch that I mistakedly merged into for-next
  despite it belongs in fixes: add Arrow Lake-H/U ACPI
  ID so this Arrow Lake chip probes.

- One fix making the CY895x0 reg cache work, which is
  good because it makes the device work too.

----------------------------------------------------------------
Linus Walleij (1):
      Merge tag 'intel-pinctrl-v6.11-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes

Mika Westerberg (1):
      pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID

Patrick Rudolph (1):
      pinctrl: pinctrl-cy8c95x0: Fix regcache

 drivers/pinctrl/intel/pinctrl-meteorlake.c |  1 +
 drivers/pinctrl/pinctrl-cy8c95x0.c         | 14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

