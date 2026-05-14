Return-Path: <linux-gpio+bounces-36830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPncBq+xBWq0ZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:27:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFA541000
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88135304226C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D973BED7A;
	Thu, 14 May 2026 11:27:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBD38B15B;
	Thu, 14 May 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758029; cv=fail; b=qsFIWSnhbeSZZKC/HGMZ3SeiA1VQsg4fezq83gI+iNhFt0IoRTMSXOR7q/FShFgeNIwJ8ifdRuBMmrvTUDMhuSLajvStBVsYnVCk2zcm4Css4YqSDu5Pib8oMOheimBfLA2cUZH/C6iSIbWGzOipzDfdTNkictCj4tZZVmOvduA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758029; c=relaxed/simple;
	bh=054Y7W0UnUZRszGt4ls6M9QrWTVYlI5pQior/cRFg8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HEiquUu3fXGrGkC26rJN61rDeNaWUe+NGukoCV4EgPiz/laiajUAt49e3huseWe12OkC0wGTfYBYvywbjC+5JBlnqe5gh0spLQy4AvGGbtG+kV22AtCyvenr/yLDSkT3HBlGeBYwDfhv1xnRtXUdhSwuj8gJSjL0K7RluK3gtyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRxCwSD+pwh3GRxeqxsAtStJxkJJRb6LEOMfLH8DmmI/LHB0dAZ9d4QfzfT1kZAa5/YyvHstslWV2IQtVxNiD9bjwVr7UR1sDno0uWUXWIQgdWrprZ1SBXSBn0PaAmV/KSyElDFWqJJ3yesbUuJaZYmvVUIQTFrXqw9ez1/+g5dA5J9xk+gytIcnWvmDdl/RHn9/3KhN9ZJrg1Mbo+JO/RfUInx9piDpPmj0Hi9xiQQ3wTlFZRKKpB0/HGUdlow/WJb1iP9nXdrd5WlQgE0L6BHFqdEO9LZi4fAzHSIWPdzYYODcoxEBQ9D6zUq2d8BT8YjUBlSDyLOqqSFjc+hsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LYl2Vn/1WamAYIJ11ENoJZC9XnYI0KfD7kK5y1N9u8=;
 b=U9TnWwdekjJuj48aSusBfUhAEZZY+AyleA0waSTndKU3uOus4oaG7M5P56t76qIPACYAEkoVa/WqLUWdii9jqMd58zb4pLDzH54400MIb+1kU0XeORRvDc4lr4d2F8zHeNVAKK33w8eeFauDJBXfPUexOEO2wkyygL6P3ZXW6I/CJVk+J4RqVrjiqzFfD8+d7P2fiIpVqKnWN0Z0srSE+EchtEVesZbWDtrum7AFidJ8QPxIsW/JvGQluKHJwMVklj/YOaNcYzxTZISG1R99DAHCqRlmQBKqjNIwuj2A18iYbnVehrDbGp1jm04MqBtYpD1qc3xaYtkgE8VuWlR16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 05/22] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
