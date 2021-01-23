Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F56C301866
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 21:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbhAWUpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 15:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbhAWUpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 15:45:08 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD7FC0613D6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 12:44:27 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gx1so362320pjb.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 12:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvMYNkNjGYNCHe9/NmoKStGyFrAuo/5RBiMGNky1jDI=;
        b=zlm0a4QU1AWPVm9ieuwbBVhX0aPmBGd73jAuu7PWo3AyOc4d/0jJM4aQRLOwarKUFo
         PAehHadbxwvhQpTU98gjj02eSuVcp9oC5nQWcqar2k6Dd1iYQlsgUFe8X6XMgqmUPcWR
         LBAgCM/spY7U0Y7mdeHhbLASePl+j7n4iuCEDb8BWebi8xqFpZ6Io55aDyfSY0jcYihU
         xmrM++dTiaiTfWnk7ir14Oz0X4Ll+epeEh/ChDqS0dmnAFR3srxw7YAshDU372EiF7pN
         hAkFRgjRSpWLd8WO2dVetDXA1x+rpbd5WyJvSOtIZGg7kGWX0JY7JaaqZZWW/CPyhLON
         lmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvMYNkNjGYNCHe9/NmoKStGyFrAuo/5RBiMGNky1jDI=;
        b=lb5wxN1GPyU0jpCDHwV9OoTppDBDSHpKS7oqM82oXGu2LP0OVFOYeo2almiCbAZJRI
         oQUfRJTxx2F0RWfnj+TJiQ7FkdDaqZSHNMM5BUooqkFk1pKYxPm0PwFcqwwf7mMhvdSV
         Q1jrx1xlVbKUA14dj33MCunH17PptQQmOHtIBPrydnYnOLvqvwg5Aq60NoMpbduJjcJi
         ao5vBr6lAFxj9HrkPgLp7GLYTOQtkIheDAksiydAAiKnE/GSJvhU7GqOWYO8Kmxs6vLF
         T3vJgQ6ijEboFUmIIpD7G8LKXD9EUK0BudONFLZwe7kCg4Ng4PVp8FrfR7/thX1dEjrj
         5jwQ==
X-Gm-Message-State: AOAM530i0lHwX8Eu5vHeQj0ebxADohV4Dt9K1+cUUIJBylWsv5SGbNI7
        mFO47taQ4h4GzOUnYyuNu4Tdx9eMSITlGA==
X-Google-Smtp-Source: ABdhPJxOMQTqxky8rjTpP+uglM/ara8rlsfxx/LrqAoUjFs2Mv/KRLB1P1EI+91yCSgg2Tf+IL+/Og==
X-Received: by 2002:a17:902:d4d0:b029:df:d246:ca81 with SMTP id o16-20020a170902d4d0b02900dfd246ca81mr11455044plg.58.1611434667049;
        Sat, 23 Jan 2021 12:44:27 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:c3d9:f9cb:a39f:c812])
        by smtp.gmail.com with ESMTPSA id me5sm12693639pjb.19.2021.01.23.12.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 12:44:26 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] pinctrl: pinmux: add function selector to pinmux-functions
Date:   Sat, 23 Jan 2021 12:22:14 -0800
Message-Id: <20210123202212.528046-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the function selector to the pinmux-functions debugfs output. This
is an integer which is the index into the pinmux function tree.  It will
make it easier to correlate function name to function selector without
having to count the lines in the output.

Example output of "pinmux-functions":

function 0: pinmux-uart0-pins, groups = [ pinmux-uart0-pins ]
function 1: pinmux-uart1-pins, groups = [ pinmux-uart1-pins ]
function 2: pinmux-uart2-pins, groups = [ pinmux-uart2-pins ]
function 3: pinmux-mmc0-pins, groups = [ pinmux-mmc0-pins ]
function 3: pinmux-mmc1-pins, groups = [ pinmux-mmc1-pins ]
function 5: pinmux-i2c0-pins, groups = [ pinmux-i2c0-pins ]
function 6: pinmux-i2c1-pins, groups = [ pinmux-i2c1-pins ]
function 7: pinmux-i2c2-pins, groups = [ pinmux-i2c2-pins ]
function 8: pinmux-pwm0-pins, groups = [ pinmux-pwm0-pins ]
function 9: pinmux-pwm1-pins, groups = [ pinmux-pwm1-pins ]
function 10: pinmux-adc-pins, groups = [ pinmux-adc-pins ]

Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Patch note:
This may seem trivial but I found myself coming up with series of pipes
in the shell just so I could see the function selector in line with the
function names. At first, I thought I could just pipe to 'cat -n' but
that counts at offset 1 instead of 0. The only downside I can see to
this patch would be if someone is depending on the existing format but
I don't believe that is a concern for debugfs, right?

 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 326b3fc41b55..b09021b8d3ba 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -564,7 +564,7 @@ static int pinmux_functions_show(struct seq_file *s, void *what)
 			continue;
 		}
 
-		seq_printf(s, "function: %s, groups = [ ", func);
+		seq_printf(s, "function %d: %s, groups = [ ", func_selector, func);
 		for (i = 0; i < num_groups; i++)
 			seq_printf(s, "%s ", groups[i]);
 		seq_puts(s, "]\n");
-- 
2.25.1

