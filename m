Return-Path: <linux-gpio+bounces-25175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD2B3B445
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 09:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C35537AD129
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 07:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA1326561E;
	Fri, 29 Aug 2025 07:30:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9C189B80;
	Fri, 29 Aug 2025 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756452636; cv=none; b=KQn1P0q1jvflB/sR76LjKC6pqvWmk0usKHXmm+H5goudaW0rrZ0kmIVPLnll/jtzlaVIkwgPdgmhTJEbBSG0TWmeRWB+pcmiAYXXji4VP8Gr4BuJW7WQnYm36wE4NlbQiFsl92SjSUidF6uB81uU2Kit2eJQlUYRVDFI7F6fdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756452636; c=relaxed/simple;
	bh=mQTvK3/3rkMoVyxx7WE920a3ga2nJixdRDzvBqen+Tk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F0A+S6cjIRixa5jFAZEOVKcXg/RoyCr4z2VI0B+Eh+xSmNiONmLKg8Th1XSl2ijNpLG00Cf0hCItFwQ0A1TI8CciuEAIQzGNZfgoj2rfA/Uq3v0h7BMkzfUIFaZuzfRag31r0fLWso1LzgJtoEJQQwWqhatpS45UiilD9ZzuiLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 15:30:30 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 15:30:30 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v1 0/4] Add pinctrl support for AST2700 SoC
Date: Fri, 29 Aug 2025 15:30:26 +0800
Message-ID: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document and add the pinctrl driver for AST2700 SoC.

Billy Tsai (4):
  dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
  dt-bindings: pinctrl: aspeed: Add support for AST27xx
  pinctrl: aspeed: Add AST2700 pinmux support
  arm64: dts: add AST27xx pinctrl configuration nodes

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  135 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  452 +++
 .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
 11 files changed, 5071 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

-- 
2.25.1


