Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8784413DD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 07:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhKAGtv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 02:49:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:61304 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhKAGtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 02:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635749239; x=1667285239;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=YowLZbjsXHBhe8IxrUMYHdNu0/uVAwt3AIRVhciAASw=;
  b=CrAjtXo54PlStiiMMunLmNLu9T0+vhoqiSfCrnLo5hHgR8ChvrEL/t+z
   c+nVBquVAJRwgLXJoLLt7pI945QOchX1/pn9GS+ypALxScTXk5fdAMwcz
   JW8TTgbKxHLG3LjmGQ9Q2VW5n6ATx1NMAUAud2kYyNO47qcmwKak8PJKU
   Nsfl1/X72mkLIbiVmI6bI0MlSKOaaYdSoBWlCIrjSC0wg8uW7uGxC66A9
   LRtaxk8Mhy8ZFhBLYScHP1S+81eQ/b4oKJM6uN2scairNS/UM0APve22N
   f3zTfjh7c0IDPv3KKPxV+2LWj7DufAvyrOJdqFHpJk0mIdO0yRSHDnVD+
   g==;
IronPort-SDR: xF6AjGF6lWODKRvjoxlLsWn3PnLImPT4hfSIFpSpZC/96pzEsd1wkMXRdl9h9ijaCW0BJDqbol
 J7K3vvuWi0WttPukHTKI0EDdruouUJz8Av80unNs8+Aob2ai1Zv33nVuG/r6tlt7Zrg0Fgt11v
 nbq6xl6osDJpD39BZ2uVEHMMOmu3CFyZSSYaPZCXMDe53QkmAJD0y1ZVvZJ8wogDkMB5esvbHE
 4tMdrSZOVrm8C8SFAa4TAeH3xSKqdzTUrPMpX8KcRLcX4Xc4QDQuW9krT9qGD1v9cPcACOssqX
 ox55CcLgu1mEWDKbkGfMYFzo
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="137552402"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Oct 2021 23:47:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 31 Oct 2021 23:47:14 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 31 Oct 2021 23:47:11 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH v2 0/2] Extend pinctrl-ocelot driver for lan966x
Date:   Mon, 1 Nov 2021 12:16:28 +0530
Message-ID: <20211101064630.32243-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series extends pinctrl-ocelot driver to support lan966x.

v1 -> v2:
- Use consistent name lan966x everywhere.

Kavyasree Kotagiri (2):
  dt-bindings: pinctrl: ocelot: add lan966x SoC support
  pinctrl: ocelot: Extend support for lan966x

 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  |   3 +-
 drivers/pinctrl/pinctrl-ocelot.c              | 416 ++++++++++++++++++
 2 files changed, 418 insertions(+), 1 deletion(-)

-- 
2.17.1

