Return-Path: <linux-gpio+bounces-2233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5867282D9E2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 14:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFD1281B03
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 13:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15644168D2;
	Mon, 15 Jan 2024 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="RjkmX9rc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7115AF6;
	Mon, 15 Jan 2024 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169]) by mx-outbound45-239.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 15 Jan 2024 13:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krj8+7n4y9c9D1/fXCSD7HAs+iZIPVfB9iC4rBjgaDUS735Qb3IDm0lYP+mMPg7U58pyzajb/3Cdwzr9Y8trOPhJDw8sSSQUHAFl0fyLNIDE7uz/o4vGqa6vg9tUUoRx2jQjLOqZz/XYRXHLSMAVDKmH83Qa8/M7Ixb4vMnZP9WvcyQxR/9ltr9SQct1EJ7OEZf0+j3Z+9/dgIP2tMC0tCDzT/eqXldhMMG6u+RtgZ2XSMhCpm3w0XrgRmF3grlCYtW2jbj/MNcdP6TaAw+3NMRdi/6UWFijPqtmS57euG354uaK1xm3opGil0naiWWru2NEG0m0OgHHXMOTNbhJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4maJKDp2+VGlfkpTrShcl3bRCtBX7AX5bV9HVT5ijE=;
 b=gSR2TRcXo3Jo06aiga5MbSxBNOKrQ1GtKqWu0XWDJJx3EChardxPqjKjtgj1u/q1B0ZGPbq+jxFASKt+WyE2he67j2MtEGG+RoWF40J4zuy6kqmVdvU4AclO7Aj+xK6B9mEb/vvANGhIfX4yhEUci4qDj1+B6iYx252ysWFxRM/UJRTOUx/sCIdB9wIdLNl11Xm0b4j8Ttrt7gbWoedUjaQx5/QPAVJ+UuQB17vYHsBo0n4eakxLJvC+jvb/+be1eeZUWjeG+BrxcvD5hlsmKKytD2Ja0NXfU9qzLKwZqdyptta/AkBFNt92rwYhP2ICal/5AiYkzIQjLGHMHAM4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4maJKDp2+VGlfkpTrShcl3bRCtBX7AX5bV9HVT5ijE=;
 b=RjkmX9rcQpviq3mma/xspB9ZaQ8h43APVWgtmo48Rx2Yqz5qnuZtQrZSJ3bFdfTYL5SbRdqv513oih5zCwX1DtMVH7xmy9xsFfNrXd6VV9+c+LYx2/nFM993u7gvYBTfbF77eQAE2FnX4WprVjT/lhO7BhrJ4yQme5d4GFoB6qa7Rf5zXCTSBZuCOexcoHOm8Uh4ryiYKBZbaI/V84OgmEq2uxclAvJQjV6GEGhIB+CoD2tuD485UD8u/iIGhaT2DOhhuR2/y91rQBArYt1djtGr3HPOPazoIyD8i9k2/iqRt63/tIBMvLjmIC61nmfBm8dyVnpvPZjyYtKY+ZWjFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 13:16:53 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::283b:b934:7a82:c8c7%7]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 13:16:53 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org
Cc: stefan@agner.ch,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	peng.fan@nxp.com,
	haibo.chen@nxp.com,
	alexander.stein@ew.tq-group.com,
	hector.palacios@digi.com
