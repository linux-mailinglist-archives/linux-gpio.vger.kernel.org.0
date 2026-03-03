Return-Path: <linux-gpio+bounces-32414-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP8NO1bkpmnGYwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32414-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:38:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AF1F065D
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1199C306BCFE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 13:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FDA42846A;
	Tue,  3 Mar 2026 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dfhFEIOX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAC345CD3;
	Tue,  3 Mar 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544526; cv=fail; b=Y0KIB5UmRHY/orwFdZjUt+VEXNwa9rNjR4/S8X+70KbxDs8fVVIZpQG4/805Z+12xw/6maQiXuEfRGYH8fKKnDOLS1BxKLfnwQsoZJ/vDgKalurXBa+B4WjKv20/43wkV928iZ2+4NOZ2xyT84xfuOWdtnOsC+z3vj02j3b5spU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544526; c=relaxed/simple;
	bh=ja/gXrTR+tCeZPugtvLmbDyAhvkEmTap+XiVGirts6E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qsAB3OBb+GYoSDOvc668LIkNwd8d/mwOEc6mE9swIfh7gDdIOMIqUKD6NfRMjEd0vGdmKasKCISbWTP+rTUQz1zaGWc4CZcK/NkLlA2eJCMSzwAGt/tJgOkKZ7rLJ8CMVXo5T90cw6Z/4Yw+t7uQu6mU7DWY4xujlj6RMn2Ycl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dfhFEIOX; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJZDsRV3hJks4kWkx/zaJXG7S/c4I5Enm1iXy8OGIs6vFTiDJq8kxGn1i33UFshT86vvO4SHd5S0nlJiLTo0krYtnETHm51KOHdlFWguVAphJ8JpWXg6/Au/oGn8ywcof7ISUFLXxTaUedXrhwDvWB+j0akB5xgR3ohQYkPIHNgrE5zqN5b9tDn3+2LqeZXd7G7jGK2PVoNH81TraRDZ7svvRgbOV/m2fQmwKN6BxHlcWWLYZ6GmqYbimZhynQ9qLPKUmouyFr4Lp3rEJpyvooGurJyPdAQGMem0RFGcW2/VeBOOAHqEicbZ4r9bnpnWvV2BCzUX/uLeGKH/BCIiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iwPEMpRirm7pIit9/49c42AHreC0mLnTl1pBAVKMp8=;
 b=aVTXmNSrU7T/g7gJOjky3DWAdArYCiI+RBAJkNzJgJ6ROCh2IaiGAuXleUjGW8DaqDsUxfE+72uvG1wei8PPO0kiGVkTZz5dn7cvixNJq6GvfeQdCjKr5o0LiB2sui1HH+TYLQ3P7LdGCp1ZoyNBb7r0tkBLdaII2r+DcNwWvPHDMtcmBFOM6iPSHKFOjmE52D7ZwXQy9TD773TtfHVrrb9RPRsWVKpaqCm4gSHe825CsNC67sYW3Fd3lYyOP83v5X1SNDGAU4j/h/Kt8THSo1tBzwpyaOTHKVN1kgzGmsNrNIQ3tlRbtWAzTVrGITrQdCwlR/gwxANwpNnpxqXAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iwPEMpRirm7pIit9/49c42AHreC0mLnTl1pBAVKMp8=;
 b=dfhFEIOXtRwT20QDS8E0to6kL06FurhF7VJuQC7eVG88EJvlIwreAzEKn6Na6o2exryo4vCBjMV2cYA/JVK/Fwc7s9vOkG43QT7s4ag09XK586iQPUX7LS2Fn6aAdCDqUEHW18AM2E5ULn6n+T0XZ9Jn96YUtvfQ+xJEJbtCFXPR2m6WtBxE5qdNcpG9yLY2XH2DeDCD86FUvnm8pX7n7oDpSOCFGqjYumF25oaJkq60LCYrFW6EpejAPTZZ1vWg13n2slbLDNGrJFxIguF1kyi68iRUWVX8nsySWEc9YmUvFKawO3nwKToC535MdtTz/88EBTazXFqEFH7QyEh69g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19) by DU4PR04MB11771.eurprd04.prod.outlook.com
 (2603:10a6:10:624::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:28:39 +0000
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891]) by GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891%5]) with mapi id 15.20.9654.013; Tue, 3 Mar 2026
 13:28:39 +0000
