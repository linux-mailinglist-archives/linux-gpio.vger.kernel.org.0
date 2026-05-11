Return-Path: <linux-gpio+bounces-36627-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAQaM8VLAmpaqQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36627-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:36:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FC516563
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDCC9302AD2E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BD44D90C7;
	Mon, 11 May 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V+cLrSUC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF94D90B2;
	Mon, 11 May 2026 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535358; cv=fail; b=mVvbsuLp9nU7N9H/Ms0Ew9DvnXYGNfy8bY7LZH+TCRuY0P5mqsL8K1DQquY4+nhcV66dhRy4rx9vd6Ywo5sSQh7Z2mYw0sjh03XrwN8tUVaBAwXQAMOwUw9loIe20n4AD7+zFsKIn/K2rpc2AjTrnbx82wd662xrxIfr/LHJ2Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535358; c=relaxed/simple;
	bh=3dnMpTTl8VAbOaV6gU8dsOZtBdv6ZLb5WR38CZE/SEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jXfCWKT/qbdhEDwqsTfqp2qvwIF180QXSHXTypcqnvG5kGVmnR7qBCNelrtjBEWhIBP4+ecFoVMjHV01ojilhkz138ldqZn+Vd0p6XiVI47Dbd2KRm+ubnOrW4MTingzYY4i/jiLBdg8QnoJZy4He4fXu4IAg2ZVSJnkfdDPqlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V+cLrSUC; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzljeZfxa01+NDaIXelIgEKZ/EAVyJZs2H7X2joYC1usRbKKntlU7ciHYBPioB1BLfey7qRAGaIp3iQbTfJ7yZdMDUPmy8SD4SgMy2K9Aooal5exXexsaPsqiBarHcklpOvEcVBI73XL23sDZUdh2snol+4/w4SgdUu5RHj7Y2DGP4Ff9Yi56jKru4OjuH//aFAgRIQQE3ncyqxDzg7864Q1mMc4yVTSmvQTLb5hkQh8lCqfUThqOFPbyrtwfE0ZfGbNCXehYsUDUabCJCOGN8igtZmdKAbPw6g+7+Sqkt05B0ByYaMqcGPYDoL4dBs9cIimtvUdTzygY4cveX17MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDGADdAtsnxLu6MxP+qjs/hhRt2jMIWCveSJeSKP54Q=;
 b=bptfIZCyr+mSX67nRxth9VuCYOa9LEKeDcob/CI/UEIGOZUh5FNEbiCs/4yADNbliSNsmad1z8I1BMwufn+TV1oDdUQesdQ9rGzRiAjJVoMKUaABrY6135UMsjD/8PxXKq0r9KYYEajWlBCg244DGM5OwcGUmQXH/thuGJt7rC0Ch9GhlXCLZHbuNUpm+DpPas2iNhOtpM+wqwsTb8iAO0pQ8bDmAGL6OX4feyHFN2TdH3jxvabvdUEdKNpiWhH1CzsMLQ1jx+fl+aFX8CCUX8SzfUn9bezrR/IZrzW9m6XQuOZoiYAVF1/OgoXEQQ5X6IYCCbDEGsYe235+AzAnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDGADdAtsnxLu6MxP+qjs/hhRt2jMIWCveSJeSKP54Q=;
 b=V+cLrSUCB4otgTSgp+4bL6LAlxgWT3lF0ujETQZ7kH0Kik5hdWyenFrME1DYsEBRIVMZ6WBUkL+EI9U1t7taPVqrnu1+Ve6AQ9XW2ZMZRGGmikza0eUuspQXF0oUmZqQcTTA0AiS2ERLkwhMOZ/Vsuptg8aZfi26isD2oqHi8go=
