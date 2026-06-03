Return-Path: <linux-gpio+bounces-37874-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSaMIrTGH2ohpwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37874-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:16:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB26634961
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:16:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37874-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37874-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641853027B51
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 06:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B863F4DDF;
	Wed,  3 Jun 2026 06:09:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8293E51F4;
	Wed,  3 Jun 2026 06:09:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466968; cv=fail; b=mgbOU2Q8uoIvSiVfHAQema71J6bs4tKMF+X9W+D8w348yC6a0lKRZGjHWP5I3Vrfz3gcd5xeoc1KwdCMw0UkRBSDA6RH+Ppn7JVQ6lqeW3j17fvZ8izSnHJIbpK8JFF8JwVtUFMCqvD6rFcl2BOg/iKnmqiGMrv0EJWREv/kynE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466968; c=relaxed/simple;
	bh=Svw8WZuirqshkSbeedLHyDrrXkrNMLNs2Ot3Db5LANk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSmEmDv2/dTgbIdH1PhEJme+GTBblCBldT3QaS0mcGfYUtwVYjFiT+/l2fvFDDCJo9XgZplXbpxI5z+EHhIXzwBszaxv4gbEBaW1mkqzKjMdBW6VRGwgkNcYvtCVTsQvn4GjdPcp8h73stRuUHzwgschbtzePTy0JgSZTmkYkHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.123
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYAnHpXwjiRYlzw7iweAnoJQXtYGYlmAXoa2Eue5/ZV7wWyyZG1hMYWvzc60s4KWKEr+CQxUBbLR3iXNywEvz5CEUVNvRPoi/8MhEuPI0vE0f4IbGZtE+5hypVxCyb/rjNCwNBwtQHouisQZv3+vwjIn+x601vHN9nb3ccg8WZ4RM+uhFAnQX4h1wbgk116hh+cf7qrrHGOfuQ4CNYbe0ivHAxwZQihj3XEcCt06eduSc15WQOVgh/dN+cFBt5xIfq5rdXmECKrQ2VBsOjCAOxZ68jqVGCInURDYRlBPTaA1XOZwcL2cg+sZXo/WunZAZfs0ZBs9e4lsfzlj9Cxwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR12FA8mBkbeXarDA05DPP6Sj/wRGvQF43wUD/Wb60E=;
 b=AOO1HVbop9rqoAxXySa7uOE8JalvQufdTXmdhEUyP3XuiUWdqFAfSyntKzWV/H4t4eEsVxwtPeWeHPAOUxH+QPlsA/MR5L7NfMqrFQFuhF988uZc8U+EBSpiBQAdVzOvSymnQt0SE3TgpstslbXMBj6xmdVMF+SKLPyP8e8APQcMO4ehQfgFZdWAijsy5Z1fl7aM7CqMqAyshW0mw8WjNRwTsVIodlPqs9p3pIufp4gJ86RYP+DAtJhLk6B0HIKRGV4XBScdD8+3HHxZ0YewUUfAHBTdY/83DopiUJbqX+0umD/wAJ/dsrSnK1ZPIg8u8EAYmxjb1URxFpKmgbQAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:06 +0000
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
Subject: [PATCH v3 05/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Tue,  2 Jun 2026 22:53:31 -0700
Message-Id: <20260603055347.66845-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d32c3b80-8786-460f-e271-08dec1348642
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	eaFD5XWuI9aBsKHnI29oMcVva98kMWYY769CEEVXHEVyNqc7abFMWjCcEXGWvN2itTl8zPk5pet4+3EVRXJ/VMb/WozvOlDFXzG377uAcsilq4/O/qR70NfMzJf8WYu5thi5aBnyEdN6EVSAhaobTFQLpgouMy07kIOPTjyN6qTABDzfeEZQV3SwBtjoRaQh12OF9Jec1v7FmHzN/ot+NEdjn6rD9G2IMHudHXsf6uSG18T+dZSZZRbKpYL3D/ZV6Ks1F1OHdijkarIHOaPomZn2KbXsYBlxOvswH0IyRhEnc0mGwE8z9C0e/5uW8RA6jPNEpQdAo2keeyPHOPquQ5/rYHS1NkBQYHznR5lfmHDqcfeJE79lQOAmlsHrWEwPUeemJzjJ+YX4C3UcVYKF7l0PZD1CH91P6qKK9L4wyAFhir3Xl6ZMeJuJU2vshEK+c552vibbWYBfII61j0sNb1whIjdDM9mr133bNf8fPDSD0w2FHpWwFlwhHtCKXo9IHp3lqo5WbNg4a39tQRK7sLi4/hv1I092/eqIaK+/X9k465I7lTjoPEO74TJpHyvXD34InPAtFXaix9eGGUHLxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V06n/gFpCO2uNaJ48FS6dqNw9T7dqkj2B1JrcvAskA852H1uA0mdqxzRFwzp?=
 =?us-ascii?Q?tvX5fZ+0RhrGlTh05iyQwZ8dSiAIVZFGJ+IIaOu0+NGXlWSJPDCb2zLj9xCl?=
 =?us-ascii?Q?6HDdh8G4eT2Ap3vj7dP+oPihAuUSGoXomnQMXAGpkmcpK5fsIk/CQnarAmJD?=
 =?us-ascii?Q?cJFur6EaOxgieA/zuGL738tS2WGbZvjD5/C06ll1aEP6SyzJmVqxGOL8iflV?=
 =?us-ascii?Q?QaFIem7ObzyIN4+iVbMX/Ou2mQtUCobtNCaMX+oR0GaP/RS9G4VDR2ZbfeTN?=
 =?us-ascii?Q?CKo9VoPgIXVPZjSM9V2AtAKFb0KZ9bnf6jSCdngvjtqHnDVlEi3m6FpaRd46?=
 =?us-ascii?Q?OoR5NmAE5JWd8x95c0KABMslf4BELtnp8jQWp6Kn0DFl4X+ytNHlc3T4ksEF?=
 =?us-ascii?Q?VuGj6ilPjFnv3knEjeRXLCY9T8Z6UqAnyrg9z1PgYtSz5f+M8lbTvt2oCHbl?=
 =?us-ascii?Q?3WQ10vnjUqQA3NZOnoDoQtTbazatggM2OtXHZ6bNyEkQMUMq00SBK0ACQiyP?=
 =?us-ascii?Q?Gc/4vhGGfIcPr4uubCLW2+4MOjeoOg2sJEXsqc1UFzPaq2cr1WouTKWCEoiw?=
 =?us-ascii?Q?G9mi93RX/w/GnD117zCKD4pmiTCzqylK1SZhVJ+k5sFiNliA+geCaD+UwDiA?=
 =?us-ascii?Q?eA4DItPlXPVIPI/cG3t+sRV2CPMls0Y/KO4taXYCxQoccuy3jjRYz/j/4JDd?=
 =?us-ascii?Q?UarqgfYTQKxasiEyIVmsi1ULLmhDin45KLiEK5+3sDiTHclzPop1Xwwop9LC?=
 =?us-ascii?Q?1PqvI1khEphXRsdxs+DpjUBd1Z+FSsTmL123x7/z5VnxcW8XUGbcjAlzu/aC?=
 =?us-ascii?Q?EIekolPlp5mEDe+TtnPaoCMxDAdGSAwmPizJaXG01fF50fYkWqzmvjs4RVpz?=
 =?us-ascii?Q?0TcEvajo95L0z/eUx3a3W6pcbWNn0aAjtaYFztGN7BYH7483dxj5BYuNUFJ+?=
 =?us-ascii?Q?M/yX/rd830uU4NDG6b53bHKIU4mHU0bmorMiliF/VEvEN2qy2b3Cfh4ArX9P?=
 =?us-ascii?Q?pO3qbrUly+fCEhTIoIdzB8zPsvxjyFqLXSKBeLlCNdTJuM23bodI7vlaB7wo?=
 =?us-ascii?Q?LdufRfvtjG5M+Be0qeNEAiZ05YOiox95NpxMyJxquIm4PvNGJB8B29ao4ebR?=
 =?us-ascii?Q?Xwa2FqGhyHClgMArlDcvBIOS/KHfdjAijSbdxaMflJnFFkH66Bfm73WypTrA?=
 =?us-ascii?Q?cae98WoT8LuNwi+76vZX7SD9A+fLRuEi462VsiOTpvd7KosMw5yK63VZ+7G/?=
 =?us-ascii?Q?ycZwk3w4VBVMreeT/QWaoX9B1FlSeMPmMJlMf8eqdtGtV/Qgpp0Jfl2HVkPr?=
 =?us-ascii?Q?SsiB01fvjf+6LcPaGIOnOQvaKAkl0knllScVmORq/Rq7Xro8wQUC1ESu9F4w?=
 =?us-ascii?Q?WA09rqoj9izEuWgxJZdVDA6l3peKpVlxnn9iJIgMhAdcd8c54AtVZ2NNfW2X?=
 =?us-ascii?Q?Uxw/iLfzVgJgz/vf2PhDKQCvA4hlBg7yx3vDXTJNRIGTLpVSz9ZCWuMWsS8q?=
 =?us-ascii?Q?JOYYYGS4rEqGJE6EblowQe7N23IT2rqxYEKcMWf5OUfNuljcgyn4uVFn3Cfu?=
 =?us-ascii?Q?IYi2x7F/ryN2gj/x4i58U6XlIgwy8AsU57ns2L0IpBuOWbDzBxMcXnW3dnu/?=
 =?us-ascii?Q?XiEk47/MHXEFWSjb8OKxQpUUnMHR9XP72wZ9gaDBNTDlcSaWvGnX59QG2VP7?=
 =?us-ascii?Q?Q/ktfAlraACqTedRjzYGkvs7y0L2a/0GrWZ9oU1087wHyfzrLvEogtpB1TuS?=
 =?us-ascii?Q?wCUqKDPsdv+Go+BlcwiLPBwCML6L1Ue+D9SR00kP1jZ/4c5+5hYw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32c3b80-8786-460f-e271-08dec1348642
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:06.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIiIDXzZMDwxQcxqxolVnV2Oxk3TNpme57OeRWwO6lbO1HcCLDeyAgTMN64GR5Ykucc8/kC2spdpAxVApRuSFQX6a83Hi00rKSn3bhsqdqeH/VO5KBpI9EH3V68OkW7h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37874-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCB26634961

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 160 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..7e704401dbeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Functions 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys0h-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds and
+          drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ espi, espi_reset, espi0_vw, espi1_vw, gpio, scap_trigger ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 4294967295
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6d8f5516a178..38d5a94e92e3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -14,4 +14,18 @@
 #define PADNUM_SYS0_GPIO_A2				2
 #define PADNUM_SYS0_GPIO_A3				3
 
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
 #endif
-- 
2.25.1


