Return-Path: <linux-gpio+bounces-26277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1E6B7C6D5
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294E6326551
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C91283121;
	Wed, 17 Sep 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nf3azMsl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BB248F52;
	Wed, 17 Sep 2025 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093366; cv=fail; b=pzKqatNTF2bpddqBiN8yuCKcT7s8j8TMnSkw15dyaRQGvyD7fluYWjSCCHhZJrCFMoIoS9UZm8yCEKSkebCOSmwM0Hup7+4gdsm8sxKlEtUEL4PhSl4i1imSS/w6+MDeB6W58tHI/2YyQTD+oqIWUTO2aFnPZVY2Mv/IoAZDubY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093366; c=relaxed/simple;
	bh=ndmFBH3AR7zvJgFFKfvXpXYTySUPuhkSj03OBjBrucA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GB1Cew77c9dBWBZ4nGDyo7+d4f0Ww49mgZtS2v5N+bKFBViVAOVNOu/ifPIyoePULiTCAsn9zdcUhviVTS5lAwThLvn0sASpou8KUzm74+KkPG4FheNBDZ+DzuaEie6JFch8tCpEe6JV+CXIYdSaNTIaXCeTqyRAki9F4MY18bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nf3azMsl; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXLVLInOepEEqKCddPKFl0DztqEsABaGXfhv5vabRBHI0KtlSVjiwPssBKfOfvfffZNWoMEvdsqxuSSL4SGsdaX9Mc/mleFWQjzO+lMZ5OtqrvGt7Ok2h3f7elOev2/T6CHnWJ7g7z3xQGbmNATtqq4Al95LfZLFQavPAnJjgiym8+Wx9A+mS9pz10UIA5gTKd+Of4CM7vW4JULb+aw8zIuuMpxoethAp3XNQJ7Z8EJ30sMqQqBPZsKrctn5ss6c8V3YiFljy0SE1xf7tmVgYlJ6+yn7+QiByHfsgPrT3aPUOGNgoRFbMvJa0lAaiGrWrc6MJ/Cq74+Z0jbLE53jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMpRiFxzym1d9kHVzqALyBj64WIyDEl5egIG4BDyncM=;
 b=itSn6UHE872mYWjxUwnd6eQ8qjjfgNSS55AqnCRYYnJ6UFLPw8Z0GxsVDMcyMAerc4XDYcQ4Xbcb/OU4ZO0rR6K9qngjLrdvmnbL1ueU3bI0SfEaxYKoKy53P3fnwNUGFSwBy6h3/5C/jsL4LkLFg+LHJrkXlMrIPSZmONkoKaqI6mBvnChJB2Fqvzqrx2hySpYX1O6QYukhFx4XCXVcDidSOy9kiAyDaHksq0sQ1tMJiyi3lQi5XMyr47cz/MqJuEml6OfZv0mxz1KmrH4bhAIMVUUhwL2Xwy6okb9kpBJum3U0pEyx8ItcV7haFRCZUmsYQ05+FwfHDT7EtdKHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMpRiFxzym1d9kHVzqALyBj64WIyDEl5egIG4BDyncM=;
 b=nf3azMslvJhpA/m/tcATGkkTpQzmuiOOpH6qD9A4ZF8GXu72QQ8AFuRoi7uE/K7RGIklaK0w7EWl17gSWmRZa1mvPwXzbvsXd0wKdpsBGqnVnTtG0SyZ+UTPCMaivT39UO7rjb9J5LnXZGjcfKFRrNHz0wqtD5hVV3EJsSuC/CFUg+E/aepQAMTdGDwAgVUCHcip/Sg0VztusoYpBzeI1o2jGn+sIEU7XcVRacisxdBQ/3nj9+eUFYd4Z7qn/JFBX1bQN8k/KkjeIL/9Jb0ZscHibjMCCm0n60nujwY72CJhjHoPkSFLP1ttI6pQoAfLNQrQqF1X3laZ8G/6NZyMwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:15:58 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:15:58 +0000
Date: Wed, 17 Sep 2025 10:15:55 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support
 to also cover the LX2160ARDB FPGA
