Return-Path: <linux-gpio+bounces-7211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5798FDD83
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 05:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755E51C22239
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 03:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667C17C68;
	Thu,  6 Jun 2024 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="yqQ0yIQ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10119D8B9
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 03:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644704; cv=none; b=PzD7DItnJgINn+wrWbvgFh7n9zH4QmWnTqJvJzev156YpayqNoaoZdnaejCADQiqs7wal2jo4oQauuUrKXuYhyp9Pe5NivTsv5bdnYJosEIaFeNfoW1mc9L8nijQpsGTAI5Y2nQLf8H1g/+V5F6LNHRgsZpZ+lcK4P25OKSwhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644704; c=relaxed/simple;
	bh=OCL3Ex+PVBpmHW3XOiYtWSJwCKPoCASw0+8i+V5i7Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WwbGgeYzRdhylSUpFanxVPgtI3XdGZACHKGajHljA/fxtXxiTwqpfwuJ9pWK8sStnHjvq8K0Ru1C3IItcJz1sCFtdQFRkNdYy133uUIq81SJvtY4PwOhXLSzKwGeJuXijvoquXVONZHI6kUo3MN4fmgnKUtZ21LTxQQxHxDT/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=yqQ0yIQ8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F2AA12C0240;
	Thu,  6 Jun 2024 15:31:38 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717644698;
	bh=gaiZFPnhd6tKrZth0IDXYD7yP/yybZPgjqK3haH70o4=;
	h=From:To:Cc:Subject:Date:From;
	b=yqQ0yIQ8wyNBOrcq4Omg3cgCDEgz6Ek03EfmzrwUHkC9NXIGeRFSYLg/Q5bW+IG4K
	 YCIOTq+rNpPeWpYsb6pQdBHGYxtlXjkuRrQW3r1urL6InA16Z7B4nukRhnxgo9CSxe
	 PH7+H5r7B6wtS6eAv82zGMlujLP4lSrE04cutkex9Ys+vOmfgy5pQHw+a4m+/WXLio
	 hhyIcoKSJF2ILXn0NoFkoHmGN/cxk/97vEmApCkaHblavo3ecqir1XQEy2Qi0OMzft
	 qJvHAHvWm/MSEHJMAfPhUYrOpR3qmklGOxddEJJJ2EByEMCC+bHTjYpiniR8rSyRXr
	 MSGtq1Ysf9y0g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66612d9a0000>; Thu, 06 Jun 2024 15:31:38 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.16])
	by pat.atlnz.lc (Postfix) with ESMTP id BDE3313EE2B;
	Thu,  6 Jun 2024 15:31:38 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
	id BB23E41522; Thu,  6 Jun 2024 15:31:38 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] gpio: pca953x: Improve interrupt support
Date: Thu,  6 Jun 2024 15:31:02 +1200
Message-ID: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66612d9a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=g5V-TlOs_q8Ilh9uUIgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The GPIO drivers with latch interrupt support (typically types starting
with PCAL) have interrupt status registers to determine which particular
inputs have caused an interrupt. Unfortunately there is no atomic
operation to read these registers and clear the interrupt. Clearing the
interrupt is done by reading the input registers.

The code was reading the interrupt status registers, and then reading
the input registers. If an input changed between these two events it was
lost.

The solution in this patch is to revert to the non-latch version of
code, i.e. remembering the previous input status, and looking for the
changes. This system results in no more I2C transfers, so is no slower.
The latch property of the device still means interrupts will still be
noticed if the input changes back to its initial state.

Fixes: 44896beae605 ("gpio: pca953x: add PCAL9535 interrupt support for G=
alileo Gen2")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/gpio/gpio-pca953x.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 77a2812f2974..14b80cb00274 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -839,25 +839,6 @@ static bool pca953x_irq_pending(struct pca953x_chip =
*chip, unsigned long *pendin
 	DECLARE_BITMAP(trigger, MAX_LINE);
 	int ret;
=20
-	if (chip->driver_data & PCA_PCAL) {
-		/* Read the current interrupt status from the device */
-		ret =3D pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
-		if (ret)
-			return false;
-
-		/* Check latched inputs and clear interrupt status */
-		ret =3D pca953x_read_regs(chip, chip->regs->input, cur_stat);
-		if (ret)
-			return false;
-
-		/* Apply filter for rising/falling edge selection */
-		bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise, cu=
r_stat, gc->ngpio);
-
-		bitmap_and(pending, new_stat, trigger, gc->ngpio);
-
-		return !bitmap_empty(pending, gc->ngpio);
-	}
-
 	ret =3D pca953x_read_regs(chip, chip->regs->input, cur_stat);
 	if (ret)
 		return false;
--=20
2.45.2


