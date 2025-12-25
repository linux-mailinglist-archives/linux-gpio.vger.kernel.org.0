Return-Path: <linux-gpio+bounces-29888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06FCDDAFA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 11:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3646301EC43
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 10:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF3431A800;
	Thu, 25 Dec 2025 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja/rtA+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ACD3093D3;
	Thu, 25 Dec 2025 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658987; cv=none; b=Zw5bDccZHJc/bxy+rAjQjD6Oyx2Lp5sLf1XRvcGWlXTIFUGoVcMAqZL6T6vla0IdEK1U0sPtlOJxkzF/E6J8XkUxAo0sz43IXWCryyb59+LE5mstPpeDHClMeEPVycvYH4r33Qie8tnHQg0a+ov/ln+Mpgh3e9iYRUrE5l/K1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658987; c=relaxed/simple;
	bh=hUjiGAUCEtkj7Gi1H/0UYonfjZuOU7AW5JdzHCgDQe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdWG0bxs8H26C/9JUXDvPDOjYMkEiM9iaG1qKTFU0yAF9B72yDZc1dBB7ae1j/u+vt6SrZDu2kolqtgdglrQ1jD4Q7g+uNN1Q8w6GQuOdNdr5ZBb39YPZ3OnbpiHuZh9eOiDCOfRQUv/DH4Xpz2mQPaorwa4Wh4imn03fk8C+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja/rtA+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053ADC4AF09;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=hUjiGAUCEtkj7Gi1H/0UYonfjZuOU7AW5JdzHCgDQe0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ja/rtA+4bw+OqEQTsX/xoFbdMOp9T+S9QqDvRK1rNtpM6yZWb1Ywh1s2zj6LDV0uH
	 01CqVcszRJZCqKQkxeKcHb0eXgObpkLck9PHhNz9c1rBJCA0hyXkzkzqN8LZh6S0KT
	 bqdukJ96hfpxeqe/Ruubc2S9B8aub3irjbV3VVVo7J0A0y7Wtyc4DdFm5FawtHNNRE
	 hymEksH+BRXERvnIrpNe01+saDNXIR5jRxUBRvBdhWeE5WOEwPRIaKEje/ryAISMoX
	 DspYTlEoTml2dICU6g/4Y0Syz+6hBkXivHV9qiIkKASY+L7VOszabsKb/wOvs20g45
	 Ms+w6EK225+zA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4AF465FC5C; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: allwinner: Fix remaining DT validation errors
Date: Thu, 25 Dec 2025 18:36:11 +0800
Message-ID: <20251225103616.3203473-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series gets rid of the remaining DT validation errors for Allwinner
(sunxi) ARM 32-bit device trees. The patches are self explaining.

I plan to take all four patches through the sunxi tree.


ChenYu


Chen-Yu Tsai (4):
  dt-bindings: media: sun4i-a10-video-engine: Add interconnect
    properties
  dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with leading
    numbers
  ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
  ARM: dts: allwinner: Replace status "failed" with "fail"

 .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-
 .../boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts  |  2 +-
 .../boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts  |  2 +-
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts     |  1 +
 arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts  |  2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts     |  2 +-
 7 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.47.3


