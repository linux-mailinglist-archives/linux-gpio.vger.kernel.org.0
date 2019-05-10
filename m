Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2866C19B72
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfEJKSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 06:18:39 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34258 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727053AbfEJKSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 May 2019 06:18:39 -0400
X-Greylist: delayed 4491 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 May 2019 06:18:38 EDT
Received: from [109.168.11.45] (port=41190 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.91)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hP1RO-00BW8N-TP; Fri, 10 May 2019 11:03:43 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-gpio@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: gpio: remove duplicated lines
Date:   Fri, 10 May 2019 11:03:39 +0200
Message-Id: <20190510090339.17211-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.21.0
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

The 'default (active high)' lines are repeated twice. Avoid people stare at
their screens looking for differences.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/driver-api/gpio/consumer.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 5e4d8aa68913..23d68c321c5c 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -283,8 +283,6 @@ To summarize::
   gpiod_set_value(desc, 1);          default (active high)  high
   gpiod_set_value(desc, 0);          active low             high
   gpiod_set_value(desc, 1);          active low             low
-  gpiod_set_value(desc, 0);          default (active high)  low
-  gpiod_set_value(desc, 1);          default (active high)  high
   gpiod_set_value(desc, 0);          open drain             low
   gpiod_set_value(desc, 1);          open drain             high impedance
   gpiod_set_value(desc, 0);          open source            high impedance
-- 
2.21.0

