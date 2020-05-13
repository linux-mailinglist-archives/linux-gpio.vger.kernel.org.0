Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CF41D1726
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388667AbgEMOLm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:11:42 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:63716 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731192AbgEMOLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589379103; x=1620915103;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5WXfpxIeLjwdA1AccfrnMornNgh2rcnqXLeB14bOL6M=;
  b=VP3pxKv3p7+MTz3uf/X8tzYXVnjVllLttoYv+8JFlg2Uii8LsUVdMP88
   TLLUVQp7Q/yppBYHQKMkxJs7SVqUPz/A8c+c8zAz9EjJeTuSgo8LTt9q/
   3A/qsl//FRJSfRKZCsn4Z0HSv8mtuiJNBJN8Js2Ndi/niqJor4gEGndnc
   cA+l3HBNk4gPs8hS29JTq8+6vjQxS+TcPAtiYzvpdYF0S1Hk6j5+jkgiN
   YTVzNYMy+LDzyCDI0tJjBGwJdncQTuGs/z8IBAsE9Fr2JRyXIyTmxSqNE
   WE6SVZFKFuYyMGDnp2LVgPzUgTcHHU8zmaBnRFjPu147QgC0+i3sw29uq
   A==;
IronPort-SDR: 5drTsb9kRZJ4MeOmkRuJ8EtkPi6xB8TWOv1AR2eFoP8emFeXIm8oz3nThGCaoJwGbJeDWK9Vfy
 FJ1YV7e5bzjRDbKG/aLVjnAM1jO0D+PMODePKOSv1kvt//nXj0Ui8aXh8L5CfZtOt4w6FoJCZy
 A00EUEsgEkFGCGLbeawioffwGe0hapGDbq/JDLuOsLoL0Nsqqo5EJFz/9dzBVwnsY2L83V7zpQ
 w/9hvMPiTeYr0BPlqqCJ0c79jJ97ZYtDmbQMi9ZnccHOqyzaMWVLhTle+tiUgsxXbDliwK1YQQ
 qkg=
X-IronPort-AV: E=Sophos;i="5.73,388,1583218800"; 
   d="scan'208";a="75776751"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 07:11:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 07:11:41 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 07:11:40 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] pinctrl: Adding support for Microchip serial GPIO controller
Date:   Wed, 13 May 2020 16:11:31 +0200
Message-ID: <20200513141134.25819-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is an add-on series to the main SoC Sparx5 series
(Message-ID: <20200513125532.24585-1-lars.povlsen@microchip.com>).

The series add support for the serial GPIO controller used by Sparx5,
as well as (MSCC) ocelot/jaguar2.

The GPIO controller only supports output mode currently.

It is expected that the DT patches are to be taken directly by the arm-soc
maintainers.

Lars Povlsen (3):
  dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
  pinctrl: mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
  arm64: dts: sparx5: Add SGPIO devices

 .../bindings/pinctrl/mscc,ocelot-sgpio.yaml   |  66 ++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  52 ++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    |   5 +
 drivers/pinctrl/Kconfig                       |  17 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-mchp-sgpio.c          | 569 ++++++++++++++++++
 include/dt-bindings/gpio/mchp-sgpio.h         |  21 +
 9 files changed, 738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
 create mode 100644 drivers/pinctrl/pinctrl-mchp-sgpio.c
 create mode 100644 include/dt-bindings/gpio/mchp-sgpio.h

--
2.26.2
