Return-Path: <linux-gpio+bounces-35918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKVrD41R82khzgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:56:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 025384A3042
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E0953008267
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A85B40B6ED;
	Thu, 30 Apr 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dc+KGkgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF073A75AF;
	Thu, 30 Apr 2026 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553801; cv=fail; b=h8h/9rLbhqLchaduA2gHmPWegEZx+g5e2ln2n/irUXbhv75zwtOFdhSm16LmIl/v4ImFE7tTldPTpF/93WI2Y6j/Zm4M0eaS9YePDDfD3r16gDCpw7hHUSOWLT9YLv9XD3jKTwlT9pq+GXMZBdvAyYZKidGflTq7L55zj8bOCJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553801; c=relaxed/simple;
	bh=Y1ZS4AAQRhCl6Fn3sfYETvlLBLsYfbr51Rqb29O06mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C4HH5AANkNHCPsjc3NGLnTxwVJ/m7eYmohhBHeAwFtxz+QyvxnCMJdP4ap8NRRdDSgA76RvIVmZdJ69RjLzBgQVQQwqlpIL3rByZP9TkE7Od9TqE02NOiLYB84r+sUxXJvAbbwOX2raYk2Akk3/O9TFFOmpTds4b2e/Mi4so0M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dc+KGkgm; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTWwK8cQ6U70ibcvB0qL7UL6Zxfwjwc2ZwxECWwArCuEJivtcR04jPDEOxmuyArBe87WRJHsdypZF2xvftkOWVDeMHldANXKseHPH5I5ZLusw0zOcaqQ6DHHJowFX++pO61hfYaoM+elxkubzMxXYBtPz4W9Uby6FH/J5sYmeY8p72Dq6JjJhGZPOBoGWaSX0ECQTFQnVYUohVYEFtOJyUuL7Ih/2TvXW2vJyBbsRG8PFunpE4J/vUh/caFuxY44Mwz0qphTHzbnVnXDQWzKNmJCmfVL3vOEHdQGCDKFZG78FbN8QZDC4E9P2LnxKJKFkSqNxN0anmOcaTLj1WpWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1ZS4AAQRhCl6Fn3sfYETvlLBLsYfbr51Rqb29O06mc=;
 b=LngJO6GZSjPbj1tWQqLOze0y+NRcaq8037cRUlWXtEhuUF/wMC7l/5lgzuB8ucikRpFBlxStzJ2LNNVWTl/Yxe29px7OTeVzroyDdwE4DEtJFs+1co/rTonkfAqCOZmMCjQr9YnAWF6U8Hqo+A8TuEAoAAsbr9nQkhKf7A8n8tSc1v7DrzEJYGvQ6RPwDucKA54EXSA0lRsd5pI5qKdg0QcoTOPRcehFrU/y+JjYVBD0PjPa3rL0TQQL9si4bAXh0nQ4g/CkgiF8hDBDkEYVhvLJI3HMVXzFmJ2AFOBvCP7NZQrAA7ihkWvHsajT1vOFCM8XecnnaE44QFIU0z+taw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1ZS4AAQRhCl6Fn3sfYETvlLBLsYfbr51Rqb29O06mc=;
 b=dc+KGkgmhDFZdeK8S76W3kBp5Y+t6s9DS9tYalXi10kGysWBL8JqjVRfqj6GFC9uJgUyc3h63urPqzAXgufHDpI5hmQYQqjD4tP1xFgLWrrZPvbJgZqeDTzyzZIZYoUFV1mRK/qvdAlxqdGrFdL4wyIJQ541qsOctGTQ0VEo1Lk=
