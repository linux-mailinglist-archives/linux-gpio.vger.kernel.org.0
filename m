Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26A9446F2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfFMQzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:55:49 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:39797 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbfFMB4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 21:56:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5D1taul028457;
        Thu, 13 Jun 2019 10:55:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5D1taul028457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560390937;
        bh=ScZXfHA5I2OdP0oKcfk/XaGT5+lYTeZZPKTtupuCqFo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wGOQC5UfgE5jFShf/DcKOesKN/tflZU+OFAXLnTpi2DK00LmTchvDpv9kXYrRypvh
         /MMn7w8kTUE69p/3XoqZQUwi7r74i72GoCRsHTFW4ZMzUyYOyXPfZElDDAda9f6JCd
         X2N85gojmHqJQy6CBoYXnooIwQWAF6Y+6oJBEfr14Fs1VYWYJF28nhT88YodynHUvd
         Lt/n7kuuFz92eSzfnufINmBoXWu5rNrS05pn4shVrEIrJJRMHJ10yMDpGCoNMKxJQU
         FB8yDffdHwxSJXDVBLE5xWDr2YXwAI4T1Yy06O2jfK+SsMCNVApDJXcxqGuuO3n3vx
         2nghYO0T9EwTg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: make pinconf.h self-contained
Date:   Thu, 13 Jun 2019 10:55:32 +0900
Message-Id: <20190613015532.19685-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613015532.19685-1-yamada.masahiro@socionext.com>
References: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This header uses 'bool', but it does not include any header by itself.

So, it could cause unknown type name error, depending on the header
include order, although probably <linux/types.h> has been included by
someone else.

Include <linux/types.h> to make it self-contained.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinconf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/pinconf.h
index eb16a1e0bcfa..f8a8215e9021 100644
--- a/include/linux/pinctrl/pinconf.h
+++ b/include/linux/pinctrl/pinconf.h
@@ -11,6 +11,8 @@
 #ifndef __LINUX_PINCTRL_PINCONF_H
 #define __LINUX_PINCTRL_PINCONF_H
 
+#include <linux/types.h>
+
 struct pinctrl_dev;
 struct seq_file;
 
-- 
2.17.1

