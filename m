Return-Path: <linux-gpio+bounces-36225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPN6JigP+mntIgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:39:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8A4D053D
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 17:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74F18305F558
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 15:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9F848A2A2;
	Tue,  5 May 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TVFiIqrP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D87481655;
	Tue,  5 May 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995535; cv=fail; b=NgnrEx2Ey7rTWgM84hpLf10SXp5mZatlU3LLCEuEuPSZtY6GTGCr03uw58fArU6d83/LbDZ9Pr0/gJKBc9B8YWhDsVhNygYAr2m1RplJDsQ5+24blk2M/YnZA/v2wsSbEEYVAKQ1WeicvntEVFiV/IR7xPVh9oT9X8MYpEVsS7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995535; c=relaxed/simple;
	bh=+oyIJbcdE1icg1/mqP/6Ng83SbunAZH8bmZmXFnNwts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i8fczEcwlN61eUp88DeV6zc2XQgZS739HeBdJr1BREyD7fhvkdtHAXiNL7S/amj/Ie6JlO/7a7+v/I8KqyglLQZMNqvVq8Ey7mZViU3ZIkF7gyQywEt/8jQmb1IkVhXRav2hMofJ72be/z34+2nQzgXffkzRsVejmyDU++/lcm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TVFiIqrP; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfhC0DQ4LK4c2Lof3M+xdDQt5gF+i2cJ9Je+kmnhxn9nwIdlQg1TfxVctwUipxF7OFhKjmLM1EtmAXXOXHh1sEkfKUM05DLk3R7/CHYwK0//YmtnOv6Cz0WDOfv4md6iSnGI5T+varIiQyHNHtUX5K/0lzaogqfuuPMSrzkVUDHIk+6bbbl7jCId7zZ/02/4q9Qi7ptvrK7C7JwFTLM99iuzVzXE3Y9r6zGoPc+RPb0EJbEDXuczAwAW/L9xYWZNK9+QijXESCvW7f0ZYSANtK0pfxKTE5CbP2dPM8wEGHIYNQKKBVv4HJFH42eo4jgb8lAzmHoajqB51uKyBaIAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4RXQ7J7aRcXYHZ3Uj6X0EgOn383kDyhoE9V4rrSZno=;
 b=cuCfMuEMS4YQbCA/AvUQ2G/O9Ey5NpW/Fx4To9F6ZCfymM6igXhL7vgulhUou9ueOQCvPMvJeMH7MQSPv66Qy05XCJIrr2an+ce+zTNU1lBzcBMFD4J9Bu5PcD6Z6x1oPr3IX223kowbqMuCuC678GWi40fWxMvucqFjqtVdzKJ4n/kK4AEoN5tfKBxEvnRTFFa/NvBMp/p9ILHGw2k3EuOOwMdjhhP9kXNAWdjN9ndzVzHzmGG60mDZjqu5I4vRls5/w9+2MqyY+VKeRf2xxJb2O/KVTZ9cFBV1ZhNRpk0nMH5otUSuaNe0EOGQBSKv8kHpAWieFmapI6Y6W5BPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4RXQ7J7aRcXYHZ3Uj6X0EgOn383kDyhoE9V4rrSZno=;
 b=TVFiIqrPlL/6OFXhvTIoA3MOsju4syYhxn2ti2T0gMzalXltR7kgjIQRBsbucSVEoKM0h6E6AB2w+Azw3pIIc3z2jq+QgC2VfQ7ucwDOLx40JwpZF1pHSEqNg553ZTLfhdM+G9tBc137nf4bHC2HNw8Kh8Bp6xFctwWbqd4NuR4=