Date: Thu, 14 May 2026 04:12:01 -0700
Message-Id: <20260514111218.94519-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: dd63519a-4716-4265-a6d1-08deb1a9b4ce
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UGlb+OwPuMoZB5CKtMzUKWR8ceWMsE1k8xAkgk0jb782rxwV+CIW1WwhDITcXbKe4H9VQkBBzUqBvC8YtpP6W7jnc2HFM3e2821jWnkfYNVINae4q3OAv6Jllt/NHwv+NSEX+NLDAaZVW+ieYBC++AsGRsQHwinhDbb6vdHEARwWYJTbWdm6UtfvoyLqVo5ujX7Qrnia8pRBmJEkMkeyyGwEG6cG+k+pqqEeOb7luYJ5A/ScLVvbVGRcRAnSAtZThzvVZ03zEf6DyZkjTyifpsfUhyoeww1SZfMiWRwt/cjOvxFRe6yR35lK34KdKtmCxtI+mDEsJP1pZiX2gNhHvPoha6RpviB5poPwH2JNx9rGXnzF8S2AAVEr14nU8yWP8eA0XVAkfOgdq/RCDUaKLr7z/T/aYsCjPg+1PcsxQAgHxSrDvkPjz/L0y8KqZ3kyS3O17yrlWjpPlieNnpGROrJ5EN7i+eP1hj7Ufq/6qltQ7t7cio/MqKG+/YokY+bzrN+xUpLvkxghPIh01ezpV9n7obBlqxT1cHi9ZdYK2Vj6ziWGs2wl4oE9iboCpJ8hiaC9vnkjw41oxNucpsqlZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ifygcMCQAMqNlFr24EvgXz3+xufFWnPujx7QfCiLrCXwlxehYY1v4VYeEZQU?=
 =?us-ascii?Q?V82qH78woU77J4QDoRG6yRPJl4W83Tq/LYC6T4I+awZg+kuuHDgzawZEXUuV?=
 =?us-ascii?Q?QRphcrIQGBxLC+yVHk4Le8eEjMlXtzsbKKUDWvdclLVnez7sRgqHrrpxEHU/?=
 =?us-ascii?Q?afrD/n95QullnNIvhXy615azeQ/cgWo4r2zDnCIPnG5rolhIAWn9qRkvgakb?=
 =?us-ascii?Q?fukjkphkUW/AfprT1rLZVqXjI5c2zHJn4g8ASunSGgd9uJ+hlpYqA31U2r8+?=
 =?us-ascii?Q?3z5aIGXvGWNr//uqyBTM/HMJ73gHwfy+d5sPW1kYn9xfenLRWjpkNrgv8t3G?=
 =?us-ascii?Q?ssUoZzWbLv/01/jwL/KcUSCUVO7Cf8c0M96Kq2DKf62tbQcdVIm+9vHSeQe2?=
 =?us-ascii?Q?U4l6Ghakjl9IaFAdlBNAt1ervj3e8q9xHF1aJ7K8K+FZ7BxUVtqts11Cq/m4?=
 =?us-ascii?Q?KSZnnfFYIqzoKiCsEIi/spCT4y7Sojo9tYbeQ4Cjw9e/jA8Juzt/yNCo2yVc?=
 =?us-ascii?Q?vR+hzZPIcVFUKFxxcqPd8drkuF2t9q268Y2I1n/RjfiW5x1hk6L8qBcy866G?=
 =?us-ascii?Q?p64UeLbsgTd6UKwrqQokmxDH4egjrOrAbCeeNJCAmtfjBssbF2nSF62XWoJE?=
 =?us-ascii?Q?jcLg5N7yXDhwR1DmvVb9kFppbqZCiQ79ru36hEobSoH5WV+4XD2/Y/d0TgvV?=
 =?us-ascii?Q?E95gNQK7OBWoY4bOAtUA/1kJPKtaPmRgfrIHU63EQh5EZa7c5J1qNFX0f77Y?=
 =?us-ascii?Q?fwiSMX9ucCWN2/9uhkHx8UuCJYbaGpHzveRtynQ70z1UA2FjdTbyKK+y6bhV?=
 =?us-ascii?Q?+BLOfC5Fcaen33ZRSClF+KhhhB72eccv2DdxfBaIr9GTtIYf9UWYPVDH6jY1?=
 =?us-ascii?Q?dnxQ2CZODIsXeFXtMCVmFU8Rep5P1fwKIu9YIA/TfTNaUPlwReIJpBuPENJg?=
 =?us-ascii?Q?r59wdLhhXTpDYXoetc4IlwKvjVka+WYpWfceeNt9vhkQdAxSthHMcdCBJf+/?=
 =?us-ascii?Q?EG7pZzUWdbWCGU7Ea2KtnJwvsNqIW/+noQtfgPJmHId/ZMYKQr3lLPlTUZbv?=
 =?us-ascii?Q?EmNOg2oery0ogkdwLCx55Qqeg+rO+zKrjSk/yEY2vp29g5/ceHyWyhzaOL15?=
 =?us-ascii?Q?bIJdEW06UCUErn3iz23QuQBPcCyX4GWUBnjLsVClMCpw5kR8/pKoU8+nSxw8?=
 =?us-ascii?Q?ylIG0CiPRPT/Sk5rOLUBCQeiq88uOfc0IpI6C9O/q/vhK/1tdhXGYtVakKSF?=
 =?us-ascii?Q?UFJS1NkFrr4dPhvhUb9PDFS6q4tNbhpUKCuUqDTcpVbjMZG7I6haTtXVeatJ?=
 =?us-ascii?Q?pu0rkx2Io9aipGDNwKsDP5Nfijhz5Q79jKjedwEbWSurU30mmP8kUIIVTHrr?=
 =?us-ascii?Q?4EkLCJlKvYXMf/pXGcw+4xGH/Kp3gBjuJxD7/e6QIqqiaV6dbEGGefpCnocv?=
 =?us-ascii?Q?FOw0k3ICb3Fri6n6y2ECDqEo6CPEiSJi2C9gJD6LpEszJLQPQpr4TiXF1uVz?=
 =?us-ascii?Q?R7DxyZWZGL0LAyQlDSIytLCOElp7pZJ+WPAZphcVow4TJs36zXi+/6ML8Xzh?=
 =?us-ascii?Q?KlaAwYEwj5UDPUXZP0x7vAq4sZWUE/jKavn3JfrVqt9GenAzYAv6TuKQyFCJ?=
 =?us-ascii?Q?6+lFB24lPHkJ/V9ToxgGitP0KOMOX6WEXXGAOAySji87NtLA5pzG3RrrWyvL?=
 =?us-ascii?Q?ZW6FgdmnquyZu7qtVpcOiHORAyiCvz5CKuMx2wobWT5d34tlp7yk3yjGsepc?=
 =?us-ascii?Q?nPuQVdjrHcLB1ZKZPqPQNQQdXAhsL6FIHa1WUKlGhrLyo/qicCcI?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd63519a-4716-4265-a6d1-08deb1a9b4ce
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:37.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PxShU0dNWoRfefH8SU+EdlOK2o8+mZ8c3SOnINe/xPrnbOT5fwmTqSCI9t7ZGEOYRIW5hQh7Eg2c7L4pGWtrgoJMNTb4JYgM43JDoQPtiExIzAjcbuX2H1pXHI1Ru+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 70FFA541000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36830-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/starfive/Kconfig              |   19 +
 drivers/pinctrl/starfive/Makefile             |    3 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  123 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1579 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  152 ++
 6 files changed, 1885 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 47e4b368347f..f56721b4cbd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25607,6 +25607,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
