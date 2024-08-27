Return-Path: <linux-gpio+bounces-9196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB3295FF52
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621DA1C21845
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6314E12B82;
	Tue, 27 Aug 2024 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="R3B+Ozve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901EA1758B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 02:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726919; cv=fail; b=V6NqOT49LJhO1NGr9T0Vj+8K9ghEMK9iAM9zSf99DIZm+dmRJf7OkJpGt/xvyQx3yAA/bap/7URpOEOHEic0pRD7K/vm4Es8EnmNPrDO7aCFCqQzeMKQWNFdvIbQ7OYAVOLjcqz/wtWBUNnhKy1EaD+RI0E7s06rRBZTC/zpFkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726919; c=relaxed/simple;
	bh=xtdk4JF4F24AFvS/ldnPHzI7k08XtThbLs42wpDS6Sg=;
	h=Date:From:To:cc:Subject:Message-ID:Content-Type:MIME-Version; b=WYqbUxj9Rf1RN2lQ2toSP7nF/RMwaAzEEnkXVibESzhDlAmOJT+lGCOGdqX9d3ODpvbVsxuZU7/aYH79P1OxlCz+hKXLPDb7a2wwUGeBDVod7OXd35bZd5qmTRy2BjZPKvG90K0jUhBZimOJhnRSUU4H3tItnAGBa5G4RDAUH7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=R3B+Ozve; arc=fail smtp.client-ip=209.222.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173]) by mx-outbound-ea15-210.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 02:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egAzxOel6FT5YUpRWgSa52Ne5Aunn+HyxN3NUcvKkNAUd0rcvz5JJwmqaZ2q2o5ubGgTruJVWyIAhZ/yaWNte9YNX/kdZSxEXPW7PYLTG/cOn43qXX09n0Rb8yzPcPQjskJ+GZuVx0wXfsWKu0xfleKS6Ad2G6nVEF8ddYQoOWUjLEYquGy64TwcHORf0jj68vjjokyRpnfY7KXFBIKnZiEGpzo7hnvSxjl0r6PZSdDpJJh9/tcHPZLFN/jTg3Muf/A3RiaD3IlUSnej8oOw2efjXv/IDX4a4b+QjT7ZbV1cfEnYg74BymcId0lBa/R39bk8pB3RiDeCSkdbuH/6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqhynpYRRE7X2CET7lJCGsJUE9ItoKxdurxCcIj66m4=;
 b=uiyrXipZeVxY6qWv3ozsUv/evqdvNSsc3lEmFgZ7PsOPMJoMh3qBG6VtVQyDEeLocMh4DM2SIwqOubeLhYcE7AqshyIWFhTVqhJ0bZ98g3W9Dfzqmf6s0TjKuR1DbBli1wmsm55a9gVL1Xy1NNO4OhwQYu4jtQ4Mm3qBB16LH+/rlSUczLs5o1CGMRIVPXVQpUjva/WeJUbYIhcHFxUhWpV+kqHg0vM11ApBXmNxLZ42Lnz/E35PgJxjcyt4hxpeQeHeu4Yhg46KCEpYO6Ln0MGwgM2jxrCzKTSiyN1abRXS1NM/yeZEblQ828QkzStYeMwvXcxaNLUHR3Pn9fQ0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqhynpYRRE7X2CET7lJCGsJUE9ItoKxdurxCcIj66m4=;
 b=R3B+Ozve9Ewqnb1gzbIklBvXhoanjWjRIAh37hraK6i6UfauFQ3rSfhf+2xQ9abuQhEX5T3BOl70tsKD9l9E/PnBFo/YldtblprV7bTQrvIKRSW8//BsWSq2LI4/17uwrNv5qXHXYSme7Uno/CUWuQB1Dl+Y2N+kES1DpJt0jPApmUmr/pFIQE9KGdId11ZItH9Tin6EUP7sCupmvnqA4KU3JbS5ib74kpqpLdy5uaL/PxGfbH7fDER9HNdnPk7NIHYKX3loZMX2NVu0Ovjahbkxo0mazNjxJ6JBuKKXz1z3d6bhQmNrETDAhiEue5PrIHR3W7GMLNwtVRe7o8HDRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DS0PR10MB7432.namprd10.prod.outlook.com (2603:10b6:8:155::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Tue, 27 Aug 2024 02:15:15 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.006; Tue, 27 Aug 2024
 02:15:15 +0000