Received: from BLAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:32d::7)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 15:38:46 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::77) by BLAPR03CA0032.outlook.office365.com
 (2603:10b6:208:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 15:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 15:38:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 10:38:28 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 10:38:26 -0500
Message-ID: <a5012462-9953-424e-bfa0-427e7b07201e@amd.com>
Date: Tue, 5 May 2026 10:38:26 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <tanmay.shah@amd.com>, "Arnaud
 POULIQUEN" <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
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
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <4b622824-0073-4c6a-8525-248bd484c3f0@ti.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <4b622824-0073-4c6a-8525-248bd484c3f0@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: c40ea35c-3a36-4438-3e54-08deaabc654c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4S+H/iz27ocYkNOc4Wm39VyFSPF6ojlC9UQChj641BpRnuvvdgL2MHczxvL1dfvtGiy4LTy0bQAet3bviSKonnZDUxCqn009w3kds2kMkluLreS1z55U4dA0X0TiIo447F+ObqxKU1OuxPBBNEItRpMUGypgMCFh9PgAgDjkQkdXRftdqVSmrGubOmvfg+OKhJioPQQQ2s3CEyLHhGu2b6jsMmiD4pwQfAukKTkgu8BD6kGXIXtjbj8n/2GH8eGhv7Mg8KUuKhd5XS5szLQaZf3mDZBFlZUAfcv8vACn4HT5XtbvT48KaofvdHzeUEKQVWeUWj8uzB4yIQuvkoiz8D+r5NNQS/qhl6TGekk2/gsroEbCNqm338a3MrZxFDM2/6HxATq0eRO2O1vqthwAAY0FDyUB2GD8Cgc5/42KfLxQXkLpmU+UEPb69Lav6is5aWCjplmwQrSNeI7Ge04JJL9mM36cBrI9UIogzq/g3OJQm69JmcWZ8QY/3yXowbS0gz6v9lOJHfadsslsU9wu25gWEnJWZbckElGLvisBrrF5dCA6QBhF1b+zHtFKsWmUd5vitUd0VgUOHXQr+90lSVfPcN1un0LsYJvTJS63whOCHiEOeWkJloa7QA0aztTYy8xOfxu36svnkSLgooo6YugKAQfWgPcHaQ3uqQKFEmPoOJjrcSx7hFULZ1rMvT8KcJpLBnPsfVdQMW9bff3TrijDbymjK0AeFY4baI7SPI4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EW3XBYU0Cm5YZXiiLZFTtR3+cbF+avap0KxC3aWFuligKv0LB+ujW+RO0aGkLSI7jmPcBimEBx8aWBBsb9dY7x2d+LalLYWZSHI9L3TQOMyj9X8NHoeHwE2FrWkPqYcinqPwJCifPaHclOH6OYYq2SPstci1Qa8iBN1MIs1+txXTqu+YcArTW0xzwvUa2D7Kb7XSiDD4Yic4Az68P956bai1HGt8HZN1FpYAWeKmEu0JgJu3Z+oE5c/1yv1tcprotva1Y/kPKGUNszBJ7DBp3wu5SHjQjPAH+NhUnn+SJc0VbwI10fhvNzLO0zY0Fovg7Mhl/+49Hb024ilY8B4g+vdHDhX4XEw5hE2M4PlCMN6SV6U1N0BQoPddtUTxK8GLyet/biyzhqXJpRAvZX4V25UJkQ+kaXrLBuKGRAwPzKdmyWHQaFGnUIoFTMEHfbDM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:38:46.2903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c40ea35c-3a36-4438-3e54-08deaabc654c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704
X-Rspamd-Queue-Id: 4AE8A4D053D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36225-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]



