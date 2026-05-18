Return-Path: <linux-gpio+bounces-37079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKLwCOkrC2oeEQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:10:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A456FA33
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 430AA301ABA8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 15:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AE0305673;
	Mon, 18 May 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dSvYOi9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4E26C385;
	Mon, 18 May 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116517; cv=fail; b=lwXT2v1kva4FyPKTL16mm7l3PXnXbF/glDQNl61HVhmRLGgfVG68q8Nms5/bLDSXyRMQKhqZCvh/ERKAtRv4E9O+ipNDvCsjNS95ewFu4D5S3OwZxupDIyxUyllsGyyJjgS5y5dxyV4P7lbkqb23ACgxe8XAxuj3vc0fHsk1l0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116517; c=relaxed/simple;
	bh=5EPluYsQTyrg8H8HAY8S9RDSHHgQ49E0PRIZklmKknc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gvWKtEsO8Rrpd3r2elld85jxNWC9gr9NowGALo3QGtB7QHO/e6IS3kXwTDnHGCxH6nflH76LR/XehDiXXiDw3UOlsLphTniBSd/8eP7vV4+JsfWcoalhrwV/AZAbtwUT8OvD3wij2eiuGQ0hm/VgNs3XaDMW5O1/mwi4gFGZzrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dSvYOi9y; arc=fail smtp.client-ip=52.101.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/MLlWwRXpdmycHp8+fZxjcXJdQZ9QSsfvytFOwZ9rtSIYgHlDPUu/XZw5UIDwYIHaQLYVFDLyiVAhHIbYAgM0WIpWEPDkjjxr4uERiq00bdD9AcD7y9FNWOu1+cI/XmtEjSjACReopntb0jIK/Qe1jK+qgCpRwTXyXOy3LE/649wzXMEyJwEAQRChanLrMeqVewRWmCBeP2g48f0xJr2WDMWl1YJkdSQO29IgYBf0Kk+3wBnLIpI/BhdpZbWtwEbX3dzWP27+ElHI2nYyabFF2rOUUbBCkwj3cgs/MTfJteUN+KRHnlIqldHQBZWg235vm4meRxhEYMttqPDK/eVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvLj49y1Cv0WBKsChKHd46/85V+NR0jQnbAm1ZNw62k=;
 b=ls+OV+KoYogQYjQiv/a5r0gGKrvsGEYV3oGs8qm2ai5B2eucoq/o1utl6x/KlJXFu8TZEeqHIPtEc4s5N3a05HOfNHh8rLsOup9Y/X1+aftX9Z/DEPQ5JKZ2zHcUv+lmBXol5e6cdroMVy764GfTp5GhnNPLfb4UXw/Sg5G8w7nOJlLUYCL4H8iLuPyMTcmPkYGGTKYPHcbJ1nvIQcjlL5qcbQQuQP5ou9zDX5dPBDSucAC3eMCaJE1c6i8S8fVo1/o5MO2+E+u4AArBL+NmbrgcB/D+MGjZLXAdA4dLCkeP9JHr6oiv06mXsh9bEXTX7kiVKbAc9McNzDkdrKt/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvLj49y1Cv0WBKsChKHd46/85V+NR0jQnbAm1ZNw62k=;
 b=dSvYOi9yPen7APyx0UtoLUn5125xvvsm23Vp6TzY+4xdQrJiOQGtgSHkmpZMB2EHlU8b/l1gAWPSdvpVJg58kQMW5KsmvFLESkuZZS5+Qp0jUbOQRwrjXmnIFvriqeB9loEUJIf9FrMh67zyq2Hx/KP8c2ud6Y/pRjQjdNcBRHM=
