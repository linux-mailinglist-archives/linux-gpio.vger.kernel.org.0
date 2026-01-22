Return-Path: <linux-gpio+bounces-30936-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ6oFDdVcmkJiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30936-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:49:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 674486A4D4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A86F632B90CA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0433F868F;
	Thu, 22 Jan 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="I6c+7Irk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A643F6FE0;
	Thu, 22 Jan 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098876; cv=fail; b=joTnCdn0Z+19TvsGwu0iJ7aHRFK19jwuZKulXARQ46KOdYZFlhpqMLV+VTttBSPpjUK448T3/LrsnHlCGyv3PzsYvkVTWQbD8eCK4pnjvuuro6VUfqg8llTQl7btSjSP0VQvZhwnDX1TWHTp85K8nKPNBxlPh4RhLznxeZhskTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098876; c=relaxed/simple;
	bh=Zx3fD3TmQa50ZDcT398GmmjoVZFZhk6CyRQGscQIcWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Td/h0/GMnPdnACP7nEMyKI2vlQFMrdWzvFLxhZqA7ig4evcuk6Kkb5U4ciY2Ww5szlSLc072z+CvL+oeTnW0gkWeWYwaB3axT66ayBKmL9E4kdY6EhtECYs6Wjd3Q6JEITNwEbLtZyR4JtYxPKSjlIB2ejKFbDFoTcNGzBKNtgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=I6c+7Irk; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MGFjNc327406;
	Thu, 22 Jan 2026 17:20:46 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggghhf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:20:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8S8FhuEXBhSxX3kC0WaztpP0dOiIDH3ignApLPAV6wFY2rdoBRXnQXMsq3T7JKTyJPJXj5DtvF6UOUQly3E02hteZ/UXo2Zoa4DUPmdPC1oDWt/lo6scH9ZkL3mjBJRGs0ZDxW1n7zmc2DctAAEV4AhzrSWZNrytjupP0Th5MSodgguMLVkzD4PW3Lmh33Sq+DJQPyQMnto3gFpJEw3HEXlrz3bqu3FOPodDB1stFYEGhBCZHX+5SL2DodSpSOR/mSjYGKgCpE6Yu3IUwUgjnUE+U72j4pac+7lu0tXd4sGp0B6D9Py/HVylhWdQ2/n2hFBQ0Cg9bU6Iy2/JafdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ernEp7KlB6dLKXwg2+8felSrDfFfiqskUyyRlMO8ybY=;
 b=vOXYYYJn75oHyXHt3AQ4k6hnKoyIVEir/O1U+Q/PLyhE3MVy8CS9W45QST2wO3ytSwVJGwPCYhfrDt5MXIABYq6tVJ4ZAJ1v8M0cap4iA05WnzDQkAFcHA4rEbRTMG8rii8p4vrRY6uC+TpJ4BBLGke2vGyaepR7ALknRspVPrTH56JN3OFPLJeAcBl+hh7ANe1nLAMjV6y0PTSC4W+AOxJoF79+1W7I1lFDi0WPbVuK3uCW6rBWXDjyVY5I3I5cPVmC10zB6NnOlAl01zBiQNVuNf7T0P9+E0nfNB3abIdklORgG7a0vqUB8CMGD93hdWPSmn0j6F8xq55AyHNnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ernEp7KlB6dLKXwg2+8felSrDfFfiqskUyyRlMO8ybY=;
 b=I6c+7IrkxV4wLKe84ljTQZantWVNFmsldQnsd3UyShOSvMzsE0aaW9B76M2iP13zZ0d8x6Afm4ReXr1tTKQxPbWZFmO4wIdvbXrB6x2ZdhHoBeplGM6eMoHN+PhVdZ5aAa71cc4fxkeHxhknfRSyhpKJJ8lAEEa3fewTPLe/fQ5knlPmNdK5B8P0V3UjM33NrmYVfmYQe+NdNnugy/WChAIC1MeaPyoaP0Y90GRuYAtLigx7FXkicLhL+mdpyydlfxFYlMAhtJ/DYB7rfvNWoGhaKJmyPQM5KLC4M63AumYoCt92dTZwkAAT+McWnZBTQQNHtSd6stA+eMH6pUNe/Q==
