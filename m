Return-Path: <linux-gpio+bounces-31946-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL0qJS0rmGlqBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31946-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:36:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DD1664C8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6F5301F32F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830A4315D32;
	Fri, 20 Feb 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N8Cj975l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2429B79B;
	Fri, 20 Feb 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579971; cv=fail; b=KGrrDU2KXmPyHFo/salJ/rRhg3aGloD4c9NOgSJ0N5yBxnfocSEzw4weVYtmk21JWtaDzpDV3321enKZrdap4xag2rmffQtZ8aoMIMzKptbzDkWfz64a90LyLjYOFm+ZLmluLzA7CL9qcb1WjK3GnkMVFWbQYCfUL/2QGRXDd/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579971; c=relaxed/simple;
	bh=OrleDfTMl6Mmyl4ThcJXo2B2/677c+Ni7y1DJjW/WS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nR3fqCxJE6vpnEQYvpLvpAD70oFIaYXlgv2Pwi8Kpdk6NiLZmDthCfpnPxQ/SWOIymHtuvJT0LNHsEXYjqu/O9k40zDlwin8C7nospp+TlijrIFU+5Xk64fZ7CF72ccJD0fDVfi7fBXvgVjhWLfE2WCIhddvIqkEVCJ24ixoxxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N8Cj975l; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGBsEfnwayte3RjDdfwiJaBvX0QZ+fG3dxDZ2Qb9qN8pGCUcFE63HdhNq+kiR5M3/FG9hFyLYyJukTgYu/5FA54m3+HMPjvDaCDiLxuQr2PTnaYLS+ZPK6LAUKpVRD66Xg2QHVAdWOKRndZzDkEkd9uA3Hk4rLWZTwbJts5qFzK0Zp2YlzT3ghNJIlJxqXs3AHXc/oUyUyrLy++KEbR9scUkas2tjbdbgOnGuuRP0EAj7zFaCCmhH3Nou2BZ1ockgv64UAoPiT4pIuxJ/QeuH7r3BLlja5PqP1dXfYPajmCd5ea0+hHdQEK9y73wgHv/bEScIM7ljQJycZWFO7oz2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e6I/L6vNtKyTnwWCbIrTmsPzO+ZLZatZtquZSEbNMQ=;
 b=nBQDcIcLweCEjh9Irp83j+/yiK463IdOWNrjFnwNIRl6WpGvX3kL5nBoYkQxCnMeVEnQFp71ORDxyWsMuH45oSAlOITA7EcuWm69hT8SERPj2KU9MrLCwOysGXPn3nxv+4Fvht/q+XA5FkuuZ5t+Jp02Zvr0FDH/GpHjGZb+rvkdLUltnxskCdLl+jvuyDf+55Hbfnbv//HN2waEJRwAoWmP77aq1cwgGDaSnou9dJFzgj2KerxaBBoijFxR8ln5q68kJCl7i98GJC0gaoMi3pRbkLkPwtj5jrL6ltkU8wauFrqPgOwHHvwG8MgHX58DH0rDjCR6f2AsMPJwPgv86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e6I/L6vNtKyTnwWCbIrTmsPzO+ZLZatZtquZSEbNMQ=;
 b=N8Cj975l27XLKraYUL7a6f15Znk/KHZrTz7DhAYrNg/slgQ+2w7jnjkHR/EgMEzaVcjJYqsLuuk6RSht/lwIkZP/pkImsbsESQ1j5o5tR/nlhGeeONEi9EUmFvi5U6IbbMIJ8/UmAuxXR7fRyFiiXiTfzdgxJGmYk8OWTpBLPKZDzHYGKYSY3zUq5oVdoF/Ch4//IunpAXMQgNUd0Xyvm/+Wv2xje+jS6AfQAIX1LQ6e/wxZLsE5A4HtFrRfFthgLxjADNuPauRKNF5/rEhJTXWLzGFWziVfSgGy4CWuT2VRdy0XDMxsbWPSbkynX6//Dyd126/8bp3IqK6i8s0T6A==
