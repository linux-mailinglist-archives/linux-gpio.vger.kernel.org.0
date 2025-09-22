Return-Path: <linux-gpio+bounces-26437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0BB8F7BB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 10:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CA33AB4D2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5B12FDC25;
	Mon, 22 Sep 2025 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tqte4F4C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692FD522F
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758529504; cv=none; b=McZhoy4bS0Nc/ZWXhT6STyu0DCEyD2kDkzZmC0JGMx3BUy0N5eJrP8DnA7mTqatKn2jT8ONcAJVqU2E5iGEvdiw4Q0HFDMzmbeZjiQOw6n82SJNDltIrJu9k+gPdc0/HqDpgE23/YROxAYxqOoNHMGdOuyc1ObbqwKTmNAR5OeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758529504; c=relaxed/simple;
	bh=FI+DYlQeMCnVCtyvCkdDPT1bCDTDmrXBPgGdRm2ofEc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mlPLv4bvbTEJuepcKfNC2c5jBnBFQ8D46ap2sLZQuSa2CYgFg+odUgXLSuWUyO28RGjZbnGMp3jIpdGZF2dcW6E9u8K1AlCZ9CpEyDhOY7VS+x4iAvUeGwqQhbX0cWpCC4Bx66Cd0OeLB2trhtrffB6hGjR9X9ZsBIY0z+3WbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tqte4F4C; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3696f1d5102so11732211fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 01:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758529500; x=1759134300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z8vx204SZWcSKU5Lh/a3VR6IC2ZtKNAfPJgRIQob+wo=;
        b=Tqte4F4CSznfxMR2B5FSW/woltlVfWYQ/rzegnV6Ar4zpnC3x+6H+zAny8rHDep2PF
         LHbPoSrXsuMF+4wURWG9lgSFF9AE3d7zUbyzKSFkjeHMz4Fp+4GZgjWYBHq6YtNyBCVR
         LqB+nftlszE60XAmXCUQ1wtXM+LuCcUATjmUDAzUiY0rnaFiel+vF26S4cF5gBcuoFvJ
         mWzEJkccbjgLF3k3FdkayGS4hIU02VfEgmCen3KZCL/KhqltcK3HIyRrZrRTln8Nsw9C
         Fo358G6NRQ2P61AKZuBextBLG6c39zioaudhX5FajadGk4f1JGXSzVW6KnzQlLrDlEMT
         33vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529500; x=1759134300;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8vx204SZWcSKU5Lh/a3VR6IC2ZtKNAfPJgRIQob+wo=;
        b=lBX1GVmYuOi9Pt3CjAKW2pXicIDk29exLxXZdNygbWJLknsQiUZgW0sZM3ASGPIFW4
         8YQ5eM88BVvt7qc5Tt2T+KQ3ca38RnXYRKRAn10n+kz7jbjINqS93FqpYJHPhbBizVA2
         AupmGdM4jJaPRUkkRZUfM5No+638E/nDTezDDD/K/J5zrk7yvaTRggtQS9HDvSr1SBt5
         95X3mdTCyFe3tPJYJr+0PgoepfgJIvFIKtlFvKMNgJdQzCOws+DJ8npWrJjoP3/WdY9e
         WFoAAxdpe3jTxMtDjyIBBc5ee05IWxUDduhmX69wCYKNrLZ5g3urV7iWH2kRnGW45L5B
         TCRQ==
X-Gm-Message-State: AOJu0Yx4ri+SiW2z/GDrtd9di6kfdy1HWP1ElnPMOnDDNvgZQtgG7ymB
	UU1M8ioIrhIWse5FZpYs+Hn41o9NfwS9mkRoLnWQdzX7LTEOFEjVLtRt0Q/Ythc3iu1c07l48jv
	y8LD2hPnVtpPB4YicoBZgNP7g9b3Z0Pgp6JAvy2wILA==
X-Gm-Gg: ASbGnculJ7/qiJ+VRs9dRBLISY8cXGSexeLXtjgaI3v3eEBrjNbWdCu/sMxPcav7fvZ
	Jul53q7AmJByOTckimuEfyzeJnUxnMIxori3tkbQgcZC6cla1/NYQb/yWpimrX7GHcR8YtGfD+a
	XBeiH86wurkIKOpSzeYGDdVAuX/JpiUdHFjCDhU2oxLCf+4zJuKmJ58vcEKWQv+pcUANHDlXWLj
	HQkRMaeX+IoinZ71A==
X-Google-Smtp-Source: AGHT+IHOLIPWnUusHHlSms67BlSXcHKiGUu89SIAIoeowSC9Fe8u0MrYAaOSGnZlhAqeChyO1xMSuRaRysiP29McDfM=
X-Received: by 2002:a05:651c:1501:b0:336:bcfc:a422 with SMTP id
 38308e7fff4ca-3641afb75a9mr42439151fa.26.1758529500441; Mon, 22 Sep 2025
 01:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Sep 2025 10:24:49 +0200
X-Gm-Features: AS18NWDYeUjgy-jqzWPWzQmyQ8AQMjpuT9A_9VkG_l_vN7XRtNSQvzsMFhRnhe4
Message-ID: <CACRpkdaY7qoN0r9zx4uKS8U3LS8-Zt2=omH8RhmcHV9F+jM1XQ@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for v6.17
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are two late pin control fixes.

Both for the Airhoa driver (routers, OpenWrt).

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.17-3

for you to fetch changes up to a061e739d36220c002da8b2429d5f16f637eb59a:

  pinctrl: airoha: fix wrong MDIO function bitmaks (2025-09-08 23:01:19 +0200)

----------------------------------------------------------------
Pin control fixes for v6.17:

These are two small driver fixes for the Airhoa driver.

- Correct a PHY LED mux value so the PHY LED will
  blink as it should.

- Fix the MDIO function bitmasks, working around a
  HW bug to force-enable the MDIO pins.

----------------------------------------------------------------
Christian Marangi (2):
      pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
      pinctrl: airoha: fix wrong MDIO function bitmaks

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

