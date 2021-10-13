Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E021F42BAAD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 10:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbhJMInl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 04:43:41 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19027 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbhJMInk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 04:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634114497; x=1665650497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uS5AUBVNgvSk7L6DFWnNIGqcFmvItYvZAYD6rQ6KYRo=;
  b=p08/uONEKTvvDpADmk4WBZlIc2bTNe7gWO0Udgvs4l8w4F1pMH7YGQ9w
   xX6kxB7BnRtac/ec+4HWN0q7iZ/e3eX5Mta+w+XeWkbGw7dfK0YX1WNuu
   tlUEfpsCAmgxEDT4r6BWijftUmPFmNir/fYZ6Krv/b0kDS0HVTwlYWQ9N
   aHd2QfRQmYiUWohQO4CGrfCqA0WunRPNC40f5CMT3jy61bt5FXwwnyEF5
   i3feqy7biIaw/qL7CkIU2JRXyvMm4b1nUGKBbm20WPJBByP6m1SjcCZbt
   F0iQ2t4yzVRK7NSH9WjC/51KgKoZYGcgk9CQk7vh6WtIAcGl8Nt6KWeXU
   g==;
IronPort-SDR: kDs5hX2aE+TjJTDd44u9mMdNi45JykHWVZyXP867ispU0XU0EqAhvCsGCd7HiSemh5i4aQa8s8
 O5FMwWgCLTFCJIVoJAUblP1SLP1dlBv4UNRz7fgnBm4y8ap4E9UJjGHqFXuh2Z0lGM7A5pKE0v
 cf3w7B7lSchHRDvrI8f7caUXKKvsPa9JuJ/IVS9OPCGzEqVxJh8L9gkwk4nXCMuXw1ruajEqAC
 zKb4eCQULASDqk3xTZ71mPmp6BiYj1Bs7b9GuFZhSbywfmQL2P7i7r/Sx8Buwt42GXIXBGPNQh
 M/anCRohilkpO0zsWsQai6E4
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="72768982"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 01:41:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 01:41:36 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 01:41:34 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 0/2] pinctrl: pinctrl-microchip-sgpio: Extend to call reset driver
Date:   Wed, 13 Oct 2021 10:42:15 +0200
Message-ID: <20211013084217.2298553-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This allows the driver to call an optional reset driver.

v1->v2:
 - add dt-bidings changes

Horatiu Vultur (2):
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
  pinctrl: microchip sgpio: use reset driver

 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml | 6 ++++++
 drivers/pinctrl/pinctrl-microchip-sgpio.c                   | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.33.0

