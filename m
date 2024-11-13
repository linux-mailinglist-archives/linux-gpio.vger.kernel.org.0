Return-Path: <linux-gpio+bounces-12984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AE9C77D3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 16:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65DE8B43932
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF985218939;
	Wed, 13 Nov 2024 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ncnJqAvD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C77080E;
	Wed, 13 Nov 2024 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731511583; cv=fail; b=Zr6XarYHwyt29CR7RwZ0ScC5uFFq+i1twjJub86xMQS5LNc/sGyYv94TFr7WPLxV///yj1Bxtyxbi3GTN+QyQrVf1qUrI/+j19y0OJNXRbeQm6cSnFouTXiU0sEPdryTzfxLOZDaYEQUsbbIhjK2KAhCrSOaePpmxB+uSUpdPBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731511583; c=relaxed/simple;
	bh=9zeMdEF6lIUErPMEduTDfrINjw1F2aZ9TXicMQZ0Gmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=izrocyQGkUtOU4pC+sWeEJoyO2piCENauTSp5T0rXA7q540DgAfKqwyB0N29KZjUUbjb+xnh90K1TV6HTuYziIpX+Rw98N9DMriKoyAVGbUFiIv2DVjqskZ1i9T7mDP8o6N1thJ828vamwbLF3tcYRdUO/9aMjG5/uI/a/YD9uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ncnJqAvD; arc=fail smtp.client-ip=40.107.21.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJDHMAMrN6xy+m8g6AkcTV9F8AbxZejrfNSw3IQIFtw9wCrGLVEqlDWzqVwKHs9RPUabWjMdBrhGZj1eOs8AyEZ91LaNB9h9IcuZUId7fq0s9fuJOw6kvTntVNe9lX6RDyPlcP0cwIEdYMrbTyywe+SkGQjzuhW6wNqiwpBhVjPcrGHsJW2wuk3P6Np1kTI8bnQv6VzmW02Z3/ihUDzFCnqrG7/mBc0bUiNWdFKcGxkrAszo9T/NPJJxMhdfcpQmquvoBH6LmljjAZFP+2otbf2z2vTsYxwKmyYNlhJnwhV+oCLRoU/5JgJvP2sFchSkc4klUsb9YNADnntPIulSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWVYvGeSKKBkX8OnCLGLvSjd0lyP5dTVTlmN/GUEsOM=;
 b=R4ZPUNR/c6MnsFOXZh2YSWUVD3Kil+Uw/xzr2Kr0yNPHtwr+ggePSnD5Z2shU1DrUZKQJkJgAejMFBBQMkHQGr+J46GXIHHk2expM0OjO5AcgIW0owOucRLQGNBbIYa8Qg4xRvx3+8n1LlIAG1vCbSjcOp0+94ZGFY88LStHEyAc7a7OIPUJ1pJsLeZHXVSf6GY5g2HM05gSAQNbgjZTvTdWGIfnXbqZc7lOIm+SDxesuOFMQLfbDxpJSuRbAEsVs0C9A6L17VWkoMlb95Z/y69uZcssacYcAhnEH17yjrES69SCu8lnSA07v6dxHTYM7VUPAG0qk2hkSANTSd4jdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWVYvGeSKKBkX8OnCLGLvSjd0lyP5dTVTlmN/GUEsOM=;
 b=ncnJqAvDBx7a7Ct9bXBgg/ZGe5GLN07K92sFShUcM6V9nrVCM3MfupqA+Mj/th0DvVl+xb13JySXhPiP5cxRwd5NsAh1Hab9s5f7Gctn9m//OW9jlf7f/x+oav9t+OQWFlD2zTo7lnpvGvuHm13+FEmtAvUrUX/AnilpMTQdiWnM8DGEgDGmCXlYBYdqiUHtLIRUtEs9JKRNS+NfY8XV+Jh+ahzug8FMjr+xLuo45gk8vW9bjvtMnEdOqPpTvEmrrM+tWNWOHku2xtl6cSW0VS94u1HeUo8OAoiOC4fXlJ5zGt2poI+3mRuu/stX1PC8heJG8ixEdf+h0Aydmt4H8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 15:26:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%3]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 15:26:16 +0000
