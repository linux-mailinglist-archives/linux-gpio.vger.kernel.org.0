Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369091D72C8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 10:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgERISj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 04:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERISj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 04:18:39 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF7FC05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 01:18:38 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6c27:925d:6b9c:58b2])
        by michel.telenet-ops.be with bizsmtp
        id g8Jd2200G11gx4G068Jdt7; Mon, 18 May 2020 10:18:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaayr-0003ld-Af; Mon, 18 May 2020 10:18:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaayr-0006E3-8E; Mon, 18 May 2020 10:18:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Renesas Pin Controllers are supported
Date:   Mon, 18 May 2020 10:18:36 +0200
Message-Id: <20200518081836.23890-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change "PIN CONTROLLER - RENESAS" section from Maintained to Supported.
This brings it in line with my other "+renesas" entries.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.8.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d129b082d2ef3761..40a529f4219e1f01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13411,7 +13411,7 @@ F:	drivers/pinctrl/qcom/
 PIN CONTROLLER - RENESAS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
-S:	Maintained
+S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 F:	Documentation/devicetree/bindings/pinctrl/renesas,*
 F:	drivers/pinctrl/pinctrl-rz*
-- 
2.17.1

