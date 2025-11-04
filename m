Return-Path: <linux-gpio+bounces-27995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B685CC2EECB
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 03:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EFD3B9125
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 02:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21B923E23C;
	Tue,  4 Nov 2025 02:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="g3RWBimO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m19731120.qiye.163.com (mail-m19731120.qiye.163.com [220.197.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B04023ABBB;
	Tue,  4 Nov 2025 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222361; cv=none; b=VYyjAHRy29CK2pIdxRlh9XD4tGVdqvzYEGJdIYpGW4XAApdJgpcMh/C0wCul7zbV0USvvbwqiOEg9wRKeM3HcQOo03ajy4lA1+Lc3J5k/IeTFFKuG3HW98RSjrWUdbSbsKrnyIhdMJliv6miCsrUOkg2BqVkJ9J1h04sWO9h3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222361; c=relaxed/simple;
	bh=ZpLHRGa64z5XceglUfdYwr2vYHXWXq7kV7ERUsq9Mfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OPebFWxO4VLwTurJVSt+FusEn9TIixkOp3KH8/xeQLxap5cSxgkArZJgnKjSvXfrwrrCvAG2KA3SVVYcNPFrIknYmXXiZ2Jh1NG45rE7SzgJ3EBs5DcG5b3LD3qw9uLbhSPoUSZzwFBDkQIm3EiGqL0tpmS3poJcZU/sWufK5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=g3RWBimO; arc=none smtp.client-ip=220.197.31.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2842e9821;
	Tue, 4 Nov 2025 10:12:28 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v1 0/3] pinctrl: rockchip: Add RK3506 pinctrl support
Date: Tue,  4 Nov 2025 10:12:20 +0800
Message-Id: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4ca31a7b09d8kunm1bdc99775fc3999
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNDGlZIS0lDGhlDShpLHxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=g3RWBimOxSGtJkJcow8ACom5ucgsBsJupF+4oTD2tp+pP7DSfSiQyWb+0LpteF5B7grR0jNDFybIau0CyVlTOjZqDVOBwcaZgr+MQf6l1mDRVzjsHmyt9tFEXfWlCfGE8EXMrw4QApXxixNiUykpQ+NNeuZQQMtTS+OYGno/HFc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=M07VG5bhzSM5mDDbojZSmyDEd1eb4Stzc/AcK1LOVZk=;
	h=date:mime-version:subject:message-id:from;

This series adds pinctrl support for the Rockchip RK3506 SoC.

The series includes:
- RK3506 pinctrl driver implementation
- RMIO (Rockchip Matrix I/O) support for RK3506

Ye Zhang (3):
  dt-bindings: pinctrl: Add rk3506 pinctrl support
  pinctrl: rockchip: Add rk3506 pinctrl support
  pinctrl: rockchip: add rk3506 rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 517 +++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h            |   5 +
 3 files changed, 515 insertions(+), 8 deletions(-)

-- 
2.34.1


