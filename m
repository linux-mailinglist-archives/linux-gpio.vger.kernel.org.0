Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A67444192A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 10:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhKAJ6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 05:58:48 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:64890 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbhKAJ5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 05:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635760504; x=1667296504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EVz1SmMWZwxaA6QF2hZ4bifX+tJUqiyDXiMfwoQFoo4=;
  b=PeevlXKnlZTnP9tNB4lr3G5WkqFS3tmVoEvKi1hwglBTT2gjmxa4F0wW
   Op6EXih96Adi5/+RKpYAZCFUbDnyjFs0C/Mh3+/gBfxGwDciDNwOVwJk7
   K4fNQvtKSX/UY93o9UcGbClYGq3s5UNUs+4Ul71k89MFlKiL/ZGKP4feu
   BvneVa9tRG7gqlZ+8HmFbCI+kEgJC4ND6Jj2F9sj9GVdQAR3nVpwfpPiH
   2AyJYL/1oJEHet49KzZqvPyYmIQnkEbEk9yxHcGZLNH9v4NCC0GK29IHA
   doXjCkpJZPqqwyjfyJ6YTp+75ywb4baobomBpwwr4YW3QiAl64n/6WVwJ
   w==;
IronPort-SDR: +O5MeQrLgmosfIkZGz6/OdnZJK8Ql9L9J4Z0K1kSw1Gp/HVfJAiWnwZne+LYtYKfP7xnJpKG0Z
 5HDM/Hwa6yRjOgMVq+N2XkHb4GhpU3CslwPN47G0YIdIdxBJQSoGsRgpOTV+anfDMk9n+7NYOI
 Cqvz2H9Aw5Yt6uqFFZbhJOeqc8Ui9IAERTnl42pJPwci0BDBbg16UW7g2E7csKzi3H6DzgBCpC
 F2dCzYQUAhs0fwJ7wj3ozxmVm+4wpnnasdLePnspdJjHpMIdZvntJjzuNqkk8KUSlVF52IHj5b
 YR1ROAsxWEgkiOw6N3ZApgsU
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="150256110"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 02:55:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 02:55:01 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 1 Nov 2021 02:54:58 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: ocelot: add lan966x SoC support
Date:   Mon, 1 Nov 2021 15:24:50 +0530
Message-ID: <20211101095451.5831-2-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101095451.5831-1-kavyasree.kotagiri@microchip.com>
References: <20211101095451.5831-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the compatible designated for lan966x.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
v2 -> v3:
- No changes.

v1 -> v2:
- Use consistent name lan966x in commit description

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