Received: from DU7PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::25) by GV1PR10MB6050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:9e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:20:43 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::9a) by DU7PR01CA0036.outlook.office365.com
 (2603:10a6:10:50e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:20:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:13 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:42 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:20 +0100
Subject: [PATCH v4 07/12] arm: dts: stm32: introduce the debug bus for
 stm32mp1x platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-7-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|GV1PR10MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: e99b5a86-4a42-4b9f-3b53-08de59d230d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2lwaXQzdHM4TFp1R1NneU9ldjRHUzlrWHpLWERETTVTc1VNTnlNb2Jtekxp?=
 =?utf-8?B?UTRPdlFOMGEwV0VGRFdDWVlTOXRjTzJQcWZxUVBEZlVmazZNeVdxd2pVOVFD?=
 =?utf-8?B?cHJrVm5kbU53NmN6NWZZV2pLODYra1FXT1NwS3ZkU1NBTkFxTGtRaXlaS2Nz?=
 =?utf-8?B?SXZKRFJ3V2wrUGJMQ2tXeEFyM0diVmFQZzA0NThkRzRqVzA2U0N1djZVV3Ni?=
 =?utf-8?B?b3ZZR0JVOWlzOE92VjIvcnZSOVUrbmF0bFBVTGRSb0RxS0pNcHhPUVAwWU9D?=
 =?utf-8?B?VUNtOGNRQkRYanJmTTI5d0FsZXA1YTRYd0paOTd0cXgrSlVuK3UxZklIVHhB?=
 =?utf-8?B?WllrZDR5RExJS1VYQzh6Q3VKTTZocU1ZTzV2RzVPS25qMUNQaGw4a0l3dzlG?=
 =?utf-8?B?Mng3RGE4bGxqR0xkNU5ZZFFXd3B3cmd3cmdIclptNTJjMlRzZXNFRlRNWThp?=
 =?utf-8?B?djBtM2dXbXJPb01kcXBUR2hQMnQ5VVVuMEU4cFBlcTVSaTVmNVFjem00bGdU?=
 =?utf-8?B?OE1tQXZKbXBqWjBnUDYxcEg4MlM3V1J4VytucC9LZlJuTldXMkszYXZOTmxR?=
 =?utf-8?B?WjhUQ0d4bUVWaGZxdENkUFlpYzI2OTEzUlYyaVY1dFprVVpyVTIrTUFhOVBy?=
 =?utf-8?B?bHBUNkY3NGVVZXc0UzRzdFRLMGE5QmJudGFlSU5NeUhUcXJJS2RNanVHSEpJ?=
 =?utf-8?B?WEI5aFhzenVkK3lkbzdxeURpOUNYQTB2cktUVmJnaHgrVENYOU1CQW1BaWxR?=
 =?utf-8?B?MnNka3JDMHpVQ1M5V3lRblY0bDFhellYdFhvc2s4T2p0d2hkVUY1WGJKVDda?=
 =?utf-8?B?by80KzFSSzFVUlBiZ21qUk5KTFNaMERyckN3OFVSUW9ZdjhOUTk0V0pLRjJP?=
 =?utf-8?B?ME9iRWFzN3dSSmZ6RE5GcmU5TXhPZkJYWFRxaGtLb1lyYWwrazZET1A5K0tx?=
 =?utf-8?B?L0JPYXpMVkZxcWptakJPemRYdWhyeU1zN3N5M0duckpkRUJlZ1IzdEdES3pz?=
 =?utf-8?B?Ny9RNnI3bUU3QXlRUS81SVNRYy8rYy9kTmpyZGhhK29nbVRycTBScDdRVzRB?=
 =?utf-8?B?UGRIMm1FTk5PLzFsZ2NUY3AzTytPUUt3Y0d3eW1uekZjUzN2Z0tpUmk0TVhP?=
 =?utf-8?B?Q2dkRlFTb0RkTW5uVllSNnVnWlo5bWxvTnNjOEtYZ2F6SWRveDRmRTY3eER4?=
 =?utf-8?B?TVNoUjVubFFHejBnV0EvVjVCSmE0ZEtkMTNqeU4xRFJEcEs5VTIwY2IydnJH?=
 =?utf-8?B?RnVFaDlvNktkNDJyTFBtbzhYa2cxMlhOdFdqY09WTHlTcFZ5K2Z6VWdvWTFN?=
 =?utf-8?B?Q2hNbTE0aXZtUkV3eEVKNEh5c0hmMzYzc0hsZlhwUWI0RWFuYVBLNGU4MFZ0?=
 =?utf-8?B?cDNDdUdWdWxId3BSeStxYlk1amd6Y21rbVhDSzZmOVJxNDROME9VN0VxRDR5?=
 =?utf-8?B?YWt0bUZQSitqeDRjVmVEa2ZJS3ZVNkNVUUl4WUQ3eE9jQ2xRNUhZWmtmUmtE?=
 =?utf-8?B?N3czbzZ1aFk0eUszM1hjSW9aQzJzZnA1bTk2RTZFa2VETFFGSFpVNW03NGJ2?=
 =?utf-8?B?Rk8wdG8rVENTVFRlQ0UxakQxeS91VTB2K3B1TllyMHB5WEZYVTBBeXhhSTZC?=
 =?utf-8?B?QzFyeFhyQzY0QnhJVE1CUVFkUitweTJoYk9USkZ2Qm1QUHN2SmdGRW5yUWZk?=
 =?utf-8?B?dFVQNkpMYm5KOTI1b3R5dURzMmt5TUlkc1R5SlRUdkVvVGc5KzVOWktTRmtr?=
 =?utf-8?B?WDArVFJvSDIzdUJtNmdNdnVxSnZwZ0ZRTHhRTXhHa1BDSlFGU1VLMkxpY0ZU?=
 =?utf-8?B?ZVlVbzNjR2xaTVllNEk1eXVicjVqZUFvVlNHZ1VYdXJjd0FRNTQ3UnZZbXBu?=
 =?utf-8?B?UnVyTlphdjZMUVViWEYwY0tST3hyR1BGOGNZYkxXQWpwdVZLeUcwTS9IVHZm?=
 =?utf-8?B?UDFLOWVSVHM4dUF5VlpCYm1kUFoxbFlMMk9JV2Nadll0SkYxbUsrMGRrdkdx?=
 =?utf-8?B?dzEySng3UGx2UFhQRkFveGp2ZnBBUUsxZWVUaDlwS1dlbEhBTzlkSTJ5Y1R6?=
 =?utf-8?B?MTRhOGlmZ3BqcG9xdm9hc3lTaWFMOHBwSVA4Ty9NUHJRY21wM2EzR210eXpP?=
 =?utf-8?B?TStFRlJQcTlYR0FkcXBQWDVuOHZWdm1jaTNKRHBDcnZrZnFzRUFJYWVzNVRr?=
 =?utf-8?B?ZSsydlltNzJZVXJVYzl3VTRGTXkzMlV0eS9YckhmL1BibE56WDBhUVlmNFdN?=
 =?utf-8?Q?2jVhrwsYccUL9m3u6nDG8owvO2hibW1Fn7HB1re7Oo=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:20:42.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99b5a86-4a42-4b9f-3b53-08de59d230d7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6050
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69724e5e cx=c_pps
 a=383bDpamuXABF3/M3Waz+A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-E33GuBO8opgirhHEr4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 7lPi3qYir6Yc-HMWRd-SJmevMbW3jHd9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX2qr5Ia8n9seA
 rQVdxT/k6DLIS9aOP0JQU27OLntvVrhpKTkenZg9DkUUWso/MlDpe/PV4tSlv/vq3aQdkcdb51H
 WlmTmhL0u0B3ufPjWtSd4WAPyNcyDKF0EDWNPues6bRVq4bm78ScGquL34E4XzSLEG76NCOsRPB
 FbcekDnd4Utqt2Gtyi9uSfEzlQc2RAlg/YDhPpYwvP8W5YbqZMSNksKpdDMmNrSsIMHnsKQi09Y
 rBDgyZ1W3BcCCOH7TatE88zPlTrzbRz6LwVvH1xed/VrEsEDjGDth3PPDyrjYwlEOEpHVrlu+ms
 K2ylmrUsbSPbeHxR/dxZ32IgMrPP75WnkZ7/LlBD5xg+/5Uii9oCoR5/OtLe4PJLpVRTFt3s0DC
 Tnx9BRQNeGFsMRulVEPnJYRxZ+ON75KEK+bTXGqLDBIfDRk4sGut6nhvpoIzP1IBAzZrDVNjosH
 xbodKdB0IYpMYnsrdLA==
X-Proofpoint-GUID: 7lPi3qYir6Yc-HMWRd-SJmevMbW3jHd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30936-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.252.83.248:email,500dd000:email,2.252.41.0:email,0.0.0.0:email,st.com:email,2.252.95.176:email,4400e000:email,500d8000:email,5002a000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,2.252.87.224:email,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 674486A4D4
X-Rspamd-Action: no action

Some peripherals cannot be probed if a debug configuration is not set
in the BSEC.
Introduce a debug bus that will check the debug subsystem accessibility
before probing these peripheral drivers.

Add Coresight peripheral nodes under this bus and add the appropriate
access-controllers property to the HDP node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 117 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi | 172 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi |  68 ++++++++++++++
 3 files changed, 357 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..a2513d55499f 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
@@ -964,9 +965,125 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp131-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp131-dbg-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges = <0x50080000 0x50080000 0x3f80000>;
+			status = "disabled";
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&etm0_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..1580fdcfb772 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
  * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/reset/stm32mp1-resets.h>
@@ -274,9 +275,180 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp151-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp151-dbg-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges = <0x50080000 0x50080000 0x3f80000>,
+				 <0x90000000 0x90000000 0x1000000>;
+			status = "disabled";
+
+			cs_funnel: funnel@50091000 {
+				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+				reg = <0x50091000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						funnel_in_port0: endpoint {
+							remote-endpoint = <&stm_out_port>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						funnel_in_port1: endpoint {
+							remote-endpoint = <&etm0_out>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						funnel_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&funnel_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_stm: stm@500a0000 {
+				compatible = "arm,coresight-stm", "arm,primecell";
+				reg = <0x500a0000 0x00001000>,
+				      <0x90000000 0x01000000>;
+				reg-names = "stm-base", "stm-stimulus-base";
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						stm_out_port: endpoint {
+							remote-endpoint = <&funnel_in_port0>;
+						};
+					};
+				};
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out: endpoint {
+							remote-endpoint = <&funnel_in_port1>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 92794b942ab2..17d52d93695e 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -30,6 +30,74 @@ timer {
 	};
 };
 
+&cs_funnel {
+	in-ports {
+		port@2 {
+			reg = <2>;
+			funnel_in_port2: endpoint {
+				remote-endpoint = <&etm1_out>;
+			};
+		};
+	};
+};
+
+&dbg_bus {
+	cs_cti_cpu1: cti@500d9000 {
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0x500d9000 0x1000>;
+		clocks = <&rcc CK_DBG>;
+		clock-names = "apb_pclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs = <0 4 5>;
+			arm,trig-in-types = <PE_DBGTRIGGER
+					     GEN_IO
+					     GEN_IO>;
+			arm,trig-out-sigs = <0 7>;
+			arm,trig-out-types = <PE_EDBGREQ
+					      PE_DBGRESTART>;
+			cpu = <&cpu1>;
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs = <2 3 6>;
+			arm,trig-in-types = <ETM_EXTOUT
+					     ETM_EXTOUT
+					     ETM_EXTOUT>;
+			arm,trig-out-sigs = <1 2 3 4>;
+			arm,trig-out-types = <ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN>;
+			arm,cs-dev-assoc = <&cs_etm1>;
+		};
+	};
+
+	cs_etm1: etm@500dd000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0x500dd000 0x1000>;
+		cpu = <&cpu1>;
+		clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+		clock-names = "apb_pclk", "atclk";
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&funnel_in_port2>;
+				};
+			};
+		};
+	};
+};
+
 &etzpc {
 	m_can1: can@4400e000 {
 		compatible = "bosch,m_can";

-- 
2.43.0


