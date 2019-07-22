Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA3D6F982
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfGVGYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:24:01 -0400
Received: from mout.gmx.net ([212.227.17.21]:44721 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfGVGYB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 02:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563776617;
        bh=z18lzCFKYvrFVHVAu6EYGbfVShdzolb5W7gum8yzyTw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=PMdr0Xs/BDri+k3ruvU8E9f/PTmshqM6ZbByqU7iwcn/Dy/nXqizy9VAvnSXbE4Ld
         c6S6qO0zAsM7gJtOwYOMZCW7Dh+aFAwq1bwafDg0YjXgeO5SL0JwHJzx2vLHyPFzbU
         5jn8oAn2ygsdSWwzmq8YDJGK5e8hvYoUtBOn4OfM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M7UUd-1ib4501cDX-00xMvP; Mon, 22
 Jul 2019 08:23:37 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 12/18] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
Date:   Mon, 22 Jul 2019 08:23:25 +0200
Message-Id: <1563776607-8368-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:u2uoodlY+pN+Yt0/KqiyLNu3m1qW+77cDAglaFHSsNtyIg4arci
 xpcOOoDUd4oUqtApolU0S4riyjvuP7IazUsOruOL4gmvzzQAreVjN9S6bt8Y46SwuQoK0Jd
 EBDWaBdxfUT1ChZRjSanjF2HfBTYO/cdkiLVN4RGvAav0FNdVPzP+MJ4aOHm1O5jjhNXkeI
 r5HE7wDU/vL5e8wDpPH+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AveKtSrtcwk=:/pzazmDMPlHZNGUm/hg4oZ
 RfPB3NsoyQuPW1rNfOrOraTHLYBGEGpo2ie8+mlZUIeCqcfXVZ58OF8sKwMyvp/dNYUAfnUJQ
 yzLs+tR/REyMsUJZtHvd+HAJMOQ0920zlJkxUPTxBk+mAWaCQfGJRtRcjTWDCjE5KrrrN9icO
 M5ghuBmnGrVpga9pF7ViO5HDzLq0DeA/UVU5dTAxX5ia+s9GnC71ycKrVsDh2MP0h8d7pmM8f
 DyYL8n0/ioWgoUyolIQ7S6KT+sDGxzrPBB70rXZtiSQH4Le7WPA+XS6l5RfGCwWLo/VfXhogh
 xGuH5uH5I1bwWQZS/lDIugk7BZndIxbGUUX440kRawtl/D3eyq9fqVUH6+vBkE8iaCBwm9jfm
 orj92IXKnVadIVdZ5rkIXsaEo31dJtmsAAwxKauT0gGo/wGWr3qTzXtmZJ+JSP86qG86Xaalg
 IIsTgYbW+rDueI0JZRob1PivQJMwZBZZFeuyTNtmu9pNtDuSHqmcDH+RB70EBa5MsxeuvaEiJ
 Vu0Kct6C8uh5O/rg9865chVRaJ3jvvCx9w6WhGhjUjW5Utn4Mkv6v6h2oNM+kQoER1pX/upY9
 BtLe9LbVauRG5chUP1v8xQ3DEHUrr4Y7FnytzINlVcJozUT/Of4LW+OomvOICYm5OQZopmHEG
 LobIZaV5B1KW6KqX7ZBZ/GFLDbpHVL5ym7nKlHRDJm07oMXVSvG/SKc+H7uxoRwQyuHwUNov0
 1Kao4EwrejKk0tHRbzWtXqX/2mjRajuzN8SCSHbxGVi5e6J8F+Uiv7eCeYJSaFftVcpOmyzA3
 peIniS1wwXbIwqqTh/P+bQ+4y5PI6uVqx15Ybui2mxcpmAAKjqm18a0PDSpSnCgGZzG/NTD00
 CK1FUG534G4vdRQqDWMUH/ig0wFPpigA+4/bhccyAzCXgNGx5iW8eQe79OICo9aHbevl6cd4Y
 egwG3kZmUSJANPU/XJ+1J5Wyk/MMczykf86G7QJwBS2ayvQsCn9WkyNLxvHQJyyvDxJZ+jJnr
 hH4tQ/kOqMDkjgOnjFE1ooBF8PoYt/Ig+NNcjH70tcZ0W/N0Y+PPqd0DqXZb73nUV1LtQnq5X
 ODTtmZY0TNorNQ=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM2711 has a new way of selecting the pull-up/pull-down setting
for a GPIO pin. The registers used for the BCM2835, GP_PUD and
GP_PUDCLKn0, are no longer connected. A new set of registers,
GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
a new compatible string "brcm,bcm2711-gpio" and the kernel
driver will use it to select which method is used to select
pull-up/pull-down.

This patch based on a patch by Al Cooper which was intended for the
BCM7211. This is a bugfixed and improved version.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 105 +++++++++++++++++++++++++++++=
+++--
 1 file changed, 100 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 183d1ff..a493205 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -57,15 +57,24 @@
 #define GPAFEN0		0x88	/* Pin Async Falling Edge Detect */
 #define GPPUD		0x94	/* Pin Pull-up/down Enable */
 #define GPPUDCLK0	0x98	/* Pin Pull-up/down Enable Clock */
+#define GP_GPIO_PUP_PDN_CNTRL_REG0 0xe4 /* 2711 Pin Pull-up/down select *=
/

 #define FSEL_REG(p)		(GPFSEL0 + (((p) / 10) * 4))
 #define FSEL_SHIFT(p)		(((p) % 10) * 3)
 #define GPIO_REG_OFFSET(p)	((p) / 32)
 #define GPIO_REG_SHIFT(p)	((p) % 32)

