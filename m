Return-Path: <linux-gpio+bounces-36087-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNCmMV7x+GnJ3QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36087-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 21:19:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7664C3234
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 21:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1EBE3008251
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 19:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0E63E3D89;
	Mon,  4 May 2026 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c5iIyuvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66131E83A;
	Mon,  4 May 2026 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922394; cv=fail; b=ojdN9bXB0/v+FS5XV73AUGIdWGoKe4EbSs8hkekrw4MSm3Q6HhYflyK5bVb6VcicBfuU+lIynNgDeI8KlVy19guf30gNx69TE9WmCVL3sOIGSethya29sx+StqUfdzP0iTDuoYImSCxlemuOGquUS31HFW5KRoUhJXsGtfBCHk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922394; c=relaxed/simple;
	bh=og+5cAotmNuPl1N+G2oeGoIoHA9jFTIE/KHYIUUWPDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y2Y3RtVjxVPkevVJfIWahaj9RtAW74SRPAOSWkTyCQc56vtpB9TTaADHXzliG0hPpH5JpB7oeZY6dBJ8lkd5M+7TM0I3ivwgpAxw47IYazk0sU7eD8F8h8hY2A73aP5DrqiLznbLCGdK0P5hIu+BhHs3qkCqi8MqiNDUzfzCjXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c5iIyuvz; arc=fail smtp.client-ip=52.101.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYPgyEJnTCCGfiwCEVz1Ifv4g5cg5EPxERoaQd9vFtUxVlJiWQ1VlJ10OXgYm3KmGGdbJA1vnlUpwC+GckCxroHoRWxrpzs6i5bxOWkmqMSNyzDe6kdHHO8kIzzaQ2at7Eewlo3yZydPynmhAdMFFyuFT5HpIEATXUc3kuIA9QyZR1ynr9CZ2N9UpkyKG3dH029ThR7XBXfbViZUQJSAk59suDb5wGN84IOLARl+3z/r4LTQ4WkcNEOEJ9NiP3uWSgW5CyvlwnVuBqrLdQwdn9ug3v/E4jQZHScnecHaHbjiQ1ho4l3G88tnKl69XBouhoISapvntaOTKXpwMlsw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeLb5y7X6e53BqFWnYp/qvAu+NG/u3hKw2tLW6dD/8M=;
 b=ZBC6pnxGtgk50IpHNvfRjvpPFG5QRE7WGa+hPuuCm+R4OZreW5njw7xOAZ7DUKicz3WV9Vyagmo3cO331u5ui9UoyA2XU8mD2cguiZIpuzTH+FdOYVJgJ8Q8cbCd1BNOEJVt1HxU+u5iDsVBH+69peIUrFCG1+PM1q985ctBX17DBLsGXQwkw/SSrR5eabafbag/u1OqH/oShleIfkebU0/W4C2y4NiIqmCLfGhgxS/Rx2APYwuXds8I8zK5YWprkvVLpLvMU3ATYsdcGCk1rvAthY266l6fG+diqLZm2ZRLbaTNVRk9MgPHwUKuTDZZdOV8sucSEzw8KuCADxAG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeLb5y7X6e53BqFWnYp/qvAu+NG/u3hKw2tLW6dD/8M=;
 b=c5iIyuvzk2tIN8ZLBxoAwnL7xLWS0PzJllC8U3llE7hKzOnh8O+DFwV0oBPoI6vrnlX/g22iZVdDLnZiGTHWU3uxwaBEMDiys5HTBK79jcLpRkFJqCSihH1XkwaSyLemQHDD9iFd3jFKaOeai2aWiUTiVY+VTq1wk0yu9DHSj4A=
