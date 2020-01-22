Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F3A144C52
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 08:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgAVHEn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 02:04:43 -0500
Received: from mga05.intel.com ([192.55.52.43]:11617 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgAVHEn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 02:04:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 23:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; 
   d="scan'208";a="259360640"
Received: from pg-nxl3.altera.com ([10.142.129.93])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2020 23:04:39 -0800
From:   "Ooi, Joyce" <joyce.ooi@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joyce Ooi <joyce.ooi@intel.com>,
        See Chin Liang <chin.liang.see@intel.com>,
        Tan Ley Foon <ley.foon.tan@intel.com>,
        Loh Tien Hock <tien.hock.loh@intel.com>, Ooi@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Replace Tien Hock Loh as Altera PIO maintainer
Date:   Wed, 22 Jan 2020 15:04:21 +0800
Message-Id: <20200122070421.130524-1-joyce.ooi@intel.com>
X-Mailer: git-send-email 2.13.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch is to replace Tien Hock Loh as Altera PIO maintainer as he
has moved to a different role.

Signed-off-by: Ooi, Joyce <joyce.ooi@intel.com>
---
 MAINTAINERS |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a049abc..3401c4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,7 +726,7 @@ S:	Maintained
 F:	drivers/mailbox/mailbox-altera.c
 
 ALTERA PIO DRIVER
-M:	Tien Hock Loh <thloh@altera.com>
+M:	Joyce Ooi <joyce.ooi@intel.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
-- 
1.7.1

