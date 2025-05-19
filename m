Return-Path: <linux-gpio+bounces-20299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44ADABC4F9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 18:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F2D17A994
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 16:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAAD28151E;
	Mon, 19 May 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P1y4Y6Zm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EE288528;
	Mon, 19 May 2025 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673653; cv=fail; b=ay79IHMi8mjaogfcQ9YJWoAM/xpsaTQtGPXUuoEz2qekmjK3E0Gio7ZMYvYmRjJzpF/ZWL5nDg/iP1oeroDYk6eDwpY5IaAn2rafxDD7q7aQ8Yk+4sOJtoNkw7vV3g9KETUIi4uKwjCoEX6Mr7dHrw1dQo4AhshcbpVvdmrtX7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673653; c=relaxed/simple;
	bh=OHQNZXLF4QiHcAVdTlJERSGH7zIopMBs647K0sYr+2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QE6xaaNQWvQJg/afMyo4aLOyf9WZuaKqqvCvUje00svbgTLR2byNvF2iieiQ8c+P9nsDRfDeO4yLMzvlIdz80lR4z4R/CmESNHQadM+npr1r8lQtqaJuY6EMi5zdUYDxRUyTbe1KPf7P+wiywj/jsxw2puAkLAL5YPPhmGltBMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P1y4Y6Zm; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bref3QJic6BZukm9nQrbhDoKFoEYDH8pg5JhVpSYtPXZSiu5FnIn2HZAS8lddZ2dqP+KemcnBMK//fGPeLvt6YlAd/LfXm2YXIkNwzJhoOZmOgInUwQYWn7lUnI3brIzVBLwe1n9SSSS4JQZdt0U5I/NwPOz5saDGYTHRCfIBj4vd0VT5DBqDyWLnXe5JYetp1FeNtlf+i3FD5RcfqG+1itHF0ZHLfstWW4PvVEk7bP/8aQVhjBkmYkMMIqYAx+EOibX9s5tSP4t0yFcwoyHJMUE5ecUYxUzZpEdZe4d7OrVVJUsdf0b+GbaiUC3CNhVwQWOYIZM5llNquTbZ50VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWXEOXyTDrt1729ZnvtJ7cL5/Nt4XayWy53+MTnhq6s=;
 b=LCQHtmoBLX6uqqipPqUUsufv8Ar1AkyrQ0QApK8goiOfqDlCddIiCBLVR+TAcNglZYI1rE6pjJ9ExSVbpgTAlb+SXgO0kli4duJ+1n8KY9fq+aXyLh0o8Vn8KhD0OW11+J+f8gqaFciSvywxP+iwFjb007zCy5QYGJUdOtVnWwF88q43DB608GZ/FxLtMi2Mv3QthPS6zza0i95/79nSUq72jmvc+1X7J312pXwWOAnZboIF0/uL1pfu92IjweM8mT/iYHqaCqRG+Xg8y25QMuTki95VDAW3o7PNhsISCMq/KTHXryR13dxgcBiRVe/QulpGrX7+T/yXiAGK8SZ2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWXEOXyTDrt1729ZnvtJ7cL5/Nt4XayWy53+MTnhq6s=;
 b=P1y4Y6Zm8WDA5RuU1JJM6UY06buBFoKE04M9vNtznw7Bu8A9uHp2oguljZGrJmNWcVhHm2cX7pP3SHaiz+IzUTiS8XFQUNEbm7j2KPszv3qj7aFaTHJLywHm7ZzrZlrQa92+BBx0WxbZ3yYklaSGa3J5t1Its5924LJLkdlTP8RDbUpBf28UR+eYRSwjbhTr9+MFfckkdDBBH8R122mCuJVIRWvAhragPTJiRGkjVqAdg8LYsOALeFf5FC3LCq8xTC52Rui3k0+7ZQTfxXMotYcKQHm62j1iVtVZbV2eejMAPhOr5d87aJtR4G1WqNBXB3r7v6PlnWHaUDLPWkzV4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 16:54:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 16:54:07 +0000
