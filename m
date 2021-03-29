Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076DB34CE9E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhC2LRb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:17:31 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55194 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232053AbhC2LRY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 07:17:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id CD1AE35AD;
        Mon, 29 Mar 2021 13:17:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Db6Qi0dBYn4c; Mon, 29 Mar 2021 13:17:22 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id A3ABC35D7; Mon, 29 Mar 2021 13:17:22 +0200 (CEST)
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
Subject: [PATCH 3/3] docs: kernel-parameters: Add gpio_mockup_named_lines
Date:   Mon, 29 Mar 2021 13:16:48 +0200
Message-Id: <20210329111648.7969-4-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-1-ada@thorsis.com>
References: <20210329111648.7969-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Missing since introduced in the driver.

Fixes: commit 8a68ea00a62e ("gpio: mockup: implement naming the lines")
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 782dc6d9b7fb..4b12f944ca44 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1464,6 +1464,8 @@
 	gpio-mockup.gpio_mockup_ranges
 			[HW] Sets the ranges of gpiochip of for this device.
 			Format: <start1>,<end1>,<start2>,<end2>...
+	gpio-mockup.gpio_mockup_named_lines
+			[HW] Let the driver know GPIO lines should be named.
 
 	gpt		[EFI] Forces disk with valid GPT signature but
 			invalid Protective MBR to be treated as GPT. If the
-- 
2.20.1

