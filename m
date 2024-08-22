Return-Path: <linux-gpio+bounces-9002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786395BF33
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AC11F261D3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3921D0DDF;
	Thu, 22 Aug 2024 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="X7rNhmUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC617588;
	Thu, 22 Aug 2024 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356657; cv=pass; b=KBtq92S59YoGKptC8DBf9yOkTQjvzoUvxVmqtOxk/8R0J9ETrAQEoM+7W3Zh9cO33XKcNv0BDwl2SPDjNE8Gpv3nQQkLNWngks+QSvrr30/03p+6iXpKCAUDYy/YcEEapVNahSa9/3ZwG/KYK7S0VS5RS78sobxHKgBP1TXC+7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356657; c=relaxed/simple;
	bh=OYGMQeMIzR2Qkqh0UCbymOIGCTmmBed4yr0mWDQHmqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FCKRzJAg3YVi92yYUVFYY/jOX+Nc0QeQuBp+lFdNfCMMPBYA0qwhnO6kO90NFbPCSIsAamLkOJboijyPwFIDjDJCUP3jAg8O1XKbBrSkLsxMq7uUyGpF90g9eDhbG7THQ6MqTL9J1Z7+PnIKYdf690kHzQIkBvCTJpLkcVT4Pug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=X7rNhmUo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724356642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mrMMoVI/vPpUTcwUWmVqAzUZqnK9BHKMfsEHlELNfsdLquU+g2sbqSC/T2dNXX6XiwOG9CgvkVNj9ObKBW2es24/xJ6P3VBbcGyDznFlso+BJtBIh9V02p4Cg1eAjsJHrJHJ0/hWSscDbd5C0JETX7oVfbb65oOwHRxsW5cEMcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724356642; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cDAWEJoEuz/zAjQB2GDr5o/+uMhJXPXP0OhvbyTM3eQ=; 
	b=elg7zCTgG0JGoPym0Bt7GGwWg8QG1KDkl5/q4E4r6K7z7x3QCJK++XxwPqS/UlB0XmhbPk/dWM9S+k2rYS+FFZUX9MIKddGQkLjRTia8w3y5SMST03nVMpDIKM3mv2H1p0uTM6ZxaDAB842087kJ4C6aZI/yX1ioc4+QloOKHl8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724356642;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cDAWEJoEuz/zAjQB2GDr5o/+uMhJXPXP0OhvbyTM3eQ=;
	b=X7rNhmUo1ZZg/4il+v8om2GyJcVoSSVDqoPCpnzG28LruVhDc4F7fyqg6EUYsgZt
	dseyrUIyFkYTnyMpsPvphi40gcPB1xt+buHfOSG85hV1DfBsUPpBoNlEW2/d8VXP4Rv
	NC0RBqZb5TRpCGeyyzbbBxlctlEjcRjUzTDonVxY=
Received: by mx.zohomail.com with SMTPS id 1724356639631760.212187062417;
	Thu, 22 Aug 2024 12:57:19 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 0/4] Add pinctrl support for rk3576
Date: Thu, 22 Aug 2024 15:53:35 -0400
Message-ID: <20240822195706.920567-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for the pinctrl core on the rk3576 SoC.
The patch from downstream has been rebased.

The grf driver is added support for the rk3576 default values:
- enable i3c weakpull SW control
- disable jtag on sdmmc IO lines

Changes since v3:
- Set GRF bits through the GRF driver
- Drop the rockchip,sys-grf phandle

Changes since v2:
- Document rockchip,sys-grf field as only needed for rk3576

Changes since v1:
- Reorder commits
- Describe sys-grf use
- Update imperative commit message

Detlev.

Detlev Casanova (3):
  dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
  grf: rk3576: Add default GRF values
  dt-bindings: pinctrl: Add rk3576 pinctrl support

Steven Liu (1):
  pinctrl: rockchip: Add rk3576 pinctrl support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |  16 ++
 drivers/pinctrl/pinctrl-rockchip.c            | 207 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   1 +
 drivers/soc/rockchip/grf.c                    |  30 ++-
 5 files changed, 254 insertions(+), 1 deletion(-)

-- 
2.46.0