Date: Mon, 19 May 2025 12:54:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aCtiKXJNRUGTMEE0@lizhi-Precision-Tower-5810>
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-1-b9e77173e9c5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-gpio-dts-v2-1-b9e77173e9c5@nxp.com>
X-ClientProxiedBy: AM8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aefd28d-2d92-412a-2528-08dd96f5c503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mw1xzNXq2VzHr3UgHI7U5dQXdFmDVBIWoFmz5Dslcm8x2XQtHGxK7ji1ApzF?=
 =?us-ascii?Q?DsjPq2Sd16odnribrx60uMhrW9ZQzqnEdAEgM/vnx2ShP2WwXOnP6E7RbUAC?=
 =?us-ascii?Q?lLkxZ49A2O8j3UpISQ1lSiy7QMgJGWYg3WqUWqCl8gCbN66RzERXQctqeyG1?=
 =?us-ascii?Q?zLU/WpesT5a7Pwf4o75aEOw6AMxYvJGtpv5Xf1E1gAvU3yY09VEz1Nofe2rS?=
 =?us-ascii?Q?MnczujQ7ex6m9h0EmjAZx4IWZjo8i3Y2tc7Fpzf4uhbHeWF6NOI5SyrOQ0Qq?=
 =?us-ascii?Q?m1j9oGGydlvV1RyFcPa9/4zVHPo2jEfy2DBrs52eJH1CPxHg7Dil9EG+WWgs?=
 =?us-ascii?Q?cFKLnWgv+ndIV6gtC8uCB4/7edZXm4wuQUEvdz6d18iMr2jApdZIit7mPh3R?=
 =?us-ascii?Q?YoXoWfSkCJuu1XJ+0RxUcUwYPecXKOU3ezYb9l/oYM16d0PjGkai0ty3Sk1Y?=
 =?us-ascii?Q?HVAd61CKvRlAT6GWx13/ngAeceh0ZB0FTNJUfF5vnWO4zFP4Te5b5ZHzs/aJ?=
 =?us-ascii?Q?0FDSMxEqti7pP0hc6CC33cnNaTQDOITTYECI2PQU7UrDgTaiTYaL4hQpcawG?=
 =?us-ascii?Q?OcUMndwJBjI3L7sTZBsNIHGZSSvs6BnXDfr6XORlDRPBk7HVdR+KsdBOVFkg?=
 =?us-ascii?Q?ap7FKBwD5X0hEdDPjWHybw0gsxQ0UFq8MfobqnT41AUp3ahezJ0HMFiSm9Zt?=
 =?us-ascii?Q?AJK0CP7DZtTYIw2JV0umivS5PwziOaTfnt0Yj5J5WyahIaKLN99x2Kkkokc5?=
 =?us-ascii?Q?8dax2hG28+9+NZZIHa7TcngLAIks7H3msewFVqavOYEnWWgLIzSgIqsc/n+M?=
 =?us-ascii?Q?yUlLCUK8EDeAoVHx/Gr2b1sL82lwnONyMElf5UonsFsUq3I+IlkuZ+pxyjOM?=
 =?us-ascii?Q?+L1+rdFiH3xoob8bWaJIzDoUsv1uWF4ARNoIn76CWOwfSXXYbAKX3Nguzi6q?=
 =?us-ascii?Q?dsKFGwM+6JB2PZ4cWyH5vYmR5GCmKhtT5oIVhPLf4JfFIXzepTnp2ywLzSyy?=
 =?us-ascii?Q?kSDcnIduhLtclSsGscxTHDknOtiUqeWt8Zzu86h4ZqPt/b/ZbqldIO89AmVQ?=
 =?us-ascii?Q?Ropviy1B54n9Jn2JGua2C1xeUhsJKbl8Ghs7EK9jy6DJM/2wjV6MNKNRmBIw?=
 =?us-ascii?Q?nIz5chac9r37kNORfkwLcZmfXp/U60m8qtI+YIn6W13BFcaCCgkhSX8n01rD?=
 =?us-ascii?Q?q+pmHx+NcfrkTNG0X7otCYbURsIZLWfAv0S4sPghOI0nsr/EcfQPYT/VV3cd?=
 =?us-ascii?Q?adMpAeXfj2C6yyz7t1Y6J2aZkpbWLWrAqdpMERpZJV/eodQBoct1scfxT98G?=
 =?us-ascii?Q?4A1pBR+9q28M9AlpsF7yJne+YLup3MWE5wZ0CUlSl4JBmD3kU8zSZ/kyFT8z?=
 =?us-ascii?Q?7t+yhwV7YZ5F+wkSg+ZqCQr274tMnq/iOL3i8H+cSBOo5lelm4mbkRcSk0Y6?=
 =?us-ascii?Q?Gpt+iChMsGpf4GVTdGH5xtGrWse0bP65aaCXc9FQ8NPg6AiRQOR7PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZX+w8mmTqHsgxsI7XlP9SPmzY3t844zqsDkUYtbzgaW0YUJb0DvfJqNAXHrc?=
 =?us-ascii?Q?m6YIoTQXdwbLyc/LhYMhRa8bim6j9AWbVHFkOviGVek30dhV7r91khVYIGrB?=
 =?us-ascii?Q?GYstvw4IhwkZBO6/SVh3L/X1++Fq48xXIaIIehR4Z+lO057h6cbjv1iGlE8s?=
 =?us-ascii?Q?7ZdTZk2hCtjJviJ0GYtPXG7bHlu85SVCl9s4N1m0iYxC8wbfUvM/Ptz+xKwz?=
 =?us-ascii?Q?WarO5xn+MhuBGbmBCYDdQwzJAOKH9uNsqyZmQBSjIzRrSdyQUEj32yXRXLEw?=
 =?us-ascii?Q?ns3LL6lb1FT1TTpI2JIvWlHjBi+F9LjeNXG01SgxE/Q7RowxyRrt1TxCbb/A?=
 =?us-ascii?Q?mdiMHKn7imYt8djMt3fGAb1aVW7b5JjuTC7AKhxVzOrIJKtjkdWc07H8Dg+g?=
 =?us-ascii?Q?sqYrNzqSRpWhmaQf4XSOkPPdErONKMOjVTGQUpowYoNBMAXSsWVit8bzb+iB?=
 =?us-ascii?Q?G9uO3dCo2JJIjdZnv01GLEI7BKTZmzZ5kxt1dPVy15JgKJzCHe7Hhi8wN0wF?=
 =?us-ascii?Q?ZkvktpgU/lG+wln4XPScjlU5dGJaZX/KLG8MEQDbdkPoyyNMP+cgE0O6+bm1?=
 =?us-ascii?Q?evWwrhi4ZIUBREYEI/rMTv1/yVCfQFF4pT7JTr7qHBzBXSk3ab1WXrx0Is7I?=
 =?us-ascii?Q?68lEpbiqOqfxhxH67GCrk8uiOSMPBrEluNfLvv00j/fETfmlLIO03N0Z0sbC?=
 =?us-ascii?Q?+djeifIdqEm1afQZN4MYdeAddSZmse0vMoornRK2kmk9ExRfyU9l4kPB3qr7?=
 =?us-ascii?Q?eQ7Gx6pbqyzr/JGL1EFFjznQhp9Q0jzurDAbj/XP2GWJde9pc8HxbgeAZoP2?=
 =?us-ascii?Q?x1AK7DG/jkadaLeQnbpEA+jbrfIdWd4jAbpY45FF6KO9Z0t5ftHuRp9BRbuA?=
 =?us-ascii?Q?aAAUNWR24554hPhbczy04n0eiqUNWDJ8uPpjNUAFS81JLoR1R47iGtmmASGj?=
 =?us-ascii?Q?Naipg70JTzmPZvgvK50OGLQ64uW1sAUNVtDv3biKSljBycckEqKMon5+fnQu?=
 =?us-ascii?Q?qM+rdgowKl4R3TIjGXqj18GamwzL5W4FqFr0txmcsuiRomxeAeRTuVh8AOqG?=
 =?us-ascii?Q?UuX90XBnXvjxbJBE2uIs3LRIm5qbTEV8tQHND6cSFqi+JEYa6/ycWQXT6eiI?=
 =?us-ascii?Q?db0JJ4dcfCdrWsIJH6DZIDs4dynBBS0EdeeBWVY7u6J//RbIcCRQHNDOaT5f?=
 =?us-ascii?Q?llvrNo7kAJCbqakfehscJjQk6BlsZ9hlwlkZQO6zKveXZgz9MR0jsIZNrgjP?=
 =?us-ascii?Q?SuCnENy50gcDSu8g9nltvoiY5EW/Z0iWCgnHR5JvsWkwkvoqFgcuEw1b34Yp?=
 =?us-ascii?Q?baXGCxBljr3QlFlJjW+YmQQuUKGaImJaqNyB7blrBWI0X9E+EePxaroWhi1D?=
 =?us-ascii?Q?WH+MoPJkmpBc6wMLX1Nhrf4EXa1HPcYn1C1khWqNb+q0ILNrg0KyMtGCXK7U?=
 =?us-ascii?Q?WFa+ehM+gxKdTU0TKfsjHOKM/3czoSofJW+9Pd++xnHXgAzrtYViQKmCKYG6?=
 =?us-ascii?Q?7UP7DHVRkalBnLzkmTxcg+NYt5YvgqJbRwW228qYvhcDvAAfcj3XZf1mRaL0?=
 =?us-ascii?Q?GFDTFblzBeaCgOD8QIF+UsLqZn9+UapL1FkSFBR5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aefd28d-2d92-412a-2528-08dd96f5c503
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 16:54:07.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIUa8hrFFZkccdeMy4vQ3/RDNg8KhQfw4iD7iYvN/vesfjnQxl+jG+0ZoxIjSNpMouRV12Hh8miOJxxkLm28+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On Mon, May 19, 2025 at 02:03:42PM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.

