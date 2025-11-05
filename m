Return-Path: <linux-gpio+bounces-28126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86025C36094
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 15:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBE3465CBB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD241328B7F;
	Wed,  5 Nov 2025 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qjewIMtV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63677314A93;
	Wed,  5 Nov 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352579; cv=fail; b=PFM7E+/nF47FZwsU5sNgcCuF36mwDwmKNbO/qBEXcuEDwQnR8OsLv3dAAvm986SAUw8tsolZRi6LaPNwE6rL10zptWF3zpIUsVnK8JTPnI3ZY0lqcIzjSxch3xI1hGVZV37rl4RS/y3h4M/0yN16pPA1f4sIizamjT9c6dmWMHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352579; c=relaxed/simple;
	bh=KqeR1MKjAwWxnY4zc5sYuB0Pym2GXc8S7CHOxqyCm8g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9zTYhRIvVQ0s4NtRlcZm5ssOg+Ex7XKJGxBXMrfZQN9N1qpV7Te8rPPbC4f8hmapns4h0nnAiFardzsdVSZ9tIAX5C9CcRnsh9+x3r7QGKSNzle/LdkvLjmXhppeILKMuGsXrjVjDEWFahHNKghbSq97j881ovNJ/1lUHaZD2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qjewIMtV; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slVY8PD702icLNkU6kP9AvvS57afn3cqYNKi53tPRNQwYT/OR6hzvjBUbpu9upK/6uaWJ5TOr1YeLI0pjuvCKkErssbX7Wl3ZTi8bL+w+X53GiakWoKQe3pUUI7ab/p3Jzpo8oAG8UcvVjvLFyB1apuiz/DZab7AOrCZ1VRBFlFw4JMTMmBFtuzwSu1XvxhqaOVL1LEFMfxe8Y2eAKT4mJGsB2ny4TWMAcbtS6x2X2khm7Nx4jCJ9lJm3uV3VuOP2I/zPF6iVB8kaLYcz1vWoZE/HzFeYBftFGkaSSjn9/XHfPjspFQ7afC31XtPCiICl/ec607yrBgoqS3my6vjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78k+m6I4JVkCYoSCH7gd1cf5SL29RDXBrJqnUEYHBdU=;
 b=deP1AV6d4aoOVaNhpKkr8zBE15PnbNuE+T1udbgaViRGfkKwRHkwAUZeHA60eFTNaxJczNaOCHgOEHMJW7jYxKhk/t7PrjNCKeUZx8/GIbl0Q4xvGSEw6L/TuPUmgkOyIrU1M82Id1qX6qdWuFXGmrKXYhpeG5wIhezh66d07IaCNDl0WdIK3DBfyt6QISs6RsqNOMkqouDRAApUjceLZ1sM2I/R4XfZ29/Alzga3f+Hd2VYK+HSbJaBVtia48khuittQl61t9DJyRP28EAPz53gU2QnkahPyWaFcfzs1y+MBwsCnmIaf4FwWCAHfbrrT1z4b+fRpnHkaeGmApTBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78k+m6I4JVkCYoSCH7gd1cf5SL29RDXBrJqnUEYHBdU=;
 b=qjewIMtVzrUcagFgaPMHAGBl+vv23krlBTcWqsujxO5otEIPIoa5179EKwDVZgbgs8w974HXDoBn3NIBRVJug57cXJiWabCyvVU/f2uVL/PaOYCyPkRcPkL9G4SgWZSIK6kRVahsPgyP+qNQPDGuCcYWEk25N/h010WdvUtf1/s=
