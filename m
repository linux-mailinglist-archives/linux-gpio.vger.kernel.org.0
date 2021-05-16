Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1E2381F25
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 15:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbhEPN45 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 09:56:57 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:42616 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233811AbhEPN44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 09:56:56 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id iHEzl2tgYpK9wiHF3lOWjb; Sun, 16 May 2021 15:55:40 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621173340; bh=caMgdLj1No6GEtQcTneWYtUSG8HDRQROvDgboDfFeJM=;
        h=From;
        b=VjC6oTwmnHlGYmoszv30kQABLQCUVUfTVXenXlO7JDleiER2ymI9YdGc4VxkUQ9iY
         qYgJo37MnTv1bUJ9DDpwn0Bz5f0ro32vmkpqiaY7aaiiOdZoA19Uypzz+/AM8lfMLn
         EBapDPvIEzVyCZ0loU6GJqqZw7Bcnp5l9oYq7Wfh1J3aIOrzUNf1noL7xZITrsGqmV
         oVCdQK25Y6OicbL4bHbFgbU5saql25mXdgzbnojRLYve45K511ibLVHY2yX9ci5KHc
         K+QAhQJjOh+xLF6wdM7Gn4Xuu40rlqG0sFyp2yQAVGESJO4m5erspmLhg6x19CqBK+
         ZhfMDl4dVRUnQ==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60a1245c cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=sozttTNsAAAA:8
 a=GWagjzjhKccDtmdoy8IA:9 a=2JrXBVNfdGAA:10 a=aeg5Gbbo78KNqacMgKqU:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 0/2] am335x: set pinmux registers from pins debug file
Date:   Sun, 16 May 2021 15:55:29 +0200
Message-Id: <20210516135531.2203-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfEKWdtsMz3AlqfPzmdLuq2ferYiAGGKj4HFvxV4liFxTxx/nYFiPaqz06WDUTeS1WHZhhCKr8poXl/NXOGleEErb2k0x7cSxCjg29j2w2RMa+NjPO2u4
 4EeIN4kBy38uJ1FV0leHLw675ujxfKFMtTJMJ2adb33iCj3iExzUJ8mZRRdPf4Oh3kLRuNcOhoJOmLnOddbWSOWNr62Bu7wtZP4Z5CTXjJfPjQmcf2TEO2Lk
 XAXuI/m0gz4EMyycigk2y3wpYg5FHGTj65mF4nF1elr4L3ugmUiemOg/BB5vv2S/dn0as1i0HnKW0AcZU/mZxvS9mGfcVZCtC6SrpfIRqNbHUdEcbx7buBr7
 ek8pPRixKmC9b1mhF/Fa3Z1/7QqwLSobY4W4X0e0+D1Tt6ca5MJpq1gsaee5pj127cbkkZFXkyJWW1//h627mckWpjqxSLdWiOo/RTIXCPCU9sh2fo7N4ELK
 CADeBi/RBfNU/9Ps85zSTJBuhY9JjYgloMQrhA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


The patch was born from the need to change the slew rate of the LCD pins
of a custom AM335x board during EMC tests. The AM335x, as described in a
note in section 9.1 of its reference manual [1], is unable to write
pinmux registers from user space. The series now makes it possible to
write these registers from the pins debug file.

[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf



Dario Binacchi (2):
  pinctrl: core: configure pinmux from pins debug file
  pinctrl: single: set pinmux from pins debug file

 drivers/pinctrl/core.c           | 56 ++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinctrl-single.c | 20 ++++++++++++
 include/linux/pinctrl/pinctrl.h  |  2 ++
 3 files changed, 76 insertions(+), 2 deletions(-)

-- 
2.17.1

