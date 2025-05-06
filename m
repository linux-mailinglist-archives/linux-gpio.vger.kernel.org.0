Return-Path: <linux-gpio+bounces-19653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E93AABC05
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62261C06DE1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9A42367B4;
	Tue,  6 May 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZWHeOdGr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73223496F;
	Tue,  6 May 2025 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516683; cv=fail; b=uMXJKo9xlmr/reTpny34VAdMN4yeXZvSEttJ6P+Kbh4ANk1rkpGv7sly4B9t6+rBsAQQ6ss1fd9vbV2hLe8VkpSY0YYL30DMlgJlaW6jRuqHyMbxNmtSuqn+sWrl6W9cX6WluPsQeKVEtiQjCLYDx19g+niRmFB4Z3/kXdCTX9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516683; c=relaxed/simple;
	bh=S7pWC06CgHTERGLLyR9oZMEHCgLuC8Od3W6nbjYt6IA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g9xtkAt+eXCSs3bhJl5vVOUoRobcpZ3udqc2LhZLjUUrF+VCHJbwGm9ehdSYk3Wyt2Aif6dDOj3kgtBjrH+7nAC7j9JIiz+ZNOUOb089wyLM4FeOGw6mFtcd+s5HqWoncg9wbjzgGoefqdj8sd/wlIuFrcaAwQe6Pg5cBomQhtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZWHeOdGr; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfw809eOXN9KKmYGx8j7xORUv+jV+hhCoT7XiUm6fgcwdwabTxMqma9xHdayaO4sk8VIP4z6flS/2G3MmP21FqfrFgTD4gZeoHMTk8Bb4UQDih6EfXWEV9ip+eiWoG5FTcwuTPT4PXbgLUqWsNh/o0gCH1SqIoy7D4Zkw85y+eK4M3UPwdlqwP9y/3B7lfZbTvjWkJE950gKFjUPQGSQPHTkOo0EoV5D2k1ScqBDoMQlVKZOei+MB+LlbUCDDGy6znFepv8HTnbeaJQWYyb6zQvdqBav3GTKX96qIFH0o1qKyDdVHqP4eEv5W1cVyTeCkzBV6lvxghU4BNPCbbnUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyWJKZNAr7h8m8h5VonmErKx9wkO/meruzrMYnS5gA8=;
 b=BHSyVNkgw9GI3KVC74OpR1Zc42WUNH6OKl3+SgKsMwiUUOyy4iB7POPi1p84gEyAlxmMw4qFpVvq1FwT8dEPZY0Uai4kBTUJEI40BtK/BrYeNBpqY19KV5T7ZjB0S/tTe0yGLIK+VrGoXjjhYvDerIEulMmpguRNI58TgSqySKXGkf9HIpPKo4rW8861Hfs56fjbwJmtOa3oWfiBZORbOhOC/mq/Iq616C7AlOqM96rHE5Ji//amCHl86OvgHIUNyh4n7537KBSMa786fhFlDSF/wD7vv/kMFtxqV4fb4G49q1jgqG045V2H2kC29k0eLr7hjUM6O6uOZSLMwDzW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyWJKZNAr7h8m8h5VonmErKx9wkO/meruzrMYnS5gA8=;
 b=ZWHeOdGr9uDo+xMYtXZ+EIJGBeRWJiqgeRmnTsbFS8yiuK8KTgw23dv4bu1tn8/OZGzqiGQcCgslMgqgYZduLN/G9jYe3Cqs3+lZToEMjDuqtfuphC69AB3t5SQnW4qUpXPXcyw8H2DrGDWeD3MjScoR+umYUowCRXGCH92dkYjqrjD38cAT7Nm3iFSneSXtgLHvUs7v2heLjNZz4tKAwrES22Ek2U6jONsak57bPvSo84+BOChz/LHz3JQdYjBwF/Q1m2UmdoI46dZa5JbDEU1mzzQLTEoEAbc0lzIX9lN+NGDkIVdok9rff2KcAxk3Us4TGn+QAPeG8nLLRgyddw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:34 +0800