+#define PUD_2711_MASK		0x3
+#define PUD_2711_REG_OFFSET(p)	((p) / 16)
+#define PUD_2711_REG_SHIFT(p)	(((p) % 16) * 2)
+
 /* argument: bcm2835_pinconf_pull */
 #define BCM2835_PINCONF_PARAM_PULL	(PIN_CONFIG_END + 1)

+#define BCM2711_PULL_NONE	0x0
+#define BCM2711_PULL_UP		0x1
+#define BCM2711_PULL_DOWN	0x2
+
 struct bcm2835_pinctrl {
 	struct device *dev;
 	void __iomem *base;
@@ -975,6 +984,77 @@ static const struct pinconf_ops bcm2835_pinconf_ops =
=3D {
 	.pin_config_set =3D bcm2835_pinconf_set,
 };

+static void bcm2711_pull_config_set(struct bcm2835_pinctrl *pc,
+				    unsigned int pin, unsigned int arg)
+{
+	u32 shifter;
+	u32 value;
+	u32 off;
+
+	off =3D PUD_2711_REG_OFFSET(pin);
+	shifter =3D PUD_2711_REG_SHIFT(pin);
+
+	value =3D bcm2835_gpio_rd(pc, GP_GPIO_PUP_PDN_CNTRL_REG0 + (off * 4));
+	value &=3D ~(PUD_2711_MASK << shifter);
+	value |=3D (arg << shifter);
+	bcm2835_gpio_wr(pc, GP_GPIO_PUP_PDN_CNTRL_REG0 + (off * 4), value);
+}
+
+static int bcm2711_pinconf_set(struct pinctrl_dev *pctldev,
+			       unsigned int pin, unsigned long *configs,
+			       unsigned int num_configs)
+{
+	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	u32 param, arg;
+	int i;
+
+	for (i =3D 0; i < num_configs; i++) {
+		param =3D pinconf_to_config_param(configs[i]);
+		arg =3D pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		/* convert legacy brcm,pull */
+		case BCM2835_PINCONF_PARAM_PULL:
+			if (arg =3D=3D BCM2835_PUD_UP)
+				arg =3D BCM2711_PULL_UP;
+			else if (arg =3D=3D BCM2835_PUD_DOWN)
+				arg =3D BCM2711_PULL_DOWN;
+			else
+				arg =3D BCM2711_PULL_NONE;
+
+			bcm2711_pull_config_set(pc, pin, arg);
+			break;
+
+		/* Set pull generic bindings */
+		case PIN_CONFIG_BIAS_DISABLE:
+			bcm2711_pull_config_set(pc, pin, BCM2711_PULL_NONE);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			bcm2711_pull_config_set(pc, pin, BCM2711_PULL_DOWN);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			bcm2711_pull_config_set(pc, pin, BCM2711_PULL_UP);
+			break;
+
+		/* Set output-high or output-low */
+		case PIN_CONFIG_OUTPUT:
+			bcm2835_gpio_set_bit(pc, arg ? GPSET0 : GPCLR0, pin);
+			break;
+
+		default:
+			return -ENOTSUPP;
+		}
+	} /* for each config */
+
+	return 0;
+}
+
+static const struct pinconf_ops bcm2711_pinconf_ops =3D {
+	.is_generic =3D true,
+	.pin_config_get =3D bcm2835_pinconf_get,
+	.pin_config_set =3D bcm2711_pinconf_set,
+};
+
 static struct pinctrl_desc bcm2835_pinctrl_desc =3D {
 	.name =3D MODULE_NAME,
 	.pins =3D bcm2835_gpio_pins,
@@ -990,6 +1070,18 @@ static struct pinctrl_gpio_range bcm2835_pinctrl_gpi=
o_range =3D {
 	.npins =3D BCM2835_NUM_GPIOS,
 };

+static const struct of_device_id bcm2835_pinctrl_match[] =3D {
+	{
+		.compatible =3D "brcm,bcm2835-gpio",
+		.data =3D &bcm2835_pinconf_ops,
+	},
+	{
+		.compatible =3D "brcm,bcm2711-gpio",
+		.data =3D &bcm2711_pinconf_ops,
+	},
+	{}
+};
+
 static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -997,6 +1089,8 @@ static int bcm2835_pinctrl_probe(struct platform_devi=
ce *pdev)
 	struct bcm2835_pinctrl *pc;
 	struct resource iomem;
 	int err, i;
+	const struct of_device_id *match;
+
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) !=3D BCM2835_NUM_GPIOS);
 	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) !=3D BCM2835_NUM_GPIOS);

@@ -1073,6 +1167,12 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice *pdev)
 					     bcm2835_gpio_irq_handler);
 	}

+	match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
+	if (match) {
+		bcm2835_pinctrl_desc.confops =3D
+			(const struct pinconf_ops *)match->data;
+	}
+
 	pc->pctl_dev =3D devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
@@ -1087,11 +1187,6 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice *pdev)
 	return 0;
 }

-static const struct of_device_id bcm2835_pinctrl_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-gpio" },
-	{}
-};
-
 static struct platform_driver bcm2835_pinctrl_driver =3D {
 	.probe =3D bcm2835_pinctrl_probe,
 	.driver =3D {
=2D-
2.7.4

