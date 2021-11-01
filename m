Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5654441928
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 10:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhKAJ6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 05:58:48 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:3437 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhKAJ5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 05:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635760498; x=1667296498;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=mSuwzvbFosgXR+t/J5/7W7IMTcUGeCP7rMs5ACbUzzo=;
  b=SvFYPHhUtaFbwtj+iF2VmE4blSoBErrBHw5BzjSFv38ldexePwenQob1
   Dc2xhJpRvdTECH2d8oO3KhkkcY2l4ysggd3cLQd86x2mYw7BbzaxJM714
   DvufcMxZ/6GzVaE2g65lCUFxgx9MhJEyGG57ZxI11mun9J43wG9Jj3bc8
   PYSTDImHF6ZE35imm0RVd5jmuxg7vzP6fnFVGuo2BvBZiRsY7hIueDJzZ
   kUvgoyt6xKJP8zY8QZMLlXDKDyZxF0/P8acSjfChJ6tENf+nyGAiJ6Ss3
   1iB/zQ0yh7dBZI/H+GecR9rcdTAxoxzUXCnC5oOG8rF3e/TBH99cSLVgx
   g==;
IronPort-SDR: SX2FJxAMsva8Jy9RyHBd2k0pUMCtDKYCGpM9PAT001hMltTdpldEzqaGatAmZoZL6Qu0RuJXUx
 sjGDE8XDhgFvD3kialKVm5Sb/jsAo+tR7a0W/F//m8bm5IAJB2aNrlCaqGWrdqZzH8Q18s69oB
 ubMclwfNAuUFOzCUnU71pRQBCpTs4R6YaY9cG7JVQw2XS2Tt4NG45e3xa0woEN+LZY2mBDWMql
 W/1ZH4b+i3O6I7ob+QaXcOxh90CASJt2cRLCqsGGHM+SFOC5tP4mQmZ2nzstPar9GcpZD/Iwwl
 hUaNiCNM+6Yy42+3kaQ4nVXO
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="74934026"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 02:54:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 02:54:56 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 1 Nov 2021 02:54:53 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH v3 0/2]  Extend pinctrl-ocelot driver for lan966x
Date:   Mon, 1 Nov 2021 15:24:49 +0530
Message-ID: <20211101095451.5831-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series extends pinctrl-ocelot driver to support lan966x.

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