Date: Tue, 27 Aug 2024 12:15:08 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: linux-arm-kernel@lists.infradead.org
cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
    Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] dt-bindings: pinctrl: Add fsl,ls1046a-pinctrl yaml
 file
Message-ID: <b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com>
Organization: Opengear Digi
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SY5PR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::10) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DS0PR10MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c46372e-ed22-454f-dc30-08dcc63e170a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dXn9oCNJou5j9E1oEoMGwDuwAQpPTEQFbb9HD/Xkbs+SZZ/vzHyco9fGWaVq?=
 =?us-ascii?Q?sCcTSMAiuTjjxmNKp0x+3YIGlsR1WEE2l7he0G7HFKn+Grnk1pGiC9ppO4Pn?=
 =?us-ascii?Q?Bp/afv6PWOSyxzeE7+x6MujyC6BHlkoub20ymtRFHATTyc8sCadE0zBTJ18B?=
 =?us-ascii?Q?3kZjgmvHzWtN6MzokjU2CeScmnHfmhnHu8zppEBv2NxvjBlYV0Z6iVTjc4ai?=
 =?us-ascii?Q?GeMG2vEu7HAyP8zYl2o075wqed+ZDG9fZbUIX67Ler12xByZlELrKqYGzGsj?=
 =?us-ascii?Q?1YpAdEYBaXJF0zlAyB1Z1poI3Ew1SGj+l0LiTMx2vwZC806N5psHIMEkerfP?=
 =?us-ascii?Q?Vjn5hckNCUR1ZZH0zVrpAPyFzfSIIOu78YB6DD4neK6GKSQv/ORoyu3lf6ux?=
 =?us-ascii?Q?BuhLxNuT8VEHFUA8cqDy9qzkq2BO8F8QrUvdotdqtR6o59vXQE4N6YhaRqK8?=
 =?us-ascii?Q?uWpVJguaKcHccw51+loz2Fr7nJorF6zQ1zyYMbAB5FevMWbaLUJI14GBi5Yh?=
 =?us-ascii?Q?t9q3dtWIJ+SJZAUxr5qf9Hb6zgLjUXKmueWRAJS+44clRHU4kXoOq0aFyZGP?=
 =?us-ascii?Q?aguj6d+sKKc8lnhLZkN5ZfFgUdBs6pHJj2Q2k4ircXIJvaPsr0J0QDVhUJuc?=
 =?us-ascii?Q?taT9nG7FFPCiQ5Y7ngn64lrrk5q74NPIJI92LXxeWcocgPqf2lcib/WOYuAR?=
 =?us-ascii?Q?900NJMIqB1hgYaSYQ+/o+sm3aWLQsAaxyfV5eYDC0kKvbQGLOjXu93d28fuM?=
 =?us-ascii?Q?Ai40zigKC8WoQb1098JEHhgkX3ZL6mZIQ1s+oeiypYm2C9mXmwEkXmR6wLuG?=
 =?us-ascii?Q?gI4CNOQ3O4qWX92klqehaBGSqVdJga1KKQjDkHfN9/mk9781AXJibtngacxW?=
 =?us-ascii?Q?eT+OJhlOkfagn/q8dp8ww8B3LcUvtx13K9AiIt9ID9/q5ddyVEGHREdDbhtr?=
 =?us-ascii?Q?9r5HxKRA8l2lZfTg+FI6gItkT2FlCmNY3EwMaTHCc7VZSkMGP1mqoorgeUSy?=
 =?us-ascii?Q?U/MOFytWZS4i1kUtT27pBj2MHcC+EHxtPEnT0FQ4gBnk0fl/opf/scViGO6H?=
 =?us-ascii?Q?I/kHy6s8vte1i/rNRjyP7jILira/bUnvOKDX2zNlW38nugLcQiziYonIl2uH?=
 =?us-ascii?Q?/kkl9r39aKLEX8DclnrxoNaUNOY8yXa7CVibf8L5V5Ym+OissSZLOXbVVjTs?=
 =?us-ascii?Q?i/hyfKAuP6+2x+tcttytq0f+TP4JIvNcahhOGg2dE4xSi1k9dQO7HJctdd+9?=
 =?us-ascii?Q?DrGVrGRR5Y0GeHqPK0tkd74Js5c/bZc/zOgF1IyHu90RFhGP04TXzYJlGQLj?=
 =?us-ascii?Q?Smw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QLQSmktRHl+VXls7ApzILvIUNnSruT9jeDIOWpzQGpJSgFgAaY7Ifoe2XfGz?=
 =?us-ascii?Q?7bQMmmNwPyeIDIhGglW6h6d5aEjYCRqahoISpZl7PUdFtBhk+svoTCj3MMNo?=
 =?us-ascii?Q?eF6LRA5f6E52NBrg4OaVq4v+v2ovTDRfiwN6V8a1QvK+FbZJ29LlhKFMJN98?=
 =?us-ascii?Q?VTSNNhSeUFGmuBePoVphwwAq2hgoeltNvXSErDECHlDnmeau7RkVnantm5ml?=
 =?us-ascii?Q?knJRZnJuPATI/IUSYGKO6A+7odSRLviKmlqoOnqAycBnUiopcHTFPYzO9vov?=
 =?us-ascii?Q?LHtkp7EX/x/XNO0miPnv2Ij2B9hun3mXIT32s6PuL3dZPBB/zubvrbS5DuJu?=
 =?us-ascii?Q?Pr1/6Khmj2cXxcvqSJSLBE5wuMFQ3cbRAgrYlZhiySfDVI3GfvJbmywxaAGM?=
 =?us-ascii?Q?Gmt//gIoFpzhrJxzpWnwuj6pJak8O5iTPNApnX+b3d9fQrgUgz0x3zWK/+yx?=
 =?us-ascii?Q?BiTBoJuqFlFcvqkecX7KoFm22j1T+3mZjgXwIuIeCh5fV4+mHFClxwNZ98Eh?=
 =?us-ascii?Q?VcfA3rbe9bzOSLhOrs93FMYcXW9Zyaw+2JjBGzKDMlx9YCErTuD9wrkQwo7a?=
 =?us-ascii?Q?tVodXq5APiaLcT+dUabRxhjZsHcijgEBUAFZxgMRk/zfXrAJibAN1edfePHO?=
 =?us-ascii?Q?4Y7xbZ6ApLhJP2YIP6wmnyCfrqhB0sywQR2ksoS2JUBcTdW3BVA9Hy8AtbVO?=
 =?us-ascii?Q?FiCZ8UafZa2iCfFCyPp+T8AdVog0ElJxcBJy4plgNLzUOfV/LVXnW30rOA8k?=
 =?us-ascii?Q?J04KQfunom+dB5DbCBcfvc+U34Qd2dzdkFArcAvI1nXruRb6i+PwLr3fAQsD?=
 =?us-ascii?Q?VnZT9oBcArm7r3bvwVcqAse2iWstxdvpwtWMx1vNFrkDAC/JWtR0gvcpISff?=
 =?us-ascii?Q?T7nLPoXjfORxTit48Zb0klv470oADg/+GgUCakDk7PW9RAldvCKHu6drn6RF?=
 =?us-ascii?Q?kcqEFKc7MvylpG6sczD8N9ALDT7yD1Fe9vqYQHX269wjLTLp7EAsTj9cPxBP?=
 =?us-ascii?Q?Ter5P+n9biGo7F5F2WvsHp+7BWR6h+Bz1MUGusJlvZDs8HtcZFItL2fmO3xV?=
 =?us-ascii?Q?xwshdbUl6EfmFbZ5xNPEwrJJ1EEQWpxl2/xwCUUzsIiL6yAt431XXpzOSR5b?=
 =?us-ascii?Q?9dHAJLxyt5CPlihESNatCC5rFzAuubfTqwMWYkCKpQQlR2JFzjSzseXPJdpj?=
 =?us-ascii?Q?B8+mQyAUmMa7Rc3qQmnCSppbAbMmNCP+3y3zLvKl4eek1oBszQFRkV0ynzGX?=
 =?us-ascii?Q?CCpJABVrPnQgihAJTEHSdYQJBRXA7XuFvcesMjHuxJH7pVivl7JOI/mRjOBC?=
 =?us-ascii?Q?TwlT2Xeg/I1VMIOuPgcsfcGHX3v4UARCc6WDrTmCucqjGmlHIX8j4brqwNt4?=
 =?us-ascii?Q?cq6jzwus9IMRfukl9bbKxE2NwTpRzT1ZTX/8pBNKApnCWjhmue35nGFvzbuy?=
 =?us-ascii?Q?LfUeAr1+wNaHCsDyIPUcVLrM9WPsoL5r9TvHdsZubO25OAZRkhuHn+Q0AoRn?=
 =?us-ascii?Q?ysOVkfzRYj7118BfNM5tNEwmUifsjBadpijPMKY5CPmKF/3aYXGuHIisfKko?=
 =?us-ascii?Q?qGtD4vwTy+jK/yZ9M0lVZnfpsZm5HBBt2XqDqqj8FJWe+4zBeKXbehzdcDDq?=
 =?us-ascii?Q?fC/VQ2PlfpbAnkE5eCGOllZCwhCXTDeb5QqJmvDaZV6Q?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c46372e-ed22-454f-dc30-08dcc63e170a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:15:15.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuWVDiLrfnjO/vbzzALPdPFLgRImapE8fr91590mzD+n9fg73sxIAlCjoHthOK/ujFVbbmAfYIsFf2kJAVuDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7432