Received: from BYAPR06CA0048.namprd06.prod.outlook.com (2603:10b6:a03:14b::25)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 19:19:39 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::c5) by BYAPR06CA0048.outlook.office365.com
 (2603:10b6:a03:14b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 19:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 19:19:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 4 May
 2026 14:19:37 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 4 May 2026 14:19:36 -0500
Message-ID: <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
Date: Mon, 4 May 2026 14:19:31 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi
	<b-padhi@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
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
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e9b2b9-19a1-4798-ecce-08deaa1215ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y/RFpCDNDZOAfRkJ/Fw5Nl4qHVDEeKXwYx5hqrj5z8PScKUStAJ4ZEHvvw4jCdw4a035A9/HCaWDncevYWRj8CjwCCgEZJ9LfxiVoRjlaozVla5g6ZlkjnFCZrurRnP/75MO1O8Rhz/KN4rW6eAjo/prAggaBz89Cdq0Yz87MFD41uP4adoPyTUpMYNAOkEMSuvGGYNZcbiQY2Ghopj+Y0Q48up7H1wyMlcYh05nKdw0d4X49kE3y6sYLKHplrXn5n7DJycq9mbnFikyqvOed6+xBYCu0jvZXxQPyhA2KCvwnjKt7FjmKLZdtedomdqcyHtUyeNbLm1mjazPzJfPDKEORuvzE2NVCRW0x7/RQHqmSQiBiOWM8k10vQCWimtLsG1ZWjb+3LSgzNAHBqYzt9DweylhOpTs3O3hlC8RhKsl0jaam8Q7OZ563Pnyoa5RR7Hs4vt7y54dhQaSWOekdFoLFKWbg/zp4O4K82VAtS03nv+rAixHfcyxk4wUKuL7KMwkmoIA3UmJgdarEXwXB5u+Qbq4EarYHp//qI9Go4Zxsz53PQEO+mXOkdYEWfQM6PcLgC3iwpdXfPYuPqKSlxe3itNprGn1W8YZzPRMhqeiwaDCVfpleNhV4TZ57QGLom6hmB/vtRYGMbbE3P2nsuu7t+NwW4ZWipzR1fQkMHgWN3EkT6hm/0EAchvG2wMz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EA3x+2Ti+qadqx3QstxQmfCi7BU7b295s4aDTRBrzArj8kufK3a1+ws4QpAP5c66tNHxeZlckzzFR1EHfDTaioMVOx7srC+I5rKkfNYoiFdfjL7ufKb53Lq9Uo0Arp0C3GgvLqeAzRb66Kyf0cqxBs+uG7F3MtOVBpAqci9+GVLBS0GM28GciCHFNhe9ftNl7cLcPbxUnajkvQFgV2Fzit14aJ9ybrMsvInf0qwbZfbP90qhTzjHL4Yu0ZG3RooiFy3WcVNEgIlhD+srgEx+vuzbfyyvyKO118N2fDMODKvAv9WjlB4iDwYrQ8YIUc3rs01U2uRnKOnqJVWUr9wKUFfD7qcIJ0v2dI17h1qocgbRHrtI2C4dCkLs8c6uvKVJZBD02JlvixDZK2JDvUaA2LaHN5Ed4vticvArM+Fmc5T1VDApL3h2m2dglKzcx75+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 19:19:38.5770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e9b2b9-19a1-4798-ecce-08deaa1215ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
X-Rspamd-Queue-Id: 6A7664C3234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36087-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]


Hello all,

I have started reviewing this work as well.
Thanks Shenwei for this work.

I have gone through only the current revision, and would like to provide
idea on how to achieve GPIO number multiplexing with the RPMsg protocol.
Also, have some bindings related question.

Please see below:

On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>> Hello Arnaud,
>>
>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>> Hello,
>>>
>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>
>>>>> Hi Mathieu,
>>>>>
>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>> wrote:
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
>>>>>>>> padhi@ti.com>; Linus
>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>>>>> <brgl@kernel.org>; Jonathan
>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>> Krzysztof Kozlowski
>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>>>>>>>> Andersson
>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>> <skhan@linuxfoundation.org>; linux-
>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>>>>>>>> kernel@vger.kernel.org;
>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-
>>>>>>>> linux-imx <linux-
>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>> rpmsg GPIO driver
>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>>>>> Jonathan
>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>>>>> <conor+dt@kernel.org>;
>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>>>>> GPIO driver
>>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>>            __u8 status;
>>>>>>>>>>>>            __u8 value;
>>>>>>>>>>>> };
>>>>>>>>>>> It is the same message format. Please see the message definition
>>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>>
>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
>>>>>>>>>> message format.
>>>>>>>>>>
>>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>>
>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>>>>> requests and
>>>>>>>> replies, and a second one for events.
>>>>>>>>> In contrast, rpmsg provides only a single communication
>>>>>>>>> channel, so a
>>>>>>>>> type field is required to distinguish between different kinds
>>>>>>>>> of messages.
>>>>>>>>>
>>>>>>>>> Since rpmsg replies and events share the same message format,
>>>>>>>>> an additional
>>>>>>>> line is introduced to handle both cases.
>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
>>>>>>>>> field is added to
>>>>>>>> uniquely identify the target controller.
>>>>>>>>
>>>>>>>> I have commented on this before - RPMSG is already providing
>>>>>>>> multiplexing
>>>>>>>> capability by way of endpoints.  There is no need for a port
>>>>>>>> field.  One endpoint,
>>>>>>>> one GPIO controller.
>>>>>>>>
>>>>>>> You still need a way to let the remote side know which port the
>>>>>>> endpoint maps to, either
>>>>>>> by embedding the port information in the message (the current
>>>>>>> way), or by sending it
>>>>>>> separately.
>>>>>>>
>>>>>> An endpoint is created with every namespace request.  There should be
>>>>>> one namespace request for every GPIO controller, which yields a
>>>>>> unique
>>>>>> endpoint for each controller and eliminates the need for an extra
>>>>>> field to identify them.
>>>>>
>>>>>
>>>>> Right, but this can still be done by just having one namespace
>>>>> request.
>>>>> We can create new endpoints bound to an existing namespace/channel by
>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>> b73d-228295daaeec@ti.com/
>>>>>
>>>>
>>>> I will look at your suggestion (i.e link above) later this week or
>>>> next week.
>>>>
>>>>> My mental model looks like this for the complete picture:
>>>>>
>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>       a. ept1 -> gpio-controller@1
>>>>>       b. ept2 -> gpio-controller@2
>>>>>

