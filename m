Return-Path: <linux-gpio+bounces-31945-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KlFOogmmGlcBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31945-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:16:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63612166132
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2C5D301DD9F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81C931AF1B;
	Fri, 20 Feb 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NYK5Od6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07152E7164;
	Fri, 20 Feb 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579013; cv=fail; b=E6u5nS7GsczPBCtz2l47hUU9RDEWRoXkoa2i6VMTZLjXH8ehSA+ZWu9vMk0XvonCx4YhMruZCzYzB/IQedxgZ9KE0hlTat4+xHoORPPWqEQ/5lFwtTQEWp7KFLv/Yvn/LC87dRNdqrEzRMpyFm0ojrZPkDir7jZwFF1qcWzy8E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579013; c=relaxed/simple;
	bh=UuAX24SmUkMfiG7AIOV2zdwubS34xyZPL4Na/qoTm+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AJ+3KuUunV8nLdVVSiNXkVuZIGol83h1E3IhzZ7ywwTYhX/nbn9bKOk4+/4ya/WRDBWyz+1jvIDH1h8B8AAygHsq9anIrFS4dLBLYRKRjVv3zWV6WJZqMwb6oTSs6EbSi4Z6KmkaC3vpoMU3EiZwj0is6OWDE4oyZnprSC3mJAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NYK5Od6A; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psyHBf+Atna3qChi3R5QJxatvFVSP3Gvs+XcZ0Fk5AAVNR+Q89YsNqLSiA0sRCwMHtP/ANjadXq9tyd6KkdZKVWGcSYRXOuVbWtve13cHEH2NgKVrw6lUGSXgoCF5GhgP5K7/4rYcnU+b2x+kIB5Ji+XJBa2Yw3zXT/5ukQBq9R26tgDp9TTREbTWCDbIxb+30nOmhQLW0o1HNkvBu0O0M6qQbg15UG+nXWrYAwZbIm6sscvJxWnprA7hdgAgn3mxzgjIiJG7VhyvlB85R4THW1L4PEXgFl+/nMsaTMnakI4C/GYGBhf/65zeGBrRSSRV+CdiLzQTIB15Qaa1O+ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJulJDHR0ls5qI0ZbpX1M5TudGVe7SWtYg/eli4fPRA=;
 b=Qq5vogJgVf6TQQtKIAUVB8cVCaaavMO+10LoxQGBqwjzwZspTZUdVNjmu1ypzfqIG0UIfmdQEKEUbojOurapjOabmlJ/sM8gasGW9soGxiD4i1vWff8niLHWqdUIqflN8Hgm4/ky+ymzJHsdlxufEw/iWaIcN53REM0refKapEzqMZxMr80VZ/kg16LS0G50dNeWuxblgQZmCzlSqZgVgas4iMWXdQCIMQGzKdOuyJAxwf4REO0aD1kIJexF1KA0LyKv7icGJ6U1YfwuQxDjWnh3SnygoGn1wCtHBO+lHx4aaDv99P40mnL2ZPUj3YjZF92USHJd3YeReRIBjFRAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJulJDHR0ls5qI0ZbpX1M5TudGVe7SWtYg/eli4fPRA=;
 b=NYK5Od6AISJ4MyH7Q/J5NWd6ogqZP7EwIp/m5Vdu0hXXBTuDCMGpnqHbe6X8z0i47QIlOMnCLP4nkB4BSnxzBUCRgWo++rDSm/FPw16uW4u1UEE4hs6W0btXLxZYyZBHWCKzDe9cSGTMr1Dji1m8D5QCmcasy5oqOGTnGcYRZyjzXbQIKwwyWdCWLCtGHMJmXtc6YzN+g5KBd5F6qRD6CGw6E+SSvfR7liDLU/Ad4Ic7GWpdyYobP5Q7PfhnaJmDBccOUoHDi8hB4PtbNaxt4IJLYs1APGM+YbUIWL3Z7cR/MtVHG8yGidaF7mbDLW8LWKbDOkzVPPsz5OyhI4FGoQ==
