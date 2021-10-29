Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BE743F9D0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 11:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhJ2J3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 05:29:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55331 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbhJ2J3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 05:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635499641; x=1667035641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=fqa1bYITeWFszt9fmoqpzxDMhEXiskU+VAk3tOJahO0=;
  b=mkn17KwHQ6YdFK3o3AapWdh4/xzb5Mvg9mcCxiOTnDk0PbXE5vqwYNTT
   Ba+2JjEAVkcUDpWV1RfIB/KM1zAfJUA2fxinT0ur3hpdVc7iUKoL9svFY
   pM4EXNamQIG0BD0qtTStHac+knP3oPX4sf8FuuB5F9BtYKXZ2sTp7ooHJ
   LOBoy9hq+p6+fnkahAkL/Thqz+aNNjwXpIkJ4o3kmMk5N3rhpio+2KrTD
   pGDlUGXieT/ihC7ix+3pkHrsEFD8TbKdPIry7+eE+XBpGy4/IAFdkSiC8
   mt+ZtBSJ7gLBhiNgUtIOtANgXrsR45oE7hG9+vmKcTS1LkXoGGi0XIP/6
   w==;
IronPort-SDR: 6myAxdXur8Wjtf+v001iabMad2K8HEn4S+fQbelpgSSmdAkE/7Mi6EGdzpy2Z30lLaGTBSflcL
 nebT/z7pgu25Pau8rN1sf6YFahMNuxvcp29fK2IeomNgrLfXG2FdhC+CcGf9c+foYXDj0IWttF
 iURdTXJ/wD1w7RZ/9SE+1ijfQ4H9ZkRVJztv9eteAFOu30qLTqtl9V1ZPnZjBmUz1FN3Me1VbB
 //a/j5fx61JthnVynkorqYZbbqMmf0BDy0tK3Mj+9kzzRspRR06RzU/wA1ZkHE7XoL+c4rnB+p
 Twh/txmekevLmdyCWAqU12QG
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; 
   d="scan'208";a="134776142"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Oct 2021 02:27:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 02:27:13 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 02:27:10 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: ocelot: Add Lan966x SoC support
Date:   Fri, 29 Oct 2021 14:57:02 +0530
Message-ID: <20211029092703.18886-2-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the compatible designated for Lan966x.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
index db99bd95d423..3bb76487669f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -4,7 +4,8 @@ Microsemi Ocelot pin controller Device Tree Bindings
 Required properties:
  - compatible		: Should be "mscc,ocelot-pinctrl",
 			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl",
-			  "mscc,luton-pinctrl" or "mscc,serval-pinctrl"
+			  "mscc,luton-pinctrl", "mscc,serval-pinctrl" or
+			  "microchip,lan966x-pinctrl"
  - reg			: Address and length of the register set for the device
  - gpio-controller	: Indicates this device is a GPIO controller
  - #gpio-cells		: Must be 2.
-- 
2.17.1

