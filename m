Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7759538B864
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 22:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238007AbhETU3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 16:29:17 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:55990 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238481AbhETU3Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 16:29:16 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jpGWlKVEa5WrZjpGnlTUN7; Thu, 20 May 2021 22:27:52 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621542472; bh=hBaIiaAmNT+KuPEIlQ0UMo5FUssmoQIEdX0bE+Xrm5c=;
        h=From;
        b=RX9rBvhp5PXWC6mEzR/MYtEW8ay1Hk5ZYZ/FhSp1UpmxLSeM4/P6d+KExMgn4v/OA
         M+dz3Rzh2Ta5ZGkx5r1RRvYtgZ3F9ebfEK0tzQvQCsqUy/7er0coCGkPnBamZmQaK3
         64S2nnmakma7gsA8u8CQXnjaWpN5nFmeUEBV/xmj1oEEnzwAvayULpOkOOfO5ilEvv
         6qdVgchWr5kD0w6VIqGL93ODQixfPPgkGV6lFmn5+vJsrc7zNqsImUdGg9nUpwGXhh
         5MnTmsXLrHiEDbotH75z/eUKJIp40p/qJFPgZL0J9LLPeB+QO2sJRfehgjyNJ00yNt
         KHDP2v7G/eAQg==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6c648 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17 a=sozttTNsAAAA:8
 a=Fr6HURb7vaUrhCLrTtoA:9 a=aeg5Gbbo78KNqacMgKqU:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v3 0/3] am335x: set pinmux registers from pins debug file
Date:   Thu, 20 May 2021 22:27:27 +0200
Message-Id: <20210520202730.4444-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfC4IQyqC8yCTSZda7J5PnkJEZPbrYTBhBMpEICGiISDhj3SIApr58H3eUSX81XdpOeXFDgL4V8j6laxA6ZXoeDcOKIUSg9cKw9BjupDw/smTuSgUSlBr
 souIJhr6BvMOTnSpF4hwcJZS2Wqo/yklxTVGnC3TB8HlcSbXC3rsDCkzW9koXqdrt0TqAjMBjTQxqcwyfvfq+U0yfo25AyfLTmu7w90kljIioGrxEtn8100M
 u/NvUrsDCCrNiXi/ywcpPgxTeQTmQoKRLvxlwnltIE2F6kIvM8qHWYCr6Ct1R76fD9vDaGUyxb8/gAQRTtLzbQP8rkyCp95IBasJI6Szrxfh4MlrsxnLTt48
 R5HJ6ADI+NfLAIG4EQ1+mh5l4dzTr9/P3QjTVigjk/vzjeA7g+v/UHx2jJ07x1q64EqDXsFoY/qGjen11g1bRrcA55QqVlQllHAtVYntDerQyK7D7lO1SuWl
 cySqt6rwqoDAYBpsMJpzpHFAtJx5EP9l2xRFF436M0HF2vbKSov4PZKJslrPP7d3jMqYZer4H/8FDIIHOr04DeKKhYXMW04Aff6ZUDCUgTcsJzis2R9ifyNc
 C50kD7a9D6Y9OEBW0Qpycl90rZMY0s0rDzNjpelwUpwrQtYa4XTfiM4aaPgg7KH+fpY=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


The patch was born from the need to change the slew rate of the LCD pins
of a custom AM335x board during EMC tests. The AM335x, as described in a
note in section 9.1 of its reference manual [1], is unable to write
pinmux registers from user space. The series now makes it possible to
write these registers from the pins debug file.

[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf


Changes in v3:
- Use strncpy_from_user() instead of copy_from_user().
- Do not shadow the error code returned by kstrtouint().
- Change pin_dbg_set() interface (char *buf --> unsigned int val).
- Describe pin_dbg_set().
- Remove CONFIG_DEV_MEM dependency.
- Change pcs_pin_dbg_set() interface (char *buf -> unsigned int val).

Changes in v2:
- Remove CONFIG_SOC_AM33XX dependency.

Dario Binacchi (3):
  docs/pinctrl: update `pins' description under debugfs
  pinctrl: core: configure pinmux from pins debug file
  pinctrl: single: set pinmux from pins debug file

 Documentation/driver-api/pin-control.rst |  3 ++
 drivers/pinctrl/core.c                   | 63 +++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-single.c         | 13 +++++
 include/linux/pinctrl/pinctrl.h          |  4 ++
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.17.1

