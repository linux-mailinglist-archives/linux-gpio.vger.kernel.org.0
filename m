Return-Path: <linux-gpio+bounces-12470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B69B9725
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 19:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C43C282B77
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 18:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9EC14F132;
	Fri,  1 Nov 2024 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bz4+ITo6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6C813B7A3;
	Fri,  1 Nov 2024 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730484702; cv=fail; b=rNGpp58D6lNLOU+PjUnre4NWzatShbY71zjWTv+XBFJtnGhMbYuodyfhpIO01odtwpBOXKpkyhJnG6EeCMUw7tIoNbcvibX9mYoJErnqTNGqwm3s/SOVQZQakuKinD2Ktks1+5RuTNHgFXVbwYYwrkHu+tR8BOqEqxTf1p1A714=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730484702; c=relaxed/simple;
	bh=//bF3UvPnk2BNS3bFtB1rHjfID7l0rHPIP9NLKhShDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ECjaWNA1u7f0NKfd7SYNyl6SAMRaH/hWBPVo/Dml/EAajzT8J7/GR+qr9Je2ufDxH02Taew84iNlZGwkVbH7LFWNxYTJFZTDPNYdU/swJvSHacaByb1T6ERC/X4SajYOCLElQLeSAmpPWjtkUCo5/aHGHPsSL50TaErztHXsAds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bz4+ITo6; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEbO2Sp3QFW2eIAWfN/Hdhv4joNvJ/Yi4WevfyGm6R6L7gOqgLtaNtYzqqqy2kw0YHAW8gMNolGh6agfCVfqpi0lHGP8OC1AZRfQpNevPTRNDd9s7iy067+l2g0Oc4O+XKq2G5xzdCiPeIy0q08KB3NWvsJwMP+Eb7RzZt/mId1+aVLs5rw9HuDNMkNKXRlWVN/lsVs8Kqk3JvGmIXi4SeVKSZJSQbpF+Hc+n96fZ+BeRLtlkpxkiy9SG0lzoywcjF2TirJo7ay+Hcv3p+btfs3zjjqt9wwVoWJ39EeV8k8S61VL3xxmObUqkRTJmWEtVjTrh8vSx/5kEWE4j9RlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIcdzdKZQqdba6Uta1gn3d8YIXgUbVxJ9+C2WrmrYKU=;
 b=Wm8IRk5cMZ0Tei38SKEoyqCyiFQFzQJMJRy0WFdwgApjWP28M0I1fKNMq1r3hzmkwYWnN0crFpvusOW1KKqp0HSbYCeV2dyvi5UNC6AFGKBwZ22ip3pfVWqkAhOJfQcvnxSKhfZj4dPeirIJBL/yMPJljMx9pvhNQOwUqrq5mCRUtuUYqdzZdI3L3V/7+i186dQcUmilBywUrYBwb8ex5qJQOFIHEKwCP0kjjY2gAgaqe7fLvu45hOpwqc57S9/VYNmHccVJ0szouQpc+d1LcJA4WndWo/AG4XMJNyXAVND6pAYG7CPStd2/GMbTEbUbkRdu+CqBCmELaIWo4Z32ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIcdzdKZQqdba6Uta1gn3d8YIXgUbVxJ9+C2WrmrYKU=;
 b=Bz4+ITo6Nuhi+OEflGsesNDGAGEYDQDGltduV89zpmcbdZfMk8xl9SIq1yxhGUCGb95yr0izCDXfN50hXShRymGWmia20c8NiH9j8ak2IqmGdYTpyG/nV/DPsphXFXIqISV/5x1ou/aEv34LJ9wR1+EBM4zYnfO57IRjOB7NKVgWeQAqDw7pGydSMi2PfgqsJD+E4RD+pyulfkiI0kADWyRdOC2r+GqfQ7mE1mvAMFRTCbxN2366Zi3VWQxpRLXGsfOjoKxRgWpWxnO7DlXa/vuI1XcupbxzxZmSfUJGJxqiS3rEfSE8cwOoXnSLnL8x8M91dBfX1IjvR1r4J8Q59Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB7043.eurprd04.prod.outlook.com (2603:10a6:208:19b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Fri, 1 Nov
 2024 18:11:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 18:11:35 +0000
Date: Fri, 1 Nov 2024 14:11:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <ZyUZzGqYIabgCFZ/@lizhi-Precision-Tower-5810>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: d48f9aac-0e40-4e39-98cb-08dcfaa09f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t9ajuh1u1wuc7x9WFcaQ5oSEqQYnF0t70BixSQCOsBl2a7j23R5sFGe2J9sb?=
 =?us-ascii?Q?Gp5LggjqlOwOOWjn4U5l2NXZzjSyLwH/P+ZFCNdxPdpJzVJvn3q8Frz/e/mr?=
 =?us-ascii?Q?uIZmBws5z7atK9+wXiep7p7wUIJ4D854cg94SqZgzfMBqmwJ/jgd281siAeN?=
 =?us-ascii?Q?6W9vggqvXL2+5HEAAxhuanLswTroWxx/JD2K+IiaCxCMUbLxjO5DdH3Hl9QI?=
 =?us-ascii?Q?hYqzLrAIaf9Ll8pxO/stvZziJTvZDrrs/S3HD2n4uFwVr3z4nFdfEmGlKqSq?=
 =?us-ascii?Q?tX5qmrsGF4rTu46KxGjSyxRgqlkKZ15HRSZdmGvSGnO3hLaaN5ixrAlrcYjm?=
 =?us-ascii?Q?rDTD5CaMvgWxEKe/cWVbqOWS3rykxHBuQWH0VeIXBcH6VTRsfiW0kSmSzzze?=
 =?us-ascii?Q?Eg+KmgW8cYw9297AjOdlbCtvXjtEOxY9+LeibG852CHU1bK2ZQn4WYnbAQCV?=
 =?us-ascii?Q?TN3ui2TawXXnmmFyNl1z4hg6+rWfiW3LsSBWayTVk4ZaMFJ1W0Kq8W26TDx6?=
 =?us-ascii?Q?g6WqlvcwfZdCCGnKwQzfQR6FaqJBWJgZ7PPNbhVIJR5i3M9TyQQD2mKxjBt9?=
 =?us-ascii?Q?UMRIIvZ7Ko3IpleGSn6D9YNriwhRblSYgslXPnXdNJZi/DZEpS9tGNjo8Q2r?=
 =?us-ascii?Q?6Hyx6KZigeLqOPB0fo3LTmT3IUSMGsMOPMObd4c0QpxzPXG/FqlbahDT3L2N?=
 =?us-ascii?Q?i916n8FzOCiY33AyvMTtMP1Rn1GRBiQcqPkSqnon+wEY4QhjPCo1Cec4uAWt?=
 =?us-ascii?Q?lpBwOVxnTjtmFEruiuo18Rv4D/7VdX86zIRgN1v66/8a7HxstEQgv7cujE6Q?=
 =?us-ascii?Q?TbWnK1evhcWEW377brwnOHYE8K4uJTaYCWpjfDkNlqKo6Thwgt5sVcOlfKY+?=
 =?us-ascii?Q?esbl64rOpK+7y0ssOxbUCJUCxwfnEVE+u0dl1kmWg84IJYXbr+4+SxITXkbU?=
 =?us-ascii?Q?J44mLqn7VNYekiwIifrMVXyCOuUyP6ZO7WgCVP6Fmvzwwgwjct1ikghLp/7I?=
 =?us-ascii?Q?vu6yBlJh2ZxPaa/B9wky9VxJ2FcjfWfu+7DZbiDk9shP38V73x6bmWB2m+VQ?=
 =?us-ascii?Q?clqlOAe87IyYggY180l7UrvsByok5hQAADoHqHmsIHyfIKMjjMkKb0rZRT9Z?=
 =?us-ascii?Q?nkpsRFK24M6ZpxFRBkvR2w4wWobEkQiuVCleU+vLFGH7fGX6+T/tEtbpBry2?=
 =?us-ascii?Q?j9OIMIGxm4udH2dM8/h0fVwf3ry61flNvMz4Br0sdYZy+kgbKNpwewv6hJfK?=
 =?us-ascii?Q?qBaj0mvZfAIz+IlXJTQrL4si8dtQ6/OSecJF6DizmdFyJy5VrqNuS2ZQY5HR?=
 =?us-ascii?Q?IvxFkM1XZkvXDmPby526kovK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3O6NYvJEps+JCdolm8M2XqT1db65ksexz7rp9q/r5W5HrH56W74ux4Ewodax?=
 =?us-ascii?Q?GV4uL/qLRP4naD6bEylJUO/lTxC5Mg353BvOnqvQzcLAOF1yWs8qKOJ622/e?=
 =?us-ascii?Q?RTI8sB02Vxv3Z7cP/Rpm4Ym3pklYXkWXJumRn0E1kUM06Ra+GQQ+pAJh5SAU?=
 =?us-ascii?Q?SLPTYm13m7Knzk9zHSSoCjpyplrtf16wJr/j3yR8fzdafdfvTYXd3sTdiizT?=
 =?us-ascii?Q?TiNiH9qShuyIRwbTyES8e1951fthyqcpi302dS4uFqx/CZLEM6NDqltZ3qts?=
 =?us-ascii?Q?Fuw4h/9mGyEO5PonbzSt1lK4q+aNZ14KKelaJwBsVGLVz+dZvlgA7mqw9IKo?=
 =?us-ascii?Q?yFjvMEu0anaeEIyMGq27jOINAqnZUbhjJFVq3VwgbH6KpLcs70Ji7DHynPyP?=
 =?us-ascii?Q?YnCrkIXS47j6yM75vjx7XMO3mZKl8Cx671ciHIP+za5Sb1v1fzFZxoywVPIZ?=
 =?us-ascii?Q?urAG+yR2VQNpO6YZwWEMZouvpONtKH1V9JgzyDs05c8j1bptxglLYE2dRgXW?=
 =?us-ascii?Q?jFulWgWtxqXYGbMSwYRVgqHMcAeXSH67lFjsaQ4W4XOUCqpONDNxRWFeTrfy?=
 =?us-ascii?Q?bnjSzAvJW/HJeIl9Y7aoWxVcJryAte/ysh1bwZetPjjiDZTqfjs3CczhfCKn?=
 =?us-ascii?Q?AvTkvTz4DH8LDnoLjIrd5LtwOp1cjPuHWQkqkR8Cst+yBl2ZFfcWIEtUifls?=
 =?us-ascii?Q?3NHYC7oZQmPNDMUMiHOL9RAhhCARZ4HIvsOZgn17cb7qXa+HzuZIEdF0N9RF?=
 =?us-ascii?Q?Sj2EpSwx5c5DmM1enWGDvpMnCmrmj7Vp8U2V31rpnhPz3g+Bcr4hBxqj1b6R?=
 =?us-ascii?Q?sUA+2ztE4ABHC2yq6R1ZCI2ZoIz40XPHbKmn5FnxbFLqOehng9C/wPsGb6BC?=
 =?us-ascii?Q?i741SnPiX3n4sZGaxUFYWmpw7opmnImLwDeYa1KZAPrxHTlRJ/xQ8ABiwR5s?=
 =?us-ascii?Q?vo6iwhPZVjb8zWgkiJRDLKYaldrqMqgmV4EH9b1AMolOcc4OMjWNPAWsMtRE?=
 =?us-ascii?Q?PfySAKCwsiHvs+iOSSkA7BlyRguyqobrMyDav+ChMathzbk0R7NkFBojjArm?=
 =?us-ascii?Q?xPa+0Q+ge6R0zav2MAEesB7M1tXB02JrYpQewlXFGYW8TB9Ok6v/ryVxH2cH?=
 =?us-ascii?Q?JQbBI4M2a/xmmHKlLupo0rI/rHeOrbfTz8YNoDlhas5c0XosiemhcZZMOuon?=
 =?us-ascii?Q?XOY+1WlbTlkxBYIYAsCzSFFAhfYShhvAoZWUuiFwj4zms+3dGaoLYIIz2bWX?=
 =?us-ascii?Q?tl2CQSoY8PeC4XuVQy3OWAAI/dVk6YoC+Xk7ZKlu4n85CjdWQ1YOrMdXYlbG?=
 =?us-ascii?Q?TaOeH/p8luEPSvx2U80E9m4HYW3p+WbbqAyz9lYOhgtnQx75ARLPXCuSMhZo?=
 =?us-ascii?Q?3uyZnrxTDfWSPSjzC+B0sf++8HU8qxcYyjyDBd0UR7nXtsOpdQfcqAs5m8Sv?=
 =?us-ascii?Q?32S8gTtUi2TUJd0UdJsS6FUOFqEatjUaVAzCqt6PeAyoRB/pDnFAaR6YsK5I?=
 =?us-ascii?Q?JnCo2v8T0ToB8/Er07VJOBf15J7h3LsKCJhVRXdNytxFQKRpuoDrhsbFW0wc?=
 =?us-ascii?Q?sVveaz852DoxaCtMLrx89mp6NZgNc32bqdypJR7c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48f9aac-0e40-4e39-98cb-08dcfaa09f5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:11:35.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kiwPxR6herOZraaj9lvBNVZfCMjQ14fjMhkL2WKwEQN2OX10WFCd1grcMMirUA2SRwsSzDz4y10a3CmcWjXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7043

On Fri, Nov 01, 2024 at 10:06:07AM +0200, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../devicetree/bindings/mfd/nxp,siul2.yaml    | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
> new file mode 100644
> index 000000000000..141ec1219821
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: System Integration Unit Lite2 (SIUL2)
> +
> +maintainers:
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |
> +  SIUL2 is a hardware block which implements pinmuxing,
> +  pinconf, GPIOs (some with interrupt capability) and
> +  registers which contain information about the SoC.
> +  There are generally two SIUL2 modules whose functionality
> +  is grouped together. For example interrupt configuration
> +  registers are part of SIUL2_1 even though interrupts are
> +  also available for SIUL2_0 pins.
> +
> +  The following register types are exported by SIUL2:
> +    - MIDR (MCU ID Register) - information related to the SoC
> +    - interrupt configuration registers
> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
> +
> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
> +  16bit wide.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,s32g2-siul2
> +      - nxp,s32g3-siul2
> +
> +  reg:
> +    items:
> +      - description: SIUL2_0 module memory
> +      - description: SIUL2_1 module memory

description have not provide more informaiton.
maxItems: 2 should be enough here.

> +
> +  reg-names:
> +    items:
> +      - const: siul20
> +      - const: siul21
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  gpio-reserved-ranges:
> +    minItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  nvmem-layout:
> +    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +    description:
> +      This container may reference an NVMEM layout parser.
> +
> +patternProperties:
> +  '-hog(-[0-9]+)?$':
> +    required:
> +      - gpio-hog
> +
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-grp[0-9]$':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +
> +        properties:
> +          bias-disable: true
> +          bias-high-impedance: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          input-enable: true
> +          output-enable: true

suppose needn't such common property, if use
	unevaluatedProperties: false

> +
> +          pinmux:
> +            description: |

needn't "|" here

> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +
> +        additionalProperties: false

It should be unevaluatedProperties: false because there $ref.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - gpio-reserved-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    siul2: siul2@4009c000 {

needn't label siul2.

> +      compatible = "nxp,s32g2-siul2";
> +      reg = <0x4009c000 0x179c>,
> +            <0x44010000 0x17b0>;
> +      reg-names = "siul20", "siul21";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +      gpio-reserved-ranges = <102 10>, <123 21>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      jtag_pins: jtag-pins {
> +        jtag-grp0 {
> +          pinmux = <0x0>;
> +          input-enable;
> +          bias-pull-up;
> +          slew-rate = <166>;
> +        };
> +
> +        jtag-grp1 {
> +          pinmux = <0x11>;
> +          slew-rate = <166>;
> +        };

one example should be enough.

> +
> +        jtag-grp2 {
> +          pinmux = <0x40>;
> +          input-enable;
> +          bias-pull-down;
> +          slew-rate = <166>;
> +        };
> +
> +        jtag-grp3 {
> +          pinmux = <0x23c0>,
> +                   <0x23d0>,
> +                   <0x2320>;
> +        };
> +
> +        jtag-grp4 {
> +          pinmux = <0x51>;
> +          input-enable;
> +          bias-pull-up;
> +          slew-rate = <166>;
> +        };
> +      };
> +
> +      nvmem-layout {
> +        compatible = "fixed-layout";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        soc-major@0 {
> +          reg = <0 0x4>;
> +        };
> +      };
> +    };
> +...
> --
> 2.45.2
>