Received: from SJ0PR13CA0115.namprd13.prod.outlook.com (2603:10b6:a03:2c5::30)
 by SJ0PR10MB5661.namprd10.prod.outlook.com (2603:10b6:a03:3da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:56:35 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::65) by SJ0PR13CA0115.outlook.office365.com
 (2603:10b6:a03:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Thu,
 30 Apr 2026 12:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 12:56:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 07:56:21 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 07:56:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 07:56:21 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UCuE4V1152026;
	Thu, 30 Apr 2026 07:56:14 -0500
Message-ID: <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
Date: Thu, 30 Apr 2026 18:26:13 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, "Linus
 Walleij" <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SJ0PR10MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be2cdf-ecb7-4566-a356-08dea6b7e7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yPEhrMc/y8TytmIWjHha7fqppzgB6oczdGgWSAL+Ik9uAAg8lzD45uZt9LRlQdPzyRMWMUD7/BEa8FNOGyNB+GswRB4CMwhmUHtnm97yeA4YYstcwauGCcDZsIoaCe2Bp2pPsorxEQRnlq5fbpT7+0VJrX7YW7iOCp2xmwOGLIfGgVV7U/Ezp1DAgkTLkTvZPuznFJxFwhWEgUB2H1q0poFnU/Oga8NOIkFgKLUwxFuZYmDyY+cMpOVmX8I0EkIGcvwbjwuwNBkFcwzSYoNtjYaWiSxalO8Qqo5egvK8XrlR1BVW65GYZHajTNMil/nZ1Z2+x0PysivnvKaIrrZg0cTiyHjPV0rBHXh2zNp/sdKU+tDmeTuDBJ+kD+fI81HIHm/y83IEVEP++LhX0KPNYez0lOxKMf19EerwknrK3CFPikAFF/qYiHYqGXWdataRtkbnxBh5uaeiLDOLcQya6TSoOG1/7O1PNW8hgpEDNk4K2i9CVmeVQzDIgz6pJ8+3YRXOcWe1xsKvZJwwXvrRQZzniVCu6OMcg+2rTlIdHB8RYYNtmMZMNmT5ZKv0SfnIk1rC1HE+4Q2kCRa5yEIHz5WCmiylnSAtLxxR5lIkIGEups/LTpxlUTVoM0I1hDBhGaCYh40WkmDHHiV//n9ph48sMAVbNMKH6aYbWqBQE5VO2ERv1GnfFjPAked1pc0vn8yJ8tDbIeRZRyIR9YbflNXK/dpttLG/4RkWrPJoic4=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tM92HR5njS9vLWJ+EWINPUVS5iFvfNacTGjS9tblqbpsjOz9IbWmjkXqdkMX+lUKV3Zkry9EzvDrr+Cm4SoK03f9ajz9+H8CyWt/00gG8St3IXBa5TBIG3cq6/ubdPNzch1oirPf5B3kfERZarajxR+6ytMnxM+OVYfyHMCX+Ak5WriXGnljKKgwIfHiqewIdozCdf5L3sotQuTgjA7e5pzxTe6KQA3CTR+IfN/bTB04fIse0ZpsOHxeBPHp8N4VhbwmA2VUJTMBJtKhUAsl1RFGOO7yyNaHgEuMfX6jqym7vV4ptyTYVeW7+IONHfOp1NSQYyqCK3cewCl+hz5XozGXxIHARcRMrhFVi6azzxOlt1is39V+rBpSzdTd8W4UwYB4KuXZ3/PPK1OmwhSgQmcFaLHdOgRd3JX2GtaV89RVqYzT42xXR6vxDbuT8lKc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:56:33.0115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be2cdf-ecb7-4566-a356-08dea6b7e7cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5661
X-Rspamd-Queue-Id: 025384A3042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35918-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello Arnaud,

On 30/04/26 13:05, Arnaud POULIQUEN wrote:
> Hello,
>
> On 4/29/26 21:20, Mathieu Poirier wrote:
>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>
>>> Hi Mathieu,
>>>
>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>> <brgl@bgdev.pl>
>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>>> GPIO driver
>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>           __u8 status;
>>>>>>>>>>           __u8 value;
>>>>>>>>>> };
>>>>>>>>> It is the same message format. Please see the message definition
>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>
>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>>>>>
>>>>>>> Some changes to the message format are necessary.
>>>>>>>
>>>>>>> Virtio uses two communication channels (virtqueues): one for requests and
>>>>>> replies, and a second one for events.
>>>>>>> In contrast, rpmsg provides only a single communication channel, so a
>>>>>>> type field is required to distinguish between different kinds of messages.
>>>>>>>
>>>>>>> Since rpmsg replies and events share the same message format, an additional
>>>>>> line is introduced to handle both cases.
>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>>>>>> uniquely identify the target controller.
>>>>>>
>>>>>> I have commented on this before - RPMSG is already providing multiplexing
>>>>>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>>>>>> one GPIO controller.
>>>>>>
>>>>> You still need a way to let the remote side know which port the endpoint maps to, either
>>>>> by embedding the port information in the message (the current way), or by sending it
>>>>> separately.
>>>>>
>>>> An endpoint is created with every namespace request.  There should be
>>>> one namespace request for every GPIO controller, which yields a unique
>>>> endpoint for each controller and eliminates the need for an extra
>>>> field to identify them.
>>>
>>>
>>> Right, but this can still be done by just having one namespace request.
>>> We can create new endpoints bound to an existing namespace/channel by
>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>>>
>>
>> I will look at your suggestion (i.e link above) later this week or next week.
>>
>>> My mental model looks like this for the complete picture:
>>>
>>> 1. namespace/channel#1 = rpmsg-io
>>>      a. ept1 -> gpio-controller@1
>>>      b. ept2 -> gpio-controller@2
>>>
>>
>> I've asked for one endpoint per GPIO controller since the very
>> beginning.  I don't yet have a strong opinion on whether to use one
>> namespace request per GPIO controller or a single request that spins
>> off multiple endpoints.  I'll have to look at your link and reflect on
>> that.  Regardless of how we proceed on that front, multiplexing needs
>> to happen at the endpoint level rather than the packet level.  This is
>> the only way this work can move forward.
>>
>
> I would be more in favor of Mathieu’s proposal: “An endpoint is created with every namespace request.”
>
> If the endpoint is created only on the Linux side, how do we match the Linux endpoint address with the local port field on the remote side? 