Received: from BN9PR03CA0568.namprd03.prod.outlook.com (2603:10b6:408:138::33)
 by DS4PR12MB9771.namprd12.prod.outlook.com (2603:10b6:8:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 15:01:52 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::4f) by BN9PR03CA0568.outlook.office365.com
 (2603:10b6:408:138::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 15:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 15:01:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 18 May
 2026 10:01:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 May
 2026 10:01:41 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 10:01:39 -0500
Message-ID: <43a11a8e-75a9-4625-a3a0-c55f2a1af296@amd.com>
Date: Mon, 18 May 2026 10:01:38 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
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
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
 <PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <agYHzH-nJLl1HFIn@p14s>
 <PAXPR04MB918587A8812B51BBB2A46A2C89032@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <PAXPR04MB918587A8812B51BBB2A46A2C89032@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS4PR12MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2488e9ce-8c37-40d5-92e8-08deb4ee64b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	cgyFGAw5lbc0Jpxw1uSPmXGj7YRdBA5eCuFhSq7zr8LTvPfbkT1DiAvsGyP0XUNfsw8yhn1HW3cDCy2veamtN4iuEo/Fi7UHzuu1qFLUF50B0t8ayaOu28w/0cnG2BVQiT/o8TO9VukfEvSd7HD60vIK5hru2F6Y+WABGtatlRVtvS3mS8upnOZb2JbkK9ebBCTPH77CO4bUdKfSTaT9cJfunulZnTCT21t/Z9rMSzricPfaUVAOXygbXjAZggydA8StNDR6O0TvSN48tisVB/gibhpj6ukp6VMtnjADA+IjVOEMEbLkmwootj91fYyjMWyvEJHP7SLcqHsDsp+vWnOtST0a9R+kVE20hCvAhLg9t6rzDUJAnOpCYNqKYrhnPaI99u6s0NFiCHtKt+w920rVkiTahWbQAsp1RduYdKndLB2gv8sZ3eLRZLtvtLtBTee91NaH2BIbXh0nmXKYG6AJNG1TDh6KLXRE5DovwHOrTcsZBF3naDrXXAvtQBH6/49M5Q0XyY/lKMa++eF5/N/Hms7C4YpiODcLR6j5+PF5y2vNjKqoGvm9zDILub2pFmpnh6KpVllCoo/M7ByxYighWYMgBcfTDPIlLLrkXW7+5iJzm6RVZ/lF7milZb3sszQygz9uB+rVWeIb32ryUdrqC/aGiWRG19M0vYf0HkMqyBeb3i1PyXb/gEgJ4Qp7TDasCUnJscfQzs+MhkNK1pcB/dExShgyXfgi3X4xfUI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A7QkFlrwtNT7/tzyYYVoRnfKW4Rwz8ELHQSu3IQY/DsSuCACp8MyQLf5KR43qqrrIYjiSUMi0bjWYjrenX2Yjv4lu8c+55dZq0ge2qUQyx0raJXlTkYH+CMfMkW2cQE/IDMMZxAvV3dtMySX974cVNyQpxhj/ChPqkRs/fYdddcs7C1i6M7GYfMj7CbbGV2cMq2MHAfOhp6EQG7gWdBMI+0O7Wh96N7Jk0fS+E8Y0r8J/lacmg9FSdgvG8VgnwKINl6DeWwNwVEq0k9NxwgEaxXeKIFeGvIIWjviP4uYpmJGe2taYQ3m3n+xld1fnkfZL/uW3A66wNpNGFUWD5j45CZrCf1bZY11XbSe0sPv4saxzyTPpJ5ssSJWW9C4vUsKlQpTn6BF0zRBbd6Tq4VgQmtHsifKWNPwvkQZ+FHgRYMprd9tz58zX7jDn+u6HAPp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 15:01:51.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2488e9ce-8c37-40d5-92e8-08deb4ee64b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9771
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37079-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[foss.st.com,ti.com,lunn.ch,kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 771A456FA33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/2026 9:24 AM, Shenwei Wang wrote:
> 
> 
>  
>>
>> On Thu, May 07, 2026 at 07:43:33PM +0000, Shenwei Wang wrote:
>>>
>>>
>>>> That was my initial approach.  We don't even need an additional
>>>> "rpmsg-io-*" in rpmsg_gpio_channel_id_table[].  All we need is:
>>>>
>>>> /* rpmsg devices and drivers are matched using the service name */
>>>> static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
>>>>                                  const struct rpmsg_device_id *id) {
>>>>  +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
>>>>
>>>>  -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
>>>>  +     return strncmp(id->name, rpdev->id.name, len) == 0;
>>>> }
>>>>
>>>
>>> If we encode the port index directly into ept->src, for example:
>>>
>>>     ept->src = (baseaddr << 8) | port_index;
>>>
>>
>> There is no rpmsg_endpoint::src.  You likely meant ept->addr.  This would work
>> but not optimal on two front:
>>
>> (1) rpms_endpoint::addr is a u32 and idr_alloc() returns an 'int'.  As such there is a
>> possibility of conflict.  I concede the possibility is marginal, but it still exists.
>>
> 
> I think there may be a misunderstanding in the implementation. In this case, we do not 
> need the return value from idr_alloc.
> 
> When the driver calls rpmsg_create_ept, it can pass an rpmsg_channel_info structure as an
>  input parameter. This allows you to specify the source address you want to bind.
> Please refer to the definitions below:
> 
> struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> 					rpmsg_rx_cb_t cb, void *priv,
> 					struct rpmsg_channel_info chinfo)
> 
> struct rpmsg_channel_info {
> 	char name[RPMSG_NAME_SIZE];
> 	u32 src;
> 	u32 dst;
> };
> 
>> (2) By proceeding this way, the kernel exposes the GPIO controller it knows
>> about.  It is preferrable to have the remote processor tell the kernel about the
>> GPIO controller it wants.
>>
> 
> If everyone agrees with this namespace announcement approach, I will prepare the 
> next revision based on it, even though it is not as clean as the source address encoding solution.
> 

I have ack on the namespace announcement approach. To me it is very
simple contract between the firmware and the Linux which allows dynamic
endpoint allocation without giving up security concerns. Also this
approach can be easily extended for any other rpmsg devices like i2c,
spi etc..  With the fix in the rpmsg_core.c, this will work. I will have
to see the actual implementation in the next rev to provide further
feedback.

Thanks,
Tanmay

> Shenwei
> 
>> I am done reviewing this revision.  Given the amount of refactoring needed, I will
>> not look at the code.  Please refer to this reply [1] for what I am expecting in the
>> next revision.
>>
> 


