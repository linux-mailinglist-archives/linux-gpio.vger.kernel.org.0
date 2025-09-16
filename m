Return-Path: <linux-gpio+bounces-26222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC4AB59E21
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F2E581824
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D2927CB35;
	Tue, 16 Sep 2025 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IE1pZCtx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC92FFF82;
	Tue, 16 Sep 2025 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041200; cv=fail; b=ZsIwi1g6ftLhewjLvCHwm/7g44ImwWKzDrmR+upKecwQqAuZEj+8ewqo8pZBZKtKWoBmwqBzTpDPwescwpIM1YO+xxsudtfwnWDnYynGXprqZuryo8J2L7KaYyTEi1A7M8TavIPwCDLXvIw4R6voiD5YUVkCxA/LmMHpK+FmhUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041200; c=relaxed/simple;
	bh=JTu+esReVlmiGromDLtlrQFmkxRVZo+MJqz4A/X4LS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pr5z3+0j7y2FTQC8vBP4RFEiq7GmVBapUIAIKJu4pn78ShobcZmsxcdDyh54BfMKaLrm+/d+1bfHO/TouWmogDe1I0qurewZD7WvBgdk9GWGjlcL+D/KoS1CR+CDbXB2SY7nFZ1rHM4m/rsl1ACTY+/Do81bQB4QMKkk+glJ1qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IE1pZCtx; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dz7DOahraGZ54LvZy/mn95bV5IuKeAyedCUqaeTS3hz0+LeBwC+OteTexHRx/3BBC5yki52Ge6Q/li7caXiMt2kPNkKwENCgt5LGkYO+MAawt45oX7szaaFrKzckkkY9Wv/DGmxuC43g6xdLyjrA3oWzJqSXFr2+YlgtX0JdQaFjypN19gkgq64qNsnk0doE3wexC1elIX+CwlFX1koOS1C/a5uu/AOKPjxn5hXlxa0rgxe46GWYRYgjHD+yF7kfKaz1u+DUXr4j7TBE0mF8/VH1YRrAeVyNcKA8AFNCgsZ22K6vkqmU81aHecOWBEIDfY95aTGWdY32gFZ7FJ5oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlB0AQTCZ2oNxdYvl+MyET2PO3NmXgkqMJTw3WcWsfE=;
 b=MPt27ZIgoIx+IX3rs+10sSnjfpMu4HMqTwS/VE86SxG0c6+A4pJ7Q0ggxd1G3zDI+YO+xkpev9iNP+v1gzCNCoZUbrcmU9yrkX7Vs/Bodne7ixiHzaFdwcIaiAUhmDmgqlMYr+JSnpyBnmf9Y4aZ3WlWxa4GEjvxMmsyLL4hnKtQGUYPe/2ygvnWUjZ7lHdYR/oYuTvRuWJ5g9KrHJ5V84ck1d+NXXWUIHt+soE3BTamY2BlquLXe7tdUOO2cFK1kv2bSDln61h2jWKGcLwFuBTFzdkiW5hpX3OXpOBxYqCP/OKrrUP8HcDYxPPmHuPWo5kSdZoutuSpNZWQ/E5RxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlB0AQTCZ2oNxdYvl+MyET2PO3NmXgkqMJTw3WcWsfE=;
 b=IE1pZCtx9DqMMIoyUM0RFSgPd+fLQxuSVKjePmPSbqUeKkAE0ougdC9y/cWfz+FCuR8SONa45GdZGuIlt4TT3WfIpHYW+P+U38xbGr0yN0TTX+WE3Os8MfMa7aLE6+KU4sTtcTtmLIKS11mBN27KPw36U5Q6GigAucxd0O87XKIvMjco9ojKkgtXIWRlzxc53JkEKND6xg2bQ7AWicc4gIQ54Z+hsz4fhjoBZtFnzf8oSLODuefjns7tzuaGX3rqa7D9XyLWMR+pa0bmZ9AxXlI52U0hpLSgLZyFgAD1WcNHATWTZ87pUMlPiyQXPym7tRAPf1x7Uuc/IfcRNBJwAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:46:34 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:46:34 +0000
Date: Tue, 16 Sep 2025 12:46:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] arm64: dts: lx2160a-rdb: fully describe the two
 SFP+ cages
