Return-Path: <linux-gpio+bounces-15634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F34FA2E54A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 08:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1013A5987
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 07:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9951AF4EA;
	Mon, 10 Feb 2025 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV/g9p6i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68591922F5
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172242; cv=none; b=Q9P2vdAYl9COkxsW7y0tL457U/TtLC3IaWx1HMmpRs0uj55eibPphePqETv60p7TIyDXn1gfTXOAKbsl6ocjLIEn2YCYmZZIoLaGXUL6nSzrpggwi1Vf8MEYnwzLLJSBEYe+/xEOoZJ9pv8qaHoA30phffD66U3kd9NWAnuXdoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172242; c=relaxed/simple;
	bh=OiWJd35iWVFf4Y2xS6UklReiMHDXo1tzdGCC3otarB4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lvUHWHujPoOb4TJ85oWM1/hWOGgvk06AwkVWX5MOqldXBImKFGYD+yawr3kO6pTYOyhNLAgz5D5u5TR7RK1tkf8cgt03Lg6occ6kgs8XuKbh5jrWM5P8ihlJhcMXmVh1wPMUWpgRBgXm35rdUQKN8KnJ6TY2J2mQ2vezkuW3XQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV/g9p6i; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5450f2959f7so157538e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Feb 2025 23:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739172238; x=1739777038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w8iLHkhzG86wDPvNohdrJojcK5rqpONBUFEW2U4xEl0=;
        b=hV/g9p6iJs/lNkmtcTXsiqjMQc/5T/YIZvGHtwqbVDh+XyTs+7Cr9FkOBVCO27vdOP
         cph1jSItIrjok/U2w5HHCRNxyvP2/E2/WsCACDpkLRX91qPawx23H3iWgP7I8EF/O4iJ
         X9SRofVHGBlfhXoWlLuBWy9t7RaY44+rJxnxo2EEiKOnE+gyZShma114hAYXnLbHesB6
         lxJBPGl+FKSzqFlCmoWfR+aPOnufv535m8Cn4OQS2/1Y/KblWd1kqcJdbjaDoIx30Ybg
         SpXA2s0DhC3Mc6j0hm8YAq0FmdKRfcvsamD+j/f8uij30gj0xY0EGSgQHbQ0s/PEPgHM
         FuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172238; x=1739777038;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8iLHkhzG86wDPvNohdrJojcK5rqpONBUFEW2U4xEl0=;
        b=It6jFVzPkGraFj0mmNbiV4xpvGPsrIWMUWIVjVg1FQaJizs3ofZbfs/9G3PzHKzfhH
         fQCBscUfO89M20F/olrVumwjrmZ56dSMYYxAMVaVCsFTwl+5VflGx74uZSIK8iVZLtoF
         BWU7jeWpHXWC1V47N+0th3O8mxYvNiPeqNFXL3zHFIBMNKjkeHEsBPEU8IRVZWvkgSFU
         bs5s1t6zCvcO3Icd6sOYpyQEBgiS32I/esjEQewa8PmlJYTt7mNMpLtDoKuDrvYV02Jn
         VwBAa9e1Lh0yfnzGGs5hhSmAvDS8ngbMtqomjuJ++2bHri6vqpIsVqEr13wWbhIWmPV/
         ma4w==
X-Forwarded-Encrypted: i=1; AJvYcCUYqyKURacFgrAK9km5WDsdWh7cZJYRT0xWdzEO9HSM6BGaay0hhdkHB7DZPQBkDdD+MH15J0u2Ce4q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Savwo54YRLYvl5fa/y7+PhXfq99WAGoFxKHvL+6qyc9UbmSC
	STSDOk7h7xIAjmRHyZTd/HcYNVlRh6+/fMkrfnjhWShLFJc6KcDHehNHR55ZktSk9/Fr1Rmjg6R
	LZipGjjDRFypngkXvmb6Rb8QZss8smK4mV18DDA==
X-Gm-Gg: ASbGncsbl+31reZiAqMeiMDn5B7/cYe9+ew8JArWFJ1xeiK99xRDPBdJ4EiN6Z3I2NW
	oOx+HgTm5REQgThPGdbCXA5FksGnGZe36zV/iXLABHmU45zDd3TNFZyTquDq2ZDrLt/oxH3um
X-Google-Smtp-Source: AGHT+IGliKIx1mYciy+bEb7xJhM3llANWo55qVgRc0LhCkuDYjEIYf9Rg+VmsAgxrgYk7e9FKnv4nNn4heOp7q2dLBw=
X-Received: by 2002:a05:6512:3e23:b0:545:8f7:8597 with SMTP id
 2adb3069b0e04-54508f78639mr1527292e87.16.1739172237799; Sun, 09 Feb 2025
 23:23:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 08:23:47 +0100
X-Gm-Features: AWEUYZmQgjJ6MaKMj3o-uvhuomExAXgYfgbhPztYDeIHIMgHKNxCMkwAh4Ry99g
Message-ID: <CACRpkdZh-=7qjhmjDwqLGLnuoD3QtKyt27Q0qAZAP0Xw23-o8A@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

a few pin control fixes have collected so far, a driver fix and a minor
debugfs fix that I think we can take in because we are early in the
cycle.

Details in the signed tag. Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.14-2

for you to fetch changes up to 0af4c120f5e7a1ea70aff7da2dfb65b6148a3e84:

  pinctrl: pinconf-generic: Print unsigned value if a format is
registered (2025-02-06 10:13:15 +0100)

----------------------------------------------------------------
Fixes for the v6.14 series:

- A series of IRQ and behaviour stabilization fixes for the
  CY8C95x0 pin control expander.

- A print format fix for the generic debugfs output.

----------------------------------------------------------------
Andy Shevchenko (5):
      pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
      pinctrl: cy8c95x0: Avoid accessing reserved registers
      pinctrl: cy8c95x0: Enable regmap locking for debug
      pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
      pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware

Claudiu Beznea (1):
      pinctrl: pinconf-generic: Print unsigned value if a format is registered

 drivers/pinctrl/pinconf-generic.c  |  8 ++++----
 drivers/pinctrl/pinctrl-cy8c95x0.c | 42 +++++++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 21 deletions(-)

