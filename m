Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084A83988E0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFBMGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:06:18 -0400
Received: from mout.gmx.net ([212.227.17.21]:48733 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhFBMGK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 08:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622635462;
        bh=zT2Zl3lhTUhOUnhnYSaHc6rA2XeXARsXVQCo0WrodVs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=RkwFpq+9B8hoNUe3JRr5pyKy3gBeTC7lbfDcVCkhw991uM0lU5qO7/m4G3gS8T6Ck
         64DorLxEwASII+hEYXHsqo/v0edYxgtdWHYpBmV3yMbTqDbYy4n1ZCx4BwKX57R88d
         CRvTX/cOZnCnElSkrFwWMSC/GT3nBg/r0YcJfl7w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1m1oGP2KsB-00Q7pa; Wed, 02
 Jun 2021 14:04:22 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 6/8] ARM: dts: wpcm450: Add pinctrl node
Date:   Wed,  2 Jun 2021 14:03:27 +0200
Message-Id: <20210602120329.2444672-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1UGScVg0xqr81vwdwouXKQGzWBRBp3MdBmFKGst0MpYLBkwVMXU
 96JQqmvL9cRVL6AAtOZ03z5/vXa+astucPlWv18S2rG2t9avTbU7gWZwpzHbEVJd9T63lyq
 0eCfIWnX5M5U8e+kz3WvR913eAOTubj7PRGbraJnB7B4ADf2WMGVsUPKTInMW4qZpQlqK6Z
 xUiT7J8UTyIljDbNYtdIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tBgVAy7xyO4=:tWhbERiSrcXlimCpzEEA3+
 O49wbDSYAkS4zoDRbCSBpDVIDmKXyjjW0dDPngd0fN4n2gPyRpa5PY6Mo7sOnSiInDEgrUVHu
 i5DnCKXzEl6tuAyJnP6FfKfe+AKW+8ceT+/7OHKnW6izgMXpZUpjdjk6SYVK7KFEvp4zb1Ctf
 feax2wljpSEFFnVBdp80sGGIzAojhKgIpBsqK1+F4MXYFSi/h1RNn92YDBXZQSBdxUvIF2NHf
 SeCF/Op5T1hwQacochuTkC0y6suNF/brCqkYjsA31X7E5C5aaK2IqsQeWTQoJ9tL8hsUz11a8
 HMiGgDLXpqgIpo5CT/6ZszXucCxiDSOlxRXnXEBFB6OIn4HlHrJoekLWf+vDbfI248A8NpA4j
 JKOstoL40Bo62MoMF/bPaIgzL6E3cCHCqP5jsP+Ydxv5hUAmyuKRObq7Q/AGe7Q9bUgIpFERH
 qfuOC3DyU5cYyPH6hle8eKsVBSEvBfCIgds+4PA5kOrvV1wihQ/jnB/PiRWwctYeo/VcDNj7N
 ENn5dvJ2alKIH7eoV9mwSUVWoBVylNUVLsS0hRVXQ13SCdkVsbLvgp7lIz+Dl8V0ruY/+3s+z
 TQnNCPVVsRMGJxN+5LxnnY60zYBszYXz1DTU0hQ+VwUjZkhusUaSKf7FyUttrKC2oueGwldJP
 pYCbqN/1VBn/DLh0rQNjmlc1h6ccEgBhOtGddhlgl0e4F9NBWRBuhZt9Aw/PgmpcvQGi5mFSn
 TdsZ68KVAayX750p9QjZlBl1r1q00l+1CZCnHcriCanh94ffqhtifocryg/319HzZigm2KkK7
 1mbqn6OoyLGFMESik/19N0fJrnm9YBBGe7fVIQOOCJVbpIw0EEDdHqYBVP/xpisLSphMm2r3p
 W5eqjCj/3g63S6Lvt6wwbp/l4qhsUNdoSSwgVcEXNBSPTqpGI1Fz2zolMe0BK5ojxDfpRdDBd
 NWjwOCCaDPZXwq+mWAs6jxlZAVllj8tsu1M0VS9fMZvFh8iHoFBL05LwcXleN2xObcjFcLDdo
 nIn7pnuYGLn90ROjE2bOw4Q6/QtmEtj5Cv0LBMcUI2q5QcUaRzrBO+W+VzTMhK+3tsQ2RCzve
 qq9Rlfu7BXtS2MTAvxo/E7kVyK9Ox+fVRKFqXZZej/1hMi6l/SVvr8ReQ==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds the GPIO and pin controller to the devicetree for the
WPCM450 SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 8eba4897b41bc..1b63943b2a42b 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -77,5 +77,16 @@ aic: interrupt-controller@b8002000 {
 			interrupt-controller;
 			#interrupt-cells =3D <2>;
 		};
+
+		pinctrl: pinctrl@b8003000 {
+			compatible =3D "nuvoton,wpcm450-pinctrl";
+			reg =3D <0xb8003000 0x1000>;
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
+				      3 IRQ_TYPE_LEVEL_HIGH
+				      4 IRQ_TYPE_LEVEL_HIGH
+				      5 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
=2D-
2.30.2