Subject: [PATCH v2 1/2] gpio: vf610: add support to DT 'ngpios' property
Date: Mon, 15 Jan 2024 14:16:04 +0100
Message-Id: <20240115131605.395691-2-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115131605.395691-1-hector.palacios@digi.com>
References: <20240115131605.395691-1-hector.palacios@digi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:4:60::31) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|PH7PR10MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b1062f-f831-4599-9e06-08dc15cc3dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAC+ro7f37GVUPaiLSsPwunjLAKYu5N0FOsGX3ZydwmNZB3EbmAN8uPoTG7kxHNtSKoHS239mEk5HlLhkLAbk8G9GFsUxg9P+BAQjHzrQMRuzyht/h6emwidy9nl1ZT/11PF2RyIQsrFDa25cekJXiN3l9zNWwWOZxIFmmyNMi8eUGk0bA8bmY9yAN6KCnvRIdTx1TnY8NN5rV0EfhdUnVFxFhxOes2n4/S6ambPrlKNXJOKvFkC6SdpkyNhtVrzjJT0uWP2lij7xb5st2HU8s3KJR6b6TjM1dYxEIn9YoUAoIHTvWXUddiN9BNsbljBPGpHmAvFA4zwKHPVTNGyw40K+zXWcj6iYmXfFF56XqGgIzLTy6pDb4j0ARf4mjGGaVo0bqNoMdZEA8rTI1O0RPJhp8Due/l9LsRpKwmIewTRNZcalM/pUtM2uq+2BGKr4xf4rvTWm/T+8fjRYiGJHXioe46r+4lgcVU9AFi2RIavnARy7C5x3bIKb3Pm5NrXjF2ZZH3nlBrZuIai60HccstPaqMFx4d539+nvr2z/h3x1ERnki9SMN+3OLyoSSImaf6luJY0bIVMgwg5NJbRv/OZ6wqWvyCygVoGxQ7GOzD+sSo9ky8ghLmG/OUa08XY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(38350700005)(2906002)(5660300002)(36756003)(83380400001)(86362001)(316002)(6506007)(52116002)(6512007)(478600001)(6486002)(6666004)(66556008)(66476007)(66946007)(2616005)(26005)(107886003)(1076003)(38100700002)(44832011)(8676002)(4326008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kHc8Lr1i5xXpcZkQUJmQ5y8Up4h1iOIYxgPDOvw2CWvbucYOQOk8XifJMwwH?=
 =?us-ascii?Q?MdmiX1R8ShYU55jFp/S9umVrv2LKDJD/xYY1mZYBeringdemsdlBMamve+1a?=
 =?us-ascii?Q?TF+GHimXTUTZ9FNcnbzPR5O1nLNDeJzf6z/9Eqw48txvOZFsQGWyHMoQItHh?=
 =?us-ascii?Q?5iE9FuoSKxQqbI3pWCYlLPFFTa9aZDjUjufbivDLfcPYhWJ3letm7QBX+sIi?=
 =?us-ascii?Q?Z66ajBD6fc1fsaD9kSlTG54PAVXSifesTBzsilxfdL13Yd2AK39yStFE9n6y?=
 =?us-ascii?Q?JrwPcOhzrRhCjkG+F6Qam5I/MJ2evORLok/UjlNtAEwOzn3WlQdGVd6nc4SL?=
 =?us-ascii?Q?oXJo5OiyJzt8otM/3m/NLrey0j70nVaLxShIh/nzpHDBa5YzDycep3hwPklE?=
 =?us-ascii?Q?yjdSE0BX1omw4YOFMn0Kel9L78wXDlaYY5/9ur4d6fXdOmZhHFhZIs8ATatA?=
 =?us-ascii?Q?ba5yNxszHHQ16lmE3NJiGW47C9aP8kir0LvaQ9Z7sU75JE5FmFTlKH3g3O96?=
 =?us-ascii?Q?U2hqrszUayE+RjxOo320oKjcw3c/7O0/cvNKJ4iMB76bFQbMknwsNpbiqYA6?=
 =?us-ascii?Q?xxeBPQGxR8lLWZREky/zjMBQwmehxCrNL9DUggY60mlIqtygZJ9IbDYsv0im?=
 =?us-ascii?Q?7+5bR1gtBoHbfKiahrzuA7LNqyEXtwn1tU5f3bbPD/pUB2kvVqfMfshu1sKu?=
 =?us-ascii?Q?BoWQcOboFFgDU6WhOaOjtvby1xetuGUmH0KbWouWEZeiFTi7kkjNfACOTNGg?=
 =?us-ascii?Q?CzHZySRK3ySFrV+G+l8nFRiZCHIfKYPyHxKB4UAZ9yCqFfz7M/aFHrC2hf70?=
 =?us-ascii?Q?RWKgEK203VoOxQnSeqwv7ciUJ+2WgECGD0HW8lKTEhjs4Qf2WkYqJ0MGTpOl?=
 =?us-ascii?Q?6avw8REndqoT/5frbbsvPX1zAVG0hjXmaTJ3fpTGPRD/VQT+kkKxqpHWUDVK?=
 =?us-ascii?Q?3Efzz1XGOU/jbD/rsm2FbxpGuTZIAcwrP8SQKC3gyRRQ7zUEme+kX7ADryes?=
 =?us-ascii?Q?MpQ9DZuIbP/E9Prr0xFzMYS0VnooanZ7VEQMhf1r77QOWSxcQ+wj8flaFSUy?=
 =?us-ascii?Q?9Gjh2dsk/rTTKa4Ny/xR/NqncrdL3w9/txbBHtLgs2fZfA7ldtkLZtQSqkh0?=
 =?us-ascii?Q?rwOXD9aSMy5Z9i2rkK+1uD7inj0gtSO8CPzQ0++tACtDEl4rZQ4VS/KnYHcd?=
 =?us-ascii?Q?WGps7TdoIp9isxGhzd9KcJPN6LRlcT7KJRcL1/uQhLNKcKDJYRkY7ZrFBsOE?=
 =?us-ascii?Q?+XzOAFSTUzdXyvtejRoG1WaK2YGVFO/4bCvpWwO5o6zLfFeE60ioEYHPOVvp?=
 =?us-ascii?Q?hPRKwOZmqCxF92kvR9KTu4Eaftq0mzF8d6CN/buwVD1isziIRS0BVAmJGBkM?=
 =?us-ascii?Q?EjyRQ/CrCbWfUD0p2Ztm7UZ8yEs6VhB5y2N3LUGTh0j8julg9D0NueL0BWbM?=
 =?us-ascii?Q?93qmDt++Em0NMVZL5v2s9veIIdvi7sQCpW1NK8T700IFx8hCzDI8mclZuCSX?=
 =?us-ascii?Q?Tup5oj9dVbThFt0iOrNzmCzwtwcbOe6bbW/btlu6WsSMddwnwr9ensuK9WDQ?=
 =?us-ascii?Q?LcdcZtFU373+5FeJ/oDAD/kq5qq7F9ZqaYRfKGFA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b1062f-f831-4599-9e06-08dc15cc3dad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 13:16:53.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2p6wSFST3tpJij5y5h/n402DoYCEh93P3iZWtXsm24EcJkjSrTWxKVvEklx/uWpn/H6MZtEMoTdL4ihKvS5IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-OriginatorOrg: digi.com
X-BESS-ID: 1705324639-111759-12520-348-3
X-BESS-VER: 2019.1_20240103.1634
X-BESS-Apparent-Source-IP: 104.47.56.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobmhhZAVgZQ0DjZLC3R2NIi0c
	Aoydg4LSklzczIwMQwxdQ42dzA0CBJqTYWACVyVQlBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253535 [from 
	cloudscan20-227.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Default to hardcoded VF610_GPIO_PER_PORT (32 pins) but allow optional
generic 'ngpios' property to be specified from the device tree.

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
 drivers/gpio/gpio-vf610.c                              | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a27f92950257..ba4ebdbc5546 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -65,6 +65,12 @@ properties:
     minItems: 1
     maxItems: 4
 
+  ngpios:
+    description: The number of GPIO pins of the port
+    minimum: 1
+    maximum: 32
+    default: 32
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 07e5e6323e86..4abdf75e9a0a 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -276,6 +276,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	u32 ngpios;
 	int i;
 	int ret;
 	bool dual_base;
@@ -353,7 +354,11 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc = &port->gc;
 	gc->parent = dev;
 	gc->label = dev_name(dev);
-	gc->ngpio = VF610_GPIO_PER_PORT;
+	ret = device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ret || ngpios > VF610_GPIO_PER_PORT)
+		gc->ngpio = VF610_GPIO_PER_PORT;
+	else
+		gc->ngpio = (u16)ngpios;
 	gc->base = -1;
 
 	gc->request = gpiochip_generic_request;

