Return-Path: <linux-gpio+bounces-24116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27079B1F56C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 18:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58D562702E
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 16:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE4F2BE7B0;
	Sat,  9 Aug 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="gHQ3E/56"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292932BE644
	for <linux-gpio@vger.kernel.org>; Sat,  9 Aug 2025 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754756731; cv=none; b=PgeOje5I0YwVmB+AV7YbOoLxnUJwCiqAcA11tz1JxGnT8uzCgnQhK96vfD0Le2LJxD/lCf6nQxmzLp16wa66cWtoTnD4xHueaV47yAw/Vj3wPxj06SMH6+Br9qL1z6+iGXK6FQeBgXhi/EDGHKAwQPfquTidzHdf2DfNNpopI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754756731; c=relaxed/simple;
	bh=1Hv8o9hqPxrhOTCbjdh5yB02ZbNjr2Ou0CSmQ1AIVJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnlLVSOWy8GtBXBJ+wYbuzLv+RvdOfH/Xrk/8VFmGZ8bEAk/mKQ/Y/NFX0+9oEVKWDBsKy1WqXRoqTXwI45P7mLM+6Nwl1xhQ78RC7Q7o5hJryYrgLL0H8ODlICxwWzmLeh9aRU+I4RsqiIOgR3tRvWIX+Ruv4x3Y6390V54ihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=gHQ3E/56; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id F210D104CFE1
	for <linux-gpio@vger.kernel.org>; Sat,  9 Aug 2025 21:55:20 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in F210D104CFE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1754756720; bh=1Hv8o9hqPxrhOTCbjdh5yB02ZbNjr2Ou0CSmQ1AIVJE=;
	h=Date:From:To:Cc:Subject:From;
	b=gHQ3E/564mRmdf7TVnjWW/4kJh2nw8D8556JXjz9EjNdSnUGUaWIdwJ5WpMJrut/x
	 kzyYJLpMaZsy0clRE7JYKEKwS6GnnAcREd9xqH1zvsC1OliKSZxeoRjHiWLi11NXWm
	 fNg3/yNHBv6FhcadSen2by+4nNkZyI/oPiYSGsMg=
Received: (qmail 24743 invoked by uid 510); 9 Aug 2025 21:55:20 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.467976 secs; 09 Aug 2025 21:55:20 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 9 Aug 2025 21:55:16 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id F2A5A341558;
	Sat,  9 Aug 2025 21:55:15 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id D1A641E8130A;
	Sat,  9 Aug 2025 21:55:15 +0530 (IST)
Date: Sat, 9 Aug 2025 21:55:10 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: linus.walleij@linaro.org, brgl@bgdev.pl, dianders@chromium.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: [PATCH] gpio: virtuser: remove debugfs_create_dir() error checks
Message-ID: <aJd2Zho5QRUTAEzm@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove return value checks for debugfs_create_dir() wherever
appropriate. Follow guidelines mentioned in [1] that callers
should ignore errors returned as other debugfs functions handle them
appropriately.
Refer commit 8bcbde2bb1374 ("debugfs: Document that debugfs_create
functions need not be error checked") to clean up unnecessary error checks
without impacting the functionality.

Fixes: 91581c4b3f29e ("gpio: virtuser: new virtual testing driver for the GPIO API")
Link: https://lore.kernel.org/all/20220222154555.1.I26d364db7a007f8995e8f0dac978673bc8e9f5e2@changeid/ [1]
Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpio/gpio-virtuser.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index a10eab7d2617..295b8718f39d 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -788,8 +788,6 @@ static int gpio_virtuser_dbgfs_init_line_array_attrs(struct device *dev,
 		return -ENOMEM;
 
 	data->ad.dbgfs_dir = debugfs_create_dir(name, dbgfs_entry);
-	if (IS_ERR(data->ad.dbgfs_dir))
-		return PTR_ERR(data->ad.dbgfs_dir);
 
 	return gpio_virtuser_create_debugfs_attrs(
 			gpio_virtuser_line_array_dbgfs_attrs,
@@ -825,8 +823,6 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 		return ret;
 
 	data->ad.dbgfs_dir = debugfs_create_dir(name, dbgfs_entry);
-	if (IS_ERR(data->ad.dbgfs_dir))
-		return PTR_ERR(data->ad.dbgfs_dir);
 
 	return gpio_virtuser_create_debugfs_attrs(
 				gpio_virtuser_line_dbgfs_attrs,
-- 
2.34.1


