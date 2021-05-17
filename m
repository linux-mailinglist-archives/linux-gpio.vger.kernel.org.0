Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EAE3861A3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 22:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhEQUB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 16:01:29 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:58004 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237019AbhEQUB2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 16:01:28 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id ijPJlPskepK9wijPOlg8KC; Mon, 17 May 2021 22:00:11 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621281611; bh=CpKSAgnDhnImU3h7WHVy/pL3FGdxgW6Xn2Btiu3BZtk=;
        h=From;
        b=JstouEqnutiKDR803YxYAyHmN1QcDjFD28nyfBRLhD4HIv11sSRrbXO8JFC+HLDiG
         kzOMrBtUQUQYbVCFtYG+lo+zh9vCWgVLnXMC7RE2qOpVSpglVKnwA1xxye5H7s2lsh
         Gzt1bw6QwHbkq7LPytGMiIaJ76/fevk6C2dzPezaGIieExsDVdIzVHnK8HpeYjkMq/
         iujd2wPVGespr7S1Y78IkdkMhjm+vA3KkCxDBxfbUT9hxdpEN17xe1zz2ITFptYbYR
         ymrJu9B33Xtw7R1XswDh1abg6ExmukMsBrkEXwpowis+Kc5D7NgzGdmDqY+n63VeBO
         bNDbL7YLsUOnA==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60a2cb4b cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=sozttTNsAAAA:8
 a=hlofsd_XEJyvNm5uEDwA:9 a=aeg5Gbbo78KNqacMgKqU:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 2/2] pinctrl: single: set pinmux from pins debug file
Date:   Mon, 17 May 2021 22:00:02 +0200
Message-Id: <20210517200002.6316-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517200002.6316-1-dariobin@libero.it>
References: <20210517200002.6316-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfFli/etZ/wE7L2UP5E0I4DUHCnc++t8yiL/HFQ5l9ZzB5Qp1dwXk3nPydVRszxe3HqI18CFV6eVjElNdcJNRGkbW3hCuntRHl0xDKuN4yDC2oN2ir9Iz
 a/KM8ZQG0CHvsyeSDoJ/+56aqClDlrfEAyrQ5dTojO3Px4iYzRGCaXpUYgbyE294IHWdFzVWWotJlqIXkYb2U7rmY904C9UUA1FGhKRriK/IM40TKyjDA1PM
 yhcCsm7yO6j9g79WQLEBmXsnu0pFz9kxKzY2lPRhLdBV6kG02utv8/KqgKszOYoNobWgBu2X2ZB+2tKXbKHbKOK0pY+cKeF2jhc1DnOO7g8XuTdQBqZ9AkIa
 WBcoztwBg/oXWhK3+lOPrrw6lVXX93O8u7ozYEsI8B1xWUyHX061TPTEy4ZNQpZ/3D84Mmf6FcioPkMluKM3ybuL+Qq56mdy/su6P1XmEWMvY4mLBBVmNjc6
 q6wzQTqXcY0h+ZL1QXifRDXnMmja5UEz7LjLCw==
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

Changes in v2:
- Remove CONFIG_SOC_AM33XX dependency.

 drivers/pinctrl/pinctrl-single.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2c9c9835f375..8497414e3384 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -313,6 +313,23 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
 }
 
+static int pcs_pin_dbg_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   char *buf)
+{
+	struct pcs_device *pcs;
+	unsigned int val, mux_bytes;
+
+	buf = skip_spaces(buf);
+	if (kstrtouint(buf, 0, &val))
+		return -EINVAL;
+
+	pcs = pinctrl_dev_get_drvdata(pctldev);
+
+	mux_bytes = pcs->width / BITS_PER_BYTE;
+	pcs->write(val, pcs->base + pin * mux_bytes);
+	return 0;
+}
+
 static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, unsigned num_maps)
 {
@@ -331,6 +348,9 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
 	.get_group_name = pinctrl_generic_get_group_name,
 	.get_group_pins = pinctrl_generic_get_group_pins,
 	.pin_dbg_show = pcs_pin_dbg_show,
+#if IS_ENABLED(CONFIG_DEVMEM)
+	.pin_dbg_set = pcs_pin_dbg_set,
+#endif
 	.dt_node_to_map = pcs_dt_node_to_map,
 	.dt_free_map = pcs_dt_free_map,
 };
-- 
2.17.1

