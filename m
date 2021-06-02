Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9F13988CF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFBMFu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:05:50 -0400
Received: from mout.gmx.net ([212.227.17.20]:40551 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhFBMFt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 08:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622635441;
        bh=UF4oW0j3C0UfuvEjFkldudNhDCIgYlLwBeW1fCc59U8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Vu/c0Q1jEq9mvmdEVuB62V2tyhqqTqPiKlmAAqFoqUsVPcRgeb0COHeJf7Z/x7wlJ
         LkysuI2THlyzWOR/wxIZZkwtkjOkOvbaBGFiw2DzGTs2WlpbWkNhyaMxlDkLvGfhfn
         +/mXK2U2WOam9hcuyzG6Vu41ucq6915sbnqdv5Fo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmULx-1l6F0r39px-00iTnv; Wed, 02
 Jun 2021 14:04:00 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 2/8] MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM architecture
Date:   Wed,  2 Jun 2021 14:03:23 +0200
Message-Id: <20210602120329.2444672-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pj/CAwCpQfjiqJUIRfxtRexDjyawbqBoG1pzwcUmblWyiF1GJF8
 VOkUSCbeMuJ3GvXWqH+/U630vfzhMbRvktMv7XAbWeEFTCIdjw+z9+U4/seMg4zyx8j/Sdb
 ofHNkyR+Wx7ARPFOgix4UPL0vJzKKhCYBmGs+rI2bfAOeAsFnbZgb7GQ98l/ViUodx/rMnm
 BobamMkegklHiS3ZbSq/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m5wUD4NWZjU=:wJrbsrF1KVy38/aR2Yf5XW
 Bmpuw7Y9s3OJPT9BnLE/c08gZDRYLo60hnUPUwFrcPu6gdSwtfrsc8KtqMfAgF3hi0qaG4xQx
 gl9cRVcVGp8BtnZFaFmdHNpWAb0i+PA0Ix4HBM8qfnFUyyoo+wz1iPErSYP9XgubGBj8uX8qe
 OJIor/UQrccUrqpWw3GfgPRBj38oCrIvkRVsfhAQ0Oe96Zzw5hqOB6l9xpHVpRVCZsJysRotJ
 f1ZzEZcHmZraJweGkVpjVqfSOzGrOcQV+mFRGsXtGdQqyB/PaQZxzxceLp/g0mUAUVuxUA84a
 2FEFj1a9JRr1UMDzLhO32bONaaxolvPivbZrO8uwa2b/sPkXQUh6iZ8Nk6FPQFLg808Epm1+q
 rdXoqU/vln8wbz2/cDEn3AvpFWgJv81m6TGcGnnfwH94FZq4dDu4602aQQQo+S6u/40LQEWNY
 /w5nyNDdA9KzpI9UpiCWvJihGn8cODg3bP6bLBE4r+HAfU9MUaeJUlY+Vo3h8E4CsNfIzluMF
 FuUXmTs2ygZwlQ0/8Pi/kze9DyunXPN+KyV1+vM/LblDsv0eii8mYtNYD3QapWgALL8kVZoXP
 Xeggv5Z7wqd0OEY9MUv0G2cJZp1u0+Vo3JdR44bgqBToPwfcspkqEgVJfcNY9aOP0jcrKngeY
 53Lavzrh1o8yH3EyVkiJMebTfreED58WMm1ejA5x4Cfw2Ltm95Y17JPHlwRBNBL99j4pzTDLC
 5dA5btQWbw/txARQ5rsN/rWgyYPxhkdVkj5Upkp9d6AuNRndi2bz6eNjsnJJRSM6CFYJlXT/R
 m5+9WoHpy/VdREHx7bRIwZaesEpUbNz/hUNk4KPphll/exb5tDuH2WBnKA1Uaz7iWu2gaeRr4
 3QsqgVFktlTVzB0fuUifC2gvJ6NIBHpIGv2y3vxHhiVtHwg7a8ufFCawUOXrpskddhR11TbNL
 fAXh9WoGHkHvIQ3WcfNasgrLa+6OnNRXASZUP6LL21YszhZU35w34pERYP9tfrkOGxTd6dG/W
 /neDy5Dd1q2AGGSBoHM9PtrTu3oU7lNaKhJb3z7pNzHEerALsp6i9CgdSlTX89xXcNeQ2yuQi
 lMCRQMogNJlbHLzRh9pf9AVNiSW9rW8kj5TA6Nn2e4IYorQTyA4LchNuA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All files in Documentation/devicetree/bindings/arm/npcm/ belong to the
Nuvoton NPCM architecture, even when their names might not spell it out
explicitly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79fb23f576218..288d6a1f2bb1f 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2220,6 +2220,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subsc=
ribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/arm/npcm/*
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
=2D-
2.30.2