If my understanding of what gpio-controller is right, than this won't
work. We need one rpmsg channel per gpio-controller, and in most cases
there will be only one GPIO-controller on the remote side. If there are
multiple or multiple instances of same controller, than we need separate
channel name for that controller just like we would have separate device
on the Linux.

>>>>
>>>> I've asked for one endpoint per GPIO controller since the very
>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>> namespace request per GPIO controller or a single request that spins
>>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>> to happen at the endpoint level rather than the packet level.  This is
>>>> the only way this work can move forward.
>>>>
>>>
>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>> created with every namespace request.”
>>>
>>> If the endpoint is created only on the Linux side, how do we match
>>> the Linux endpoint address with the local port field on the remote side?
>>
>>
>> Simply by sending a message to the remote containing the newly created
>> endpoint and the port idx. Note that is this done just one time, after
>> this
>> Linux need not have the port field in the message everytime its sending
>> a message.
>>
>>>
>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>> [addr], where [addr] corresponds to the GPIO controller address in
>>> the DT. This would:
>>
>>
>> You will face the same problem in this case also that you asked above:
>> "how do we match the Linux endpoint address with the local port field
>> on the remote side?"
> 
> Sorry I probably introduced confusion here
> my sentence should be;
>  With a multi-namespace approach, the namespace could be rpmsg-io-[port],
>  where [port] corresponds to the GPIO controller port in the DT.
> 
> 
> For instance:
> 
>       rpmsg {
>         rpmsg-io {
>           #address-cells = <1>;
>           #size-cells = <0>;
> 
>           gpio@25 {
>             compatible = "rpmsg-gpio";
>             reg = <25>;
>             gpio-controller;
>             #gpio-cells = <2>;
>             #interrupt-cells = <2>;
>             interrupt-controller;
>           };
> 
>           gpio@32 {
>             compatible = "rpmsg-gpio";
>             reg = <32>;
>             gpio-controller;
>             #gpio-cells = <2>;
>             #interrupt-cells = <2>;
>             interrupt-controller;
>           };
>         };
>       };
> 
>  rpmsg-io-25  would match with gpio@25
>  rpmsg-io-32  would match with gpio@32
> 

The problem with this approach is, we will endup creating way too many
RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
many GPIOs can be handled by remote from memory perspective. At
somepoint we might just run-out of number ept & channels created by the
remote. As of now, open-amp library supports 128 epts I think.

