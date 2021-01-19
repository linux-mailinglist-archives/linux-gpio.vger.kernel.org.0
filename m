Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F11B2FAF12
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 04:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388715AbhASDTE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 22:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbhASDTD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 22:19:03 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139D1C061575;
        Mon, 18 Jan 2021 19:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=IDJteZLGpl5jFaFEs8wvm4tfskugOjAqMpYM3vOLN5g=; b=XikgqOcpDeKkL/7YUivnWGWWyX
        KoXul4jcGUyhbk9e9yExzQV1TfN5fNHozm2DOqqRKDxPd+2GEKoAby5cKKo9Caa11aYzgo1C8u9hM
        4QTdyfV7QZQMCKpFKnUq3untnI2Vop9cjeDBPjGC4cEehSRv6gseP5crIrB7QzMAVueqrLsdecJoq
        9uiTWa8TB68b69/zznJKLtBdIH7CRa8Ed46oxwP+LOWnkngy6HmHqybbuMTWUskSExTOhwbcHGesJ
        TzlYWB4MKExqN/6AyutOFaFtkk2Ya0Al84JtG7Ui7vrOWQxKGHg/rbCwwKY0UO4dWb2bFaTGtcT78
        AzHjOWoA==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1hX9-0008A9-Uo; Tue, 19 Jan 2021 03:18:20 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] gpio: sifive: select IRQ_DOMAIN_HIERARCHY rather than depend on it
Date:   Mon, 18 Jan 2021 19:18:13 -0800
Message-Id: <20210119031813.16980-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the only driver in the kernel source tree that depends on
IRQ_DOMAIN_HIERARCHY instead of selecting it. Since it is not a
visible Kconfig symbol, depending on it (expecting a user to
set/enable it) doesn't make much sense, so change it to select
instead of "depends on".

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20210118.orig/drivers/gpio/Kconfig
+++ linux-next-20210118/drivers/gpio/Kconfig
@@ -521,7 +521,8 @@ config GPIO_SAMA5D2_PIOBU
 
 config GPIO_SIFIVE
 	bool "SiFive GPIO support"
-	depends on OF_GPIO && IRQ_DOMAIN_HIERARCHY
+	depends on OF_GPIO
+	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select REGMAP_MMIO
