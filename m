Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9D4FC3A0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 11:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfKNKIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 05:08:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56975 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726263AbfKNKIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 05:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573726098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U1SyoxI+vZfWqmnYkwlSATSEAtW4nHARUu7lxhzTadU=;
        b=PGRSHTB5mogBmTd0Hx71Q6UI9DGLg3Fkll6ZeBYQknl0JmSSjrQCONh++k38KPMmHmQaf3
        GdTWYiBHhszctsZVzxH7upWbO7uRcC6plRhQgRAZNbNbO8MKrKqoJ+ahNolnPnk4IDoD20
        eMNxaPfAaOIZh8Ac8S40Kv6QIVAf1yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-sX2YuGHaNQaTA4oDu153FQ-1; Thu, 14 Nov 2019 05:08:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D6AA107ACE3;
        Thu, 14 Nov 2019 10:08:15 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DA60F5F795;
        Thu, 14 Nov 2019 10:08:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH v4 3/3] pinctrl: cherryview: Pass irqchip when adding gpiochip
Date:   Thu, 14 Nov 2019 11:08:04 +0100
Message-Id: <20191114100804.15148-3-hdegoede@redhat.com>
In-Reply-To: <20191114100804.15148-1-hdegoede@redhat.com>
References: <20191114100804.15148-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sX2YuGHaNQaTA4oDu153FQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward conversion.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add kerneldoc for chv_pinctrl.irq struct member

Changes in v4:
- Rebase on latest intel-pinctrl/for-next
- Fold if (need_valid_mask) ... if (!need_valid_mask) ... into an if-else
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 45 +++++++++++-----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/i=
ntel/pinctrl-cherryview.c
index b3f6f7726b04..60527b93a711 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -149,6 +149,7 @@ struct chv_pin_context {
  * @chip: GPIO chip in this pin controller
  * @irqchip: IRQ chip in this pin controller
  * @regs: MMIO registers
+ * @irq: Our parent irq
  * @intr_lines: Stores mapping between 16 HW interrupt wires and GPIO
  *=09=09offset (in GPIO number space)
  * @community: Community this pinctrl instance represents
@@ -165,6 +166,7 @@ struct chv_pinctrl {
 =09struct gpio_chip chip;
 =09struct irq_chip irqchip;
 =09void __iomem *regs;
+=09unsigned int irq;
 =09unsigned int intr_lines[16];
 =09const struct chv_community *community;
 =09u32 saved_intmask;
@@ -1617,18 +1619,26 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl=
, int irq)
 =09chip->add_pin_ranges =3D chv_gpio_add_pin_ranges;
 =09chip->parent =3D pctrl->dev;
 =09chip->base =3D -1;
-=09if (need_valid_mask)
-=09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
-
-=09ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
-=09if (ret) {
-=09=09dev_err(pctrl->dev, "Failed to register gpiochip\n");
-=09=09return ret;
-=09}
=20
-=09chv_gpio_irq_init_hw(chip);
+=09pctrl->irq =3D irq;
+=09pctrl->irqchip.name =3D "chv-gpio";
+=09pctrl->irqchip.irq_startup =3D chv_gpio_irq_startup;
+=09pctrl->irqchip.irq_ack =3D chv_gpio_irq_ack;
+=09pctrl->irqchip.irq_mask =3D chv_gpio_irq_mask;
+=09pctrl->irqchip.irq_unmask =3D chv_gpio_irq_unmask;
+=09pctrl->irqchip.irq_set_type =3D chv_gpio_irq_type;
+=09pctrl->irqchip.flags =3D IRQCHIP_SKIP_SET_WAKE;
=20
-=09if (!need_valid_mask) {
+=09chip->irq.chip =3D &pctrl->irqchip;
+=09chip->irq.init_hw =3D chv_gpio_irq_init_hw;
+=09chip->irq.parent_handler =3D chv_gpio_irq_handler;
+=09chip->irq.num_parents =3D 1;
+=09chip->irq.parents =3D &pctrl->irq;
+=09chip->irq.default_type =3D IRQ_TYPE_NONE;
+=09chip->irq.handler =3D handle_bad_irq;
+=09if (need_valid_mask) {
+=09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
+=09} else {
 =09=09irq_base =3D devm_irq_alloc_descs(pctrl->dev, -1, 0,
 =09=09=09=09=09=09community->npins, NUMA_NO_NODE);
 =09=09if (irq_base < 0) {
@@ -1637,18 +1647,9 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl,=
 int irq)
 =09=09}
 =09}
=20
-=09pctrl->irqchip.name =3D "chv-gpio";
-=09pctrl->irqchip.irq_startup =3D chv_gpio_irq_startup;
-=09pctrl->irqchip.irq_ack =3D chv_gpio_irq_ack;
-=09pctrl->irqchip.irq_mask =3D chv_gpio_irq_mask;
-=09pctrl->irqchip.irq_unmask =3D chv_gpio_irq_unmask;
-=09pctrl->irqchip.irq_set_type =3D chv_gpio_irq_type;
-=09pctrl->irqchip.flags =3D IRQCHIP_SKIP_SET_WAKE;
-
-=09ret =3D gpiochip_irqchip_add(chip, &pctrl->irqchip, 0,
-=09=09=09=09   handle_bad_irq, IRQ_TYPE_NONE);
+=09ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 =09if (ret) {
-=09=09dev_err(pctrl->dev, "failed to add IRQ chip\n");
+=09=09dev_err(pctrl->dev, "Failed to register gpiochip\n");
 =09=09return ret;
 =09}
=20
@@ -1662,8 +1663,6 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, =
int irq)
 =09=09}
 =09}
=20
-=09gpiochip_set_chained_irqchip(chip, &pctrl->irqchip, irq,
-=09=09=09=09     chv_gpio_irq_handler);
 =09return 0;
 }
=20
--=20
2.23.0

