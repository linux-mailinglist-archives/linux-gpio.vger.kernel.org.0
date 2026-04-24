Return-Path: <linux-gpio+bounces-35479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKkZCttX62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:45:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BA45DF51
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2654F3013266
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BEE3B19B1;
	Fri, 24 Apr 2026 11:29:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4F33AE6FD;
	Fri, 24 Apr 2026 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030186; cv=fail; b=cirS2HQV/vESkvkkwArt1c23WQWdPvilFo9vKHt9827O9Rb2NcSuM3anuoeHVuL2wdgDsyNCdy48meMqfVVjK8oa7jJLDPrysG7jgAacug+kfP4NEC/BNVYNDAQfYgXbutD3NG2X0po8/3Ol7Rij/uz4+QpqbcP7WhzLziHIWzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030186; c=relaxed/simple;
	bh=n6pdHo+boirE79uVW8w3Dg8rPAAbiVEiF/C/WQJ8agI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hirzxFmGYw2/jf2YXbEeIg8aSJumB8VB5MyqMXoZDYNvWDGFpGuwmTtmKQ4bp4y8YtrcjG6yHzAkEa/oREaCLd8dKfIn0pr3lXBKVYiut3b0U8MGEP+ENfGO6yef7SP+uhMFvsIgB2gosG0QoGBw7GNmnJWqRziKLcivizmM+Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3db6La2ItIJ1MgQ+FPbKssikl6ZGbbGf4V2aFK1Xdn8MMqB0smy1eYOWO9YZYeNp/9W4uvQBmTJ+ixGbMwQhhCyEJhOBVowqqbN0t1fCqfkLCQMFzDgVBIAshq9q8yKLDXS8NxTkrb+2BpVH+5irNB3Ibqs/OBuvKvTcPU7sEqZqv6GtGokc/2FhNzQixkQkwv3MLUk9/6MzON5FS9Ai9vXzBX1ddG/4tfFtwiCkZycTYRn/3z1uq0s8if2kQTYpB7kt4aoMt/P7ndbNqkR/aTmC0KNq6/44OBS4boy3eT7sB1Dhd3TFyTLYtYAhjVWwLBv1T8t/RwSQZqa6hQ2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rgDvSWHaBWHuEfR2CQgVfct26SMO+I+6ldNSayEs+k=;
 b=ZZeLbesc37GJQw64FlVGfavU9YMGYdmFZzXjMMK5UaBvRZnK3+sI21RS8Hb5JRbN+oJLwVwmGxt+l6IPMwElr5PTqqTzoimjDSL9+OvB8HALZ+WT9fAinRsAuJgN1C2FStF1NV0bh4kbm1lpQMcZ0YM9hHmWzEaHdsbbh2BktD35OADfizDt6utUc0idMWmv7/p1hLwk/tBVUOFn5msvG8kIdMmu/fL6lDMxNBEWDRt37LF+8vke9pZ0B2i65Wgev1YeQ/y+oB7KZORbBaCds+0s/ZOWn/ZVI/BBq8sIkJ4GWazdbY7iLQw6ZPNnoJrfcsWmaeHN042xHZJZUlR6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1299.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:38 +0000
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
Subject: [PATCH v1 00/20] Add basic pinctrl drivers for JHB100 SoC
Date: Fri, 24 Apr 2026 04:13:10 -0700
Message-Id: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f1f7d0-40ac-404f-318d-08dea1f28896
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3l/UD0ZvAyKuddGVN7qOOPh/R5ZX/VClTNoB1gqan/09tXR2eU6xEf1DAvaE08fD09NE+LWvTdK7clPf66ElY8K8VlThtVljQvb/D9c7pE37g0/pWdW3UZ6KUR7p7huOPyqtYIUt5z4XhXGkNzReAKGEYqBNrh70R7VdGwixApb1gLad+UjOfVSBfhi09MEGA3tRGs9LYFy0CjKAUKT4jv3QLFu5eDF5bxDWeZwdWT5ovhas/SogmHD13vHYBzAo4spWdI54+MV2KBEoLhbSrfPxYRjMD8liSogHrKvMDVYq8aAQZnq7HugiDaFOrmSG6eN2HecuPI+eVN98yr+15U6jvPMpZrqTFruo4/mZOEdoLJAP0N9sbdyb4MD4q22En1mnboFDeF8A/4Z7D1iPUJ9CiHolDbYKw6NKvhSR++OxS6NLEDgQ4bNAs5PtzNqEtSKEDc0hyWqZg1iOepPRtJocXpsJvPSmFZvTOmlV2PCrK6Zid1hpsw3dpX7Kx90zDvL5s4wpzrOoU/2y9xEEX2XaGenUYnqrepdpd4Db8L/DDFCHgdCP3GjK8w45UnEn6ti/oDN3lyxcHVal/6XSxz3c3vJZBW5jkMY9dYPmUlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cTPNQqtUJrN8mp97RN07APhEJCxyNpgw0nlNnvpclW+mXwIOdGCPSUSEpf07?=
 =?us-ascii?Q?FKIhuVWZNY8cmShEaxaRW0Zp4dgOTWUCpDkCXZJTfKiNlF9ry8mvo8nQxMSt?=
 =?us-ascii?Q?s6jq0D3wnBapz/pYfsPA160Yttcw2tyjQFCmTzqvCAGpXKaCHVeFeFv3MDff?=
 =?us-ascii?Q?HuX62uZ2PAmIFZHScfPL7wr7MPIdOdrJ9nqb5ucpBs1c973EgmSHS28zmxSS?=
 =?us-ascii?Q?K0Ef+KPKzxEd5r+GCkyLZnT0yzDOo6KkPm3el/tBLa4SN4+H0WooLTo4L66/?=
 =?us-ascii?Q?HRMjewV9nRP1DAFesjoDBm+QaX1Q7p+iWzwXb9JUDnM2ll/+IpXveJsX/6Ei?=
 =?us-ascii?Q?vRckHFIOD8r3XmjonTYvFLXiD/0Q4h4l/442sr3IkA9rozcPnHahzDt8gse1?=
 =?us-ascii?Q?pVQnkmDbNyzz8vVkI60Z0Pojbry+AvpsRNJzZbFv6sTBozRbzNBJWfLZv8TE?=
 =?us-ascii?Q?R5XM5cccNaQ+7v2jdQwt9BTsniMYkHebR/6AtyIILawHmDlXbH+PWR8RxFHa?=
 =?us-ascii?Q?n6Vry5aU8yWkMtOYvExC17guJPSXky4ntUuicBGY6FDoiE63M5GFkBW74Wfy?=
 =?us-ascii?Q?Pn0Lbmz28GgbscP8R2WOGNZ74qit5/stsXxDFnnn8qya0ZYMu2EWBUTKIhhA?=
 =?us-ascii?Q?icgjL4YDN1MjXiXDBHEBYaXccQXBaBEo2ztbF35zPnN2QV9BgA7SWXptwMEP?=
 =?us-ascii?Q?NLazMgjws5AYsCkS6mKvK/2CuH5h2qimAsD3kwyHixanpTAYmetcYGf7/SwP?=
 =?us-ascii?Q?vwF/ZVpouy6Bwmqz3FF5xxcGhaNhjeXso8ALWITalTp31fzE+NXRTVzPlrqO?=
 =?us-ascii?Q?+ApXPQS3/MLhi77yEwLoRiC00G5KBjwC8BXFotLfvhPoC05jAXOTtsx2o557?=
 =?us-ascii?Q?V/H91YeRUaKcQFIbQWG1UB/RBWv9p+lF9WXOBeY/anJvtm6GCB1gGNs+W7dn?=
 =?us-ascii?Q?zBLyrPJbWlr5TRsdzSl3Gi5xzjNmGvOL+29yykM7Pth2kkwqgaX7/3XrzGSb?=
 =?us-ascii?Q?QMNeuWNVybXa0OFixRbmkRQ1BTm9hfkrM+fzt48kJo45W165nbZ5rxN3vX58?=
 =?us-ascii?Q?bjGfP9e1rN6d/kgDe65BNUFYoYmt/vSdr2LncNs/GnlCZn+S4/A52Hd+MiRY?=
 =?us-ascii?Q?n3PSnmwnxAzawbG/oo2c1A9+07nSHLtvjDcW4zClcIxQWc8Ul9bCwCt2qfVq?=
 =?us-ascii?Q?l1JvCmONMMranumV/D2MwqXWdBonBwf+oUu6dFlMpidxvWpHgC6MKLY7hLox?=
 =?us-ascii?Q?DsbzetgDgoE74mNDy21B7v3mnbErSkReLLpnLv7XeZTchbZ2O4/zSqADJc1j?=
 =?us-ascii?Q?l0in9LTvo9SWlClD5At59hFjmonW9ScOGkGTwcyyoJKBHQq1/TfxwI8y4Xp5?=
 =?us-ascii?Q?IiqMjuUcAuEcMNTQeZF9erK/0lOwlYGJ1zb/jxoMR7dWeKTDiYsZJCYP6xaa?=
 =?us-ascii?Q?BKgz3+bghCC6lQU7ErfS0vIR2yppC2LO2DzNO2rDCJnL81zC5KURakyH5Xcl?=
 =?us-ascii?Q?xZlWAGNBfMmS/j5WmHVnbLPlX7dE9mCuCvufsjSCOu3hNYFiiJVekNtBG5Zz?=
 =?us-ascii?Q?kqhOrVSQUAtrohEiHSjx4vCu9spdGt79FFH+eC1FeHvYHHlsKk65tiRzGTAg?=
 =?us-ascii?Q?xd3BVZkTTGOecB6GwNPXE3VrBuT4thLTyoEKRrjd1xgB97IQHYfrwJ78/I8I?=
 =?us-ascii?Q?bL9TeCVYZoBbCUtk8R58zQQShtvTn/u6tQG0QIP1b2d+GF4FlEISya/ttvhr?=
 =?us-ascii?Q?Jgfhuj0po+KYrTK20JjyK0ooQHlSnn5Nl2satGw7RIJf+sl7Jcpi?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f1f7d0-40ac-404f-318d-08dea1f28896
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:38.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4Todrdq50vjt6e2KHV2CwzbGDoB0gglBukFDClF+zYB5DizAx9d7yUHDbmES7q86LbuzAKUCBt9gA1MnDmbvF8yc0teLks3gMv8dle3lklUbMJTd5i+uKFUHdJ/dSwZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1299
X-Rspamd-Queue-Id: A18BA45DF51
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35479-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:mid]

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260402105523.447523-1-changhuang.liang@starfivetech.com/

Changhuang Liang (19):
  dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per3 controller driver
  riscv: dts: starfive: jhb100: Add pinctrl nodes

Lianfeng Ouyang (1):
  riscv: dts: starfive: Add StarFive JHB100 pin function definitions

 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  219 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  217 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  178 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  154 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  177 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  155 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  156 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  155 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  178 ++
 MAINTAINERS                                   |    8 +
 .../boot/dts/starfive/jhb100-evb1-eth.dts     |   27 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |    4 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   19 +
 arch/riscv/boot/dts/starfive/jhb100-pinfunc.h |  642 ++++++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  107 +
 drivers/pinctrl/starfive/Kconfig              |  117 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  100 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  112 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  102 +
 .../pinctrl-starfive-jhb100-per2pok.c         |   80 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  101 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  111 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   81 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   80 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  109 +
 .../starfive/pinctrl-starfive-jhb100.c        | 1821 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  191 ++
 28 files changed, 5412 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinfunc.h
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

--
2.25.1

