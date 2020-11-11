Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC2C2AF1B8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 14:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgKKNJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 08:09:49 -0500
Received: from smtp.asem.it ([151.1.184.197]:53843 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbgKKNJt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 08:09:49 -0500
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Nov 2020 08:09:49 EST
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000600611.MSG 
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:04:40 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 14:04:38 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 11 Nov 2020 14:04:38 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1] Documentation: ACPI: explain how to use gpio-line-names
Date:   Wed, 11 Nov 2020 14:04:35 +0100
Message-ID: <20201111130435.432982-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090211.5FABE166.00A7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "gpio-line-names" declaration is not fully
documented, so can be useful to add some important
information and one more example.

This commit also fix a trivial syntax error.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 .../firmware-guide/acpi/gpio-properties.rst   | 58 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/firmware-guide/acpi/gpio-properties.rst b/Documentation/firmware-guide/acpi/gpio-properties.rst
index bb6d74f23ee0..a9f4dfa932cc 100644
--- a/Documentation/firmware-guide/acpi/gpio-properties.rst
+++ b/Documentation/firmware-guide/acpi/gpio-properties.rst
@@ -107,7 +107,61 @@ Example::
 
 - gpio-line-names
 
-Example::
+The "gpio-line-names" declaration is a list of strings ("names"), which
+describes each line/pin of a GPIO controller/expander.
+This list, contained in a package, must be inserted inside the GPIO controller
+declaration of an ACPI table (typically inside the DSDT).
+The gpio-line-names list must respect the following rules (see also the
+examples):
+
+  - the first name in the list corresponds with the first line/pin of the GPIO
+    controller/expander
+  - the names inside the list must be consecutive (no "holes" are permitted)
+  - the list can be incomplete and can end before the last GPIO line: in
+    other words, it is not mandatory to fill all the GPIO lines
+  - empty names are allowed (two quotation marks "" correspond to an empty name)
+
+Example of a GPIO controller of 16 lines, with an incomplete list with two
+empty names::
+
+  Package () {
+      "gpio-line-names",
+      Package () {
+          "pin_0",
+          "pin_1",
+          "",
+          "",
+          "pin_3",
+          "pin_4_push_button"
+      }
+  }
+
+At runtime, the above declaration produces the following result (using the
+"libgpiod" tools)::
+
+  root@debian:~# gpioinfo gpiochip4
+  gpiochip4 - 16 lines:
+          line   0:      "pin_0"       unused   input  active-high
+          line   1:      "pin_1"       unused   input  active-high
+          line   2:      unnamed       unused   input  active-high
+          line   3:      unnamed       unused   input  active-high
+          line   4:      "pin_3"       unused   input  active-high
+          line   5: "pin_4_push_button" unused input active-high
+          line   6:      unnamed       unused   input  active-high
+          line   7       unnamed       unused   input  active-high
+          line   8:      unnamed       unused   input  active-high
+          line   9:      unnamed       unused   input  active-high
+          line  10:      unnamed       unused   input  active-high
+          line  11:      unnamed       unused   input  active-high
+          line  12:      unnamed       unused   input  active-high
+          line  13:      unnamed       unused   input  active-high
+          line  14:      unnamed       unused   input  active-high
+          line  15:      unnamed       unused   input  active-high
+  root@debian:~# gpiofind pin_4_push_button
+  gpiochip4 5
+  root@debian:~#
+
+Another example::
 
   Package () {
       "gpio-line-names",
@@ -191,7 +245,7 @@ The driver might expect to get the right GPIO when it does::
 but since there is no way to know the mapping between "reset" and
 the GpioIo() in _CRS desc will hold ERR_PTR(-ENOENT).
 
-The driver author can solve this by passing the mapping explictly
+The driver author can solve this by passing the mapping explicitly
 (the recommended way and documented in the above chapter).
 
 The ACPI GPIO mapping tables should not contaminate drivers that are not
-- 
2.25.1