X-BESS-ID: 1724726914-104050-25125-79244-1
X-BESS-VER: 2019.3_20240823.2007
X-BESS-Apparent-Source-IP: 104.47.55.173
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVkZGxmZAVgZQMNkkzdwkxdLE2N
	jC3NIgOSnR0jTFKC3R2NLQ0NjI0jBZqTYWAIH8GeFBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258621 [from 
	cloudscan13-118.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1


Add a binding schema and examples for the LS1046A's pinctrl function.

Signed-off-by: David Leonard <David.Leonard@digi.com>
---
  .../bindings/pinctrl/fsl,ls1046a-pinctrl.yaml | 74 +++++++++++++++++++
  1 file changed, 74 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
new file mode 100644
index 000000000000..3d49e42d33e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,ls1046a-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP QorIQ LS1046A pin multiplexing
+
+maintainers:
+  - David.Leonard@digi.com
+
+description: >
+  Bindings for LS1046A pinmux control.
+
+properties:
+  compatible:
+    const: fsl,ls1046a-pinctrl
+
+  reg:
+    description: >
+      Specifies the base address of SCFG_RCWPMUXCR0
+    maxItems: 2
+
+  big-endian:
+    description: >
+      If present, the register is implemented in big endian mode.
+    type: boolean
+
+patternProperties:
+  '^pinctrl-':
+    type: object
+    $ref: pinmux-node.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      function:
+        enum: [ i2c, gpio, evt, usb, ftm ]
+
+      groups:
+        items:
+          enum: [ L4, M4, M3, N3 ]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinmux: pinmux@157040c {
+      compatible = "fsl,ls1046a-pinctrl";
+      reg = <0 0x157040c 0 4>;
+      big-endian;
+      pinctrl_i2c2: pinctrl-i2c2 {
+        groups = "L4", "M4";
+        function = "i2c";
+      };
+      pinctrl_i2c2_gpio: pinctrl-i2c2-gpio3 {
+        groups = "L4", "M4";
+        function = "gpio";
+      };
+      pinctrl_i2c3: pinctrl-i2c3 {
+        groups = "M3", "N3";
+        function = "i2c";
+      };
+      pinctrl_i2c3_gpio: pinctrl-i2c3-gpio {
+        groups = "M3", "N3";
+        function = "gpio";
+      };
+    };
-- 
2.43.0


