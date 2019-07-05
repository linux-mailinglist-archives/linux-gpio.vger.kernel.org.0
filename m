Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E10A60913
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 17:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfGEPRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 11:17:54 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53034 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726851AbfGEPRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 11:17:54 -0400
X-Greylist: delayed 2820 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jul 2019 11:17:53 EDT
Received: from [109.168.11.45] (port=37718 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hjPEh-0008XB-NR; Fri, 05 Jul 2019 16:30:51 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-gpio@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs/pinctrl: fix compile errors in example code
Date:   Fri,  5 Jul 2019 16:30:43 +0200
Message-Id: <20190705143043.1929-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The code in the example does not build for a few trivial errors: type
mismatch in callback, missing semicolon. Fix them to help newcomers using
the example as a starting point.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/driver-api/pinctl.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pinctl.rst
index 2bb1bc484278..3d2deaf48841 100644
--- a/Documentation/driver-api/pinctl.rst
+++ b/Documentation/driver-api/pinctl.rst
@@ -638,8 +638,8 @@ group of pins would work something like this::
 	}
 
 	static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
-				unsigned ** const pins,
-				unsigned * const num_pins)
+				const unsigned ** pins,
+				unsigned * num_pins)
 	{
 		*pins = (unsigned *) foo_groups[selector].pins;
 		*num_pins = foo_groups[selector].num_pins;
@@ -705,7 +705,7 @@ group of pins would work something like this::
 	{
 		u8 regbit = (1 << selector + group);
 
-		writeb((readb(MUX)|regbit), MUX)
+		writeb((readb(MUX)|regbit), MUX);
 		return 0;
 	}
 
-- 
2.22.0

