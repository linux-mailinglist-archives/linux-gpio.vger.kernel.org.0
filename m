Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A0B42D585
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 10:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhJNJAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 05:00:38 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17088 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhJNJAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 05:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634201913; x=1665737913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t09mRxZbm1VpAx8+YJTwfNFZAhdzCUBzKYScPr8gIo0=;
  b=U6XvljaFqLsXiURSVBXBhV7jtnEN/qJ2ZyrX5FgQA4x31RoDZz9jzfjh
   NJVfm4Y75w8Qzc4t5NHnvQuwvI1T4aHOpg36b6TjXe7C3PqfDZQoCD33V
   D/8O/O/pcTd9gFNgDGthOi10Y/DvBIMYR1IAQDLuRIfm+GjCwjoajUvEZ
   EV2IpKmFemXy+LjHVMX7AnQqrWMYX11iSPGImqIlGGjUE3hMKifO6dLkm
   h2BVX1djmKLeP0EqiPKciZZfhLLKWq1ClTeJesv23s5Z8Gn0n6ar5Xfjd
   ToGKJmZud9I6mvO7m3IjKbB/BoEW+XlJ3oclqhAoGK9tRc4aATg/0HQkm
   w==;
IronPort-SDR: kWOD2bd5NN8rkYTTUwvAxbxgNANaCDvOkok0wplkNA5cqzna3ntTuQOtLy2wvynAJGaqWd21qN
 28L7BsH8HNq5kEQjeMfE611WwK884HWCMuK3qA92KFhnyJUytHGX4rrAiFKZ2/2s3xNSdQyGh+
 fyNQs5pMSmr63cYUxJWgPlLUWkl/z+OwvHx7Ufad+nFDU/dfuqf5D8U9d+JAtQkBQJKZsQG6vW
 4z4W7+FbMsDSoEBVARj6tcH0gaEM/nJY9ccPgDYp/UgB0ZSDAOE1OHlMW7JRDRnZ4PW0hdSIJo
 JWLn3qBad1XfURPlktVJ2Rhr
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="132960552"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2021 01:58:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 14 Oct 2021 01:58:32 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 14 Oct 2021 01:58:30 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v3 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call reset driver
Date:   Thu, 14 Oct 2021 10:59:27 +0200
Message-ID: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the driver to call an optional reset driver.

v2->v3:
 - fix warnings reported by 'make dtbs_check'

v1->v2:
 - add dt-bindings changes

Horatiu Vultur (2):
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
  pinctrl: microchip sgpio: use reset driver

 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml | 6 ++++++
 drivers/pinctrl/pinctrl-microchip-sgpio.c                   | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.33.0