On 5/5/2026 6:16 AM, Beleswar Prasad Padhi wrote:
> Hi Tanmay,
> 
> On 05/05/26 00:49, Shah, Tanmay wrote:
>> Hello all,
>>
>> I have started reviewing this work as well.
>> Thanks Shenwei for this work.
>>
>> I have gone through only the current revision, and would like to provide
>> idea on how to achieve GPIO number multiplexing with the RPMsg protocol.
>> Also, have some bindings related question.
>>
>> Please see below:
>>
>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
>>>
>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
>>>> Hello Arnaud,
>>>>
>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
>>>>> Hello,
>>>>>
>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>>>>>>> Hi Mathieu,
>>>>>>>
>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
>>>>>>>>>> padhi@ti.com>; Linus
>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
>>>>>>>>>> <brgl@kernel.org>; Jonathan
>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
>>>>>>>>>> Krzysztof Kozlowski
>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
>>>>>>>>>> Andersson
>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>>>>>>>>>> kernel@vger.kernel.org;
>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-
>>>>>>>>>> linux-imx <linux-
>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
>>>>>>>>>> rpmsg GPIO driver
>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
>>>>>>>>>>>> Jonathan
>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>>>>>>>>>>>> <conor+dt@kernel.org>;
>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>>>>>>>>>> <brgl@bgdev.pl>
>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>>>>>>>>>> GPIO driver
>>>>>>>>>>>>>> struct virtio_gpio_response {
>>>>>>>>>>>>>>            __u8 status;
>>>>>>>>>>>>>>            __u8 value;
>>>>>>>>>>>>>> };
>>>>>>>>>>>>> It is the same message format. Please see the message definition
>>>>>>>>>>>> (GET_DIRECTION) below:
>>>>>>>>>>>>
>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
>>>>>>>>>>>> message format.
>>>>>>>>>>>>
>>>>>>>>>>> Some changes to the message format are necessary.
>>>>>>>>>>>
>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
>>>>>>>>>>> requests and
>>>>>>>>>> replies, and a second one for events.
>>>>>>>>>>> In contrast, rpmsg provides only a single communication
>>>>>>>>>>> channel, so a
>>>>>>>>>>> type field is required to distinguish between different kinds
>>>>>>>>>>> of messages.
>>>>>>>>>>>
>>>>>>>>>>> Since rpmsg replies and events share the same message format,
>>>>>>>>>>> an additional
>>>>>>>>>> line is introduced to handle both cases.
>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
>>>>>>>>>>> field is added to
>>>>>>>>>> uniquely identify the target controller.
>>>>>>>>>>
>>>>>>>>>> I have commented on this before - RPMSG is already providing
>>>>>>>>>> multiplexing
>>>>>>>>>> capability by way of endpoints.  There is no need for a port
>>>>>>>>>> field.  One endpoint,
>>>>>>>>>> one GPIO controller.
>>>>>>>>>>
>>>>>>>>> You still need a way to let the remote side know which port the
>>>>>>>>> endpoint maps to, either
>>>>>>>>> by embedding the port information in the message (the current
>>>>>>>>> way), or by sending it
>>>>>>>>> separately.
>>>>>>>>>
>>>>>>>> An endpoint is created with every namespace request.  There should be
>>>>>>>> one namespace request for every GPIO controller, which yields a
>>>>>>>> unique
>>>>>>>> endpoint for each controller and eliminates the need for an extra
>>>>>>>> field to identify them.
>>>>>>>
>>>>>>> Right, but this can still be done by just having one namespace
>>>>>>> request.
>>>>>>> We can create new endpoints bound to an existing namespace/channel by
>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
>>>>>>> b73d-228295daaeec@ti.com/
>>>>>>>
>>>>>> I will look at your suggestion (i.e link above) later this week or
>>>>>> next week.
>>>>>>
>>>>>>> My mental model looks like this for the complete picture:
>>>>>>>
>>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>>       a. ept1 -> gpio-controller@1
>>>>>>>       b. ept2 -> gpio-controller@2
>>>>>>>
>> If my understanding of what gpio-controller is right, than this won't
>> work. We need one rpmsg channel per gpio-controller, and in most cases
>> there will be only one GPIO-controller on the remote side.
> 
> 
> Why so? In the current v13 version, the remote side already
> handles 2 GPIO controllers.
> 
>>  If there are
>> multiple or multiple instances of same controller, than we need separate
>> channel name for that controller just like we would have separate device
>> on the Linux.
> 
> 
> Why so? I think there is some confusion in the terminology:
> 
> GPIO controller = GPIO port (gpio@xyz) defined in the
> Device tree = struct rpmsg_gpio_port in code
> 
> GPIO line = Individual lines within each GPIO port (max =
> GPIOS_PER_PORT_DEFAULT) = struct rpmsg_gpio_line in code
> 

Okay, I understand now. So, same gpio controller has multiple instances.

>>>>>>> 1. namespace/channel#1 = rpmsg-io
>>>>>>>       a. ept1 -> gpio-controller@1
>>>>>>>       b. ept2 -> gpio-controller@2

So, In that case above mentioned approach doesn't work.

Because, this approach is mapping endpoint to the gpio-controller. From
linux's perspective, it needs to map rpmsg *channel* to the
gpio-controller not the endpoint.

To be more specific:

