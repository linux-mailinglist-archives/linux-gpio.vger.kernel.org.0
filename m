Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E893861A5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 22:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhEQUB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 16:01:29 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:49516 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233942AbhEQUB2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 16:01:28 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id ijPJlPskepK9wijPNlg8J9; Mon, 17 May 2021 22:00:10 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621281610; bh=asrIPUdSzvBL6ovQpCIYIxVAs/NrCAs02e5wyOQrjFk=;
        h=From;
        b=m5xE/wgC6kHPhXkDreh4Ghf0XfsVwzudo3YbWsVaEGQfIkiIyFOa12qrUfKqW1A47
         Xw1EVp31Dh4P3+PRWNfn5onAKFN2FG0AEbtOHtc4ZJLCPfiYIMHrm5r391U5wSuqs0
         mBC0J9Duf+sznMfxtDPkasis/9PLQ7RF7p+rn7n75SLijG4probWaysXa7HsBKOdjN
         /kankolc/m84XHOHmHn7tnD/dizvAmyHyYWuE+QQBHgOxOLVEdDVThn8HpYmIMgDFH
         +BDauxGaN813ZQWlfEdeHP0i0es6/kZKZtBVTuWXELn4BMNF8cHbXc+emrln5mutBg
         PziXUmlB7e8Og==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60a2cb4a cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=sozttTNsAAAA:8
 a=GWagjzjhKccDtmdoy8IA:9 a=aeg5Gbbo78KNqacMgKqU:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 0/2] am335x: set pinmux registers from pins debug file
Date:   Mon, 17 May 2021 22:00:00 +0200
Message-Id: <20210517200002.6316-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfLx0TcvsHrcNzWtXVUq2wnkrd0xhmWrjEbSoW6Ku1Z8AF22pM/q3NjEFbkV2TsjpISAkxXAtRiSkOL2CLimlcchLMAld5RvLTAWjmgu41doM+ugAko0U
 Pf0V2GaozQMdFjBk+I0BEY75PO6EApb0dptS1qg5PBHWnivCmaQRHoHLRgfaJKr5HxKO1sFEz82wQwv5xJ/yjwJvOasOqEwCip2/shV8BEHTsVIAGPjMveOF
 Gmx0V2ZkniKk7iY8+Pnxyz0UiSPusxWaNbmt1/SM+pkDPquRqVBGjaEzNYzp4ML78p1fCG7cHuzaQV3wYJ2BlJ7CvQEG4wK3mgZgZ+csqODCzFJQV6jdhIOp
 0Furwn9CGS6F05Rcz9Ae5+XskrftFBKxGwVHUaU44kuZOLLvZ2hoZ8t1lDE2feFPdWBWpeX5KeAQWeZipmHLmGgqdaIkwgd3DA3c/r8Eg/W9yf07gvGWo5XT
 OXdUzb1W5B4tzKBnyE11q2hbi/LLyOcz0O6kDA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


The patch was born from the need to change the slew rate of the LCD pins
of a custom AM335x board during EMC tests. The AM335x, as described in a
note in section 9.1 of its reference manual [1], is unable to write
pinmux registers from user space. The series now makes it possible to
write these registers from the pins debug file.

[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf


Changes in v2:
- Remove CONFIG_SOC_AM33XX dependency.

Dario Binacchi (2):
  pinctrl: core: configure pinmux from pins debug file
  pinctrl: single: set pinmux from pins debug file

 drivers/pinctrl/core.c           | 56 ++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinctrl-single.c | 20 ++++++++++++
 include/linux/pinctrl/pinctrl.h  |  2 ++
 3 files changed, 76 insertions(+), 2 deletions(-)

-- 
2.17.1

