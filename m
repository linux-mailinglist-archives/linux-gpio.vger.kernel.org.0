Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4730C5AE953
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240417AbiIFNTw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240410AbiIFNTu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:19:50 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792B81DA48;
        Tue,  6 Sep 2022 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Bo5o2gfQBOp1/WUNsVSQGZ63kyAmLRQHzYhaX9J4aSQ=; b=ofYxUHhRJsQhp71zA13LjzpFl4
        RygXoRzllMG5gk0ZRvEtjmPUvE0kbIN89ZYSE+0U0RU4G8Hgo2njdIRp/3A7F1v214A/d5NySlkHu
        84thZSm2EaZPUCgYoSfe70jL9MXiMBmgk8UuQmiJOB8GB3PIqF8avls0UPuCKPVpcvPX01Dd3NKm4
        iIDApKGxKPPbwQh9mYohmu1KZ6XgsGERg9k4zxCJ0rMUl+XMg1awpOPpRmWNrMaLeQkxtE32zi19W
        m6wXLnYvO/djNoq9PwmXycPsEZZHCxxRv7eXDPEVVsfPr7Iq2jRHN7qUz59yBxHUyZPsRFJ7T0D5j
        k+gsFzHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38434 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUT-0003rh-88; Tue, 06 Sep 2022 14:19:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUS-005CmS-IA; Tue, 06 Sep 2022 14:19:44 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:44 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

%p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
it's useful to be able to print generic 4-character codes formatted as
an integer. Extend it to add format specifiers for printing generic
32-bit FOURCCs with various endian semantics:

%p4ch   Host-endian
%p4cl	Little-endian
%p4cb	Big-endian
%p4cr	Reverse-endian

The endianness determines how bytes are interpreted as a u32, and the
FOURCC is then always printed MSByte-first (this is the opposite of
V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
allow printing LSByte-first FOURCCs stored in host endian order
(other than the hex form being in character order, not the integer
value).

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++++
 lib/vsprintf.c                            | 35 +++++++++++++++++++----
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 5e89497ba314..22c33398ec02 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -625,6 +625,38 @@ Passed by reference.
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
 
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hnbl]	gP00 (0x67503030)
+
+Print a generic FourCC code, as both ASCII characters and its numerical
+value as hexadecimal.
+
+The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
+host, reversed, big or little endian order data respectively. Host endian
+order means the data is interpreted as a 32-bit integer and the most
+significant byte is printed first; that is, the character code as printed
+matches the byte order stored in memory on big-endian systems, and is reversed
+on little-endian systems.
+
+Passed by reference.
+
+Examples for a little-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cl	gP00 (0x67503030)
+	%p4cb	00Pg (0x30305067)
+	%p4cr	00Pg (0x30305067)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cl	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+
 Thanks
 ======
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3c1853a9d1c0..31707499f90f 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1757,27 +1757,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p = output;
 	unsigned int i;
+	bool pix_fmt = false;
 	u32 orig, val;
 
-	if (fmt[1] != 'c' || fmt[2] != 'c')
+	if (fmt[1] != 'c')
 		return error_string(buf, end, "(%p4?)", spec);
 
 	if (check_pointer(&buf, end, fourcc, spec))
 		return buf;
 
 	orig = get_unaligned(fourcc);
-	val = orig & ~BIT(31);
+	switch (fmt[2]) {
+	case 'h':
+		val = orig;
+		break;
+	case 'r':
+		val = orig = swab32(orig);
+		break;
+	case 'l':
+		val = orig = le32_to_cpu(orig);
+		break;
+	case 'b':
+		val = orig = be32_to_cpu(orig);
+		break;
+	case 'c':
+		/* Pixel formats are printed LSB-first */
+		val = swab32(orig & ~BIT(31));
+		pix_fmt = true;
+		break;
+	default:
+		return error_string(buf, end, "(%p4?)", spec);
+	}
 
 	for (i = 0; i < sizeof(u32); i++) {
-		unsigned char c = val >> (i * 8);
+		unsigned char c = val >> ((3 - i) * 8);
 
 		/* Print non-control ASCII characters as-is, dot otherwise */
 		*p++ = isascii(c) && isprint(c) ? c : '.';
 	}
 
-	*p++ = ' ';
-	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
-	p += strlen(p);
+	if (pix_fmt) {
+		*p++ = ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p += strlen(p);
+	}
 
 	*p++ = ' ';
 	*p++ = '(';
-- 
2.30.2

