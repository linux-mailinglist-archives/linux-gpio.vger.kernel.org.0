Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E50431292
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 10:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhJRI6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 04:58:42 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:61614 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbhJRI6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 04:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634547390; x=1666083390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4QCbsoC9KdhFg+QiSYzGg8KwlZxGWoWVEktTeAQXuKk=;
  b=vFHzFQgNWAhZGnZN82wa7/rBUaHwVao9OY2eTldA3efAL8QwauIMriHH
   BDE4ACf4u53fyYJkoXeqc8QWF1GgOdr1TFo1RYBE/2voQbM3QNllsXzdi
   BWCIrrB/DblpWtUhRbbQGOuqRYKUhZ/Pan3ydJhM9JBEnzKQEB2MPo/aN
   BKv0LiLivLZWYYKD2f/a2dEk+PHAJDiLUc1xaXcUY7i9iOo3uFlSLOXeK
   n4gfiIc2/9mrnqPODxEh6FmB8kpXd9ElwWkjOm93WcjCugiyQkl5PJMks
   deBaqz270c0ECHYmT07tkZCcrykgK7w6NFwft0k2C/mC/4n60lHWbH5cZ
   w==;
IronPort-SDR: ldAVD0elYh2YQjufIKWzV/AEOFjXxgkFNZEwzkOKFxI9iKOyWr9aALvNvLs4NzIx5n8Ivjo9s0
 L0Y64aPuOzyDOxLb3CChSe2XHMkJlwDtNUyiEKRh/nqgaNuBl3KN4e0ZZDeyBguh2zaFXxjxnQ
 4zbOPikfE+SipJdIzp3phrinfpvXkf14NWLdoq/xUL7ovnA2g1SmP6WhTPl5OBTjHWyL51INuG
 KtntEuMiul1ir73onm3dEoahun0ijhFteorL4kmyMtVODwnlgg+xCK46qN4JxCZYfcAIDye1ww
 2Oshv8BMv0Yw73HizGqTyydu
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="133408733"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Oct 2021 01:56:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 18 Oct 2021 01:56:29 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 18 Oct 2021 01:56:27 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v6 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call reset driver
Date:   Mon, 18 Oct 2021 10:57:52 +0200
Message-ID: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the driver to call an optional reset driver.

v5->v6:
 - fix warnings reported by 'make dtbs_check'
 - add back the name of the reset line

v4->v5:
 - check the return value of devm_reset_control_get_optional_shared

v3->v4:
 - use devm_reset_control_get_optional_shared
 - remove the expected name of the reset line

v2->v3:
 - fix warnings reported by 'make dtbs_check'

v1->v2:
 - add dt-bindings changes

Horatiu Vultur (2):
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
  pinctrl: microchip sgpio: use reset driver

 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml           | 7 +++++++
 drivers/pinctrl/pinctrl-microchip-sgpio.c                  | 7 +++++++
 2 files changed, 14 insertions(+)

-- 
2.33.0

