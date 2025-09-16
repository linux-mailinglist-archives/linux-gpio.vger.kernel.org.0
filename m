Return-Path: <linux-gpio+bounces-26223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB4B59E2E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18B3581D98
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF6C265CC2;
	Tue, 16 Sep 2025 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KAz0Zr9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1C1C7009;
	Tue, 16 Sep 2025 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041262; cv=fail; b=cQWHPFcSyXnKQY7cJk29Q1GK2faBfZd0JeiWnDIdJ0uV77PsiyNAq6aZp/kYlL1LjJCPIqAiIHBLNNH+xeRURYjVkF5Nip0gyn0+gTDxp9Yp0FARbVFFMLHCJjKEW7CgkyaoqYCJD+NoNGmIyQNuTRlAh1oaJ1b+wUBLXY1n3Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041262; c=relaxed/simple;
	bh=Tn6+8Un9xBtQnlkqaEC2jQ28jKjFQAwk8oIVaq0itWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jKT+vClceTHvkj3IyFgJqcRbDGgQmnSQ4i1K/kG8tO2AwnV+p/HjQJRPsgEY/ARsCmquuJNvxR6KfiMwkFISjx1aXhL0STFLa2wLnnraNyEnf5p1XljFBBQDxxiE9N6krSA/lKnS8tWIynVs8nOrizB6L/1I57nKlQu8zdRdjyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KAz0Zr9x; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNyvUQV5I6yDKCUbd46a4260g9+ja7QnAGzveL6Rj61R8lCkBzF5O1HoriOfk2WPjEZbfPbLOx2nkbkpkp0/HQH51tG4GZGOfDNiXI1xB6H2jXSlslJEzvQzY1f/mxwkCbWtCLNaIL8u2kCfk8HaIFhiYCR+T3CUAUEgAX64kcV2jXOx4DftTdga9SUAtsm7fFSdadn2L3+Zrt6z7+yuDSlS+1ujjMcxsXnJ/BTIO76NxCDJk5sbEki2/ZO0Wu0NNGdCw8pdGiiOmaarNNyMpUJsY8l6WEwqu9AQEQapDf5EU6uugpBB60nqKCWTpu9uXCwV5poV6/6FN8TWnEv/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzblFypY5hBzoeIBwO/gFf+itVdCk0RSI+9shAZksYI=;
 b=jaBmzq8GuO04ButVf2yfTSifXyiD0c3oTIpHYns6HNtfv8qcbbvm4cMvpfYJd8QJGynhPFeSrwNoKZuYCP521LpUIUDhdfFDiejBfttKhvsbPu0XqbMxGFPL3r/FzU/QWjcArRr8VLQEEcrf7rYZ4kjcS88sXyn/7CafWiXws5JaMkwys7sgchFylpfRTAW7PSFnahJ+Hgb7985/D+EXaClZlTOXtU81cASPD9pkjVQ02BOvKwtnK1sstys2YeOTlE9CDP3s3d8jr1dKrrRqApXVn2maeDZIPVLvuCfmW7PdpCwCkKF1rvcXDxPt2l43GB6GRTcLurUgLzRuv8tazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzblFypY5hBzoeIBwO/gFf+itVdCk0RSI+9shAZksYI=;
 b=KAz0Zr9xtkhIuBDA1kNPxGZJ0GeHhKUlQzcpawvCmZzWrelerNawFsGdimUlbtImSNsgo4rutSYkDZCSyiEINDEp1X9s0d34a9EvAdd3wyQBA1IvIIkXArixLEjtpuVPfav8KA7al6MJHz1TuchksxcA8nxf6DhMMGoVsUDrvPag/5GIWVYlmpcZRULvBwjxXhx77u8hhoFVlDujlxyowFIQ6w2+DwcRHafOLKzg5t1NCBgbJRZQjrz7TwRQBuZfjdXLjVovFMuNhbFrZWn2hf0/BvCSAjqxWhqCI7QwvFOqNciK97VGNN3FxkASybVdvsf3WiydEGZjeneN9PqRlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:47:37 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:47:37 +0000
Date: Tue, 16 Sep 2025 12:47:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] arm64: dts: ls1046a-qds: describe the two
 on-board SFP+ cages
