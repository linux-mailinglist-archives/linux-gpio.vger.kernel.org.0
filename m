Return-Path: <linux-gpio+bounces-36823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGYbOYawBWppZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67B540F04
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 041EA309BDD9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37553C09E4;
	Thu, 14 May 2026 11:13:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6403BED38;
	Thu, 14 May 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757182; cv=fail; b=lkuRPXZaMw8Dd5bS6Nv/mTsHbghuMZHLDEn9ODLlMlf0ymtV55BGytxSKHi3omHLVnn39zT1c0pIjKZ6s62FzPIbeXlYCOu+MIP0eKDlLpn/j1MtgOTMW1TqJwzLE6AN1H44OgQlmvp/v9uX7j+eqi7zZ2LCQ8WaBIg8lZlya+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757182; c=relaxed/simple;
	bh=EQslP4+51FSdPe2ZMrQ4oYja2+l2/PMIRE/clavUeuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RisTJ4nyQNc9NzuuT/ySzy284J9XwuKxRjQXsktpHXQFyaQg4bz3kGWutj2LyJ+AVgIyzfNgnYXvdl8Ay1ag/vW1imYCDgBePn9OpcNUOL8HgrP1JJtJthL1Z3YVW7kE5ox4eBeRQnTpzBwo7kZnWTVJKcBEWBWjICdeHCbcX0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTxEogrrbkPvXP4ylkBbLEiKzViSSBx5sugsJselu8nfEOxjn7Koaind6eYPQiwhztK1++lBeF9D/W3AnBc1A9AeBOyoSIzxaINn8IpiLFoi+IcmzXfLU5jlbC2w4MRvYnPkbGImRh/SmDaEm15+JHuH33svQa/C1Zxij3octOaNPzb00WuVncgC1eTtbWHNuQrU6LerXNEYfgGhJB3AxpvWLyKbPZTyY6hY4KE7mFho/cdRV4QSdWymTeRX/tpb7eklhirYksigyBpfdReE+asQHie4iEJgDzd/ss8AqJ9Qi1F73Sd5KRXfdQbPZe8qOL/oS4feeEjQw+TH/YpToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzCdxDveibJoneAAyYovZTh4NteFJgWZ/9bdrxdhaY8=;
 b=QzJuiTLMXdBsTWqZzz45fx0ndlbVIieiL8Xf33UQda0otaX1ht22tO/rwAkZdFlm1NyatEkFcMznd2OwoO+lVhfPxqhUC/9P7FC0kC2UVt+gif8KVg2CK8IGlKb+LGVR3psaJl0tL3cvkPbUPPggMWGTAwVWkaHLWSQZknDhIOf/iykIbQCdqHzZ/I204k3Gl6v8sC7mpVfS9K4W/d4btWnRjKuSUK1wxMlNvFwNjrhAWPKtSxZ5Y4/GVzZrwggn+GP0UXSREdBMmu4rwtRbNMasFURjX6ValEyNNlBYX7rznuLLDN1RlCfJOdDfhoLnXvVKqEtabDh2A6UJAnq0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:44 +0000
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
Subject: [PATCH v2 11/22] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Thu, 14 May 2026 04:12:07 -0700
Message-Id: <20260514111218.94519-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bcba40be-f906-4a1e-424f-08deb1a9b8ee
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6bXEho5Up+xSSPG7Hq8V5EEvfmTAYnUPy7xGf42M1wWVPGLdc6WJ9kcSljUb66ExdccEy/maJByHO4EztFKoImR6bMVgCjPmCOF5y+wsZoXywMp4VKHy5ZQyyx+NS4s+g0cQ1Yf29+EMCBbpxs2sNsxSZRNupTRqeuhmDxkSRZToU6yg5Z9sM+vaQClt9BTNciaiQzA9ti21sOQb2qmuA16RIbNCMToI+nrwo02aYNSCWrt4ks4sMZXULEAcpyIfxfhBDNo0/FTQVAV3/+Ygjq6cQ1YfkpiyUahKJAA4iHoQlBc+IAwUPzDyJYgPKvjS+qrBZZjUYCsETnnOgJznu8cmx8vYYKYKGRqt/luG76ZZvBxmWM+U+xDr8EQhoeNsaWqIHKj/bCOzrapHnSf7JJBpfS13LGoi3m8AgsvJ0Hy5P/QR9OTFtdHOKcgODUeAqIDrLw6bHpeNj6vm0t96qwX/2pzVy38u3ZZ3eQUqPes6eatUV+mZPmxTSIPKvWV7ms2VhVMvj4/iTVkaW8DAEPw91K9zvv7YtIwnQN5OAXu8uqE0cS3ZSDZje7rwEn1PMqbLYaQrrs4Wtx7rnzXlZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwQX91V+yNvCpe/CxidXE8eKFjB0th0pqCzilKPiQWQ2E9ks3Y7EEU4c6LL5?=
 =?us-ascii?Q?H5WIiWRziylyVv6UKlxvI5eZ6hRsKBlTnc5gzieaQ2hS9WfJzRj6VxqtF8eO?=
 =?us-ascii?Q?E1kckLZ6IhLj/T+ACv8Jgc7lZvnOx74TkoCmvMcHmO2EaCeqHAvP6D1MPTk8?=
 =?us-ascii?Q?sdML9Thp0d6Myw5KUKzhnywalaLTU+eHIp6SWZxsbsfr/VUEYlD5khxF/LKt?=
 =?us-ascii?Q?9fzkGXAPUj03YqjdSGwB4xJfGxg4weKwwEB2rRQxGnuXHgMZ37+FGKrDL8E0?=
 =?us-ascii?Q?79ZoNbyMK8O+sb93qBb/APnkIYJy37w5oyzxksC8RH2w36pdANyhj7A6t0id?=
 =?us-ascii?Q?KfqF3vdnVPuLuAeRs8dMzwKxfkLn5vk07keSr0xrA7JAPKC4/XH44fw4yOsH?=
 =?us-ascii?Q?vXkF1+eS1hXJg77bWT5LL8Ai1ZUyKPE/i/h4hVkRWotsx7KTrrbzg2mtrify?=
 =?us-ascii?Q?uaIbyS4MaUfMWxTlc/bjkK1chciDA94ktD6WYo+Ut21tPo3MVggFypWOzDGf?=
 =?us-ascii?Q?ZgcvhW1KiUs5RBhP3KcG7oMtvDz3i8Mr11b4k4yiKpXGAe+hhso1Ze/VYQRm?=
 =?us-ascii?Q?Aqx2HdMC90Vj58kcnv0rciZlp+dOnaYwTa8OTvPAijBIjC6GI1FGnGCPHh2h?=
 =?us-ascii?Q?5nlposOLXH2yb1cirYypxXmazK+EupdsQ5ZpOwBTjCOFsvFDAQ8yZ6UrSAte?=
 =?us-ascii?Q?RttnLxlFrqS1fbXTGtrlIcPbpi9XLvTpS6and2/i98p/2lLUAjKStoGtysUK?=
 =?us-ascii?Q?UJlLWjqdCb/ZnlH06N/86Z5X7Tnms9CMB99nCEtd3aHRVZnPRI2JGhOZkiwL?=
 =?us-ascii?Q?cp5Wn9MUUaPlleq2xW/BNENRtvbnW2twI+XLE/0/DMNcPHUbkOQWj32earD1?=
 =?us-ascii?Q?2SerFnOiZYcH2oQsZsw0sL2TlPBTclU0BsBw5Ko6QyAwCJ9p4U8QiOx6VXhl?=
 =?us-ascii?Q?/sGIKqPcKRs2nNmR2Maa/ga5nnGqJpNZZXvIz0Qaxl9IiiCYrpZTlMVVWCz+?=
 =?us-ascii?Q?pB82gIDGVqNDF5CnjKWqnNvFk4Ohsw3JgMhCb9JrV8MCoAnJIXl7ko+CWZUH?=
 =?us-ascii?Q?nFGKbpxvvshZg5HwvW3hA1OQ4joMysLPZd9kiPL37kE0oHtmqCj6WJkGJlaT?=
 =?us-ascii?Q?5lcW6yngK+dbJA14pE/dGT17iWJk+Yd8NOmY2gB8mqZ4qGcWxxFRfc/Kwzgt?=
 =?us-ascii?Q?+Ccs/GB97cxPla+fgdJm6v93Y7IKkfth2gld166CjQmvnjiJRQuQM1JOrJBz?=
 =?us-ascii?Q?1MZ6JfqKLd2+KFAu49mxmo/+2M2zkTfbHPvepjHddIEWtez2TIsUWS05D2xF?=
 =?us-ascii?Q?UAOE+HZPWOmkcr5p668m6IPkLq1zBeTeGGfJEY3JrC6Lba0PoL/hETYwmL9S?=
 =?us-ascii?Q?U7owrd8Eb59F96USt8eqnG6TBFhWSxUKAaZGNHINSjAZeyZ5ykEuxPzvamdT?=
 =?us-ascii?Q?qLzAVHclkOqikNAQObH4PnukxPD6snt5TJxa8iTx3N8D9XuYNuuikkyKXwq+?=
 =?us-ascii?Q?JAKemuMPC2pvhsA6spySsb//EK9+bPrxkfEo4V9/Mf8UZG4wsH47zjAra0VJ?=
 =?us-ascii?Q?JW4kcOuJXZ9K3gCKMuC5bnnGs25wAcqJDvsLLedQK04dxenDqCuVLg1YCaHo?=
 =?us-ascii?Q?bE4ucxyWg4Lau66aBfcE8TpD3vEPsatD46pLXU+nLTVos9gdsUKmBuZ+5xOb?=
 =?us-ascii?Q?DwcyOk6TGBWlw9D40IFEH113ma5TG/0+d4zuj1yJIp0CUlzecX/XDtmWslbz?=
 =?us-ascii?Q?14SrBH+0jwEkvHyoJX/mG+1CnQD/YPNmRmf3hrTn4y5noMee+Sum?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcba40be-f906-4a1e-424f-08deb1a9b8ee
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:44.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1tmDsTbKPlkI8d2vVgu0xB8vyN0eBAZolUOrvGEb/6JajJ6UgL8Hug/Z1LvJFvSK68LIxN1zM23NZ3/45N1A+ddv6KAqFObDHxKKDFUmknNKNK6NDUlr79gO8v3yD7o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 5F67B540F04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36823-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.890];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

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
index 000000000000..2601eb7b5b59
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
+		.pin_cnt			= 5,
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
+		.name = "gpiow0",
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
+		.name = "gpiow-inner",
+		.pin_grp = {
+			PADNUM_SYS2_GPIO_A40,
+			PADNUM_SYS2_GPIO_A41,
+			PADNUM_SYS2_GPIO_A42,
+			PADNUM_SYS2_GPIO_A43
+		},
+		.num_pins = 4,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_sys2_pinctrl_regs = {
+	.vref			= { .reg = 0x000, .pv_desc = pinvref_desc_sys2 },
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


