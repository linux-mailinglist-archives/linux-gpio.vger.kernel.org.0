Return-Path: <linux-gpio+bounces-9414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05F9655BE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 05:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8B6CB22343
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 03:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59AC136326;
	Fri, 30 Aug 2024 03:41:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62B36B0D;
	Fri, 30 Aug 2024 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989261; cv=none; b=hjoDTPpiAdY9/qJd/+KENCm96GWDdc9BJdgeMrYUYVgszTnCQbL82RXxlBTjU2tjzRzU+HBURF5RCL4AmnmzIFL0p2r9WRHCX9aVm7MIme4zWys8sU5Z1FVg+L/737I4N/fjSFYEWg9GRnNNxxSq71BuvV7Zue6kUVbrSVW4hyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989261; c=relaxed/simple;
	bh=bSiRdyUan6CT3lGdG7FeD172FEaTD1UwprvspX3XlWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ba0ZL7xnvp8W2RKB9HyR+dAzxkOyoikWuLDVCfmok+qh2kC07iCoQPRUTWzpJl5LAG7ccR+Qowpy9/GPyzWOkI+uSYOsYfkV4f9cmYDznpyzkg2GZ8xwOImGmTMAg+UfZ0FV3mhmq9KtzRfrdv1WC1Pd6rufh8vM09+6Qba2egE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 30 Aug
 2024 11:40:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 30 Aug 2024 11:40:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] Add Aspeed G7 gpio support 
Date: Fri, 30 Aug 2024 11:40:43 +0800
Message-ID: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The Aspeed 7th generation SoC features two GPIO controllers: one with 12
GPIO pins and another with 216 GPIO pins. The main difference from the
previous generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, direction, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for GPIO registers and the coprocessor request/release in
gpio-aspeed.c making it easier to extend the driver to support different
hardware register layouts.

Changes since v1:
- Merge the gpio-aspeed-g7.c into the gpio-aspeed.c.
- Create the llops in gpio-aspeed.c for flexibility.

Billy Tsai (4):
  dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
  gpio: aspeed: Remove the name for bank array
  gpio: aspeed: Create llops to handle hardware access
  gpio: aspeed: Support G7 Aspeed gpio controller

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |  46 +-
 drivers/gpio/gpio-aspeed.c                    | 442 ++++++++++--------
 2 files changed, 303 insertions(+), 185 deletions(-)

-- 
2.25.1


