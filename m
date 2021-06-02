Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51313988D4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFBMFv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:05:51 -0400
Received: from mout.gmx.net ([212.227.15.19]:38451 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229647AbhFBMFu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 08:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622635443;
        bh=ooaky4yb4fR/kpe3fOFHpn9arD6FeYQatJSIhw5he0s=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GClIPpgJ0ZLEA9aC+vCZiiyrCO5GtyVpu+xXmWOhS9NAtXU7OvKfE0D7YCi1gRZ3N
         X92fr79GIlF9QKecaqpBZN536OQWO8wwsz2qsHm60LgpCAFrtiboAbHI0u6VyR9zh6
         qBU9gd2MrMteLaoBvP0RD4543tt7OvlRpJ6GU8Cw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRfv-1lHHdz3z6v-00br0D; Wed, 02
 Jun 2021 14:04:03 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 3/8] ARM: dts: wpcm450: Add global control registers (GCR) node
Date:   Wed,  2 Jun 2021 14:03:24 +0200
Message-Id: <20210602120329.2444672-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Av8Q5qyp7UJ+jpsh6te2UQ1HIlwipslvwhbsf5scacg5mpU7ugo
 GjVhdMGeX5/oKg7lgaQZ58rMJF4KERTu26vyv0BIxA1DANjLu+HtbOt6pT2ZCJ/w+rqes8/
 4I4bKBia4jJNEs3WPo8js8K8rHZlvX5QU+TRsyiGDFfJ73O79WnifVfDu1FxDYvEAo8GEhl
 lrcuQFljQjozDVB6QI+Ag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iDdL61byTUU=:BF2kGh65FVUlT3+OTNuBh+
 ofYPsioYmQWuFnCByVavoxtYB/7LXBj8Oe7byeXgg2oCaE+jgJuErwY7VBpwDCYldHdCJjDOT
 cif4cy50TklukqDNHUBDWdVv8UrC6KMKxUQnE6Sxhtn8NRpoefmj3FJmCudbMJrotvI19G/Pm
 ApXZ7ysdvzRls7WZYHbejVTC2nCxNI/Jtsjz4KsgUARmolmYlPjaeYk5WwCPvT/1RdtpcTSR2
 xGm6MstAYo3+/s8/rqONMERXK4qxG3HRJb+u59CPh7Xml+8AFskpC6u7SuJtF8/sbW4CSVAi2
 gTW+Anthk2RBjgcldvRLe0AE6NXONIQCP7s57fB+JPbLMgyp/sv9wlXnR0pDOD/6lpH0PQNgI
 KLn63SJM9cjBcKKqJCA6QErisCtwrUBzY6Fxh8+gwfY1LlKznVAdZOEZZ7VyYSr8xeHWBJdIx
 pZRz7V9j7wG8KUZF3FG3Wzi7bw8vsf6baDtVcnxnhjX2RBQz8auUtdAWdNq06vNyeFlBX3vO7
 6WzPSD/QmL3x8/yTam788m5rfB2LpJC7vhwEuYAYeRlzu/BMwROsxBC30yVLUtPZzgGcRDs6A
 0WsIzneSwjAFr4piCxFyhtLqt0H3rnNwaTSAYWltDOMH39duRg0mkQ1/b7GFAdzra5BJzv/IR
 xtdPctf86wdPYq8ed7vrflO3Q09rYgOb1BqIaH1zR74zzArRLZX8YCC91F7c5H+/qS+b6G4i8
 EQqEeNBpZxonUgQV0WOiP1dIxuPwjc6omQOxw51enRsVs9ufk848PbiWaUWFjqhU5S8A6Ev4G
 eEtgX3M6XMEUkVnY8CMmEnrg9Qga+sNDL76gYv3PZ+Mu+xNdQstGyAuBpc2i9rVQX4OeJ0iUz
 wQx+L625eefk/AjYw7HMR2BDm4r4+T7CFtUAxuC31llFUrr6bYxZFGiM0gireKbezyLtg9rRE
 EQxHGv69Iyrh1UXCvUbsw2DGFebPBsJR8LzusFgHLwoo6tooxU5Yj3O2UaaWNQqTb6zy00PUM
 33H33QFDZpynA7g+uOwIEKi+5LKdXEZO3eIH6v4gX6BzYnVy6snRWs1XI0NMQoxFMak6JQeiu
 D7vQiFvhaGHaJEZcqqf+c2HawC0oXpIVr9K0D2USpUKBqS6d/eZbEfhRw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Global Control Registers (GCR) are a block of registers in Nuvoton
SoCs that expose misc functionality such as chip model and version
information or pinmux settings.

This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
enabling pinctrl on this SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index d7cbeb1874840..8eba4897b41bc 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -33,6 +33,11 @@ soc {
 		interrupt-parent =3D <&aic>;
 		ranges;

+		gcr: gcr@b0000000 {
+			compatible =3D "nuvoton,wpcm450-gcr", "syscon", "simple-mfd";
+			reg =3D <0xb0000000 0x200>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.30.2

