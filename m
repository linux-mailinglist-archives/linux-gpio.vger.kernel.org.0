Return-Path: <linux-gpio+bounces-22531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85993AF045C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 493807B1CBF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3A1283FD8;
	Tue,  1 Jul 2025 20:12:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087C1B95B;
	Tue,  1 Jul 2025 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400774; cv=none; b=LZMu7U3RXF/1Pa535y7JKuNTfPNcOG5wtadd/rjf6EGIaXFmiLYOJxJgJhSYAmcR1cP3COVqsXX0Npivo4Brxt9VOdT4Ky/hYXGk82CuYnO0T72J2BqtirHD/9udXI7t4+GKbrfYma9/aN94mnTYxp8/UDJYFdVgNzXoT8qSL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400774; c=relaxed/simple;
	bh=dgl5hIOq6GycYqWdHrpk1fFDgkuYnSrk119emMBzkZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mo0gZgxxENnU5lw/pWRckfKQ+h3+JO1zfhNBut5aVYeFTaDmnTAWqZyMdap0dLhLbCCv/O68L22bQGbOB5gMJQQFZbi7abGofPURid//FcV2ESQL0Vn6KIZYqmMO69prmfQugHUOCGNgTZBz01gSbY1zsW/qF8W7VYdGr2SxOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id CFBD81F00036;
	Tue,  1 Jul 2025 20:12:49 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 55ACFAC968A; Tue,  1 Jul 2025 20:12:49 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5A449AC967D;
	Tue,  1 Jul 2025 20:11:30 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl fixes
Date: Tue,  1 Jul 2025 22:11:19 +0200
Message-ID: <20250701201124.812882-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a mixed-bag of minor fixes for V3s clocks and pinctrl.

The last patch is a weak attempt at accomodating using both the display
engine and tcon along with the camera subsystem. The main issue is that
the tcon and de need to have the same clock parent, which may not be
the case depending on the pixel rate. Bringing the de block to the same
clock rate as the csi block helps in some cases.

Paul Kocialkowski (5):
  pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
  clk: sunxi-ng: v3s: Fix CSI SCLK clock name
  clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
  clk: sunxi-ng: v3s: Fix TCON clock parents
  drm/sun4i: Run the mixer clock at 297 MHz on V3s

 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  2 +-
 .../bindings/media/allwinner,sun6i-a31-isp.yaml    |  2 +-
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml       |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               | 14 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 12 ++++++------
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |  2 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  2 +-
 8 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.49.0


