Return-Path: <linux-gpio+bounces-17849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9435A6B996
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAAA646174B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F822256A;
	Fri, 21 Mar 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3g50xWj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F098221569
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555304; cv=none; b=lWdvUPdV4J7etU4c5fElHAi5g6AifmihglZoPKkNUvuLZWVvUT/4KCwjyoc9Ui/BhOWY6bLUCCreBy7lpuMy7iqRLfomro0BOmqp4KTEXKaWGF0bSXLwBozoL+RQ8KXup4fcM8pq4DsvDBxqcYEb61zE68Hg3S74oRjym20zI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555304; c=relaxed/simple;
	bh=M8ZhcFzgo1qUr6WqtBxxVTcQE+ezPBUlBsS4yjf+Bg4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WVdmwz/uduzDebPGkktcYVl0pzOAXW3itPapuwjnwgjdAI/4/Q7cDl5K1XUY+dHcrAmqKD7C1sHC5IK/fqaW8x5Au+idalgaMzt/rHPvvpBzl2GGXfSSMkdSVngt3GCpbSnnCxu1dRAdKDwVaie0ga6eAYc3I62J9I++VUXBD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3g50xWj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54963160818so2329651e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742555300; x=1743160100; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9uTbQZ092JuZXjGN2SjDeU4J122DG1Eo/bVWN2DKb6g=;
        b=e3g50xWj4Z/9g9kqlddqU1dBWJwhg+JCbaGt1xFNSOmKdMDw4OqTGqIlMKAu4e8Yy0
         /XUz/p4dQD5AvwAgeK77/TS86i7NV8j4A3tgO3rUZ4nRxYXd+JXItmaD9FORIQ2Dno+3
         F88+wNYCBRJh87kHjoZazXzQPfdlCqfDdrIyHroX6KedYEwXuX+u48+NkKIW/d4b49LY
         +eIRSUfHygHh7P5kqt3Kggh46FsS/pSBmKOD4cbNNgI+E1TjSOJP+lECa3zSza6fHPj+
         MZbVjHH43m/bR1g9x8zOZo6AszjYnHnWMZQy2IqJYoFbLBOrttECs2i0/s6ygdmQa5f+
         vKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555300; x=1743160100;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uTbQZ092JuZXjGN2SjDeU4J122DG1Eo/bVWN2DKb6g=;
        b=NGPi9I1y0SJVmIWRw31xDUHyN8b8Q4zWoQgNLtsobY/4/NzFWcfI5QnK+uGCHEKZwO
         A2yoijw/EyFYKZ85t4mGn3uL0LA5+3h7yu5albbsbfl/3KGYDnRXW4+JbcDshPEmKIud
         alkAUC2XLKWPMC61ZZtyqvQIPRIdeuMUbdRZVLc6kkTEb0Vl5P9Pl54Hkq/qiLPpzNsv
         MN6r2i8yrBfTVs5D7EumNUKZ+/tb2nRpx+ucFFoRJRk/3bBUMid+v7jU9oDXYENjkL1G
         GlMGs7PCU4GycVdzT3n9jiKLyFY3U3KqMvE4LFRAoEL4BnngvK1o6wGZGCtBgFDj945Z
         bBMw==
X-Gm-Message-State: AOJu0YySpRf5Vio9hVqy85pe2uwuBicT5elquKVZ9gQVGmmUAAboDfTd
	9o2lrLpm2vblQww/h4tU9A/VVkd/dby4E1loLwRQ7MovpItiA/CZzVvxJKKm/0a0DV24uUt62v1
	ZzAO0mUeYmrhrqQnNORDSTqh+4LbIjMYFnC4R8Q==
X-Gm-Gg: ASbGnculID49MA0nOYGuStfTLNLUElbIBD+5zIksZxe9i6fea+SfTxmT+YsbJpCBuF+
	4aJGr1ZgQv6TDgV3gyO2TPP951dRkW3w/qCnkaPA5QzgEGs+g8PkOYORAaJ1nPrOr/PGBJsiLp6
	SOj6m8drE10XlIoD1TzIumXPM=
X-Google-Smtp-Source: AGHT+IFotCMhwQex5ilo7Aq14LzmL1k9fqeT3rlMBH4TWOPJnuiVvxeWLdbHYtw8lNcB3LyOQj4sojMVk3ASyitJE0E=
X-Received: by 2002:a05:6512:3e18:b0:549:883f:665b with SMTP id
 2adb3069b0e04-54ad64ef063mr1178817e87.34.1742555300378; Fri, 21 Mar 2025
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Mar 2025 12:08:08 +0100
X-Gm-Features: AQ5f1JpKGViC0rNip6NKvlpqHEnxxzDBuUTc26zl8zf3HGCwY8b4vPjBeasCX_4
Message-ID: <CACRpkdbGrLAO6R7kdCLUEYV7_MrWQ+=9C12nr9pYXv23UBFP9w@mail.gmail.com>
Subject: [GIT PULL] pin control late fix for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here is a last snag fixup for pin control, a simple
Kconfig oneliner.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.14-4

for you to fetch changes up to c746ff4a67f4842e90fe232d2c9fc983f4034848:

  pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to y
unconditionally (2025-03-18 14:11:46 +0100)

----------------------------------------------------------------
Pin control late fixes:

- A single patch for Spacemit K1 fixing up the Kconfig to not
  default to "y".

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to y
unconditionally

 drivers/pinctrl/spacemit/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

