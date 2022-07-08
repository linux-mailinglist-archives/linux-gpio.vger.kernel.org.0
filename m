Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793C156B59F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbiGHJeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 05:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237493AbiGHJeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 05:34:15 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2C33337B;
        Fri,  8 Jul 2022 02:34:13 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26872ieT003232;
        Fri, 8 Jul 2022 05:34:09 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h5tu88xud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 05:34:09 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 2689Y8ju019088
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Jul 2022 05:34:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 8 Jul 2022
 05:34:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 8 Jul 2022 05:34:07 -0400
Received: from nsa.ad.analog.com ([10.44.3.51])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 2689Xi8k017826;
        Fri, 8 Jul 2022 05:34:00 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-input@vger.kernel.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 07/10] input: keyboard: adp5588-keys: fix coding style warnings
Date:   Fri, 8 Jul 2022 11:34:45 +0200
Message-ID: <20220708093448.42617-8-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708093448.42617-1-nuno.sa@analog.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: yE1viX_7DiVSGTiKT81IaKHcDuaUEhVZ
X-Proofpoint-ORIG-GUID: yE1viX_7DiVSGTiKT81IaKHcDuaUEhVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_08,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080035
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Just some code cleanup regarding coding style. No functional changes
intended.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 93 +++++++++++++--------------
 1 file changed, 45 insertions(+), 48 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 1395d2449ec0..32c023dde7a6 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -29,16 +29,16 @@
 #define CFG 0x01		/* Configuration Register1 */
 #define INT_STAT 0x02		/* Interrupt Status Register */
 #define KEY_LCK_EC_STAT 0x03	/* Key Lock and Event Counter Register */
-#define Key_EVENTA 0x04		/* Key Event Register A */
-#define Key_EVENTB 0x05		/* Key Event Register B */
-#define Key_EVENTC 0x06		/* Key Event Register C */
-#define Key_EVENTD 0x07		/* Key Event Register D */
-#define Key_EVENTE 0x08		/* Key Event Register E */
-#define Key_EVENTF 0x09		/* Key Event Register F */
-#define Key_EVENTG 0x0A		/* Key Event Register G */
-#define Key_EVENTH 0x0B		/* Key Event Register H */
-#define Key_EVENTI 0x0C		/* Key Event Register I */
-#define Key_EVENTJ 0x0D		/* Key Event Register J */
+#define KEY_EVENTA 0x04		/* Key Event Register A */
+#define KEY_EVENTB 0x05		/* Key Event Register B */
+#define KEY_EVENTC 0x06		/* Key Event Register C */
+#define KEY_EVENTD 0x07		/* Key Event Register D */
+#define KEY_EVENTE 0x08		/* Key Event Register E */
+#define KEY_EVENTF 0x09		/* Key Event Register F */
+#define KEY_EVENTG 0x0A		/* Key Event Register G */
+#define KEY_EVENTH 0x0B		/* Key Event Register H */
+#define KEY_EVENTI 0x0C		/* Key Event Register I */
+#define KEY_EVENTJ 0x0D		/* Key Event Register J */
 #define KP_LCK_TMR 0x0E		/* Keypad Lock1 to Lock2 Timer */
 #define UNLOCK1 0x0F		/* Unlock Key1 */
 #define UNLOCK2 0x10		/* Unlock Key2 */
@@ -66,9 +66,9 @@
 #define GPIO_INT_LVL1 0x26	/* GPIO Edge/Level Detect */
 #define GPIO_INT_LVL2 0x27	/* GPIO Edge/Level Detect */
 #define GPIO_INT_LVL3 0x28	/* GPIO Edge/Level Detect */
-#define Debounce_DIS1 0x29	/* Debounce Disable */
-#define Debounce_DIS2 0x2A	/* Debounce Disable */
-#define Debounce_DIS3 0x2B	/* Debounce Disable */
+#define DEBOUNCE_DIS1 0x29	/* Debounce Disable */
+#define DEBOUNCE_DIS2 0x2A	/* Debounce Disable */
+#define DEBOUNCE_DIS3 0x2B	/* Debounce Disable */
 #define GPIO_PULL1 0x2C		/* GPIO Pull Disable */
 #define GPIO_PULL2 0x2D		/* GPIO Pull Disable */
 #define GPIO_PULL3 0x2E		/* GPIO Pull Disable */
@@ -91,25 +91,25 @@
 #define ADP5588_DEVICE_ID_MASK	0xF
 
  /* Configuration Register1 */
