Return-Path: <linux-gpio+bounces-29737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EDCCB699
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07E3230D556B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447B7277C96;
	Thu, 18 Dec 2025 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FHpBc3tE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6119755B;
	Thu, 18 Dec 2025 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053830; cv=fail; b=KXpKTzCep8DnXdysgleAR/hH/vUxaEvLIeWyB25Weeh3N76Cp9MdoPvNQRgRGf6H6dk9BgYFzId5pg4eqnP8RYqKxJ3Jl7E4k63PzvACR/oa4D4QmeQCiDz6t9CFe7hgucp5At2pROzm7r37inoN1GGmttO5LreKYkiSFvH38X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053830; c=relaxed/simple;
	bh=xaEXZfGrlA1mSTghtQgQCneDWuPdo/gwSww3C9PFT0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rofLL8HgcxTcSOn4ZKYTqP3Krd0NG6mNgMSmpduh3+bGzQw3kiYRMhkvc3EfmfyTShbpqFaszmVionUlDdda9tCwghH7ar57M8zzvpnnzs3PlxhGZHJsjAQLOmhyfoCqQBSg+FHRJ75Jqtm+bOqiCTRogxJTXLlxiPzcwmS7Nzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FHpBc3tE; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIANJrd2086179;
	Thu, 18 Dec 2025 11:29:54 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3xb73vts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:29:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HytNhJOpxUCTA5u6XeDUi3bimo3HLaS14Ks0i0Utuc2VDvCeNKnQSfMzRWYg7jV8w6Y2tHRnO9TaJ6UfYy+S2kZ8nIRgllybgTQi/4PJrjKzOwo8ju9OMwi+A0MYfvgTb9SzAzC5mWt0Fv10oZzffIJr3KkMGJ8I5GpipTzvSVnDNT7agICBVhZK0WmoqrG7iRcFhMMdjJ6p378b1F0YMRtjQvxNQRiaGkG2fqdpWzTir6lXuJCSnvrhQEaLxBKPUsihvqkz/1TURUkkOwjgl3RE7sTZ6xTfYS7vAW9wIPJxMBe1YCm2f4VyrlRDCFOc2nGi4nuiqigRmvJATRpT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOf9GceQ1+zOdDDlYCSkyGG9ZbiZqGL3a9c4+ZkFcc0=;
 b=SOgxjFyqJI+rKUR5SNft0pchJCkmSSVYScjnTxZ5xrodu+D8tGktHBgln61bhP3VkpXlnlXL257s+lbSR/e8eWV4rSfnAhzlcu5hHMwDQ3bqxJHd5aTEr7fEFetrddPnvXMafYvw1qx7h9Ikct6EcezQ5XiCQGelgpuSmDRdn1/jDLcVKZ+VlbVJWdf3cCLzpsrctxC9sZ1CZXXZeVkBUIo2juhRJOoSkkmoxw650fHVZ1gtEYJW+qK+Dct+lHyrw+RfO8I1zQlf7WLMMJ3lozX+5dQAohPXJyuakJ9p5Q5mMKI9ooWwGuw8Od72gCyZYu1Gt7lqQbktByxlNYb2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOf9GceQ1+zOdDDlYCSkyGG9ZbiZqGL3a9c4+ZkFcc0=;
 b=FHpBc3tEdBUckbyZOF+pYMiK3dcWm7cgzd5JJiuoKndXb5FzarskPSQMYmWDY8tKUqgb8Gq7VQ4QaOrd0NurDixCdxGvydO6l6Tv34GHmJFpo+1aRSx2RfpkbNG5tz+KPPdVoSh0QAeJSCIFZDLUUJdCfSUBsel97z+6qM8znbAEtj9fE5RPhxWqdB5SX8nAo70+sMY9air8n8QX1wOoAQhn2kqDQhTmRzjqMzsjYVm3hGLmOsOX2zEFyMn/L8xRKJCSZWbX+LMONbtsyIuJa89FKkkFlBqQogBw8MPJP/11HurMbG9WmE6WTwrcWuzVIbYIeGRdCMa7Hz4UGc0fBQ==