Received: from DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) by AS2PR10MB6614.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:16:45 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::b4) by DU7PR01CA0047.outlook.office365.com
 (2603:10a6:10:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 09:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 09:16:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:18:31 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:16:43 +0100
Message-ID: <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
Date: Fri, 20 Feb 2026 10:16:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, <devicetree@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-imx@nxp.com>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|AS2PR10MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: d9671b7d-2ddc-4b3e-cea1-08de7060c4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVM0ZC92WVpiMSsyK1Y5ZCtJa3B0UWNjTFVQbWY5YUhFWEwvazJzZjBGZXhw?=
 =?utf-8?B?elN4enhmRzhvMFZ6QWtVK2RZQ2RFcTFPY2xvZUpEVmlSZzZjcmpva0xGcy8w?=
 =?utf-8?B?VHlBN0ZibmNJbjlYcWdZMjlhUS9Zb3JXQmdFRCtXZFhlTkVhUmtibHgzK0tQ?=
 =?utf-8?B?Tlg2VVBvdm50YUxUZWNWOFZtM1hyZVBtVUE0OXdhOGRxYTMvamFEWmxQZXNV?=
 =?utf-8?B?UXI4c2d6SXBPK1RVT2ZOaUFWZUp2NC9WTkNHQUFpU1lSTytOTjdmdk45V1Jt?=
 =?utf-8?B?cldBUktLTXJoTXY0ZisrN3VyYkZGeGFIaWV6OGZFS1ljVi93dnhoOW5GMVpo?=
 =?utf-8?B?dmZYNy9LQU1LQ3h3VjN6bGI3Wm5OU0VHSVkyMHZNaVJMc3dZTXFVZm44WG1F?=
 =?utf-8?B?WlFURTd4WDlNcTFkZ2ZROURoOHR2VFdGS0RDYW5YRFlNZ01uUktLYVVoWElQ?=
 =?utf-8?B?VFBGbGF6aldDbUpLL1hzblpUQmcyZUYxd3JHY0dnN1FuUHRYeUpzc1BrT0cx?=
 =?utf-8?B?OU9yRVF1SnhYNnQzeGcwZkRDaTZDcEF0OGhxcndsOGVBQ3g0dFRNTVYrVHRh?=
 =?utf-8?B?RnNIYnF3WEhnQ1pJdytHMG55cWo5TFZnekRVR2kvOVBjR1YvTU92L3k3cldE?=
 =?utf-8?B?bFRuM0ZVaXNCNldoeW9OSmFOcm1zeUs4dUtlTW5jRDBLQnBGWnhlNFB2bFBC?=
 =?utf-8?B?UGdVU0RmbHA5SlV5ODRveEt2TSt6eEYzejNpM3BkL3REd2hYazFubUhMeGRG?=
 =?utf-8?B?dFBrL0FGaGl3Y3pWTENMODl0dmhGaUsvb2hkT0s5OGpiL2hXUlBvWE04RDF6?=
 =?utf-8?B?RFBkMzg2Qldic0ZzYW5aTmREajVPb1BXQ29kbGF5RFdjVnlxaVhzSnVZU01V?=
 =?utf-8?B?QnJmWUJxZ0I0Y2tkRUh5Y2lyU01iQkpEQmNGcktWcCtkcDM0VVVWdUd1UEdI?=
 =?utf-8?B?endycW1JZDlLaVBvNFFhUjgyckVFQ1h3RXh0QUkvT3ZlUUd3R3Nua3dpSi82?=
 =?utf-8?B?OWNDVmM2VnN6VTdmNFJjYUdLMmF0RGluWmdINS9sYjBpakJ1VFB2MXVRcFUr?=
 =?utf-8?B?NWI2cXZ3TnRtbzFjTzJyYUNhVk1FUHlSSXBqR0YvWHdnTHczZWw2dUJRc2x4?=
 =?utf-8?B?SWcyWWQrV1A4cmNYbnl2QTMvWmNnR08yVzF4QmMyOGZTVUE3eHRGdmhMcUhZ?=
 =?utf-8?B?b2h3ak1uYTdpSkZiRzJSYzd1WVZ6amdKeEsyb2ZFVUdxUHJtOTIzV3hZRDZF?=
 =?utf-8?B?Rmh0cVRJUGhjczY2dERtOVNyL1lUY010MXZ0bUE1QVEzdWlZTDdXV2JnSTk0?=
 =?utf-8?B?WUg2Yk5lYkRvNXluRlJudVlHaytISEdNajd6andpZkRrZFVtZVN4NnNnRExz?=
 =?utf-8?B?NE1ONkEwUnpPdmVlUDNEUDVDZE81bWVUaWJ1TTFHanIvZVQ5NHlJL0tsZURN?=
 =?utf-8?B?T084dHk3QW9MdEtFaE1QRjNPNHp5OXlEcXdnZVN4RmVDZFdHRVd0TGFrbjZo?=
 =?utf-8?B?dDNSWUk4LzJaM2RWSStrNjM1dFgwUUNMczQ2WlhFOFAvdWtLNHYyU0pRbFl0?=
 =?utf-8?B?L1Y4dVdXb0x5M3V1RHZTZFp1MExUVVliUDJydXF1SmVxSkIwQ0NjbFFWVnE2?=
 =?utf-8?B?Ny9talhFUXRZbUU5dytFSytrd1dERzFrT245V1kyWG9HKzhaUXZ4STJqeUdR?=
 =?utf-8?B?RjZaNjhYaTA5Z1pZWFlqc0RjdUhlVEI4YUp4YnFoSnp4L29pYkRSdHBQRUZW?=
 =?utf-8?B?cnQwQlhJWjZBTGZFYVpRNWZJQmNSSlVsc2hiZEdPUWE0ODNXMnd2NlMvRXRY?=
 =?utf-8?B?bVVPU2ZRUTZrbEJOaTVoSCtramF6OGlYdzJEVkpzM2N0QVdXNUtlL2pKUFBD?=
 =?utf-8?B?YXVlRkNmczBrODV4ZFJtVlg0T05qUHpGcFhTbzJFSHpGV0J3K2lhQm4xZmh1?=
 =?utf-8?B?RWt1aGJWdVJLRlFOV01OZnpKMWVtR1J6KzVqM1Y4aGRWeWFJOHVQZTZ1L3g3?=
 =?utf-8?B?ODJua0tmNzRnb0h4NkwzclgwU2U5YzZmTEx1c2o4T3JkdGRYNXRWR3BqL1V2?=
 =?utf-8?B?MmRQT1ZUempON1lOeXNod1BibGxLLzF3cW9pWU5GbWtRQnJTVklQajVHb0ZQ?=
 =?utf-8?B?QTU1QUtEdlloSFN1R2tjMGNSV1c5U2l1Z2N5SGZybGF3MDBNYm5mdm1NNWJi?=
 =?utf-8?B?SjQxVHM2QjFMMFR0dUdtdHNGT2ZPbUgrY0tkMTZXRzQzaXk2U2Z1NERBS3Rk?=
 =?utf-8?B?NXRzZWh3R3VYaEdEV3FYQjVTaTh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7m6Px0QhvFi6zktGHOAMR1HOp0llNQ2TIMBdpMHMphhSRXm5BP2bQam1pvTq49TPmXLkpYQ2xpAmkOFFKQ6Z0vZRDrHgYNa4/v0iwOjNsEoItB3dCP+Dmr0M7FcHEzgpnt/9GThMj/JNazhe01x3vGlQU8xCNrFFT9MsoAmcJQPFpzUBQ65eSx/wdH5LLximtPdcjM1TslOYnvNAqj14dM183Iq1fZnMpem/RB8Ju0l0V5os+NX8BaqF3c09fz2xbK3QOYDLF9gz49AjOqIWWQ9XB4PVWuxg3s9lSwV539za97xc+M2QQ4TejnfjyFVhHQ1vx51fSS3/ePfc4AkxXTAGOGbKUqRILw2t/6XLYr/8mHRTrPRzVfWF6sdF94UrINfKMXbQduDcNaew5ILsUaa/b7UL5abQiQXyOZCac86TvIGjrIf4PKLzNc9FBj+k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:16:45.3695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9671b7d-2ddc-4b3e-cea1-08de7060c4d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6614
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31945-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,linaro.org,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 63612166132
X-Rspamd-Action: no action



On 2/19/26 14:42, Andrew Lunn wrote:
>>> +	u8 id;		/* Message ID Code */
>>> +	u8 vendor;	/* Vendor ID number */
>>
>> Does this fields above are mandatory, seems that it is just some constant
>> values that are useless.
>>
>>> +	u8 version;	/* Vendor-specific version number */
>>
>> Why it is vendor specific? the version should represent the rpmsg-tty
>> protocol version.
>>
>>> +	u8 type;	/* Message type */
>>> +	u8 cmd;		/* Command code */
>>> +	u8 reserved[5];
>>
>> What is the purpose of this reserved field?
> 
> They have an implementation of the other end running on there systems,
> and it sounds like it is widely deployed, and they are trying to keep
> backwards compatibility. The protocol also implements more than
> GPIO. There is also I2C, maybe watchdog, i don't remember, but early
> versions of this patchset had a list. Some of these fields are used
> for some of these other devices.
> 
> I've been arguing it should be a clean design, with the protocol
> focusing on GPIO. And that the rpmsg channel makes it clear this is a
> GPIO device, the protocol itself does not need to include fields to
> differentiate between GPIO, I2C etc.
> 
> When they start submitting I2C over rpmsg, i expect the same sort of
> discussion will start again, so the likelihood of keeping backwards
> compatible with there firmware seems low to me.

Agree with you.

Thanks,
Arnaud

> 
> 	   Andrew


