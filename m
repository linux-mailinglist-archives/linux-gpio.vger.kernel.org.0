Return-Path: <linux-gpio+bounces-36788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKArBK3LBGp2OwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:06:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC70539924
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55C8D300B194
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784E33AF66F;
	Wed, 13 May 2026 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="taBmbZaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1A386568;
	Wed, 13 May 2026 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699168; cv=fail; b=tK47eJimU2XXv6ZVDpmW4BNL3lfvZJSPa3rmavFm6ypFg8R0TbPZy+N+6U5nMvd6eZEiPR3SoKCE3NPaZ/yP/PZtj56+ir0eaxdqGcRo3Iyi6eHOu1szUyNM+z64GxIg66KEjnaKmOWfNZ/v/WRaDcUe9ZbXOsxk2J8S2uS7pKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699168; c=relaxed/simple;
	bh=wb6cAFimrAfDkHzctrY4+HRwLTtaQeqM+yZXEmBbxEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=toq2JUfFfcOpvskWmD0JoPwZaKF3xFXQjzL0y7UBja2yhyoyZZMlZjftDk0vhp8/io2eILgh8gX7lsxW9Ld9u1NOH76xS0U3qyE51nZypxXdOSCzbRLpoBYrx7a3cfAKNmiJs9SbMs7/gfxQNZroyAsD7NNRBVBlRJUV/R5lLU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=taBmbZaA; arc=fail smtp.client-ip=40.93.195.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoKCetwCZvN1aCfzCC1CqYGyHNYaUptvGj0mm7xZrvrcx0lXuhO6Jxa/Prs1o85uCNt3PFCQj1LNHtfabjMjb2Tcy3ktkx8MwmnpMgDsKHF3+VhyjltKtz/6DPGYFa74NeM3DU6ND4W+eZavvwxwrgmb4P5qt6wtcKJQu5QdJjDzeIIpQpyMkmgJQ9y+CDgpgY9WF+vwnTl0YmLsoVglweO29aqg53mFPXQ+csKivQG9gyXR8i14KfCfEHkxOhyT9/+zbrWr+iwxbd6GXxwrgeBN+40/F22Pdw6+Ve8F0DNH3O4cMXOfbxlgIrLaZh03v4l+StoFgfGwfknZQ5b1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/j+cYtulAQ/Uxq6Xkubq2oXVFKQQpWliIVAROZPnqI=;
 b=hBQvv6i/QqLvlgOpvgOAP8XfbvfwwDR2l5o84lEzVt5xvUJBZuBoI8fyfL/CwccfvW2Ek00T18ShaUt7GzazqrOtXlWuE7H5r2pz/njvnqi+nhTvhaOhLmCZbPXw5pc6nkHsiRtZWvjNcWW5egrsfQmJ6RYKM9FGqYSk1qOp/a1uzjUE3MIssPwfS7FJfT1qPpvcz57ot53m/5Nz5Q8BFQD02mOGAnQHD/7D44sPyngTqp6yOuejmBUcK8Imhr9z8jOlUN5BWKbR4aifx1aMZo6R7L6OMmSywfOA7JL3ArEqeiiHauwakFe/o7+txWQmN1KtYUYhmPlKhKVcoGMeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/j+cYtulAQ/Uxq6Xkubq2oXVFKQQpWliIVAROZPnqI=;
 b=taBmbZaAOi7oXxk53RiyTkq7th0gRXaHXznb5867uzhR2uJ46y0og00h14KPG8r6VOeMdcIIiL3PXZqkVc8TH9dJpEFDSEh410TkSsP5wqPNrv6s659s7h//2/4q7K9iJSCCpATuXC8kyUTehhsYgTVG4B4el6Y5HFzSTPbySIo=
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 19:05:44 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::3f) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 19:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 19:05:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 14:05:37 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 14:05:36 -0500
Message-ID: <ef46e0d8-a257-4e4e-adff-8edd5214f984@amd.com>
Date: Wed, 13 May 2026 14:05:36 -0500
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
References: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <ae5cfa0f-e929-4abb-b27b-8eb27586d183@amd.com> <agNKHsAEscc1TDiq@p14s>
 <13140ca1-b4bc-4acc-9f7c-d23490e56dbb@amd.com>
 <CANLsYkz9-+1o4ek0f5jS=-G1nPpp7BkCmNE5cin1zRY_e6Me-A@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkz9-+1o4ek0f5jS=-G1nPpp7BkCmNE5cin1zRY_e6Me-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea3eaf4-368f-4d83-e011-08deb122a0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|11063799003|4143699003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8vzGjcjq0bCSqfdKaqp/r0yQxN7Zq7Ld3ztxDO4fiEmdR+JnB9Cdk8F0b1bCRz6eNGm+NCyQaQWRpusbs/e7znFTvn80S9HhJdOg9kHKyvXVAfIobcm0AefuR2fEphBbpWiLSFNu+QnxKLeOPZOY4uQKXJsB9te5w7krVLgFxMbz59Rfj6mvG7SD5pjFJsoBWa5Nk+6jJDqK3T5LT0SJIvHZdM/z2VCIGuFrexqyAhvui2QtI41rFtid/eIlzlZk7cPuZ+zQnZA89QLB+lDYeW2nrVKGsa1RcqsyzIygAh1hy5d1JaQf98tIwRUxz6rRrlrpU62iWcQDpEp6wxg20B4WW00Zojy0772QSTVMtC0V9i81MXhCyPzy4xEfPPWNpMsHQF6Q0ho4EDHqx5i6u+8YIC/y4zIFIw4at9UnjKZl7rpa4H11Pki0DFkbVGlgZxoCYdK+5gd8J6KBDJciUUcvQ9fnc0hFdZPDD+KRVwL7Z0+d9ucys0KLTQAB1Axm3dCfgaGjq5D1p+/SbxOwIUAe1+Ar6iUXX+fRg+rnUC4HrcoR0s3zJiOSdeCgsGyTNO2UrqPdUyQrWcGkHYdewayoFP8xn6YoSVRH+LMPIRLE/ttlxNsO0duajN/R+zTr5TIlo1+YOHOmneN45qQ0LnKKIbfPE4umae+TAWKJh4brorD+1u1ObMbpTiM1RnHe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(11063799003)(4143699003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DfYGnrslAPVUspitOkbIVOGvcHbFOEEtErmj/mGQFdAgZeOcBm3vY7OTmL+GSvXUgyyZODLY+iSh++6ujxddr/kRnPfU4jZsCCGol6srZJCarSZjaqbpJLqHt62Ub3eGkoofUDOl8OIGMIswdguYR+Ue+XR5X64Frn5A3yS4TJoLGrwY+TdtR/YsZ9tqtL3hYVXI+eE3PF2FPzx569kZXBu4PAyBualXj67MY+5UWOHFBCPezs/jZsDXhJJK+6RWKT8tec0OBBBqbE31Z1hIsWi0P88D3fNZEGMljxWuEyoO0dbi/iraGy4VdbvLeDvOtRtM66P5xQ4JTpl8ZiGcem1laoT5HM3QewcifbJrLmijVd/NGD28R/1HFLmNeFYFrihfYL5N4FsShF41ZVSDXcNE4caXH0z6bIIIcu2J9S1fOGPc5tkA/fPirgTC0IPd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 19:05:42.0003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea3eaf4-368f-4d83-e011-08deb122a0fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
X-Rspamd-Queue-Id: 9AC70539924
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
	TAGGED_FROM(0.00)[bounces-36788-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action



On 5/13/2026 11:34 AM, Mathieu Poirier wrote:
> On Tue, 12 May 2026 at 11:20, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>>
>> On 5/12/2026 10:41 AM, Mathieu Poirier wrote:
>>> On Mon, May 11, 2026 at 04:35:46PM -0500, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 5/11/2026 12:58 PM, Mathieu Poirier wrote:
>>>>> On Mon, 11 May 2026 at 10:47, Shah, Tanmay <tanmays@amd.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/5/2026 10:52 AM, Shah, Tanmay wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/5/2026 4:28 AM, Arnaud POULIQUEN wrote:
>>>>>>>> Hi Tanmay,
>>>>>>>>
>>>>>>>> On 5/4/26 21:19, Shah, Tanmay wrote:
>>>>>>>>>
>>>>>>>>> Hello all,
>>>>>>>>>
>>>>>>>>> I have started reviewing this work as well.
>>>>>>>>> Thanks Shenwei for this work.
>>>>>>>>>
>>>>>>>>> I have gone through only the current revision, and would like to provide
>>>>>>>>> idea on how to achieve GPIO number multiplexing with the RPMsg protocol.
>>>>>>>>> Also, have some bindings related question.
>>>>>>>>>
>>>>>>>>> Please see below:
>>>>>>>>>
>>>>>>>>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>>>>>>>>>>> Hello Arnaud,
>>>>>>>>>>>
>>>>>>>>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>>>>>>>>>>> Hello,
>>>>>>>>>>>>
>>>>>>>>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>>>>>>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hi Mathieu,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>>>>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
>>>>>>>>>>>>>>>>> padhi@ti.com>; Linus
>>>>>>>>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>>>>>>>>>>>>>> <brgl@kernel.org>; Jonathan
>>>>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>>>>>>>>>> Krzysztof Kozlowski
>>>>>>>>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>>>>>>>>>>>>>>>>> Andersson
>>>>>>>>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>>>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
>>>>>>>>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>>>>>>>>>>>>>>>>> kernel@vger.kernel.org;
>>>>>>>>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-
>>>>>>>>>>>>>>>>> linux-imx <linux-
>>>>>>>>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>>>>>>>>>> rpmsg GPIO driver
>>>>>>>>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>>>>>>>>>>>>>> Jonathan
>>>>>>>>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>>>>>>>>>>>> Krzysztof
>>>>>>>>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>>>>>>>>>>>>>> <conor+dt@kernel.org>;
>>>>>>>>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>;
>>>>>>>>>>>>>>>>>>> Sascha
>>>>>>>>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>>>>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>>>>>>>>>>>> rpmsg
>>>>>>>>>>>>>>>>>>> GPIO driver
>>>>>>>>>>>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>>>>>>>>>>>             __u8 status;
>>>>>>>>>>>>>>>>>>>>>             __u8 value;
>>>>>>>>>>>>>>>>>>>>> };
>>>>>>>>>>>>>>>>>>>> It is the same message format. Please see the message
>>>>>>>>>>>>>>>>>>>> definition
>>>>>>>>>>>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
>>>>>>>>>>>>>>>>>>> message format.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>>>>>>>>>>>>>> requests and
>>>>>>>>>>>>>>>>> replies, and a second one for events.
>>>>>>>>>>>>>>>>>> In contrast, rpmsg provides only a single communication
>>>>>>>>>>>>>>>>>> channel, so a
>>>>>>>>>>>>>>>>>> type field is required to distinguish between different kinds
>>>>>>>>>>>>>>>>>> of messages.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Since rpmsg replies and events share the same message format,
>>>>>>>>>>>>>>>>>> an additional
>>>>>>>>>>>>>>>>> line is introduced to handle both cases.
>>>>>>>>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
>>>>>>>>>>>>>>>>>> field is added to
>>>>>>>>>>>>>>>>> uniquely identify the target controller.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I have commented on this before - RPMSG is already providing
>>>>>>>>>>>>>>>>> multiplexing
>>>>>>>>>>>>>>>>> capability by way of endpoints.  There is no need for a port
>>>>>>>>>>>>>>>>> field.  One endpoint,
>>>>>>>>>>>>>>>>> one GPIO controller.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> You still need a way to let the remote side know which port the
>>>>>>>>>>>>>>>> endpoint maps to, either
>>>>>>>>>>>>>>>> by embedding the port information in the message (the current
>>>>>>>>>>>>>>>> way), or by sending it
>>>>>>>>>>>>>>>> separately.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> An endpoint is created with every namespace request.  There
>>>>>>>>>>>>>>> should be
>>>>>>>>>>>>>>> one namespace request for every GPIO controller, which yields a
>>>>>>>>>>>>>>> unique
>>>>>>>>>>>>>>> endpoint for each controller and eliminates the need for an extra
>>>>>>>>>>>>>>> field to identify them.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Right, but this can still be done by just having one namespace
>>>>>>>>>>>>>> request.
>>>>>>>>>>>>>> We can create new endpoints bound to an existing namespace/
>>>>>>>>>>>>>> channel by
>>>>>>>>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>>>>>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>>>>>>>>>>> b73d-228295daaeec@ti.com/
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> I will look at your suggestion (i.e link above) later this week or
>>>>>>>>>>>>> next week.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> My mental model looks like this for the complete picture:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>>>>>>>>>        a. ept1 -> gpio-controller@1
>>>>>>>>>>>>>>        b. ept2 -> gpio-controller@2
>>>>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If my understanding of what gpio-controller is right, than this won't
>>>>>>>>> work. We need one rpmsg channel per gpio-controller, and in most cases
>>>>>>>>> there will be only one GPIO-controller on the remote side. If there are
>>>>>>>>> multiple or multiple instances of same controller, than we need separate
>>>>>>>>> channel name for that controller just like we would have separate device
>>>>>>>>> on the Linux.
>>>>>>>>
>>>>>>>> As done in ehe rpmsg_tty driver it could be instantiated several times with
>>>>>>>> the same channel/service name. This would imply a specific rpmsg to
>>>>>>>> retreive
>>>>>>>> the gpio controller index from the remote side.
>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> I've asked for one endpoint per GPIO controller since the very
>>>>>>>>>>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>>>>>>>>>>> namespace request per GPIO controller or a single request that spins
>>>>>>>>>>>>> off multiple endpoints.  I'll have to look at your link and
>>>>>>>>>>>>> reflect on
>>>>>>>>>>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>>>>>>>>>>> to happen at the endpoint level rather than the packet level.
>>>>>>>>>>>>> This is
>>>>>>>>>>>>> the only way this work can move forward.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>>>>>>>>>>> created with every namespace request.”
>>>>>>>>>>>>
>>>>>>>>>>>> If the endpoint is created only on the Linux side, how do we match
>>>>>>>>>>>> the Linux endpoint address with the local port field on the remote
>>>>>>>>>>>> side?
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Simply by sending a message to the remote containing the newly created
>>>>>>>>>>> endpoint and the port idx. Note that is this done just one time, after
>>>>>>>>>>> this
>>>>>>>>>>> Linux need not have the port field in the message everytime its sending
>>>>>>>>>>> a message.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>>>>>>>>>>> [addr], where [addr] corresponds to the GPIO controller address in
>>>>>>>>>>>> the DT. This would:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> You will face the same problem in this case also that you asked above:
>>>>>>>>>>> "how do we match the Linux endpoint address with the local port field
>>>>>>>>>>> on the remote side?"
>>>>>>>>>>
>>>>>>>>>> Sorry I probably introduced confusion here
>>>>>>>>>> my sentence should be;
>>>>>>>>>>   With a multi-namespace approach, the namespace could be rpmsg-io-
>>>>>>>>>> [port],
>>>>>>>>>>   where [port] corresponds to the GPIO controller port in the DT.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> For instance:
>>>>>>>>>>
>>>>>>>>>>        rpmsg {
>>>>>>>>>>          rpmsg-io {
>>>>>>>>>>            #address-cells = <1>;
>>>>>>>>>>            #size-cells = <0>;
>>>>>>>>>>
>>>>>>>>>>            gpio@25 {
>>>>>>>>>>              compatible = "rpmsg-gpio";
>>>>>>>>>>              reg = <25>;
>>>>>>>>>>              gpio-controller;
>>>>>>>>>>              #gpio-cells = <2>;
>>>>>>>>>>              #interrupt-cells = <2>;
>>>>>>>>>>              interrupt-controller;
>>>>>>>>>>            };
>>>>>>>>>>
>>>>>>>>>>            gpio@32 {
>>>>>>>>>>              compatible = "rpmsg-gpio";
>>>>>>>>>>              reg = <32>;
>>>>>>>>>>              gpio-controller;
>>>>>>>>>>              #gpio-cells = <2>;
>>>>>>>>>>              #interrupt-cells = <2>;
>>>>>>>>>>              interrupt-controller;
>>>>>>>>>>            };
>>>>>>>>>>          };
>>>>>>>>>>        };
>>>>>>>>>>
>>>>>>>>>>   rpmsg-io-25  would match with gpio@25
>>>>>>>>>>   rpmsg-io-32  would match with gpio@32
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The problem with this approach is, we will endup creating way too many
>>>>>>>>> RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
>>>>>>>>> many GPIOs can be handled by remote from memory perspective. At
>>>>>>>>> somepoint we might just run-out of number ept & channels created by the
>>>>>>>>> remote. As of now, open-amp library supports 128 epts I think.
>>>>>>>>
>>>>>>>> Right, I proposed a solution in my previous answer to Beleswar who has
>>>>>>>> the same concern.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Because the endpoint that is created on a namespace request is also
>>>>>>>>>>> dynamic in nature. How will the remote know which endpoint addr
>>>>>>>>>>> Linux allocated for a namespace that it announced?
>>>>>>>>>>>
>>>>>>>>>>> As an example/PoC, I created a firmware example which announces
>>>>>>>>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>>>>>>>>>>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>>>>>>>>>>> see it created 2 different addresses (0x400 and 0x401) for each of
>>>>>>>>>>> the name service request from the same firmware:
>>>>>>>>>>>
>>>>>>>>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>>>>>>>>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
>>>>>>>>>>> ti.ipc4.ping-pong addr 0xd
>>>>>>>>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev
>>>>>>>>>>> addr 0xe
>>>>>>>>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel
>>>>>>>>>>> formed from src = 0x400 to dst = 0xe
>>>>>>>>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
>>>>>>>>>>> new channel: 0x401 -> 0xd!
>>>>>>>>>>>
>>>>>>>>>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>>>>>>>>>>> Back to same problem. Simple solution is to reply to remote with the
>>>>>>>>>>> created ept addr and the index.
>>>>>>>>>>
>>>>>>>>>> That why I would like to suggest to use the name service field to
>>>>>>>>>> identify the port/controller, instead of the endpoint address.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> - match the RPMsg probe with the DT,
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> We can probe from all controllers with a single name service
>>>>>>>>>>> announcement too.
>>>>>>>>>>>
>>>>>>>>>>>> - provide a simple mapping between the port and the endpoint on both
>>>>>>>>>>>> sides,
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> We are trying to get rid of this mapping from Linux side to adapt
>>>>>>>>>>> the gpio-virtio design.
>>>>>>>>>>>
>>>>>>>>>>>> - allow multiple endpoints on the remote side,
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> We can support this as well with single nameservice model.
>>>>>>>>>>> There is no limitation. Remote has to send a message with
>>>>>>>>>>> its newly created ept that's all.
>>>>>>>>>>>
>>>>>>>>>>>> - provide a simple discovery mechanism for remote capabilities.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>>>>>>>>>>
>>>>>>>>>>> Feel free to let me know if you have concerns with any of the
>>>>>>>>>>> suggestions!
>>>>>>>>>>
>>>>>>>>>> My only concern, whatever the solution, is that we find a smart
>>>>>>>>>> solution to associate the correct endpoint with the correct GPIO
>>>>>>>>>> port/controller defined in the DT.
>>>>>>>>>>
>>>>>>>>>> I may have misunderstood your solution. Could you please help me
>>>>>>>>>> understand your proposal by explaining how you would handle three
>>>>>>>>>> GPIO ports defined in the DT, considering that the endpoint
>>>>>>>>>> addresses on the Linux side can be random?
>>>>>>>>>> If I assume there is a unique endpoint on the remote side,
>>>>>>>>>> I do not understand how you can match, on the firmware side,
>>>>>>>>>> the Linux endpoint address to the GPIO port.
>>>>>>>>>>
>>>>>>>>>> Thanks and Regards,Arnaud
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Beleswar
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Arnaud
>>>>>>>>>>>>
>>>>>>>>>>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>>>>>>>>>>        a. ept1 -> i2c@1
>>>>>>>>>>>>>>        b. ept2 -> i2c@2
>>>>>>>>>>>>>>        c. ept3 -> i2c@3
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> etc...
>>>>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Just want to clear-up few terms before I jump to the solution:
>>>>>>>>>
>>>>>>>>> **RPMsg channel/device**:
>>>>>>>>>    - These are devices announced by the remote processor, and created by
>>>>>>>>> linux. They are created at: /sys/bus/rpmsg/devices
>>>>>>>>>    - The channel format: <name>.<src ept>.<dst ept>
>>>>>>>>>
>>>>>>>>> **RPMsg endpoint**:
>>>>>>>>>    - Endpoint is differnt than channel. Single channel can have multiple
>>>>>>>>> endpoints, and represented in the linux with: /dev/rpmsg? devices.
>>>>>>>>>
>>>>>>>>> To create endpoint device, we have rpmsg_create_ept API, which takes
>>>>>>>>> channel information as input, which has src-ept, dst-ept.
>>>>>>>>>
>>>>>>>>> Following is proposed solution:
>>>>>>>>>
>>>>>>>>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
>>>>>>>>> pin/port).
>>>>>>>>>    - In our case that would be, single rpmsg-io node. (That makes me
>>>>>>>>> question if bindings are correct or not).
>>>>>>>>>
>>>>>>>>> 2) Assign GPIO number as src ept.
>>>>>>>>>
>>>>>>>>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
>>>>>>>>> endpoint.
>>>>>>>>>
>>>>>>>>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we can
>>>>>>>>> add 1024 offset to the GPIO number:
>>>>>>>>>
>>>>>>>>> so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
>>>>>>>>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
>>>>>>>>>
>>>>>>>>> Now on the remote side, there is single channel and only single-endpoint
>>>>>>>>> is needed that is mapped to the rpmsg-io channel callback.
>>>>>>>>>
>>>>>>>>> That callback will receive all the payloads from the Linux, which will
>>>>>>>>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
>>>>>>>>
>>>>>>>>
>>>>>>>> Interesting approach. I also tried to find a similar solution.
>>>>>>>>
>>>>>>>> The question here is: how can we guarantee continuous addresses? Given
>>>>>>>> the static and dynamic allocation of endpoint addresses that are
>>>>>>>> implemented, my conclusion was that it is not reliable enough.
>>>>>>>>
>>>>>>>> but perhaps I missed something...
>>>>>>>>
>>>>>>>>>
>>>>>>>>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pin based
>>>>>>>>> on platform specific logic.
>>>>>>>>>
>>>>>>>>> This doesn't need PORT information at all. Also it makes sure that
>>>>>>>>> remote is using only single-endpoint so not much memory is used.
>>>>>>>>>
>>>>>>>>> *Example*:
>>>>>>>>> If only rpmsg-gpio channel is created by the remote side, than following
>>>>>>>>> is the representation of the devices when GPIO 25, 26, 27 is assigned to
>>>>>>>>> the rpmsg-io controller:
>>>>>>>>>
>>>>>>>>> Linux                                                      Remote
>>>>>>>>>
>>>>>>>>> rpmsg-channel: rpmsg-gpio.0x400.0x400
>>>>>>>>>
>>>>>>>>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
>>>>>>>>>                                                    |
>>>>>>>>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
>>>>>>>>>                                                    |
>>>>>>>>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callback.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> *On remote side*:
>>>>>>>>>
>>>>>>>>> ept_0x400_callback(..., int src_ept, ...,)
>>>>>>>>> {
>>>>>>>>>     int gpio_num = src_ept - RPMSG_RESERVED_ADDRESSES;
>>>>>>>>>     // platform specific logic to convert gpio num to proper pin,
>>>>>>>>>     // just like you would convert gpio num to pin on a linux gpio
>>>>>>>>> controller.
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> My question on the binding:
>>>>>>>>>
>>>>>>>>> Why each GPIO is represented with the separate node? I think rpmsg-gpio
>>>>>>>>> can be represented just any other GPIO controller? Please let me know if
>>>>>>>>> I am missing something. So rpmsg channel/rpmsg device is not created per
>>>>>>>>> GPIO, but per controller. GPIO number multiplexing should be done with
>>>>>>>>> rpmsg src ept, that removes the need of having each GPIO as a separate
>>>>>>>>> node.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> rpmsg_gpio: rpmsg-gpio@0 {
>>>>>>>>>         compatible = "rpmsg-gpio";
>>>>>>>>>         reg = <0>;
>>>>>>>>>         gpio-controller;
>>>>>>>>>         #gpio-cells = <2>;
>>>>>>>>>         #interrupt-cells = <2>;
>>>>>>>>>         interrupt-controller;
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>> Then in DT, use like regular GPIO, but with the rpmsg-gpio controller:
>>>>>>>>>
>>>>>>>>> rpmsg-gpios = <&rpmsg_gpio (GPIO NUM) (flags)>;
>>>>>>>>>
>>>>>>>>> If the intent to create separate gpio nodes was only for the channel
>>>>>>>>> creation, then it's not really needed.
>>>>>>>>>
>>>>>>>>> [1]
>>>>>>>>> https://github.com/torvalds/linux/
>>>>>>>>> blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/
>>>>>>>>> virtio_rpmsg_bus.c#L136
>>>>>>>>>
>>>>>>>>
>>>>>>>> It is already the case. bindings declare GPIO controllers, not directly
>>>>>>>> GPIOs in:
>>>>>>>>
>>>>>>>> [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode
>>>>>>>> support
>>>>>>>>
>>>>>>>> The discussion is around having an unique RPmsg endpoint for all
>>>>>>>> GPIO controller or one RPmsg endpoint per GPIO controller.
>>>>>>>>
>>>>>>>
>>>>>>> Endpoint where remote side or linux side?
>>>>>>>
>>>>>>> If unique endpoint on remote side per gpio controller then it makes sense.
>>>>>>>
>>>>>>> Unique endpoint on linux side doesn't make sense. Instead, unique
>>>>>>> channel per gpio controller makes sense, and each channel will have
>>>>>>> multiple endpoints on linux side. As I replied to Beleswar on the other
>>>>>>> email, I will copy past my answer here too:
>>>>>>>
>>>>>>>
>>>>>>> To be more specific:
>>>>>>>
>>>>>>> Linux:                               remote:
>>>>>>>
>>>>>>> ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
>>>>>>>     - gpio-line ept1
>>>>>>>     - gpio-line ept2    ->     They all map to same callback_ept_1024.
>>>>>>>     - gpio-line ept3
>>>>>>>
>>>>>>> ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
>>>>>>>     - gpio-line ept1
>>>>>>>     - gpio-line ept2    ->     They all map to same callback_ept_1025.
>>>>>>>     - gpio-line ept3
>>>>>>>
>>>>>>
>>>>>>
>>>>>> Hi Mathieu,
>>>>>>
>>>>>> So upon more brain storming in this approach I found limitation:
>>>>>>
>>>>>> This approach won't work if host OS is any other OS but Linux. For
>>>>>> example, if the remote OS is zephyr/baremetal using open-amp, then Only
>>>>>> Linux <-> zephyr combination will work, and we won't be able to re-use
>>>>>> this approach for zephyr <-> zephyr use case. The concept of rpmsg
>>>>>> channel/device exist only in the linux kernel implementation. This
>>>>>> brings another question: Should the protocol we decide work on other use
>>>>>> cases as well? Or Linux must be the Host OS for this protocol ?
>>>>>>
>>>>>
>>>>> Linux and Zephyr are very distinct OS, each with their own subsystems
>>>>> and characteristics.  The design we choose here involves RPMSG and,
>>>>> inherently, Linux.  We can't make decisions based on what may
>>>>> potentially happen in Zephyr.
>>>>>
>>>>>>
>>>>>> I think your & Arnaud's proposed approach of single endpoint per
>>>>>> gpio-controller on both side makes more sense, as it will work
>>>>>> regardless of any OS on host or remote side.
>>>>>>
>>>>>
>>>>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
>>>>> GPIO controller.  The remaining issue it about the best way to work
>>>>> out source and destination addresses between Linux and the remote
>>>>> processor.  I'm running out of time for today but I'll return to this
>>>>> thread with a final analysis by the end of the week.
>>>>>
>>>>
>>>> Okay. Then that means multiple endpoints on Linux side can be considered.
>>>
>>> If there are multiple GPIO controllers then yes, there will be more than one
>>> endpoint.  At this time I do now want to condiser other bus architectures (i2c,
>>> spi, ...) to avoid muddying an already difficult conversation.
>>>
>>>>
>>>> If we decide to go single-endpoint per device on both side, then for
>>>> that here is the proposal to represent src ept and dst ept:
>>>
>>> I do not understand what you mean by "per device" - please be more specific.
>>>
>>
>> "per device" I mean, per rpmsg device/channel. In our case that would be
>> per gpio-controller.
>>
>>>>
>>>> When we represent any device under rpmsg bus node, I think it should be
>>>> considered remote's view of the adddress space. So ideally we can
>>>> convert it to Linux view of the address space, via 'ranges' property.
>>>
>>> There is no address space to consider since there is no GPIO controller memory
>>> space to access.  All that is done by the driver (remote processor) and
>>> completely hidden from Linux by rpmsg-virtio-gpio.
>>>
>>
>> So IMHO the dt-binding is the representation of the device hardware and
>> is independent of how driver will access it. Any gpio-controller device
>> node, we are just representing how gpio-controller hardware on the
>> remote side looks like, and what is the corresponding view of the linux is.
>>
>> The rpmsg-gpio driver is different than the platform gpio controller
>> driver mainly in two ways:
>>
>> 1) How the driver is probed: rpmsg-gpio driver will be probed when
>> corresponding rpmsg channel/device name-service announcment will happen
>> from the remote side.
>>
> 
> I agree.
> 
>> 2) The GPIO Ops are not performed on the hardware directly, but it's
>> done via rpmsg commands on the remote side.
>>
> 
> I agree.
> 
>> However, the GPIO controller hardware remains the same. So bindings
>> shoudln't change.
>>
> 
> That is where I have a different point of view.  There is no need to
> have information in the bindings the kernel won't use.  We are
> advertizing virtio-gpio devices and as such should use virtio-gpio
> bindings.  The only thing that changes is the transport method, i.e,
> encapsulated in RPMSG rather than directly over virtqueues.
> 

I do not have deep knowledge of virtio-gpio devices, but in the bindings
example "virtio-gpio.yaml", there is 'reg' property available for
virtio-mmio transport:
https://github.com/torvalds/linux/blob/1f63dd8ca0dc05a8272bb8155f643c691d29bb11/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml#L47


Also, I am actually asking to use 'reg' property to retrieve endpoint
information in the rpmsg-gpio driver. please see below:


>> IMHO That means, if I want to move any existing GPIO-controller to the
>> remote side, and want the rpmsg-gpio driver to handle it then, all I
>> need to change is the compatible string of the current gpio-controller
>> device node. The rest of the address space should remain the same, and
>> leave ranges property empty. If the remote core has different view of
>> the address space, then the device should contain remote's view and
>> parent bus (rpmsg-io bus) should provide linux view via 'ranges' property.
>>
>> That is just the device hw representation in the device-tree as rpmsg
>> device. Same for any other type of the controller: i2c, spi etc.
>>
>> Thanks,
>> Tanmay
>>
>>
>>>>
>>>> So bindings should include 'ranges' property in the parent node. Then
>>>> linux view of the start address becomes src ept, and remote view of the
>>>> start address becomes dest ept. The remote view of the start address is
>>>> expected to be the static src endpoint on the remote side.
>>>>
>>>> Following representation of the rpmsg devices (gpio, i2c, spi or any other):
>>>>
>>>> rpmsg {
>>>>   #address-cells = <1>;
>>>>   #size-cells = <1>;
>>>>
>>>>   rpmsg-io {
>>>>     compatible = "rpmsg-io-bus";
>>>>     ranges = <remote_view_addr(dst ept) linux_view_addr(src ept) size>;
>>>>     #address-cells = <1>;
>>>>     #size-cells = <1>;
>>>>
>>>>     gpio@remote_view_addr(or dst ept) {
>>>>       compatible = "rpmsg-io";
>>>>       reg = <remote_view_addr addr_space_size>;
>>>>       gpio-controller;
>>>>       #gpio-cells = <2>;
>>>>       interrupt-controller;
>>>>       #interrupt-cells = <2>;
>>>>     };
>>>>

If we have 'reg' property as explained in above example, then we can use
remote view of the start address of the device as dest-endpoint, and
linux view of the start address of device (gpio-controller in our case)
as src ept.

We use 'reg' property like this:

/* Get remote view of the start addr of gpio-controller */
of_property_read_reg(dev_node, 0, &dest_ept, &size);

/* Get linux view of the start addr of gpio-controller */
of_address_to_resource(dev_node, 0, &res);
src_ept = res.start;

When sending rpmsg command we can use above endpoint informations
rpmsg_sendto() API.

Note that remote has already done name service announcement using
dst-ept (i.e. remote's view of the start address of the gpio-controller)
by this time.

Thanks,
Tanmay

>>>>     ...
>>>>
>>>>   };
>>>>
>>>> };
>>>>
>>>> Example device-tree:
>>>>
>>>> rpmsg {
>>>>   #address-cells = <1>;
>>>>   #size-cells = <1>;
>>>>
>>>>   rpmsg-io {
>>>>     compatible = "rpmsg-io-bus";
>>>>     ranges = <0x10000 0x50000 0x1000>,
>>>>              <0x20000 0x60000 0x1000>;
>>>>     #address-cells = <1>;
>>>>     #size-cells = <1>;
>>>>
>>>>     gpio@10000 {
>>>>       compatible = "rpmsg-io";
>>>>       reg = <0x10000 0x1000>;
>>>>       gpio-controller;
>>>>       #gpio-cells = <2>;
>>>>       interrupt-controller;
>>>>       #interrupt-cells = <2>;
>>>>     };
>>>>
>>>>     gpio@20000 {
>>>>       compatible = "rpmsg-io";
>>>>       reg = <0x20000 0x1000>;
>>>>       gpio-controller;
>>>>       #gpio-cells = <2>;
>>>>       interrupt-controller;
>>>>       #interrupt-cells = <2>;
>>>>     };
>>>>
>>>>   };
>>>>
>>>> };
>>>>
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>
>>>>>> To be more specific this will look like following:
>>>>>>
>>>>>> Host (Linux)                       Remote (baremetal/RTOS)
>>>>>>
>>>>>> rpmsg ch/device 1:
>>>>>>     - rpmsg ept 1   <------>     rpmsg ept 1 gpio-controller 0
>>>>>>
>>>>>> rpmsg ch/device 2:
>>>>>>      - rpmsg ept 2   <------>     rpmsg ept 2 gpio-controller 1
>>>>>>
>>>>>>
>>>>>> The question is, how to decide src ept, and dest ept on both sides?
>>>>>> I still think it should be static endpoints.
>>>>>>
>>>>>> I will get back with more reasoning on that.
>>>>>>
>>>>>>> On the remote side, we have to hardcode Which rpmsg controller is mapped
>>>>>>> to which endpoint.
>>>>>>>
>>>>>>>> Or did I misunderstand your questions?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Arnaud
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I gave this patch more time yesterday, and I think the 'reg' property
>>>>>>> should represent remote endpoint, instead of the gpio-controller index.
>>>>>>>
>>>>>>> So in this approach remote implementation is expected to provide
>>>>>>> hard-coded (static) endpoints for each gpio-controller instance, and
>>>>>>> that same number should be represented with the 'reg' property.
>>>>>>>
>>>>>>> On remote side:
>>>>>>>
>>>>>>> #define RPMSG_GPIO_0_CONTROLLER_EPT (RPMSG_RESERVED_ADDRESSES + 1) // 1024
>>>>>>>
>>>>>>> ept_1024_callback() {
>>>>>>>
>>>>>>>       // handle appropriate gpio port ()
>>>>>>>
>>>>>>> }
>>>>>>>
>>>>>>> On linux side:
>>>>>>>
>>>>>>> So new representation of controller:
>>>>>>>
>>>>>>>  rpmsg_gpio_0:   gpio@1024 {
>>>>>>>              compatible = "rpmsg-gpio";
>>>>>>>              reg = <1024>;
>>>>>>>              gpio-controller;
>>>>>>>              #gpio-cells = <2>;
>>>>>>>              #interrupt-cells = <2>;
>>>>>>>              interrupt-controller;
>>>>>>>           };
>>>>>>>
>>>>>>>  rpmsg_gpio_1:   gpio@1025 {
>>>>>>>              compatible = "rpmsg-gpio";
>>>>>>>              reg = <1025>;
>>>>>>>              gpio-controller;
>>>>>>>              #gpio-cells = <2>;
>>>>>>>              #interrupt-cells = <2>;
>>>>>>>              interrupt-controller;
>>>>>>>           };
>>>>>>>
>>>>>>> gpios = <&rpmsg_gpio_0 (GPIO NUM or PIN) flags>,
>>>>>>>       <&rpmsg_gpio_1 (GPIO NUM or PIN) flags>;
>>>>>>>
>>>>>>> Now in the linux driver:
>>>>>>>
>>>>>>> You can easily retrieve destination endpoint when we want to send the
>>>>>>> command to the gpio controller via device's "reg" property.
>>>>>>>
>>>>>>> This approach also provides built-in security as well. Because now
>>>>>>> gpio-controller instance is hardcoded with the endpoint callback, it
>>>>>>> can't be modified/addressed without changing the 'reg' property.
>>>>>>>
>>>>>>> Just like you wouldn't change device address for the instance of the
>>>>>>> gpio-controller right?
>>>>>>>
>>>>>>> This approach can be easily adapted to all the other rpmsg controllers
>>>>>>> as well.
>>>>>>>
>>>>>>> So, dynamic endpoint allocation doesn't make sense in this case. Dynamic
>>>>>>> endpoint allocation makes more sense for user-space apps which don't
>>>>>>> really care about endpoints and only payloads.
>>>>>>>
>>>>>>> But, here we are multiplexing device-addresses with endpoints, and so it
>>>>>>> has to be fixed, and presented via 'reg' property. So, firmware can't
>>>>>>> change device-address without Linux knowing it.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Tanmay
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>>>>>> This way device groups are isolated with each channel/namespace, and
>>>>>>>>>>>>>> instances within each device groups are also respected with specific
>>>>>>>>>>>>>> endpoints.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>> Beleswar
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>


