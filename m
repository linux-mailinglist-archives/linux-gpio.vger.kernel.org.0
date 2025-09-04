Return-Path: <linux-gpio+bounces-25605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C219B44044
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 17:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 460C1189E8D9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947E525A337;
	Thu,  4 Sep 2025 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="tls13l0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3421B85F8
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998993; cv=none; b=HUK7tBvVdXya9+dvyZzD4XImO/8mMc8M4Kg9EWwlG5TeDwOVdCs7fniBWNgY3lwFeP9EifedNMMVqtvhi3+rA0RojKcMXNJRKsfCtiJNS+SA3fqNfEsUIFt5QC6B+AnvvRQuwikWtpayNm27jVpUu+e3GPI5rjS5abFvdy0wQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998993; c=relaxed/simple;
	bh=kGHx+2hvlk+s/C5InmRZGzQib9BkkISU8qMkaFbeH2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfgRJEJ5sXQpOYy9GwhfDYpsNqnPleMd5vHTYoRZVe1f5NSjXloTrrT7V9TjtKmRaspdVqzJwVL9qu+CyQEviB4gwubWDMuhF0IbYqJ/ocITR2f6C3dIgBUl6x1lkeGULstzAgzOCAVZK6+GluhJssfBtYwgU5RIYbt3aHY8Sp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=tls13l0o; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 1B0E8104D004
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 20:46:17 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 1B0E8104D004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756998977; bh=kGHx+2hvlk+s/C5InmRZGzQib9BkkISU8qMkaFbeH2c=;
	h=Date:From:To:Cc:Subject:From;
	b=tls13l0oHdoB0mkCCtbv0Q7xKoASSioyJQxINbQOFRuhWmfpjMyRZ59vLJfz4vwNQ
	 Nn41L2YsEaypntzvM15ZkP4wzBysRrjjPIZxmONF4gafuAflnvGE02GFwA60NQrruh
	 N+0cm+SOmpQl2wjMaJAJ03vnaoZCg5p7O4OWv3ng=
Received: (qmail 11093 invoked by uid 510); 4 Sep 2025 20:46:17 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.134336 secs; 04 Sep 2025 20:46:17 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 4 Sep 2025 20:46:14 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 8B3E236004B;
	Thu,  4 Sep 2025 20:46:14 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 6E9C91E81442;
	Thu,  4 Sep 2025 20:46:14 +0530 (IST)
Date: Thu, 4 Sep 2025 20:46:09 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: [PATCH] gpio: Kconfig: Update help for GPIO_PCA953X
Message-ID: <aLmtOWjAWPtWe/gH@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update help description with supported ICs from gpio-pca953x.c
Include missing IC names.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpio/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..02e4cf83b9bf 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1194,14 +1194,18 @@ config GPIO_PCA953X
 	  4 bits:       pca9536, pca9537
 
 	  8 bits:       max7310, max7315, pca6107, pca9534, pca9538, pca9554,
-	                pca9556, pca9557, pca9574, tca6408, tca9554, xra1202
+	                pca9556, pca9557, pca9574, tca6408, tca9554, xra1202,
+			pcal6408, pcal9554b, tca9538
 
 	  16 bits:      max7312, max7313, pca9535, pca9539, pca9555, pca9575,
-	                tca6416
+	                tca6416, pca6416, pcal6416, pcal9535, pcal9555a, max7318,
+			tca9539
 
-	  24 bits:      tca6424
+	  18 bits:	tca6418
 
-	  40 bits:      pca9505, pca9698
+	  24 bits:      tca6424, pcal6524
+
+	  40 bits:      pca9505, pca9698, pca9506
 
 config GPIO_PCA953X_IRQ
 	bool "Interrupt controller support for PCA953x"
-- 
2.34.1


