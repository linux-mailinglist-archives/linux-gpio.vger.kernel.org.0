Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 187553583F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 10:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfFEIC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 04:02:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53702 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFEIC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 04:02:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5582RwT002059;
        Wed, 5 Jun 2019 03:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559721747;
        bh=tlK8C79UaFoXksJbR8g2bq/rPB82+KKuSQCR5rMiw1s=;
        h=From:To:CC:Subject:Date;
        b=lF3W0RoixtPXJN5J32p8vKFZvxwt3z56x2fqBlh/x1mZP5T46iubO+lDB+bLVGE7v
         fF6dNMTO5FwkJw4T8hGkTKNc86tXY/avEkM50SgH2HxJbcrnnTLWztZYw1aGhGUENO
         Nn/H8qcPq3kqgTacuymkNKz9KI7OtphWJtm6eDsc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5582R2j128351
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 03:02:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 03:02:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 03:02:26 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5582N7l041815;
        Wed, 5 Jun 2019 03:02:24 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <lokeshvutla@ti.com>, <linux-gpio@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] gpio: davinci: Add support for TI K3 AM6 platform
Date:   Wed, 5 Jun 2019 13:32:56 +0530
Message-ID: <20190605080259.2462-1-j-keerthy@ti.com>
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

Changes in v2:

  * Introduced a separate compatible for am654. 

Documentation patch link: https://patchwork.kernel.org/patch/10976445/

Keerthy (3):
  gpio: davinci: Fix the compiler warning with ARM64 config enabled
  gpio: davinci: Add new compatible for K3 AM654 SoCs
  gpio: Davinci: Add K3 dependencies

 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-davinci.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.17.1

