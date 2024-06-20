Return-Path: <linux-gpio+bounces-7574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB890FC0E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 06:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6DD1C215A3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 04:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACE322625;
	Thu, 20 Jun 2024 04:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="sIvtjV9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com [67.231.157.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2245418EBF;
	Thu, 20 Jun 2024 04:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718859228; cv=none; b=RYS6FBe5bCSTVgjGNEt71wN1XI+WCbbwGWQIr4ZMbjX6WDZqmhBOPZnNUJgCCWxMgjTEymwdzyjRZsHw6A+XA8U3ZSK74rNeHAQyRZRiHbCz94L9Bm3CJcnw+MBiOQRcx0z23yiNSN2RorK5KyYzvmm6dLkLTdgNVGWxFAGdi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718859228; c=relaxed/simple;
	bh=ps1EQme9Za+9oV+doWsBcMNAJHRJD+o/bSmKq/ZmNeM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BWPxV6rJDB7Yj36yRTJ+moS0tq+lfD64zFptV32TNBmV5h8qzxjsPfwRXQ0sYYuEF2cacUTG6mYndAJVfc8cE4bo2rd8TLwgtuZoz3Occ+sj4QybskEzXqlzw8NRRWTyRvMzOu9oOyyzGQUEguKU17/nXPaxMss3DxslVNyoTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=sIvtjV9V; arc=none smtp.client-ip=67.231.157.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 45K3MsRF029745;
	Thu, 20 Jun 2024 00:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=outbound; bh=j1pYCW2DIFQa
	Oc9Tpva6qgWX48ZWEqZARYmhzcYTGlo=; b=sIvtjV9VQlPm0rM/XfWNVzbv78km
	UWNMaw+vVDPXD5ojoo1mp6wj0drUIiMWNwbYOJCmQ/hk986GdKa/NAGDnVDI4akl
	JPZkB/KuKOlnPDt/5hE+HlIaz+Cg1WHHuOQq20M9s5X8WaRT6zdbpLno/5MBFibG
	hcapMuuEotRuDmrikboxZifrcDI7/tMQkoCLpnIecGLX2mABKbJHorQs2tBEP7T8
	VLEmbLgHIMUwmjCanRiDs27hLCz5JWKxxM1TnrpU4tZB48Iwq68P7k9RtiabKeFz
	BGXWISFk3sB+yOd8ebWLFoWxH8Z5Kep84Gn71/pD3c7QDSzxJ8hqC2bpKg==
From: Ian Ray <ian.ray@gehealthcare.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ian Ray <ian.ray@gehealthcare.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Thu, 20 Jun 2024 07:29:15 +0300
Message-Id: <20240620042915.2173-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xlB3O7y49raH92gZG56nf2fQy7ntqn9V
X-Proofpoint-ORIG-GUID: xlB3O7y49raH92gZG56nf2fQy7ntqn9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200030

Ensure that `i2c_lock' is held when setting interrupt latch and mask in
pca953x_irq_bus_sync_unlock() in order to avoid races.

The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
lock is held before calling pca953x_write_regs().

The problem occurred when a request raced against irq_bus_sync_unlock()
approximately once per thousand reboots on an i.MX8MP based system.

 * Normal case

   0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3

 * Race case

   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 77a2812f2974..732a6964748c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -758,6 +758,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	int level;
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.39.2


