Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63267283087
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgJEHDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:03:02 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8869BC0613CE;
        Mon,  5 Oct 2020 00:03:02 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so6200802pfc.7;
        Mon, 05 Oct 2020 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdYIVgI4n9+eIXSWNl8hCgM/Orv/73d8eXm3ox+1Bvg=;
        b=D3lIrlki6OBjMUooYn06CVt0oWLi4Ybtn96ssD5v2aFpKehk9okXIhWtghu8PQEoCf
         zEuWhieq+PcdWnc1hNfcpDyuixCko/7r73xTS2qwCh2jJ7ikFeA/rDIAYYlDX33JXJW4
         I0F+YDyz6pVHSPY++GBYsvD71DHqEngxlLDIIY59/AZPmbNID2AtCa6WeP9Fc4XI+iGK
         NpUyOOWFUyPkLCPjFl7DxBFNUbESzbTCuaNMspfZ3KgESj20SJllo0na8luWUE4i4RQi
         Wl3hTi0dokpnUf2dxhQnXxhXPsLOGf/J9+sqmI0qvWLYLm9m0s2OCb5mejPXjvcb19y1
         lJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdYIVgI4n9+eIXSWNl8hCgM/Orv/73d8eXm3ox+1Bvg=;
        b=HdGFL3hZHUmoYW7x1hCj/Eup8+Ubdq94tSK6CvvvzCJ6BGUCrA3Nbl/kuesQwnMH9j
         kUJXvLdTmoJHZKhnN5asUCKxQ0ZaslS/A/qFhX1osmgofg9paz3obccBSzBOMP+oWl3N
         Cqpx64jMCoyPrTSGIKbAFTsa6K9ZWC8V7DWVmwYDu9teo1yIdGK1b+x52dFjYeMb34iP
         Q7gQKWQstGsmq86cQD4nRjQvxP90Q+xIs8fHQW+fvmT+PvoPXUY8dzCvK0dJCcS/bwzT
         XcxLl7MHTTLzSaF5R/M3bryZU4WvygNxB5i8BtI72bQXUWtLGPm+198JmWgA8z7dxjdT
         4YVw==
X-Gm-Message-State: AOAM533mo+aomPTOfCbXKUauajqT7WFxm7tULgdjICm4nsmALJ3piTGA
        unUWNVt227FcifU3sDQPudeO8gu6rAynZg==
X-Google-Smtp-Source: ABdhPJw1djVNAva+dusKY7gcKuVR2UvLLQLAFqRbNGpAhwVISIxANWQurE5TF9h9u9W/9Upm1vldiA==
X-Received: by 2002:aa7:8001:0:b029:142:2501:34e6 with SMTP id j1-20020aa780010000b0290142250134e6mr15924953pfi.63.1601881381467;
        Mon, 05 Oct 2020 00:03:01 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id j4sm10567908pfj.143.2020.10.05.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:03:00 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] gpiolib: cdev: switch from kstrdup() to kstrndup()
Date:   Mon,  5 Oct 2020 15:02:46 +0800
Message-Id: <20201005070246.20927-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use kstrndup() to copy line labels from the userspace provided char
array, rather than ensuring the char array contains a null terminator
and using kstrdup().

Note that the length provided to kstrndup() still assumes that the char
array does contain a null terminator, so the maximum string length is one
less than the array.  This is consistent with the previous behaviour.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

The change to kstrndup() was suggested by Andy as part of the review of
the uAPI v2.  This patch is my initial interpretion of that suggestion,
applied to both the v2 case and the two corresponding v1 cases.

I have since realized that the consumer_label is copied back to userspace,
so in the existing code the consumer_label, which may have been modified,
is implicitly a return value.  I doubt that is intentional or that it is
used as such, but strictly speaking this change may break the v1 ABI??
If so, it will be necessary to restore the setting of the last array entry
to '\0'.

Cheers,
Kent.

 drivers/gpio/gpiolib-cdev.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 73386fcc252d..94733aab3224 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -307,11 +307,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	lh->gdev = gdev;
 	get_device(&gdev->dev);
 
-	/* Make sure this is terminated */
-	handlereq.consumer_label[sizeof(handlereq.consumer_label)-1] = '\0';
-	if (strlen(handlereq.consumer_label)) {
-		lh->label = kstrdup(handlereq.consumer_label,
-				    GFP_KERNEL);
+	if (handlereq.consumer_label[0] != '\0') {
+		/* label is only initialized if consumer_label is set */
+		lh->label = kstrndup(handlereq.consumer_label,
+				     sizeof(handlereq.consumer_label) - 1,
+				     GFP_KERNEL);
 		if (!lh->label) {
 			ret = -ENOMEM;
 			goto out_free_lh;
@@ -1322,11 +1322,10 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		INIT_DELAYED_WORK(&lr->lines[i].work, debounce_work_func);
 	}
 
-	/* Make sure this is terminated */
-	ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
-	if (strlen(ulr.consumer)) {
+	if (ulr.consumer[0] != '\0') {
 		/* label is only initialized if consumer is set */
-		lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
+		lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1,
+				     GFP_KERNEL);
 		if (!lr->label) {
 			ret = -ENOMEM;
 			goto out_free_linereq;
@@ -1711,11 +1710,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	le->gdev = gdev;
 	get_device(&gdev->dev);
 
-	/* Make sure this is terminated */
-	eventreq.consumer_label[sizeof(eventreq.consumer_label)-1] = '\0';
-	if (strlen(eventreq.consumer_label)) {
-		le->label = kstrdup(eventreq.consumer_label,
-				    GFP_KERNEL);
+	if (eventreq.consumer_label[0] != '\0') {
+		/* label is only initialized if consumer_label is set */
+		le->label = kstrndup(eventreq.consumer_label,
+				     sizeof(eventreq.consumer_label) - 1,
+				     GFP_KERNEL);
 		if (!le->label) {
 			ret = -ENOMEM;
 			goto out_free_le;

base-commit: 237d96164f2c2b33d0d5094192eb743e9e1b04ad
-- 
2.28.0

