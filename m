Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A81455A61
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 12:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344138AbhKRLcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 06:32:48 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:14563 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344059AbhKRLas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 06:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637234869; x=1668770869;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=72iw7hIyLO++igxJdp9HPgiBSp9KSlDA7icpAXKwqcI=;
  b=gP+faEh9jyuVTP98708VbnOupX3oWlsekmShxVx4YNOiukul+sWrwn//
   oVnWL/+Zzf4mZiHM8xi7lLWyhMbsh4FhNFnTDGLMeiyVaIpTMn5W/zmg5
   r21IGi6thBRfRJVOf9Gv5hHWRRQf695K2C2+k7FitbGYvCx4vW9licOsI
   IvwyUUuCTuiVqQFwJrX8YUO2xa2NUZt8tajHEHRqb1Br8JMd986F+dt87
   t6YnCYeVHK10t7KSOBuQDLYWK/bvdqapOf/ItygAwLWVxrAX6US2vsRGh
   UeHHlM2cYOjGvIcpHgnpnaKLn5QH8UvTW+9WUsC0DcKNRLwWh5dFQsEji
   g==;
IronPort-SDR: huzUMBsMGdmDUYm3ruEdDHD4w24aJWdi1aBmj3hUKILuj063Tmsfp3dP4M5SdGx6kg+4Q7zsKE
 ctVue0slDgtRxkYO13SQA4O49F/W0wDQQ1fYKRsn/OsYZZ52dho6iwh/phv/E3nhO6gkqVDmw1
 E4RjvWQY0GpEcSyRstpk7VQpGEqAWvCOEmYLmRdigJBDUhh8XnvSrTN7FUsLZor6O6pphsKArU
 AG4apk3lhDt8wGSFb+TOBO/2jL/S1npcXQB+nJBhYU17SaGy4cdMW28kYCgk9eo/vshkFsgQwx
 f2lkZj+I800hvoBlrxhNaazc
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="143794407"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 04:27:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 04:27:46 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 04:27:43 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <quentin.schulz@bootlin.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>, <Manohar.Puri@microchip.com>
Subject: [PATCH v4 0/2] Extend pinctrl-ocelot driver for lan966x
Date:   Thu, 18 Nov 2021 16:55:46 +0530
Message-ID: <20211118112548.14582-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series extends pinctrl-ocelot driver to support lan966x.

v3 -> v4:
- Minor description fix in lan966x_pinmux_set_mux().

v2 -> v3:
- Removed extra new lines in pinctrl-ocelot.
- Reverted sparx5_desc changes which are done by mistake.

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