Received: from DU7P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::30)
 by AS8PR10MB7182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:29:48 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::72) by DU7P250CA0003.outlook.office365.com
 (2603:10a6:10:54f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 10:29:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 18 Dec 2025 10:29:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:30:33 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:29:46 +0100
Message-ID: <f53639e8-feef-438a-9b1a-c349fc17d0c6@foss.st.com>
Date: Thu, 18 Dec 2025 11:29:46 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-imx@nxp.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20251212194341.966387-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|AS8PR10MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d5cda5-9b2b-4c6f-a301-08de3e205f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|13003099007|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0RpbnF2TmVUOW9jQTlpbUhIL25ybXNpRGZSVFNjZmRQYWtxNENYcm9KTnY3?=
 =?utf-8?B?VVZORjhwa0w1R1hNRFk3L01LbnYvN01vUCttK01GcHlIM0FhYUlFdFlINFM3?=
 =?utf-8?B?WmtQRW55Q0RJN1R5cjZsRm9XdUI4OFFoNWxScHoyMUpzSVBhZWpmMG5PUWRF?=
 =?utf-8?B?Nk1GeE1NbjlvVC90RnZmaXpqSlhleFdpcHc1Z0x5aDdLREl2YzNuTFZESmVx?=
 =?utf-8?B?MnVGTDA0R1QrR0wyT0M5M3l1bURMOXo4UmFudGlndGRZZUlBWjVrVWEvTmlV?=
 =?utf-8?B?c1ovenlETnV1Vll4aXU3NkxjRG80ZFpmTmZyaFkyN3hOSXQzaDhBTnp5amRu?=
 =?utf-8?B?Q1VQVnAzRklXSExwM3lNZ0x4VGtuaG9ESzd0NEVhSXBpczNHMEUyNkJWcDg2?=
 =?utf-8?B?RUxBSXQ1SEhDTWpneHh1OTF2YXhrTktkM2VjQ0Z1c012ZW9TbjdYTUJCdWl6?=
 =?utf-8?B?WDZxVkxzMjhxRisyZyt4eTB6OEJvaml0ZzBCK25HRDJ5c1l2NThsUmRKQi9B?=
 =?utf-8?B?NmtmSG9iU1ZZUE55VE05b2VFaExyQW5SbVdEU0oySklwQzloL2lvMGlKNWs2?=
 =?utf-8?B?enVPU3FpcGUvNVorSE5MTVZlU056ZDN5T3pXbEI2ZGI4WmpRa2szbnR5VlBu?=
 =?utf-8?B?MUQrZ1NUODhYN2l5dnN4UzFkQkZISTRQNzF3STNGOGZsaHM2S2VtWE50U1NV?=
 =?utf-8?B?eVprNFJSNFdRODVKZDJBK09LNzB6WGRBRUF4M2s3Nk9COUg2S1RMMzc3aFRz?=
 =?utf-8?B?MlFYSEdxNlpjdjdZN284YzdDS3dRVVA5NEJxRVJjY1hmOWE3azZCTlk4TXRS?=
 =?utf-8?B?TUlXcFozQzZ4NFJqNnRiclNhY3lmVFlsNllJTnBsaVdJOVkzRGdXVlFMZ2Q0?=
 =?utf-8?B?R29XTmd4R0ZPYUlOcE9sZnJnb0pqZjlNcjZZMnpvTCtFZllTdmpvTjlpdHZT?=
 =?utf-8?B?ZHZlWlFETDkrUGxLa092elBPSHVJbDN1cEEzbWZMb3FlVlFOanBwY1Bkc2k0?=
 =?utf-8?B?WFErZnR4R2dibEV2OHRXd3hPby9uZ0V2ZU9GR09RQmE4bWtTQnNZYTB2NkQ5?=
 =?utf-8?B?V1R2OGVXOGtkb2xaSFczeXZYSVY5UFNaQjJnNzVsOEZKRXU2eUFSOEtuSDhN?=
 =?utf-8?B?UkNTZ0IveldrWW1xT2JQZkl0RzRoRjNFQWk3MHFUZ2FrSTFQVXQ4TklvVjNT?=
 =?utf-8?B?ZjRXRWN2OFdGTENLVm16MjFqN1BFV0ttbk54Q09DNWJLL3JrS0FhYWVPeG9X?=
 =?utf-8?B?Q1JwYVVJdlBVUmhKUnlDU2Y3Z3VvZ0ZyU2NpNGZKQnErYzhxYzhHNjRjQ2ho?=
 =?utf-8?B?eXJYYkdKQXFsR3laMXlETUlPT1diRmEwK1FvOVRYZURXdVRlaVFidkJ0d3o4?=
 =?utf-8?B?SXJjdWhpdXJUcFQxY3VqaWttazVPWnoxSEk3b2h5T2FzWkhucjFwU2NzRVg0?=
 =?utf-8?B?UGpYN2VjdGd3cHY1TnZTKzVhR0JRZ0lYRTM2bzM2Q0xVeERtMVVPUmZWOW5n?=
 =?utf-8?B?dmNWVmJoMXJqcnlUQ01reG5DMkJXMzZ1Z1Jqd3YrL0JGeHUyZzY2U2pkSndM?=
 =?utf-8?B?RER0QVFkUGIxU3gzUmRBb2tFSDVOSmRDdEV2cjBzZUdubW4yNnZlK1RBRjcz?=
 =?utf-8?B?bWxuZUFwUm0rOGRnWDBuNVVNVkNWRVZCMWVsNTRrTzdGaFJPRFpwY1dickww?=
 =?utf-8?B?c3o4WlNkNXZlNXIyMTkydW9RZVlCcUduRWVBV0JHZlArTWJ1SHZOdHNMUGxX?=
 =?utf-8?B?U0htZ2NmcTFSUFlBajVoTEozZmxNMWtTYmM5Tjc1ZGpraG9PNzByUEFMQ205?=
 =?utf-8?B?U3BBcDI3MmdDTFVpNDdHeDNNVG1JN28wbWU2WlBxRmtPTWR3ZEVoaHQzOFYx?=
 =?utf-8?B?amh3SXNuWFhMaWFMUVBuWlVaRHlDLzV0TnZNOGVWRS9wb2J4M1g1aS9GRmFV?=
 =?utf-8?B?WFVjWWFTNXpnUjdhZnpmVXQzd2FaaWhGWEdtTE9leWRldnVqYjViUnNKZGFm?=
 =?utf-8?B?cGpYTkg3cXVRSVNLTWI4RWJKcUxjZUZDeDJ1MXV6cWlaTDAyRlp5c3JDVjBp?=
 =?utf-8?Q?M7YVIz?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(13003099007)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:29:48.7016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d5cda5-9b2b-4c6f-a301-08de3e205f13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7182
X-Proofpoint-GUID: j5y8Q_jCrlZQ-dlEKYqYENpasEiN9Nos
X-Proofpoint-ORIG-GUID: j5y8Q_jCrlZQ-dlEKYqYENpasEiN9Nos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4NSBTYWx0ZWRfXxo1ebNaKo7wX
 R3A3CIT10Z0L6WTgEVGjmj3uwBfG7+MNjNH1RykRC3gCMmc0jYZ2J3OKqEoldc0M6jjC/ccwuxt
 8sRstSmV+KMKoUnYQIgaP17SQkmezINKKkeh9/PBUp1t+9SMHQwkgDub/ZkXtOpWt6FWKPMCdCQ
 6KRmn/eOpeDiwOS9e7RYT1fCN8weWWP8HXQElEZXB/1MTkmSY9LdyLgXR8jTgblzi1pZJHv5ZHg
 Gk3oY5s4XydKkUbvk8rHE1SOozvX7f7lP7ULvYxPJNcLCywKr8rJ8xFiauQ+2pdLeOENsF3OqgS
 WqlFBmHXbqSyRYW8tKU4fHgHF0ypEm8ibXW9GDLRugi8+NcqQ2puzfFW8/+VyKnyc/prm+ZO+uT
 VIgHMObLS9XPKZ6aPhGzGEPuNBFilQ==
X-Authority-Analysis: v=2.4 cv=NZfrFmD4 c=1 sm=1 tr=0 ts=6943d7a2 cx=c_pps
 a=u8ACBDucoOS8YlAhSULG+Q==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8
 a=5IOWRsNVRSX8QqzWhv0A:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512180085

Hello Shenwei,


On 12/12/25 20:43, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 49 +++++++++++++++++
>   .../bindings/remoteproc/fsl,imx-rproc.yaml    | 54 +++++++++++++++++++
>   2 files changed, 103 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..b3e1a5dbf731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic GPIO driver over RPMSG
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - "#interrupt-cells"
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..fd8e5a61a459 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,33 @@ properties:
>         This property is to specify the resource id of the remote processor in SoC
>         which supports SCFW
>   
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      rpmsg-io-channel:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>   required:
>     - compatible
>   
> @@ -146,5 +173,32 @@ examples:
>                   &mu 3 1>;
>         memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>         syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpioa>;


"rpmsg_gpioa" seems not defined, or I missed something?

Regards,
Arnaud

> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpiob>;
> +          };
> +        };
> +      };
>       };
>   ...


