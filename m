Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF8AFB859
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 20:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbfKMTF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 14:05:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54933 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727363AbfKMTF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 14:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573671927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5swNe55zdSChr9JmgEyGE5npOrldlT3OHBMuB+wFbM=;
        b=XP+0pXYOVzbGMJVCxrueIqr/nlPKAIH7nTeCOD322rswBJu9GwpV9UHk+dgfsaJazgGOr1
        i6j4nIu1F2MVYFEvwo5t1ZeMUFqU+NdZSaHpLqql+6tARU9lc2GDr28wtr+mlKiJZ2N6H5
        dPgIXeArdXR6ubbkgI4jX6ItKIh5azs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-YamR4xpsO5GsF3LNOuy01g-1; Wed, 13 Nov 2019 14:05:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8D11DBE5;
        Wed, 13 Nov 2019 19:05:24 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com [10.36.116.143])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5B1AA101E814;
        Wed, 13 Nov 2019 19:05:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH v3 2/3] pinctrl: cherryview: Add GPIO <-> pin mapping ranges via callback
Date:   Wed, 13 Nov 2019 20:05:19 +0100
Message-Id: <20191113190520.305410-2-hdegoede@redhat.com>
In-Reply-To: <20191113190520.305410-1-hdegoede@redhat.com>
References: <20191113190520.305410-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: YamR4xpsO5GsF3LNOuy01g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When IRQ chip is instantiated via GPIO library flow, the few functions,
in particular the ACPI event registration mechanism, on some of ACPI based
platforms expect that the pin ranges are initialized to that point.

Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 33 ++++++++++++++--------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/i=
ntel/pinctrl-cherryview.c
index 3c6c6d69d92d..dd7d48614b7b 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1581,6 +1581,27 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *ch=
ip)
 =09return 0;
 }
=20
+static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+=09struct chv_pinctrl *pctrl =3D gpiochip_get_data(chip);
+=09const struct chv_community *community =3D pctrl->community;
+=09const struct chv_gpio_pinrange *range;
+=09int ret, i;
+
+=09for (i =3D 0; i < community->ngpio_ranges; i++) {
+=09=09range =3D &community->gpio_ranges[i];
+=09=09ret =3D gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
+=09=09=09=09=09     range->base, range->base,
+=09=09=09=09=09     range->npins);
+=09=09if (ret) {
+=09=09=09dev_err(pctrl->dev, "failed to add GPIO pin range\n");
+=09=09=09return ret;
+=09=09}
+=09}
+
+=09return 0;
+}
+
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 {
 =09const struct chv_gpio_pinrange *range;
@@ -1593,6 +1614,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, =
int irq)
=20
 =09chip->ngpio =3D community->pins[community->npins - 1].number + 1;
 =09chip->label =3D dev_name(pctrl->dev);
+=09chip->add_pin_ranges =3D chv_gpio_add_pin_ranges;
 =09chip->parent =3D pctrl->dev;
 =09chip->base =3D -1;
 =09if (need_valid_mask)
@@ -1604,17 +1626,6 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl,=
 int irq)
 =09=09return ret;
 =09}
=20
-=09for (i =3D 0; i < community->ngpio_ranges; i++) {
-=09=09range =3D &community->gpio_ranges[i];
-=09=09ret =3D gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
-=09=09=09=09=09     range->base, range->base,
-=09=09=09=09=09     range->npins);
-=09=09if (ret) {
-=09=09=09dev_err(pctrl->dev, "failed to add GPIO pin range\n");
-=09=09=09return ret;
-=09=09}
-=09}
-
 =09chv_gpio_irq_init_hw(chip);
=20
 =09if (!need_valid_mask) {
--=20
2.23.0

