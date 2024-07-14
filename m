Return-Path: <linux-gpio+bounces-8203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF19309B4
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2024 13:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F339C1C20A0E
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2024 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960D861FC7;
	Sun, 14 Jul 2024 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="S0q1IsCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2022.outbound.protection.outlook.com [40.92.45.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74DB656;
	Sun, 14 Jul 2024 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.45.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720956552; cv=fail; b=J79jDYVXvZaJ7sHQj4K16VyiEh3APtyHah0ljbC9caxnogzPAq5vUlLe1S41jR0E0I7BQGSrEhlOSM7xgdIXO4Qn1OTtXHHZwQ4onpKjJhtZ8Vy69hfP3DLYOXwfNSPZfFbxXunbbNa230Pa4kRIOnJ7NB03Ocu9xiDJvnoFNjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720956552; c=relaxed/simple;
	bh=gIFACtOGHsk/36PU1mMB1AmP0hP6NAyfDFinlxLJgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r0dRA4P8pvDKkRdVPDDHKlDOHKJU07geUU02cWWWA4MfK22nOquUMLNtWGWneUnvzpsNppy7h8N7PpBUaTByfjd812xmMnEj/uMMkkk9CR75Ss1haEFKryO1OfUY3SiE8xtFdXoEHrY/KNc78BsfEVTBi5Anj8xNi2qhfpXXOmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=S0q1IsCp; arc=fail smtp.client-ip=40.92.45.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBlU24wq81jTCoB8UqJeb+40pjLGJEH9tAA2hEFtRL/taW8J+WIQACnMdEQg2XaUM1JT98W5Za1ISSY+8A7KJI05JcqFtu/IzzxSh0LIdTKW1xJlC+zCLpXJQeu4MQNgF2GKMCNMuWiHp0K2RzmFqTUMRusAWqcJUXloPuFWJtBbXuyGkrm/8YErtmVHzE8ESV5b7Wzgp1Ht4PGV3T5mx/Fkww2//shGphfKwU8Xva+0oMwLnSZhyRPuOdfStDLKvl2zIX+OE7pSaAE6wIv4HDtV0Le1mxGIm7SF7LSxD58uqax54en9vER0zBUYio9PXFGk/qSTUt+VXgKZI9Th3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdhNrVqEaHJetVK0SiWlh0NfYHCEWRIseJ2VSnaCKRs=;
 b=HV9Bj6qfxa4y2CRX6RMwAvYAdsDyreepLeIg3qiMHVymIpKoNqONK6bymKMbXHnw4lkDlH7RKiSkzvRBZdZ8vLOj5hn62siGNW+LqRNXxoXBoYLLpRPr1kc3p7QqrCdDQKsywqUfZ7pM4cfm2QnwIVH8fM5Hw7tGoSYwGcDld+SMXFq53IkvUVeGI+fXjSwqVuTgz5dRbr3qicdFbbzGM3gGsgpQscWD1FMyNFqbXFJZMOYL//XgmboA/mA+zN29O7pCf5u3G++oaQkAd111xRBqCDqImEt8LE8fyRxOfIrCCgQc1wDc9QT7U1L9qGqIf6GVESGoTVXU7EF5bAvhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdhNrVqEaHJetVK0SiWlh0NfYHCEWRIseJ2VSnaCKRs=;
 b=S0q1IsCpem4qQGSvvHGUIK8bHF90YRTHuUOTggL5/bnOIwXOuOw1BJ/MMxubp5sBQGxMca8TLef4Atn8fqXo6UEtxc8foBoIy6NQcCQbZ8zWCQySAqYPUPi1SRUW34Sg+GsXaMbfRgGBguOiq+/RC5xu0ZM53CLfZgtU2nY6BQtV6LA4XwmlKys+wflWxiFp2f7v3cVdXNimiNvUcCYLUj90hn7FGFmd7rFbUT/SvMmfekyqFqfos/5p6USwWLumwnpxsCbzxvEfHOrZGLKCe2KlIQ59Gme2P0OTqH3OisuNCJYPxgBmYiGtjb9OXu4MotWAi5f7JZqn1agEVmr5vA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Sun, 14 Jul
 2024 11:29:06 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7762.020; Sun, 14 Jul 2024
 11:29:06 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
