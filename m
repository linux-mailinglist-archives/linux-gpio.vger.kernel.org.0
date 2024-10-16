Return-Path: <linux-gpio+bounces-11436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F69A06BB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 12:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059EB1C20A5C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385BE206050;
	Wed, 16 Oct 2024 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a9HDwHw2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675629A0;
	Wed, 16 Oct 2024 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073510; cv=none; b=sX70ct2s3XEtsrUuA+qo6/YFm8Mvw/eOsgXoLy662QqMHmFpF0mxIOqApzaaSa/LN3mRA1Vb77NdQxzrX2T8BK+qZw2in1MDOiuZ5PeywGYAay4K+ii2vrkzbR9VBeTU7lfqp5K2hYGa+Od/gAY/lohqSh0w1BJdlX1ZsASxqSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073510; c=relaxed/simple;
	bh=mrSGfMU7Tm0bBeYd3F/mfUyYW1u/CbdY29XbvjhHZFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jMgVWTcKtpERjfAEAzj2Q4B99jJ6Y15YotATZeyaVxtZSnxH1FOEHnZqc0y9jYc4fMU82ZDl1wzhrEBXqo1wLLhqlE186ZGdP/j2lHS9L+jrKirr7vbYi06BlNn2kL00ZezRpk8imA/hEpe+uLrPdduImEnbIJ1vJar1K+652cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a9HDwHw2; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 650E260004;
	Wed, 16 Oct 2024 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729073505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L+rZiiK5gVCLsmWp2GiJA6LEy7D/26PDrXjvMBsnmKk=;
	b=a9HDwHw2kzrlbb2KqATc2r9pxNPs0I48hrbTuef7TaATHVN4aS4MZmEAyhu2ihA5JV40jU
	KWoQfo69b4dFelIoU1EDUxYsk5Rh33zzv+MV7/NRq+03Vpw6iZPNtDcgRsUrGzYhLliORW
	hDG68Ri+sK3cK+bJ/HfMbEfvAuKN/oUA2OLPAM5xBsHjZ6y/W2QwZm/NewMareUxAqlNQY
	IzMwYdBwEROOtrQ1v/IUabbJKsxr9H7GUEYGfXS+iRj6Wu/isott79Jz8WHp+crcdEXre4
	5T1oNux2JyoK6dQC7d/ANQiFDJ4p+l7njkDghKEIEfEuZVF+/snKaU1k9YG8Bw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 16 Oct 2024 12:11:42 +0200
Subject: [PATCH] pinctrl: sophgo: fix typo in tristate of SG2002
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-typo-pinctrl-sg2002-v1-1-2bdacb2d41e3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAF2RD2cC/x3MQQqAIBBA0avErBsYJSS6SrQQG2sgVDSiCO+et
 HyL/18onIULTN0LmS8pEkOD6jtwuw0bo6zNoEkPipTB80kRkwR35gPLpok0Gjs4b5Sl0Y/QypT
 Zy/1f56XWDxV2rKRlAAAA
X-Change-ID: 20241016-typo-pinctrl-sg2002-6a4cf61a08f8
To: Linus Walleij <linus.walleij@linaro.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com

Fix typo in tristate definition of the SG2002 Pinctrl driver.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 drivers/pinctrl/sophgo/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index b14792ee46fc3ebf33250fefc377ca6138832f02..c05f909a88389c713b79210a8aa6dcdce67f1993 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -43,7 +43,7 @@ config PINCTRL_SOPHGO_SG2000
 	  pinctrl-sg2000.
 
 config PINCTRL_SOPHGO_SG2002
-	tristate "Sophgo SG2000 SoC Pinctrl driver"
+	tristate "Sophgo SG2002 SoC Pinctrl driver"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	depends on OF
 	select PINCTRL_SOPHGO_CV18XX

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241016-typo-pinctrl-sg2002-6a4cf61a08f8

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


