Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4D130D9EA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 13:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhBCMkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 07:40:16 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55739 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbhBCMjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 07:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1612355988; x=1643891988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AdTHEClqq4Qqa1lO3aXnEWNDtT86vAA8Mw0krUz2ZYc=;
  b=QAACZ9Su+mOzwGHzJXtfsiBSJkdqj8QTbWQlUArA+Uti/IubC8TkTe+3
   S3QPZWQ0zUK0hCAbYmKgSdlOmSxLBZjAysxF7G6VtEeFaOzrmaNpcyawD
   a+FMMtUgKL0NFFg1dv2PCB5E6LEVpFZkRC4k0PisfjpEQpWpVGAmgHK4i
   xgKhiCBgpVTsPwO9NTtJenBijTDtV8UDtUwkHmU+fbL/0mBAT6pgW+o2i
   8/GJ8e0cLirBciVxJBOgKW/rgqZjQSKOU+/3gAwLU0jhFby+XfHA19Uk2
   S0ZV5wBES15bNJIcgiJ9XGlbBQVQ0GFe2N8Mi/ljWyxjYEBVfk81gJ+At
   g==;
IronPort-SDR: Tts59nglJzw2kUzKY/ZWi0grf4sq4u7+ryxOl8/LFzAsXTZKITbjASo91bPDxgt0FLBRgx2N7L
 h6R14gPCfUpo3H0NyQXVALEUtxUvW+6yZq9aA7fHoR/hpe2zD470mEu81LEofOJvk+ivsbnR26
 hqIt0sURKAXNtGFgRQuaR98cb6JnbS5GPvC7TgMTOdCGWrC614o2Z4MvgGZcFyn/mcmBKLPPkm
 edJ3xg2rwtkst9teD84cajjgBou1+9fViRd9Cm7qEeotem+d2RRk7b37qCVCGtDZ5sGgMgIZBB
 C5o=
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="42754787"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Feb 2021 05:38:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 3 Feb 2021 05:38:30 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 3 Feb 2021 05:38:28 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: [PATCH 1/1] pinctrl: pinctrl-microchip-sgpio: Fix wrong register offset for IRQ trigger
Date:   Wed, 3 Feb 2021 13:38:25 +0100
Message-ID: <20210203123825.611576-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fixes using a wrong register offset when configuring an IRQ
trigger type.

Fixes: be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)")
Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 6a43edefa490..61ba245bd0f8 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -574,7 +574,7 @@ static void microchip_sgpio_irq_settype(struct irq_data *data,
 	/* Type value spread over 2 registers sets: low, high bit */
 	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, addr.bit,
 			 BIT(addr.port), (!!(type & 0x1)) << addr.port);
-	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER + SGPIO_MAX_BITS, addr.bit,
+	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, SGPIO_MAX_BITS + addr.bit,
 			 BIT(addr.port), (!!(type & 0x2)) << addr.port);

 	if (type == SGPIO_INT_TRG_LEVEL)
--
2.25.1
