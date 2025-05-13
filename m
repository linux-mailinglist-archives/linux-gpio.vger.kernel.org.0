Return-Path: <linux-gpio+bounces-20007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18EAB4C3E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 08:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F72119E64EA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 06:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263741EB5E6;
	Tue, 13 May 2025 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XRuKKGWu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BA33F7;
	Tue, 13 May 2025 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118778; cv=fail; b=eZCft7muh/qDtYJqU36mNAncHzwa49emTbozM7ObzfZECiJzHI2a1LZq3CnSStTAZnw38Qd6QpDx845OVUFU78Ss9D+oQvjl336Fbox6/UM0S/m77r/Ld+cxFCkyds3Ctw/n0z7W8QXatSRfN0ZGoAVLcDZqq5FTBtpMgIXPvGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118778; c=relaxed/simple;
	bh=rFFZL77q0qs442d7kAGR3GpGyJCbSGX7bIkcfFKdh+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i1hK54wnRmhvQXkVeEYV5bMkTMmlc01BbQbysXY+UsWg/ROZveM/F7d++/WuI2UHgsme5gGaIKAJ+qVZxLa6K+xG4+Wici4PhCt7vcI+5zun0gtLH6YPUlMxOqeKZh9BgfVm10wdVCHx7CbXAWPmJ1k1Topfz2cjHd1SfxrgFjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XRuKKGWu; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAmKv/SldvqcODvk21OgfukPLQei/T6cwDDaPrJOTL3g85CidBCQx7N6sLvnjF3OEvoqjPBiBpS8dMAWvpleNmo0AOZCWjWkrXloiZoU61QRXb8YY16o6Ylc2051J84nDnvt/vI/6//yYEuH/l6a//Vih7i5orrAUa9tJ0OJND9uKtbxtbNz20EKb30LQb7HqzSF1YraZGbJEfzhHX4Z80ibZDSXlxh1nUWQbFjFwg8CIre274hNfUejLiRDTGoQxVSgzEgTVVLa5bhqq7o98h1z/chOUNxH1b0OwOaool0ApvDGDEQj1HgmTAHTMwa88bXHBlHtG8jPsVuP3ZWKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcmKWjqnzFtMMToOeKeZWj+1ep9fzOatWLLq13aFnBY=;
 b=Oa23Onz+8WhAH1vHhH/yXKE9DJsrCoTfPHBgV3O0hSTKMYsFkqNpVw6lP7NXlG/yCjakN1obb0XRCfa7M+Qo8PNRpk3PmfbD8z/zPcd3KZHiCBUXegA7jotzZALMc6YSx+nDAi//Z02V+UC1IPvgw/1fway/ohYG5lfUyOPXRwToKyDB5aZiy+mLD6VRTbDxZWZuI7nAIxMX1Arla23KvTojsxVpJaCsU/cT5GC1Y1OBTJY+dPrtBR64dh5QWKyG4KarFDcFFvNokYx3e5SSGabvLdCsfPrBLnjs+SN3Z5SslkSbgH/prHvkROqSsJI1RVSmk/5olR4oslMupVulhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcmKWjqnzFtMMToOeKeZWj+1ep9fzOatWLLq13aFnBY=;
 b=XRuKKGWuAzsxZGncDHdUHvm38vBMKbchnM+XtkUUaahXY84qrXdk8E1hL5EmLBRf0u384syQ4nqh1sMukhSD9ByYmypZZXaW5vFEWzdBVosawEDriKuMVxC6IYuVR3i1EYP9axNsNYq6QOu/neltcgjrQT2aX9YwfkHLm0Kf77WFc8HgnUaCfs5ouA6zshBF3F196SmI5gRspARBCy7W/hG3C8MqEz/tildcJmaCCibd9Z/G/zyKxPMsnATXaJmRka5KvNRDPz0vPZLGaA/DsMkCLcTjoi3p3Q/Fvy0ibY7yYK2FDlRJaXFz+eIUpw7XfECvAOSE0UkSYV1QA88SYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 06:46:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 06:46:11 +0000
