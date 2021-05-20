Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897B338B869
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 22:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237986AbhETUaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 16:30:16 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:55772 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237353AbhETUaP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 16:30:15 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jpGWlKVEa5WrZjpGrlTUNw; Thu, 20 May 2021 22:27:53 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621542473; bh=iriFGB7/8coo66GVgaP8apTtH6WPOPW8oKA7OvT/6CM=;
        h=From;
        b=liNACm8XkWyLia6tBpy2xyV77bu0I86JYRzafaSXLH48DfJlipaGRF/+zQrNYaEnm
         iUKNehj82KlKaICmXp3GNYHsb0+sy3eQSpl1wvj2tWJmDszbJeqx7pll6jIdkWkbI4
         dJDuQHIIVK4IUPxk6PuBkxxnua09KRIuKkpUQwrh6nAGZD4Lxcu4kjdiPHBdNPnNQ2
         c9/yTYrwpxYsgYvsFEJZxZNbu4XNHk9fJNm7DxjZVs4PuPq2n+7tJrYQXeZTFATouZ
         h4o5lMCm8w0LK2TuCclW3Pw78UfKqDRDYcqp02VNW426oiIiVBQ33RrCzxcXTRSIM0
         hh3sc5xRZ2Q2A==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6c649 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17 a=sozttTNsAAAA:8
 a=EdIpBv2ybtxptObV3yYA:9 a=aeg5Gbbo78KNqacMgKqU:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 3/3] pinctrl: single: set pinmux from pins debug file
Date:   Thu, 20 May 2021 22:27:30 +0200
Message-Id: <20210520202730.4444-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520202730.4444-1-dariobin@libero.it>
References: <20210520202730.4444-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfIUmEvQVxqvsNff7Mc8QYZVUGolb2h3/P3PFxHG5VygqL5T5I2Ja4Gf6GxfDvt86ebJJBjztbv5sXiNyvfP+xIQSoF/FbWpQM26jzirtbxbau2MWod9W
 UOEccBj3hn6Gx6MDH7rRmXfpc6BzHDXVB1cP6HMk7lJoBw135Ob69lr3pU7vmKn4KEXvB7CLJw+Dp+HBq9oLxWXYi83Cb+uIzRIYu44MIEdopXRcaNi0M3Ra
 fonCq7tbAyLXYaiosCoQMIEbq98pPvyRlWFKFsXPmKw9oQnocT3JBEHRopuEHSSZ+RcQ+QSjlTIxAxhYmZCtkRqH7F56XQ30QdwNu1WkmDFrqpFaGJkyuDse
 lYFXr0Rb0iIlpeanzljf6aoUiJiUfjvBXyg98WoSwgb/W9DebHfNwUVLXceOupyuUPHtwkK1FFotmW6+7T0EcB+/hILoRvXmOstmDlETIO6InIupEwU8rvbh
 pctqDbbP9T4mVHoKTqowPQUyNv2FkMQqpo8Rz9qPno5u97gqNd0lNgMa7m2vUcX6oodbXu1ZNwY/F2MvznICvq4gFnApRxcb3D9hg+sOAk+Zxeag6sL7v5zx
 Yhs=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As described in section 9.1 of the TI reference manual for AM335x [1],
"For writing to the control module registers, the MPU will need to be in
privileged mode of operation and writes will not work from user mode".
By adding the pin_dbg_set helper to pcs_pinctrl_ops it will be possible
to write these registers from the pins debug:

cd /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/
echo <pin-number> <reg-value> >pins

[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v3:
- Remove CONFIG_DEV_MEM dependency.
- Change pcs_pin_dbg_set() interface (char *buf -> unsigned int val).

Changes in v2:
- Remove CONFIG_SOC_AM33XX dependency.

 drivers/pinctrl/pinctrl-single.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2c9c9835f375..1b75236563cf 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -313,6 +313,18 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
 }
 
+static int pcs_pin_dbg_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned int val)
+{
+	struct pcs_device *pcs;
+	unsigned int mux_bytes;
+
+	pcs = pinctrl_dev_get_drvdata(pctldev);
+	mux_bytes = pcs->width / BITS_PER_BYTE;
+	pcs->write(val, pcs->base + pin * mux_bytes);
+	return 0;
+}
+
 static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, unsigned num_maps)
 {
@@ -331,6 +343,7 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.pin_dbg_show = pcs_pin_dbg_show,
+	.pin_dbg_set = pcs_pin_dbg_set,
 	.dt_node_to_map = pcs_dt_node_to_map,
 	.dt_free_map = pcs_dt_free_map,
 };
-- 
2.17.1

