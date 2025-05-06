Return-Path: <linux-gpio+bounces-19650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24777AABBC1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798994C16BA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46AA230BFC;
	Tue,  6 May 2025 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TdAEkuoG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48A230BC0;
	Tue,  6 May 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516670; cv=fail; b=JAbyU7CO2PKCJnCN4xep9YwvGzrTqNYwmAMJ9UjkBq4yfPM0y1u+latGMCe2rb3hpLvYlaA4mK8+rflLkwsArJCQDFziugglmywIhQ1Itts3qeJRxj2chB4J8h5LUTcYcdfvFqEy00ACflrumz5JN+SfkvvmADomMHQIJl3Eoog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516670; c=relaxed/simple;
	bh=SiYpr1IiV692sp7+WLDyfcBoTeFuq7c4+pICM0cmYRQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FSph/HlPZ2F9+MaXQ+jTkb7Fmw//b4ayUzJAQ2xotjgxM1nRiIb63M0gQKM/6FbHed0kKzGaZApNTnXd70ChGguPb+1XzTWfv5Fji/K9v/WyBB0KPhFO3f9Eryswi5F6+SClB5M0jRumyGiN5zXEeUfmR9XV36u2k8Su7iNtiaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TdAEkuoG; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuK+nbFpNbU/0sf5aolXfAVCzt3o3YkcmrVHuDzxnmIRHfzDv13Q+JSdwAqycWmG1YToGIY80Q7RoC79SmIUCQdbsi0lMRikvaSS7kmxh6v4PbQ+l4w137k3zxpRKHe0G5Qf2mpgEVQ2V2QIz0qt1nVms7IG0qabEqhbYBA5vDhSsk+V1DPhHIu2+T3FB7qcwEfoueBI/AJKLP9YdE8eatKx+uHDEq6oa77mNoD7o9RCU4Drw4Jc66ohr072NIJ+T2ZK0NKD64ZdskcAVAG9hbL5IY8KF7enuqcJa1QXfxHjfFCAfoEZCApdYTa2T0O9GCJcAapI4CfrwTHgsu06CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GwiNjRkauf+g9wK3kl6jb+H+MMdtyvIU0ZYE4H994I=;
 b=OTdaWKRvtr2j4qdelCrDCNyTDe4ZkARZU7ov5nFCQ4lmWMBtoB3O5yfjPRPEVwRk1g8ya1i8CEhfyiKfbIkU0GKw6pKksL8Ns98F73tHhFPDf4sC0+AUJh8S7dDxEiN2mANzcGgx5gFVCJjuvBybfkG3Q3ThWMockJf9ugGXhet2F8WsKXzToHrYt3lc0Tn+c88Eo9s2X69sC6nhvpiDIlIeuTkbEwUk1pL1QGUBDCIxxxRutKTGeBtanJaJXW5QqrRfXddZ0JLpZBwlp0ysby2BDv1P3N/JAqSfWXNwrLi/yC6niYVi/tk0mQOFgYsGS3Xy03G6ZYR9PZUjN4XacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GwiNjRkauf+g9wK3kl6jb+H+MMdtyvIU0ZYE4H994I=;
 b=TdAEkuoGMpQ4j+xwh93YuISdaPqBXpDogdKuA0+sFX3ct5WrpV35FTu8NAEzNt/Bm8EcXTRY6fbgs2oVDJD2iBC5OJilN6uxRm9dUBhWTlwxr5NHMlLKybUZf+V81ogd12pQswMc/vKFK5YwKdvENG2c4n++en7V0NHBHUxhoPHldGjRTufyKRHMisF1OVWoEs+KOZ0Ot5JZUSHadjN9zFNNCmsXo6ApVuIecTqgDZocbkiImWay48OW69XVbacotDSWXWgaiQ4xk7uGXTJHdjd12DidPzuDWvKfKEl2P7IHqtrGOrDXj28gUruk9A+ulkLMk5N8wAf8aeliep4meA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:31 +0800
