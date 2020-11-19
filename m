Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C97D2B9904
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 18:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgKSRI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 12:08:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:36302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728147AbgKSRI7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 12:08:59 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1723B2468B;
        Thu, 19 Nov 2020 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605805738;
        bh=K24ZkZs9Ul6PSkGObd2SXEbhNuIAKGPVjWEDWBbjJa8=;
        h=Date:From:To:Cc:Subject:From;
        b=oMTu6e5PW+tBCfUb4t6FVfsdotCoo8Q71ulrJ1wYgx7KMbaBbcI2zpwkfX7dN0rTE
         BJnWTTjyyfOvIXMDy/ekIm1yAtUbUoxJcSM4d1FYOgid+aeb6Wd7QBoINrliWoTLBe
         olJfCyA9oVCeUvh5+pq9xi45eUBvfBOBQ9Uwrw3I=
Date:   Thu, 19 Nov 2020 11:09:01 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] gpio: ath79: Fix fall-through warning for Clang
Message-ID: <20201119170901.GA22703@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a
warning by explicitly adding a fallthrough pseudo-keyword to indicate
that the code is intended to fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpio/gpio-ath79.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index d5359341cc6b..678ddd375891 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -123,6 +123,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_RISING:
 		polarity |= mask;
+		fallthrough;
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_EDGE_BOTH:
 		break;
-- 
2.27.0

