Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF6F2EA94A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 12:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbhAELAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 06:00:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:34914 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbhAELAH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Jan 2021 06:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=5Z/h+ME8AUW9R/gi8VlqqhsmcjO
        kXlyYSjntwgMqAOE=; b=OIYYVG8FDlkokw9pffPUR2t221HZ2dSOnsJUMIXJe88
        e94GpxB2kfIBL6cRlkW0V1zQLF9eS4AIcsrkY7eTl26G6ByWxRP/eSBqYobjEmju
        TJBr8szYEh+KbUqKZhO0eZriWFr86nn3ing17lufDx0PPcotXBcE/LEmwTooQz3w
        =
Received: (qmail 4186519 invoked from network); 5 Jan 2021 11:59:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 11:59:24 +0100
X-UD-Smtp-Session: l3s3148p1@jD17GSW49qEgAwDPXw7bAB85kpRY0Yua
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] gpio: gpiolib: remove shadowed variable
Date:   Tue,  5 Jan 2021 11:59:14 +0100
Message-Id: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After refactoring, we had two variables for the same thing. Remove the
second declaration, one is enough here. Found by cppcheck.

drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]

Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 611d6ea82d75..c354cc6ed826 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2548,7 +2548,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		struct gpio_chip *gc = desc_array[i]->gdev->chip;
 		unsigned long fastpath[2 * BITS_TO_LONGS(FASTPATH_NGPIO)];
 		unsigned long *mask, *bits;
-		int first, j, ret;
+		int first, j;
 
 		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath;
-- 
2.28.0