Message-ID: <fca0541b-0b05-4231-98da-06027aefd9c0@oss.nxp.com>
Date: Tue, 3 Mar 2026 15:28:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0059.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::26) To GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV4PR04MB11308:EE_|DU4PR04MB11771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5684db-14a7-4732-0f79-08de7928c7ed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	mt9H15WXygaQ2YVRpx5ch+EnTeBzTAZcMdS2rJYN3YjwL7vpemuekkq1+bkc+3kekWRu8kbUPD9n7ze+btv6zbeXZOYmpO4e+I/1alrIvXQu27PhL5hidp9Z80244Oo1fsui9WlHgWMks913tYoasjpbVQMpdxst9EO1yAtydGi9XX2sOUiPii7NzmKmgxJD4D8UkqdZfHDvLl50g21ZgyjNdhUD29t+8e9jhUQYX8Wx1ggMwPX29Js30uXgi+8HEFMWXmLEzS7s7G9FWMRBNLQEN2pkV+CtJXy1dJm+cjPko8npIYB63+dzfwTDVnt9SPGw0PGWBe8hHbvzS08BBleHQGOK8Y950kshQOwhEs0ywxrHcAr2OGWQ97PAvA3OWsUuFO3LlSa1l4BQQd8mivEjnsNKxchh2BkPH1x/HevZ7AuAVg2kI/W5TmKiNO3oFm0Pi+UhARecEHlXLMdav8ziIoCF/EgjhzFRFFgbP/HEDh06/Ge65cnbQ9dxr0ymrNyCeparImU3pLqkPRlXMdVw1LLxNEaqYuKANYovnndcRPWwhDfM3lM0eDVrG7CensLLVj/St1AqTj7a4hhYwYKZJUu1TmjzGMgZ93c2a8o2Yw3vv1WHyAR5VzaMLqLqNpBF/B/SWEBCnwOGHKXvBCGTLrkrsfqtk2hjQMRSyxteheCmr3R2UMp2jvk6g8kx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR04MB11308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXl5dUhoVEhlWmVmMEdIUjMydTVzRWxQcTdPcjREMHpxR0R0aFBERnEvR0d1?=
 =?utf-8?B?WkpldGNBTEwxQVBmTHVjSE9EbGNsWWRLNGRMaW1kZXhUblFHZEViMjVOOHRT?=
 =?utf-8?B?SmRjS0Z3dWMvcVhpa1pSNFA5TzArWFo5Z200WUl0eGJaeTZaa1A0TEwvNXRm?=
 =?utf-8?B?eUphbjlGTndRK1NYYkFhcTJPT1cyNWhHREswOCsrdURDRXN0UlRWdWhnTEsx?=
 =?utf-8?B?WlJJdWQ5TWhXeXBCRWxXMExteHR3UVhqNU1SUk9sUjMrQUZRVDMrVkVvc0Zo?=
 =?utf-8?B?eXpHZUVpREVnY2JtUWJRRjhMMFpaRUhyL2NFT3VWM0dyN3JIMCtwSHdTaUVs?=
 =?utf-8?B?YjFwSWpJak5pN0tQbjU4aC9LdWprbkc1NW9RZkVrUHR2UFh6U0N2RGZ1S3Fn?=
 =?utf-8?B?S0xGY0k3SjhzZ2ZrbTBUZHhVRjBNTWxLS3NnSTAzeUFIaHR2SitVUnRwdGVr?=
 =?utf-8?B?UGx0T3c2cURMdUt3QmNKNFhWQ3lRR3BhRWthM1RZekt5R1VtdVQwaGd6Zjhk?=
 =?utf-8?B?c2h1U1dkQTdnVXZneFlUbXRVUWQzUXJuMXJUT2tuU2NEbkMyeEdWY3lhSnYv?=
 =?utf-8?B?L1BDQ0lhdVNMVGJ0eS9janhSVmZTN0ZVTlNodkpMckR2MU81QTdqc1RxV2Vl?=
 =?utf-8?B?c29HdDc2dDJFNWJEN2Y5bXIvS3FLcXpoYnNva1lSZFBiRHNXRXNLMVZBQUJH?=
 =?utf-8?B?eHh5cjkvR0ZHWVpwNWYwSHZ0YUI0cmwrdDArdFNxNWN3Tk4vN0dwQ1lLOHgz?=
 =?utf-8?B?dEtWWlpoWXQvdHRWbmNjMUYrOVByZGZUZ0xxV2wwODd3cjYrYW1Qc1VlVWdR?=
 =?utf-8?B?RWhMTVZtSkRrdFA5Ym9UUmZYc0l3YStRS3RTM0VjR0lnRDd0RjJOaDRMRnQ1?=
 =?utf-8?B?eEdOZTZpYVpVUFgxMmNnMHBYTThqZCtWWlhvaDZvbUR4NXJadFZNRE4rNDFQ?=
 =?utf-8?B?L0dPb0wzekxxeldOQ1QwenF3cEhob2lBbk1hRmF1UGJsdGduN29iNXBSR2FI?=
 =?utf-8?B?OW1yUzlLK0lub09jRmZnREhDeEM1Yk9lRVQxTzA1d1hBd1VTWjFBZlhTem5i?=
 =?utf-8?B?N1dhaC9oeWVpUmlqYUMzTVYxUDVVZTJmd2d5Nm1lYkZZTXVqSGRodzMrQ3hp?=
 =?utf-8?B?aFk4UUI4OEtibWViYkxVRHpoUkdOYTU4NEltTG1ybjJLWUphQkJjcUFWUzFs?=
 =?utf-8?B?bm9pWXhGVmpuSFNxZWVvZmpPMFZuSzVmdWpveGZLQ01vNGp1Q1BNSjFZcGda?=
 =?utf-8?B?WUp4TUp1Ry9LZE85WVYxa0pNdnZGT1pPejFXaEJDRU53YmdMcnNpeWRaZHJG?=
 =?utf-8?B?ZGFsUDQ2eEg1bXl3VVJaOXd4d3dlSGJIZ1krNmdiMmIrczljdXZoZlN5YlNL?=
 =?utf-8?B?MUxycm5SKzUxd3lrVGNYUktkZVk0dFZRSFYzSjJpNk9EaXliYUhUK1F5NHpH?=
 =?utf-8?B?Nnl2ZU9UeDRQZ3FTMlp3bUhmazBIZE1Pa0RmU1RWRzAvaUJoWE1EWktTSDFq?=
 =?utf-8?B?VS90NDN2a0E3bkpoc0ZocjE0Y2lyc25nZnMyN2pjS1JFTXlyVXZaQ29xenJ3?=
 =?utf-8?B?cW5NQXU3OGdxN3lLcXR4Zk5hVklLUlVGTXRBR0pNZ2gzQnByMXZURm1Tb3cr?=
 =?utf-8?B?WjNwbldLV2tEZFBWRXhLemlZL2I5U0JPSzA2Q3czMkQvcEhKMklabFNIQnBE?=
 =?utf-8?B?dThHSkE4L01RT0NzNUw4VGhIVCtpYTE4eWhoeFBlVDA5UThHc25DcEtDbm1C?=
 =?utf-8?B?ZitYeGZiVzQ0NDlxYWl5a2UxOFI0cWp5a3M2dTJPMFdLUWg0NnNpVVBDYUxw?=
 =?utf-8?B?dVlUUDl6Zm9UZ09wR1BTeUMvYys5bllBc0lLUGI2YWtWb2NqMkgzcDNSSk1Y?=
 =?utf-8?B?V1dTTXhVSVRXeXlvRlc2a0RpWHdFNjBFSTdzR1c4SkhaeTBCVkhhV1ZtZDRs?=
 =?utf-8?B?OEdaalVTS3IxOXhBcFc3Z1g3dVRSY3pYTG9zSzdGcmRQdkxwLys5NTdTMi91?=
 =?utf-8?B?eW1tTnI5MXpKRFNuVlR2TVNPU3NpR0EzOVkySEdHZ3czTS8wNTBzT092eHZK?=
 =?utf-8?B?dmROb3FDUmxic0ZBN0pWOGcvT2NBaVVaQ0crQjlDaXVpVEwwYjhwWEdzemhQ?=
 =?utf-8?B?b3IwRW83R1NITWNNdGlUMVNoeTg4SHVDSUk4V2szVGk4ZUJ1bkxOb0lnbGx2?=
 =?utf-8?B?eGVrb2dKMmpMNXlYbUF0aGM2MUF4RytlNjBXbS8xVTFoWFFsU0V1UG9CSThF?=
 =?utf-8?B?d2RMMUhXS3Y3cmk4YWd2dGZ6S3hlVzBlVnFBNDVqbUtVNlEybkF3ajJZMzJx?=
 =?utf-8?B?SDJpRmgzcTU2NUVmZ0djc09zQ2pVU0FneWpmLzFTa001aWV1dFcwZTNkVnFB?=
 =?utf-8?Q?avszBtVmIh3LOOx4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5684db-14a7-4732-0f79-08de7928c7ed
