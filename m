Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECAC3936E0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 22:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbhE0UOv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 16:14:51 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:41758 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235508AbhE0UOv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 16:14:51 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id mMNTlSYk0FCejmMNXlqepm; Thu, 27 May 2021 22:13:16 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622146396; bh=I4PtnhXMdlhgnxezZspcqIoS9c5YC4rODct47Qr2t9I=;
        h=From;
        b=GC3XYgMP51xdEx3lNpka6rJrW7maKyA1V5u9JfDXqFu60Twhsf0BxNASBP4auiZ6X
         g/kVgjF9hOrB6J6i/KCqH/D3ZZbJ+ZX1kCSJk0DyddrkyLjfWFG3SFcwebcdkxfNSG
         DJQuhqUAKPfCc/d4qKRbXQReQZgxLz2XgcZkBZRIIc6kASIDHffyGYUvvDGl6hMHNp
         U1IWVNBchbU99rI86/h4StRomJ5o74W+0ffqCUsAdnpi5ejIN+jBjI9Pnx9VS7Hbe7
         /6fVD1J+EJfR2Cfq+FZA3PWJKJvPb1i8A0U/vuKm7JWzkUArkloKoIRVTntYpmTvoG
         s+GQH9NkYmS7w==
X-CNFS-Analysis: v=2.4 cv=VIYYI/DX c=1 sm=1 tr=0 ts=60affd5c cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17
 a=vI-CbML_DODVv0C9:21 a=rV6jHzxxpWIfoUYl14kA:9 a=D145Ic0AaU6TXaGcxFpr:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] docs/pinctrl: fix the reference to the u300 platform
Date:   Thu, 27 May 2021 22:13:09 +0200
Message-Id: <20210527201309.13308-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfCPK+uNT2GnmScuJGuBZZqQVji6WT6aJtE9EgW/Z5cyqw5T3fllzXgtvjaipc9GGaNwIlNYM9pZtpyon63kkZp5KR+EHCvcfDOzs+6rcadSKw1L+upH8
 KVjokZh0rHotT3s0EPeAntcrWFZrVwKUC+weMscI/tXl6haDeY05+WD2XxcF1Cz2ia0OUkJSxCXwYNDRqMPYC1m3Y548FIP2QiUp6DdkSEW9CXhe8KBDKszS
 F+oHx0l07++/ls8RCeVVU5lSCBk/n1CTwh5Rj7AlmN6eCPATJe6CDZ0+iqIw+uDZdpo1Xo3C0KBfPI8YCRn15839f4evIYG350/TeZ04+rygxH+wmO02mdrN
 8M3xJ7EQ8V7xsLann6quVmy/kxsbe3aSEmGXgWLQRpZFSnI0wuXQplxXJMbIh7pdcALNPqNu
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With commit ce1380c9f4bc ("ARM: remove u300 platform") it is wrong to
use arch/arm/mach-u300/Kconfig file as example. Since the u300 platform
has been replaced by the u8500, let's use its Kconfig as example.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index e2474425fb0c..71eefe5a023f 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -95,7 +95,7 @@ this in our driver::
 To enable the pinctrl subsystem and the subgroups for PINMUX and PINCONF and
 selected drivers, you need to select them from your machine's Kconfig entry,
 since these are so tightly integrated with the machines they are used on.
-See for example arch/arm/mach-u300/Kconfig for an example.
+See for example arch/arm/mach-ux500/Kconfig for an example.
 
 Pins usually have fancier names than this. You can find these in the datasheet
 for your chip. Notice that the core pinctrl.h file provides a fancy macro
-- 
2.17.1