Date: Tue, 13 May 2025 15:55:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
Message-ID: <20250513075532.GB14572@nxa18884-linux>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
 <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
 <20250512-mongoose-vacation-f81a56dd6c5d@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-mongoose-vacation-f81a56dd6c5d@spud>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4fedd9-67a0-4fe7-feab-08dd91e9d8c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7x4g1tOtuMSGtbbwLdwD3FK7aIaaYxTfwm6tbsqJv0RYPzsJgzwhyu1a/Fko?=
 =?us-ascii?Q?tZDJ1yjbT6sa+AbIG9AR9UVSk7hUF6rTnQZBKYxmDPJyDDxc5NhvuI8jm2GG?=
 =?us-ascii?Q?NMZ3Zu2ucFo2aODBapwDNakRPoZoeUE6NtmIKevQBN6hJifuj3Q8cXjltXyx?=
 =?us-ascii?Q?sxHacmk/xMiH/wAiH/rDCOtqZkkN7Hy8e3PmYd6V3AQDZ/KRGqFjQtnnrCli?=
 =?us-ascii?Q?ht0RGW2JVzrh8CSjvQDs1RkYW0GF8R9JmZGkdmZlCXn5xfKQH+1bIYIBnqCv?=
 =?us-ascii?Q?LjmZlM9nkhCBqgHkjOCYBvc7ET2A9s4tNJfsze1tOMYVvtJowHUBg8Litkcw?=
 =?us-ascii?Q?hQYnCvP25CGhYJvo1IyYI7tdb0D5KiUPPB8ah/s805vcc2tJOrDfu40E7xJL?=
 =?us-ascii?Q?qxT8uKL04c/ff56mmlkLAn+gLDXA3NRLcDtShT6NI/jP4S9kPG9aLrjKaPGY?=
 =?us-ascii?Q?PnhGmLI+2p2JaeewtEtA/D9NF2E7Laimq6w2c/Dx3kVa4ROy9apaqaQO4zhx?=
 =?us-ascii?Q?MQxJbiCGR7ggQ4gg3mg66+K0EdXnoXG29oe54VwL5WPR7B1NI05vfbooKZ2C?=
 =?us-ascii?Q?pZwcQP0LVTtSqzNZkk/Dpsx/tfcTxNCsMa09eKOQGsUZj1I7zjJn4j2CgfGj?=
 =?us-ascii?Q?o+ogW7jf8pQucuc5jE0ReMCF0zZUS02f+EZiHAq9HOjjQUQKkDxYobXrjzQT?=
 =?us-ascii?Q?TxQ5sWl9XuhN/HZsRrRf/tp5NmeLFcOVs34p8KWXQkTSgMRytg77FOH1QQtL?=
 =?us-ascii?Q?5W9sgx6s5D8gLK94yZRIjtizY3LJwWYtFazGURcAMjpeSCMLLJB2syCPS2g4?=
 =?us-ascii?Q?dCdvRi5FPtCO72dCE+yN9/eo6z6gSkOJd3Q2Q0q12xIGYfbLEBw2GKcet4+5?=
 =?us-ascii?Q?DQHu8LaZCfNUF+uXCj6ZED7hdoEX5LeIrforcN/GyFqXf618CYFtM9h+Z3MR?=
 =?us-ascii?Q?6+v+KYqjI4cNkknDNuUt6UN2YVTQkVbdow5q1GYDL3KE0WkuMxzvkyoYYC/g?=
 =?us-ascii?Q?gvBXCC0WWELY+DWI3/Q24ikYG6lLgOrptemSq+XUheiWk17oGmljxS8fSQa5?=
 =?us-ascii?Q?64obweE9PtTOaX7pI2ev+DTgCyaTR7D3B2bprnTjB4msFtGPNmtCXqLO/9C5?=
 =?us-ascii?Q?9A3xKCxTDfy+JXZajN1S5nZRw+EE+L/Da0lF+PLnGITjp4MkmC1BRymkLxPB?=
 =?us-ascii?Q?QeOqQM6yI/HS24++6eYc342u+LWoXWRbzAGWEmIcEZO9aCHsLn7U/41lGtMn?=
 =?us-ascii?Q?djh62KnmlNu9klytf5utnTGM4FpULVrvN73bINdM9fsCzGaQClFkfkefQGrT?=
 =?us-ascii?Q?7voQ8YDfL3tmOTvkvd0yFH5+OUZkqeJOf7xdfqmnXvHZOUztLELnN2jRTEUS?=
 =?us-ascii?Q?x9RUb7FSmlxvUfaqaDQQqdPfqXDBvApc5JboB146/qye53HXh9Ea4+Ge2UJU?=
 =?us-ascii?Q?2h0b3UKcSlleiJKlz78eM8PMdVhNKna8aiefCQbct7PuMm9DQZuog3NTCqaw?=
 =?us-ascii?Q?jVc5P4PhEGWRzfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0bJ56cArpPScfERNUkC6uDuBdEVvtLFiIeGkYYtkNf8VzOkCvo8it+4bxLFp?=
 =?us-ascii?Q?gcTWsB4pctqHcrwEpzMypfD9cxdrr19dKById2nijMuccPiE2zAwWhj/Z/ND?=
 =?us-ascii?Q?xzN9eFBcOdmtryfTQSZpCT8uthyzqo9dTRr0QxTR9IapHAWHkXoplBwjOtG+?=
 =?us-ascii?Q?qO4uxkLq2O7rdqdIQ5fJT/9IPXqbGUemNNydMzyU/2vDXpbhecQxNZANrGI5?=
 =?us-ascii?Q?bd3XygsifFcdIAbg4dK2Rcuz9fCZnCbYwod8TNbbS4eqaWNwm0unOTmr2a3W?=
 =?us-ascii?Q?LnSzUAaBIlykRQAJ1CF8Wbkzv2O1pckGG7H5+iR2vZNh2GTGcXGlmYwIpqRu?=
 =?us-ascii?Q?OnjTkn5lN6jpa3ZUYk8IMv8NnIjOA9+MPpWDHq8A25ETdtLoC25hZFR27Vyq?=
 =?us-ascii?Q?DGLyKjKSeuhPDyImyi5rm8EgpOBLwDs+ae7V0l7EISgW2wzsQZ0CumhomwGQ?=
 =?us-ascii?Q?8Jtflu0s5YGQSFTEcgs0j0k2uIS7rkHD7zO4XJ4THr5bWLFP6gAcaiMMaw06?=
 =?us-ascii?Q?EOrjediepbqmXkTmZGKBqfyZauUWBDKGzk8jO7DFQeNHRdI/7faXw21Qp08x?=
 =?us-ascii?Q?XZVKzuXNeGbZ6idTdqBVw6d+Frldnekevv/GWLsLiwezto0pAL2Y/PlCOvZE?=
 =?us-ascii?Q?MECTB8aXyzzOO+h+HezcZ7kKBV9dTV3AbQQ0927IJ5CmGRR6emsz/BKjY83O?=
 =?us-ascii?Q?N8mkmw3jn0dPsh4iqebnhVdnDljlTrpgoPmImFjUYxrP7MK2PGqN2yt9tQ2v?=
 =?us-ascii?Q?zsso0HacDM6BwF0Rqk0TKcS2WUyX1rdMToQtOkCtkEc9rwxd7x9wBIx2opjW?=
 =?us-ascii?Q?JMmg79cVatbxR0/MnM1/uncbOhED95o7sMHENIkBu7wvZsxxxCzubtz1ZVS9?=
 =?us-ascii?Q?YPlyaRAAtw3cQQ99Y4SEu7AMlrX/pqhMxDTVxjkOWhi0YdRvxV8eWUBS+YtI?=
 =?us-ascii?Q?uuJOeGuY1RqHOkulgXYrbjIjOL3QCw62w0ABWRxMkID3JyoTMPnLM0p3teFh?=
 =?us-ascii?Q?JaofYafq4h0wGfopUpxXH28T3Gc8XPp0X1UBOhlNf77r+nXPNNKVNbR0qDEa?=
 =?us-ascii?Q?M5oEYRhCXZZPPduXhzybH2ZR/gU40yDg9Z8oXzsSfeoHEYcUqj9kN+JdEAhF?=
 =?us-ascii?Q?GVsMhUjamBz8mXAp6NKXOZkCQid9x/MtJ5gypcuJZn+eMr/AxmGPNc5nXius?=
 =?us-ascii?Q?VBj6gDPkoXy9/+XXwtx/x6ErmHEDaj7TdryAdG7rN6+AM9UlhKtpaGGeqm+A?=
 =?us-ascii?Q?Dzf8Bb14+7FRSYfB32IR8WNxPUX1UTdJ7IMLYO461mc3Z5Xse9TK9bRsD3De?=
 =?us-ascii?Q?pJMs2zn5mZVgyTmadi4SM7DZ6MpeMZ/b41DVJA941UxlncyngvLcdSiFU8xn?=
 =?us-ascii?Q?3/cUOwHVwudndj6ikoIRfyZ0u3FOnadUHZ1vpesxl6VXfZlItPO/64RaghFw?=
 =?us-ascii?Q?KmSCrsz5buW+K9uPkYFyRZVUUBKhBCqR6MoA4Zvn5v204ZlqOLwD8hSYkV4x?=
 =?us-ascii?Q?18ma/rXrvx4HmwE9Wx8IPxRLfYRhP5weRQbSeYAXcJ35ty5/C7gZfIhT7LQU?=
 =?us-ascii?Q?TbvwIFlOhDZZw3EQy4WaH6Yl4pC+hb+uvvI/8zxD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4fedd9-67a0-4fe7-feab-08dd91e9d8c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 06:46:11.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkE5HJtCsrkx4+rRSGJ7GISWMo5y3SPROdTTIkYtgTrRdxgl9sYTw00wSheYmearZX3SLZ4cN9+/ENmHZv41Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

