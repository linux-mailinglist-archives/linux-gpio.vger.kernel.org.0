Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE88E90F72
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2019 10:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfHQIZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Aug 2019 04:25:53 -0400
Received: from mout.gmx.net ([212.227.17.21]:41305 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfHQIZw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 17 Aug 2019 04:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566030348;
        bh=OclZl71JjJafvFBdBBkyM/N/A67EHRaXQtmowmWRoR0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Bvc6EmBKKrKWuniYz36rvH6eUnVKgBZTR/zcYSX4KPxT0np/aeDal0wBktGFWGpNo
         ICreq0U+TqutxCFeUWBe1FzauoFT6GYx3inZlLYbm5msNzufD3alG2pvE7I/jOKRD8
         juLqOUmsptoCrNUWMwaz8fmOAAlGziCTfnWqNcYM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([82.19.195.159]) by mail.gmx.com
 (mrgmx102 [212.227.17.174]) with ESMTPSA (Nemesis) id
 0MdXSC-1he3GR3XOW-00PPnf; Sat, 17 Aug 2019 10:25:47 +0200
From:   Alex Dewar <alex.dewar@gmx.co.uk>
To:     agross@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar@gmx.co.uk>
Subject: [PATCH] pinctrl/qcom: Fix -Wimplicit-fallthrough
Date:   Sat, 17 Aug 2019 09:25:20 +0100
Message-Id: <20190817082520.7751-1-alex.dewar@gmx.co.uk>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o1x6eoesNv7qishmWoL2Ucl7VvxquR1rNH4cT1rnMGinQcSQYAk
 5rgfbmstyPdXuvbiBDq5g4WOTW/3F3Ui3lSNOM3G/dl5ZzDUmuuDuOz3KjL4kjioPB8799c
 I7X6YQjwpyZruSElqRdmvnbEma3AAgXhx4Z9XgfnA/Zv7N++74mqvtcp+8L23qOHIiOqZXu
 Al+4YTz4HMrcm28AztV3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7QirXCb5saw=:vP35C/dAS/tqYsO+x7LYS8
 WAIus80ysGOcHS7LQ8PJ6NMdOs0fs3cOmOsqDT4c0l/fPJ/bX/HbDU0V88WNBb3YWKubqJALx
 cs0SlxJrORqA9Sy5QZINF0dLo1eA0LZt7izq73KfyJZh5EGQLctbBSUMEQI7yWwEf6Tsvl4vm
 sTPOjNidUpqYXe26+Zxy2Qlz8+DtyWHsJyye7Obv4B9g/bKHv9l6MOIaqAr0QVaHEigYMC6+5
 Z5g5qcetQ347yUBvbCL+1JZHllUMT1Fny6UE4cIGc95X4dbTdEpxrnGTqHwhD0WZtFsBNjT45
 YHWUmnL+AaD7968/SzRVdy/P1G3arTnDZs72Zmgh7sIElhbUE5dxyu1Ih6VKDoKvpFH89XFJf
 dnoxsd6EanmEtQLk1UT57Qv9Wl4KU9N5RomDg6Lv47ignZ9sv/AdvGJmE7GsxVeDrRGBwRNE5
 W34nrJqDuva4xAiiJaRUmvfy8xIFBfnIfDq78jEL7W9zRQky23yzIo7bLnLwwZXq9uAwQAt50
 DgXqEDGlTRXjQ7ItjMRcndNxqbbX53omig1qFviBuwUWC8ScQXl1B+zf0VD6nr0oKrGudoHgz
 osuvZkCz3nukks2hFzm+PRn5yHJPqF9y/4wbAd6oVQIvmtoA2g0QNammjqkXO+YJjlvIb9IU9
 tDnCy1IlpdmYU5/FLjEJ4gNpQpVr7RsKHhd7zP3MIcW0laTjxZFYhNB6hm1OO29qc7AS4OBx+
 xY/CsWhk1wA4rXARmV5LxLDpVYj9zaDt2gUbqSRuaa6NrD6doHv0DG05kQlDsbrm7nAI9OBaW
 ywitnWHB/60oZ0ckFUYMNUU5cUKKjxw2wIDEoQ+ATw7c21TR2WUfJ2FuZ2K5ffw5njBI0V0Xu
 XeeHcU16d6JgpLnYAAOV4Yacau8mJL2B/khjObm8ghuv5vHxNDNhK087oMp+p5SvstrjCJrvI
 J2vU/HDZx/zgNEIaoOisWbJ4LG4Q/8757EuNrcrZIZsJf7EGyl6sBtZ/jtbD9y+P93rxN9/pd
 HG9su4/1HIOl4bhqKUaoabTdy4brS1gEfoJ0jUZWGIggThFKHu+O3CS5PWhkt0Amt14B27Lxv
 ac4K5ojLTlTG9csHFA1meCMkpqIbsWNjRFoPmkyAhjJnLytY9qV7ssN2g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In pinctrl-spmi-gpio.c there is a switch case which is obviously
intended to fall through to the next label. Add a comment to suppress
-Wimplicit-fallthrough warning.

Signed-off-by: Alex Dewar <alex.dewar@gmx.co.uk>
=2D--
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qc=
om/pinctrl-spmi-gpio.c
index f39da87ea185..b035dd5e25b8 100644
=2D-- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -813,6 +813,7 @@ static int pmic_gpio_populate(struct pmic_gpio_state *=
state,
 	switch (subtype) {
 	case PMIC_GPIO_SUBTYPE_GPIO_4CH:
 		pad->have_buffer =3D true;
+		/* FALLS THROUGH */
 	case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
 		pad->num_sources =3D 4;
 		break;
=2D-
2.22.1

