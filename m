Return-Path: <linux-gpio+bounces-37876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id risPJq3KH2rhpwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:33:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E1634AE8
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37876-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37876-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD927302BB88
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 06:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C303FB7D5;
	Wed,  3 Jun 2026 06:27:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD1305662;
	Wed,  3 Jun 2026 06:27:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468059; cv=fail; b=EJWuml9kMpinYwVvBqoJYRHj/KDnMhuwbs9wRchwvDz1fCMz+uUSl2Y9ARTyLppHo+JCzntQFs5kUAxPlCSluRJuW1qFSzwsl9IRxrmiGQPWPiRL7cUrYT5vzbUhbsinfwDJ0hPBP+NNU/zG9eKlv8pi8qDz7gR+GUbtBzu1U8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468059; c=relaxed/simple;
	bh=VhMjsyauWsWta9QHsGBm9/U40FDRow5CvXV2Fo3MenQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xs+Ij0Jr1ueKryzLqWgK4NtUewxEMy2OXwb1DjFNZfwbS0euFYbxuPDfrohP4mJPIDSoYBj/SOb73TcinMtHYZUhwqKSVNr/4sDGa6WHgVabPeSU5tSCL3k42n7BsibVABX/7dbQvA1wG1ebY0n/oDBg8forLqPD1SgHUAS7Tf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYEdU+FP4ELoDrEam1AY6bTBa1u4xrAHdlclgM4iGkR6RAnvPLhmM/ss3tEtnSWldCENY/Fqt/RS9yhS9k3MqdAqW/HDTdDA0UxfsnPcmEhIqo9yNQnyNT6JNUKCsciKycc7Qvcfo2smahpbnS2IY91DVagApbYE8Ly5ORl9ZShv61v/sKbCagprKpT1+fSAwtGJ2s6c8XwQg0k/XyZoDssn3cYIvbTZ+L57zbgwjpClTZqrIQ66OEnH4PA7hDQSDodaWBEmrlJm1hfky9J7D+gtLvHNrE7ZyWQiQ8Ok3A/EpdldM+HBwomjje50nuWNcIjkV75bWiE9rKCu4yEh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y664snwcNOdRJMs9N6HdldGQYkJVBWduxyJc3itTuM=;
 b=gWK+tOJf3NdkzLExdzt2AeU9DohldIUW2V3EXpFnbMt7CErx0vCbDknE8xD6i04OiCJ/04lQloOkL2wOjagqUTo+WRIUP06yJw31zuOUmMoeIHi5MBJjWUyKmC/nOIu+FwsX8j04VT7jWuNNX9RNv5X/pxGT2Lee+0PDZ8+0F2Q+JCPoOifBOpJw79czWE052zJJ2ijYLfhXD7FmUV23SQsYRWghilxcb0VgOW8H0vkcMPw9yXnqOHN7CTf5ExPFIfxFAZ6JlJZ/mwlv6Al95OYZ/3nL92rvv4iDVwk6uDdRa7m1yVncts5hts8zAIN0mGg/JQXSz8pCUPxiwq0GaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:23 +0000
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
Subject: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Tue,  2 Jun 2026 22:53:44 -0700
Message-Id: <20260603055347.66845-19-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1d6816-1c73-42e8-3614-08dec1349021
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	5UXB+nqutnDhQ4KwtgA+oTu3H29GWZ7zrp5bjlGMgBPALKWnxqZpNKN2h0JSQZnkZwR1L4ROE5+QxIi2bgXbX18YZYHHV69mfLfltc/qxc7URL4oj6JE9uEe7h35TYktElRfCOxtplW6oGOSMfTxpefE/AFWQuc9HoIO0Qju25RjNwnqVDbdhXqOLKU5nSOKc+K456mJlT8n4C+MDHk4j1Ki8/eh3FtqJuKPG0CuKcdx0diSLKGq0XlJtP+KeVsaRiQ0IqX2lKCj0Be0tQkd7bKX4KBnub9e9AASzsv1po5ZhbJGa24tN8tKohDgnHGrCMxZNKWDgvvWvLjDstDkj3uzHiOOT7xBMEhPtDuVj8vsbRraHcFMG0zv6ztbFB4PFjeUK3BPW/G48LfWoMgtl38aEfynlhm25rtTaomqAoUrYHlXpMt0ZRXh/Bcn8D2Y2q94YbhDkQsLyAE2J6Tv3ipapeZbxhCvGQuxbOojh8Jh1IC9fqJWAS2vh3o3BLh/koqgvhvQr2Wdp1gyF85JaCHdRDPH9WJkJWuhgenKiZe7eHD+QFUUVswD1k5OVbHjvaQhdTMZTimEGsZAC+fVhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ap/JlCS05+9kJ5aO6Do9HAT9VC4LerG6l7zYKbhGb58gLzNObDih1RJbgiS?=
 =?us-ascii?Q?i9VgVA2b0RFLYC61RATxeVWA9Zd7RBBl2LTOCr4ln4JXdDVvHZF0kcF/x1WL?=
 =?us-ascii?Q?3bHU6l2WcWffs7jvjmpCpBhFE9P2N7Gc3gL6boUiXXHWenghRXt3ygkkWi3Y?=
 =?us-ascii?Q?BTp16Agytosf8Q5F0Mbqfazeq7KY3ZALN21Vj46TgqK6mUpIdZjeS2YHH8LW?=
 =?us-ascii?Q?pUKXAN6FOcgkId9yzp5VdYPtqJRWSpoRgnuwZQ3ey5+OPkldW1uDpWOF8KXB?=
 =?us-ascii?Q?4zRg0wndEiLoR/UqCh5BmTfLYPQYRi8UYsIYW9UVj/4hoA6TcBju6LrFn/Na?=
 =?us-ascii?Q?KOaQqykGqaT9R02zYPInUlYUvnq3e6R8CxAMkYM+yMPglDaOKwTNWZISmHT+?=
 =?us-ascii?Q?K2cGr2kk56z8v/jwc3JclVCBG6tEvOSOpGA0tp49QCfeMC0LTKkywYnKHDb/?=
 =?us-ascii?Q?5GB24QYf28cX/QJ/WIY8I4j87E3PjNuX7dO52FlZ8oqbGfuaED+k2U7QDits?=
 =?us-ascii?Q?UDAMQG7Ljm/xTxmo6Ul6aecqV4FJ30YT576ooTNnH2CWfDdK32PmmELuOoAW?=
 =?us-ascii?Q?1Oy1Giey0SC5zBWfnT+rEqgeQyQKYUKXEPh9oy8VRBQRBdBZKJb4dvIya1NZ?=
 =?us-ascii?Q?Tuvq///Qf2qaQWnmtHYFpdOiSjIM9QCoJN6PzGGIWOHllGaRWQzYVLtATHME?=
 =?us-ascii?Q?pmIKPH1Pe6hXJp/eLI4p4ChK6LF6Jvccue7MM8rOtc6gLX5x8sIzDv+Tmcnj?=
 =?us-ascii?Q?636brIeGZxOkBLf8gk6HrOSuj05sg76sXwIlMhy9mnWdWhbh59ecs36VrCRF?=
 =?us-ascii?Q?5oGFEUBSdvbI70ewRORgfvXUTqE5g05tu1JfJFljKidj6utuPT471dxAc6tQ?=
 =?us-ascii?Q?dbxYP4Erud8yeT0ute+OwngkVdx7jx2HU3RxH0rIOEAiqMUmPTAcEIHld/cv?=
 =?us-ascii?Q?knFXOJa0i1wgZesKNf6V8FAR+T6RuAvxN/iUpjvwo1K0xd7z8TtoI/YZ3oUh?=
 =?us-ascii?Q?xdN7qlwwXUV3+1CDmwBKiif/QVUn8unCfM+GRhx1jH1Wo0hTAAxyvBp6RLlF?=
 =?us-ascii?Q?XG2Zbad3FKk1O6b5HxcLT8jja00tCB/7BgifcbWEmQ3F3Df8ZKY3cyqmdPYa?=
 =?us-ascii?Q?WE+DVYwA1tdkXV93fPX/wnUGX1xkcvuUggct1yU3g2YrykGnS/oqQN8lqufZ?=
 =?us-ascii?Q?snFOfHzFcK75S+EjGsu7FMIG7Bmw6MCFiZUCqXXlIQkzdq7ytli7RwedR+WL?=
 =?us-ascii?Q?mU6ud4mbUcMi4HYXTVbx/A5bIJrXTPLLYRxFmLDTs2Ai1Nh3//RwU9IJrUtR?=
 =?us-ascii?Q?qs5x87vdYHhj690aNLZCL8OKaPDHQ3q4sl2fNlwjfxm3MF2Bva5QbRLGNA3I?=
 =?us-ascii?Q?IUX+THoAnoMHw0QCHuFXP308DmsgsZE2ZRg7kwlDzDOpWVzdIuq76ipl8GJQ?=
 =?us-ascii?Q?pk8935PbGPGmYf6Jmqe+C6x8HP7DK9y8FISzwyLfebro+TNHz1A1SOV/sRs8?=
 =?us-ascii?Q?Iue95gnPnHrOfheHZBbfxcQQcG5vmAlWM/tdlaakAK35N6GHYN4WS4togNId?=
 =?us-ascii?Q?d5NYvFUWwYIPVZ0cBn6VnJqtzqeHrIdSs+EKw9belcQONsS1kzdhyunylXo9?=
 =?us-ascii?Q?WyOlWJ5JjZy3JRyQDBlPL8iLkzo4xb1iJZCkOaQH9p4HHW7FY/B9pHSFD8RF?=
 =?us-ascii?Q?G8m+M+cN3ktMoHahA78e2JYNgk3XtT4Ck1lB4a0dPkTBPT2kUUlPR9LJkR1Z?=
 =?us-ascii?Q?9Ds+UPsdNDW0SWNTsEVvIb5QzNlsne3a7bznkBt+HtONapKm1Dvn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1d6816-1c73-42e8-3614-08dec1349021
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:23.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NUhsU16roayPxStoIcwcemPHMc21Fgrn9zj7ByyyhDsXU/h6bBW9Z8F2ywzS7Bh2YqM+fs3szJvftcBicF/3qBQi14NJvYxRV2o7Ax+TONgbqyXqWtL0aA2AdceE2ZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37876-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C0E1634AE8

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 97 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index edc3b6d9c8d7..bf5915e0a5f2 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2POK
+	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 Power OK pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 33213bd1919f..213002da9cdd 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
new file mode 100644
index 000000000000..abeeee2e7a00
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2pok_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 10, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 10, .pin_cnt = 8, .name = "pwm_channel", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per2pok_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 18,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_per2pok_pinctrl_regs = {
+	.func_sel		= { .reg = 0x58, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x4c,
+	.output_en		= 0x50,
+	.gpio_status		= 0x54,
+	.irq_en			= 0x60,
+	.irq_status		= 0x64,
+	.irq_clr		= 0x68,
+	.irq_trigger		= 0x6c,
+	.irq_level		= 0x70,
+	.irq_both_edge		= 0x74,
+	.irq_edge		= 0x78,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2pok[] = {
+	{ .func = "can",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D48) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "passthru",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D36) },
+	{ .func = "passthru",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "pwm",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2pok_pinctrl_info = {
+	.name			= "jhb100-per2pok",
+	.pl_desc		= jhb100_per2pok_pl_desc,
+	.crl_desc		= jhb100_per2pok_pinctrl_rl_desc,
+	.regs			= &jhb100_per2pok_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2pok,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2pok),
+};
+
+static const struct of_device_id jhb100_per2pok_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2pok-pinctrl",
+		.data = &jhb100_per2pok_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2pok_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2pok_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2pok-pinctrl",
+		.of_match_table = jhb100_per2pok_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2pok_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


