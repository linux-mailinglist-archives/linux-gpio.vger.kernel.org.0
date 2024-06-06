Return-Path: <linux-gpio+bounces-7216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951C8FDE88
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AC291C2182F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 06:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8103BBEA;
	Thu,  6 Jun 2024 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="lbDyrS7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3940BF2;
	Thu,  6 Jun 2024 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654438; cv=none; b=LQjdqjQNHe9KPPfA7XLq1ctME/3i36tpTLNz+iTW1NEjZp3HkWGn6H04kLWp5lueGXZfttaDVFK3bZ3iuyG79nuTI/AiIomjZ2YCrH1S41o3u1/HPpAC4A7z6LzbLxiZPzTxLnhRKI1kIrizqc1rc0+VqKL6urWqkwv/sDToeWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654438; c=relaxed/simple;
	bh=1FbzqOuIUQRbo7rAgErLXS2ed9dfsCghKLThPMcoGiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBHLS0E7IWBSVJzdZ0/wUWgHZ2toFQ/Kxz1/GoRhLfAIAeus++gDcYNuaQ2joycbA6VPWdA6LrbT9+6Xa2anLKVEG64/sLWlYuDuzOm7r1GS54PbEXSHG7tTb7+qDGS/CrFGgQdM+PFMBNg/cw4oOjXG3a6qgtXGVb/QwyDlhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=lbDyrS7e; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717653883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMXP4D7iL2Jw3xOBudLgXxOe6NslpIdO9kJBig+lh+o=;
	b=lbDyrS7euNYKlPciL76y/GFuuUgrhivXJhlxcOe/ILAOJSbo7+JnggWVBtdD1DiRy1iUKh
	1W3sfW2DYWiRCOxUBXqL9VWsP8xAGaioMRnadGlkNSeA6o4I5hBg/5ZxZgrfdwRvOXx2/a
	C9tUfj7OFGi3DRUcQ/ra/FCt/44myg8=
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH 0/3] pinctrl: rockchip: fix RK3328 pinmux bits
Date: Thu,  6 Jun 2024 14:04:32 +0800
Message-ID: <20240606060435.765716-1-i@mail.eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinmux settings for RK3328 is incomplete, correct the pin bank
settings and recalced mux data according to RK3328 TRM.

There was a patch[1] in rockchip-linux kernel repo that cover part of
missing mux settings, unfortunatly it never got into upstream kernel
source.

The last patch fixes an issue in rockchip_pmx_set which is general for
all rockchip platforms that might cause unexpected pinmux to be set to
0.

[1]: https://github.com/rockchip-linux/kernel/commit/d69af8ab6534bb28c1556076f08d2a5ab4935d95

Huang-Huang Bao (3):
  pinctrl: rockchip: fix RK3328 pinmux bits
  pinctrl: rockchip: use dedicated pinctrl type for RK3328
  pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set

 drivers/pinctrl/pinctrl-rockchip.c | 68 ++++++++++++++++++++++++++----
 drivers/pinctrl/pinctrl-rockchip.h |  1 +
 2 files changed, 60 insertions(+), 9 deletions(-)


base-commit: 2df0193e62cf887f373995fb8a91068562784adc
--
2.45.2

