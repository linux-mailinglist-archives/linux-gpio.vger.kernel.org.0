Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE5823021E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 07:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgG1Fzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 01:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgG1Fzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 01:55:54 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37BAC061794;
        Mon, 27 Jul 2020 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=o5ikJ1QoJwVd+OTpAl8rUctzdvZrp5IwzSCF4zo5/Uc=; b=msKKRisDzlo4z17KKntvWdDNJJ
        mHmv/48NXSiRwh7w94bD4E6QjmCuXwRRJALQ+tgsqA0SgKH0WqIc+EFUMe53e5QAearVuakG+z+CW
        nRLaWA6imE6gHLeoH6X7h/gxZOboyv1A+kAdeort/AT7KEbDrNSww0gP482RXhBg/Elf/B1aGv9Ft
        6qXTBpm6jlgtiyZnAPJjHb184SXgKrFQcli4Y50z5ayGY1WBg9s7KCYaqjGxBc0OqbBUAid3J6xNT
        ZdIBcjjxM3GSQK+ToVjVXNQlS55WhFMTEva9jzNdbtbKPj303zHW2Bd0XdJsWSr11aA+kDrn1mgKu
        2gVvMx9w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0Iab-00069P-OD; Tue, 28 Jul 2020 05:55:50 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -mmotm] pinctrl: mediatek: fix build for tristate changes
Message-ID: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
Date:   Mon, 27 Jul 2020 22:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Export mtk_is_virt_gpio() for the case when
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=m

to fix this build error:

ERROR: modpost: "mtk_is_virt_gpio" [drivers/pinctrl/mediatek/pinctrl-paris.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |    1 +
 1 file changed, 1 insertion(+)

--- mmotm-2020-0727-1818.orig/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ mmotm-2020-0727-1818/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -264,6 +264,7 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl
 
 	return virt_gpio;
 }
+EXPORT_SYMBOL_GPL(mtk_is_virt_gpio);
 
 static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 			     unsigned int *gpio_n,

