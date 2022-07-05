Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C9A56702C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 16:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiGEODB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 10:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbiGEOCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 10:02:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25E321E1A
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657028958; x=1688564958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zpwn3EoTc9k3nqn9MzHBE55S0Zot3Sjy+qJz3HwwGL8=;
  b=Ch3YF8jdcZklM75M5wve31uV3ORj90pvT22lqYcNqklh59hC783Yrdo0
   9bvW3mOHmEJ1Vr8WhX19L2qm7hPvWPcGSpqpmh83z7q/SPSON6rSvRzNL
   umau5LB/WJGLGxxLwCkoozw2VoT5llD/SSPXJGNBCSOVZbZV3m+y04Akf
   aQn07sHeefCbipiscAM3zuKvC7q7fM+qEqeSNJqDOotPYi6llpKRCyzaW
   +PIQKHdgIwXlMIX8hBfXFKrcYf4yfokS41oEzbyFg559HxJMP66RtplDr
   mW2XR6lmTBBeBFSVIZnHwDqsW9ZvT6WxGEDCVvG8TnV232ASY2Lew3ebL
   g==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="170824115"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 06:49:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 06:49:18 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 06:49:16 -0700
From:   <lewis.hanly@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <palmer@dabbelt.com>, <maz@kernel.org>
CC:     <paul.walmsley@sifive.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>
Subject: [PATCH 0/1] Add Polarfire SoC GPIO support
Date:   Tue, 5 Jul 2022 14:49:11 +0100
Message-ID: <20220705134912.2740421-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller.

Lewis Hanly (1):
  gpio: mpfs - add polarfire soc gpio support

 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 358 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.25.1

