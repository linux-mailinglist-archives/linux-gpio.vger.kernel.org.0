Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34ADC35672
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 07:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFEFz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 01:55:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46204 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEFz1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 01:55:27 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x555tPaX057950;
        Wed, 5 Jun 2019 00:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559714125;
        bh=EAgmvpL9Mt8FUiA5Wv0jNBDPQEDUFU2NQ4Aol14BXXo=;
        h=From:To:CC:Subject:Date;
        b=dwQDRQgAKipO3pG2U436fqk/xFoUCZnjKRLf7bflfih6c+Ht6cIZqDngIYAWRSlBt
         61D30dgLxQe+WW0aBDU6a0Sr62UbPMPw5rKm07sIWpouiATBebrjpqA6PT403E9ABj
         /UE9MvY5jcNv5ic0iPUfF1AzWekEmFpKm1RacfiY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x555tPEo032627
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 00:55:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 00:55:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 00:55:25 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x555tMHb049531;
        Wed, 5 Jun 2019 00:55:23 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <lokeshvutla@ti.com>, <linux-gpio@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] gpio: davinci: Add support for TI K3 AM6 platform
Date:   Wed, 5 Jun 2019 11:25:17 +0530
Message-ID: <20190605055519.24079-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

K3 AM6 platform has 2 instances of gpio banks on main domain
and 1 instance on wakeup domin. All are capable of generating
banked interrupts.

Keerthy (2):
  gpio: davinci: Fix the compiler warning with ARM64 config enabled
  gpio: Davinci: Add K3 Specific dependencies

 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-davinci.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