After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), the vf610
GPIO driver no longer uses the static number 32 for gc->ngpio. This allows
users to configure the number of GPIOs per port.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
>
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi     | 4 ++++
>  arch/arm/boot/dts/nxp/vf/vfxxx.dtsi        | 5 +++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
>  arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
>  arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
>  6 files changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> index 3c6ef7bfba60986b797bb01b843830d364c96d45..880b9a4f32b0846a773dbf9ad30715c84ac2fda6 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -399,6 +399,7 @@ gpio_ptc: gpio@40ae0000 {
>  				 <&pcc3 IMX7ULP_CLK_PCTLC>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc1 0 0 20>;
> +			ngpios = <20>;
>  		};
>
>  		gpio_ptd: gpio@40af0000 {
> @@ -413,6 +414,7 @@ gpio_ptd: gpio@40af0000 {
>  				 <&pcc3 IMX7ULP_CLK_PCTLD>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc1 0 32 12>;
> +			ngpios = <12>;
>  		};
>
>  		gpio_pte: gpio@40b00000 {
> @@ -427,6 +429,7 @@ gpio_pte: gpio@40b00000 {
>  				 <&pcc3 IMX7ULP_CLK_PCTLE>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc1 0 64 16>;
> +			ngpios = <16>;
>  		};
>
>  		gpio_ptf: gpio@40b10000 {
> @@ -441,6 +444,7 @@ gpio_ptf: gpio@40b10000 {
>  				 <&pcc3 IMX7ULP_CLK_PCTLF>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc1 0 96 20>;
> +			ngpios = <20>;
>  		};
>  	};
>
> diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
> index 597f20be82f1ee044e14bfaf3bd05cff37a8ad39..a275821c35d41e97eb2139a081ef5765d07672aa 100644
> --- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
> @@ -318,6 +318,7 @@ gpio0: gpio@40049000 {
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				gpio-ranges = <&iomuxc 0 0 32>;
> +				ngpios = <32>;
>  			};
>
>  			gpio1: gpio@4004a000 {
> @@ -329,6 +330,7 @@ gpio1: gpio@4004a000 {
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				gpio-ranges = <&iomuxc 0 32 32>;
> +				ngpios = <32>;
>  			};
>
>  			gpio2: gpio@4004b000 {
> @@ -340,6 +342,7 @@ gpio2: gpio@4004b000 {
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				gpio-ranges = <&iomuxc 0 64 32>;
> +				ngpios = <32>;
>  			};
>
>  			gpio3: gpio@4004c000 {
> @@ -351,6 +354,7 @@ gpio3: gpio@4004c000 {
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				gpio-ranges = <&iomuxc 0 96 32>;
> +				ngpios = <32>;
>  			};
>
>  			gpio4: gpio@4004d000 {
> @@ -362,6 +366,7 @@ gpio4: gpio@4004d000 {
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				gpio-ranges = <&iomuxc 0 128 7>;
> +				ngpios = <7>;
>  			};
>
>  			anatop: anatop@40050000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c208869d11d7fb970ac84638f45088..13b01f3aa2a4950c37e72e04f6bfb5995dc19178 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -686,6 +686,7 @@ gpioe: gpio@2d000000 {
>  					 <&pcc4 IMX8ULP_CLK_PCTLE>;
>  				clock-names = "gpio", "port";
>  				gpio-ranges = <&iomuxc1 0 32 24>;
> +				ngpios = <24>;
>  		};
>
>  		gpiof: gpio@2d010000 {
> @@ -701,6 +702,7 @@ gpiof: gpio@2d010000 {
>  					 <&pcc4 IMX8ULP_CLK_PCTLF>;
>  				clock-names = "gpio", "port";
>  				gpio-ranges = <&iomuxc1 0 64 32>;
> +				ngpios = <32>;
>  		};
>
>  		per_bridge5: bus@2d800000 {
> @@ -855,6 +857,7 @@ gpiod: gpio@2e200000 {
>  				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc1 0 0 24>;
> +			ngpios = <24>;
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 64cd0776b43d38219fee312baadd4665674a141e..52be83a168d9ee6452a63039c89169d49b63eb60 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -1197,6 +1197,7 @@ gpio2: gpio@43810000 {
>  				 <&clk IMX93_CLK_GPIO2_GATE>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc 0 4 30>;
> +			ngpios = <30>;
>  		};
>
>  		gpio3: gpio@43820000 {
> @@ -1213,6 +1214,7 @@ gpio3: gpio@43820000 {
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
>  				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
> +			ngpios = <32>;
>  		};
>
>  		gpio4: gpio@43830000 {
> @@ -1228,6 +1230,7 @@ gpio4: gpio@43830000 {
>  				 <&clk IMX93_CLK_GPIO4_GATE>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
> +			ngpios = <30>;
>  		};
>
>  		gpio1: gpio@47400000 {
> @@ -1243,6 +1246,7 @@ gpio1: gpio@47400000 {
>  				 <&clk IMX93_CLK_GPIO1_GATE>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&iomuxc 0 92 16>;
> +			ngpios = <16>;
>  		};
>
>  		ocotp: efuse@47510000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 3661ea48d7d2994df7b02084e9681beb303aa133..b8ffc428e95be1938bf5e73316b4163acaa04701 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -785,6 +785,7 @@ gpio2: gpio@43810000 {
>  			#gpio-cells = <2>;
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 4 32>;
> +			ngpios = <32>;
>  		};
>
>  		gpio3: gpio@43820000 {
> @@ -797,6 +798,7 @@ gpio3: gpio@43820000 {
>  			#gpio-cells = <2>;
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 36 26>;
> +			ngpios = <26>;
>  		};
>
>  		gpio4: gpio@43840000 {
> @@ -810,6 +812,7 @@ gpio4: gpio@43840000 {
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
>  				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
> +			ngpios = <32>;
>  		};
>
>  		gpio5: gpio@43850000 {
> @@ -822,6 +825,7 @@ gpio5: gpio@43850000 {
>  			#gpio-cells = <2>;
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 108 32>;
> +			ngpios = <32>;
>  		};
>
>  		gpio6: gpio@43860000 {
> @@ -834,6 +838,7 @@ gpio6: gpio@43860000 {
>  			#gpio-cells = <2>;
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 66 32>;
> +			ngpios = <32>;
>  		};
>
>  		gpio7: gpio@43870000 {
> @@ -846,6 +851,8 @@ gpio7: gpio@43870000 {
>  			#gpio-cells = <2>;
>  			gpio-controller;
>  			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
> +			gpio-reserved-ranges = <10 6>;
> +			ngpios = <28>;
>  		};
>
>  		aips1: bus@44000000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 632631a2911224cadc16a943cdb467e091e43384..a2f4fcffcde59849bafcedced3ff317ca6c7cf78 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1152,6 +1152,7 @@ gpio2: gpio@43810000 {
>  				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&scmi_iomuxc 0 4 32>;
> +			ngpios = <32>;
>  		};
>
>  		gpio3: gpio@43820000 {
> @@ -1168,6 +1169,7 @@ gpio3: gpio@43820000 {
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
>  				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
> +			ngpios = <32>;
>  		};
>
>  		gpio4: gpio@43840000 {
> @@ -1183,6 +1185,7 @@ gpio4: gpio@43840000 {
>  				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
> +			ngpios = <30>;
>  		};
>
>  		gpio5: gpio@43850000 {
> @@ -1198,6 +1201,7 @@ gpio5: gpio@43850000 {
>  				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
> +			ngpios = <18>;
>  		};
>
>  		aips1: bus@44000000 {
> @@ -1508,6 +1512,7 @@ gpio1: gpio@47400000 {
>  				 <&scmi_clk IMX95_CLK_M33>;
>  			clock-names = "gpio", "port";
>  			gpio-ranges = <&scmi_iomuxc 0 112 16>;
> +			ngpios = <16>;
>  			status = "disabled";
>  		};
>
>
> --
> 2.34.1
>

