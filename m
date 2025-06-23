Return-Path: <linux-gpio+bounces-22017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C7AE4AB4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 18:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0A1179257
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 16:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4061B29B233;
	Mon, 23 Jun 2025 16:16:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151224BD0C;
	Mon, 23 Jun 2025 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695404; cv=none; b=Ot5VGS8z7v0u9OOOfdrkrnaNks5egTCNV/sNiLPWa35Q0Qw2fc6/E0XWGlCj4KgEoGlTIQ0UhYGxwDYcsL6oWYsQdTgB8TEkCQNOGz1uctFMonVk1jB4oI7k4KrVU4M0TwHijcKMflkUmmMo9RIfhcA9hdfBhBV4GHlH46kt/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695404; c=relaxed/simple;
	bh=IM+3JR2890knVRoqQ/CbUQoY+gM5sa2Hi1A+uik9UjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X3D8tcfya6AQHxGhFL2sbzaLGg2OGwMhz7s4c7dw5wVeH7Ux2XeRz1fRCuTiL4fVpCrDxAoIuiaoYKJSNBoBoCxCZd4th8kQAOquOy8mw0NzVY/ha9wEWeClHYFcnCIC29rAiIq0JtciOwsdHMtzDAmGtGQnGR3xBDg6Vo1144A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.107.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 19a4befb3;
	Tue, 24 Jun 2025 00:11:19 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH 0/2] pinctrl: canaan: k230: Fix DT parsing and registration
 order
Date: Tue, 24 Jun 2025 00:11:12 +0800
Message-Id: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKB8WWgC/yXMQQqDMBCF4avIrDsliTVQr1JcpOO0DmJsJ1EE8
 e4Ndfk9eP8OiVU4QVvtoLxKkjkW2EsFNIT4ZpS+GJxxjfHO4Ohqg8p50Yg0MI3YOwqNvfva+Bu
 U30f5Jdu/+ehOK3+Xks7nCM+QGGmeJslttfqr9ahkoTuOH2Ss3PaQAAAA
X-Change-ID: 20250620-k230-return-check-d2ca51963064
To: Linus Walleij <linus.walleij@linaro.org>, 
 Ze Huang <18771902331@163.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ze Huang <huangze@whut.edu.cn>, Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750695080; l=848;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=IM+3JR2890knVRoqQ/CbUQoY+gM5sa2Hi1A+uik9UjY=;
 b=r+U9ntdcs2AYDt8cWu5oqXw6HUfbzQ97/iFpVKTmlr6QeMpYbo4xocVeBotqoMzp6jZRVXDcq
 vZZJkWjBrKjCo34gP6TIv3ivOnrSWYwbdkpegJwLVPLbwuSLpLQ8YKT
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQxoZVklNGE0eH05PTE5DGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS0xVT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpMQ0pVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a979d8eef3203a1kunm95855067303bc9
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6LAw6PTExAiJLGE8JTjMv
	IiJPCQhVSlVKTE5LTUJOS0NJQ0tNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS0xVT01ZV1kIAVlBSUtCSjcG

This patch set fixes two issues in the Canaan K230 pinctrl driver:

1. Adds a NULL check for the "pinmux" property in the device tree parser to
   prevent potential NULL pointer dereference, and fixes a typo in the
   match table comment.

2. Moves the DT parsing step before pinctrl registration to ensure that
   pin resources are fully initialized before being used.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Ze Huang (2):
      pinctrl: canaan: k230: add NULL check in DT parse
      pinctrl: canaan: k230: Fix order of DT parse and pinctrl register

 drivers/pinctrl/pinctrl-k230.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-k230-return-check-d2ca51963064

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>


