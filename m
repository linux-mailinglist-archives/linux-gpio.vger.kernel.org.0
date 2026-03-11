Return-Path: <linux-gpio+bounces-33122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PLeG/JbsWmGtwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:11:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3C263758
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A705F30055F0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9513DDDD6;
	Wed, 11 Mar 2026 12:11:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023073.outbound.protection.outlook.com [52.101.127.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E133C6A45;
	Wed, 11 Mar 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231083; cv=fail; b=kzCMKMm3THfjPKAfJifAuGQV9MeydW/Ev8J81/Yw0euj6DxEEHQ/8aT+MRRdecw2UCtak6cvKNJrypwLhaaOavAqVqonTF7/RrxyE/ZX0W2RdKmVp6o+FAHKy33gB0jgVJiJhO1iZzzT0wkQdblYgeGvnIv65CrAKbTSa50voYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231083; c=relaxed/simple;
	bh=TwwzNMX8Ei+/VKdIlS1NPdsnduYceRSTVVeT4ew/K4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyL5eKSc7fpBfHoqX6QpwKOqsuE4jCkaBexHBxJU08AZaJoJVYRP74Tp4mM9DD5M75BjZEOENCEhHe5XXg719ysrkF2m2cyLsuwfy4cspFXe3ytuqKeOt6Q3cK2O/uVWwiTxAJm3xanouz6kSP1VbqJ+E6fsn5cr3MooW/Y/RHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcLvzIcfMMWVlQR57Mw8QVAssRuHPHvXuU2EkSfWm0lyq4w2SwrnxAVoZ9dLP6NqTvLjRsb8wM88HbGvjJC/X5+oSIJNU7tuHjNw4V1pSf8cqzfe2ypD15ywN8UkhZ0NELUlih8w+EoTf2gOYit/mcMKazXTwwwDCHIic3fIeyyezs+KfSf8mH9kwshAsXNS+PXmRu4eNp2DKaxYPnA2QELiEEj7aIGZMe+v5g+bO2OPlXBGhdn8ErTF8m/eyk7HKSNgTg4QxiTpFywf5nPPLaaPHG32qbFUZBwBYBi0mZy7VfCihPvF4B6/2oUdam4AG5r4nWXxxb5/23E2b6n0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7LBMlarO20SL0CPvMPbtTv+sV8mzdvYBl/HxReP5eI=;
 b=CKUU8UMgIPPCTvxTqvcYn6wTZ1SE6b3XnnSkQBjIIu75V3EaFCsSpJZOwFpdaV+SlgWk9lTIyC/OVECNndQARkgZzWHyQHAjeKDVUvDscPyyZiu5TQI5epoJ7pQpoyxpd+A/Y55anuYdbw7Ql4EqH1KGHfG+2GO3tEjmHK7KGSxdFZrjD3hkzvINoOEtqUPx46MEqc/w5lYJJHMW9OYWtg8YkEag1mPrmYF5YXlq9W0xmQWIOMOtPZR5osEOL9w8X4cJ/JpX0YdDB2xq1VJCmA+t51O1MC3yU3UFp0TMU+26nDc2B4UK3a+Qb9ThIC+xkp1rg9c/NhK6hYlNQOxdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0018.apcprd06.prod.outlook.com (2603:1096:4:186::8) by
 SEZPR06MB6973.apcprd06.prod.outlook.com (2603:1096:101:1f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.12; Wed, 11 Mar 2026 12:11:18 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::5d) by SI2PR06CA0018.outlook.office365.com
 (2603:1096:4:186::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:11:16 +0000
Received: from ZicharPC (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C0BE14350717;
	Wed, 11 Mar 2026 20:11:15 +0800 (CST)
Date: Wed, 11 Mar 2026 20:11:14 +0800
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@cixtech.com,
	fugang.duan@cixtech.com, jank@cadence.com,
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <abFb4vkslyyWqpCS@ZicharPC>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <20260307-foamy-happy-bumblebee-cddd75@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-foamy-happy-bumblebee-cddd75@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEZPR06MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee3e7ae-0910-46ed-dd34-08de7f674bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wPARhD73VzyB7c3Zh1egrZNBiRmx1w3QIL5bWa1eWPca+euyguc9ABFfuaLTduw8cl44PcXy4Z76fT4KJMUQXn48yez2OUInAKmCOgPwIlwz+UsADheUvT48qzvtGsAxrgSn6ndlFLzDTEVmK0k1Cvj7eAU+VgUBzKi+ZPdwYaNn5lf20vSMIHG/2JqDGmv6leIS3Z/DG81HX3AqANwtjFaI41DF2NOliu53mGFsX94pNiY9+FjjHBJBmCY0s+GSdpH/jgC8Kry6fo0MGK1Fl4c8ZSdQdS9Rv4sNx4yFrp5eKQKoLYAFLG2kZXqs+M3QcMLwaJKImwU8v1gKGlmg7fASOenMBmCUX8ex4XyofnjzV6rLxCo9RUbCPoNxTq4FQl2NMcV/n4NDDaW7w0OgAKiNDgSLKj5o5+aUszV43nN535eOuqUWrCso7f+GwM3s9+cmVqYEIfeY0w/uloNXdclYHy4l9Dh/L2be0lmPRq0hR6u1OML13K7ITTJXolNl/dTkyHDWmkVkco8E03PHgX2CTBw+2l2dDpfMfyUsxVTcpOl8wuiwJ4A9qmV10dQd0FnmXpeY/iLe/eiwkQl0s+ZUSCo6ygkaWqIv9dh4vpTbmzVkv6Hwhoz61IeWoyVky9J16304L6A/r84VzemW6fv1tDLMTgTXIzVNnBbaErUg7vsNTl/CIHyRFQhfI4ptP3pxqHicLOJqtm/IL0TsJMIhmN0uq1pSPJRfIS43Sqfm4bWlLs0gNxgeJBvI6FYD3W80gxSUHJWFIlMZSffPZw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mtgaMhsASjD2XZg/NBj2nvNwAVcIAGGSpGzSN0DJ0hY+xJyWplxc7iU4Ok8zWlby0qot0W/rNZhj6owkjvc0I3zx7cHEBBk0FeQCf7tBARq23SmQkckGPZNDOKRhVWiaR9jcafTUlinqRHyQpkoNtruJ5jDCEJy+N94g++xtBFVAWOfJbV42aE3qz77ee0hRk2v35gdWDjLkUGJRkcWgAltxtOoObfx1CDbuGv7Sduyqus1fdONQs/bcuQasEW22DpLjee2Czerjd7HaHH0seJyzWTHc7/VQWI6xFPf3K6Z7H3IpUXe6idVwFEv59z9QkT12jUdv/NANEL9k1s90+0m9ab9LiBjpHNlj0hbgHsNhAGa2keeZmh0uYfwP6jm5wClDsKyIWkwLnXDvZ7QORoHmmMpsxllYzcikqiAn5I6Oi4lsdLl84RBGLg5SLub+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:11:16.4418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee3e7ae-0910-46ed-dd34-08de7f674bf9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6973
X-Rspamd-Queue-Id: 82B3C263758
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_FROM(0.00)[bounces-33122-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zichar.zhang@cixtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cixtech.com:email]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 04:19:50PM +0100, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Fri, Mar 06, 2026 at 05:32:37PM +0800, Zichar Zhang wrote:
> > From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> >
> > Add the optional 'clock-names' property to specify the name of the GPIO
> > controller's input clock, aligning with standard clock binding conventions.
> 
> No, there are no such standard clock binding conventions. DT maintainer
> tells you that.
> 
> Otherwise explain me where did we document such convention?
> 
> > This complements the existing 'clocks' property and ensures proper clock
> > handling in device tree descriptions.
> >
> > Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
> 
> Messed From/DCO.
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Thanks, Done

> 
> > ---
> >  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > index a84d60b39459..c242b31edcbf 100644
> > --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > @@ -24,6 +24,12 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  clock-names:
> > +    description:
> > +      Optional name for the GPIO controller input clock.
> > +    minItems: 1
> 
> Nope. From where did you take such syntax? Missing proper constraints
> for names.
> 
> I don't see reason for this in the first place and your commit msg is
> really poor in explaining WHY you are doing this.

Thanks, I will remove this patch

