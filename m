Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE69162197A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 17:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbiKHQd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 11:33:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbiKHQd1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 11:33:27 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B2F10DC;
        Tue,  8 Nov 2022 08:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=f9G0WAtBAT0f6xAFVgeCKUf8svxnY1AWdstW1rdhfgw=; b=g8bSd63C2VYq1iS/ySQkXDG8Pj
        oQgoFV+FllSfThDxr7iFK/MljIqehaXHJ2EOoomUlAuWUuBAfF4+/EHqb/7Ahbi4C2dLrzrI8n7NX
        TBijDCiEhC5P0FKpRrmgA95CR10lXDYHi6GubEuA+6vbGv6MLWkj13Cvj5Hc2XooZCzmT39tfKF2K
        eFhO/xWD185ZDFAIJ9bLqTx+T2BtDqqhCky9Z2IgBku9SGTWVoeiH7hQd9no+jTnpbxilc5+dCQEm
        KRT2OjrfG3T6OixJSXbN6ul5T39DdAGfBFmTg0mZ0o0/4O6RCjxB0AuXJV+CamBU4Xw+mSHlSAV4X
        iCBd/5lA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37264 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1osRXP-0003RX-3P; Tue, 08 Nov 2022 16:33:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1osRXO-002mvw-Fp; Tue, 08 Nov 2022 16:33:22 +0000
In-Reply-To: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH v3 2/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 08 Nov 2022 16:33:22 +0000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 lib/test_printf.c                         | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 35 ++++++++++++++++----
 3 files changed, 93 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index dbe1aacc79d0..92a488884cf8 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -625,6 +625,38 @@ Passed by reference.
 	%p4cc	Y10  little-endian (0x20303159)
 	%p4cc	NV12 big-endian (0xb231564e)
 
+Generic FourCC code
+-------------------
+
+::
+	%p4c[hrbl]	gP00 (0x67503030)
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
+	%p4cr	00Pg (0x30305067)
+	%p4cb	00Pg (0x30305067)
+	%p4cl	gP00 (0x67503030)
+
+Examples for a big-endian machine, given &(u32)0x67503030::
+
+	%p4ch	gP00 (0x67503030)
+	%p4cr	00Pg (0x30305067)
+	%p4cb	gP00 (0x67503030)
+	%p4cl	00Pg (0x30305067)
+
 Rust
 ----
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 4bd15a593fbd..77a9128a6b5a 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -731,21 +731,46 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_nodes(softnodes);
 }
 
+struct fourcc_struct {
+	u32 code;
+	const char *str;
+};
+
+static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
+				       const char *fmt)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++)
+		test(fc[i].str, fmt, &fc[i].code);
+}
+
 static void __init fourcc_pointer(void)
 {
-	struct {
-		u32 code;
-		char *str;
-	} const try[] = {
+	struct fourcc_struct const try_cc[] = {
 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
 		{ 0x10111213, ".... little-endian (0x10111213)", },
 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
 	};
-	unsigned int i;
+	struct fourcc_struct const try_ch = {
+		0x41424344, "ABCD (0x41424344)",
+	};
+	struct fourcc_struct const try_cr = {
+		0x41424344, "DCBA (0x44434241)",
+	};
+	struct fourcc_struct const try_cl = {
+		le32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
+	struct fourcc_struct const try_cb = {
+		be32_to_cpu(0x41424344), "ABCD (0x41424344)",
+	};
 
-	for (i = 0; i < ARRAY_SIZE(try); i++)
-		test(try[i].str, "%p4cc", &try[i].code);
+	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
+	fourcc_pointer_test(&try_ch, 1, "%p4ch");
+	fourcc_pointer_test(&try_cr, 1, "%p4cr");
+	fourcc_pointer_test(&try_cl, 1, "%p4cl");
+	fourcc_pointer_test(&try_cb, 1, "%p4cb");
 }
 
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 24f37bab8bc1..17064b839f19 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1762,27 +1762,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	char output[sizeof("0123 little-endian (0x01234567)")];
 	char *p = output;
 	unsigned int i;
+	bool pixel_fmt = false;
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
+		pixel_fmt = true;
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
+	if (pixel_fmt) {
+		*p++ = ' ';
+		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
+		p += strlen(p);
+	}
 
 	*p++ = ' ';
 	*p++ = '(';
-- 
2.30.2