Linux:                               remote:

ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
    - gpio-line ept1
    - gpio-line ept2    ->     They all map to same callback_ept_1024.
    - gpio-line ept3

ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
    - gpio-line ept1
    - gpio-line ept2    ->     They all map to same callback_ept_1025.
    - gpio-line ept3

On the remote side, we have to hardcode Which rpmsg controller is mapped
to which endpoint.



>>
>>>>>> I've asked for one endpoint per GPIO controller since the very
>>>>>> beginning.  I don't yet have a strong opinion on whether to use one
>>>>>> namespace request per GPIO controller or a single request that spins
>>>>>> off multiple endpoints.  I'll have to look at your link and reflect on
>>>>>> that.  Regardless of how we proceed on that front, multiplexing needs
>>>>>> to happen at the endpoint level rather than the packet level.  This is
>>>>>> the only way this work can move forward.
>>>>>>
>>>>> I would be more in favor of Mathieu’s proposal: “An endpoint is
>>>>> created with every namespace request.”
>>>>>
>>>>> If the endpoint is created only on the Linux side, how do we match
>>>>> the Linux endpoint address with the local port field on the remote side?
>>>>
>>>> Simply by sending a message to the remote containing the newly created
>>>> endpoint and the port idx. Note that is this done just one time, after
>>>> this
>>>> Linux need not have the port field in the message everytime its sending
>>>> a message.
>>>>
>>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
>>>>> [addr], where [addr] corresponds to the GPIO controller address in
>>>>> the DT. This would:
>>>>
>>>> You will face the same problem in this case also that you asked above:
>>>> "how do we match the Linux endpoint address with the local port field
>>>> on the remote side?"
>>> Sorry I probably introduced confusion here
>>> my sentence should be;
>>>  With a multi-namespace approach, the namespace could be rpmsg-io-[port],
>>>  where [port] corresponds to the GPIO controller port in the DT.
>>>
>>>
>>> For instance:
>>>
>>>       rpmsg {
>>>         rpmsg-io {
>>>           #address-cells = <1>;
>>>           #size-cells = <0>;
>>>
>>>           gpio@25 {
>>>             compatible = "rpmsg-gpio";
>>>             reg = <25>;
>>>             gpio-controller;
>>>             #gpio-cells = <2>;
>>>             #interrupt-cells = <2>;
>>>             interrupt-controller;
>>>           };
>>>
>>>           gpio@32 {
>>>             compatible = "rpmsg-gpio";
>>>             reg = <32>;
>>>             gpio-controller;
>>>             #gpio-cells = <2>;
>>>             #interrupt-cells = <2>;
>>>             interrupt-controller;
>>>           };
>>>         };
>>>       };
>>>
>>>  rpmsg-io-25  would match with gpio@25
>>>  rpmsg-io-32  would match with gpio@32
>>>
>> The problem with this approach is, we will endup creating way too many
>> RPMsg devices/channels. i.e. one channel per one GPIO. That limits how
>> many GPIOs can be handled by remote from memory perspective. At
>> somepoint we might just run-out of number ept & channels created by the
>> remote. As of now, open-amp library supports 128 epts I think.
> 
> 
> Arnaud was suggesting one channel per gpio controller,
> not per line. We will not have 128 gpio controllers....
> 
>>
>>>> Because the endpoint that is created on a namespace request is also
>>>> dynamic in nature. How will the remote know which endpoint addr
>>>> Linux allocated for a namespace that it announced?
>>>>
>>>> As an example/PoC, I created a firmware example which announces
>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
>>>> the other is a TI specific name service "ti.ipc4.ping-pong". You can
>>>> see it created 2 different addresses (0x400 and 0x401) for each of
>>>> the name service request from the same firmware:
>>>>
>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
>>>> ti.ipc4.ping-pong addr 0xd
>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev
>>>> addr 0xe
>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Channel
>>>> formed from src = 0x400 to dst = 0xe
>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
>>>> new channel: 0x401 -> 0xd!
>>>>
>>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-io-2
>>>> Back to same problem. Simple solution is to reply to remote with the
>>>> created ept addr and the index.
>>> That why I would like to suggest to use the name service field to
>>> identify the port/controller, instead of the endpoint address.
>>>>  
>>>>> - match the RPMsg probe with the DT,
>>>>
>>>> We can probe from all controllers with a single name service
>>>> announcement too.
>>>>
>>>>> - provide a simple mapping between the port and the endpoint on both
>>>>> sides,
>>>>
>>>> We are trying to get rid of this mapping from Linux side to adapt
>>>> the gpio-virtio design.
>>>>
>>>>> - allow multiple endpoints on the remote side,
>>>>
>>>> We can support this as well with single nameservice model.
>>>> There is no limitation. Remote has to send a message with
>>>> its newly created ept that's all.
>>>>
>>>>> - provide a simple discovery mechanism for remote capabilities.
>>>>
>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
>>>>
>>>> Feel free to let me know if you have concerns with any of the
>>>> suggestions!
>>> My only concern, whatever the solution, is that we find a smart
>>> solution to associate the correct endpoint with the correct GPIO
>>> port/controller defined in the DT.
>>>
>>> I may have misunderstood your solution. Could you please help me
>>> understand your proposal by explaining how you would handle three
>>> GPIO ports defined in the DT, considering that the endpoint
>>> addresses on the Linux side can be random?
>>> If I assume there is a unique endpoint on the remote side,
>>> I do not understand how you can match, on the firmware side,
>>> the Linux endpoint address to the GPIO port.
>>>
>>> Thanks and Regards,Arnaud
>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>>> Regards,
>>>>> Arnaud
>>>>>
>>>>>>> 2. namespace/channel#2 = rpmsg-i2c
>>>>>>>       a. ept1 -> i2c@1
>>>>>>>       b. ept2 -> i2c@2
>>>>>>>       c. ept3 -> i2c@3
>>>>>>>
>>>>>>> etc...
>>>>>>>
>> Just want to clear-up few terms before I jump to the solution:
>>
>> **RPMsg channel/device**:
>>   - These are devices announced by the remote processor, and created by
>> linux. They are created at: /sys/bus/rpmsg/devices
>>   - The channel format: <name>.<src ept>.<dst ept>
>>
>> **RPMsg endpoint**:
>>   - Endpoint is differnt than channel. Single channel can have multiple
>> endpoints, and represented in the linux with: /dev/rpmsg? devices.
>>
>> To create endpoint device, we have rpmsg_create_ept API, which takes
>> channel information as input, which has src-ept, dst-ept.
>>
>> Following is proposed solution:
>>
>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPIO
>> pin/port).
> 
> 
> One channel per pin was not suggested earlier...
> 
>>   - In our case that would be, single rpmsg-io node. (That makes me
>> question if bindings are correct or not).
>>
>> 2) Assign GPIO number as src ept.
>>
>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
>> endpoint.
>>
>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we can
>> add 1024 offset to the GPIO number:
>>
>> so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
>>
>> Now on the remote side, there is single channel and only single-endpoint
>> is needed that is mapped to the rpmsg-io channel callback.
>>
>> That callback will receive all the payloads from the Linux, which will
>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
>>
>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pin based
>> on platform specific logic.
>>
>> This doesn't need PORT information at all. Also it makes sure that
>> remote is using only single-endpoint so not much memory is used.
>>
>> *Example*:
>> If only rpmsg-gpio channel is created by the remote side, than following
>> is the representation of the devices when GPIO 25, 26, 27 is assigned to
>> the rpmsg-io controller:
>>
>> Linux                                                      Remote
>>
>> rpmsg-channel: rpmsg-gpio.0x400.0x400
>>
>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
>>                                                   |
>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x400
>>                                                   |
>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callback.
>>
>>
>> *On remote side*:
>>
>> ept_0x400_callback(..., int src_ept, ...,)
>> {
>> 	int gpio_num = src_ept - RPMSG_RESERVED_ADDRESSES;
>> 	// platform specific logic to convert gpio num to proper pin,
>> 	// just like you would convert gpio num to pin on a linux gpio controller.
>> }
>>
>> My question on the binding:
>>
>> Why each GPIO is represented with the separate node? I think rpmsg-gpio
>> can be represented just any other GPIO controller? Please let me know if
>> I am missing something.
> 
> 
> These are separate GPIO controllers, not separate pins within
> the same GPIO controller. Could you revisit your solution with
> this update.
> 
> Thanks for your time,
> Beleswar
> 


