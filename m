Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 723B214C1E4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 22:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgA1VIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 16:08:52 -0500
Received: from [167.172.186.51] ([167.172.186.51]:58046 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726143AbgA1VIw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 16:08:52 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 80912DED6C;
        Tue, 28 Jan 2020 21:09:01 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id oAgxOuU78ZEH; Tue, 28 Jan 2020 21:09:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id DD262DF353;
        Tue, 28 Jan 2020 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id hjAfGRws14eA; Tue, 28 Jan 2020 21:09:00 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 72A40DED6C;
        Tue, 28 Jan 2020 21:09:00 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] gpio: pxa: Avoid a warning when gpio0 and gpio1 IRQS are not there
Date:   Tue, 28 Jan 2020 22:08:45 +0100
Message-Id: <20200128210845.332679-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Not all platforms use those. Let's use
platform_get_irq_byname_optional() instead platform_get_irq_byname() so
that we avoid a useless warning:

  [    1.359455] pxa-gpio d4019000.gpio: IRQ gpio0 not found
  [    1.359583] pxa-gpio d4019000.gpio: IRQ gpio1 not found

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 9888b62f37afb..567742d962aef 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -652,8 +652,8 @@ static int pxa_gpio_probe(struct platform_device *pde=
v)
 	if (!pchip->irqdomain)
 		return -ENOMEM;
=20
-	irq0 =3D platform_get_irq_byname(pdev, "gpio0");
-	irq1 =3D platform_get_irq_byname(pdev, "gpio1");
+	irq0 =3D platform_get_irq_byname_optional(pdev, "gpio0");
+	irq1 =3D platform_get_irq_byname_optional(pdev, "gpio1");
 	irq_mux =3D platform_get_irq_byname(pdev, "gpio_mux");
 	if ((irq0 > 0 && irq1 <=3D 0) || (irq0 <=3D 0 && irq1 > 0)
 		|| (irq_mux <=3D 0))
--=20
2.24.1

