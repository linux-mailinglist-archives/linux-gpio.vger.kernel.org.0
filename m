Return-Path: <linux-gpio+bounces-7239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9898FE6F2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 14:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125962828C9
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B778C195B30;
	Thu,  6 Jun 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="CUaeKEjD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0163194C9A;
	Thu,  6 Jun 2024 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678686; cv=none; b=cz1UmnzSVwfLISmD/IjdBSS3V7PdcsmCGZnXe226xBH9L8vxKA3/lMuH6wD2F1BMyZCz5dlL7H+BIYiCgy6hORmVr3DLM4EG7u7o+SUqztNY7uXEML1CzC8ECqU6TRdWRos0/JXVlGYkkvw5zxJiCq47xOrdfHUefnw6cYMueuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678686; c=relaxed/simple;
	bh=Uxk8Fk/7sCzSFIgT+BUEIDJsiLgCAKvkQB5ZOk6DXOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJNDyrxsPnZLDkRDZaTHFqbasN82Pi57l9VHQOhgN5fyH4fWYTHsViK/p4ciFzX/84GNSVYx32NtbIXQuxm7wz6l2/o6XGLyuIYIGKJ0CuwILab5QqA2C+24llHgreGVVlfzpW6keAwHhAsEd7N3xJK2WvMQOl12+JKhvzZ3l2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=CUaeKEjD; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717678681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Melp/AwKYwWBq+3w6XX7+3avHSKYtUya/gkYeN1dljg=;
	b=CUaeKEjDvimojDiRC7Q3Dyn7DZBWaGvlZu9dEGLvePnXyl+LQTapvxPzvBg8kJ9dNprKG4
	jdkbBJhQ9ArXCnG7HxD16rlLVknW6At+eprU0tfigg5jE0PsTxfRVT2SE6PEkXtWaLJ8EC
	Oyy0vHMixbo6zhV9ytejZasn/KWlNcU=
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH v2 0/4] pinctrl: rockchip: fix RK3328 pinmux bits
Date: Thu,  6 Jun 2024 20:57:51 +0800
Message-ID: <20240606125755.53778-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinmux settings for RK3328 is incomplete, correct the pin bank
settings and recalced mux data according to RK3328 TRM[1].

There was a patch[2] in rockchip-linux kernel repo that cover part of
missing mux settings, unfortunatly it never got into upstream kernel
source.

The last patch fixes an issue in rockchip_pmx_set which is general for
all rockchip platforms that might cause unexpected pinmux to be set to
0.

[1]: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
[2]: https://github.com/rockchip-linux/kernel/commit/d69af8ab6534bb28c1556076f08d2a5ab4935d95

v2:
  - split commits for GPIO2-B pins and GPIO3-B pins each
  - add a missing Fixes as suggested by Heiko
  - add Reviewed-by to last 2 patches

Huang-Huang Bao (4):
  pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
  pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
  pinctrl: rockchip: use dedicated pinctrl type for RK3328
  pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set

 drivers/pinctrl/pinctrl-rockchip.c | 68 ++++++++++++++++++++++++++----
 drivers/pinctrl/pinctrl-rockchip.h |  1 +
 2 files changed, 60 insertions(+), 9 deletions(-)


base-commit: 2df0193e62cf887f373995fb8a91068562784adc
--
2.45.2

