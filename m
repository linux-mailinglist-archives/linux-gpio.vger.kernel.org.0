Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D446820FF55
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 23:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgF3Vg6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 17:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgF3Vg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 17:36:57 -0400
X-Greylist: delayed 404 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 Jun 2020 14:36:55 PDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F10C03E97A
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 14:36:55 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E17508011F;
        Wed,  1 Jul 2020 09:30:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593552606;
        bh=a9s+V2nzli8tsrcb0f2+rV3tw5YwE41Dqit8SLbbkqE=;
        h=From:To:Cc:Subject:Date;
        b=Ca7KOSLa8qcaM7G6uXP/Uf6OcU2/o107X/xBAUZuN7VCfORCIXCCKOGRmyBKkH06B
         PSijTfk35h8DoUScsrf6RBRQzV5VoAouAXyF5jSsk2TOspkWF6fFN5dXzbRzlsVPyk
         MAVlfRLd3tzRddhPTWHJqV8aARHBcYfsO+ER0jxTxSVPScgq+YojlCpPOviLc1/PhP
         N/gKzJHmzcQQ6P0StzYI4KKaW1mGxiS2sZ3Rv5LNXKH7jJCNZhio3Llx6EsvObUyC1
         ZDT+zSHhzo00z/mOPJEhoYo364AxoW6GAguzY3EpedrcPcO/t6fMQbnOSfOcdHFuVe
         XP4P93b7DPyFg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efbaeda0000>; Wed, 01 Jul 2020 09:30:06 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id CC9E013EF9B;
        Wed,  1 Jul 2020 09:30:00 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id D06D333E9BD; Wed,  1 Jul 2020 09:30:01 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] pinctrl: initialise nsp-mux earlier.
Date:   Wed,  1 Jul 2020 09:29:58 +1200
Message-Id: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO specified in the DTS file references the pinctrl, which is
specified after the GPIO. If the GPIO is initialised before pinctrl,
an error message for the -EPROBE_DEFER ends up in the kernel log. Even
though the probe will succeed when the driver is re-initialised, the
error can be scary to end users. To fix this, change the time the
pinctrl is probed, so that it is always before the GPIO driver.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/=
pinctrl-nsp-mux.c
index f1d60a708815..7586949f83ec 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -639,4 +639,4 @@ static int __init nsp_pinmux_init(void)
 {
 	return platform_driver_register(&nsp_pinmux_driver);
 }
-arch_initcall(nsp_pinmux_init);
+postcore_initcall(nsp_pinmux_init);
--=20
2.27.0