Hi Conor,

On Mon, May 12, 2025 at 05:20:17PM +0100, Conor Dooley wrote:
>On Mon, May 12, 2025 at 10:14:14AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> The IOMUX Controller in i.MX9 family has Daisy chain that multi pads drive
>> same module input pin. Each SoC has its own register offset, so
>> introduce "nxp,iomuxc-daisy-off" property to specify the daisy register
>> offset. With this property being parsed by driver, there is no need
>> to hardcode the offset in pinctrl driver for each new SoC.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml      | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
>> index a96fc6cce502c10ab415e0b26bff1be8c3bc82f5..b5b2a9c8688a7f6525cdb6a32db22681f4f1a0b9 100644
>> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
>> @@ -13,6 +13,11 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/pinctrl/pinctrl.yaml
>>  
>> +properties:
>> +  nxp,iomuxc-daisy-off:
>
>Same comment here as was left on the driver.
>I also don't get why there's a property being introduced from something
>you can determine based on the soc.

we are targeting a common pinctrl driver for i.MX SCMI based SoC.
So that means pinctrl-imx-scmi.c needs support i.MX95, i.MX94 and i.MX9[X].

Each time we support a new SoC, we need to hardcode the register offset in
the driver. But if using DT here, no need to update the pinctrl driver anymore
when supporting a new i.MX SoC.

Thanks,
Peng

>
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Specify the IOMUX Controller first Daisy register's offset
>> +
>>  patternProperties:
>>    'grp$':
>>      type: object
>> @@ -51,3 +56,6 @@ patternProperties:
>>        - fsl,pins
>>  
>>  additionalProperties: true
>> +
>> +required:
>> +  - nxp,iomuxc-daisy-off
>> 
>> -- 
>> 2.37.1
>> 