Simply by sending a message to the remote containing the newly created
endpoint and the port idx. Note that is this done just one time, after this
Linux need not have the port field in the message everytime its sending
a message.

>
> With a multi-namespace approach, the namespace could be rpmsg-io-[addr], where [addr] corresponds to the GPIO controller address in the DT. This would: 


You will face the same problem in this case also that you asked above:
"how do we match the Linux endpoint address with the local port field
on the remote side?"

Because the endpoint that is created on a namespace request is also
dynamic in nature. How will the remote know which endpoint addr
Linux allocated for a namespace that it announced?

As an example/PoC, I created a firmware example which announces
2 name services to Linux, one is the standard "rpmsg_chrdev" and
the other is a TI specific name service "ti.ipc4.ping-pong". You can
see it created 2 different addresses (0x400 and 0x401) for each of
the name service request from the same firmware:

root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel                                                                                                                                                   
[    9.290275] virtio_rpmsg_bus virtio0: creating channel ti.ipc4.ping-pong addr 0xd
[    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev addr 0xe
[    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel formed from src = 0x400 to dst = 0xe
[    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13: new channel: 0x401 -> 0xd!

So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
Back to same problem. Simple solution is to reply to remote with the
created ept addr and the index.
 

>
> - match the RPMsg probe with the DT, 


We can probe from all controllers with a single name service
announcement too.

> - provide a simple mapping between the port and the endpoint on both sides, 


We are trying to get rid of this mapping from Linux side to adapt
the gpio-virtio design.

> - allow multiple endpoints on the remote side, 


We can support this as well with single nameservice model.
There is no limitation. Remote has to send a message with
its newly created ept that's all.

> - provide a simple discovery mechanism for remote capabilities. 


A single announcement: "rpmsg-io" is also discovery mechanism.

Feel free to let me know if you have concerns with any of the
suggestions!

Thanks,
Beleswar

>
> Regards,
> Arnaud
>
>>> 2. namespace/channel#2 = rpmsg-i2c
>>>      a. ept1 -> i2c@1
>>>      b. ept2 -> i2c@2
>>>      c. ept3 -> i2c@3
>>>
>>> etc...
>>>
>>> This way device groups are isolated with each channel/namespace, and
>>> instances within each device groups are also respected with specific
>>> endpoints.
>>>
>>> Thanks,
>>> Beleswar
>>>
>>
>

