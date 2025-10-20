Return-Path: <linux-gpio+bounces-27302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15074BF0F46
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B4EF4F31FC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0B3081C0;
	Mon, 20 Oct 2025 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="554YekhL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EEA30F53E
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961414; cv=none; b=QjZFM61KSxG/8haR7dzbcaIC4ftawMDJvUzKzHF2Z0UrTIJLe65vXGw2YFjFlu3MSdnepqusLdMgvwVk/yXc5/bI7qNQNKQasUNOq0s4A8m+wjxU1euhsBD3nC0eqQg4X/pnarfYZwzBOUnd7JAp2QqRLjCVLr1H6gdvJqlHbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961414; c=relaxed/simple;
	bh=VjDQiG+M6K6QnT2gGqxEZan0J6keDFKijaH95ZMH354=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVp2Pxn0TZ+ARuWo2IkvNPkRIFIVytpdEFhuoIYv+IcKFl+wsYDmPtWEkcFU9ytTMjEoLWJeNWBIY5CWS8YtbdBil3HVBYA6hTvG2+I2xGxIPkGxuPAQNQJzdMWa+htijbBLsA+2mvNVKCtzUtLl3XshPGYfbT9YCSMVX/6L0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=554YekhL; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id C3EE36892E9;
	Mon, 20 Oct 2025 13:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760961405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VzgKu5v6USgX+sWCyGZJi7MH0wzM3lpI03vAJt5XXlY=;
	b=554YekhLAPr28fBEKd59LRu2SI6PHw4S4Jc4YR2QX1wGFuN1EtZeYSkefgs8/dxJuC8Qyt
	/MIgBt11b6fLG1zE+GMWOhs7nvt3z7QxkYzO3apKbT0l0XDcLYI1zIL/NYzo3KzlO0JOxi
	wPMKjDV+RqbwyKGqAPrDYsa6qlTO719P6Dn9RYn4sxpGVv63Z1YulqDc0JHSdXxRYvYGM+
	ckgrejNh9T0Mtq5HW4jiCPDnOubEEAPYEOkbaJntEwr2MBSaH0y3KHYlFfTYpysQut+GJz
	xwACZHY55R6p4dm9lw9ZKJpOnzrRgNZuuyXz9YXPMtQz3aZUeGZ9MNXFvtJ4uA==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [RFC PATCH 0/2] gpio: regmap: Ensure writes for aliased data values
Date: Mon, 20 Oct 2025 13:56:34 +0200
Message-ID: <20251020115636.55417-1-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches aim to fix an issue with aliased data registers, where the
input values are read from an offset and the output values are written
to the same offset. The current use of regmap_update_bits() may cause an
input value to be used to decide not to write a new output value.

The first patch in this RFC aims to fix the above issue. The second
patch is optional, but allows to recover some performance by leveraging
the regmap cache.

I am currently revisiting an older patch series of mine [1]. I am
submitting these as an RFC to see if they are acceptable, but would
include the patch(es) in the respin of the series.

[1] https://lore.kernel.org/linux-gpio/cover.1623532208.git.sander@svanheule.net/

Sander Vanheule (2):
  gpio: regmap: Force writes for aliased data regs
  gpio: regmap: Bypass cache for aliased outputs

 drivers/gpio/gpio-regmap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.51.0