Subject: [PATCH v3 1/9] ASoC: codec: cs42l56: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-1-e9496db544c4@nxp.com>
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=1610;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lHVOilh0U/tNupnss1ERv93jU36t/w/roaBAh/Vlq9Q=;
 b=+fCxHDTcuFsI5q6NDCK0bxXkfestcWq+qXXhL3rotUk+q2Y4m3LdzI67pfm4bO1K97ycN3Sd9
 hlOrvMm1+YmCQTUUEddPLOKxXOUQctcAaUAGPIb61sFfilyDDjlIWEZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b55a0ba-dd0f-4ba7-5168-08dd8c6ff61d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R00vNmhtcWcrY1hvMWxEUmJ1bkJRUHczMjhIMFRPRHJLdUhUbENzVk1hTjk1?=
 =?utf-8?B?QnBRTDI1OG83WVl0bWNvU1BtWGw1bHZsWTlmem9Ja3pwSUdZSGlvdi8wRU9M?=
 =?utf-8?B?VkdhME9FNmw0am5FT1hHUHZhenhXVENGMXpCY0g2UTN1UEIwY3JCalBXOU43?=
 =?utf-8?B?TE0wNU1kdmIvbGh0RWZhNWozbXpXcVVnRU12cGt0KzE4MDNSNTVCMG1TOW5K?=
 =?utf-8?B?NlJENTJTcjQ2Ni9peWhzSTVmNkFLK0ROcElldXpSbVNibDJKeVY3aUZJdDE3?=
 =?utf-8?B?aVFZV2l3bXVqYnRzMXJSYzFUM0Z0a1UrVWJuY3pXRHZpajZWcmwzZDlHZ0th?=
 =?utf-8?B?QlA4blhJUFhQRkFvaE9LSVNMc1FpbmhESDk1YnREQ3AvTjBPeHpFalc2aHZ4?=
 =?utf-8?B?Z3J3djdiemVTQ1hRaDNWNWNzNGRaeDgzVWRqWng3Z2kvT3RXOEZOdE1qYmRD?=
 =?utf-8?B?MXJqdXJ5N3FoSG96MlFjd3RiUktMbzJ4UE9TS0lkalBRa2E3Wks3cVYxa1cy?=
 =?utf-8?B?bDhLUWhFTmdzWlRIbFRNeFR1eitFV2VvOEIvdGd2MzNEL3lYYlVuMUt5Wi9L?=
 =?utf-8?B?WmR3YUVGeldFbUlzd0NQWXA5dStsWE5nY3hpVXE2cTAzWDFuL0lCVTBzOFg1?=
 =?utf-8?B?MGt0dEdxaUpwMmtIUWhXdkk2S24zYWtFTDQ3VW40WVhkR3oySmkwUVFtWUgr?=
 =?utf-8?B?R0hlMGJXNHcxSVlpZVNTSk9uUGdsTU5tV0xmTHJaYmRjRy9Nb0w4OVh4bWRu?=
 =?utf-8?B?YlVSQ2hRNGQ1OXY4RFVibmJyeWhXbnFPc0NXYitoUkpjS2phV3FuZ2daeVhq?=
 =?utf-8?B?YzRSMGM4WDJURUV5OUtzVDBIL3lzTVVnZ2JrbGthSnJndFdFaU1TeGhpSXll?=
 =?utf-8?B?ZnlGTnZuLzloTHR4RHRVUmlzckloRGZEajBJbFZJV2ZOcW83cEViMmhudExE?=
 =?utf-8?B?NlAzbkZXTG9VbytiaTdCM0hkY2tTOXIrNjdVYW15Rk9tN0hLUUFDRm1mWmtV?=
 =?utf-8?B?OUN5VnNMMTdmN25zZ0JsRWxwcEdSMTlydmxjd09WWjlHaTVodnkvWldvZzBZ?=
 =?utf-8?B?KzRpZjFVcGNtT3VhU1FpaTVQOUtkeTkxTnJnRURQTVRycXB6d3BOT2Jrd3NO?=
 =?utf-8?B?aEVlSjVScVBJQ3RqZ3BsSmU3SmxCU1diT3F4WStEWmxpMmNSMCs4TjlBdkRT?=
 =?utf-8?B?b0QxUTBuczllQU5ZOGxwb21NdXROdmczeW41dEFPajVtaUlucElQOENBNU0x?=
 =?utf-8?B?UndvVTJ5eW9HdnlYV2JNam9ESG5lZzZYbUlYRGVrS3JNYXJHeGdWd3E2V1Nh?=
 =?utf-8?B?ZWNPbXBjakkrbjd1bHcvY3JWQktPdWI0Mzd3TVN1Si9LMVlib25Rbm11VjNv?=
 =?utf-8?B?SUQxSnFkbWkrSEU0eWdzOUp1QXNNYkVMT2xOR2F6RjlWVlVUNUtMNEgzK3hX?=
 =?utf-8?B?Q3Z1RDAzcE1pNGcwRmc4cEJqcldJM2JlcUZKZmJPcGtuMGxOUUlYYVhVVlRQ?=
 =?utf-8?B?SW93YjRuQi8wb0FOVnhFWE5Ub2h6T3ZwZUloWlFvM0UrNEw1TVJiUldVbXky?=
 =?utf-8?B?dVdYVkVjVUE1TEc1R1RsSDk1Mis0V2tvdHhocXM0ZFNCVDgvNHJSSmwybDBV?=
 =?utf-8?B?clN2VU1tUHNjbEFVd1A1by9zK3hBZnptcVZZUngzRFNxcWowU2VaNGJvYVVy?=
 =?utf-8?B?YXlDNjgxNWgvRTNVUzcyNk5WK1dEVzFsM0Q3Y01qUHVEc2JTbm1mdDFJUzRI?=
 =?utf-8?B?TjVHdUwrbFFmVUprK3hZcFAyMmZEMmdKdTI1RzVCWU01YXFYc0QyYWM1UWJk?=
 =?utf-8?B?L0ZOUDZMUHB2MGMvaWNUUDF0cjFGaHorYWx4RWhkcVFrZEpQdUI1RHRqeVRt?=
 =?utf-8?B?aGRqeG1BZWJDVEdZaXBZd0wwNFBhWHlJdmhodDUzaTJlc1hmWHRtVXVSSi9J?=
 =?utf-8?B?QWRUMWRWbEd4eW5XY1c4b3Jrby9HR2h4K3k4bDQ0ZU83REhYbEtGY3JlLzdS?=
 =?utf-8?B?aXF4WCtIRmtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1pvdHBKR0tNTGRjVDJIdmVHNm9nKzNGM1k3SnpPYWFyY1RkdXVhR3Uwakgr?=
 =?utf-8?B?amRzR0N0bllIbVAwd2xhTnlROVlCVmV0bDdzemp2WUtrVlFQc0cxNnJBelNw?=
 =?utf-8?B?cGdVYjhZYVdhMlRZNnczemVlSVJCM00rSkRBL2EzR01MR1dRNmRJbnBCV1JT?=
 =?utf-8?B?eW16T1pwN3dhYjYwczJCeWNYV284eTk0Q2VEdU16NFJsQXcwZ2RPalpYMDNx?=
 =?utf-8?B?MnVXeEhaUlZDTkRCUytmL1VXL2tkNHZDWHRvY0xvRXhnenhGUXJGYXBWd3ho?=
 =?utf-8?B?czBUTVljMWF5ZTZaWmV0QmR1Y0xibzhRMTNVN2RKNG9YQVlHMDZzZG91WHJ3?=
 =?utf-8?B?djlWRGNndFE3blVtdUd0dkQxSG9STE5UQzVZS0ZtandOU1ZjY0pGL2ZBVnJh?=
 =?utf-8?B?M2M3WHJoZUhHMmMvV3pjV2xncHgrcEJjMW5IdDZ0bXowdkM0QTlzT0ZDeG92?=
 =?utf-8?B?UzlvR2VpSlRUZTZMQi9ySDJNWEticFhUQTBhU3c1ZG5RY01udGdTMkk1R3ow?=
 =?utf-8?B?OSsxN1JuNWx1Q2cxcktBbEF6dGhQaTNZQXdneW5NQ0tqTllhSjR6d0tNNXVK?=
 =?utf-8?B?allSWWFNeVpYdE5mYmp5Mm5tQVZIclJoZ3I0MFh3M2YwTENYLzM4K0Q0SXJ1?=
 =?utf-8?B?NUpZWFhuSnFMVVhZVytNZlNQd2JRbmtoQkx6dGtoK1RHckwzZldROWhvVW9I?=
 =?utf-8?B?T2NDeGx6OW92NjNYZGVJSWhZSFJWUHNLdjBtNXRTOFBXOFBqclFWc3pQckVk?=
 =?utf-8?B?L24yZkNoK09TTDVIVnVQM0dCZU1XVTVyNWVRNWJKMTFWblFXOGhYdHppNDhu?=
 =?utf-8?B?bVUrM0hxNDhraWxDSno4WFZYa3dvUjBsK1RKTkNLL0ppc2FoT25rU3duZjMv?=
 =?utf-8?B?bGF1bnRISzdva09hd2dhL0ZqN3RpUlRaejh4dDhLcXE4NFpJUDJqY01TekNU?=
 =?utf-8?B?SWRZUVBvUDVNQ2prM0V1YXNUMEFtZ0EyVExkOGhyS0pJVU1Xc2RRZkptY0FV?=
 =?utf-8?B?VGYxMkJFZ0J3b0Y2eWNlNDlHem5oeDcrZW1pUldoTGVwRjh1dXdMN1dLQ3pr?=
 =?utf-8?B?ZnJlU0paTlZ6M3d2VG5LcTVtNlduYlpVRkZielpNVDZzUDQzREZudFhDRGZ2?=
 =?utf-8?B?Q3Q1ZW9kMlJ0dURuZnJOdGZTbEJXdzBDbGwwaVFxNXlvR1VOOUprY3dpZ1Fw?=
 =?utf-8?B?eXBGU0h6UXlNdWhHUGpyUHk2MTJmRjlZcWFBa2cxUU5DV2QvaEhyUldRVHVX?=
 =?utf-8?B?NVVnTHNKcjFBQWxXTkc5MGdhdk1yY3dmYVlQU3RRK0pFOHV6K1VxVVNnNCsy?=
 =?utf-8?B?S094MjQ1VjkyR01xempqTFd2WFhUeWFPS2JlV25pd2pMYWd3MEN0SXVWckE2?=
 =?utf-8?B?d21EWHBBRFEybFlEZ1AvcWIwbEtFRG5USGRDUVVTUEM4V1g5dkxHaHVSRm5B?=
 =?utf-8?B?dENaMEl2TWNBanVoZnMxbmNzTW1iaWVuakhqbm94YzdQYUtTbkx1Zm5IMzY0?=
 =?utf-8?B?UmdNcWVRK012SHE0ODQwSzN5ZU5IdHJLekV1clBYV3NER0lOZUFvV1ZmL21T?=
 =?utf-8?B?Vm94RnY1dmJKT09ycCtsVFpuZHVDNnNGVWJobDFGUGIxV1dxSW9abGh4S0J3?=
 =?utf-8?B?a0MrOStsbURwdTdjcG9SWi9aVE9FekJqcUpkT2Zoa0hDSXRmZnBoSjBsOXBm?=
 =?utf-8?B?RUdLeXBWMDJMN1B0Q0lwdEJZbHVUQ1BFZlpsQ1RuNEJ6UHJ1eGV2aTdlKzVC?=
 =?utf-8?B?dGtqS3hiK0Mya1EySEdmKytCdmRwMWdVd1FpNmxPeFV2THlja3ZSdDBXVzBm?=
 =?utf-8?B?eVFoUU5jSENldklHQTNXN3MrcnhaTkNwcEZlWkk1OS9VdlpnbzA4TjcxMjBr?=
 =?utf-8?B?ekhsbkUyWjBRQjBkd3NIVFhMNTlFbFM0Z2w3aGtrNUF5MlpSYmFUKzBxcHZu?=
 =?utf-8?B?VENDUHdTeXpWakh6WjZtTklyeHQ3ekNzOUdtaDNYT3RkWXpkQVpKNzZMQjBn?=
 =?utf-8?B?eDhmM2kxeXd3RDdwMTcwbzE5RjFkT1ZHNm5JRWZBTFhCVDRLTW51QldTZkZR?=
 =?utf-8?B?aEVVVU83M1B6dnhkRVJrV3RJNThqK29RTFJLZVRPN2orNDhaY2QzZUVOL2Q2?=
 =?utf-8?Q?Ivygjch207y57uCqMODTVIIAN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b55a0ba-dd0f-4ba7-5168-08dd8c6ff61d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:05.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTjlABUHwi/xa6VgOZsDsp4NY1maNpDxWAqqxYcpnLiQhw4TXxgeRTFxfJv5UEjDoc9exGuy3YStOOH9QHl/+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l56.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index aaf90c8b7339dc7d9fa469048a56f38dca1797cd..0201206518cd9ea8ecfb823a96fb59cae37c36f4 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -7,29 +7,29 @@
  * Author: Brian Austin <brian.austin@cirrus.com>
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/pm.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/core.h>
+#include <sound/cs42l56.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l56.h>
 #include "cs42l56.h"
 
 #define CS42L56_NUM_SUPPLIES 3

-- 
2.37.1


