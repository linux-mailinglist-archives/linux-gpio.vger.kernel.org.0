Return-Path: <linux-gpio+bounces-17123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7907BA50528
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 17:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DFB16940D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 16:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12DA19CC31;
	Wed,  5 Mar 2025 16:38:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28761FFE;
	Wed,  5 Mar 2025 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192684; cv=none; b=LaUpORajKcLxLqwra8gjvEofVqNy1ty+qZJdVb7Zof907wZBvcZl7FYCi05gZmSVO/8No7ZIjXBIS9plTjgN2th7m2eGrZOfsY53+seGBrU6gP1FCKKWFUjV+qL10gczRMPpMTlEM4HNFLQWJYMlEWoZRD40oyPw3SQWCjpbB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192684; c=relaxed/simple;
	bh=giLIi6y7FvFYbBs9vIN3Xqh8DeWtMAnSCL0PVoXkYkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S1Dsk3WiCSkAQpHk587J1XuWmVbGKFM7fsBnQXsTTHcWy75/b5u/FbNUSgGpSqT8FC4rsd3tkFOwnl13uRaAKYvMDiK6mYqfmwatStTkKiQ6JgRXA8gxU1dEarea9OqojpIn2mzyoJiwsYMDUTaqFQJqUI0djTQ8xEkXgg/Wdjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: b9yQW58+RVaD2eeU0F/wwg==
X-CSE-MsgGUID: zYIpf+EdRmKxTc4e0XLElA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2025 01:38:00 +0900
Received: from mulinux.home (unknown [10.226.92.17])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 748C4400F792;
	Thu,  6 Mar 2025 01:37:56 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] Fix missing of_node_put() calls
Date: Wed,  5 Mar 2025 16:37:49 +0000
Message-Id: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

This series is to fix a missing call to of_node_put() from
some of Renesas pinctrl/gpio drivers.

Cheers,
Fab

Fabrizio Castro (4):
  gpio: rcar: Fix missing of_node_put() call
  pinctrl: renesas: rzg2l: Fix missing of_node_put() call
  pinctrl: renesas: rzv2m: Fix missing of_node_put() call
  pinctrl: renesas: rza2: Fix missing of_node_put() call

 drivers/gpio/gpio-rcar.c                | 7 ++++++-
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 2 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 2 ++
 4 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.34.1