> 
>>
>> Because the endpoint that is created on a namespace request is also
>> dynamic in nature. How will the remote know which endpoint addr
>> Linux allocated for a namespace that it announced?
>>
>> As an example/PoC, I created a firmware example which announces
>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>> see it created 2 different addresses (0x400 and 0x401) for each of
>> the name service request from the same firmware:
>>
>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
>> ti.ipc4.ping-pong addr 0xd
>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev
>> addr 0xe
>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel
>> formed from src = 0x400 to dst = 0xe
>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
>> new channel: 0x401 -> 0xd!
>>
>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>> Back to same problem. Simple solution is to reply to remote with the
>> created ept addr and the index.
> 
> That why I would like to suggest to use the name service field to
> identify the port/controller, instead of the endpoint address.
>>  
>>>
>>> - match the RPMsg probe with the DT,
>>
>>
>> We can probe from all controllers with a single name service
>> announcement too.
>>
>>> - provide a simple mapping between the port and the endpoint on both
>>> sides,
>>
>>
>> We are trying to get rid of this mapping from Linux side to adapt
>> the gpio-virtio design.
>>
>>> - allow multiple endpoints on the remote side,
>>
>>
>> We can support this as well with single nameservice model.
>> There is no limitation. Remote has to send a message with
>> its newly created ept that's all.
>>
>>> - provide a simple discovery mechanism for remote capabilities.
>>
>>
>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>
>> Feel free to let me know if you have concerns with any of the
>> suggestions!
> 
> My only concern, whatever the solution, is that we find a smart
> solution to associate the correct endpoint with the correct GPIO
> port/controller defined in the DT.
> 
> I may have misunderstood your solution. Could you please help me
> understand your proposal by explaining how you would handle three
> GPIO ports defined in the DT, considering that the endpoint
> addresses on the Linux side can be random?
> If I assume there is a unique endpoint on the remote side,
> I do not understand how you can match, on the firmware side,
> the Linux endpoint address to the GPIO port.
> 
> Thanks and Regards,Arnaud
> 
>>
>> Thanks,
>> Beleswar
>>
>>>
>>> Regards,
>>> Arnaud
>>>
>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>       a. ept1 -> i2c@1
>>>>>       b. ept2 -> i2c@2
>>>>>       c. ept3 -> i2c@3
>>>>>
>>>>> etc...
>>>>>

Just want to clear-up few terms before I jump to the solution:

**RPMsg channel/device**:
  - These are devices announced by the remote processor, and created by
linux. They are created at: /sys/bus/rpmsg/devices
  - The channel format: <name>.<src ept>.<dst ept>

**RPMsg endpoint**:
  - Endpoint is differnt than channel. Single channel can have multiple
endpoints, and represented in the linux with: /dev/rpmsg? devices.

To create endpoint device, we have rpmsg_create_ept API, which takes
channel information as input, which has src-ept, dst-ept.

Following is proposed solution:

1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
pin/port).
  - In our case that would be, single rpmsg-io node. (That makes me
question if bindings are correct or not).

2) Assign GPIO number as src ept.

i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
endpoint.

Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we can
add 1024 offset to the GPIO number:

so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
(GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)

Now on the remote side, there is single channel and only single-endpoint
is needed that is mapped to the rpmsg-io channel callback.

That callback will receive all the payloads from the Linux, which will
have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).

It can retrieve GPIO_NUMBER easily, and convert to appropriate pin based
on platform specific logic.

This doesn't need PORT information at all. Also it makes sure that
remote is using only single-endpoint so not much memory is used.

*Example*:
If only rpmsg-gpio channel is created by the remote side, than following
is the representation of the devices when GPIO 25, 26, 27 is assigned to
the rpmsg-io controller:

Linux                                                      Remote

rpmsg-channel: rpmsg-gpio.0x400.0x400

/dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
                                                  |
/dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
                                                  |
/dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callback.


*On remote side*:

ept_0x400_callback(..., int src_ept, ...,)
{
	int gpio_num = src_ept - RPMSG_RESERVED_ADDRESSES;
	// platform specific logic to convert gpio num to proper pin,
	// just like you would convert gpio num to pin on a linux gpio controller.
}

My question on the binding:

Why each GPIO is represented with the separate node? I think rpmsg-gpio
can be represented just any other GPIO controller? Please let me know if
I am missing something. So rpmsg channel/rpmsg device is not created per
GPIO, but per controller. GPIO number multiplexing should be done with
rpmsg src ept, that removes the need of having each GPIO as a separate node.


rpmsg_gpio: rpmsg-gpio@0 {
		compatible = "rpmsg-gpio";
		reg = <0>;
		gpio-controller;
		#gpio-cells = <2>;
		#interrupt-cells = <2>;
		interrupt-controller;
	};

Then in DT, use like regular GPIO, but with the rpmsg-gpio controller:

rpmsg-gpios = <&rpmsg_gpio (GPIO NUM) (flags)>;

If the intent to create separate gpio nodes was only for the channel
creation, then it's not really needed.

[1]
https://github.com/torvalds/linux/blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/virtio_rpmsg_bus.c#L136

>>>>> This way device groups are isolated with each channel/namespace, and
>>>>> instances within each device groups are also respected with specific
>>>>> endpoints.
>>>>>
>>>>> Thanks,
>>>>> Beleswar
>>>>>
>>>>
>>>
> 
> 


