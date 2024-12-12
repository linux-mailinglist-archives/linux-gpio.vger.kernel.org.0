Return-Path: <linux-gpio+bounces-13812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62449EE868
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF62281B4F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A44A2153EC;
	Thu, 12 Dec 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CDmmGnS9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="njc3P5eQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E162135BA;
	Thu, 12 Dec 2024 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012528; cv=none; b=sqncJK2IXpFfsmRKKQzAB35xsNejSE9TxvlXX8wXHOkYXC4+XW7ZrOmF1FkRceeSfkil18WcKLY07AKUhmeS+JpmPqoZPmhhMqDvXt1uSL5LmnpTqJxFeaHc1oPwCO04354n4ewcTnduKpFsanlfNqxOv5s4TJsb0g5y2dgKGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012528; c=relaxed/simple;
	bh=6XRJr3Yfcy+RZwaUhcj8i4Ll1XJnUnfzz2/fLQfQmBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cBewctElXb+aLLNT/ZJ17MS2jPe/FVsEEm3jcZgfohnaH6tyfsTNvIaHt2WQelgv31o6R5wNgx2XY45yPsL7dkv3BcGuNFcbrXRJXGPGuq6k4KOmAj4brSM6YzEJQiPDe2XX+KqLdDzuu8PG4WkfNgGe0PcHpNfhnSWiswGrk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CDmmGnS9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=njc3P5eQ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012524; x=1765548524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UnwBp3b+LpdSDnh582/BX1DbHR4kBNr083x2OYy0IlM=;
  b=CDmmGnS9dvqa+ZYaoFuqZkmeb2kel8Vy7H4PLjY+25IPW62C2aRS6cHP
   /3h9jikAuLbnYN8CXdasAQSaoi2wzI6T92Xp1lIgGA+7mPDDVhDTxbj3v
   10QWmKFpQxEWPX1PY5dUCw/a1awGl8zEVQlYdLwzZvoXnZD5cXaE2HDR1
   9GviLFbTXN5Ml4Aq88w7o7yO18uSpLlgxbO1Mxh8zyEJp/Nr9ZREB+khD
   AcQTNVgPINXw7ZnE5jYC15//cLPV/D2DXI2I7ADxJGKNxeX6mXZt8anhO
   kI1uKyQG1qbHZw0wtqtaa2pA20f2pFf0krfpnqc1OweBVuNTNGDlP8SvU
   Q==;
X-CSE-ConnectionGUID: Tk2lsBRlQPy7JpiwS3Glbw==
X-CSE-MsgGUID: 5gJur5lnRBuAr0YeUGDFKg==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566510"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:08:37 +0100
X-CheckPoint: {675AEE65-23-F04831A1-C5AE3AEA}
X-MAIL-CPID: E3222125F5B17BE09066C044B8D15709_2
X-Control-Analysis: str=0001.0A682F18.675AEE65.00C0,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4BCC16B8AB;
	Thu, 12 Dec 2024 15:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UnwBp3b+LpdSDnh582/BX1DbHR4kBNr083x2OYy0IlM=;
	b=njc3P5eQgS78Yt/EFTQ6Ph+8eGqz0rXYBUQ8XfEcAvAzn4Iy1YMNho1kL1CgHBXGlwjvpF
	VV7fvICjCfhhOVrkiXOwoNyEyeM0yHShoEDhJYjMA3xKUYm8PVIPnAOZRz/+kQI1Uv65O6
	kqYBXp+Js6fS3dO4KRmN2Uo9KBf7eT6X8d4yDSJIWYaFbec7WtZP6+U/7Wk0LL3UGl+Llm
	JgMxIgzWenk2Vv5OtrCiyShqw71SnM7a/FMn81snQb7ViV1edh1hHtuuuXA2ZRcgXQJOg7
	qW9fWxizxHi6i+e8vV1yJJwpxNfhdOkWCREOgPJjcR3sgc0xlEoVDaimPYkoAQ==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/5] gpio-tqmx86: cleanup + changing directions
Date: Thu, 12 Dec 2024 15:08:04 +0100
Message-ID: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This is the first of two series adding new features to the gpio-tqmx86
driver. The first 4 patches are cleanup/preparation and the last patch
adds support for changing the directions of GPIOs.

Once this is merged, the final series will add support for new TQMx86
variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
support on all lines.

# Changelog

v2:
- Improve wording of commit message (patch 1)
- Fix comment format (patch 1)
- Use lock guards

Matthias Schiffer (5):
  gpio: tqmx86: add macros for interrupt configuration
  gpio: tqmx86: consistently refer to IRQs by hwirq numbers
  gpio: tqmx86: use cleanup guards for spinlock
  gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
  gpio: tqmx86: add support for changing GPIO directions

 drivers/gpio/gpio-tqmx86.c | 206 +++++++++++++++++++++----------------
 1 file changed, 119 insertions(+), 87 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