Subject: [PATCH v3 4/9] ASoC: codec: cs42l73: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-4-e9496db544c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=1356;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Rnxf1FYlHnF3970LmgJ+r7F5b809BLKPSEb+eSwkAdo=;
 b=G+hgAQH7VD1IislyNvk1SALWkxMpwdZ2LrQ7cKwFnmuPJMDNLATqCGQW5FTcvC0l44OVQj+ys
 spVOZgRUsXaAgwIFtXmkdClwZSBn8lCBUnItajGuq7HNcpS1RB489p3
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
X-MS-Office365-Filtering-Correlation-Id: b23b35e6-b1ba-4b9d-b574-08dd8c6ffd7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmlyNXlYaXYvSUdQSXhHZFhvZmlvWEMzdS8xYnRNVWVJQkM1cWVOS2pHTmZO?=
 =?utf-8?B?b0VOSWswdjVLYjVmc25mbW1Rdk9zbTFHRUVMRDBuM1BqTWo3TU5HdENMQUNV?=
 =?utf-8?B?eTVoMyt3MGxaMGNmQm9SNmpYWnpKTVRQaUduMlprR1U5ajhEejhhbnBHUkl2?=
 =?utf-8?B?UmcxbUtET29CcXRrSjFUVXdaUjFaRERkQ1RDTXhCeHpITTE1YWtYS2Z5aGd6?=
 =?utf-8?B?Vk5YcXZkS2c4aTNDeHBpQ2t3QTVNK29IUHFjaUsrVUF3ODhDd1ZobnBzWFZZ?=
 =?utf-8?B?Uk94cXZ4SXhpWXgxUVFVRjNYdGNoNGF3aThiYmZTQWtkK3dLNldpWGFacHNS?=
 =?utf-8?B?d3F0SU8xSlVMNkkvZ083MU1HNUQvbTlUNkxUUmVjTGIxNjIxVlRtT0RFblJV?=
 =?utf-8?B?dWxqaW1tQ0xrQzBURkM1UFBEZDFCaldvVTJyM2Nzci9oZ2NTek5Lc1VEbXho?=
 =?utf-8?B?ZmtNTjBVekJsVEcyYnZzeU1oSEhZLzhIZm84K25TNFZjWnRsSk1EWFFPL0Nm?=
 =?utf-8?B?b0ZBMHpJRDJ1R0RjM0VESTQrTmFSWE5SWWFoSUkxVGFTYk1icmg5WXlZdURX?=
 =?utf-8?B?OEp4UGJzbGFNWGxyWFEyMFhzMGliTGt4bGJXZXl2UDZ6T3VSTlJwWWpjdVJO?=
 =?utf-8?B?ZzkwVUZXeDZzNUFCREZIRW9jTFFHY0FwZHdPRDF4UklJVFdvNjd1V1YyeTRp?=
 =?utf-8?B?TmZzbUlYbGdGa0lCQ2RRVVlKUjBkU2RPVkEvckpCaTJOTDlwaTlCaHorUU5J?=
 =?utf-8?B?UGIweW8zNE1zdC9vZTNvRW0rR1pXS2M2eGtHNFM2ZjdpVWpPTmdrWGRsalE5?=
 =?utf-8?B?aWdqeTdCRERVdHJWNitYUE1pN0RZVm85cHdNclN5ejEybHJsNFQ0cURmMVVl?=
 =?utf-8?B?N3JNNjFkOGtBeWxnWk1rZHZsS2ZDd3QrMEgrUmtwcm5mc01lY2VZbUZIYk8x?=
 =?utf-8?B?WWo0R3JKL3loK1BoaW1Cckx2dURGalZvOFpWL3dsVnhlZi9HYlN3SUNJMmN2?=
 =?utf-8?B?WmJ1dGViYXYwR1c0eHBZZXpWTFZRMlJsdTUxSTd1QWtIbnVTZmJ0aVN6ZWRy?=
 =?utf-8?B?c3VwMFR0N1Z2Q2JBeFZBZHBxbjd6QXBHeWxtTXZOTlRzYXBQS0dSaENZRmtY?=
 =?utf-8?B?TnRvZVZTOGQ4QkdvZmpHdnZzRWtnejZtbkljUjltaTBxUlMxSkZJMEZXSFlX?=
 =?utf-8?B?VnFpUTc2VWR5MjE0MTNTK2VDRHlvMlVvSXYvYTlDL0pnRzBiVXVhZE5aeE1B?=
 =?utf-8?B?UHc2RXNpVXo5bG5JWlpzMXV2Tm1uMms5UnlaQ2dReVJqejVtTkx0SFZ6RmJi?=
 =?utf-8?B?REpobjNvK3lKSjlhWkRIaDhkTkpsVitOM1BHV1FGZHRIRkEzRmx5c3NteUxt?=
 =?utf-8?B?ZHVwd3N4blA3Ky9TZW1SOGF1Ly9pZ0hrYzk3M2FzN1FmbVRTY1VCUG9CZGJN?=
 =?utf-8?B?UElYQStiRFBhaE1ZU0tZa2FTbVh3dFJ3aFMxdGRNR2RtZTFPU2hFRmUrblpi?=
 =?utf-8?B?V1RrcFFvSDV1Zy9CY1B1R09YQWlTMGpQTzluazNxQUMvVUYvTDMzdkEzdUR4?=
 =?utf-8?B?VDVzR3oxVTFOcEs2dGpJTXhuNUNtQmZjMy81QlVsSC9MMjRVMmxhUmVpUHRD?=
 =?utf-8?B?U3RKMndYZE1VOXhXaCtWd0RNNzFKRTNsSkJYMUdBTFRuVzNWbUxpQUV1WWEv?=
 =?utf-8?B?cDliUmgzcUoxNENHblpTazZtSWpDaTVpdlhaZ0owUml0THh6a0xOeVhXTzlv?=
 =?utf-8?B?V2xmV0IrOXI2OHRiUFUrMktJVGRxZEJaN1NjVE1KNXRnWkZkTEREdHJxREFC?=
 =?utf-8?B?aUNpaHBuMmVXN3ZpbGlOZG01MGs3RnhoczN6MVRwcDJsa2M3N0loclV4N0U3?=
 =?utf-8?B?SkNmV0RwY0l3dWZqeVczNU9yYVJRZVk2R0dRQlZxMkdETnFyZmgxSzJFemlW?=
 =?utf-8?B?VDFlWE5KVEVrczJDMGVaN2NyV1loTWFxS1ZqcDBKU2p0L25yRWNKS2pEQk5r?=
 =?utf-8?B?cE1SSlpmczlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEpScGpkdGRtZE15TGxKMzF4TEt2dG4wcUtMUzQwcXVGM2tUZXl2VlBZUFdK?=
 =?utf-8?B?aTFOTnZiNnFDOWNVdXdIMS9GejFZMk16TXU2ZDU1NEk4cU9MVk80T012ZHVh?=
 =?utf-8?B?bXF5Wk9WSFpBNXFMaDkzWEFwdEpkcXF5LzVtNXY0RFdMZmhkWVZ4SVJ1bzVB?=
 =?utf-8?B?RkdoL2VuOHU2K05YYkUvbWVIZDAyVWVQSUR1NTNTY0ZLaVdyWXNwWHhXQW9l?=
 =?utf-8?B?ZW84eGdWMFVubSs4NUdkVUphSFBYWWpENmVWVmZBNjR6WW1CRS8zVXJpNjZU?=
 =?utf-8?B?cTZxclVneVJ1QnJrQW8yaWlVTEJqZTFpWnk4QkdicW1Mbk1QQ3NLcjAraDdv?=
 =?utf-8?B?WlBrVGhkOENpTVVZa0NwREg1K0Q1LzAyK3htOGppUnpFbncxY2xnVmg2NXhx?=
 =?utf-8?B?dzhpcmM3UUkyUnI5eHVDL0t4NzQrQ3RpNUNlV0EvOW0vY2VGT0JwMlI4SlVr?=
 =?utf-8?B?YWwzeDBwV1l4Y2FHOThzQzQ2MWxiVkt3Q0hsS3QrbmlWd3Vwek9TQklnQW1H?=
 =?utf-8?B?V3NWVHNjNmRQVFZSYS8xVFJnMVIvYWRmbkNMTDJ3aWJRNHNUQ0laOWtSUWRP?=
 =?utf-8?B?amU5dEwra2FiRXZZbWlQV2M0NlhnV3ZrejlpeG1DRURLTDJ4aTF6OTNpL21K?=
 =?utf-8?B?MVpVNXltVCtiL2VnL1I0ZUZJN3kzczFBeEtpTDM2Z2Z2UGpxbnJxZFFHTTRu?=
 =?utf-8?B?eVVmVTk4K2tXRlB5WkRRM1Bha0M1K1NpRHZVcnVSWklDTmhhTGNsS3dselRl?=
 =?utf-8?B?SGMrZWpZWlhxYzZVY25LTE4raGZHQUN6cE80UlpVcktITmpMMjdYUnNQRnZq?=
 =?utf-8?B?dDhiMFgwdDdFYkpkekVlaTBrMVl0MnFmdkJMRVp5SFlZY2YzYWRlczhmVXJM?=
 =?utf-8?B?OURkN0ZjZXY4enNYNmxPbHhKK0tXNHB1aU9DNk9GeU1td3pPbFhrb0h0MldR?=
 =?utf-8?B?M0FjT25nVGt1L01XQWQxZTBYc3dzVGZSNEJLVitreDNLYk5Dd0ZRM1hxVldU?=
 =?utf-8?B?NngwaWg2YjJ4R0YzRk1HdVNNTWRjM1pkZE5JRWIzV3FHUW1EVEhDWkFWVXNi?=
 =?utf-8?B?ekxCZGJpN2dPd0NrajAwOXZ3SGEzY0pPbHNEU2RSb3ZiRjB6bkE2MzcyelVo?=
 =?utf-8?B?NlRPMHlXays0cUlWSkpEcnJtbGxWMnBKbWl3WHYxZ2phRkIrSjZyZThCSmZS?=
 =?utf-8?B?bEdNUVRXczJkNHBod2t5NDFleU1wK0tuVVZOUVVqYUI1MUhsQjlhVzN1VzZ6?=
 =?utf-8?B?eWhzSENOS0ZYUXJ1MUtmL05nbjQwV3NYZ01Tdko0Ym5zRG4xZ2RNSnNjSFJY?=
 =?utf-8?B?cGtNWTRpbFcwSnZDZk1NcTVGUVhIS1l5SHZ5QTRuRTA3MHlWSEQyeGFiTVNM?=
 =?utf-8?B?OTJlbzgyTHFaRHRFNmtMS25ubGZxWGZvRU1JTUFUdXR1WHI1TUgrZE5xR0VU?=
 =?utf-8?B?VHNNdk01MUpMSElrUWg1UklaYXB4MkVqRUNJektlTVREYTNtWEVJQ3dRNVZa?=
 =?utf-8?B?cWE4Q25aWXJRT2YzODYzYStpdWhjaUhQd0M1amJyUEh4YlFnbjJZY3pqZ1ds?=
 =?utf-8?B?dXRGMHQxUWFkaVplZFEwN0ZPUzh0SVRPZHdPMUNYZmxNMi9HMFJGQW1UTzVZ?=
 =?utf-8?B?UEJIVzJ3Q2lzN0dRcExWNythQS9DRmlOYkdQNS9STFJYL0hvclYzeHBsSFBu?=
 =?utf-8?B?a1JyM2JSV01DaXVwYXNIQXNPSlh0d0xzRWJwcWxLODltdnZRaFNLenlnV1VO?=
 =?utf-8?B?TTlXOFBrdmo3a2hwV1JXR0diOVZkaTBiWGg3aWtZS2NpRmppY1N6dGNHb2lT?=
 =?utf-8?B?dkJwZEtndWw2THZSdm8zcGptTkd6T3RxMHk1VG1XU0k3UlI1eStaZzRjQ3Iw?=
 =?utf-8?B?TEhPMVo5ZWdzenV4UDArdmVTSkRSUFJqNjBQcnhHWGYwcHBPWk53bzVjNlBl?=
 =?utf-8?B?eG5KaFBxQ1QrN3hIcytUbGZON0tndFhyQ0FmMEdveGNCNitXN0JaaWFyUnpI?=
 =?utf-8?B?M1dkcWR0djQ2TCtjRGVJSmdSTnRTMVpZL0p4cWtKVUxCajZpSU5EdkN4WnZE?=
 =?utf-8?B?NTkrTVJ4Q3JNT0VxREJEeGozRkdYdUcxNVhFb3lLS0RoY0J0MmlFRFJTRS85?=
 =?utf-8?Q?ftDEgcBsWazlVV3Xr7U2Mx3+v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23b35e6-b1ba-4b9d-b574-08dd8c6ffd7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:17.9783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bh5PgZGk56Cg7GZErUV5jILTbysdBpMCY1uv303xN0FHuJZu0kwS08Vjqx1ZHaHpvEFCoeh4zjCXPj7wCc3Jkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l73.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index ddf36001100eef29f74f4d99420511f620f1948d..556270befa941a69e17b47a15677e1c4f912b14f 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -8,26 +8,26 @@
  *	    Brian Austin, Cirrus Logic Inc, <brian.austin@cirrus.com>
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/of_gpio.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
+#include <sound/cs42l73.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l73.h>
-#include "cs42l73.h"
 #include "cirrus_legacy.h"
+#include "cs42l73.h"
 
 struct sp_config {
 	u8 spc, mmcc, spfs;

-- 
2.37.1


