Return-Path: <linux-gpio+bounces-33121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PUDJ2lbsWmGtwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:09:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1926371B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC7C3037D57
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480EF3DE42D;
	Wed, 11 Mar 2026 12:08:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022130.outbound.protection.outlook.com [40.107.75.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAE83C6A45;
	Wed, 11 Mar 2026 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230929; cv=fail; b=dHPPb6zz3qfWjyxOPTn5gxZecyBGZR3YyMI3Mrq9SQCw7j+A/K9/M+bTbfotBusOO8sd7W4mFh28iAMuGoZBOhNtdWozQDoEIFQpNw59g06VFF3uH6zQkOhWsxihAJr5HEUm50qOfVHPLbNznwtRHleCzwP55ZzOpmi522YK8Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230929; c=relaxed/simple;
	bh=ohGSZu5VW/oMHsIn8MkNpEmL0ePoHCSm2rRFJxKPFcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M90TJxs8LFV99eEldchw2WttrlPdjne34pKyiyEDunAf1IMvXjNvab0o/NSh5HW8DgwTsiAoUiQx+YKs27kMGvqCMdoJAXtUfaehrx2LSm/DWC9mhuVwRTs0UazrgKzkHkfqqvASyBXjxuGjOmpHYMsz1mVS5WyquvAePCbSjzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwlezUyiczuxtX2EFfM7eBEF8SIAir0/lbP2IV0C/Fruvw+MUpUmVdI0Mr2lvtUIBmtwAUBpfRZBUv2T3Xs2Ebr4eazDbte9Nd7M3euT9D9KzuCVjODo5idz9KrOkYO2lCe1N2zkUsxizuhG9mhigA7vEy2TYF144KVXKC/gI2U5hcSeLKlSBulrcQTGp8KEZzCVm2UZ0wTIITB3KzykrdK0ZHgEvBQ8VIs8WFBMVf7nv5HVuisEBD7jCUm/qF1iUmCxh/866h/eb350HX6lb653MkV2ffB29wyhEnxbGkcsntyb7fxqROGWKkRgdAgy75n5wLJtxvkc4Radzemjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbmLwNSMuYZAo7fR8QzVYV9He6jTmX1vWthY1/05Emw=;
 b=jiMSJsrZr4zrLv87N3r7oQMJ7v43sDirKQk2x07mX4Mat5h9h8LR641E53BkMRU3efvt0MR3kPSrUK8SbYShU4zF0QnD3G8hu3ypkUARM4Fn98swhChj2/7LRJAZDwPaP2UK66e6z76WC+1hHf3W5eo5AgEORmy6tK4gvr/fuo/wJAHGH4cWE2U0asfufOtkGJWM7jPEKdYslazz0v8rNDBuECGKLNbud3AdsFBt+p1wSy13zF0JO7ZkfYbro3gtyI9jAzON273x97n2Iq0CSQCpwJqEn0hE83oqyLaesPe/Hbhr1SeNHNj/8vewTR+rfQOOkqu7/feVhPhaLvXe7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::13) by KL1PR06MB6580.apcprd06.prod.outlook.com
 (2603:1096:820:ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:08:40 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::3c) by PS2PR01CA0025.outlook.office365.com
 (2603:1096:300:58::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:08:38 +0000
Received: from ZicharPC (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 562E54350703;
	Wed, 11 Mar 2026 20:08:37 +0800 (CST)
Date: Wed, 11 Mar 2026 20:08:36 +0800
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@cixtech.com,
	fugang.duan@cixtech.com, jank@cadence.com,
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <abFbRA33DtDdZ2j+@ZicharPC>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkueX=qU3OY3z=ANA9pd_irWjdf_Czc6RSctzr0MBftQQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|KL1PR06MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3c7288-70e8-4106-de7f-08de7f66eddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5veBnXOdcL9Z1kW+M+uY7RMZP7dXD18OVwbTuyePOMiNTzX1PSm5rm+JIBLs3kOKJk+Gv3Akei26xSWh4AuxRg3Uc17wGPFiW7FY1AtaUqXGXrbNFvHcV67MoIT2CarW4InO2x+Jj5jSoAOZnBw8iibuPW6DquKLAb2OY63eFDiCwrGAJb7PoQjpGZgSX8MWkw70hQW4sZtW3AN2kRZB/CU1xoYfjg7iQwGIDfMkkbOCkniUm3z5SfV82rEPR14J5qakx4qdvCADWxIp8sOM8h7eJWx7a3pX9XcMb/eGsj+Q8x8GIuWMrWCww6bDOm7X6KBrPwyoxqbFXnPf4wOJ4RJLBEZcLVTjIVUiDIj6bPPY2FadGXSCvSPQq8EPnwsb/2kHqIyj4qMfiTVEZ0cFsri7pXfGLeYDxEAVOigtfWMhcWzn6ux3PtWL9i+YIwpsU0P2WdkQ29mi8Z/Uo6vSn4VbWfmSZ4ZtmHWMWxh67J4fAbl05PxAyy+WNeoYt3ACarG7x0noh12mLHLSKknYJlm7CZk/U3UNuKaFS8iGEGd3h4X6m8wYZCzkjVUspY21ACy5YlbW7OLBhmZLiX6fZgZPbGa+IP7UWl1oLdsxl240EqxgAyQj1y0FtQ0rR3CPux67k8hqgynGD12UyaNf6VwN/dWUp6QoEc+o/ZAde6EM0cfgaEHEF8AutURSEMVtZn+fr2ale5K2u592uS8aeoazI/Ihg1k6uguFPYqqAuJGn/0nrXEJKPzzMi8UQ7eOyNWNN4cMEAvkmjCQeyY4dQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HbiiV0aSISSIrX/+fymGKXyGCLz4qT5Z4yaGF+xN75f0E/XPIzAVmw3gWGZbYwUJWgntucnKSl2HokEvY0lDiPOqF0cLl84dH75ulVBmAgdJ/5cdfV06nAO9tz4tIDakFK6Ai9PZVhZ1bRo3u2OTdqJrFBVNRsGHiiKLiaDEVa10Pk3yrdoF1nnuNqrFqiisSEqhrvOXYvEUgL67mPSmNqWOdWKXcIaBGQ+3+X7JLCw9rTEu8l5Yuoc3q4zBpJnFQpwOoAen2rRtgRqmgJzVM9bPJtqmoug/g1PTtV7uYFxUps0F1fLUQFBnjZx08K8KuKeQiTm4K/IOvWRZ/P5fnFetZEmJDtGMFAngncLsT49rLf8FYby6qeEV258W0EQMmZ2Th9HwcqBWrRRmnEDDaGjWk1IPBoIXFjPFJC1thTxMPbppJOZdJAEMlUFY6zbR
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:08:38.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3c7288-70e8-4106-de7f-08de7f66eddb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6580
X-Rspamd-Queue-Id: 3AE1926371B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aka.ms:url,cixtech.com:email];
	TAGGED_FROM(0.00)[bounces-33121-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zichar.zhang@cixtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:10:35AM +0100, Linus Walleij wrote:
> [You don't often get email from linusw@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> Hi Zichar,
> 
> On Fri, Mar 6, 2026 at 10:32 AM Zichar Zhang <zichar.zhang@cixtech.com> wrote:
> 
> > +  clock-names:
> > +    description:
> > +      Optional name for the GPIO controller input clock.
> > +    minItems: 1
> > +    maxItems: 1
> 
> I think clock-names: true should suffice, but the binding maintainers
> can say how
> they want it.
> 
> I would suggest to also add:
> 
>   gpio-ranges:
>     minItems: 1
>     maxItems: 32
> 
> At this point even if you're not using it FTM. This will make it
> possible to later
> map the GPIOs to the pin controller and control pin configuration from the
> GPIO subsystem.

Thanks. Given that cdns,gpio.yaml already defines "ngpios", would it make
sense to use it for the "gpio-ranges" definition?

Best regards,
Zichar Zhang