Message-ID: <aMmUoUUQYPGQQdRU@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-10-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-10-ioana.ciornei@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fce3f78-8437-4fd8-2c6c-08ddf540be4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zPAF9dSU7Fb8+tvnhcUskM+wq0JKgflA3i25hdPaOH6JVfm1kD6O2DzzQIyJ?=
 =?us-ascii?Q?Z4d9ruWMwtKgxXW6nxRYUrL1sT+oQ3/miuWqKdvciyy3mT60lyUx5yI7GMxw?=
 =?us-ascii?Q?Lfa2daRJUHAc2DScvOSjaF0zDgCs2sAlRVD4ap0IokqnR44YXkPJLEUtQu3J?=
 =?us-ascii?Q?+79T5j24PyVbOdfk04k1PjVkBk9LQ6B4VedfzcMnyO7doZnZt/6rXSU4BZ5e?=
 =?us-ascii?Q?QAgHU87E/Y+a4Q7RsRFs48Jnv809WHDUV2rKJxS/Gi/J9cb1EOw+qe1jBaG+?=
 =?us-ascii?Q?kGMM8KZvYT1Em5Z5qgGFwkeE+4cX3CTiZZwkPYzpi5KhzfvvRI5HgKLLAHSS?=
 =?us-ascii?Q?A+ACYxsvzjpiA1A3Qca5bKYMfYIlErNgBzPAu7zzEJPdnLCTa5OCj5FHxiL+?=
 =?us-ascii?Q?CJxmBrN3XMEXdMmgciZn12DKLws0BfYTUaVR2SG/cgjNeHHW8JF6Np/b7OA4?=
 =?us-ascii?Q?7ElWls5VGkTgws3MD2N/qRqxUdU5ii9ADxWUp0Imn2KobhJTb/9q5UTkpgbn?=
 =?us-ascii?Q?AYoR3F1tuhw0ewdQvpZ6BFeYttD5GAPAB311YBK+M7yEiN467NwDAyijM9GE?=
 =?us-ascii?Q?vDx8cYNHAu+fdDKrQPT8Nk+rRLHBmf/JzZTQPK96bFffd0JAB9iCmgByLbIi?=
 =?us-ascii?Q?GtewGaPvcFh765CiKJhuQTNWWs2It/Jrtt4BWz2DzyFbetU3Y1etxRw6+RtS?=
 =?us-ascii?Q?xY1UIOIfUID8CZ73UFZuKT8PXYQdD/Wk9gMvrmmF+ikoWgfKzaxCU20M/BwL?=
 =?us-ascii?Q?kYpQnxf9J9afrKhcBPtkKkMq/ms/T+xZ5KpVKC1fUYYZo0P9vhuOU/zS5J+Z?=
 =?us-ascii?Q?3wkX269UsXWQlddypP+ica+roDXjRBemOCmh7jENoDE0z1pnpE3n2Y2fdvVs?=
 =?us-ascii?Q?xdafr2wACsKa02ulRL02D/OR+dZFJMnsZKyDYpEdjvWHJn6/lk0OjCFwIyxz?=
 =?us-ascii?Q?mhYSVDD+9ygHNZCdBGwzJqCOqKlHJmUzjEAmQX669rocAwfYvUH7AHWrzv90?=
 =?us-ascii?Q?t+SfyYFb9r9XKo3NJ9oOlOw7Bm0bf8+j4L5cHAIRTdoptyCCwxsT2YkU/Fww?=
 =?us-ascii?Q?UidGPwZYiRwLyGcE8EAfpU7ChY+sG1cjavDtxUWFV61KUcAx645shXzjbx6y?=
 =?us-ascii?Q?RxkdNAYTKLEqMOV6+B2tnAUko7U6diZzhmo/cPaZVfWZPc+dY0bBhMHG06+S?=
 =?us-ascii?Q?HmDzUXyLsm/IEvcUSSdnL8JuoK5tGYfwQ4yjWcvgHbIm39dLAJlI0IxH+ER9?=
 =?us-ascii?Q?V47WDeAQPdJDvlHkhzsFNg1w1GyaZ1ZNrtesMpCPS2YXWay/GYXAQS7Bt7K2?=
 =?us-ascii?Q?MGFw3RQiBEWdunrfWgYWK6rNZMF8mYgEyNfwbn+9aBn4GixDepDFsTOxafX1?=
 =?us-ascii?Q?joWuYnEWJOyw71SKnOCjh+zLlLSpOTqoV2pJZ7jsaC1C8XRMfpZ8FqF63A+e?=
 =?us-ascii?Q?DtZbKtI6sgqCf98M1Jv7z5KZiRZJM/VkrnwuHNt3bbpApydG37rzuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xY5Yog01JG+UeMEKY9+PP8N7Qq37q4M2bArmND0hzjexyhOWAmyg21ZFjoY+?=
 =?us-ascii?Q?noSG2QEgncYxtCsrU5U80ZhkI3vFv6/1pnR21xQtKczpe3Xke1MqA/q25BjG?=
 =?us-ascii?Q?Ye8cTjii/QUYwegz6jZye3y7qZm2m9p8Rr89r50Nui0981gQMUunx1ooNHBj?=
 =?us-ascii?Q?fue6Zs1Nni8345wkZyIhgfWiKvtViJwoIhoVfNuohzK3K0f2e8ALt5Op8WEu?=
 =?us-ascii?Q?v9OWEv5CQKLuNxnb9EAqUZXbD1lvfVHjM13C3IIZv9e8UtOfvmu26lD/1OqE?=
 =?us-ascii?Q?OJsMXnRf6dpyLvI4ITuq4DcIdc4P7XeCnuS2uU+H6tvxbuxVXzzXgSJwBRty?=
 =?us-ascii?Q?4x5YWbY6NCaBAOM6x5onvLBAw4N7oVei/ArSNXgFHK0UPToJaf2jXCJ888yT?=
 =?us-ascii?Q?K0jcunW/WsTHL959Aji2GT+Qt1R4JS0fm5CR6P25R7VetO2os1Aj1ViNjtAa?=
 =?us-ascii?Q?tS9zn25v5Dse1xGTMGd6NEWAbMNavFnkMkdsUSBC7Fb29mfKyQSTUVuOwQlz?=
 =?us-ascii?Q?u92cx4Mbvrb7+JaFbjMoV0wDt9BIQ2jji2Uugk6O3SBiIenPV8e4oov1tiwT?=
 =?us-ascii?Q?J94CYto9boZi7V/p2Vt/7sdPqrwJOpcsnfuB6spMqnsF0urhwvvhFNtIp/hY?=
 =?us-ascii?Q?l7ToK6TrwmMUSlzM8mGCAmbYJ71Kaq1TtOTsK4kti6YI9CC4AQeRCM5g1uWt?=
 =?us-ascii?Q?95pPeCW7xyg80GKLghyhxjCRUwlvBIpWrXivDVPMdWmhj+xY5x+j1e3oJgbc?=
 =?us-ascii?Q?1Ba96e4f9k7eCS3cd6JvEnFQBRiBYiC043SecAt0li2lhM+xTI/myKBNVb+o?=
 =?us-ascii?Q?iGOJdfVjWHQWHKJKOAhz+3Pc8v+u3pskfOJr4FTZHeRgxrGgxhMi+Wei3DxB?=
 =?us-ascii?Q?N5mxGPrqvt3x8B8k1lMLeoNKl62Dn33t7BMKaCGOEvfOoJF8Jx2x7zLg51xY?=
 =?us-ascii?Q?ga7UR+FIc5tBXzs+LBdy6I/EzjhklMSoaQvRRPPN+wzbdybNAzQAGt5OTkdZ?=
 =?us-ascii?Q?HyQIoWiL3kQ3YAJcGsYdXrWmx7aNWZP1N40pwudrL5r4zHQJbxJQs2d0JF2U?=
 =?us-ascii?Q?h7iR1j26A9ykRqngjE3rc29SBnLYtAVoY02gvK+/V0M8R5E33s3D2rENsxMl?=
 =?us-ascii?Q?nySzS1VEPdF8RAHPCMXGqvUJCzRuZHhE6cS9tqSbh6AJnMGNILDL05AOr7EI?=
 =?us-ascii?Q?O9Vl/aVFK3P/bzoNzMRK60fVUh8OHP30PuUlSBBhy336kOWPCfKyfRkzyzG+?=
 =?us-ascii?Q?iwzr97wnEy2PMBG67mQk45nxPo2Pr429AtsQdm0+r5QCwg9kP6oJCj9ybngz?=
 =?us-ascii?Q?f+wbReIouo/1OTcvIvM6Q/d87cqxfILNR9EFI3amM5I0wVNlqYkNfS9Sp3sN?=
 =?us-ascii?Q?B4GMazBEoALjQt8mFknKUcYoYVogRtj3ZedOWzhq+iBgdufMlZtQkHQ3PTC/?=
 =?us-ascii?Q?34M+Vmulx4Qmx48QNSgd9qnhTlDycfsVnrDuU5vaRunsknvN0Wlr6cfxk64F?=
 =?us-ascii?Q?6/qCBYu3vy3aPNQVkxfsv13ZcrcD46PqMm3wIa6lk5q2DD5iSrCLhQ1i1nOc?=
 =?us-ascii?Q?kXZ+qw+kxGmJhW/fkw7q27tGxqJiybg6KxMtfvCM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fce3f78-8437-4fd8-2c6c-08ddf540be4f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:47:37.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbNld5aXABrmjky79Uh/EfBe7G+Pw+Y728/mK/lOe8OGzlPMotbG0c1NORggUPXQVLJb97JfaZZQcAbjnzXZlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

On Mon, Sep 15, 2025 at 03:23:54PM +0300, Ioana Ciornei wrote:
> Describe the two SFP+ cages present on the LS1046AQDS board and their
> associated I2C buses and GPIO lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - none
>
>  .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index 64133e63da96..c188977a901e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -42,6 +42,21 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	sfp1: sfp-1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp1_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		mod-def0-gpios = <&stat_pres2 6 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sfp2: sfp-2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp2_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		mod-def0-gpios = <&stat_pres2 7 GPIO_ACTIVE_LOW>;
> +	};
> +
>  };
>
>  &dspi {
> @@ -139,6 +154,31 @@ temp-sensor@4c {
>  				reg = <0x4c>;
>  			};
>  		};
> +
> +		i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x7>;

reg should be before #address-cells

Frank
> +
> +			i2c-mux@76 {
> +				compatible = "nxp,pca9547";
> +				reg = <0x76>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sfp1_i2c: i2c@6 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x6>;
> +				};
> +
> +				sfp2_i2c: i2c@7 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x7>;
> +				};
> +			};
> +		};
>  	};
>  };
>
> --
> 2.25.1
>

