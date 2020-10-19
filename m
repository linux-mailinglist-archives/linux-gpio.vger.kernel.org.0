Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3904B29278C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 14:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgJSMnE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 08:43:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6248 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726336AbgJSMnE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 08:43:04 -0400
X-IronPort-AV: E=Sophos;i="5.77,394,1596466800"; 
   d="scan'208";a="60189664"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2020 21:43:02 +0900
Received: from localhost.localdomain (unknown [172.29.53.218])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C290242DFC82;
        Mon, 19 Oct 2020 21:43:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Optimize pinctrl image size for RZ/G SoC's
Date:   Mon, 19 Oct 2020 13:42:52 +0100
Message-Id: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series aims to optimize pinctrl image size of RZ/G[1|2] SoC's
when the corresponding RCar SoC is disabled from the config.

Before applying this patch
--------------------------
$ size drivers/pinctrl/renesas/*.o
   text	   data	    bss	    dec	    hex	filename
  52048	      0	      0	  52048	   cb50	drivers/pinctrl/renesas/pfc-r8a77951.o
  51848	      0	      0	  51848	   ca88	drivers/pinctrl/renesas/pfc-r8a77965.o
  51816	      0	      0	  51816	   ca68	drivers/pinctrl/renesas/pfc-r8a7796.o
  39947	      0	      0	  39947	   9c0b	drivers/pinctrl/renesas/pfc-r8a77990.o

$ size drivers/pinctrl/renesas/*.o
   text	   data	    bss	    dec	    hex	filename
  35083	      0	      0	  35083	   890b	drivers/pinctrl/renesas/pfc-r8a7790.o
  37531	      0	      0	  37531	   929b	drivers/pinctrl/renesas/pfc-r8a7791.o

After applying this patch
---------------------------
$ size drivers/pinctrl/renesas/*.o
   text	   data	    bss	    dec	    hex	filename
  49584	      0	      0	  49584	   c1b0	drivers/pinctrl/renesas/pfc-r8a77951.o
  49384	      0	      0	  49384	   c0e8	drivers/pinctrl/renesas/pfc-r8a77965.o
  49176	      0	      0	  49176	   c018	drivers/pinctrl/renesas/pfc-r8a7796.o
  38131	      0	      0	  38131	   94f3	drivers/pinctrl/renesas/pfc-r8a77990.o


$ size drivers/pinctrl/renesas/*.o
   text	   data	    bss	    dec	    hex	filena
  34909	      0	      0	  34909	   885d	drivers/pinctrl/renesas/pfc-r8a7790.o
  36884	      0	      0	  36884	   9014	drivers/pinctrl/renesas/pfc-r8a7791.o

This patch series is based on renesas-drivers.

Biju Das (6):
  pinctrl: renesas: r8a77951: Optimize pinctrl image size for R8A774E1
  pinctrl: renesas: r8a7796: Optimize pinctrl image size for R8A774A1
  pinctrl: renesas: r8a77965: Optimize pinctrl image size for R8A774B1
  pinctrl: renesas: r8a77990: Optimize pinctrl image size for R8A774C0
  pinctrl: renesas: r8a7790: Optimize pinctrl image size for R8A7742
  pinctrl: renesas: r8a7791: Optimize pinctrl image size for R8A774[3|4]

 drivers/pinctrl/renesas/pfc-r8a7790.c  | 12 ++++++++++++
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 17 ++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77951.c | 14 ++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 12 ++++++++++++
 drivers/pinctrl/renesas/pfc-r8a77965.c | 12 ++++++++++++
 drivers/pinctrl/renesas/pfc-r8a77990.c | 12 ++++++++++++
 6 files changed, 76 insertions(+), 3 deletions(-)

-- 
2.17.1