Received: from AS4P190CA0046.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::29)
 by PAVPR10MB7113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:32:42 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::17) by AS4P190CA0046.outlook.office365.com
 (2603:10a6:20b:656::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 09:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 09:32:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:34:28 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:32:40 +0100
Message-ID: <fdbdfd15-1848-4d17-ab1c-53472ab6c817@foss.st.com>
Date: Fri, 20 Feb 2026 10:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <AS8PR04MB917654F40D80A2DBAD30ACD1896BA@AS8PR04MB9176.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <AS8PR04MB917654F40D80A2DBAD30ACD1896BA@AS8PR04MB9176.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|PAVPR10MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 96aecdac-b807-47dd-3206-08de7062ff06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkRReU9WS3dnVkdtbFAwOFlvRjE5eUd2NzdVWWs2VXhFd01qTU5QOTFnNTRi?=
 =?utf-8?B?dUJnNDkyNlBhV1ptNUNDblBlaHdCZTBZODdPaFdISDltTnhpVFJzNkxVcXFL?=
 =?utf-8?B?Wnp3bHBsM0tiY0J4RXN1akFrdThhbmFuMDRLaDdWWlUzL1JJMEpOTWpISkxS?=
 =?utf-8?B?U3AveDV4VFB1dXVoNTBRVHErR3pSdmpnT2hIQkZvYnFxdldiY0lvTGV6cklv?=
 =?utf-8?B?TkY1elA1MGIrR0NIUVBNb1hoVTV4T1lGV01mTkpjL3M5WmlrL084RUFIYnpE?=
 =?utf-8?B?eEkweWJXaXpjenZsQVlTU1VSU3B3UVhvSmRRaWJLWjRPRStCKzBwZEtHc1Fn?=
 =?utf-8?B?OHgzblVtdFk2bUhpSUFDMjVTTlRQZEVQanFZelg2U2tNWTlGZ1pjRk9jUlNw?=
 =?utf-8?B?cHBQblN6WGlDV1d0ZnFsNndUeFc2SGYrS3FrRUMyOGlaZGxucm9XalFWemcv?=
 =?utf-8?B?WHQ0amxZdU56RUV3eUJEOUgzVnVFYXd2bVVTdWdJMFlLQ3JhblFPME5sZWoy?=
 =?utf-8?B?aGlCQXMySllnS1pGZDEzTCtQUXRXUHBDVUVJZkg4UEdTbEt1MnhkVmxRQVY4?=
 =?utf-8?B?NUlpQ0s5WGFEU2dDOGhieWNMQ1ZmWUllaFZ2YkdCNnJONXUvU3lveXRud0pX?=
 =?utf-8?B?VHRlVzFZMERCa0swMVduRm9hbDBTZWYwaldVamlOeW9KZzRweDlqR2JKbG5P?=
 =?utf-8?B?Yno0VDQyVG1wMlJscE9pUGpqU0N5eXdic2Y0cnpzYXJKZlFRQ0ZPUVRZU2lB?=
 =?utf-8?B?NnVyWWVVd0RMOXBvVWl0aVpseTRoU3EvTlk0MTRvL3NlRFp3U2FhdEIrTlY0?=
 =?utf-8?B?NWhoZ2NRTDdrMHVHYXpwaUlLcVNMUkhsTXBRbmFSYktCUytsSUNUYmU2dzds?=
 =?utf-8?B?Q0V5Mk9DVzJrNUpoTlRXVlExQjQvSEMvK1BTNTJUYm9yMSt0aFZDUzJERStC?=
 =?utf-8?B?ZnFvdk9Na3ZPNGNuMXdXS2Q0ZWNNR2hraGoxendIYUJ4QjJiMUIycG9zRXZG?=
 =?utf-8?B?WHpHVEtwNmpOWFJzZHBMV2M5Uld3T29JU3MxU3hreE1zS1JaSk52dnJoY3Bi?=
 =?utf-8?B?NFZQMFBTa1g5d2htZEYvL0NmRkhlaTVoTzN1bnZVbWNHaEtIdkVFL2laN3NW?=
 =?utf-8?B?RmdkOFJpMW1jZDNxK2c2VzBYT1ZPWlZuK0lkVDVIUStkMW1vMjFnUldkNXhp?=
 =?utf-8?B?Y3JhZ2E3eG8xSGFyTk14T0VLL2x5b1hoall2Q09xaVdIYmd0dzVyV05HT1lZ?=
 =?utf-8?B?eWFlTS9vRzd1QlFVemtNeXFWZm1JVENyM2xQSU1QN0tMTklQN1JGbENNOGQ0?=
 =?utf-8?B?OTY4Q3pka0ZBcitaekRMbGxZdFdCeXpLZTdlR3kwS1UwZll2K0JGL2NjODVj?=
 =?utf-8?B?U0JhY1k0dUx0OHM5S2pydXFFUisrQnNNVVNUTll6UUIvejBaYXM4VStPWGZ4?=
 =?utf-8?B?dkNHZEs5MDJuMnppSmhydFYrRHdKNnlsOWthMVA1b1VIS0hvcnZON1BPdFRX?=
 =?utf-8?B?a054dENQczkxQTdmbFBmd3MvY1c2U2NYa21QVjJoL2NtNDJXOGtubi9QZ0pY?=
 =?utf-8?B?eHVNWFRvMjdGYllLRm10TVgrbkFJK2ZBQnNLNU1YWVY5M3dZWDBLZXd6WnlY?=
 =?utf-8?B?eXIrZjVTY0cyeFlNeWY2Z1lURXNRMmZZRDBHWnZOSHBBYzM4YkN6V2pNUUsv?=
 =?utf-8?B?WlIvOENuMjFEaVovanFUa25RSGcwWVliVTRCR3FIQkxoek04TTZ1a0FuWEtU?=
 =?utf-8?B?dGVqeWpza1NTWTcyZEZtN3BwNkJzczAxYnYzYmJVWlhjVi9KUUhWYUlLU084?=
 =?utf-8?B?a0NaRlBkcU00VXVFZE53NnNJSWFrVDhRdnFOZzVCcHVzVXN5eFlQVXR1c3FQ?=
 =?utf-8?B?S0dnSGp2YVdDWG5ZMGFZVTh4YWlVNG9vbWhRZjQvdUN3OTFpRE1pTFhJK2ll?=
 =?utf-8?B?RXpwSDExc2dhUUp2NVhjNm5oY3pndng5NlpSeXlzYmxaeGwwVlJoTWJ2ZStu?=
 =?utf-8?B?SWIwOEI2R3p0dlptSUlpQ3lFdHlXdHVTNGZnWnNZMlo5c3J2QUV0RnlKWkMr?=
 =?utf-8?B?WHpHVklZdjhoaUpCOWFnMDBrbnU4T3lVZEVSQWZvTm1hQ05ibCt6Zjd1b2pO?=
 =?utf-8?B?MVMvOFZiY1c2S1VpS3lQZFdxRCtsRW9SeVdxV3FTRFNXM3VqRmRDYWcwMVQ0?=
 =?utf-8?B?cUxadkhDalp6L1FISTEwOHBJQ0JLemozZlVUZDhxQ3JnemFhdTQ2MEc3M1Z4?=
 =?utf-8?Q?AGoSB7A7PpgA76BzqPiihwb3ALAelRTc+hfPv8hKns=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R+e/cSZRToJvrbcFG1aXRPa3grCWrwqVEshrnLI80StJzKSLEm0CZZ5RF5HcvH67M/QlZ+J+BdhbPYlkw7M39y0D4Doww0zsw37TmwqEZH3W+rJgBYWdnSMfvXmPnNAkjhAqABuZq9n/p679Cb1xS7VrcOHxinJqSt3h4C+0ppDzeMoMgpDrcxlwG1y05MjEKBE4HcUxlQk4uvlnDZ8MMngvIc71zaqQaJnXkTR1b/qZIkGdVaCirLs1bZJl1NWMsDG7unZBCJK9CXOepCYUqzFbRZkaJ25E90LIuZ7LESb1I2KUsNyhboCUFPxvhlVS05GW7Rz8+6f5hOZFTVznnqgXG7NOEFbbUiFmQZc1Byxn2nBypD3IGs4bzl9H7ZWRguTMWaGdQFy8LOjOcrlRCiEw0eB2mZiXNkQ5jGttA82dlxzhCh9pSKjLHbwKX/VJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:32:41.9583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96aecdac-b807-47dd-3206-08de7062ff06
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31946-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B22DD1664C8
X-Rspamd-Action: no action



On 2/19/26 22:13, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Thursday, February 19, 2026 3:21 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
>> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
>> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>> +     rproc = rproc_get_by_child(&rpdev->dev);
>>> +     if (!rproc)
>>> +             return NULL;
>>> +
>>> +     np = of_node_get(rproc->dev.of_node);
>>> +     if (!np && rproc->dev.parent)
>>> +             np = of_node_get(rproc->dev.parent->of_node);
>>
>> Is a topology where they is no rproc->dev node but a parent node exist?
>>
> 
> If no rproc->dev, it should return NULL in the above check.

Regarding rproc_alloc, seems that rproc->dev.of_node is always NULL.
so probably test on it is useless.

> 
>>> +
>>> +     if (np) {
>>> +             /* Balance the of_node_put() performed by of_find_node_by_name().
>> */
>>> +             of_node_get(np);
>>> +             np_chan = of_find_node_by_name(np, chan_name);
>>> +             of_node_put(np);
>>> +     }
>>> +
>>> +     return np_chan;
>>> +}
>>> +
>>> +static int
>>> +rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
>>> +                         int len, void *priv, u32 src) {
>>> +     struct gpio_rpmsg_packet *msg = data;
>>> +     struct rpmsg_gpio_port *port = NULL;
>>> +     struct rpdev_drvdata *drvdata;
>>> +
>>> +     drvdata = dev_get_drvdata(&rpdev->dev);
>>> +     if (drvdata && msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
>>> +             port = drvdata->channel_devices[msg->port_idx];
>>> +
>>> +     if (!port)
>>> +             return -ENODEV;
>>> +
>>> +     if (msg->header.type == GPIO_RPMSG_REPLY) {
>>> +             *port->info.reply_msg = *msg;
>>> +             complete(&port->info.cmd_complete);
>>
>> What happen if the remoteprocessor answer after the completion timeout?
>> Could it result in desynchronization between the request and the answer?
> 
> If the remote processor responds after the timeout, that late reply will be ignored. The current
> transfer should fail with TIMEOUT, and the state won’t be carried over because cmd_complete
> is reinitialized before each new request, so a stale completion won’t desynchronize the next
> transaction. Each command–reply cycle is isolated, so a delayed reply cannot corrupt or mix with
> a subsequent request.

I missed the reinit_completion. Indeed, that prevents issue if reply 
arrive after the time out.

That said a second request can be sent before the remote processor 
responds to the first one:
- resquest 1 sent to remoteprocessor.
- timeout occurs
- request 2 sent to remote processor
- reply of request 1 received

Wouldn't this lead to a desynchronization between requests and replies? 
I do not see a mechanism that would prevent this

> 
>>
>> Having a cmd_counter in gpio_rpmsg_head could help to identify current request
>> and answer
>>
>> the use of reinit_completion could be also needed
>>
>>> +     } else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
>>> +             generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
>>> +     } else
>>> +             dev_err(&rpdev->dev, "wrong command type!\n");
>>
>> Could you print the msg->header.type value to help for debug?
>>
> 
> Sure. Will add it in next version.
> 
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev) {
>>> +     struct device *dev = &rpdev->dev;
>>> +     struct rpdev_drvdata *drvdata;
>>> +     struct device_node *np;
>>> +     int ret;
>>> +
>>> +     if (!dev->of_node) {
>>> +             np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
>>> +             if (np) {
>>> +                     dev->of_node = np;
>>> +                     set_primary_fwnode(dev, of_fwnode_handle(np));
>>> +             }
>>> +             return -EPROBE_DEFER;
>>> +     }
>>> +
>>> +     drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>> +     if (!drvdata)
>>> +             return -ENOMEM;
>>> +
>>> +     drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
>>> +     dev_set_drvdata(dev, drvdata);
>>> +
>>> +     for_each_child_of_node_scoped(dev->of_node, child) {
>>> +             if (!of_device_is_available(child))
>>> +                     continue;
>>> +
>>> +             if (!of_match_node(dev->driver->of_match_table, child))
>>> +                     continue;
>>> +
>>> +             ret = rpmsg_gpiochip_register(rpdev, child);
>>> +             if (ret < 0)
>>> +                     dev_err(dev, "Failed to register: %pOF\n", child);
>>> +     }
>>> +
>>> +     return 0;
>>
>> return ret
>> or indicate why the return of rpmsg_gpiochip_register is not taken into account
>>
> 
> rpmsg_gpiochip_register() failing only affects whether the GPIO instance gets created. The
> rpmsg channel driver itself can still probe successfully and continue to operate for other features.

This is not safe, by default you have to exist with error if something 
fails, ensuring that all resources allocated during the probe are released.
If there is a strong reason to not do this you have to explain the 
exception in a comment.

> 
>>
>>> +}
>>> +
>>> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev) {
>>> +     dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
>>> +}
>>> +
>>> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
>>> +     { .compatible = "rpmsg-gpio" },
>>> +     { /* sentinel */ }
>>> +};
>>> +
>>> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>>> +     { .name = "rpmsg-io-channel" },
>>
>> I would remove the "-channel" suffix to have similar naming than "rpmsg-tty" and
>> "rpmsg-raw"
>>
> 
> The channel name comes from the remote firmware, so we can’t freely rename it on the
> Linux side. On i.MX platforms the firmware follows its own naming conventions, and the *-channel
> suffix is part of that scheme.

As Andrew mentioned, in other words, you cannot expect to impose 
upstream constraints based on your downstream legacy. Your legacy 
firmware will continue to be supported by your legacy NXP rpmsg GPIO driver.

Moreover, changing the name of this rpmsg channel will help you have 
both drivers coexist in your downstream kernel.

Regards
Arnaud


> 
> Thanks,
> Shenwei
> 
>> Regards,
>> Arnaud
>>
>>> +     { },
>>> +};
>>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
>>> +
>>> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
>>> +     .drv.name       = KBUILD_MODNAME,
>>> +     .drv.of_match_table = rpmsg_gpio_dt_ids,
>>> +     .id_table       = rpmsg_gpio_channel_id_table,
>>> +     .probe          = rpmsg_gpio_channel_probe,
>>> +     .callback       = rpmsg_gpio_channel_callback,
>>> +     .remove         = rpmsg_gpio_channel_remove,
>>> +};
>>> +module_rpmsg_driver(rpmsg_gpio_channel_client);
>>> +
>>> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
>>> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
>>> +MODULE_LICENSE("GPL");
> 


