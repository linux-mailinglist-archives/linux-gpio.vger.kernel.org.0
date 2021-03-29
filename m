Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6377B34CE9C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhC2LRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:17:31 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55178 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232048AbhC2LRW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 07:17:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id B345935AD;
        Mon, 29 Mar 2021 13:17:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 333pmk5DOojx; Mon, 29 Mar 2021 13:17:20 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 83F6E3585; Mon, 29 Mar 2021 13:17:20 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Dahl <ada@thorsis.com>
Subject: [PATCH 2/3] docs: kernel-parameters: Move gpio-mockup for alphabetic order
Date:   Mon, 29 Mar 2021 13:16:47 +0200
Message-Id: <20210329111648.7969-3-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-1-ada@thorsis.com>
References: <20210329111648.7969-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes: commit 0f98dd1b27d2 ("gpio/mockup: add virtual gpio device")
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04545725f187..782dc6d9b7fb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1461,6 +1461,10 @@
 			Don't use this when you are not running on the
 			android emulator
 
+	gpio-mockup.gpio_mockup_ranges
+			[HW] Sets the ranges of gpiochip of for this device.
+			Format: <start1>,<end1>,<start2>,<end2>...
+
 	gpt		[EFI] Forces disk with valid GPT signature but
 			invalid Protective MBR to be treated as GPT. If the
 			primary GPT is corrupted, it enables the backup/alternate
@@ -1484,10 +1488,6 @@
 			Format: <unsigned int> such that (rxsize & ~0x1fffc0) == 0.
 			Default: 1024
 
-	gpio-mockup.gpio_mockup_ranges
-			[HW] Sets the ranges of gpiochip of for this device.
-			Format: <start1>,<end1>,<start2>,<end2>...
-
 	hardlockup_all_cpu_backtrace=
 			[KNL] Should the hard-lockup detector generate
 			backtraces on all cpus.
-- 
2.20.1