Date: Wed, 13 Nov 2024 10:26:04 -0500
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
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <ZzTFDPxPvmpphTdb@lizhi-Precision-Tower-5810>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: f904004c-8464-449f-0ede-08dd03f78428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OakSUgCRvpue3F1skZuDWl4TNDA5tw/z09uKWJtGl0e4EX7RJyWZzBLZxqvM?=
 =?us-ascii?Q?AuouS2KMQZNNck5IRkiMKFFAE03PCaIRzIOmuL/PKuyPT8PzaD4ixmfBZ/AJ?=
 =?us-ascii?Q?suYv4OwPgG9R8efR0MTyoqa66JjKqYxXQArFdDImi7yPkUiyRXxF9VBO5sDL?=
 =?us-ascii?Q?YUo2NRpnuz1K/hs2toVI9DaBBmk/1rDSqKuUEDajuN/1mXE1ZNIB6fGmy/cA?=
 =?us-ascii?Q?iYrT4djbV7y04dfxVtiVeWJZzJCn7Va9aZxlPtChFmq1qGtncpjHLoh+HaLb?=
 =?us-ascii?Q?Uu4Hgaoqx4QbW4bGKmzX6DLPKsWX4fLQaEwE1qCjriI2cSsXeDmrO/Gp/EvW?=
 =?us-ascii?Q?UJMvx9AFFG2k/vYk9czcF5EFrHMIVJ1g9UyIUu7Qp3HeWN6yQwiAzfZNypu4?=
 =?us-ascii?Q?+F8Lltl8sOzRsQXGjKjaz/oK+55dlOgCtzSGde8Fb48dsQlsYXGzsvXdjE+j?=
 =?us-ascii?Q?axbzDtJeyky9in8mEhsFx+piceJrZI/1+f1DZBpxF+xAD+DdWDF9KVMRF/nn?=
 =?us-ascii?Q?7WJXf5sskJFcXzXWe+zAUPP3yvyqhykd/bnkW9//GXhLSHwQurPD4vHzW+WS?=
 =?us-ascii?Q?spP+r+3MP+ClZdIzgd21iqtvX/AXYchlM+dtDK0V005O0g2cg1Ap8R6NcGZO?=
 =?us-ascii?Q?lfGKqCqGgRAq3xAX1BwyBlEHLn+LYgzMgxPcnNlveaath/vmvojsLCF9Mfbb?=
 =?us-ascii?Q?uwiWmql7HwRXCmmk8GIeHGROVcCPRJyUgmaVH60M9JhXRV2Gj7Wv7/G8lHr0?=
 =?us-ascii?Q?UsM/nIIpuSiq/soDzDbSSj5oIIFBYXTWY3vzhXhw7UVbYfXHvyjCW8QwF+gI?=
 =?us-ascii?Q?g4kd2xPb8Nld7YjB3bQAzA5OPm9JatGN2soiod5oJXP7erXpC0WEzlyc4AyK?=
 =?us-ascii?Q?9nwyfxwG2a2oCmzzl0/ZUFA0xPcXWMJ4bLJbZVSlbpiL/j2VA0Jb/oZfXOUI?=
 =?us-ascii?Q?KpVCM85uGWCYY7g6QAaOZqFRF8JtLPscP6hRIz+aN3qQuaBT+dxKuSCp6J8Q?=
 =?us-ascii?Q?D/qXUN2p8Yn2MwXQmuV8m+pZpvId/vLHzoI/aoYcpNiVoI/PUwaboHzuBGsw?=
 =?us-ascii?Q?epfjACLLbkoPpMEYQu5RZnbSMYCguXKHCHZ427Qq/WXwDxdxRp17Fi8SkKBk?=
 =?us-ascii?Q?bhmZfepCQ8E+Z6kahQx1Q9GG3o41TG9saGgqY0DF8u8AkA/GRZpOJimJ0h72?=
 =?us-ascii?Q?q2eYMDQjAKfqURTAeAZ+fqECOJCfJfH3+xFSPMP2h5PbFjUixe0+v7/DvlDO?=
 =?us-ascii?Q?ieI+jpKUJQCFxVdngB20Lme1X8+0RcyHHDSFMhH2H1A9XNCu7MXnGLBJrbkT?=
 =?us-ascii?Q?FcN5CgmUDyvpLjVHPvPcbIfk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XuaWVsTQxQW9AO1RAZ5Pq11YgM85gyIG4QGDspVhs7DMIqmaAZdXsY3JLT/+?=
 =?us-ascii?Q?Orl5eEPj1NYlSK1QCvTwxDsxt1T8QhyD7r9R34AGDuea2peR+Sr5rgcakG6M?=
 =?us-ascii?Q?0LH2NQngC/xFPVgjnfr9HG4vOTtt2YZdsIztGtyEuFVTKzzBP8jVpNvSGhIK?=
 =?us-ascii?Q?c0yg8rKHHfBQyBipT4NsUDgncbfso4kZ6NQU7WrLe9lmPSi3yCzVGQ4/VJ8z?=
 =?us-ascii?Q?gdtCg4NlP1Kyxek+BACGBrQKAljzfvHej7rP9z6Vc6r5SU8GsLPPXUC7P/LZ?=
 =?us-ascii?Q?oorj/X2oKG5FK8j4SaL/4JcIIzQXxiIJJT2mKGJf8rI48aHALwxiEunBhQHh?=
 =?us-ascii?Q?lFYgC52BYyu8OcZ/nmIcUcGF3lrGtV4AECEYFP7E4m7y1amcAXr0qPshOqQy?=
 =?us-ascii?Q?K2zKfTT6gzp69Ufkj7onK+SxSlYo1QOBEhPMU9E3h7tVlrm3U0cKxfVW1Rx8?=
 =?us-ascii?Q?ObYfPE61tnrL/3s/+zZ2sCox1pTshvtIqg/3EX5LEKyrdN+86nzJPY5jXLG5?=
 =?us-ascii?Q?p9BbL6/yPTyPEap5C6HSBzCtNRL2+dayU3hIWRrq8O+ptPi236oUP027xT0D?=
 =?us-ascii?Q?oqNm0thHaSB04Wp5Ff4W9svLu0lERpt91ByYlmmDNp6x9buuM1x2m4CVbEky?=
 =?us-ascii?Q?gMbx/8OZHpy0Qx8iBuYG2kiF3y0DWWSEFqEwoGGgFw0RlsGGW8uKXHtHfINI?=
 =?us-ascii?Q?g4qZNzcZSxu5AG5wH7bOfvlHsWgZFYxUy5HWhXOSDeO0BtA/xguHs+20zsPg?=
 =?us-ascii?Q?kEfDswfsMbCa1R0BsSRO0387tsl/RWoEboaM6OY20ST6cuohtxF1+DIqFdPo?=
 =?us-ascii?Q?lr45p6/PR5E9TRfody6VTmNLXlQRu7cp2Z6KkTBV4ww1TZAgMOElny6qdJ3+?=
 =?us-ascii?Q?zfQWbnvHcJ2YSVrJOw/UOfTdoLnhkYs7qwymwJD4MIWvDsEiEM+mIGqAJ+ll?=
 =?us-ascii?Q?nwg9elhBiqovT0ITmJ8s0EUc3uZL8y/9mdZ8rdn0+ggB4Ce238Ra4UyNkZXL?=
 =?us-ascii?Q?ECunRopk0LQMzJ+HU3TFtPQnyD7TNTy7kjKku5N5t9ZYToM5abXO1cp0+rX2?=
 =?us-ascii?Q?o0QOBt4PD8zmoOXCxvKIHd1wd0PzInwgaGq433PshiOxoF5GEbsEHpN/vr/9?=
 =?us-ascii?Q?osRUrbSPIIcp8XUmWKctoexduNtHPjfWOpq+QmNtoDCJKGNh3TUBzmuXNa9y?=
 =?us-ascii?Q?BZ4Bp/PN0OSJIDzakKtDqvsPXusn/hrdm8yjnyNOkh8BFc6OpNpgv7OJag6o?=
 =?us-ascii?Q?xtNXT9xVki0YgNk20Kj3oQ0Rq1la7weZGrJHTF8HdFj7B1C5RVapPxi0ktTW?=
 =?us-ascii?Q?wwul5wcZzGSegadMUKKc5wQ1Pxgfm1zaIUcz/t5Mc4rxDJqpSWxr5idZp6x0?=
 =?us-ascii?Q?N0tSbFqGXkFM0jBgk4V8SampYOHrZ/IvYBy4BVM0I8oLG2jgHSjbZGrz3kfY?=
 =?us-ascii?Q?Z+mhroV3GHDPtFqQhR8B7K/NpWSFzNca5vAW0M2bsvdTh+NL6guO9+FmumnR?=
 =?us-ascii?Q?2Qt5PlYQE7ji+n65w6vmSbV6OiKHO5U+hueufKtCcwMG7mCBVgwLvD+WUkoO?=
 =?us-ascii?Q?pvB4+7JMU0cr0KwJv9Xy83VtqePgJ0PagXJDFvFQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f904004c-8464-449f-0ede-08dd03f78428
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 15:26:16.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcviDfVVQoi9G+a3Bmc1BJlbpt88J9sBE2+wVF+uY3rB0LrNonLj6yJcMaAEIk5QlrMqbS81LF2WiyBg7xiQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761

On Wed, Nov 13, 2024 at 12:10:53PM +0200, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> new file mode 100644
> index 000000000000..a8edbea75bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
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
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: siul20
> +      - const: siul21
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 2
> +
> +  gpio-reserved-ranges:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  nvmem-layout:
> +    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +    description:
> +      This container may reference an NVMEM layout parser.
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +  "-pins$":
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "-grp[0-9]$":
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
> +
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false

There are $ref, need use  unevaluatedProperties: false

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
> +    siul2@4009c000 {

generic node name, such as 'pinctrl'

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

needn't lable 'jtag_pins' in example.

> +        jtag-grp0 {
> +          pinmux = <0x0>;
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