X-MS-Exchange-CrossTenant-AuthSource: GV4PR04MB11308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:28:39.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obgc1PecZMB7je7UeSj++/s+JqQrNCOAEWD3dF47MDZ59H8wGj1M47mexwYwky6/E/n8KhpYKHIQ5Iu6vILMXE28j6CRGBxL/yOiBvof3FY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11771
X-Rspamd-Queue-Id: 035AF1F065D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32414-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ghennadi.procopciuc@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.nxp.com:mid]
X-Rspamd-Action: no action

Hi Krzysztof & Arnd,

On 2/25/2026 11:40 AM, Ghennadi Procopciuc wrote:

[ ...]

> Hi Krzysztof & Arnd,
> 
> I still believe that nvmem is a suitable and accurate mechanism for
> describing SoC‑specific identification information, as originally
> proposed in [0], assuming the necessary adjustments are made.
> 
> More specifically, instead of modeling software-defined cells, the nvmem
> layout would describe the actual hardware registers backing this
> information. One advantage of this approach is that consumer nodes (for
> example PCIe, Ethernet, or other IPs that need SoC identification data)
> can reference these registers using the standard nvmem-cells /
> nvmem-cell-names mechanism, without introducing custom, per-subsystem
> bindings.
> 
> Looking at the nvmem binding documentation [1], it appears that
> individual fields of identification registers (similar to MIDR) could,
> in principle, be exposed using a bits property, for example:
> 
> family_letter@4009c004 {
>   reg = <0x4009c004 0x4>;
>   bits = <31 26>;
> };
> 
> That said, an alternative (and arguably more common) approach is to
> expose entire registers as fixed-layout cells, and let consumers decode
> bitfields in software. Below is an example of how this would look when
> embedded in the existing SIUL2 node, without relying on per-field bits
> properties:
> 

[...]

> [0]
> https://lore.kernel.org/all/20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com/
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/nvmem/nvmem.yaml#n82
> 

Are you comfortable with this proposal?

I'm asking because it was initially considered a viable option, but the
discussion later shifted to the fact that the nvmem cells were
fabricated and did not accurately describe the underlying hardware.

-- 
Regards,
Ghennadi

