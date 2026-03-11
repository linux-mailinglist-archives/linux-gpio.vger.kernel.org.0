Return-Path: <linux-gpio+bounces-33123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yiDWDFpisWnQugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:38:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF0263AD3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7CC33034DC1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D2C3346A6;
	Wed, 11 Mar 2026 12:38:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023093.outbound.protection.outlook.com [40.107.44.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB5285CA2;
	Wed, 11 Mar 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232725; cv=fail; b=P0MOtZFkg23b/huZpUtqdZJWwharX1SQ4fkb7ytLvlIhWaQbXUsSlKj/dDtHgBvnQK2iEEYb62tn7UTtgrWu4fVgGaVfVWENVCpe16QLUawDF3RNmLVuRFeO8yUajDg0+Ajo2y4prfXEmuLKRFST2koJNUVE6/JxEofz6PKuJYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232725; c=relaxed/simple;
	bh=M6NJOf74yZ863/TVHjweZIXK034V1e9coKD/ENOWHjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkvKQOIM4l/zB5UORfIa5dKAPetk6RrA8XRXQcyU+UqpvDjHAlWlrqqzQRpPbEL71/yN4YSy9KVtA208Tokwcay+A8EF0BKwEo77MpMz9NWHeOkpdgQSTFIh8P9mhv7cNg/mbZxf49PbH86XmFKOEeEHKWvoRoS38J8m3ALOwDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3GwPO9k5ih3v3WaeKC+I0fpkSRMAgV9Fq4Ft2WgKB5qQmPWQ3HTDkU/Qvsd+B8YWgsUSRYxrNVDu1nAfGjkT8Y/2oscxt0ytMMeFH0eGX2kYY+SprOu6sXiZfEFHRN1lrc/nmzGkysfW35yfyw44zB8tCU/r5ozJJlXpnOrgad9JM63DH4tzdHYurv4be5gWflyLze8Cd9MwvFi56AVEPuGYifJghTlcoSSyskZdPbZQ+1rjT2mcN4dLGiNCwxb+6FNz3OrM5XD1RLd/pLWoOYbRqMpIAz1RyKH7ZSjHagI25FfMtJTBbmkpHgbliIHZWOIdo4WUw5ISt45Y6NWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJQFf7uynsKdrX8jRi60rRsiivmFxdtGdDMC54/tDqM=;
 b=GW+bCrg11ampr6+BYRl7IFATDy9sdyoLwXLUC9lHhrvrJKVKE1GEdIEMqm4Vj0a08OQDpGD5+B7cgUcURRJVufuoY0Nf+jXP2BnEI8oeR+rTopBWZ5I8xHRgNDTIdG2yHeXnVG4zcAi7hrce98wiCoNUohzTEbMFDHWTHbKqBGB9fdGTGjunS9rD0/gxQ/qdhZSp0al9yxqz54o6tZoQXUtO1k8PhnoBHn77W4eN8yu2w73VV+Jq9BjTdMvriyxHgFVHE5EkiVORrj8EEI4tXP6IS4Gp6Ey01emr3tXVky94M5MtZvuFIAzFykfrQPE7PXCGGBGNtq7ea6k8SQ7KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) by
 SEYPR06MB6684.apcprd06.prod.outlook.com (2603:1096:101:176::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 12:38:38 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:b6:cafe::d9) by SGAP274CA0001.outlook.office365.com
 (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:38:36 +0000
Received: from ZicharPC (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8AAD84350707;
	Wed, 11 Mar 2026 20:38:35 +0800 (CST)
Date: Wed, 11 Mar 2026 20:38:34 +0800
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@cixtech.com,
	fugang.duan@cixtech.com, jank@cadence.com,
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for
 sky1
Message-ID: <abFiSqo3AWUjj1pt@ZicharPC>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <20260306093238.2715269-2-zichar.zhang@cixtech.com>
 <20260307-efficient-fancy-gaur-db7df8@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260307-efficient-fancy-gaur-db7df8@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEYPR06MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9e7089-c212-4f10-9a30-08de7f6b1da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7qGA0xzxp5piLl+gkK/yWIqK3Qm4go7CO/RBd9SKyt5ZPIoxHheyYFdmehQo8XObKS1hw3zmVJEoxd/ItB8oFcmUbJlrMmaXqKa8zMDbsyK2DqAYtoukrnzUOafhjpsY9tZYD0DzolmaJHoQQ1AnJOgKsrKiRcBdFdX2tTXOI4B8rsv6ADr9Aym533tUlO3i1kCrF5bnBk49YWWhV4ScueU1e6UotSo64qZvBUPkJWErWX3mQZO2UAu72AMzGqj2UAS6wftOm6cdagCn6qMt0E05vHNAaySD7B8I6kDwxVCYaEWnzPwJyFcRoFFwRWb4IrXgWMeaCy7AMl5bW0qSYWBCyEQ+lxqGn07tJIxq69+oFUOvsiUIWE9DLvzdkexg5yHKoYHepIoUc0NSxkw6cbN1c93e0GCTN/4vTkQ7fZy0d60n55Ob0q1B7L9h2j4z6B3a5D79murSx+wEjFtMP2e/l2Ge5Eh5blQvw5nhoD8GTLiMXzclxnU6vW6DTdAkK/eI5zEPlL4OCT0f6nLo9kO8WG92bMGtETRPs6aDxz7j/1h1KWdD55UwP3/1ZDm7ATU1YusTAY3W0ZELfYvlHnExA4uUulgIq2t1kMJKwWofTyT6Snu2Klqg8giNgw5dSatg1vxAw0cj4CQf1oSHgmIaG5kvrjen3Ns3E9nlMCWfVGV5Xzs+bxybs1y5XAcjIrF/dZDTuct4mPE701+thvMt+s7Pn4rFcXI7C0zUVwQ=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dZ+4ZYAU2yjHoTgf5CsOPGnwJrkRPqVNhp8++MKHgk8bPG8/Aejm1EXDIXoM1OnrZA7MvBKxhWUYZC5Wq1u6xUlV8vUTEh1pWzQwiDqUMEwEsqQHHzFBGtcfrQuJfU2wRHbdrm1yqhnrD17oq4DrckR6dymULm7hOB859S5Cj32L7DM7gnBwjXksj9P9v09vw3MCviLzWO8k5AgYdB7BQdwRTkBW3/BGVgt6zh+IrADjn7Yv2mHY7/qsigAkfp7GjHFPIF3odadOjnfCU+xHSt6G6ojwaDlW2DYeZcvX9y85CC2eZxT6sHjp+i1aU5H4NA0e45y4ObkTOz9i4FY5P2dr0Bk7Yt+SoE9IOA/t7+nhEcDlmKjvFKZOnI+pDjIGDJMG2D3ymJzWICKpe15oy+04VPPPtwu2NRqxGA51dUjEBrGOQ1dl6BAyD+FSMGCz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:38:36.4794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9e7089-c212-4f10-9a30-08de7f6b1da1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6684
X-Rspamd-Queue-Id: 67DF0263AD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33123-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zichar.zhang@cixtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.62.221.192:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cixtech.com:email,0.0.0.0:email,0.63.122.0:email]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 04:22:39PM +0100, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Fri, Mar 06, 2026 at 05:32:38PM +0800, Zichar Zhang wrote:
> > From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> >
> > Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> > sky1.dtsi, and enable those controllers on sky1-orion-o6.
> >
> > Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
> > ---
> >  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
> >  arch/arm64/boot/dts/cix/sky1.dtsi         | 123 ++++++++++++++++++++++
> >  2 files changed, 151 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > index 4dee8cd0b86d..4dc76e0135ee 100644
> > --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > @@ -89,3 +89,31 @@ &pcie_x1_1_rc {
> >  &uart2 {
> >       status = "okay";
> >  };
> > +
> > +&s5_gpio0 {
> 
> I already asked cixtech contributors to read DTS coding style. More than
> once. Does it mean I need to ask EACH contributor that? Maybe create
> internal guideline to avoid trivial mistakes?

Thanks, I’m working on the next revision of this patch.
I have reordered the s5_gpioX and fch_gpioX nodes alphabetically
in the next version of the patch.

> 
> > +     status = "okay";
> > +};
> > +
> > +&s5_gpio1 {
> > +     status = "okay";
> > +};
> > +
> > +&s5_gpio2 {
> > +     status = "okay";
> > +};
> > +
> > +&fch_gpio0 {
> > +     status = "okay";
> > +};
> > +
> > +&fch_gpio1 {
> > +     status = "okay";
> > +};
> > +
> > +&fch_gpio2 {
> > +     status = "okay";
> > +};
> > +
> > +&fch_gpio3 {
> > +     status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> > index 72f3b195a927..9ceaf8f68e83 100644
> > --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> > +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> > @@ -185,6 +185,13 @@ psci {
> >               method = "smc";
> >       };
> >
> > +     s5_gpio_apb_clk: s5-gpio-apb-clk {
> 
> Please use name for all fixed clocks which matches current format
> recommendation: 'clock-<freq>' (see also the pattern in the binding for
> any other options).
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

I have changed node name as "clock-100000000":
s5_gpio_apb_clk: clock-100000000 {
                compatible = "fixed-clock";
                #clock-cells = <0>;
                clock-frequency = <100000000>;
                clock-output-names = "s5_gpio_apb_clk";
}

> 
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <100000000>;
> > +             clock-output-names = "s5_gpio_apb_clk";
> > +     };
> > +
> >       soc@0 {
> >               compatible = "simple-bus";
> >               ranges = <0 0 0 0 0x20 0>;
> > @@ -354,6 +361,74 @@ syscon: syscon@4160000 {
> >                       #reset-cells = <1>;
> >               };
> >
> > +             fch_gpio0: gpio-controller@4120000 {
> 
> Again, read DTS coding style.
> 
> > +                     compatible = "cdns,gpio-r1p02";
> > +                     reg = <0x0 0x4120000 0x0 0x1000>;
> > +                     clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> > +                     clock-names = "fch_gpio_apb_clk";
> 
> This is pointless name. GPIO block does not take some "fch" input. You
> just called the input clock based on clock output which is completely
> misunderstanding of the DTS.

Thanks, I will remove the property "clock-names" as well as the changes
in yaml file.

fch is a hardware "module" in the Sky1 chip. This module is powered down
when the system enters the S3 and S5 states. It contains several GPIO
controllers, so we refer to them as "fch_gpio". In contrast, "s5_gpio"
remains powered in the S5 state.

Based on the hierarchy, the clock input for fch_gpio on the APB bus is
named fch_gpio_apb_clk. By the same logic, the clock ID macro is named
CLK_TREE_FCH_GPIO_APB.

Best regards,
Zichar Zhang

