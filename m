Return-Path: <linux-gpio+bounces-36504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHxzFQuBAWqebgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:11:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682B508E94
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1109730086C0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4700532E12E;
	Mon, 11 May 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KQ87JDpB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720BE3101C8;
	Mon, 11 May 2026 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483442; cv=fail; b=ot0g/YApjEWPDjhG1lNwFjyZxmx4mfA6K/Bwk+YWbaWdN/2oTpRVrrc8QdDrDdmyM61pIA8IFu/I/Or+Uepn65CgXqI0w0lKwQKK0Eq1PiSSOrCCy40mPhLmj0+kl0KfckvzzkCr9fnh5rL7kNL8lY/2PewNAjmyI9cnZPimk9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483442; c=relaxed/simple;
	bh=aH4VaXSpQtbvj5w1mWiqm6uzS7rrt2wOc0NpIuUxhxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iiV1GWIJONAbBXo71jIgHw4OOdxntDynJc1QxtAntbqxbW5LqL7f13mqyqUCZf0x5ALAzsFsacTMJasESW3VyrSiZlXjEUoY0e6sy1Z3lrSEvjdJLduYQHmkrGPC+eIOg/ACBWCUM9IzPy+SLRWJLb1My6i4QMkYwPJCGTNp/bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KQ87JDpB; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFBtDJ0Ljqgt86eGFAqtxv6xODcU0/OLzM69PtMp5kYcHSkHYL0Pfp/CROwAOqjbOtMmoz4dyhTxY7ihR2qLsxAzNbRrs52Cjw52kznUZKLOjUIbuzimLIUzDFJ7qmrAa/6AT12QwHzCBgOz86D713OLgftIaq+AIzztqxNd6QEiP+/ECdQ1mCQNc9EBQm1g+V54hqHwGkBBjJElsvz9ehT0BBzTsRXrKq9Pc/OYkKqptWS2Z8vXDI6skb5OJPmwa6A++Si51wSnORBGFsahXI5Nda72khv9wL50WCTLlKm/Wh5Bhq4nLDaB8BeExAROAwwNWqT3QpeWEAeC3tZS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xjdu3VxtYZ28io8DBLRvX9kig463+mEoghwQHa88to=;
 b=s+7ZNUhphPnL3VZDAVReBUYjOnqwzMOSkgA+A2ciFPWv0Bdpq6f0OhZLB0ZYdbjATWPZLZ8t0JwCQ6F4hW+fOd6v92wyeGTZHXe6JaJFexId9ZgEfJS5KoaygU1QhT2Z0JEqoQ+jgDndJEkZZpt22k3JJhXTXyqdWvXYDKqkS/QFMse+G7d+iDP7nbizbnvYqTy1+zyw/pmh6MF6x5YUAMRxa9E5SRwGtsNoyCW1P/xxVcEaJF23cQTUhnNVaMt4w3gIV/HUr15OORCdo+6+yWcPv/051n6GHZASPYcUT30AxGa8nsVnQoYDNLcU2UIA+6/HWEO1cW4rVG4Zt7Tgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xjdu3VxtYZ28io8DBLRvX9kig463+mEoghwQHa88to=;
 b=KQ87JDpBN4SIaEkf4XUqAeQiJuOJcvYZeKZpf/XSEqJqM1rBgLJiTkWJI5z/GDMiio8ArDnjuDxObZb+i26nz4/x+cYCFQ+LIl6V1QDGAKOQFryFm8NVq91wWSZCd4LHbFVtA4sw41feA2WMMa6MtedZvnXK5fMehjCiOtj+aOMV1Wp84QX3A6qBrhrd2PtOPIdccbvWiK7KijT8kqqNgohj6kOsJIImy0h8ytIgeBK128qzCRF3rU7yCXB9rxVcqasF6p8BHzflf/UVKoL0wb5gVC8z4MAIKPDnIuOPjgiAnieM4eCFtvbcyFUqY+whIB2zCfujV/ZNGeXwTarsOA==