Received: from PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::29)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:35:48 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::c8) by PH8P221CA0048.outlook.office365.com
 (2603:10b6:510:346::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:35:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 16:35:47 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 16:35:45 -0500
Message-ID: <ae5cfa0f-e929-4abb-b27b-8eb27586d183@amd.com>
Date: Mon, 11 May 2026 16:35:46 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi
	<b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn
	<andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
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
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d26852-97e1-4a2a-4c02-08deafa54410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|13003099007|56012099003|3023799003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	NWw+AST4dL8NaHfkEKuI7eEjXVCGrQvA3rnr/LICh9HdxIvr+GQ32dH+FlWp4VuErDzhHgRPuRo0w+4ohtWcsCaiWcbOcxNh+xksiIUhQ6OP3b6ANG2+DBJesQD5hijozXw3JDz7RQEdLJ8IvQZ8Hak4gbUgiOhft3wi1pXip/hW+JdCswiQvRChErfZHumB1WI47sFj/JvrFfsUk0lY7PyLgkMBMSUEBlKGuiS7WscOQgUhEKkHm2AEGA4fvv3PEu6q+c1oGW5efeyoKc0usPilZKgvtBH3fGAYeN/U0ku2I4CKzp2T0RfMJfeR2gRdx1kXRgy0X2fD7f0kTvaNw5x3hBPqyPoTLULoqGrprP6Qsni3n8UVl55hgVZtxVjMgScKbLyy9o16K3U+xvXg9IxtILq64+ygbbWQOH+ZiE7qKGaY/fBLORbjEehnkNm5UNtM4mQfkuvBn0xG9R13aXG6JuVDr32Qi7qhxJOBct4okuHdPbqfRMEmmVYaBPvjacgBTMR9MdMG1UqHDnIZW5zbrWlcIMyJCOzuaqThd4N5xQW6A1i6Mp0PNPwyOnswmZ9qYxS/OokJ1EkUq3rrR+6AZsOMQ9+cDiRLWzPERZRo9+/rI+QsSuSwyliieTR5pIYIbzTgarSBoVbMD2xO9GnZaKIaf/2bTPGMWYgt9PLW4cvhBlMZpkDXh1HlY9/pTGs3/MeVtKItSaqRKh2nhGpEB1kHKsQFe3conUidPX8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(13003099007)(56012099003)(3023799003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UMg8CHmhdnsn7il2hLEZ2gVH7Va0/LIg/wblqaHuzS+ENCMFPlPfnPOCqS4xlvcb05/mVVZuKtDVkRcfmrKleaeF+Utszfh0fDomuHAng2sSF6uz9nVakyCYrRWI4oT0RIyVqKVscaOweSAP8X+AQCyOZAc21NmqDd441k0W/jfNu3beXfT5V/XP+kHlbjFC2WAzqRA0Ddm4lRrmVmKBnfr8zgGZTpc0tQM5cD6VRnuma6fyXJK7EvOV7kFfBrkR9Qwk48tlVQJ60ANIyP7yM64xAGvnacadY/AvyUIX55fU0JEsZTIsqmDkUwr52AZ9y/m23UnOqgkBZTIfKtQFICj76mznkP7LUSgC1wPP0jKrc1J0rEOKXC9yDjctOMX37DpQ0GFiOQDt3Ll+6d321yua6SgUbrDYsP6TaEZQziR0alPWzAU2whla3ZaNGBx0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:35:47.8826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d26852-97e1-4a2a-4c02-08deafa54410
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
X-Rspamd-Queue-Id: 655FC516563
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36627-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,ti.com,nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action



On 5/11/2026 12:58 PM, Mathieu Poirier wrote:
> On Mon, 11 May 2026 at 10:47, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>>
>> On 5/5/2026 10:52 AM, Shah, Tanmay wrote:
>>>
>>>
>>> On 5/5/2026 4:28 AM, Arnaud POULIQUEN wrote:
>>>> Hi Tanmay,
>>>>
>>>> On 5/4/26 21:19, Shah, Tanmay wrote:
>>>>>
>>>>> Hello all,
>>>>>
>>>>> I have started reviewing this work as well.
>>>>> Thanks Shenwei for this work.
>>>>>
>>>>> I have gone through only the current revision, and would like to provide
>>>>> idea on how to achieve GPIO number multiplexing with the RPMsg protocol.
>>>>> Also, have some bindings related question.
>>>>>
>>>>> Please see below:
>>>>>
>>>>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
>>>>>>
>>>>>>
>>>>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>>>>>>> Hello Arnaud,
>>>>>>>
>>>>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Hi Mathieu,
>>>>>>>>>>
>>>>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
>>>>>>>>>>>>> padhi@ti.com>; Linus
>>>>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>>>>>>>>>> <brgl@kernel.org>; Jonathan
>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>>>>>> Krzysztof Kozlowski
>>>>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>>>>>>>>>>>>> Andersson
>>>>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
>>>>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>>>>>>>>>>>>> kernel@vger.kernel.org;
>>>>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-
>>>>>>>>>>>>> linux-imx <linux-
>>>>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>>>>>> rpmsg GPIO driver
>>>>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>>>>>>>>>> Jonathan
>>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>>>>>>>> Krzysztof
>>>>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>>>>>>>>>> <conor+dt@kernel.org>;
>>>>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>;
>>>>>>>>>>>>>>> Sascha
>>>>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>>>>>>>> rpmsg
>>>>>>>>>>>>>>> GPIO driver
>>>>>>>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>>>>>>>             __u8 status;
>>>>>>>>>>>>>>>>>             __u8 value;
>>>>>>>>>>>>>>>>> };
>>>>>>>>>>>>>>>> It is the same message format. Please see the message
>>>>>>>>>>>>>>>> definition
>>>>>>>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
>>>>>>>>>>>>>>> message format.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>>>>>>>>>> requests and
>>>>>>>>>>>>> replies, and a second one for events.
>>>>>>>>>>>>>> In contrast, rpmsg provides only a single communication
>>>>>>>>>>>>>> channel, so a
>>>>>>>>>>>>>> type field is required to distinguish between different kinds
>>>>>>>>>>>>>> of messages.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Since rpmsg replies and events share the same message format,
>>>>>>>>>>>>>> an additional
>>>>>>>>>>>>> line is introduced to handle both cases.
>>>>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
>>>>>>>>>>>>>> field is added to
>>>>>>>>>>>>> uniquely identify the target controller.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I have commented on this before - RPMSG is already providing
>>>>>>>>>>>>> multiplexing
>>>>>>>>>>>>> capability by way of endpoints.  There is no need for a port
>>>>>>>>>>>>> field.  One endpoint,
>>>>>>>>>>>>> one GPIO controller.
>>>>>>>>>>>>>
>>>>>>>>>>>> You still need a way to let the remote side know which port the
>>>>>>>>>>>> endpoint maps to, either
>>>>>>>>>>>> by embedding the port information in the message (the current
>>>>>>>>>>>> way), or by sending it
>>>>>>>>>>>> separately.
>>>>>>>>>>>>
>>>>>>>>>>> An endpoint is created with every namespace request.  There
>>>>>>>>>>> should be
>>>>>>>>>>> one namespace request for every GPIO controller, which yields a
>>>>>>>>>>> unique
>>>>>>>>>>> endpoint for each controller and eliminates the need for an extra
>>>>>>>>>>> field to identify them.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Right, but this can still be done by just having one namespace
>>>>>>>>>> request.
>>>>>>>>>> We can create new endpoints bound to an existing namespace/
>>>>>>>>>> channel by
>>>>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>>>>>>> b73d-228295daaeec@ti.com/
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I will look at your suggestion (i.e link above) later this week or
>>>>>>>>> next week.
>>>>>>>>>
>>>>>>>>>> My mental model looks like this for the complete picture:
>>>>>>>>>>
>>>>>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>>>>>        a. ept1 -> gpio-controller@1
>>>>>>>>>>        b. ept2 -> gpio-controller@2
>>>>>>>>>>
>>>>>
>>>>> If my understanding of what gpio-controller is right, than this won't
>>>>> work. We need one rpmsg channel per gpio-controller, and in most cases
>>>>> there will be only one GPIO-controller on the remote side. If there are
>>>>> multiple or multiple instances of same controller, than we need separate
>>>>> channel name for that controller just like we would have separate device
>>>>> on the Linux.
>>>>
>>>> As done in ehe rpmsg_tty driver it could be instantiated several times with
>>>> the same channel/service name. This would imply a specific rpmsg to
>>>> retreive
>>>> the gpio controller index from the remote side.
>>>>>
>>>>>>>>>
>>>>>>>>> I've asked for one endpoint per GPIO controller since the very
>>>>>>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>>>>>>> namespace request per GPIO controller or a single request that spins
>>>>>>>>> off multiple endpoints.  I'll have to look at your link and
>>>>>>>>> reflect on
>>>>>>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>>>>>>> to happen at the endpoint level rather than the packet level.
>>>>>>>>> This is
>>>>>>>>> the only way this work can move forward.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>>>>>>> created with every namespace request.”
>>>>>>>>
>>>>>>>> If the endpoint is created only on the Linux side, how do we match
>>>>>>>> the Linux endpoint address with the local port field on the remote
>>>>>>>> side?
>>>>>>>
>>>>>>>
>>>>>>> Simply by sending a message to the remote containing the newly created
>>>>>>> endpoint and the port idx. Note that is this done just one time, after
>>>>>>> this
>>>>>>> Linux need not have the port field in the message everytime its sending
>>>>>>> a message.
>>>>>>>
>>>>>>>>
>>>>>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>>>>>>> [addr], where [addr] corresponds to the GPIO controller address in
>>>>>>>> the DT. This would:
>>>>>>>
>>>>>>>
>>>>>>> You will face the same problem in this case also that you asked above:
>>>>>>> "how do we match the Linux endpoint address with the local port field
>>>>>>> on the remote side?"
>>>>>>
>>>>>> Sorry I probably introduced confusion here
>>>>>> my sentence should be;
>>>>>>   With a multi-namespace approach, the namespace could be rpmsg-io-
>>>>>> [port],
>>>>>>   where [port] corresponds to the GPIO controller port in the DT.
>>>>>>
>>>>>>
>>>>>> For instance:
>>>>>>
>>>>>>        rpmsg {
>>>>>>          rpmsg-io {
>>>>>>            #address-cells = <1>;
>>>>>>            #size-cells = <0>;
>>>>>>
>>>>>>            gpio@25 {
>>>>>>              compatible = "rpmsg-gpio";
>>>>>>              reg = <25>;
>>>>>>              gpio-controller;
>>>>>>              #gpio-cells = <2>;
>>>>>>              #interrupt-cells = <2>;
>>>>>>              interrupt-controller;
>>>>>>            };
>>>>>>
>>>>>>            gpio@32 {
>>>>>>              compatible = "rpmsg-gpio";
>>>>>>              reg = <32>;
>>>>>>              gpio-controller;
>>>>>>              #gpio-cells = <2>;
>>>>>>              #interrupt-cells = <2>;
>>>>>>              interrupt-controller;
>>>>>>            };
>>>>>>          };
>>>>>>        };
>>>>>>
>>>>>>   rpmsg-io-25  would match with gpio@25
>>>>>>   rpmsg-io-32  would match with gpio@32
>>>>>>
>>>>>
>>>>> The problem with this approach is, we will endup creating way too many
>>>>> RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
>>>>> many GPIOs can be handled by remote from memory perspective. At
>>>>> somepoint we might just run-out of number ept & channels created by the
>>>>> remote. As of now, open-amp library supports 128 epts I think.
>>>>
>>>> Right, I proposed a solution in my previous answer to Beleswar who has
>>>> the same concern.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Because the endpoint that is created on a namespace request is also
>>>>>>> dynamic in nature. How will the remote know which endpoint addr
>>>>>>> Linux allocated for a namespace that it announced?
>>>>>>>
>>>>>>> As an example/PoC, I created a firmware example which announces
>>>>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>>>>>>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>>>>>>> see it created 2 different addresses (0x400 and 0x401) for each of
>>>>>>> the name service request from the same firmware:
>>>>>>>
>>>>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>>>>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
>>>>>>> ti.ipc4.ping-pong addr 0xd
>>>>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev
>>>>>>> addr 0xe
>>>>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel
>>>>>>> formed from src = 0x400 to dst = 0xe
>>>>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
>>>>>>> new channel: 0x401 -> 0xd!
>>>>>>>
>>>>>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>>>>>>> Back to same problem. Simple solution is to reply to remote with the
>>>>>>> created ept addr and the index.
>>>>>>
>>>>>> That why I would like to suggest to use the name service field to
>>>>>> identify the port/controller, instead of the endpoint address.
>>>>>>>
>>>>>>>>
>>>>>>>> - match the RPMsg probe with the DT,
>>>>>>>
>>>>>>>
>>>>>>> We can probe from all controllers with a single name service
>>>>>>> announcement too.
>>>>>>>
>>>>>>>> - provide a simple mapping between the port and the endpoint on both
>>>>>>>> sides,
>>>>>>>
>>>>>>>
>>>>>>> We are trying to get rid of this mapping from Linux side to adapt
>>>>>>> the gpio-virtio design.
>>>>>>>
>>>>>>>> - allow multiple endpoints on the remote side,
>>>>>>>
>>>>>>>
>>>>>>> We can support this as well with single nameservice model.
>>>>>>> There is no limitation. Remote has to send a message with
>>>>>>> its newly created ept that's all.
>>>>>>>
>>>>>>>> - provide a simple discovery mechanism for remote capabilities.
>>>>>>>
>>>>>>>
>>>>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>>>>>>
>>>>>>> Feel free to let me know if you have concerns with any of the
>>>>>>> suggestions!
>>>>>>
>>>>>> My only concern, whatever the solution, is that we find a smart
>>>>>> solution to associate the correct endpoint with the correct GPIO
>>>>>> port/controller defined in the DT.
>>>>>>
>>>>>> I may have misunderstood your solution. Could you please help me
>>>>>> understand your proposal by explaining how you would handle three
>>>>>> GPIO ports defined in the DT, considering that the endpoint
>>>>>> addresses on the Linux side can be random?
>>>>>> If I assume there is a unique endpoint on the remote side,
>>>>>> I do not understand how you can match, on the firmware side,
>>>>>> the Linux endpoint address to the GPIO port.
>>>>>>
>>>>>> Thanks and Regards,Arnaud
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Beleswar
>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Arnaud
>>>>>>>>
>>>>>>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>>>>>>        a. ept1 -> i2c@1
>>>>>>>>>>        b. ept2 -> i2c@2
>>>>>>>>>>        c. ept3 -> i2c@3
>>>>>>>>>>
>>>>>>>>>> etc...
>>>>>>>>>>
>>>>>
>>>>> Just want to clear-up few terms before I jump to the solution:
>>>>>
>>>>> **RPMsg channel/device**:
>>>>>    - These are devices announced by the remote processor, and created by
>>>>> linux. They are created at: /sys/bus/rpmsg/devices
>>>>>    - The channel format: <name>.<src ept>.<dst ept>
>>>>>
>>>>> **RPMsg endpoint**:
>>>>>    - Endpoint is differnt than channel. Single channel can have multiple
>>>>> endpoints, and represented in the linux with: /dev/rpmsg? devices.
>>>>>
>>>>> To create endpoint device, we have rpmsg_create_ept API, which takes
>>>>> channel information as input, which has src-ept, dst-ept.
>>>>>
>>>>> Following is proposed solution:
>>>>>
>>>>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
>>>>> pin/port).
>>>>>    - In our case that would be, single rpmsg-io node. (That makes me
>>>>> question if bindings are correct or not).
>>>>>
>>>>> 2) Assign GPIO number as src ept.
>>>>>
>>>>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
>>>>> endpoint.
>>>>>
>>>>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we can
>>>>> add 1024 offset to the GPIO number:
>>>>>
>>>>> so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
>>>>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
>>>>>
>>>>> Now on the remote side, there is single channel and only single-endpoint
>>>>> is needed that is mapped to the rpmsg-io channel callback.
>>>>>
>>>>> That callback will receive all the payloads from the Linux, which will
>>>>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
>>>>
>>>>
>>>> Interesting approach. I also tried to find a similar solution.
>>>>
>>>> The question here is: how can we guarantee continuous addresses? Given
>>>> the static and dynamic allocation of endpoint addresses that are
>>>> implemented, my conclusion was that it is not reliable enough.
>>>>
>>>> but perhaps I missed something...
>>>>
>>>>>
>>>>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pin based
>>>>> on platform specific logic.
>>>>>
>>>>> This doesn't need PORT information at all. Also it makes sure that
>>>>> remote is using only single-endpoint so not much memory is used.
>>>>>
>>>>> *Example*:
>>>>> If only rpmsg-gpio channel is created by the remote side, than following
>>>>> is the representation of the devices when GPIO 25, 26, 27 is assigned to
>>>>> the rpmsg-io controller:
>>>>>
>>>>> Linux                                                      Remote
>>>>>
>>>>> rpmsg-channel: rpmsg-gpio.0x400.0x400
>>>>>
>>>>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
>>>>>                                                    |
>>>>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
>>>>>                                                    |
>>>>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callback.
>>>>>
>>>>>
>>>>> *On remote side*:
>>>>>
>>>>> ept_0x400_callback(..., int src_ept, ...,)
>>>>> {
>>>>>     int gpio_num = src_ept - RPMSG_RESERVED_ADDRESSES;
>>>>>     // platform specific logic to convert gpio num to proper pin,
>>>>>     // just like you would convert gpio num to pin on a linux gpio
>>>>> controller.
>>>>> }
>>>>>
>>>>> My question on the binding:
>>>>>
>>>>> Why each GPIO is represented with the separate node? I think rpmsg-gpio
>>>>> can be represented just any other GPIO controller? Please let me know if
>>>>> I am missing something. So rpmsg channel/rpmsg device is not created per
>>>>> GPIO, but per controller. GPIO number multiplexing should be done with
>>>>> rpmsg src ept, that removes the need of having each GPIO as a separate
>>>>> node.
>>>>>
>>>>>
>>>>> rpmsg_gpio: rpmsg-gpio@0 {
>>>>>         compatible = "rpmsg-gpio";
>>>>>         reg = <0>;
>>>>>         gpio-controller;
>>>>>         #gpio-cells = <2>;
>>>>>         #interrupt-cells = <2>;
>>>>>         interrupt-controller;
>>>>>     };
>>>>>
>>>>> Then in DT, use like regular GPIO, but with the rpmsg-gpio controller:
>>>>>
>>>>> rpmsg-gpios = <&rpmsg_gpio (GPIO NUM) (flags)>;
>>>>>
>>>>> If the intent to create separate gpio nodes was only for the channel
>>>>> creation, then it's not really needed.
>>>>>
>>>>> [1]
>>>>> https://github.com/torvalds/linux/
>>>>> blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/
>>>>> virtio_rpmsg_bus.c#L136
>>>>>
>>>>
>>>> It is already the case. bindings declare GPIO controllers, not directly
>>>> GPIOs in:
>>>>
>>>> [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode
>>>> support
>>>>
>>>> The discussion is around having an unique RPmsg endpoint for all
>>>> GPIO controller or one RPmsg endpoint per GPIO controller.
>>>>
>>>
>>> Endpoint where remote side or linux side?
>>>
>>> If unique endpoint on remote side per gpio controller then it makes sense.
>>>
>>> Unique endpoint on linux side doesn't make sense. Instead, unique
>>> channel per gpio controller makes sense, and each channel will have
>>> multiple endpoints on linux side. As I replied to Beleswar on the other
>>> email, I will copy past my answer here too:
>>>
>>>
>>> To be more specific:
>>>
>>> Linux:                               remote:
>>>
>>> ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
>>>     - gpio-line ept1
>>>     - gpio-line ept2    ->     They all map to same callback_ept_1024.
>>>     - gpio-line ept3
>>>
>>> ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
>>>     - gpio-line ept1
>>>     - gpio-line ept2    ->     They all map to same callback_ept_1025.
>>>     - gpio-line ept3
>>>
>>
>>
>> Hi Mathieu,
>>
>> So upon more brain storming in this approach I found limitation:
>>
>> This approach won't work if host OS is any other OS but Linux. For
>> example, if the remote OS is zephyr/baremetal using open-amp, then Only
>> Linux <-> zephyr combination will work, and we won't be able to re-use
>> this approach for zephyr <-> zephyr use case. The concept of rpmsg
>> channel/device exist only in the linux kernel implementation. This
>> brings another question: Should the protocol we decide work on other use
>> cases as well? Or Linux must be the Host OS for this protocol ?
>>
> 
> Linux and Zephyr are very distinct OS, each with their own subsystems
> and characteristics.  The design we choose here involves RPMSG and,
> inherently, Linux.  We can't make decisions based on what may
> potentially happen in Zephyr.
> 
>>
>> I think your & Arnaud's proposed approach of single endpoint per
>> gpio-controller on both side makes more sense, as it will work
>> regardless of any OS on host or remote side.
>>
> 
> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
> GPIO controller.  The remaining issue it about the best way to work
> out source and destination addresses between Linux and the remote
> processor.  I'm running out of time for today but I'll return to this
> thread with a final analysis by the end of the week.
> 

Okay. Then that means multiple endpoints on Linux side can be considered.

If we decide to go single-endpoint per device on both side, then for
that here is the proposal to represent src ept and dst ept:

When we represent any device under rpmsg bus node, I think it should be
considered remote's view of the adddress space. So ideally we can
convert it to Linux view of the address space, via 'ranges' property.

So bindings should include 'ranges' property in the parent node. Then
linux view of the start address becomes src ept, and remote view of the
start address becomes dest ept. The remote view of the start address is
expected to be the static src endpoint on the remote side.

Following representation of the rpmsg devices (gpio, i2c, spi or any other):

rpmsg {
  #address-cells = <1>;
  #size-cells = <1>;

  rpmsg-io {
    compatible = "rpmsg-io-bus";
    ranges = <remote_view_addr(dst ept) linux_view_addr(src ept) size>;
    #address-cells = <1>;
    #size-cells = <1>;

    gpio@remote_view_addr(or dst ept) {
      compatible = "rpmsg-io";
      reg = <remote_view_addr addr_space_size>;
      gpio-controller;
      #gpio-cells = <2>;
      interrupt-controller;
      #interrupt-cells = <2>;
    };

    ...

  };

};

Example device-tree:

rpmsg {
  #address-cells = <1>;
  #size-cells = <1>;

  rpmsg-io {
    compatible = "rpmsg-io-bus";
    ranges = <0x10000 0x50000 0x1000>,
             <0x20000 0x60000 0x1000>;
    #address-cells = <1>;
    #size-cells = <1>;

    gpio@10000 {
      compatible = "rpmsg-io";
      reg = <0x10000 0x1000>;
      gpio-controller;
      #gpio-cells = <2>;
      interrupt-controller;
      #interrupt-cells = <2>;
    };

    gpio@20000 {
      compatible = "rpmsg-io";
      reg = <0x20000 0x1000>;
      gpio-controller;
      #gpio-cells = <2>;
      interrupt-controller;
      #interrupt-cells = <2>;
    };

  };

};


Thanks,
Tanmay


>> To be more specific this will look like following:
>>
>> Host (Linux)                       Remote (baremetal/RTOS)
>>
>> rpmsg ch/device 1:
>>     - rpmsg ept 1   <------>     rpmsg ept 1 gpio-controller 0
>>
>> rpmsg ch/device 2:
>>      - rpmsg ept 2   <------>     rpmsg ept 2 gpio-controller 1
>>
>>
>> The question is, how to decide src ept, and dest ept on both sides?
>> I still think it should be static endpoints.
>>
>> I will get back with more reasoning on that.
>>
>>> On the remote side, we have to hardcode Which rpmsg controller is mapped
>>> to which endpoint.
>>>
>>>> Or did I misunderstand your questions?
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>
>>>
>>> I gave this patch more time yesterday, and I think the 'reg' property
>>> should represent remote endpoint, instead of the gpio-controller index.
>>>
>>> So in this approach remote implementation is expected to provide
>>> hard-coded (static) endpoints for each gpio-controller instance, and
>>> that same number should be represented with the 'reg' property.
>>>
>>> On remote side:
>>>
>>> #define RPMSG_GPIO_0_CONTROLLER_EPT (RPMSG_RESERVED_ADDRESSES + 1) // 1024
>>>
>>> ept_1024_callback() {
>>>
>>>       // handle appropriate gpio port ()
>>>
>>> }
>>>
>>> On linux side:
>>>
>>> So new representation of controller:
>>>
>>>  rpmsg_gpio_0:   gpio@1024 {
>>>              compatible = "rpmsg-gpio";
>>>              reg = <1024>;
>>>              gpio-controller;
>>>              #gpio-cells = <2>;
>>>              #interrupt-cells = <2>;
>>>              interrupt-controller;
>>>           };
>>>
>>>  rpmsg_gpio_1:   gpio@1025 {
>>>              compatible = "rpmsg-gpio";
>>>              reg = <1025>;
>>>              gpio-controller;
>>>              #gpio-cells = <2>;
>>>              #interrupt-cells = <2>;
>>>              interrupt-controller;
>>>           };
>>>
>>> gpios = <&rpmsg_gpio_0 (GPIO NUM or PIN) flags>,
>>>       <&rpmsg_gpio_1 (GPIO NUM or PIN) flags>;
>>>
>>> Now in the linux driver:
>>>
>>> You can easily retrieve destination endpoint when we want to send the
>>> command to the gpio controller via device's "reg" property.
>>>
>>> This approach also provides built-in security as well. Because now
>>> gpio-controller instance is hardcoded with the endpoint callback, it
>>> can't be modified/addressed without changing the 'reg' property.
>>>
>>> Just like you wouldn't change device address for the instance of the
>>> gpio-controller right?
>>>
>>> This approach can be easily adapted to all the other rpmsg controllers
>>> as well.
>>>
>>> So, dynamic endpoint allocation doesn't make sense in this case. Dynamic
>>> endpoint allocation makes more sense for user-space apps which don't
>>> really care about endpoints and only payloads.
>>>
>>> But, here we are multiplexing device-addresses with endpoints, and so it
>>> has to be fixed, and presented via 'reg' property. So, firmware can't
>>> change device-address without Linux knowing it.
>>>
>>> Thanks,
>>> Tanmay
>>>
>>>
>>>>
>>>>>>>>>> This way device groups are isolated with each channel/namespace, and
>>>>>>>>>> instances within each device groups are also respected with specific
>>>>>>>>>> endpoints.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Beleswar
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>