-#define ADP5588_AUTO_INC	(1 << 7)
-#define ADP5588_GPIEM_CFG	(1 << 6)
-#define ADP5588_OVR_FLOW_M	(1 << 5)
-#define ADP5588_INT_CFG		(1 << 4)
-#define ADP5588_OVR_FLOW_IEN	(1 << 3)
-#define ADP5588_K_LCK_IM	(1 << 2)
-#define ADP5588_GPI_IEN		(1 << 1)
-#define ADP5588_KE_IEN		(1 << 0)
+#define ADP5588_AUTO_INC	BIT(7)
+#define ADP5588_GPIEM_CFG	BIT(6)
+#define ADP5588_OVR_FLOW_M	BIT(5)
+#define ADP5588_INT_CFG		BIT(4)
+#define ADP5588_OVR_FLOW_IEN	BIT(3)
+#define ADP5588_K_LCK_IM	BIT(2)
+#define ADP5588_GPI_IEN		BIT(1)
+#define ADP5588_KE_IEN		BIT(0)
 
 /* Interrupt Status Register */
-#define ADP5588_CMP2_INT	(1 << 5)
-#define ADP5588_CMP1_INT	(1 << 4)
-#define ADP5588_OVR_FLOW_INT	(1 << 3)
-#define ADP5588_K_LCK_INT	(1 << 2)
-#define ADP5588_GPI_INT		(1 << 1)
-#define ADP5588_KE_INT		(1 << 0)
+#define ADP5588_CMP2_INT	BIT(5)
+#define ADP5588_CMP1_INT	BIT(4)
+#define ADP5588_OVR_FLOW_INT	BIT(3)
+#define ADP5588_K_LCK_INT	BIT(2)
+#define ADP5588_GPI_INT		BIT(1)
+#define ADP5588_KE_INT		BIT(0)
 
 /* Key Lock and Event Counter Register */
-#define ADP5588_K_LCK_EN	(1 << 6)
+#define ADP5588_K_LCK_EN	BIT(6)
 #define ADP5588_LCK21		0x30
 #define ADP5588_KEC		0xF
 
@@ -158,10 +158,10 @@
 #define ADP5588_GPIMAPSIZE_MAX (GPI_PIN_END - GPI_PIN_BASE + 1)
 
 /* Key Event Register xy */
-#define KEY_EV_PRESSED		(1 << 7)
+#define KEY_EV_PRESSED		BIT(7)
 #define KEY_EV_MASK		(0x7F)
 
-#define KP_SEL(x)		(0xFFFF >> (16 - x))	/* 2^x-1 */
+#define KP_SEL(x)		(0xFFFF >> (16 - (x)))	/* 2^x-1 */
 
 #define KEYP_MAX_EVENT		10
 
@@ -210,7 +210,7 @@ static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
 	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
-static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -230,7 +230,7 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+				   unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -243,8 +243,7 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-			   kpad->dat_out[bank]);
+	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
 }
@@ -283,7 +282,7 @@ static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 	return ret;
 }
 
-static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -301,7 +300,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned off, int val)
+					 unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -318,12 +317,11 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 		kpad->dat_out[bank] &= ~bit;
 
 	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-				 kpad->dat_out[bank]);
+			    kpad->dat_out[bank]);
 	if (ret)
 		goto out_unlock;
 
-	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank,
-				 kpad->dir[bank]);
+	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
 
 out_unlock:
 	mutex_unlock(&kpad->gpio_lock);
@@ -512,7 +510,7 @@ static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, Key_EVENTA + i);
+		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
 		int key_val = key & KEY_EV_MASK;
 		int key_press = key & KEY_EV_PRESSED;
 
@@ -612,21 +610,20 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
-		ret = adp5588_read(client, Key_EVENTA);
+		ret = adp5588_read(client, KEY_EVENTA);
 		if (ret)
 			return ret;
 	}
 
 	ret = adp5588_write(client, INT_STAT,
-				ADP5588_CMP2_INT | ADP5588_CMP1_INT |
-				ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
-				ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
+			    ADP5588_CMP2_INT | ADP5588_CMP1_INT |
+			    ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
+			    ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
 	if (ret)
 		return ret;
 
 	return adp5588_write(client, CFG, ADP5588_INT_CFG |
-					  ADP5588_OVR_FLOW_IEN |
-					  ADP5588_KE_IEN);
+			     ADP5588_OVR_FLOW_IEN | ADP5588_KE_IEN);
 }
 
 static int adp5588_fw_parse(struct adp5588_kpad *kpad)
@@ -710,7 +707,7 @@ static int adp5588_probe(struct i2c_client *client,
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
-					I2C_FUNC_SMBUS_BYTE_DATA)) {
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
 		return -EIO;
 	}
@@ -734,7 +731,7 @@ static int adp5588_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	revid = (u8) ret & ADP5588_DEVICE_ID_MASK;
+	revid = ret & ADP5588_DEVICE_ID_MASK;
 	if (WA_DELAYED_READOUT_REVID(revid))
 		kpad->delay = msecs_to_jiffies(WA_DELAYED_READOUT_TIME);
 
-- 
2.37.0