Message-ID: <hioigg5kn4lf2rvmfdxahxsuxhe4unvdkaoy5esoxepgc4jf7f@2wg42pxz3iry>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-3-ioana.ciornei@nxp.com>
 <aMmNwurzsaPXDs4t@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMmNwurzsaPXDs4t@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM9P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccba572-2358-4857-e037-08ddf5ba0cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fnDmJqh7+qtRtd69S9iH7PxQdHBpRrWo/Xr0M4EBPe9hX90o9cIiKWx1Lf5Z?=
 =?us-ascii?Q?NKUs3G1+bfaLtlPqtk9/M8JENf7/rCKIzoB/KE8UXdWnIh5IAznwNVRI+0O8?=
 =?us-ascii?Q?f5433ASLFeraUgsyONvT+NSV15RxfMNKa8wMPvdlXvzGggVL7itF1TUao6Vk?=
 =?us-ascii?Q?0ZSdPvZb/MfB+9BKHDOzyus+wMEox1Q4oecIJDNd6XbXjg9q5C1yyuQUPQ5p?=
 =?us-ascii?Q?l/79barOJTt8XEhNc9toQ1ebazcHP2TwtGgU8xzqRRHCe/febrjvrPSVI5e3?=
 =?us-ascii?Q?9fhQzVo36AYRVS85vRTZMKRBUWcdZmDvMDCYTcV1Eg+m1CR3TFgIpxeT10dK?=
 =?us-ascii?Q?14SBPHq3BkevgGF5efcee6YRFeZADmYmdxTtkSM5vl7SNBINNxOXH4kLNruK?=
 =?us-ascii?Q?04CwBXEouronypQ6BG/np9YmNf1RTHMULruFhRaKYVMadXZg1ezhwGvM337M?=
 =?us-ascii?Q?p+LNXL6jQy7Aw+9sC7mphNoQNtg7WGpYrc7XUlkJ5fPmDvH+RU5ZHjm/Xp7R?=
 =?us-ascii?Q?EVFk2q4vllMOFcQHW9c5Ubf6Vu4g1u4EBBWMlgAwhB4T3IbrvUjvnQY993P1?=
 =?us-ascii?Q?Z9c0c1GrxfFzswDH4gMQ8jMPjuefOHesMMnORb9FJ4MJS3pfnLvQWcWvV7nD?=
 =?us-ascii?Q?D6HAeC8w6hWOve2o6NTY/4FGgic3RWP14bgmfBQRv0MFMZmwJyip0YJAFzv2?=
 =?us-ascii?Q?RM3TnElEOeRWR9oB5pDdQglgQrkRL9d6JTTFK4izONqqwO+JLCPKZuIUaymh?=
 =?us-ascii?Q?fssF0mLw33gfElXBK6InodeV/AnVkbYENgXYEbnv1ng4r+TyiusCNN0l+Mpo?=
 =?us-ascii?Q?UQUGc2bJN1PlByacg3P6U5HxuqQWR+DvcAZly1D5hCmfCTn0gmNPjRYuEakD?=
 =?us-ascii?Q?7WF9N0tEgNDr8kSBeRdX8d7oMHMCT6mCJGPhLlaueOR+6TPs4hyz4POrXp4t?=
 =?us-ascii?Q?QasWSShZ5xrhMZaCFFvcMSWDrIe66/7ui21anDzEK+VntrTizr8nTgQt612H?=
 =?us-ascii?Q?qevDdm0kM8pG+lzbxGrAYDDqNDgYcryxFnpl734ojy4tRlQd/ZuCI5Yj84UL?=
 =?us-ascii?Q?fuwu5NTZikvaIXzuH5HUkNj0ST+52lpCQdRTTrmZxt4EGO6hqwRIyxa9qGzp?=
 =?us-ascii?Q?je3f5zckNNGa1wC3KuLPzb5llr3zA6OJV83+csqXL5T1BBWPeOhrOAJ1ujVr?=
 =?us-ascii?Q?ho1FLKw9CEWzC2rZyn+1RYtQ28uNNNcsabKJLD8/R2x70ZdyjI+HdjeMKbeM?=
 =?us-ascii?Q?SnPBF7UhGbUcc+d7zBoxAg4zMca9/DU2SCRy8+6tsuhpI+ow0c6DADwJmyao?=
 =?us-ascii?Q?5OnokmWgSfCr+8//eSOZXOG/iUREAWxBBwRM+iD9FkyuYCju8h7Do9D3O7dq?=
 =?us-ascii?Q?U7iYJMGbgvs6HdnA+Z0pGasP9oebvnIEFZzdl6DKCEAN/0dz+pT3W4AlhoAP?=
 =?us-ascii?Q?zDlIFxo8B/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IS6aa0PLveNxI/m8sB4FtqshCXHzeoa3Nf2dEBwiE6Wcf8VXjuhrDrWX6l5P?=
 =?us-ascii?Q?HcwlTFAfHfLTOctt8oYLFAusxH9b4SFkACpyPbWsiyYM4ccAFyopbeO866T3?=
 =?us-ascii?Q?tZfEmS7lvbtRVYgLxk6fGARCFqrkGyO7X/Rzky6JWZgjkGJp6yB3fLJ2Yrgq?=
 =?us-ascii?Q?15J6vmJC1/yKvvs5zHpJznYoaFzq2Z+MwB/CckuoHPbZTSaoo17uwVvAmqiz?=
 =?us-ascii?Q?2+Y215br7bh7PJ3b7sGQLCt9SU844f/CyAsEBwHojIQK75RxvJiqcFTqAU4X?=
 =?us-ascii?Q?WliP3IDfP8kuJi0ozc0+UhMu0n88dSfk3N+qHpWMV46NbdVc16NBqzdSO3Cq?=
 =?us-ascii?Q?FVIiQS/MnWsVsdnf63emMskZVWPw9vlBu4tdW6xUEoLUIlINZbgxn1ZTBSQ9?=
 =?us-ascii?Q?RZjokaqf3ZoDU36pCM898rvqKh2d0+v8UXeurPcsisEImScq7DHcYTx0K3nR?=
 =?us-ascii?Q?BUjDFfhDyALLtM88aBrHHHgsxaxVteKq7k0FxMFQyGCnlQFDMTBNNPQF2k6z?=
 =?us-ascii?Q?FiwZJ5tulFaTgFqHdRiyWyGXMieRmUCEzYhsjT9YntgUxkpLP0D7ipIi4LQI?=
 =?us-ascii?Q?mntXTdvDWBFtfD2MijP5kezUXk0mpZ9HqXN+P62bawY7wtOeeaWC2rcSUruk?=
 =?us-ascii?Q?Wbh6LuIee03DHZ3LKYcHrgZKiUw35OsPBwrC+4GW0LomII0lCvlzleR8CUPz?=
 =?us-ascii?Q?wn5E8i4hg69aQxMevvL3w7ARMfFqVj63GTXLV8l8ijGBvduaDXQR7Td44e5X?=
 =?us-ascii?Q?5uRVw/RKg+0wbWBUEP9vXUVUxi8maBTAh15Gl+0eoiuFbLnoCktDE6WzO3Dn?=
 =?us-ascii?Q?DADNgmDSrWJzNAkvsoRkDBd/t7WEat4IraDVpC5Jq5VZhcZyE8dNeV1139Lm?=
 =?us-ascii?Q?LuThGhHf3TtieMwIRJImldS/a1qiNNEDcuoB9kfkTH8Kq7zO/4fzThM4pvXF?=
 =?us-ascii?Q?R5WaYFQ/8lRdB1MSJC9rjHVsmoIBHQ6AJtaVk2JDL7p9SN1cqPg1aqpcTrkm?=
 =?us-ascii?Q?TQrqoMuArwJme7CcCFe1ZrdMc0GyG+DfpZxGDB1vOZtgzdIas6k4/A/Yow49?=
 =?us-ascii?Q?hbqku38VIig+JKggzEbLASbwvcvDvV7bVwEnQJ0OkxCDwazWJnZ0GcbsCbl3?=
 =?us-ascii?Q?dtSSEWLBHcKwpf6IFg7HQlkfa01Gu0SLHkQ4WXl4FxS1nY6tCADYvKvyTxj8?=
 =?us-ascii?Q?mj38343hi5GzpuBoB7HcM2sXd7NruNR+rqihw8ENCFtfBKSjonDFPIiAzzNh?=
 =?us-ascii?Q?LsPRcakHBvSgZ2S02SeXVg4Kd+tIDWmBRUqy9CcLg+87tDoRGcH8UsHviJox?=
 =?us-ascii?Q?46gVXQX4YRv6Ga3/1eA8vFT6p/a6LsdcDbM5z/ozIQtbdNk1LPbDcVaIGd06?=
 =?us-ascii?Q?tmW5c6mtz+yYbR9M6LsdR2G6qWZhZ2n+GskvjSZY4Dcn3RysLQKHjhQ/HXxD?=
 =?us-ascii?Q?z0a+waQxdpASCrv5ImUIzPYUTM+gd7oAgwgl2DEKzpk87/X/yFyIMvfo8wtf?=
 =?us-ascii?Q?akYheSfn/1mwbvV2ZEixGpGxMgY7qPE45FMfwybkQIKlwMrobWaNiX4J/EZD?=
 =?us-ascii?Q?g68ujrGH6bWfUfH4wQxpMgb1IAQJvLSiT+tc3HjL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccba572-2358-4857-e037-08ddf5ba0cac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:15:58.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQavWVIfcUvYT8rkmiTPTtWwBp1djyx07/N1UvCxKFOa1Z0smFSTk9IGY4A5QbDtNJ7dimfM995JglK5CTqjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

On Tue, Sep 16, 2025 at 12:18:10PM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 03:23:47PM +0300, Ioana Ciornei wrote:
> 
> subject:
> dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
> 
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> >
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property.
> > At the same time, add the #address-cells and #size-cells properties as
> > valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> > addressable.
> >
> > This is needed because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location.
> 
> These are neccesary because reg of child gpio controller nodes is in I2C
> device's address space.

Will incorporate the remark in this paragraph.

> 
> need empty line here.

Ok.

> 
> > Impose this restriction for the new compatible through an if-statement.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Enforce a unit address on the child gpios nodes (remove the ?)
> > - Enforce the use of unit addresses by having #address-size and
> >   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> >
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> ...
> 
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,lx2160ardb-fpga
> > +    then:
> > +      required:
> > +        - "#address-cells"
> > +        - "#size-cells"
> > +
>        else:
>          properties:
>            '#address-cells': false
>            'size-cells': false

So that we also catch the cases in which address-cells/size-cells
shoudn't be used. Will do.

Thanks,
Ioana

