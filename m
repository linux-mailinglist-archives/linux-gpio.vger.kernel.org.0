Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2A285A76
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 08:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731141AbfHHGU1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 02:20:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:4488 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725796AbfHHGU1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 02:20:27 -0400
X-IronPort-AV: E=Sophos;i="5.64,360,1559487600"; 
   d="scan'208";a="23432813"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Aug 2019 15:20:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B49841CA0B9;
        Thu,  8 Aug 2019 15:20:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed
Date:   Thu,  8 Aug 2019 15:19:00 +0900
Message-Id: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series is based on renesas-drivers.git /
renesas-drivers-2019-07-30-v5.3-rc2 tag.

About R-Car PWM driver modification, it seems to need more time to achieve
output duty zero about suitable gpio vs pinctrl handling. But, I believe
this pinctrl patches could be applied into the mainline regardless
the R-Car PWM modification.

Changes from v1:
 - Spin-off the pinctrl patches (from 1/7 to 3/7).
 - Add Geert-san's Reviewed-by on 1/3 and 2/3.
 - Add Fixes tag on 2/3.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=143129

Yoshihiro Shimoda (3):
  pinctrl: sh-pfc: add new flags into struct sh_pfc_pin_config
  pinctrl: sh-pfc: remove incomplete flag "cfg->type"
  pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed

 drivers/pinctrl/sh-pfc/pinctrl.c | 45 ++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

-- 
2.7.4

