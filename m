Return-Path: <linux-gpio+bounces-19366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F4A9E614
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39D1A7A84D0
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441D158553;
	Mon, 28 Apr 2025 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XnS1hhKU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CC2BD04;
	Mon, 28 Apr 2025 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806238; cv=fail; b=coRXWnRb3Y6m7aSgIDPYR3UNLg+nOW5KuLmvKS1Kf2LO0LOaaVxUAdN4jiBN24/cBMwwbhY1bt4ivdV3325vMT0TUVcxshjXe5ltk1k78GSRDaESvdEY6dtpLJpEsMrWVcm67X3K1gD+eqo6Pepxg1izX6VJ9qN8nRHEYJ1CD4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806238; c=relaxed/simple;
	bh=SiYpr1IiV692sp7+WLDyfcBoTeFuq7c4+pICM0cmYRQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kBh5xExob7MqD/C/1OOrRS6d65pEeMrsXpueNkdCl6s3GOPwE9kNWDRmE7WCtWrRH+Wi7G/oB1iKPAvg48a3t10OXnXN/cDeR+F5hoDtfQZd7XLBOR665k4w+jgCk6jrbLPkK3fDn3EtsfCLcofgD0rpNUalLDypXvhUVgMVKCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XnS1hhKU; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFvAkUZnB3SfgJ9GvC4uvoX/2+PHcySp+3kwTr3Jj8Wa0J197w1yIfJLHw3FipqMzkEyastqHdb9GqjBeq9pJ4ZQ1mcUDXQPeE+hEeFk8JdbCPiS5hNgfnLZ/v4GesHHDuvfDvSXa1wcLdJG+W1aSxkWHdWjif94wVe96qM0vLQYIiiB157D30ela347TmQZ5sxmLifeBT6vvpbGydYAQf/YRWeBz224ZBzbIhqsOWKBYUk2LhcRMMhCMdNyKuGADuJETqzxvLJxfjCBJHK1kyK6knTzhktlpT2rSQNVIBaDqYarKWzJDHQbdafFudtRf5rDAPnhEd9PT4xmr5Z/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GwiNjRkauf+g9wK3kl6jb+H+MMdtyvIU0ZYE4H994I=;
 b=g+0tkVW/uWv+XPmWlJ43g9SqumcBu+JMvaf2hrb7PTPerbAq9BYrECS6hUz3Jw9DVHJY3V0mrocgFMyZwjwjs6d8SqJVlPU/yM9KAA+EY5k3+HmF3NaYwA0mFgAvpqDgvXT6TmmTfllUBZRrAfwKdP/banuGCbW828Ua0xhqo485q5bnercVH6bpBwQkp0M8bt8rADqZegzwwyRitgpW1/jURYLVcwMviNPnE5dktMXDuPePU/ik7oF5kgPCixGRWcLP2fmRjX6Ldd+33EbIUKl/OEQFnKbf3LNo67Ccd7YgPzw//1lyY4zpO4P8Hv7y6FsQteU6jaWzmVpKrCuycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GwiNjRkauf+g9wK3kl6jb+H+MMdtyvIU0ZYE4H994I=;
 b=XnS1hhKUflW1P5/JTsjSLl9+dOAuYYfE8Zk2SsIqBgkOZv64tVdCxwnheNmxp/4BuByfCQfRpgV/xmO8vDZzve4yKrym4J3qRNmythwyWVO0Aa8QT7gIzMJuNnyYp9V8W/DiRL/NnTFIrEIdqSj140UYY1pxutUztAR4KgbPIek6WwsKplbXlUZed9suQ341VpdYkwfsglfPpBy7SPVpFQB/7/HvW5HZBGChEu5BaeW/igpqZrC3bzmilnkWu+OvG4cPReRQh36I5ncp3etr/hJgyEp1XIGKmptaXggJK8396nl9219Frd9FuGCkBI7KPe9fF5m7asg3zvrMbwZfFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:02 +0800
