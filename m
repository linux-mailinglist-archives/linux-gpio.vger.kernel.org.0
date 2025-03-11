Return-Path: <linux-gpio+bounces-17415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C683A5BE1C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8862316EFD3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0998023F384;
	Tue, 11 Mar 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7Snc1bH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6D239562
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741689811; cv=none; b=D0RVpqo1BkDoXcZiCVB8k1lfajkpu42VQE0wNLd4a/VNuC3+CRASJ34zrY9OaP9xRdHEQbtPPxb7Z31cNoN3Tze/lTJbVlkGROrjKx7ETsyBx+B0R8uyAU4/EZ4ZnTFQ04fFwFp4jIBaHf7/lS+l4hE0kqFCO55geOatGy1DvVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741689811; c=relaxed/simple;
	bh=TF2pt+VlYvXsO/bDy6P04Ye6e61vp/s0aMmqW7gn1Oc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KyayDKCNdx/ZCtR9o6JoKnrM30EWpv0IbcBrSYpfhUvCbwJRRjsq+dj/gCWTmlTJ8+MRp7cSxfkzlBPb/3QigaMNzf8v8QPxfrZ2DRZv0ZbsjdDHZtelFidhsEpEvqacDxJvNMM/1NtrDgk6t/Vhl8CpcT5gTiUfN3D8FhxVXyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7Snc1bH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549946c5346so4034762e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741689807; x=1742294607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dBFMdhOL1E36IC9V9YqTpC1340SUGaSyuFxF0T9JfTQ=;
        b=G7Snc1bHsTOUNmiv7dNJCeUukp4+dxZJ2kNKNAKAj6W8T/EdiZnN0G8qRHJBjlKAsW
         VweCIJaS+860fbEkfRuGn1yw7rU4jUKvmXspBciQbeF6Ej6o2+TIs2/fvVIbFwJReZde
         i6f06PD5JuJmKiwR+5/T9jiVk+ggN3lYEbm3H9TtnxPp6X87h1x447NSG1+Jgq2Imzna
         S1P3Ls0sEgrOckhPgMh8C7RZcJG7LZqb1JYsjSz0k1/pN/WsKF3W9gIM51Lzdrh5lQIT
         1cw2oqMzvY2unlk1sCryl+wuITFvA5Te0JA4+bTrl/C72Eo3sIC2O2VBQ+e+i3dBA3p8
         rSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689807; x=1742294607;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBFMdhOL1E36IC9V9YqTpC1340SUGaSyuFxF0T9JfTQ=;
        b=KGiBvTLG/EnDLTM2TAspn8HOkBXL6O4RsR30E6sAWCERUHHTfEddGHg3RfA40bPDqM
         pqyL8IKvP+Kqm4TR5HOZntfp8zS8E9XUbNR/KHqzsszfX4g6HY65bymJ0uVrNgGZXHhw
         T/mScYQqm4K2R4AWGDMxMlTz70IXJNwoPxX7eLdU5FsuS1TEZ/+rpwEtjYceI9S594DY
         81zCGXBecRraSyr4rdkCbCJe+YSV+tE7tN5Ye+7LKZYuN9EvWu9z6F4Yj3d3qQfCFdcn
         ftFSpuRqE3bVFR02RTdxcu9kgx5j93UiksA0MeVjfIGowRU05k0Euu8gYJdf9JZ7oy1Y
         25mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9xxpL7AC42rSioc6zbbjelm987g0/ZTdEL4wr8j93Sy5rrP/i2VhTKayadVFUXtvz/3lQBoOiICdj@vger.kernel.org
X-Gm-Message-State: AOJu0YznVPtSHuj78qXg9DpshI7caPH4o0lu4HYR3+6qzVN7QZGT5FUB
	X2NBUzmgzpncrszmvm/MJrac7BqEJT9wEvr4I91eB1Wb/YAexYW0YaVyD9zXms6zApIinjIDPMh
	BFuwa/cqnRC/+HaE1smJu+JNIWeus8CW0tqojqBRmFe7I40PF3aPnz9ER
X-Gm-Gg: ASbGnctudmWHDuu6vJ3DJM9NZAkM3G9E4+IF6vapBPSglRD66fklX0GyaFalQs7h8O5
	R6CVBDU08aokWyYsbJV5eh3RdWfv4P51+NdAWuLZLRGZlRdg2JZc6Fv+yMVf/irLR+cFGc7bEIk
	777ZomMuOhNFLoEddTXJbdLVmmXQ==
X-Google-Smtp-Source: AGHT+IGS4R1q+LV5vAuY4Bv9EtMuTTEYniQOjcVnb44o4oTeSd8Lkb4YxR/Qp2OF8HLFDaQ1BDJuRSqkimJ6DUZKF74=
X-Received: by 2002:ac2:4981:0:b0:549:91d7:4b51 with SMTP id
 2adb3069b0e04-54991d74bdfmr3668992e87.2.1741689807375; Tue, 11 Mar 2025
 03:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Mar 2025 11:43:16 +0100
X-Gm-Features: AQ5f1JofDKmAv94-INk5bhpi9KjVa5U3EneTkYX1fDYQF4TcIsOLZq83AfAeqtI
Message-ID: <CACRpkdZmBznW3b132Wze8t2zC=-8YuEW+5aQD1qSSr3w2OFfZg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

some three pin control fixes for the v6.14 series.

Details in the signed tag.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.14-3

for you to fetch changes up to 7ff4faba63571c51004280f7eb5d6362b15ec61f:

  pinctrl: spacemit: enable config option (2025-02-25 17:22:36 +0100)

----------------------------------------------------------------
Some further v6.14 fixes:

- Fix the regmap settings for bcm281xx, this was missing the
  stride.

- NULL check for the Nuvoton npcm8xx devm_kasprintf()

- Enable the Spacemit pin controller by default in the
  SoC config. The SoC will not boot without it so this one
  is prett much required.

----------------------------------------------------------------
Artur Weber (1):
      pinctrl: bcm281xx: Fix incorrect regmap max_registers value

Charles Han (1):
      pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw

Yixun Lan (1):
      pinctrl: spacemit: enable config option

 arch/riscv/Kconfig.socs                   | 1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c    | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 drivers/pinctrl/spacemit/Kconfig          | 3 ++-
 drivers/pinctrl/spacemit/pinctrl-k1.c     | 2 +-
 5 files changed, 8 insertions(+), 3 deletions(-)