Received: from CWLP123CA0197.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::20)
 by GVXPR10MB8664.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 07:10:33 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::9c) by CWLP123CA0197.outlook.office365.com
 (2603:10a6:400:19c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 07:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 07:10:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 09:14:19 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 09:10:30 +0200
Message-ID: <92a8e53e-412a-4475-89dc-62caf12e8c56@foss.st.com>
Date: Mon, 11 May 2026 09:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Beleswar Prasad Padhi <b-padhi@ti.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij
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
References: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com> <afzIABSh1xtMEGbf@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <afzIABSh1xtMEGbf@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|GVXPR10MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 9319f76a-efdb-4a3d-2e98-08deaf2c6433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FjCfTf7bUzXnw4vuucvFnShpiDyo8qKnLED625/sW2VP2untk+ftSF2pV/9hFpLuRVd84j92lYBQyzZA4gf0tL/XYu42JNNbpF6t2jmZkIRQ93moFyPrBa0197/qdMg8FXtBOaw6EZj8//0blwJ122HJ7awnS2VFnBewygBMB6BjExZRoS3F6w3EhCIsiubQTyruAHyrQBslxsJu86MwYeUe6nO2/Se2aOhdugav3Eh3DYqLMoqZR+2b+ZUiSYAY+p5oLv5ZG6wjUsuMAFnemSZ+GXLYQKa74Ulsli188Y2FjlEmTx73tj9xM/FGarbUmLYD1gXKxOd+fNXg/Wvo2pKkzVsDL3hazSvjGLk3o4vyp8bSbkVLIDWQxnVQQWx78ZqgLvrmfMyEnL+roh8O2eUX0WEikFi4ac7dz9OgP6zQrqxJB7OVcrFmyj4zHEUi+sYnhWZFi1CliljUbIQtX3Gn3W+6ayU0G2G3i9Wox8DKjSlgy/luEN3//Ay0MvGAvXsGklCYF/kYi79km0Oy8hR7PqfVEwCOyMD5jJvOziatJEDpQB78VFzBQ6WnuRfvf0xC0jdKD1NUofI+k3kOjB+isUUHKUKMjUWPqQVR9nLV9F2a6fgE1w6ctFwfap0m1yW9tvvM/or5DlImb+nwf0l9n3IZr+LTnoRbiqGNWvolcxxa8gxlJOM/gQxL0zjVvwm7qbhT61cMJItX74/jD6U2Yg6EW8G5edjIIp6zU2g=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2ag6a8+a2dCUMeGxPVIFyf8qRS8Si7BYvPj9A3w7oq7Mg1M5WVUHy0oKUMALYR6uQIsdaiaQrfrRv0TNKOQTaEahq5ok3atJdSrqnF6mR+dHc/fIRIMZEFKwIEwmRaYpDAY+GdsP35KEuhTZQbwVAuAF2F0fe54jBwfuB/hP36n0vailt5MyD/OYOTrigD4d1Gz3Zx9UxswEvkjOsO585hWVDIW6VEMteFB0L+aae0urTipKH/y9mYU7sE9UilpBIgwukeB9QN3+SJSIakxRg+PI+lt+SWYwAeSuyfNQrlIQw/ZqwZdH77YowZ+iK9ocJPXbGIn6alL84aeCIeoZDl+517ther3HuiBP6oPxREQzNEhHyyP5YZY5XOlTVQMQnXcGPM/nGQgSEEvK53o1JWSn3Z/Ba8/Rl0xom0ujCCSZbaBC3xQPAfsNkxLyB4gR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:10:32.6847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9319f76a-efdb-4a3d-2e98-08deaf2c6433
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8664
X-Rspamd-Queue-Id: 9682B508E94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36504-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Hello Mathieu,

[...]
>>
>> A third option would be a combination of both approaches: instantiate the
>> device using the same name service from the remote side, as done in
>> rpmsg-tty. In that case, a get_config message, or a similar mechanism, would
>> also be needed to retrieve the port information from the remote side.
>>
> 
> I'm not overly fond of a get_config message because it is one more thing we
> have to define and maintain.
> 
> Arnaud: is there a get_config message already defined for rpmsg_tty?

No there isn't.

Regards,
Arnaud

> 
> Beleswar: Can you provide a link to a virtio device that would use a get_config
> message?
>   
>> Tanmaya also proposed another alternative based on reserved addresses.
>>
>> At this point, I suggest letting Mathieu review the discussion and recommend
>> the most suitable approach.
>>
>> Thanks,
>> Arnaud
>>
>>>>
>>>> At the end, whatever solution is implemented, my main concern is that the
>>>> Linux driver design should, if possible, avoid adding unnecessary complexity
>>>> or limitations on the remote side (for instance in openAMP project).
>>>
>>>
>>> Yes definitely, I want the same. Feel free to let me know if this does
>>> not suit with the OpenAMP project.
>>>
>>> Thanks,
>>> Beleswar
>>>
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>
>>>>> So Linux does not need to send the port idx everytime while sending a
>>>>> gpio message anymore.
>>>>>
>>>>> Thanks,
>>>>> Beleswar
>>>>>
>>>>> [...]
>>>>>
>>>>
>>


