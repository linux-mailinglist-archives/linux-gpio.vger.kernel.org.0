Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1B93D3252
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 05:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbhGWDIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 23:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhGWDIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 23:08:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35549C061575
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=ftxXD+615Sr9nOCpiYUCXYRWxt8w1W0jBYcrbNw9gUM=; b=QdogLg15yH+3jnjlnYrKRd6Dqm
        X6eWDuihL7IX278H+wtGKb5i13JqkZGCgeqGtvviF++bp6ieuUcjLFh6p0vTCwQR5iS0Ubpx9p/nv
        yhgcUmMbi8TLkWRfnKPr0Rfw+OFV56nf8hRlvJphzjSS/LpSP9sB9Ret5jRU7RF9xTAb5CJA8NmrB
        BwjuvxE3wcr0mh+kKqxMp+VcrH4MrkqgfhnlX952yGWHfDcX892InBS7Nlpb8rBSWFfXIqE0QFDR2
        vjtF1I+tnGe/nigtOazk6qkqj0anqn4IbeQDXqMs/2Cj3EH+oFx+pEVGTMGPSFVBgiqnD/4OsbFLz
        czN3gNXg==;
Received: from [2601:1c0:6280:3f0::a22f] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m6mB2-00AxAt-TO; Fri, 23 Jul 2021 03:48:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: placate kernel-doc warnings
Date:   Thu, 22 Jul 2021 20:48:40 -0700
Message-Id: <20210723034840.8752-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Eliminate kernel-doc warnings in drivers/pinctrl/aspeed by using
proper kernel-doc notation.

Fixes these kernel-doc warnings:

drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Query the enabled or disabled state for a mux function's signal on a pin
drivers/pinctrl/aspeed/pinctrl-aspeed.c:135: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Search for the signal expression needed to enable the pin's signal for the

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c |    4 ++--
 drivers/pinctrl/aspeed/pinmux-aspeed.c  |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20210722.orig/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ linux-next-20210722/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -59,7 +59,8 @@ int aspeed_sig_desc_eval(const struct as
 }
 
 /**
- * Query the enabled or disabled state for a mux function's signal on a pin
+ * aspeed_sig_expr_eval - Query the enabled or disabled state for a
+ * mux function's signal on a pin
  *
  * @ctx: The driver context for the pinctrl IP
  * @expr: An expression controlling the signal for a mux function on a pin
--- linux-next-20210722.orig/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ linux-next-20210722/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -133,8 +133,8 @@ static int aspeed_disable_sig(struct asp
 }
 
 /**
- * Search for the signal expression needed to enable the pin's signal for the
- * requested function.
+ * aspeed_find_expr_by_name - Search for the signal expression needed to
+ * enable the pin's signal for the requested function.
  *
  * @exprs: List of signal expressions (haystack)
  * @name: The name of the requested function (needle)