Received: from SJ0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:a03:333::17)
 by DM3PPF8E7C782BE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 14:22:50 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::5b) by SJ0PR03CA0102.outlook.office365.com
 (2603:10b6:a03:333::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 14:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 14:22:48 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 08:22:42 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 08:22:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 08:22:42 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5EMgGR3835775;
	Wed, 5 Nov 2025 08:22:42 -0600
Date: Wed, 5 Nov 2025 08:22:42 -0600
From: Bryan Brattlof <bb@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20251105142242.gly4brezn4lnlfkv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
 <20251031-am62lx-v7-2-cb426be9d6ee@ti.com>
 <aQha9-oNEQd2Ds7Z@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aQha9-oNEQd2Ds7Z@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM3PPF8E7C782BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 482cdc45-5c6d-41dc-0229-08de1c76cbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGNTQ045QkdUK2xUanF0eFFZZ2Fvb1FoK3lQSitQVXEvZWtWU09oU3l2NUhZ?=
 =?utf-8?B?MVNjWDJNMXdCcWVUcVovUGY3cDgrZGNHUzRpLzBjUDhRb3hsckMyOFc2L08v?=
 =?utf-8?B?VUhBbFNFRnBGaEZ6U0ttbUd5clk1cGNoODRIellGRUZKUlA3aUFQb2plSlNj?=
 =?utf-8?B?TFF5NUNuZnBDWHBFSjVyUW9tUWlUSzA2WXh3eVpFOEVoWjh2QU5TWUxqWEpS?=
 =?utf-8?B?WExMelNHT2J3MU9tMzVsamtNRyt6SlFaSm9FdXFZVmJ4SWVuS0VnWVZwa0ho?=
 =?utf-8?B?VlRzWGo3bWt3QXAzWXhYMTJMdFlqYy91dnZReHd0RE9ONytCL0dBcWpMSFRx?=
 =?utf-8?B?U2VnL1lsdEFDQ3FlWmRMRkNxQTB4aXRIaTFiTU4waERXTEt5QlRJVHhTVDNk?=
 =?utf-8?B?R09paHE5V0J4cm90UVNyYnFlNG1ZcFlKbUVsR0hWbUt5NG1yL21yUjdUWGNx?=
 =?utf-8?B?L2NXeEFSU3pPU0tKVm1jd3Q3Z05YclFhelB4amhxMmQ3T2Y4WXd0Y05UNTBl?=
 =?utf-8?B?N1lGZDNoWi81SjBlSk12QU9RUlI3d093N2s3TlI5WXB2dTFLYVhoRDdSb3Vj?=
 =?utf-8?B?MGh5VndpTEFFYVlTbzJURUdTM3hjVW9NVlZNREl0Rlk1KzN4STVrT202QnNx?=
 =?utf-8?B?OXZYdHViMC9NS0gwdGtJM0M4Tm5Qd0g1S3RIeFIxT3NCMG4zSDByV1FNQ1FT?=
 =?utf-8?B?dzJlb0o1N20rUGIyQVRoM2hJeDIwc0RCSXJyaGNaT2N5enJyTWdIM2p2ZVVR?=
 =?utf-8?B?cU9DazZEaVB1WWd3OE41VkJXOE81eWZ2ZlpUK280YUtRSHpYSlpkUzBOMDNH?=
 =?utf-8?B?MWo4ODVtZXFKS3JaeHFUTjAvTGpFSkN3ZzVCU3JNU3BONVpvTUNZdXRCMHk3?=
 =?utf-8?B?WXM1UXE2YUpLeGF4NVcwa0l1QWt1Z3NQQmMzKy9TakM0K1RVNjk4cERPaEJ1?=
 =?utf-8?B?THF6eWppc1JVMTZaRk5UQWFCMmZOS05sNGxSTzZxL1pGY3hJUzJaWDY5VEhZ?=
 =?utf-8?B?a20xeHNqOWR0N1VUOEpnUG55ZklscW8zWGR5Z3lmYXdPN3JhYnhMR0dXVFlM?=
 =?utf-8?B?bDFKWmxROU1IekxXU1VTbDVWZ3p3RUY0TTlUdTFLN3Y4MkwyL2Y4amFDYUtU?=
 =?utf-8?B?SHNqdE9DakhjTVNNNEtVdVBTVWhxaGphNGVoL096b2RBVHhKV2NaaU04UEJu?=
 =?utf-8?B?TWJMOVJlWkM3ZWVCbzhtN0thKzFocXJXUnF6M0t4MjVhbFFnMjlSeXByQUsv?=
 =?utf-8?B?clBOVklTbmRVMWNROXVZb09LSklTVks4NURhM25DYjRlcTcza2cxVTg0eXhh?=
 =?utf-8?B?UlVTS24rR1N1L0h1NExYaUk0c0NjeHExUnF0emFLbXFmRitsU0phR2lKcmxZ?=
 =?utf-8?B?WkRpcFovdzEvMWNuUG8zaG9sczRWQ016RlJoS0w3U2VvY3pkR0VlRzg3MzBT?=
 =?utf-8?B?VHR5Mk9EYWlROW5nWHdpMDdIa0Y1SFJYK2JHWm9kbXBrbW0vZ3RhNlpXZmds?=
 =?utf-8?B?ZlVXT1daUXVwNm1nRXByTVFEd3Z3OHM3T3RIWHNQUStUZ25raldhN1MzUVlE?=
 =?utf-8?B?b3YzSTZ2SkVJSzZ0ZDg4Ky9OL3YrSEdTYjdSeGxmWlR5djAxd21aS1RLZkta?=
 =?utf-8?B?WWhicWZQVzI4MCtkWFBVMUFsZklFa1dFZmlLM3FTOHFMb0FUTUhGVjFpOXhG?=
 =?utf-8?B?SnJvNUlOS2FtTi81MGhtelpDL1R6bFRNM21EUzB0S3lXcE4yWTJtcWx3Z21P?=
 =?utf-8?B?VnVzNm5TOVNZTVQ1VGY3N29xZldWMFd1cllvTEtJdHN0b05sdU9TZTdTS0cx?=
 =?utf-8?B?OWxEOUE5RE53YmZxOG1jM1FscEFsVDJoNmtreGFqNXNjUDQwaVJsUVpqbTZX?=
 =?utf-8?B?TVpMcjRzd3l3cDNuS2VtRm5BV0xmeWN3dHFNU2JieXFWd3c1TU9HZ25XRHBD?=
 =?utf-8?B?RzZSalIxZ3RXSURjRHdSd0g0WVVXYjBYWU5uVURxQUk4WmkwR2U1OUxCZ1dY?=
 =?utf-8?B?RncvR2tidzBkWURRMXBEZ3pUYnVicTgrTjc0NFJYUHlsSHZJMjdQMTZXcjJq?=
 =?utf-8?B?SEFTQUNUblEwWW03UnVFMDdOZXdCTHpHLytNOXZ6TGZIMVpTdVNGQk5ibVNp?=
 =?utf-8?Q?3JOg=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 14:22:48.6209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482cdc45-5c6d-41dc-0229-08de1c76cbfe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8E7C782BE

On November  3, 2025 thus sayeth Sascha Hauer:
> On Fri, Oct 31, 2025 at 09:08:05AM -0500, Bryan Brattlof wrote:
> > +	gpio0: gpio@600000 {
> > +		compatible = "ti,am64-gpio", "ti,keystone-gpio";
> > +		reg = <0x00 0x00600000 0x00 0x100>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-parent = <&gic500>;
> > +		interrupts = <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> > +			     <GIC_SPI 267 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +		power-domains = <&scmi_pds 34>;
> > +		clocks = <&scmi_clk 140>;
> > +		clock-names = "gpio";
> > +		ti,ngpio = <126>;
> > +		ti,davinci-gpio-unbanked = <0>;
> > +		status = "disabled";
> 
> Virtually all boards use GPIOs and a GPIO controller doesn't have any
> external dependencies, so could you enable them by default like done on
> many other SoCs?
> 

Yeah that is fair. I'll enable this.

> > +
> > +	target-module@2b300050 {
> > +		compatible = "ti,sysc-omap2", "ti,sysc";
> > +		reg = <0x00 0x2b300050 0x00 0x4>,
> > +		      <0x00 0x2b300054 0x00 0x4>,
> > +		      <0x00 0x2b300058 0x00 0x4>;
> > +		reg-names = "rev", "sysc", "syss";
> > +		ranges = <0x00 0x00 0x2b300000 0x100000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		power-domains = <&scmi_pds 83>;
> > +		clocks = <&scmi_clk 324>;
> > +		clock-names = "fck";
> > +		ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> > +				 SYSC_OMAP2_SOFTRESET |
> > +				 SYSC_OMAP2_AUTOIDLE)>;
> > +		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> > +				<SYSC_IDLE_NO>,
> > +				<SYSC_IDLE_SMART>,
> > +				<SYSC_IDLE_SMART_WKUP>;
> > +		ti,syss-mask = <1>;
> > +		ti,no-reset-on-init;
> > +		status = "disabled";
> 
> This node is present on many other TI SoCs, all I have looked at have
> this node enabled by default. I think it makes sense to have this node
> enabled given that it has child nodes like this UART:
> 

I agree as well. 


Thanks again Sascha

~Bryan

