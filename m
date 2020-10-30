Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C8229FED5
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 08:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgJ3Hmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 03:42:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:51632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbgJ3HlF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:05 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CFE222384;
        Fri, 30 Oct 2020 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043663;
        bh=JsDKl8+JtAOCquFD5l6E21oCMVCqHRJN0hdFj0DOnAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DiQHyIRoUymutn14pUPz1if/nEXZJfiR7kvTEMU4nTX9CXEXEHZtwg0Vtj9Ily/1W
         GaDQLpUmZ5oZ1lWmin7TTMcyISYlHyUMEsZIBP1kzaHaBMgLFxNL+bcb9vhWT8MB77
         QX+O9VuPDXpcAQbuSq2/rbVbCBznC9mlat0kxAl8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1x-004OgL-91; Fri, 30 Oct 2020 08:41:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/39] docs: ABI: don't escape ReST-incompatible chars from obsolete and removed
Date:   Fri, 30 Oct 2020 08:40:43 +0100
Message-Id: <472f4574b6aa2ff4de5a819db1a4a5c9a34f5168.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With just a single fix, the contents there can be parsed properly
without the need to escape any ReST incompatible stuff.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/obsolete/sysfs-gpio      | 2 ++
 Documentation/admin-guide/abi-obsolete.rst | 1 +
 Documentation/admin-guide/abi-removed.rst  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index e0d4e5e2dd90..b8b0fd341c17 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -13,6 +13,8 @@ Description:
   GPIOs are identified as they are inside the kernel, using integers in
   the range 0..INT_MAX.  See Documentation/admin-guide/gpio for more information.
 
+  ::
+
     /sys/class/gpio
 	/export ... asks the kernel to export a GPIO to userspace
 	/unexport ... to return a GPIO to the kernel
diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index cda9168445a5..d095867899c5 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -8,3 +8,4 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: $srctree/Documentation/ABI/obsolete
+   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index 497978fc9632..f7e9e43023c1 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -2,3 +2,4 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: $srctree/Documentation/ABI/removed
+   :rst:
-- 
2.26.2

