Return-Path: <linux-gpio+bounces-37860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nRURJELDH2pepgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F673634797
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37860-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37860-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83EA2303D13D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D3A3F0AA4;
	Wed,  3 Jun 2026 05:55:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A6E3E5587;
	Wed,  3 Jun 2026 05:55:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466119; cv=fail; b=oR5VibkzccEVjzxxFSl4Z6MMIFGqRdnqqjehL9BLUFrD47yMdIyjLrpp3xqOEWI8YyRxaFfnCG2xXAiDSQ9CyI4qCIe6q0pDOZeaxkForAhuX486tmI3oQWGoTnbv98Yr7hW1VwUf+D2h7sBoMKbH4mAcql8yZmUBRIEQmwogY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466119; c=relaxed/simple;
	bh=2y3B6G9+HpZy/K+B93bBE+U9ygwOeTHZ4nGg/OwPqU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3FcIOlP7uDmuVSy3L/NQbq0/7xxc9AQNDKys6ygwWcGDoarooIt/rTEDsly90QeVo/qr0hroiMLa6M5WJ+oXVnUznroZEyHwgRMO16v07bVgFk4HaJArVIII+j4McdFnBlZnuCwZrKU3AWznJzYP/SalOSlEVJ7DVJzYns/Fps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZXVp0SYRYqtJcWIK5WoNghUQJ8jZPEvZnKr9ySD9jp7vz0mXeXILT5ObF7mSTKC00vJtDTmjFqg8+DNM+TVzrBBt5ppWXsd/R9KKFYJtjO1nqTMgINnIw81cL7AdkBOFspzhGEcbia1FSxo4BMdddqTBkU8aueGsohwjbAWpbBNGAMv4cPC8skxctMcPGo0k3AGBnmtl0u3x80Z701i8SOs3qtk1Xne0o+FpQwnGBHFb48o3fASLl6yKikV1HFFmpOd8vf9nlXujxP9crq5MPP1oAk9dJMDUBpzaoijWmpFaFv+6n1nPBLSIqEg00gznCfSOSXq/A4L0jfNnb2NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLphmebkt4QrHzJ5OPSSmxE5M652ge44TBajr50gMNI=;
 b=ZLcIdKTCyuSSPBb0/X5jIKOL5pSAC6Vli9U+lpvnZatQr9ouLfFGzh0eNFsGC7q+2d2x1NoPJoCJ89i3iiAX68S/q4YD015j2sQGZYXlV2TktoGsOWlAzdH+d7HSbzCCOciaSSBLhgumIYdA/ShgTG362u/idkpnkh+FYKpAngDRCWup/MBGEjf2K7IRfn/nv/TM9JUGDhNxkbM2ZHTcJ6KnzIYQlJB76X/3kxEqocTGvkWqVWpmQMHe2I4zESjuYg+WJVFbs50NewJTthkY0WLsfgNfHxdrzD+lmKpqL7rcLM1qncVNsvmS9nHpOJFacI9D2zZFyIk6gFy/qofwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:13 +0000
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
Subject: [PATCH v3 10/21] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Tue,  2 Jun 2026 22:53:36 -0700
Message-Id: <20260603055347.66845-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: fde42834-7bca-4bef-48e0-08dec1348a1e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Ue0M3Fh67P00usXczRXQzPX2Rd8Lx9Oz89rgJ1dgY1pnrw6uMfFr1JFL9PJQKqdAnsj2VTnnNfhjbyuI3DyK8O3IVPAQfp1WevQ3ShN2zXXTLoW4kdBFUBo8KH29YqM6b9+1o9uZkqNH/vmhq9GJGzGzBYZvRI2kwzO8zYRYCp5OrXRbVAnOYj2li+KAbGu6YeKmVgI9yaTh694jLrhDQXdIjfi/l8+s97ycmfoSe8wGBBfxKMdV98EkvEvRDI4g59jMqGmBLjMweuV6vdVLmghQDvwN38qpNJn398kdOjuWY7Yem9Us3rllzuiGF3IBV2pVJQRylqn/lbl+eooMStAN/t5X6I2C9B1RuHUi0x/JblP9KdaSEyBk1oe0DJGsxsK0YFAyw0fR6z5nZThVoNxYzzylY36YI/8jO4Vz//qXjRqoLl3PntSGXNp0vNA1tbgWxW4qT9LI7LC8N6rW9I+LYAnoJsQrM2bfGPhSvOvifgPjQZZ/obZxWcieJIhAHtfjVvMKow3KwMphVEQWowKt6ZsaLhr18flEHUL+50L2LajwE3y4m/nu3hAsrNdiBDe1H6M5BCeShg02Ke3l6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zBSh9i2p14DF63h8yjHltfeDLUcRMX2MVk36yd67RFL7ZwqKSS8AhO4i36Ri?=
 =?us-ascii?Q?UrySIeQgqm4oVNSqZ9ol2zCcYLnldPrKwsDd6fgq9hGwona52hvG41nk8Nu8?=
 =?us-ascii?Q?nD6sF7payWgrw/4vhrx8EbKbVWlZcF2/hAMiW67UH2xqQTHJW4lJDIDsPdQs?=
 =?us-ascii?Q?TbkQHsGt6823sG4W1Y0KwgpPfGcchW6ioZJChQVBcx65u/wTTcHSZjDQeLk3?=
 =?us-ascii?Q?Nl84YykB0ONNhpTbwqsknqOb0Tn7HVpAz/TIt600UJAgs8SJtP2XH0fQgUP2?=
 =?us-ascii?Q?E6vvIazbQblWwUcohTlH8S3S1ATM/6I+2wYpneXxj/jYobg/KAKMmnQ7XDc2?=
 =?us-ascii?Q?WX5XeRoSF4h7DW+8eNeR7MOFCOrsEskopHR0EdZ2bnhJFKYtFyBr2CLCv0Jp?=
 =?us-ascii?Q?h8xDB332iimlxo/I+N9fPbQump6wLD2ZHXlFMgTVuyxn9eUgtLMhIJA0EJYC?=
 =?us-ascii?Q?DGpfizK9Lsag0LH17V+7RVynlMfUc6FSSGOrbu9T38y9IU6GTQv9E7VD8UIr?=
 =?us-ascii?Q?XV2ZgRprocd4soUjwfjD+Nw3VOaXNFytlmSehnrw+HhKeOK277BkAAbYfD11?=
 =?us-ascii?Q?QCzOVjVniTXRy8J/2OfV7McCvI8TA5dQzIXuCVefwc+YhsBqfbusHwctGo1W?=
 =?us-ascii?Q?c8bu7oQLQaU2PJwkbafs6yKsWaa4O/MRn5qvwr+PccZZU4z5DJV6MTZDVnVB?=
 =?us-ascii?Q?jNwnWBeu8Bj9HmL1Gtaiw3CBkmbF+ce2y9WJPJpKHV5Qh0HKqNaGEyx5urWs?=
 =?us-ascii?Q?WgBiiBak/tlP/a+7SDV283T9zV8nibNiZ8TuPwPJpO6+Pnrp8i0eq/j6um/6?=
 =?us-ascii?Q?Tw0sE5u/BLtpxZWqoC/XjrA7nLEOdsGtf9wqNJAzOfUe3kqbCx478c8zDqZd?=
 =?us-ascii?Q?BS7qNqolrek+o2rRwY8L4eeihsBPmEA0eWAQANeaXXpSCvV9WjYODI2lkpqn?=
 =?us-ascii?Q?IEloszBx8JvW3OPewJEKWMmLOaBXs6e7B/nvadT94x6B04sXLXZ9v3xJN6Rb?=
 =?us-ascii?Q?jjus/6PNpjPjdyyK+DasjkkkR8lVtQllN4kRdzAPKm6iAJTsjJ4JDJE2tLsw?=
 =?us-ascii?Q?XVSgpxlk0JYioM9vto6i9tFKiUd51Ks9gmidjmqZTKNZUF10XuzTziIqgHF7?=
 =?us-ascii?Q?Wd7HOz7NGPYwbALalBsqXNqdODUwWL0Mzn+FXAXTx4oFDShHgWs2biPZ6O6n?=
 =?us-ascii?Q?lmmr9zaTrHNyMQXpXPRNuajHLR4M1BtA6W+oJ7l2eGMtXXvFGOBZ9Se4yJGQ?=
 =?us-ascii?Q?xRC01s4svbMo9Px68+hkJDGOanuUbaIOO1mTkReITzAJ6osIGv6/kkAQCELT?=
 =?us-ascii?Q?/6isfMiwiHsjz4Bnm4/bpVQvG9AS5kqii5T4lBCVFjVkSTA+W2pFrqiiQ/Ib?=
 =?us-ascii?Q?3eNjwXmaCIIGD7KNlQRNdfA8xzVBP6kzM1/96It4wVb84BVzUNm5ifyaXKql?=
 =?us-ascii?Q?nCKPo4MHM/orGc2mDywwcQ6IuvFVxqZ0riwPxvALQul5YXqZNi4q/wflXIvL?=
 =?us-ascii?Q?pFxW/TNOK5lFBJ8XMnMIRvmb8E58nvea7rtY81y4GmrIAKFtai5ZeAdHNwtA?=
 =?us-ascii?Q?r7yk3t7koSAHTR6pcj/zweDHiCK4Cb0pqN7MFTI1UNyUAPAq3m/fPihufyWC?=
 =?us-ascii?Q?u+6PJjLLVNs4G0sey4izUo1k/UfgBiqzr5RiYgyGY7DpARSx0zdxCvWGtnaG?=
 =?us-ascii?Q?g2CoeMV8kOjTgr6j5uJjBvJ+u9D5arQzCnBZReIuJbBSXv9wmjbvLnug6+Ft?=
 =?us-ascii?Q?oqv7HEfqrC7+hCX1taFGT7ZQSlS40RBaw3xRrCrqQf2VK6fTFxXe?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde42834-7bca-4bef-48e0-08dec1348a1e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:13.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRi1KuTR0e3UJlcxUTcYAtxmxOCu6XJwgJ3lj35hmbzFKrUPQafuRfgd6hl53XksmkspRWp32+LnTRXnM2ZLKMd22/sfm7r77oc9FaLqyD4/Ul2yEFHOzI+dXDCrvEVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37860-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F673634797

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 134 ++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 882d621eaf57..da11d486779a 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -90,3 +90,15 @@ config PINCTRL_STARFIVE_JHB100_SYS1
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS2
+	tristate "StarFive JHB100 SoC System-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 8d96cf80d377..b817ad93b91d 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS2)	+= pinctrl-starfive-jhb100-sys2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
new file mode 100644
index 000000000000..59ea9bdaa078
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 37, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 37, .pin_cnt = 1, .name = "jtag_tck", .gpio_func_sel = -1 },
+	{ .pin_start = 38, .pin_cnt = 1, .name = "jtag_tresetn", .gpio_func_sel = -1 },
+	{ .pin_start = 39, .pin_cnt = 1, .name = "jtag_tmc", .gpio_func_sel = -1 },
+	{ .pin_start = 40, .pin_cnt = 1, .name = "jtag_tdi", .gpio_func_sel = -1 },
+	{ .pin_start = 41, .pin_cnt = 1, .name = "jtag_tdo", .gpio_func_sel = -1 },
+	{ .pin_start = 42, .pin_cnt = 1, .name = "jtag_hpd", .gpio_func_sel = -1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys2_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 37,
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
+		.pin_start			= 37,
+		.pin_cnt			= 6,
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
+static const struct pinvref_desc pinvref_desc_sys2[] = {
+	{
+		/* gpiow */
+		.pin_grp = {
+			PADNUM_SYS2_GPIO_A36,
+			PADNUM_SYS2_GPIO_A37,
+			PADNUM_SYS2_GPIO_A38,
+			PADNUM_SYS2_GPIO_A39
+		},
+		.num_pins = 4,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpiow-inner */
+		.pin_grp = {
+			PADNUM_SYS2_GPIO_A40,
+			PADNUM_SYS2_GPIO_A41,
+			PADNUM_SYS2_GPIO_A42,
+			PADNUM_SYS2_GPIO_A43
+		},
+		.num_pins = 4,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+struct starfive_pinctrl_regs jhb100_sys2_pinctrl_regs = {
+	.vref			= { .reg = 0x000, .pv_desc = pinvref_desc_sys2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_sys2) },
+	.func_sel		= { .reg = 0x0d4, .width_per_pin = 2 },
+	.config			= 0x010,
+	.output			= 0x0bc,
+	.output_en		= 0x0c4,
+	.gpio_status		= 0x0cc,
+	.irq_en			= 0x0e0,
+	.irq_status		= 0x0e8,
+	.irq_clr		= 0x0f0,
+	.irq_trigger		= 0x0f8,
+	.irq_level		= 0x100,
+	.irq_both_edge		= 0x108,
+	.irq_edge		= 0x110,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys2[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "jtag",		.val = 2 },
+	{ .func = "smbalert",		.val = 2 },
+	{ .func = "uart",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys2_pinctrl_info = {
+	.name			= "jhb100-sys2",
+	.pl_desc		= jhb100_sys2_pl_desc,
+	.crl_desc		= jhb100_sys2_pinctrl_rl_desc,
+	.regs			= &jhb100_sys2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys2),
+};
+
+static const struct of_device_id jhb100_sys2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys2-pinctrl",
+		.data = &jhb100_sys2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys2_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys2-pinctrl",
+		.of_match_table = jhb100_sys2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


