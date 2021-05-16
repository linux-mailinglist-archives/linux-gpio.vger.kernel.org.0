Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1A8381F29
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbhEPN47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 09:56:59 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:33398 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233892AbhEPN45 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 09:56:57 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id iHEzl2tgYpK9wiHF6lOWlZ; Sun, 16 May 2021 15:55:41 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621173341; bh=zZLQBLl9wixM7xxtZD+7yOPbluTczTOuH82A39eRwh8=;
        h=From;
        b=YW5enN5amP39PC+aP1tW2smXXvsDSBoFeX5O+8IL2EoEi6ZbB15HvlLptBx575g5K
         irlACxdTpZYmGCeEWUtpDAn+JAuqHfTrmMehRROecnTpHUdmFnpuxw4pC0RMSH/grP
         1TZq8Fnxj/sQAHcugz/ADZCcBirg7Qg4vbzreYLr5MduhD/kmzca4/z4Ed3kMIXCB1
         RPiRnweLLJtPdkkZvqEZvbdbdpH37m/qiqSkJU3NaEndxL8kogoVxVGTsp34SyHivF
         H8+JogyONt2mqkYfEZJGMwrYoW3cNaUwtLj0iT2jU11KnUFXRiJqcCO3qqXwCZgyRW
         s7jCQcRbxppuw==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60a1245d cx=a_exe
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
Subject: [PATCH 2/2] pinctrl: single: set pinmux from pins debug file
Date:   Sun, 16 May 2021 15:55:31 +0200
Message-Id: <20210516135531.2203-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210516135531.2203-1-dariobin@libero.it>
References: <20210516135531.2203-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfJitAJ0M4XIXYHKFsdVSSJT/tz+2fn1XZyqRVv7cNGLeIY1LDkdsgw1cB9KctyKn3zYTLQ3J2o9S3lpE23G/fdUnSu6oIzDYCconWScoLDRvewSB93jK
 +adOMGnuKAiZD1fbVuhdaCd7yGWve3r5v4if3aGJvw+HFikj9rRLvD5sGm+rZARsa3bBpCMbA089B99Bz1mQUVg9kRajMStiHcVfG4eZE/TMiHlhqclh3G82
 OUaKF7qKSMSefEDISPS8cxucIndJC5exNSBZb+oSw7T1+HWTON6GY3va5Ki4871D5wtW3QLD8nmcWV1tAQ6wfa+IwX6khJ/mwbtYXd3dxzJRyhtvHxlqpNoA
 6WMWOlyXZRUMw1Z5/BHpmf6eswgdvVM1vCOTSfYKe8EerB1tnI1nKBo4EXt92QunELD2IHMdHdyOeI2Dm+QdOasSN+sXKyRm3f2Lf8F4/VkAyW5kLsF8SqY4
 BzES+3DmXSMrLGbOcym3p2W4CupnRGT8YBEsZA==
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

 drivers/pinctrl/pinctrl-single.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2c9c9835f375..cdbc2298360d 100644
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
+#if IS_ENABLED(CONFIG_DEVMEM) && IS_ENABLED(CONFIG_SOC_AM33XX)
+	.pin_dbg_set = pcs_pin_dbg_set,
+#endif
 	.dt_node_to_map = pcs_dt_node_to_map,
 	.dt_free_map = pcs_dt_free_map,
 };
-- 
2.17.1