Subject: [PATCH v2 1/9] ASoC: codec: cs42l56: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-1-e8056313968f@nxp.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=1610;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lHVOilh0U/tNupnss1ERv93jU36t/w/roaBAh/Vlq9Q=;
 b=CDGOzT4gUAhi8Lz3FKaKM8WnPtLmMfz9O4ov96/NoCZBZ3iEXO2Eeuc4BCNZma0szMOhShli8
 zh3Li+fhLwcBcJ26STQTjDJ4Cd0JSpcWJlFUvMUTbjJw+xBwKyQTNKj
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb55d2a-ebc3-473a-d3f3-08dd85f9da9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anFjNXFJRk1oK1E4Q2ZZM2tUcXdIb29KeTc2elN3alBKNkxYUHM1bWxXbS9i?=
 =?utf-8?B?cnRMMnBqSEdkbHFPcXRuSVg5UmhzWmFaZ1Z6TkNBeUxJRk9NTzZldEJDellB?=
 =?utf-8?B?M1ZqU3I3eFdOemNac0cwZFpPNUl4M3JPTDgzbFZ5enhsRlpzMmx1cG1qUkk5?=
 =?utf-8?B?ZVpqUWZsNDJuMkpZTzRUNkZGa3NMWUtGQjIwY09namVCWW1qOHZLQzExMTVx?=
 =?utf-8?B?bGF0UUZmNVhDSGhGLyt2Tm13SFZaUDliQ2cxS2ZNNEYzc2hxWm0vUStRd09S?=
 =?utf-8?B?czY0STlrR2JsRkYxQXRWbTdLeFJDMS9udHJhNWhPMVFBRXRLbEQ3ZmkxbGto?=
 =?utf-8?B?TU5tb3FsQnRoWGh1TDQ1V0x3Q3ZLMU04U2xzM0E1cUhESjRyc214NWdCRFg0?=
 =?utf-8?B?T2pUWTJLRmRsNjg1bXZyaHlUWkxPQk82WmxEZXBLTTJ1cmlUOElhTTFuaDYw?=
 =?utf-8?B?THdzRHJLK3FmZEFnWDVpQ0NQR1ljQTdkd3Z5Nis4eDNUZ3dveEV6Y3dMcXhw?=
 =?utf-8?B?OWFTc3IxQUMvbTV1dlVWVVRsanpITjNxeVQraVRPd01lbVBacFZUbW1XZFRT?=
 =?utf-8?B?bkZXZWRNYjFjNDZvc1N3clN4WXk0S2dJZ1EwckFYMHdWTno2S3FqVDJmdTVk?=
 =?utf-8?B?TFNHc1g1WGwybW9BYkZTeDh1NHBiR3dFN1djSkV3YUtpalZ6QnNSRUZ6QWds?=
 =?utf-8?B?Yyt6UXY3alVlT0svalJUaXZibFlrT0hYcGcwTHR6Qm1NN2RMMjkrZktqaVU2?=
 =?utf-8?B?dHdtajJ5Wm9EMUNmY0pGWGJOS3EwK3E3VWJiK2x5QW12WVVvOFFXVmI3ak5O?=
 =?utf-8?B?Wml6UFVTZlpWc0NVQ1ZiVXlUUzFNUG5tWitMK3BwMVNqbnYxZGo0SVU0Vnh0?=
 =?utf-8?B?Sk1nd052aXRzWnkvamxSejNVS282SFB6bU8zTk9ZbzloKzRwNTRHempSejAx?=
 =?utf-8?B?YXU3eHA0ajF5eUs3dTFqWkNnelBTcVBzQXQ4Mlg0dmplWU5sd3Y3cmxKUXhK?=
 =?utf-8?B?cVduc2pwY3QrcmNpSCttSmtwQzFUN2tIRkptTSs2RHBNZXNnL0ZEN2c4Tk53?=
 =?utf-8?B?dEtpelE1RXNtZWRHQm9NQjhjK3lFNFVsL0ZzVWFEbDh1UlR5YWNsbEltTDZB?=
 =?utf-8?B?aytGSTNkTmc4Wm81RkZhQVY3OVRWTldyRjExYUtQdUI4QjZEWWNlMTJGUklr?=
 =?utf-8?B?NjY0ZHV5RkNCUTZ3cXYyWXd6VkhWcEo1ZlBQYzBFQkhJaFBvUGVCMEovcTF2?=
 =?utf-8?B?elN4YTFBMXdTWE14b0ROc1F6TitoRU1QeTVvM0U4enFDd0RTU3VlWXdNRTdB?=
 =?utf-8?B?bG05SUFQSndSRG0vc1RicjJRYWtPY3QzN3E3dXlaOW15UDZaVzhHbzM5Qnpl?=
 =?utf-8?B?UkNjb3hBUDY0ZzFwUTQxWHAzWXNYTlpBcEdpS2FaeU5Qdk5GTkhoN0dDR3hS?=
 =?utf-8?B?UUY5UGNJNXFkQmVkK2YzS1NKa3B5eXcxQ1hsQ0M1RG5vTGMxM2FNaXJYKzcr?=
 =?utf-8?B?S0dCVFpRMG1oMGhvdHVjNHl0VEgra3Zpd1J2LzdIYlhaMDVBb0tITlZpZENt?=
 =?utf-8?B?L3dBOTQzM2J3STN2dHNtcHN0TW1XbDBPUUx1T3BtTzljeVpPbW5Td2FUenla?=
 =?utf-8?B?QnEwNW10R2RySCtic05IZFBxLzZBUDB2UU9oejU4VFVJOGx0aE5TeHdSM05w?=
 =?utf-8?B?bVZmSUR6UzYzUUJmZkJDM3JxMURzTmFsZ3krTUdGUlEydEFYWXZ4aDJKWDVV?=
 =?utf-8?B?OHJtRXFKQTdydUtvYlRETU9DaUF5T2p0a2xTMFZXNUdkRHhxanNUQ0ZTQVpi?=
 =?utf-8?B?Nm8rbWVEajlhYWFvYWJLaEJjWGhHQUl5NEpUOGFjay9YQ0tzQUhIMHhEYVFH?=
 =?utf-8?B?UWFvZ1dJakNKRmIyWDJCVmJWczJoeTZiL0ZZYW51a2pad215cTJCUVU5QVFW?=
 =?utf-8?B?NEhsMktXZmppUmx0d0ZhYnFNdklaYW9mK1QreWlzYWo0TnovNzlNVmlibDFO?=
 =?utf-8?B?TG9XRlRYQVV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFR6YUs1cTJMenlJdkN4RVEwL2doRHBIK2pYcGNmd1JWYThGejNFUnlPOTl4?=
 =?utf-8?B?YXRHNTk3N1lRcFhia1J4elJ5dFR6ZUxhQ3RwcmM3VkZ1ZzFYN0hTeW83YVFv?=
 =?utf-8?B?bUc3WXg3cVRuZnlKK2l2cVdEeWVHNDVVNXFId3ZxdzFvVVVtMSttRjZxYy9D?=
 =?utf-8?B?UW1NVU5kVWhQd0lNU2ttNE1YS09GeWlCc0JGU1VBMU5TanZRVFAybjF4K2RV?=
 =?utf-8?B?UkJLQTVTdHNTMGNpemZjMHlrNGtZNk1HS0lGZ0RFcUhxbXo0NmZJVDFWTUcz?=
 =?utf-8?B?SGpQbTJ1OUtuV0lmNVBpUmppaXJDakZYRzdrUUJIWVUvUjNwVURTbGdyaVc5?=
 =?utf-8?B?QWc4NG1JMUEzRWFCblE1aWQzaG9vbzhTaEJoSHdQUVlyM1d1WkE0RUc0TG41?=
 =?utf-8?B?S1NrVER6aStzL2J4TXVIbGxrbXMySVNUMVdTZ0RJNFo5S01kQ1dxV0FQaU55?=
 =?utf-8?B?UEZYWldhdEh2QkhPeEdnY1RDRXpiai9rdFI0K3hXSjliZk1mbDRtalBsaDJw?=
 =?utf-8?B?MkpCOWVJUUVzVnp3NW80eFF3UFcxUGlFMXQzbW1nbXNXeHpNcWwvdW5NWXpn?=
 =?utf-8?B?QW5RVHkwdW1LOEd5eWpFR1BxNDk5WjJWTmFWWGdNM1I0WitRNExobHNhSDJG?=
 =?utf-8?B?L1hrdDI3YytpKzR6dTRQWlRZYmY1a2JERFJvTGU5QXVHdlVvZ3hKc3E4M2dO?=
 =?utf-8?B?SWJsaytMY2QxRDR4RytaWDFMajVMa0d2R2JvUXc3bFkreFBsRVpuWVpNT3RR?=
 =?utf-8?B?RTRnUXJhbWE5MjJMR0FDbWN3YUh4N0RoQjVlaS80bURta0tMNG9nQ1FmMGhj?=
 =?utf-8?B?VFFwNW1vRnNBR3V4MkJHbHBRZlRzTmpWTC9kd00valpXZm9aUkFSS3dyaklj?=
 =?utf-8?B?NmdMc3Z2SU5tc2FlQ2s2dVFERGRLMVArbHRUbkhLVTFNdC96eDcxdW1uTWVO?=
 =?utf-8?B?c20vYWg3dTFQaURCemsrL2UrUDMxUU1Lck1lODBnVTJrZE80Y0cxUmk1VXJk?=
 =?utf-8?B?M1J0Yk40L3IwNS95OGlkNXkrVmU5M2VTU2dEdWRDYktxNFdsL1cyZStveWZK?=
 =?utf-8?B?Q2huVVNqb0dsVnlsSXByekZBeFkxU1pQUDZUUXlCcTI1cUdyc1paVFZGY3U1?=
 =?utf-8?B?QXNFcUoxNVVhbUFQa0tTV1JwV21jbS93eUdmRmFNK2QwSGcvbEQyOW80Rklm?=
 =?utf-8?B?bEJNK2NXbEFScmYxYTNBNGlYbUY3bWlUQ3RqUnp5aU1VSXBKRXp1L1M1NFhD?=
 =?utf-8?B?K1hkWDQzMllDZTIyRytoaXBxb2xWZnJzWDQyOGZHTjZseFQ1UVdBM2NhdmJs?=
 =?utf-8?B?UlRsdFhZaHJ2M3FVelBONnJkSHEyVnQyODBUMURSSlBpU0VYZUE4aWdxNDVI?=
 =?utf-8?B?anRPdmJSNVpHNkxTT1BIREFDRFN0QTFiUUdWbGt3dXNnVzU3YmM1d2I0WDZX?=
 =?utf-8?B?N3JHS3dzZWtpTWZWODdOZ2VGV0hOSzNlMXdFa21Pa0JOWS9mL1M2Rm81a09Y?=
 =?utf-8?B?R0pYS3Fhckg3aDdra0FITFZyYStUSElGVTBaaGRua2doRjFEUzY1NThtdGEx?=
 =?utf-8?B?S2JCaGFncHZOd05RR1JaSlNoL2dCeW1BS0hZWjRBUm9iN1VKRXczUWpXMUVH?=
 =?utf-8?B?bGlpQUpaZUpFZ2U2azlsOVJOWTBtWjVCa2poRnRIZVJUODB5eW5MZHlzaWtw?=
 =?utf-8?B?M21tb21pd0UrcFFCZXcxaW5UWlpaWGVDdUNzRjE3UGpsaFNzSHA5bXc0QU9w?=
 =?utf-8?B?V0pudS95SGI1b0ZVQy9PQllkZ2pXNEZNbWpsOW5saFFDUVB2UkNNcVVrejAw?=
 =?utf-8?B?OFZHdmxSUWZCVVdPSlJWQ2VhWG41b0lBb3g3c1FCaXJ4WmxYYzd6S2FpTGlU?=
 =?utf-8?B?dXVaSlpRcysvVkNsRWM5SytvTGJNcHI5eTZYbEVSSjZ6RUNDKytLMHNBU2N2?=
 =?utf-8?B?aVpjOTE1dTdwNThYeWlLdHdEd1VkblhSMTFyM3VJVVMzUVlHdjcyUmpaTTZ3?=
 =?utf-8?B?dEI2S0pHVVpkNnNyc05ndmQ1Q3pMbndseXpOL3J5T2wrSXhTa1hCMGhTWEJr?=
 =?utf-8?B?UFFIelJBRk5Rak5nL3hZWXkwRXd4clJYb1pHT2gzMzJHdUtwMmtlVmZGRGJY?=
 =?utf-8?Q?yyOHDwibarPHdlSH1CyeI9uoT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb55d2a-ebc3-473a-d3f3-08dd85f9da9a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:31.8883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX4t+LZ6U0xZTa5k7lnamxPRkULbLPM2gCRCXyFUuyxwbnWQiVqjnuUh7owvfw4eQPwttcfmrSrtCC2W0h5oww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

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


