Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3F943F9CD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 11:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhJ2J3u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 05:29:50 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:57910 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbhJ2J3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 05:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635499631; x=1667035631;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=uXdorQ9K+li950c0L19MJQYPHHlldG8dHhrzQ/Lieko=;
  b=M/mABgkUZ5DMAucMoRsjJHGjHtQ6i4xR3DyhQ4kEnGr11ZfI0qdXciN2
   S/VOJx2wy8DoQw+3zW+RHc+htAxJtkhTYuqcY2dSmG4tXbY6/d/qEF5By
   P/ImEUUzl/vUh2JeJtidXiaBF3zd74D0MQ3nXs5SVRxjFAz8FPa4RV5uU
   +XusM0zPn1ztE6KgelJGeYd75tZUCbQbaTQwHHREqFV2sCeU0bltvX8ZL
   wblJo9CxWNg+6cvXvP7bBA4CquIKi0IV7h00J3MPlDkveHZXb3QELsxQD
   ddm9z+/IGM8cm/WFnKp+CI9TVeX6FJ+vnqQTPe5FXjU4uUTUfUKK7klWm
   w==;
IronPort-SDR: Zvkhaq5xBGZFpewpmOKnyuKE/9zgGroBMdJZb8nXzyyDW2cC70tu0KIZZ71S0gdtnlDyZY29ot
 VPuyfPNCZvUToTaLFNaBLpiDgAybTCsCf/QeafGrG/xnYGQI8FNDFCMGa5bSiJrcNipvtVC3OH
 O1DJTwhjJfFc59RNOeEV1LgfrquC1NquU556+VuakQ7iFarIcu4yZrPbNSwFx4JLA9y11IcPJW
 j5tMqyM0dfPG3bknGw5r7YE3BkV/IPMEbqLP0AnUU8cDo9+XvlyM5loX5/4PSFpw3DB1Dek0dv
 yPePdkse6auV+EIBqkok6zM1
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; 
   d="scan'208";a="150014287"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Oct 2021 02:27:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 02:27:08 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 02:27:05 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH 0/2] Extend pinctrl-ocelot driver for lan966x
Date:   Fri, 29 Oct 2021 14:57:01 +0530
Message-ID: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series extends pinctrl-ocelot driver to support also
the lan966x.

Kavyasree Kotagiri (2):
  dt-bindings: pinctrl: ocelot: Add Lan966x SoC support
  pinctrl: ocelot: Extend support for lan966x

 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  |   3 +-
 drivers/pinctrl/pinctrl-ocelot.c              | 416 ++++++++++++++++++
 2 files changed, 418 insertions(+), 1 deletion(-)

-- 
2.17.1