Date: Sun, 14 Jul 2024 19:28:59 +0800
Message-ID:
 <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [oIDo4PgNPI6H/iEiaT6uFH/QQomxvi1guX75lgJnhIg=]
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240714112900.1288126-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: d229290a-3781-45d3-0c1a-08dca3f82bbb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	bQx0zbnu/d6zUUGuPDV8jD3sTS8hqPSslU3l5Z/AqafdDL2WmG9UF9ByNDmMkgQtTwDxHAixO39GGT12DN7l+MajGK2YmSgOxbbCOSM+3RpgnHEcH/QnivjgZw1VSiM+TgusUXos65fm664tB9VX6BsUoTA72vi3VwTvuA12XF4gAPxl1gnTteDK3Llp/SD6eqh2hUgHIl9eIqhsDmEPNFuRv8CA/RZ+nDtJXGz8TcjuMD4B/805N5Wo++qSOPN3iJ1KAcYtemPMOI9dfhvH3moTCfDx+EgVDNV/RB9lr5jV2IZhUzHH/UH383IWJsu70qA4oXh9YIUjoL04rpRyBn3BRqVcksZMl1FL9aU2FnQ2NmJ3et3Ak0OR8JSpwNmtQORQNZfqg965TBkZPa8+J/oBDSF2CWaeqOxcf5TrePktJgdkY/PRfkJceDCN62ZkdTUoEutMyDD67yxJTvjqPV1H45gf/W4PCPLYDuiDPPFm9ucq6fe51xY5yHOfGg+dT2EUvNzq8K2UYE4NsJYdXaeaYv+GGqfvD+fjZHLyyb9RGfpytsSZthu/clfqZUlebsuA0WL24aH+3FC1c9SefN/2MOapYMufq45moXxxZjWj7GbZMX3tQzxmc/KdRJ7PP+AaaAsXy0eFXFfvV+tSBSisomD8Gr65py5IUXNs7ZUvov7CH/BDMTrJ+kN/QtNO
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IuOHvdW0bMQxbJVveEhjsPqOebAGD4qoCouuj3Uh9IMNetQ2KBLJbCGLm73j?=
 =?us-ascii?Q?3OZrCPvXADnQNlKGBpQ0Eb3GZ3q+//ovZj/fPVDB24oZslaxKfJ7YVj6L4LU?=
 =?us-ascii?Q?vVypluz2wRBtsahcMmTMDMWjL46bU9z/8eRZK73U7d9aVcbR8ik2K6kiqjUA?=
 =?us-ascii?Q?fet4QizJKBB0RMFYuKajHfSdsYBs8AIXSqlOJeEvCnDd+ZulO4EBYjxafCnj?=
 =?us-ascii?Q?VbdOCYCn/5/8v34Vz+EXMeW35or87UXJG2DN77iOkeBa1qPnQxUEuAWh0LPd?=
 =?us-ascii?Q?Aei2p8k47TjeVVxz9Cbtsd117KdVpSRqAaZRNb+Z6PJE4hjyfoZV9VwAiEgr?=
 =?us-ascii?Q?Ph05UL7Uesf9ElAF63u9rrh780xYVvMn3i5sfrR0oUGac/a410OhMcE3MdX8?=
 =?us-ascii?Q?vdkL1C9+Xc56FxKt69TCcaQ2IC9lwyW4dMcFFUd5p1IrRpTNLSQSiAntOiqJ?=
 =?us-ascii?Q?hhtgdo9ygk1PUO1joCm6c57Modb0cGLBC4v/4q6/G2UuwdRQtGH5ZsKN+B4q?=
 =?us-ascii?Q?tIDlDvmmf/LPnn8i+lUlRZclG33F+aayNndzKRO91ydcAamDRGZyEgsnwro4?=
 =?us-ascii?Q?+BsV8LNHP16U94exfp3dYh3u7SkCQBLy+SvK47KIaCN+Dqmo42PUhln1SYGw?=
 =?us-ascii?Q?HSmJyOhFT98+MZqA1wJ7ucyA20veP9q+wNSR1AOBJPf8v1o8HtcmPnPtCUN3?=
 =?us-ascii?Q?BzFCpxfpLqxwZGSYXq5MnimDIqx9T0r38AN7QLw0YPA1WyaLxLhmMEhDKmQD?=
 =?us-ascii?Q?yltk4dvXlqxzal94ig7nxWJ4XH67g6x01BpLhYpWG8PdP4pwVjueBfhrY4Ja?=
 =?us-ascii?Q?v5XbcUOG7o+jv55aPt1etGtviN1sJ1Lcc1q6oqeWwMa4hzLU5+u2jkFyPLew?=
 =?us-ascii?Q?2CZbTpdTzaJN3pxOA680amOQhM96hZCRl7JbX6VUMPqQgA6VbtaNTbuyj2pI?=
 =?us-ascii?Q?IkF/EmoNRbL+t9t9aylMRrU2ZvdUYBdHWQ50Vdq2dUCl2/UB53ujK/mwqSLb?=
 =?us-ascii?Q?PD+xtxYIDbBsdSJwnegzT21PjlgQ2cf5bEMalfcGY6gY64U29cgGut/XRJH2?=
 =?us-ascii?Q?+JvGsKCGWdTeXkN+Cdv0RQTIP/z5cubfxZoguej2swYWjmoBC4Q8vUeKtvhi?=
 =?us-ascii?Q?t66miLNNTgQETPQOi+s8t5l4ylWps5spOjVNMOqHhBYXLZ6Sv8PH0Tbsj5cN?=
 =?us-ascii?Q?KWe9cpzi2S8Tb0v7zY+yt+Kew/XXUJJVNJXln9OuR0Ee7syWw9Y3DNy8IjDi?=
 =?us-ascii?Q?68kSUbcZBtlzgT01rI64?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d229290a-3781-45d3-0c1a-08dca3f82bbb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 11:29:06.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

On Sophgo CV18XX platform, threshold strength of schmitt trigger can
be configured. As this standard property is already supported by the
common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
so that other platforms requiring such feature can make use of this
property.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index d0af21a564b4..e838fcac7f2a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -88,6 +88,10 @@ properties:
     description: disable input on pin (no effect on output, such as
       disabling an input buffer)

+  input-schmitt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: threshold strength for schmitt-trigger
+
   input-schmitt-enable:
     type: boolean
     description: enable schmitt-trigger mode
--
2.45.2


