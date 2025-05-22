Return-Path: <linux-gpio+bounces-20461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B3DAC074A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 10:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3597D3A512D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 08:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657B626A0BD;
	Thu, 22 May 2025 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rR5McHqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14F26B94F
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903158; cv=none; b=cuhttIsc3QceMtvTpI16PaH8RrMetQi3Syqvcx+zkFGIsGQmW1qJ9c/PscdO6Ls6MuoQaGeA1VNMQyz7cdlGJ/X3SVEyKzm1bpWkHlSVZE9t7cMWz7VG4y/3xXkKQy46pUT3FTG5LkmpjHFMqNGroPnijVShV2l8zYoPBWIen+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903158; c=relaxed/simple;
	bh=tznesHqeZytUQBxsCKufL4tsD5eNcOjqiXA4b3qJMvg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=C58ZpX8eL6k5I/QBEqujfkPWAulhO3t+7Ja5Ba/CVe4d/BRO6mwRrWnEx3xhkQxS+I90RMtE+6Didz/y6QTB/P2Bh5e14c9u790NWkca4lArD4VG1xxGTy/bmxC+Dq/xL1hsA9NjxIGKeRr3zsGplVy0t7nWMXkiKojsC0wKulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rR5McHqp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso70469901fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747903154; x=1748507954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qMhmNskADhrsN3v1DxlLOqwp8G2YfbYOwBOnwBv83D8=;
        b=rR5McHqpJlrqkKpCbfJ2WNyKVzJbKo2Z1YP+ZMfzasgn5bdjOEnbZu5KIuSWbB8fc4
         ye4QCP0TX/hHHJSKl4gbHz0+pOr4SIAhiUWELNsAyheofhhfcK0QLFMwmJSDlIoihXuK
         eCnNDqYh/jiTc9nVoLXqNHeONZ+UJt7jFJMDn6QHYdDzQSRP4zivT1gv3V/5K1MsIjz3
         0X30bi8BPhEUQyaZQO6/O3EJagp3u1LntYqZypbtwy9zJWJ4apVL4trNb366VjZB+8YT
         upKQa9PKWf9b1K77p3hHW8Xld3zm102iIQ1Nyzx1W+kZT6/SAqrs8cIbtSEGvm8bOcoT
         sy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903154; x=1748507954;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMhmNskADhrsN3v1DxlLOqwp8G2YfbYOwBOnwBv83D8=;
        b=alqK4K/XpE78sUBo+9T0TzHkFHn10FfBm3O/ugKwpdQIi12iqDArbl7iTaqLV/P/fd
         bU9qWan9QQgki1KbqShHQ8W8ZamYZIP5brqcy+xNh+4uw3yO5JfIck47XesBw+KwE7dM
         cmcmqFvQYqozAIVN1VECpEKkhqq3BVZ3vRZDgNLFegUzlujIV5yptrdATkebzy4aenpd
         bw73hhcLvPmoMimi+ChbZcnFoQwuaA3+/8C2oFqqo5jQXFEmajkgsYogyiECOAv/GGg8
         rz5J6Rqy1SSbM1R2cU/FQHQAKSLJe+FUMEwmM1TH5Ff/5xlJ/UhU+4emEgdyCgCj2VAF
         a8IA==
X-Forwarded-Encrypted: i=1; AJvYcCUmq7Ix54WN1rfAVleLZ9JYflVIKsTuwEZ4nVMdwa3pr7fEtLtldUDG/+9+/kArxuWeYPFOQ3qZaouc@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKlJcbcqUInYoDquC79odXbSdVqwAvkY0aWcsfXpim0+BFAYk
	Sd9MkKAS/CRVZqbDsmJQDIVMRufecUQ2ts3+TCmdaEqoqEsLamPuZxmQAuCIGreHW4vEHOFA0FE
	+rA+BTqA63VuPQN5ekakmzZDnqiDpf+bbJNiwEFYEC8DWEySe+XAEpn0=
X-Gm-Gg: ASbGncvJdDw4M8sj9PxN97jb+RwDjpOS5Ka3ykvY42nqJ7f0WR/YWgCBFPufsYcFHIH
	hrFn+F1OiKJm9wB88uaHZax9RHbThr9MEf1tdHbq4L8t14+oQn1kWuDCHr4PilcDomJ4Zwckpnu
	Y3iRzoYBQ8Ax7DKbiim3iPpcAwMeGnjdZp4CaE/iAG2yI=
X-Google-Smtp-Source: AGHT+IF5P3YyhMqZP4RT6l7E1iz5hMh6P8bMERqdor0RMnNXGUnxHB4+ImovRLcw/3knetHVFpP+GFf1niTI9bRIZUk=
X-Received: by 2002:a05:651c:2229:b0:30b:ee44:b692 with SMTP id
 38308e7fff4ca-328077b2d17mr98326021fa.33.1747903154140; Thu, 22 May 2025
 01:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 May 2025 10:39:03 +0200
X-Gm-Features: AX0GCFu1eG7CL_G1brUAj9AgP9YxI-nCFQ5opBOZ9pyczqf7w8M-DcNU6bcW4UI
Message-ID: <CACRpkdaEmKn_0QObo9kFrgm2TajepUFjcgK8CVn-u_zMmoEO8g@mail.gmail.com>
Subject: [GIT PULL] pin control late fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

these are two patches to the Qualcomm pin control driver that
fixes a late discovered problem.

I first tagged a version with an additional cleanup patch on top
but realized I can't send that this late so this is the diet version
of the fix.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.15-4

for you to fetch changes up to 41e452e6933d14146381ea25cff5e4d1ac2abea1:

  pinctrl: qcom: switch to devm_register_sys_off_handler() (2025-05-20
23:41:29 +0200)

----------------------------------------------------------------
This concerns a crash in the Qualcomm pin controller GPIO
portions when using hogs.

First patch hits into the gpiolib making gpiochip_line_is_valid()
NULL-tolerant.

Second patch fixes the actual problem.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      gpiolib: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()

 drivers/gpio/gpiolib.c             |  6 ++++++
 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