+STARFIVE JHB100 PINCTRL DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
+F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
+F:	include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+
 STARFIVE JHB100 RESET CONTROLLER DRIVERS
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index a9a7cb101684..548a1b133f81 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -47,3 +47,22 @@ config PINCTRL_STARFIVE_JH7110_AON
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100
+	bool
+	select GENERIC_PINCTRL
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select OF_GPIO
+
+config PINCTRL_STARFIVE_JHB100_SYS0
+	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support system-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index ee0d32d085cb..c0d368f413bc 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -5,3 +5,6 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)		+= pinctrl-starfive-jh7110.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
+
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..d86a82eb5e05
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 3, .name = "gpio", .gpio_func_sel = 0, },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "bmcpcierp_pe2rst_out", .gpio_func_sel = 1, },
+	{ .pin_start = 4, .pin_cnt = 1, .name = "testen", .gpio_func_sel = -1, },
+	{ .pin_start = 5, .pin_cnt = 1, .name = "syspok_in", .gpio_func_sel = -1, },
+	{ .pin_start = 6, .pin_cnt = 1, .name = "sysrstn_in", .gpio_func_sel = -1, },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "perstn0_in", .gpio_func_sel = -1, },
+	{ .pin_start = 8, .pin_cnt = 1, .name = "perstn1_in", .gpio_func_sel = -1, },
+	{ .pin_start = 9, .pin_cnt = 1, .name = "aprstn_out", .gpio_func_sel = -1, },
+	{ .pin_start = 10, .pin_cnt = 1, .name = "pcierp_wake", .gpio_func_sel = -1, },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0_pinctrl_crl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 4,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 4,
+		.pin_cnt			= 5,
+		.schmitt_trigger_select		= { .shift = 0, .width = 1 },
+		.reserved			= { .shift = 1, .width = 31 },
+	},
+	{
+		.pin_start			= 9,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.slew_rate			= { .shift = 2, .width = 1 },
+		.reserved			= { .shift = 3, .width = 29 },
+	},
+	{
+		.pin_start			= 10,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 25 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_sys0_pinctrl_regs = {
+	.func_sel		= { .reg = 0x44, .width_per_pin = 2 },
+	.config			= 0x0c,
+	.output			= 0x38,
+	.output_en		= 0x3c,
+	.gpio_status		= 0x40,
+	.irq_en			= 0x48,
+	.irq_status		= 0x4c,
+	.irq_clr		= 0x50,
+	.irq_trigger		= 0x54,
+	.irq_level		= 0x58,
+	.irq_both_edge		= 0x5c,
+	.irq_edge		= 0x60,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
+	{ .func = "auxpwrgood",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER3_GPIO_E2) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER3_GPIO_E3) },
+	{ .func = "hbled",		.val = 1 },
+	{ .func = "pe2rst_out",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys0_pinctrl_info = {
+	.name			= "jhb100-sys0",
+	.pl_desc		= jhb100_sys0_pl_desc,
+	.crl_desc		= jhb100_sys0_pinctrl_crl_desc,
+	.regs			= &jhb100_sys0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0),
+};
+
+static const struct of_device_id jhb100_sys0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0-pinctrl",
+		.data = &jhb100_sys0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0-pinctrl",
+		.of_match_table = jhb100_sys0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
new file mode 100644
index 000000000000..e928cc9e4c80
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -0,0 +1,1579 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/sort.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+#include "pinctrl-starfive-jhb100.h"
+
+#define GPOUT_LOW				0
+#define GPOUT_HIGH				1
+
+#define GPOEN_ENABLE				0
+#define GPOEN_DISABLE				1
+
+#define JHB100_DEBOUNCE_WIDTH_STAGES_MAX	0x1FFFFU
+#define JHB100_DEBOUNCE_WIDTH_STAGE_NS		80
+
+/* mode select */
+#define JHB100_PUSH_PULL			0
+#define JHB100_OPEN_DRAIN			1
+#define JHB100_LEGACY_FAST_MODE_PLUS		2
+#define JHB100_LEGACY_FAST_MODE			3
+
+/* i2c open-drain pull-up select */
+#define JHB100_I2C_OPEN_DRAIN_PU_600_OHMS	0
+#define JHB100_I2C_OPEN_DRAIN_PU_900_OHMS	1
+#define JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS	2
+#define JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS	3
+
+#define JHB100_NR_GPIOS_PER_BANK		32
+
+struct field_info {
+	const char *name;
+	unsigned int shift;
+	unsigned int width;
+	unsigned int end;
+};
+
+static int jhb100_map_get_func_val(struct jhb100_pinctrl *sfp, const char *function,
+				   unsigned int pin)
+{
+	const struct jhb100_pinctrl_func_maps *fmaps = sfp->info->fmaps;
+	size_t num = sfp->info->num_maps;
+
+	for (int i = 0; i < num; i++) {
+		if (!strcmp(function, fmaps[i].func)) {
+			if (!fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			if (pin < fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			continue;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static struct config_reg_layout_desc *get_crl_desc_by_pin(struct jhb100_pinctrl *sfp,
+							  unsigned int pin)
+{
+	struct config_reg_layout_desc *crl_desc = sfp->info->crl_desc;
+	unsigned int i = 0;
+
+	do {
+		if (pin >= crl_desc[i].pin_start &&
+		    pin < crl_desc[i].pin_start + crl_desc[i].pin_cnt)
+			return &crl_desc[i];
+	} while (crl_desc[i++].pin_start != 0xff);
+
+	return NULL;
+}
+
+static inline struct jhb100_gpio_bank *jhb100_gc_to_bank(struct gpio_chip *gc)
+{
+	return container_of(gc, struct jhb100_gpio_bank, gc);
+}
+
+static unsigned int jhb100_gpio_to_pin(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	return bank->id * JHB100_NR_GPIOS_PER_BANK + gpio;
+}
+
+static const struct pinctrl_ops jhb100_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	  = pinctrl_generic_get_group_name,
+	.get_group_pins   = pinctrl_generic_get_group_pins,
+	.dt_node_to_map	  = pinctrl_generic_pins_function_dt_node_to_map,
+	.dt_free_map	  = pinctrl_utils_free_map,
+};
+
+static void jhb100_set_gpioval(struct jhb100_pinctrl *sfp, unsigned int pin,
+			       unsigned int val)
+{
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (pin / 32);
+	unsigned int shift = 1 * (pin % 32);
+	unsigned int fs_offset = 4 * (pin / 16);
+	unsigned int fs_shift = 2 * (pin % 16);
+	u32 func_sel_mask;
+	u32 dout, doen, fs;
+	void __iomem *reg_gpio_o;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg_gpio_func_sel;
+	unsigned long flags;
+
+	reg_gpio_o = sfp->base + info->regs->output + offset;
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+	reg_gpio_func_sel = sfp->base + info->regs->func_sel.reg + fs_offset;
+
+	func_sel_mask = GENMASK(info->regs->func_sel.width_per_pin - 1, 0) << fs_shift;
+	dout = val << shift;
+	doen = 0;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	fs = readl_relaxed(reg_gpio_func_sel);
+	if (fs & func_sel_mask) {
+		fs &= ~func_sel_mask;
+		writel_relaxed(fs, reg_gpio_func_sel);
+	}
+	dout |= readl_relaxed(reg_gpio_o) & ~BIT(shift);
+	writel_relaxed(dout, reg_gpio_o);
+	doen |= readl_relaxed(reg_gpio_oen) & ~BIT(shift);
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_set_function(struct jhb100_pinctrl *sfp,
+				unsigned int pin, u8 func)
+{
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	void __iomem *func_sel_reg;
+	unsigned long flags;
+	u32 func_sel_mask;
+	u32 func_sel_val;
+	unsigned int offset = 4 * (pin / (32 / pinctrl_regs->func_sel.width_per_pin));
+	unsigned int shift = pinctrl_regs->func_sel.width_per_pin *
+			     (pin % (32 / pinctrl_regs->func_sel.width_per_pin));
+
+	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
+		return;
+
+	func_sel_reg = sfp->base + pinctrl_regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
+	func_sel_val = func << shift;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	func_sel_val |= readl_relaxed(func_sel_reg) & ~func_sel_mask;
+	writel_relaxed(func_sel_val, func_sel_reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_set_one_pin_mux(struct jhb100_pinctrl *sfp,
+				  unsigned int pin,
+				  u8 func,
+				  int val)
+{
+	const struct pinctrl_pin_desc *desc = &sfp->pins[pin];
+	struct device *dev = sfp->dev;
+	s8 gpio_func_sel =  sfp->gpio_func_sel_arr[pin];
+
+	jhb100_set_function(sfp, pin, func);
+
+	if (pin < sfp->ngpios && (val == 0 || val == 1)) {
+		if (func == gpio_func_sel)
+			jhb100_set_gpioval(sfp, pin, val);
+		else
+			dev_err(dev, "pin (%s) is not a GPIO. func=%d/%d\n",
+				desc->name, func, gpio_func_sel);
+	}
+
+	return 0;
+}
+
+static int jhb100_set_mux(struct pinctrl_dev *pctldev,
+			  unsigned int fsel, unsigned int gsel)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	unsigned int i;
+	const char **functions;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	functions = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		int function;
+
+		function = jhb100_map_get_func_val(sfp, functions[i], group->grp.pins[i]);
+		if (function < 0) {
+			dev_err(pctldev->dev, "invalid function %s\n", functions[i]);
+			return function;
+		}
+
+		jhb100_set_one_pin_mux(sfp, group->grp.pins[i], function, -1);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops jhb100_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name   = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux             = jhb100_set_mux,
+};
+
+static const u8 jhb100_drive_strength_ma[4] = { 2, 4, 8, 12 };
+
+static const u8 jhb100_drive_strength_ma_3bit[8] = { 2, 5, 8, 10, 14, 16, 18, 20 };
+
+static u32 jhb100_padcfg_ds_to_mA(u32 padcfg)
+{
+	return jhb100_drive_strength_ma[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_mA_3bit(u32 padcfg)
+{
+	return jhb100_drive_strength_ma_3bit[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_uA(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_to_uA_3bit(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma_3bit[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_from_mA(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma); i++) {
+		if (v <= jhb100_drive_strength_ma[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_mA_3bit(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma_3bit); i++) {
+		if (v <= jhb100_drive_strength_ma_3bit[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_uA(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA(v);
+}
+
+static u32 jhb100_padcfg_ds_from_uA_3bit(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA_3bit(v);
+}
+
+static void jhb100_padcfg_rmw(struct jhb100_pinctrl *sfp,
+			      unsigned int pin, u32 mask, u32 value)
+{
+	void __iomem *reg;
+	unsigned int offset;
+	unsigned long flags;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config;
+
+	offset = 4 * pin;
+
+	reg = sfp->base + padcfg_base + offset;
+
+	value &= mask;
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_pinconf_get(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *config)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int offset;
+	u32 padcfg, arg;
+	bool enabled;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config;
+
+	offset = 4 * pin;
+
+	if (pin <= sfp->npins)
+		padcfg = readl_relaxed(sfp->base + padcfg_base + offset);
+	else
+		return -EINVAL;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = 0;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+		    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+			return -EOPNOTSUPP;
+
+		enabled = !(padcfg & (RL_DESC_GENMASK(crl_desc, pull_down) |
+				      RL_DESC_GENMASK(crl_desc, pull_up)));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, pull_down))
+			  >> RL_DESC_SHIFT(crl_desc, pull_down);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_up))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, pull_up))
+			  >> RL_DESC_SHIFT(crl_desc, pull_up);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit))
+			arg = jhb100_padcfg_ds_to_mA(padcfg <<
+						     RL_DESC_SHIFT(crl_desc,
+								   drive_strength_2bit));
+		else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit))
+			arg = jhb100_padcfg_ds_to_mA_3bit(padcfg <<
+							  RL_DESC_SHIFT(crl_desc,
+									drive_strength_3bit));
+		else
+			return -EOPNOTSUPP;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit))
+			arg = jhb100_padcfg_ds_to_uA(padcfg
+				<< RL_DESC_SHIFT(crl_desc, drive_strength_2bit));
+		else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit))
+			arg = jhb100_padcfg_ds_to_uA_3bit(padcfg
+				<< RL_DESC_SHIFT(crl_desc, drive_strength_3bit));
+		else
+			return -EOPNOTSUPP;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, input_enable))
+			   >> RL_DESC_SHIFT(crl_desc, input_enable);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+			return -EOPNOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+			   >> RL_DESC_SHIFT(crl_desc, schmitt_trigger_select);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		enabled = true;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, slew_rate))
+			return -EOPNOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, slew_rate))
+		      >> RL_DESC_SHIFT(crl_desc, slew_rate);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int jhb100_pinconf_set(struct pinctrl_dev *pctldev,
+			      unsigned int gpio, unsigned long *config,
+			      unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	u32 param;
+	u32 arg;
+	u32 value;
+	u32 mask;
+	int i;
+
+	crl_desc = get_crl_desc_by_pin(sfp, gpio);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", gpio);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(config[i]);
+		arg = pinconf_to_config_argument(config[i]);
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = 0;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = RL_DESC_GENMASK(crl_desc, pull_down);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, pull_down) |
+			       RL_DESC_GENMASK(crl_desc, pull_up);
+			value = RL_DESC_GENMASK(crl_desc, pull_up);
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			return 0;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, input_enable);
+			value = arg ? RL_DESC_GENMASK(crl_desc, input_enable) : 0;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, schmitt_trigger_select);
+			value = arg ? RL_DESC_GENMASK(crl_desc, schmitt_trigger_select) : 0;
+			break;
+		case PIN_CONFIG_INPUT_DEBOUNCE_NS:
+			u32 debounce_stage;
+
+			if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, debounce_width);
+
+			debounce_stage = arg ? arg / JHB100_DEBOUNCE_WIDTH_STAGE_NS : 0;
+			debounce_stage = umin(debounce_stage, JHB100_DEBOUNCE_WIDTH_STAGES_MAX);
+
+			value = (debounce_stage << RL_DESC_SHIFT(crl_desc, debounce_width));
+			break;
+		case PIN_CONFIG_POWER_SOURCE:
+			if (!RL_DESC_SUPPORTED(crl_desc, vsel))
+				return -EOPNOTSUPP;
+
+			mask = RL_DESC_GENMASK(crl_desc, vsel);
+			value = arg ? arg << RL_DESC_SHIFT(crl_desc, vsel) : 0;
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+
+		jhb100_padcfg_rmw(sfp, gpio, mask, value);
+	}
+
+	return 0;
+}
+
+static int jhb100_pinconf_group_get(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *config)
+{
+	const struct group_desc *group;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	return jhb100_pinconf_get(pctldev, group->grp.pins[0], config);
+}
+
+static int jhb100_pincfg_group_vref(const struct group_desc *group, struct jhb100_pinctrl *sfp,
+				    u32 arg)
+{
+	struct pinvref_reg *vref = &sfp->info->regs->vref;
+	u32 i = 0, pin;
+
+	while (vref->pv_desc[i].name) {
+		if (!strstr(group->grp.name, vref->pv_desc[i].name)) {
+			i++;
+			continue;
+		}
+
+		if (group->grp.npins != vref->pv_desc[i].num_pins)
+			return -EOPNOTSUPP;
+
+		for (pin = 0; pin < group->grp.npins; pin++) {
+			if (group->grp.pins[pin] != vref->pv_desc[i].pin_grp[pin])
+				return -EOPNOTSUPP;
+		}
+
+		if (vref->pv_desc[pin].range & BIT(arg))
+			writel(arg, sfp->base + vref->reg + i * 4);
+
+		break;
+	}
+
+	return 0;
+}
+
+static int jhb100_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *configs,
+				    unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	const struct group_desc *group;
+	u32 mask, value;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	mask = 0;
+	value = 0;
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		crl_desc = get_crl_desc_by_pin(sfp, group->grp.pins[0]);
+		if (!crl_desc) {
+			dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+				group->grp.pins[i]);
+			return -EINVAL;
+		}
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			value |= RL_DESC_GENMASK(crl_desc, pull_down);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up) ||
+			    !RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel))
+				return -EOPNOTSUPP;
+
+			if (RL_DESC_SUPPORTED(crl_desc, pull_up)) {
+				mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+					RL_DESC_GENMASK(crl_desc, pull_up);
+				value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+					RL_DESC_GENMASK(crl_desc, pull_up));
+				value |= RL_DESC_GENMASK(crl_desc, pull_up);
+			} else if (RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel)) {
+				mask |= RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+				value &= ~RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+				switch (arg) {
+				case 600:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_600_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 900:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_900_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 1200:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 2000:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				default:
+					return -EOPNOTSUPP;
+				}
+			} else {
+				return -EOPNOTSUPP;
+			}
+
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_mA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_mA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -EOPNOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_uA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_uA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -EOPNOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, input_enable);
+			value = arg ? (value | RL_DESC_GENMASK(crl_desc, input_enable))
+				: value;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, schmitt_trigger_select);
+			value = arg
+				? (value | RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+				: value;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (RL_DESC_SUPPORTED(crl_desc, slew_rate)) {
+				mask |= RL_DESC_GENMASK(crl_desc, slew_rate);
+				value = arg ?
+					(value | RL_DESC_GENMASK(crl_desc, slew_rate)) :
+					value;
+			} else if (RL_DESC_SUPPORTED(crl_desc, mode_select)) {
+				mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+				value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+				value |= arg ?
+					 JHB100_LEGACY_FAST_MODE_PLUS <<
+					 RL_DESC_SHIFT(crl_desc, mode_select) :
+					 JHB100_LEGACY_FAST_MODE <<
+					 RL_DESC_SHIFT(crl_desc, mode_select);
+			} else {
+				return -EOPNOTSUPP;
+			}
+
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_PUSH_PULL <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_OPEN_DRAIN <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case PIN_CONFIG_INPUT_DEBOUNCE_NS:
+			u32 debounce_stage;
+
+			if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+				return -EOPNOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, debounce_width);
+			value &= ~RL_DESC_GENMASK(crl_desc, debounce_width);
+
+			debounce_stage = arg ? arg / JHB100_DEBOUNCE_WIDTH_STAGE_NS : 0;
+			debounce_stage = umin(debounce_stage, JHB100_DEBOUNCE_WIDTH_STAGES_MAX);
+
+			value |= (debounce_stage << RL_DESC_SHIFT(crl_desc, debounce_width));
+
+			break;
+		case PIN_CONFIG_POWER_SOURCE:
+			if (&sfp->info->regs->vref) {
+				return jhb100_pincfg_group_vref(group, sfp, arg);
+			} else if (RL_DESC_SUPPORTED(crl_desc, vsel)) {
+				mask |= RL_DESC_GENMASK(crl_desc, vsel);
+				value &= ~RL_DESC_GENMASK(crl_desc, vsel);
+				value = arg ?
+					(value | (arg << RL_DESC_SHIFT(crl_desc, vsel))) :
+					value;
+			} else {
+				return -EOPNOTSUPP;
+			}
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	for (i = 0; i < group->grp.npins; i++)
+		jhb100_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
+
+	return 0;
+}
+
+static const struct pinconf_ops jhb100_pinconf_ops = {
+	.pin_config_get		= jhb100_pinconf_get,
+	.pin_config_set		= jhb100_pinconf_set,
+	.pin_config_group_get	= jhb100_pinconf_group_get,
+	.pin_config_group_set	= jhb100_pinconf_group_set,
+	.is_generic		= true,
+};
+
+static int jhb100_gpio_get_direction(struct gpio_chip *gc,
+				     unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	u32 doen;
+	void __iomem *reg_gpio_oen;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+
+	doen = (readl_relaxed(reg_gpio_oen) & BIT(gpio)) >> gpio;
+
+	return doen == GPOEN_ENABLE ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int jhb100_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int gpio)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select),
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select));
+
+	jhb100_set_one_pin_mux(sfp, pin, 0, -1);
+
+	return 0;
+}
+
+static int jhb100_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int value)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+
+	jhb100_set_one_pin_mux(sfp, pin, 0,
+			       value ? GPOUT_HIGH : GPOUT_LOW);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select) |
+			  RL_DESC_GENMASK(crl_desc, pull_down) |
+			  RL_DESC_GENMASK(crl_desc, pull_up),
+			  0);
+
+	return 0;
+}
+
+static int jhb100_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	u32 doen = 0;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg;
+	unsigned long flags;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+	reg = sfp->base + info->regs->gpio_status + offset;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	doen = readl_relaxed(reg_gpio_oen) | BIT(gpio);
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return !!(readl_relaxed(reg) & BIT(gpio % 32));
+}
+
+static int jhb100_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	void __iomem *reg_dout;
+	u32 dout;
+	unsigned long flags;
+
+	reg_dout = sfp->base + info->regs->output + offset;
+	dout = (value ? GPOUT_HIGH : GPOUT_LOW) << gpio;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	dout |= readl_relaxed(reg_dout) & ~BIT(gpio);
+	writel_relaxed(dout, reg_dout);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return 0;
+}
+
+static void jhb100_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ic;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
+static void jhb100_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	void __iomem *ic;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	gpiochip_enable_irq(gc, d->hwirq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) | mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *base;
+	u32 irq_type, edge_both, polarity, mask;
+	unsigned long flags;
+
+	base = sfp->base + offset;
+	mask = BIT(gpio);
+
+	switch (trigger) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = mask; /* 1: rising edge */
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = 0;    /* 0: falling edge */
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = mask; /* 1: both edges */
+		polarity  = 0;    /* 0: ignored */
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = mask; /* 1: high level */
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = 0;    /* 0: low level */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (trigger & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	irq_type |= readl_relaxed(base + pinctrl_regs->irq_trigger) & ~mask;
+	writel_relaxed(irq_type, base + pinctrl_regs->irq_trigger);
+
+	edge_both |= readl_relaxed(base + pinctrl_regs->irq_both_edge) & ~mask;
+	writel_relaxed(edge_both, base + pinctrl_regs->irq_both_edge);
+
+	if (irq_type & mask) { /* edge polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_edge) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_edge);
+	} else if (irq_type == 0) { /* level polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_level) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_level);
+	}
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+	return 0;
+}
+
+static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	int ret = 0;
+
+	if (enable)
+		ret = enable_irq_wake(sfp->wakeup_irq);
+	else
+		ret = disable_irq_wake(sfp->wakeup_irq);
+	if (ret)
+		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
+			enable ? "enable" : "disable");
+
+	return ret;
+}
+
+static void jhb100_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	seq_printf(p, "%s-%d", gc->label, bank->id);
+}
+
+static const struct irq_chip jhb100_irq_chip = {
+	.irq_ack        = jhb100_irq_ack,
+	.irq_mask       = jhb100_irq_mask,
+	.irq_mask_ack   = jhb100_irq_mask_ack,
+	.irq_unmask     = jhb100_irq_unmask,
+	.irq_set_type   = jhb100_irq_set_type,
+	.irq_set_wake   = jhb100_irq_set_wake,
+	.irq_print_chip = jhb100_irq_print_chip,
+	.flags          = IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_IMMUTABLE |
+			  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+			  IRQCHIP_MASK_ON_SUSPEND |
+			  IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t jhb100_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct jhb100_gpio_bank *bank = dev_id;
+	struct gpio_chip *gc = &bank->gc;
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct gpio_irq_chip *girq = &gc->irq;
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int irq_status = pinctrl_regs->irq_status + bank->id * 4;
+	unsigned long is;
+	unsigned int gpio;
+
+	is = readl_relaxed(sfp->base + irq_status);
+	if (!is)
+		return IRQ_NONE;
+
+	for_each_set_bit(gpio, &is, gc->ngpio)
+		generic_handle_domain_irq(girq->domain, gpio);
+
+	return IRQ_HANDLED;
+}
+
+static int field_compare(const void *a, const void *b)
+{
+	const struct field_info *fa = (const struct field_info *)a;
+	const struct field_info *fb = (const struct field_info *)b;
+
+	if (fa->shift < fb->shift)
+		return -1;
+
+	if (fa->shift > fb->shift)
+		return 1;
+
+	return 0;
+}
+
+static int check_crl_desc(struct jhb100_pinctrl *sfp, unsigned int index,
+			  const struct config_reg_layout_desc *desc)
+{
+	struct device *dev = sfp->dev;
+	struct field_info *fields;
+	int field_cnt = 0;
+	int num, i;
+
+	num = sizeof(struct config_reg_layout_desc) / sizeof(struct reg_layout_field);
+
+	fields = kcalloc(num, sizeof(struct field_info), GFP_KERNEL);
+	if (!fields)
+		return -ENOMEM;
+
+	#define COLLECT_FIELD(field) \
+		do { \
+			if (desc->field.width > 0) { \
+				fields[field_cnt].name = #field; \
+				fields[field_cnt].shift = desc->field.shift; \
+				fields[field_cnt].width = desc->field.width; \
+				fields[field_cnt].end = desc->field.shift + desc->field.width; \
+				field_cnt++; \
+			} \
+		} while (0)
+
+	/* same as struct config_reg_layout_desc filed except for pin_start and pin_cnt */
+	COLLECT_FIELD(debounce_width);
+	COLLECT_FIELD(drive_strength_2bit);
+	COLLECT_FIELD(drive_strength_3bit);
+	COLLECT_FIELD(function);
+	COLLECT_FIELD(input_enable);
+	COLLECT_FIELD(vsel);
+	COLLECT_FIELD(mode_select);
+	COLLECT_FIELD(open_drain_pull_up_sel);
+	COLLECT_FIELD(pull_down);
+	COLLECT_FIELD(pull_up);
+	COLLECT_FIELD(reserved);
+	COLLECT_FIELD(retention_signal_bus);
+	COLLECT_FIELD(schmitt_trigger_select);
+	COLLECT_FIELD(slew_rate);
+
+	#undef COLLECT_FIELD
+
+	sort(fields, field_cnt, sizeof(struct field_info), field_compare, NULL);
+
+	for (i = 0; i < field_cnt; i++) {
+		if (fields[i].end > 32) {
+			dev_err(dev,
+				"layout %d: field %s exceeds 32bit [shift=%u, width=%u, end=%u]\n",
+				index, fields[i].name,
+				fields[i].shift, fields[i].width, fields[i].end);
+			goto failed;
+		}
+
+		if (i < field_cnt - 1) {
+			if (fields[i].end > fields[i + 1].shift) {
+				dev_err(dev,
+					"layout %d: field overlap: %s[%u:%u] with %s[%u:%u]\n",
+					index, fields[i].name, fields[i].end - 1,
+					fields[i].shift, fields[i + 1].name,
+					fields[i + 1].end - 1, fields[i + 1].shift);
+				goto failed;
+			}
+		}
+	}
+
+	if (desc->reserved.width > 0) {
+		unsigned int used_mask = 0;
+		unsigned int reserved_mask = 0;
+
+		for (i = 0; i < field_cnt; i++) {
+			if (strcmp(fields[i].name, "reserved"))
+				used_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+			else
+				reserved_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+		}
+
+		if ((used_mask | reserved_mask) != 0xFFFFFFFF) {
+			dev_err(dev,
+				"layout %d: reserved field not cover all unused bits\n",
+				index);
+			dev_err(dev,
+				"used mask: 0x%08X, reserved mask: 0x%08X, combined: 0x%08X\n",
+				used_mask, reserved_mask, used_mask | reserved_mask);
+		}
+	}
+
+	kfree(fields);
+	return 0;
+
+failed:
+	kfree(fields);
+	return -EINVAL;
+}
+
+static int check_layout_pin_range(struct jhb100_pinctrl *sfp,
+				  const struct config_reg_layout_desc *descs,
+				  unsigned int num_desc)
+{
+	struct device *dev = sfp->dev;
+
+	if (descs[num_desc - 1].pin_start + descs[num_desc - 1].pin_cnt > sfp->npins) {
+		dev_err(dev, "layout %u pin_start[%u] + pin_cnt[%u] exceeds pin number[%u]\n",
+			num_desc - 1, descs[num_desc - 1].pin_start,
+			descs[num_desc - 1].pin_cnt, sfp->npins);
+		return -EINVAL;
+	}
+
+	for (int i = 0; i < num_desc; i++) {
+		if (descs[i].pin_start == 0xff)
+			break;
+
+		if (i < num_desc - 1) {
+			if (descs[i].pin_start + descs[i].pin_cnt > descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] overlaps with [%u-%u]\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+
+			if (descs[i].pin_start + descs[i].pin_cnt < descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] -> [%u-%u] has gap\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int check_pinctrl_layouts(struct jhb100_pinctrl *sfp,
+				 const struct config_reg_layout_desc *layouts)
+{
+	struct device *dev = sfp->dev;
+	int i = 0, err_cnt = 0, ret;
+
+	if (!layouts) {
+		dev_err(dev, "layout pointer is NULL\n");
+		return -EINVAL;
+	}
+
+	while (layouts[i].pin_start != 0xff) {
+		ret = check_crl_desc(sfp, i, &layouts[i]);
+		if (ret) {
+			dev_err(dev, "layout %d check failed\n", i);
+			err_cnt++;
+		}
+
+		if (++i > 100) {
+			dev_err(dev, "too many layouts or missing 0xff for end\n");
+			return -EINVAL;
+		}
+	}
+
+	if (!err_cnt) {
+		ret = check_layout_pin_range(sfp, layouts, i);
+		if (ret)
+			err_cnt++;
+	}
+
+	if (err_cnt) {
+		dev_err(dev, "pinctrl layout check finish with %d error(s)\n", err_cnt);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "pinctrl layout check completed!\n");
+	return 0;
+}
+
+static
+struct pinctrl_pin_desc *devm_create_pins_from_pld(struct device *dev,
+						   const struct jhb100_pin_layout_desc *desc,
+						   const char *prefix,
+						   unsigned int *total_pins,
+						   unsigned int *total_gpios,
+						   s8 **gpio_func_sel_arr)
+{
+	struct pinctrl_pin_desc *pins = NULL;
+	unsigned int i, j, ngpios = 0, npins = 0, pin_index = 0;
+	unsigned int same_name_found = 0;
+	s8 *arr;
+
+	if (!dev || !desc || !prefix) {
+		dev_err(dev, "Invalid parameters: desc=%p, prefix=%s\n",
+			desc, prefix);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		if (!desc[i].pin_cnt) {
+			dev_err(dev, "Invalid pin cnt\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		npins += desc[i].pin_cnt;
+	}
+
+	if (npins == 0) {
+		dev_err(dev, "No pins defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(dev, "Total pins to create: %d\n", npins);
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return ERR_PTR(-ENOMEM);
+
+	arr = devm_kzalloc(dev, npins, GFP_KERNEL);
+	if (!arr)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		same_name_found = 0;
+
+		for (j = 0; j < i; j++) {
+			if (!strcmp(desc[j].name, desc[i].name)) {
+				same_name_found = 1;
+				break;
+			}
+		}
+
+		for (j = 0; j < desc[i].pin_cnt; j++) {
+			char *name = NULL;
+			int pin_num = desc[i].pin_start + j;
+
+			pins[pin_index].number = pin_num;
+			if (same_name_found) {
+				name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+						      prefix, desc[i].name,
+						      desc[i].pin_start + j);
+			} else {
+				if (desc[i].pin_cnt > 1)
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+							      prefix, desc[i].name, j);
+				else
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
+							      prefix, desc[i].name);
+			}
+
+			if (!name) {
+				dev_err(dev, "Failed to allocate pin name for pin %d\n",
+					pin_num);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (!strcmp(desc[i].name, "gpio") || desc[i].gpio_func_sel != -1)
+				ngpios++;
+
+			pins[pin_index].name = name;
+			arr[pin_index] = desc[i].gpio_func_sel;
+			pin_index++;
+		}
+	}
+
+	*total_pins = npins;
+	*total_gpios = ngpios;
+	*gpio_func_sel_arr = arr;
+
+	return pins;
+}
+
+static bool starfive_of_node_instance_match(struct gpio_chip *gc, unsigned int i)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+
+	if (i >= sfp->num_banks)
+		return false;
+
+	return (gc == &sfp->banks[i].gc);
+}
+
+int jhb100_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	const struct jhb100_pinctrl_domain_info *info;
+	struct jhb100_pinctrl *sfp;
+	struct pinctrl_desc *jhb100_pinctrl_desc;
+	struct starfive_pinctrl_regs *pinctrl_regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	int ret;
+	int irq;
+
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	pinctrl_regs = info->regs;
+
+	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
+	if (!sfp)
+		return -ENOMEM;
+
+	sfp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfp->base))
+		return PTR_ERR(sfp->base);
+
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\n");
+
+	rst = devm_reset_control_array_get_optional_shared(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n");
+
+	/*
+	 * we don't want to assert reset and risk undoing pin muxing for the
+	 * early boot serial console, but let's make sure the reset line is
+	 * deasserted in case someone runs a really minimal bootloader.
+	 */
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not deassert reset\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	sfp->pins = devm_create_pins_from_pld(dev, info->pl_desc, info->name,
+					      &sfp->npins, &sfp->ngpios,
+					      &sfp->gpio_func_sel_arr);
+	if (IS_ERR(sfp->pins))
+		return PTR_ERR(sfp->pins);
+
+	jhb100_pinctrl_desc = devm_kzalloc(&pdev->dev,
+					   sizeof(*jhb100_pinctrl_desc),
+					   GFP_KERNEL);
+	if (!jhb100_pinctrl_desc)
+		return -ENOMEM;
+
+	jhb100_pinctrl_desc->name = dev_name(dev);
+	jhb100_pinctrl_desc->pctlops = &jhb100_pinctrl_ops;
+	jhb100_pinctrl_desc->pmxops = &jhb100_pinmux_ops;
+	jhb100_pinctrl_desc->confops = &jhb100_pinconf_ops;
+	jhb100_pinctrl_desc->owner = THIS_MODULE;
+	jhb100_pinctrl_desc->pins = sfp->pins;
+	jhb100_pinctrl_desc->npins = sfp->npins;
+
+	sfp->info = info;
+	sfp->dev = dev;
+	platform_set_drvdata(pdev, sfp);
+
+	raw_spin_lock_init(&sfp->lock);
+	mutex_init(&sfp->mutex);
+
+	ret = devm_pinctrl_register_and_init(dev, jhb100_pinctrl_desc,
+					     sfp, &sfp->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not register pinctrl driver\n");
+
+	ret = pinctrl_enable(sfp->pctl);
+	if (ret)
+		return ret;
+
+	sfp->num_banks = DIV_ROUND_UP(sfp->ngpios, JHB100_NR_GPIOS_PER_BANK);
+
+	for (unsigned int i = 0; i < sfp->num_banks; i++) {
+		if (sfp->ngpios > (i + 1) * JHB100_NR_GPIOS_PER_BANK)
+			sfp->banks[i].gc.ngpio = (i + 1) * JHB100_NR_GPIOS_PER_BANK;
+		else
+			sfp->banks[i].gc.ngpio = sfp->ngpios - i * JHB100_NR_GPIOS_PER_BANK;
+
+		sfp->banks[i].id = i;
+
+		sfp->banks[i].gc.parent = dev;
+		sfp->banks[i].gc.label = dev_name(dev);
+		sfp->banks[i].gc.owner = THIS_MODULE;
+		sfp->banks[i].gc.request = pinctrl_gpio_request;
+		sfp->banks[i].gc.free = pinctrl_gpio_free;
+		sfp->banks[i].gc.get_direction = jhb100_gpio_get_direction;
+		sfp->banks[i].gc.direction_input = jhb100_gpio_direction_input;
+		sfp->banks[i].gc.direction_output = jhb100_gpio_direction_output;
+		sfp->banks[i].gc.get = jhb100_gpio_get;
+		sfp->banks[i].gc.set = jhb100_gpio_set;
+		sfp->banks[i].gc.set_config = gpiochip_generic_config;
+		sfp->banks[i].gc.base = -1;
+		sfp->banks[i].gc.of_gpio_n_cells = 3;
+		sfp->banks[i].gc.of_node_instance_match = starfive_of_node_instance_match;
+
+		girq = &sfp->banks[i].gc.irq;
+		girq->handler = handle_simple_irq;
+
+		gpio_irq_chip_set_chip(girq, &jhb100_irq_chip);
+
+		/* mask all GPIO interrupts */
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_en + 4 * i);
+		/* clear all interrupts */
+		writel_relaxed(~0U, sfp->base + pinctrl_regs->irq_clr + 4 * i);
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_clr + 4 * i);
+
+		ret = devm_request_irq(dev, irq, jhb100_gpio_irq_handler, IRQF_SHARED,
+				       sfp->banks[i].gc.label, &sfp->banks[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to register IRQ\n");
+
+		ret = devm_gpiochip_add_data(dev, &sfp->banks[i].gc, sfp);
+		if (ret)
+			return dev_err_probe(dev, ret, "could not register gpiochip\n");
+	}
+
+	dev_info(dev, "StarFive JHB100 GPIO chip registered %d GPIOs\n",
+		 sfp->ngpios);
+
+	ret = check_pinctrl_layouts(sfp, info->crl_desc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jhb100_pinctrl_probe);
+
+MODULE_DESCRIPTION("Pinctrl driver for the StarFive JHB100 SoC");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
new file mode 100644
index 000000000000..0fc45b445c6d
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#ifndef __PINCTRL_STARFIVE_JHB100_H__
+#define __PINCTRL_STARFIVE_JHB100_H__
+
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+#define JHB100_MAX_BANKS			2
+
+struct jhb100_pin_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	const char *name;
+	s8 gpio_func_sel;
+};
+
+struct jhb100_gpio_bank {
+	struct gpio_chip gc;
+	unsigned int id;
+};
+
+struct jhb100_pinctrl {
+	struct device *dev;
+	struct jhb100_gpio_bank banks[JHB100_MAX_BANKS];
+	unsigned int num_banks;
+	struct pinctrl_gpio_range gpios;
+	raw_spinlock_t lock;
+	const char *iodomain_name;
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+	/* register read/write mutex */
+	struct mutex mutex;
+	const struct jhb100_pinctrl_domain_info *info;
+	/* wakeup */
+	int wakeup_irq;
+	struct irq_domain *irq_domain;
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	unsigned int ngpios;
+	s8 *gpio_func_sel_arr;
+};
+
+struct pinvref_desc {
+	const char *name;
+	unsigned int range;
+	u32 pin_grp[32];
+	u32 num_pins;
+};
+
+struct pinvref_reg {
+	unsigned int reg;
+	const struct pinvref_desc *pv_desc;
+};
+
+struct gpio_irq_reg {
+	unsigned int reg;
+	unsigned int width_per_pin;
+};
+
+struct starfive_pinctrl_regs {
+	struct pinvref_reg vref;
+	struct gpio_irq_reg func_sel;
+	unsigned int config;
+	unsigned int output;
+	unsigned int output_en;
+	unsigned int gpio_status;
+	unsigned int irq_en;
+	unsigned int irq_status;
+	unsigned int irq_clr;
+	unsigned int irq_trigger;
+	unsigned int irq_level;
+	unsigned int irq_both_edge;
+	unsigned int irq_edge;
+};
+
+struct reg_layout_field {
+	unsigned char shift;
+	unsigned char width;
+};
+
+#define RL_DESC_SUPPORTED(crl_desc, field) ({ \
+	typeof(crl_desc) _desc = (crl_desc); \
+	(_desc && _desc->field.width > 0); \
+})
+
+#define RL_DESC_SHIFT(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	__desc->field.shift; \
+})
+
+#define RL_DESC_GENMASK(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	RL_DESC_SUPPORTED(__desc, field) ? \
+	GENMASK(__desc->field.shift + __desc->field.width - 1, __desc->field.shift) : 0; \
+})
+
+struct config_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+
+	struct reg_layout_field debounce_width;
+	struct reg_layout_field drive_strength_2bit;
+	struct reg_layout_field drive_strength_3bit;
+	struct reg_layout_field function;
+	struct reg_layout_field input_enable;
+	struct reg_layout_field vsel;
+	struct reg_layout_field mode_select;
+	struct reg_layout_field open_drain_pull_up_sel;
+	struct reg_layout_field pull_down;
+	struct reg_layout_field pull_up;
+	struct reg_layout_field reserved;
+	struct reg_layout_field retention_signal_bus;
+	struct reg_layout_field schmitt_trigger_select;
+	struct reg_layout_field slew_rate;
+};
+
+struct funcsel_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	unsigned int width;
+};
+
+#define JHB100_FUNC_MAPS_MAX_PIN(n)	((n) + 1)
+
+struct jhb100_pinctrl_func_maps {
+	char *func;
+	unsigned char val;
+	u32 max_pin;
+};
+
+struct jhb100_pinctrl_domain_info {
+	const char *name;
+	const struct pinctrl_pin_desc *pins;
+	const struct jhb100_pin_layout_desc *pl_desc;
+	const struct jhb100_pinctrl_func_maps *fmaps;
+	u32 num_maps;
+	struct config_reg_layout_desc *crl_desc;
+	struct starfive_pinctrl_regs *regs;
+};
+
+int jhb100_pinctrl_probe(struct platform_device *pdev);
+
+#endif /* __PINCTRL_STARFIVE_JHB100_H__ */
-- 
2.25.1


