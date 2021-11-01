Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8084413E0
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 07:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhKAGuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 02:50:00 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:61315 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhKAGuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 02:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635749247; x=1667285247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=04ewB07icuNC5pFG3OKJYfCb30uHhR9kHQ65brfriv0=;
  b=nfJqiwWpK5gG/lZ3BpmJi25mYo1PJ/dNWhWooebvoQqzDnXwCYKzhgzw
   vAM7pLKnNMjcUECfU5vghjxg+qEr3wE0CvRmOKU9mRd407F0BDv4d8tcx
   0ApZtZD5Eb9u9koyOQ9aZZm6LIRefzzw3mw8bd5A/pg+AY3OCc4a28/vs
   fBBQd8oPgSQ5kKos/Q/je7q6Nk61kTQELZNo6yVPvOiLQfVzLyHvUO2fw
   n0yLoFt5H1kmy6H5OscZ2WjqRIhRNFZRZ3S0GSlqGrBThcx5Gmz3iY5BS
   9BI0Oxw+LgUNJA1D5W0XRl6mLZ0xRy8W5ixOvEEPN4pBN25gE6WmTsUZd
   A==;
IronPort-SDR: md/uUUPYXiFXjZwD4QRNp4ATv3BkydWlRc+VmEMGKOfM6FrHLLGBIKYFbh+ulNS+cHzwnBv0yW
 GvvyBmTQVa7hFPES1TUh9TsVsDAfRg/k5AEStphEjFHruIxpu4C+bpOtv5Ff1PM3gwqOkkpkOK
 6rvC7AxKe1VAai5vNAquNKCHfwMZOH/2dA/rYYgTVSqgEVjeZHTIG10SfHNk5Rb4AKkaPyTUjb
 IG5Gj7AdFDBBhhq2o5wLyWLUsMXsvogvmVPRoLV6dqN8BIXaL09YFDDUg99MBxdGwDzSE9Tn/F
 yaBdZimaYL56eu4q9CYHfVBX
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="137552413"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Oct 2021 23:47:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 31 Oct 2021 23:47:26 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 31 Oct 2021 23:47:24 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: ocelot: add lan966x SoC support
Date:   Mon, 1 Nov 2021 12:16:29 +0530
Message-ID: <20211101064630.32243-2-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101064630.32243-1-kavyasree.kotagiri@microchip.com>
References: <20211101064630.32243-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the compatible designated for lan966x.

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

