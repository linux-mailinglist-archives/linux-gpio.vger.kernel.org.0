Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC9B2F8A99
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jan 2021 02:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbhAPBzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 20:55:52 -0500
Received: from mout.gmx.net ([212.227.15.18]:52503 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbhAPBzv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Jan 2021 20:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610762047;
        bh=DMi2k1727AnYvJAkq+GaiWpIfrrrIHxl1YxgV2uGSDA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=aj9vWlBX4PSiAVdZF158qZ7y80XNpfe3se/Vwuuo5QCcYg2qJAcQ9OR2jlwht9bUa
         tlUqgmdQ+qNKocKxLkjrCDPFpuxFTRwBBjz1kXjWelvTwix6gY67D67yPgKq0XN4w+
         fQRGw1HkKDcjYv3tvba3YrGcXozS9kgEpYvwgzPo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.209]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1m7Sdt0YMY-0183HA; Sat, 16
 Jan 2021 02:54:07 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     devicetree@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix indentation
Date:   Sat, 16 Jan 2021 02:53:49 +0100
Message-Id: <20210116015350.3501927-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c8RQip0DCwDLC7938Xuda0M19i1r775YAexvJ5soMvsJoW3AFwU
 Y2LW9bgoww60h2MySjqtnF4NwQvyhOwbVoDbIeH1R0psgZcDk0ehk3YgzzaVpfMzvqjy+ts
 1LzeSQhlcMMp3A/B8gwLAM4zI3/qWffoKIQWSSKlI8RlpavDT9xuIp/aZ+v/zNWQpSSYKY5
 kKq8s2bhOvCVsVQV7NBOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:30JImwEhBng=:H90glw4DXV7CXpLXeg7k6Q
 o/gUhm2z8MlgBi4rovQX4DlsNZSLt/96Cb+teKqQfoH98qSv332KR7ruo9OqcT/yWIUnU21b7
 SWLQ3yUjk4YXvI2HU7bVNztmFC0BGOyoZDq1v49w0KBhsdeloV/WuvnD4gxegBwnSs3RdT8GZ
 yE+m3SjevJh0KoqZ6E2orVmT90em/aqqRBfcCcrzFBgAml2Xl0aopTubh1bm3FFJt58cJp/ht
 aB+Sm6SQFv5OparTyFh3tmnvEtgBnR+aNhQBWqBxuUkC94t1/wzCoEX0p7rzjbTuaia0WIwBl
 ZcS15bKNmWP+Pr088XO/fIFtPwiJR9pP/al1uzako1nYIgue5nH3C5R9+GShL+53Uf7EgH7+x
 BJI1Cq7swVjzJ+QhS8QCVV2T2++GrzIRCUhQgGqRtFQMljEleb7Kn7gUQObq+UH1R62W8q2gj
 Q7Llz+RzB5QM6Tghf6nS45akTD/+RFpI7ad/eyjqiuaxEuTZoTPjt3o+SLt1l+jg6HBDyeFHs
 AN0ZyaKvDpGllj2+P7iiUq7U+TeQNIABKGB+6wnFh0KxCeuge06rwzNLz4HWDsj0DoFg++wET
 I900zLl/QPvCuMfBKg9b4pXuU5U9m4AT91bNLNtvarY5dwXShSN5BhI/03xtVHCCGkwAZjHUE
 dBd0fuplfj3IyDOmgpXEXCjAO37SK0MGb5k+9umu2P6/ObNOqa339bHEvvn00NDJdaUr+hfcy
 2Tx4YdK7EzKnurFRqDhQljtpwcv1opz1/5QUHeGejbwMGdGFofpveDea4oSC2jD9KPkIjTC/s
 0EJ1lsvJrDeZZlWGFmnOpJOzFHZTHkd+02+jHaHxMvxpso/ydK/rsNTp6pVYHFwGSbA4nNA95
 30S4IW3RDyZra8F0cUzw==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

yamllint warns:
./Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
  102:10  error   wrong indentation: expected 10 but found 9 (indentation)

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sg=
pio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpi=
o.yaml
index df0c83cb1c6e4..4fe35e650909c 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.y=
aml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yam=
l
@@ -99,8 +99,8 @@ patternProperties:

       '#interrupt-cells':
         description:
-         Specifies the pin (port and bit) and flags, as defined in
-         defined in include/dt-bindings/interrupt-controller/irq.h
+          Specifies the pin (port and bit) and flags, as defined in
+          defined in include/dt-bindings/interrupt-controller/irq.h
         const: 3

       ngpios:
=2D-
2.29.2

