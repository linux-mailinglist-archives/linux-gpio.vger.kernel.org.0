Return-Path: <linux-gpio+bounces-37857-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 78H3Gq7FH2r1pgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37857-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C253E63490F
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37857-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37857-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E955D3110637
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A563E5587;
	Wed,  3 Jun 2026 05:54:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662D3EDE67;
	Wed,  3 Jun 2026 05:54:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466057; cv=fail; b=icIMGnV4QFo46Uz3PyPfRdtvfoC+NapwhC9D2uzR2c+p5Ub9xC0Va5huGI8SqsMkqyidSxcqerYjybnZ74TaQ0rzZ5SBfcakTNzrFB+oQGRmut31T4jNt5PCOkMLS9sg76AYaqSUhhHdu8oa6tm+tiKqeO1Tmb89GX8/Hsxo5Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466057; c=relaxed/simple;
	bh=teSwUQT7T4UGvcYR8dedO5tCdG2oJNvdmzbpvZLC0Lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WD1SaBXo4oeZC1mTmepJXiW5rRZlM3dE75bSuhVe1CJ79485TUqCooa6TCSwkr8a9bUuC6LPYw9IltVNQ411hJE8p1eZ4WJZaMf4SBu4K5L9KrXvpINGcZyf0wJDKb588rNmtT/g9hSwWI/lR1usrSvK8uYzcEYQZBwKxg8pZdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLgwMHYqTtC77mJgQttHJeTAvjEk5M5u3GbW6GBbC4hwaWgjZ0NjJybdPdPlKYL2nzZfa/z1HGrMmsKXro/JJr4uWl58Y1e6sseXmnuJMRzizD5M0LqwAb8Seo305N0ZBnVvLdKqyOQ+jztBeK8ymeMtQwXGs1E4LgoyTAqDoKDCWmhIBAsPb4QDiX98B3MUk+z/n81prTDRXxe7lTI8XYC+5DkW447G/Fhw397XQ4jiSvZoP+fBtk+ZTVvSn5opGxIMy5z+iTHRNznSqmSCBzOUjxZhSGowk8DW1gywoMUDiiN7vvdNSUlr1f+KQaKBIznykV6OncurbKro0WQjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwkTC5X2ZeVunywQtJdFR39QzwXUzVldTr1z4Q7gF5w=;
 b=UJad/MiDk+oHGRz6V7zHXSxRFyYYj86mysHXFBZXDo3rw8VS7gxs7l2xqeDvDWhPFtRzc2PLaRPEOsvSgpmyrOOUgK/92JKiGTyyGgcfIkMMHhgxZYYjQzzfFJl37wil7HJm6Yh7bA+K6HRqX7qEzVblF2YJw1G5cuu9QsrRHZnJl6sePyVfO8nHRSPWW9TZSqHH35bHMFq0J6vpUnzUuVYyKuF1LD45bVvmoDr6VJEpIgEy+tnj3RKqJ2dLaRF7lzrjVwInrR3Yt/LVwVuJXKkyXQXBDUte7rbsfSv5RXGZj+KYEKRZ+4+CVUcL8Dne0H/m9GBu4ZNTFISghvSdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:01 +0000
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
Subject: [PATCH v3 01/21] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
Date: Tue,  2 Jun 2026 22:53:27 -0700
Message-Id: <20260603055347.66845-2-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 81431e5c-7d36-40c9-1ace-08dec1348304
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|56012099006|18002099003|22082099003|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	AvB4wW3Okx6lDJoQTCl0RrMi00VOpHwgo4uu9p4kzHBSbwn4NdqNfcuntzI0jKfki6Wv9RrwPG21bbpi0oOcI0DpZ06bx3dnERQd5wMU0qz/nOIVzqbm420r4iIGQrVzbgdBg7sggF3TT6NQZXhmTesp0+Nt2Htkq47//Jx0e2SvXhfsVrRZi8M5iVTfhXrXYvVhh8J3PNnAXnCcxHlbSJzarnCy9EAfNtLTYCb33WlpfkOVus2wl2L2ZtdrK2vVnz6IOSNbsXQkw5hhnXezZ3yRoVXBlWN5UQzyTaeJu1brPI5ZqmTfE9ZW2xj8CKtZEDRmPLlrMyXltMURBUkd9T/a2SxvGdttkcWv0oTEXLFasGY6sVGv35casJyZuGyLSA/wpo/HBW7HKsSl+vRB1Fiu+946f+PztNFyESidonppwyhxrEs27DdU2gQ98sBYAkk9eib8SrsjyFfSa7m7zmE9DlLEq0Uvc95KH3AH27PXVrQZriq2AGI/USYAhpyxgKouxTjRAFteVnzIN0w6xsv2K0BJ4ID5eofko6kFwzRTRDGCBG2fS9Q6TX50+IJ+7osbyq0QGf653X46fs08Mg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(56012099006)(18002099003)(22082099003)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wH6DOY4QLOowKsyb3PAOuF06WqJVQSzMV4/CekwI8wCbTN7otUdI+csupNYN?=
 =?us-ascii?Q?GSSHEMJ3jZOfNPEj+bLNx39bRDIvCW0sPzLwhe9fh56Gm0Bqr0nLPRBrswd8?=
 =?us-ascii?Q?r3PdwPe8M5Z/UgajTS/LjmynkbsHFa2SthGUAq6Na/dF/H1DbxC4fvMYQyUa?=
 =?us-ascii?Q?x22AbKs+VSQrspX6oRordA+qOjagj35i8PKFRecA/iK60SUXNILKlcIgYj2Q?=
 =?us-ascii?Q?aDRrGX3wldmof1X8T09BlwKxgqbPWNzlu7h/NhNqVi1WS6WujsdZRPF5YOWE?=
 =?us-ascii?Q?1K369O1d7caBhCrJqmRm5mqgBIwg4btgO7TgMYF63eNey89ju59mS0LtIJSG?=
 =?us-ascii?Q?PnJkRJ2hPIUE6RRi4esbXxn//ofhJiP/b9en5grIv0SSorEFVTes2gh6P50g?=
 =?us-ascii?Q?o+hGUr0bK+QoXqx008AxD9uGD1hj8JFxNNKKaiaSKePtgucCD+ptXyh+TawL?=
 =?us-ascii?Q?snGzAap0ZW79k7vWaIxOm2JK6cjP0BFz/c4/4IwUwzKCdVC2+CcaPH1OddGm?=
 =?us-ascii?Q?OWe5bTu1UPP0GQk3xX35TaGML1Ep5Qu5JM2PCi3+XekzMCUyuIEtqUZU7v+1?=
 =?us-ascii?Q?Jxlmj4d99UcsL0emIslDwHZDGGcOFkQ4trUTYn/BAUm4eBLiVFzIcC8IqSjJ?=
 =?us-ascii?Q?3kg2K5+v+C4n8ss6Wb+SmEZPk6Z58O/pY9o04fP2D4jTIi7ClWj6pNSdgbRY?=
 =?us-ascii?Q?v7GtYZLiMTCGYI4kKOH+CHOUNOyQipPbyyYP182mPp/u9n7QdIA0nYhlbiXZ?=
 =?us-ascii?Q?FB7pkdjCRxLTNfcKBpPzLjek27hWfh0oSyiQ5WRBym0I8g1SkWjFYFpVZdrB?=
 =?us-ascii?Q?HNT75TojSQ585lAC0l/4zFnfU7Uo+0Gfru6bjwcwCrQTQGJN4X2dOy8n308X?=
 =?us-ascii?Q?asVS6HVuGo4DA6EIkZTl0rCR0rNAs+YrTqvCcyiNuYiFLUL40kvyIRshiTaY?=
 =?us-ascii?Q?3SaARZw0MKtfTpxSY6j5llYuY3SlRXMZbCddIyv0L7Si1roXhV4qpdAYLANE?=
 =?us-ascii?Q?Y+UNj7koUD82CRqkkkEPMb1cFdCyOKV/71c+kLdmIfirmPa38HVjT1yLo7s5?=
 =?us-ascii?Q?upqxwZPMuxM5yE5hfoAX+ZuofyKeNm2IIy44JtkgJPWEKWp1L1QLNQzKdtJA?=
 =?us-ascii?Q?KDQl3BOp433M8VGY+YIffGWT2OMDblsOkJTNtBWNXlnTNNijFu64M/j7Yz2e?=
 =?us-ascii?Q?sSKw2b3bZY7jlHs3ToS9W7Z4Mr1nKI8PB2eMf8KOEYOPBCnvnmyebJcvHIyg?=
 =?us-ascii?Q?CuT8dpF5Va4m8tw0Rmm5S4x1NQd9r5axIvK37+5pI1orwaBLY3WS8frVLasM?=
 =?us-ascii?Q?LVh6/5zZO4Pj515R04roQJF2Rqt5Wkgyt75Yqp+1PctTSFpT5pJX1XW/vKeC?=
 =?us-ascii?Q?tFZkVUZIImsNhNNJe95Dr4NmoW09Evq39JO+gWQIfI6PILAVrajdMlx9aq58?=
 =?us-ascii?Q?QV8xXlcEsqJ7SrDc8GxuqIbKtG4csRDvJv8/DnHKQ3xmPIv3Y9PQvU7HDGYn?=
 =?us-ascii?Q?YtOFXAQFJMW/nBJImeH1IaCb0dKJDAqVECFJ9IrOkt00KsroZfZAEK3jJBdY?=
 =?us-ascii?Q?ry8MF/n13m2V/3A8aVmZC3fO84rkX6qcFhcyGtH/Um6K+vNe+4xsYNOsplA7?=
 =?us-ascii?Q?+cpI+F9wOCun4RNVicyENfNUOkbtTJ1MxXwcSoK/XrWtZie7gQboiMxwLwli?=
 =?us-ascii?Q?Tb1wNJ9YrhjiWPPNR8F9R4He1Uf2bCTTzv5Y+c2BVrh2EZMUhBPUrL7s0BNP?=
 =?us-ascii?Q?Ulwjh5AGb53uUl6iWeP2FjzKqEwWq4nRgld5vW5+pMKw93g2bnyg?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81431e5c-7d36-40c9-1ace-08dec1348304
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:01.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gURXdB1tO9oSHbrGghOudJPVaUO+NKJZvksaqEcPTVLM7qCZWuXMtVb4FhYKXv+U3Gv8RwsVJ81xxAAlesQOmxRhqDJt7hz5ocu3PJppVhxJoiYnwx5Y0oekcDbvGgwO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
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
	TAGGED_FROM(0.00)[bounces-37857-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C253E63490F

Add the property 'input-debounce-ns' to specify debounce time in
nanoseconds as an alternative to the existing 'input-debounce' which
uses microseconds. Make the new property unavailable when the existing
property 'input-debounce' is selected to prevent conflicting definitions.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 97dbce8a261f..17a6270dce31 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -104,6 +104,10 @@ properties:
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
+  input-debounce-ns:
+    description: Takes the debounce time in nsec as argument or 0 to disable
+      debouncing
+
   power-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: select between different power supplies
@@ -214,6 +218,13 @@ allOf:
         input-schmitt-enable: false
         input-schmitt-microvolt: false
 
+  - if:
+      required:
+        - input-debounce
+    then:
+      properties:
+        input-debounce-ns: false
+
   - if:
       required:
         - drive-strength
-- 
2.25.1