Message-ID: <aMmUYmIFOsue+rkK@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-9-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-9-ioana.ciornei@nxp.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 2050cc7c-b4ad-4296-8533-08ddf5409867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zBc05YgS9Tg+aE3HhmarLXC5dH8a4BTAf2M7ldPcUqIDbTMI/VqSNq7xisom?=
 =?us-ascii?Q?VeKXpRo7/QGOGcq/kEdMET5Bpi7JIdjXbwDwT6hcBpZdHM6PccXl+fZ/AO7j?=
 =?us-ascii?Q?EqBZmW8HXc5WEtSqby0nsBMklu+xTHTUK43n9ikxlUYzgeGp3PExv0unyexW?=
 =?us-ascii?Q?WbU2TUvZYDVy5e60pKOsSjabmNdO8xKeuh1y8YIGrxzFjiePGzCJd8EkmbKA?=
 =?us-ascii?Q?vkBloFOTH7NLgPZfQDVlH6QY+JtWJBMwSCxLhLLXqlV3+QMPX6R1uIQuaU32?=
 =?us-ascii?Q?8WloElNWyQ3LS4nzILVZAKWAYrRyiiMcvDwa529sVQuLMpftYInH3X8f0pzZ?=
 =?us-ascii?Q?8i+X7xaiNgeXotL0bP5d1x6r2ac6fHhIseEqjmg/33/ju4bLfSAfP0QkaAPd?=
 =?us-ascii?Q?RpoQedvtriZAyC1c52bHINGi78l6HFoNjP+8/ceAcQHVT9xNpbdyFMDDdssF?=
 =?us-ascii?Q?wLIHe9A/EsAs9+vjtXemIDMwda3fUQt1mniESQIj8GXJ5A2YJSVE8kFmY5hJ?=
 =?us-ascii?Q?HcJ06dCSe9a2zI+CeDOGDO/Fec0fkh4sosWaNGtgBXTMiyTrfpmSoMQhM7Cv?=
 =?us-ascii?Q?3O372eaOb2atXD4h6oYrXHtmPw8pu0FbvNSItLtg591AGKqVrQlEQhC5ixBJ?=
 =?us-ascii?Q?/XVceCsD/sxnSWBbUaM04hNsUGk4HNg3iHjB1b9uayJuCY/PGjqvMwKXs2n7?=
 =?us-ascii?Q?3Zve2c8+Ta1rjx8/Ch0RaCZqq8GZhSAkdOaf5lUdyQeNe5j570AWtXidHftD?=
 =?us-ascii?Q?n3bmM0wwePIkWZAcGXBkCvieX2cGYufzi6ZaZGWwnBUEVLxVVgLPOl8n88o7?=
 =?us-ascii?Q?O36Tw10D/fQC/Pedi0tydE03OGDc4AyTpYAL/CTju1oqvSzABGY7gZaweJgp?=
 =?us-ascii?Q?rZCecmIdW77UQ0nNSm/S49FgDw43DC4uuzIVNOGQUFYOKJFNgvcodCw/tvv7?=
 =?us-ascii?Q?yVWQWJfLD2hFModaZDQFNXMOZ85nzjcXoAZMttCgJFnNR3UgQ1AGIGq8a9N3?=
 =?us-ascii?Q?uOBJGNHXxCWXunxLunqPmy65PNUc8DZfWefC/d4lvv/x0u34jVzRLf0/Qk4E?=
 =?us-ascii?Q?baDf+BlfR/Kl0CD+CuZ0Q3u+9oiMvCyHDbIWLm4e+XPIsFnuJwGL/MrmJo6S?=
 =?us-ascii?Q?GkldyYeGZhilPjEjmhCMVgKmNWI38e/iVqDHjvbcwYuo8iKd17MPouOGA+id?=
 =?us-ascii?Q?gHY7cWQ6xY5GnRQMcvz9cx1zMo1yea+9GNwPxcyGLIBFuNUHfGeqWiKgJRgR?=
 =?us-ascii?Q?ZT/xUHa0e4TmpkTQG/dvv3X4UbVTKT2KXeM7BVXhgM0PX/lKTIWZNah+awdk?=
 =?us-ascii?Q?U605vm/XNdQoyiSbWXCjMoqrQAo6MyA44BZLNg0/SFq7w8Xmnm5aWsuwe6WU?=
 =?us-ascii?Q?AXT2kT+PZRR/IMUyDL1ahVbA4lsDXhbIM594iPGvnv3J21zZYFmY9EZV63pl?=
 =?us-ascii?Q?DYqGxER2cLYf2wMQ9xHvnwnRzphG5R1s+JCW1PCYqsBqvNFnLORawg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iqdfkshxe6xRbLow+3leA1iR9e6D5+PHcOEIfEtmlVvUHi1nWsPHI+eDkdJz?=
 =?us-ascii?Q?Ax5tg2zlhfPrsiO1cQ1Q8uWzcQqGIqMHm8WG2/c1+t0G450SB3B4B9RLtdrk?=
 =?us-ascii?Q?beArvAnMUegX/1q4juzLCSA5peeHHJKuuQ9y2HyNyxTvkgl4C0QSSBwVUmer?=
 =?us-ascii?Q?bus084fM8YF5//YmLr4Z2ztXY0V4ai9Loosyg9gdQuBUKUZiRGh93qSatmyL?=
 =?us-ascii?Q?rlWR0ZeuhYvwjn9R7WjJ6x0k+7gzfrPlRj+rD0wSwy37bZouVGd0wBaIL9p0?=
 =?us-ascii?Q?ziraQCnPr75+j+Cx7vE9GBT94RVJL987O8w5/7FaBcWtB9yVuGgOYdU0AxN9?=
 =?us-ascii?Q?lH+opKxm7O8C+d+YFg1qbeNb6XRn4HnJLgSLrS+oz1WJJgSn3kTsgzuQH12y?=
 =?us-ascii?Q?Tdou1zSKmDVucczQYupZ8RvBqBN+3gCHE1I4xz9iZprnFPVh+j2cqOdHEWGy?=
 =?us-ascii?Q?vTxbbTqJ9uCoT8P+WEISnloRhwJt3Bypk5UY/3hfqt0sBRrAoJWA9uzw+0xx?=
 =?us-ascii?Q?hAcDNmuapbq5XFADLtBUSpPISVX/N635xZaPwLZfrksAPRoO5hznARvWmdPX?=
 =?us-ascii?Q?ZmeSx5AoEBWmoNxGoAjFz0xVHTbOhZrxC/Q9UtLnamloBg1KWHGXePe9E2pw?=
 =?us-ascii?Q?AgvKAyFVZ7WV7fLMO4UTe9moGJHdHWrn9WqqYMtJBVkD5PDPfxXhae6TIjbB?=
 =?us-ascii?Q?11Tl1rNuMY7ZFLVFozvEls9o4kCFF+mJPr0w1TPvbHzNhlxUuyWsNHKoJ1pZ?=
 =?us-ascii?Q?4uhCXdfmf8ku8+ow27g9fhMLqknOkQ5hF0qGLLsq66tZhDqxez4qImgzg2gy?=
 =?us-ascii?Q?t3GZM2cMxm2/cvrr/RfmfQkK/HO6jRrjtDUT5J3wVcc1afBTvMGQUxvaSGxP?=
 =?us-ascii?Q?TOBTZEWQQqnm7idZNvk3svHiwZGypqi6VnP6eFsM0crmYUKPlDTNMgpo9BNy?=
 =?us-ascii?Q?PibNGYRXctxSz+h583yKFzdxa5gR5A0sqLLEX441iBG0tf+0iyq4rADE5KjH?=
 =?us-ascii?Q?Q+afFhwXHwYVtgsHlFlybIeN04g+35w0DnTzcs6NQ2fqZSY0A25I6u9Txcba?=
 =?us-ascii?Q?8GUv2RD4Jkf3cL8QFZQs++IYARehrdLHlyVHbNK0QxyUsFSD1H9VEKmY07ya?=
 =?us-ascii?Q?kZNuA6U+Fqrq/LuuNqHlvFMZQ8aAU6RSZvnZhf3L09Sj85vks85j5HqD+8VB?=
 =?us-ascii?Q?BOcfls9q346XilJ9F6oSJqJmyZcEQxWrw18g0PWhs56d4/shO59RgJT1HCui?=
 =?us-ascii?Q?RVtI3q7gVrUyFw9zblmhgztw/63nSXKInoFSY7P+TRAiI6B12Fr2VAmWTlYd?=
 =?us-ascii?Q?PEMT1DLw9ZMH82lUbsY8ZWHLxEEl4LV6+fmo+QPOhKfM0tpdk+Lm+MalA5e6?=
 =?us-ascii?Q?K1pFfONWqdeFsXkXpR9wphy+H5QAE3JFl5oVWB6rASQXPKjYmXFeEWUa6kqG?=
 =?us-ascii?Q?JVJFKRvLMJX+BRLGM3M44+o9eL07Z/b72tEdBtPCf6t2YXQ8MEoL+vqSkYRu?=
 =?us-ascii?Q?3cz4eSyvUAZTjEylIiv0bpRoY+RAOZitb1LmE3yGZHTg+WwjfZI/jP/LbYGE?=
 =?us-ascii?Q?aedC8Vx/ONVOOXrQk10xzqBDIOLrIq8wmtvY5E5M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2050cc7c-b4ad-4296-8533-08ddf5409867
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:46:34.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfUlbcOl7yllBmkKZ+dO2Q2bk8ChqAnLwxPOo8ay532aSMs0lq6hurXsUbe06KK/4te0XnFUdREwcdT0G7Iaow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

On Mon, Sep 15, 2025 at 03:23:53PM +0300, Ioana Ciornei wrote:
> Describe the two SFP+ cages found on the LX2160ARDB board with their
> respective I2C buses and GPIO lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - none
>
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> index 4ede1295f29d..62329a93a67a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> @@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	sfp2: sfp-2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp2_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> +		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
> +		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sfp3: sfp-3 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&sfp3_i2c>;
> +		maximum-power-milliwatt = <2000>;
> +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> +		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
> +		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
> +	};
>  };
>
>  &crypto {
> @@ -236,6 +258,31 @@ temperature-sensor@4d {
>  				vcc-supply = <&sb_3v3>;
>  			};
>  		};
> +
> +		i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x7>;

reg should be first property.

> +
> +			i2c-mux@75 {
> +				compatible = "nxp,pca9547";
> +				reg = <0x75>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sfp2_i2c: i2c@4 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x4>;

the same here.

Frank
> +				};
> +
> +				sfp3_i2c: i2c@5 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0x5>;
> +				};
> +			};
> +		};
>  	};
>  };
>
> --
> 2.25.1
>

