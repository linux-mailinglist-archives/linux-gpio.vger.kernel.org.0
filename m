Return-Path: <linux-gpio+bounces-19369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA2A9E618
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A7B87A71F8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1378D199FBA;
	Mon, 28 Apr 2025 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p62qK9Ej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54085193062;
	Mon, 28 Apr 2025 02:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806248; cv=fail; b=mCq94JlIbW43+szOqC2SRJ02/OGAL1mIWnYW22LdnOWBiL537lBybGiv7hfmx7gPvBYkjB65F8TGC+SrammInOfrffgmtdGsuERPloyMtANQltH1/w0JHFp0hCwHQaDi/J8e2Wju0WUo321lnoYOFGS0geFdlV5Ij3QBXLPXDuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806248; c=relaxed/simple;
	bh=S7pWC06CgHTERGLLyR9oZMEHCgLuC8Od3W6nbjYt6IA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VbVp88w/j6KzAD2pgY41zHrPZl1c8wsAfjWZ4xOf2eTcAxBew2ojEOXUcMBJzcRzYFxfY0d024Tj8ts/VdeIvuZ9znRl5RzH1RdjuCj2kNs5CKdQmoL0hw1XV9BGi9HhoNdkGr6uvhsUIYprWSUBKrsz65FyNCrqaPd8Kdzo0Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p62qK9Ej; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XACfyrRSmvuzvpRIvGjj1j3HegU2Ui3L2lD+T9Lu1VH8Olfoxvtta1AyTw7NRNQWgdGK03miBMvGnvdM1Yk4+VrCyoA2Scjm7zRv5gXnrre0MCLdvlmav2GMCZQG35ye1Ig3c0Db2uM8+AxLQlAzZZVw6rNQ3TMhHMr7HoRB9twz6JsFuTslqApPlndhoqPIDbUd0bEnS4HwEpb2gWVNAvhaVIUP7PyUrhhZmIQl1OW+CT3yG9+tQPNQnH2ZyZFc1LvnOTnpbXFBpr+GGPv3uOVxAYOSYf8ubsKrDqIJ5CWPSj74QTENtfJ/DDS0ySBgj7Rq7TMLFrVve2ibQy4WNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyWJKZNAr7h8m8h5VonmErKx9wkO/meruzrMYnS5gA8=;
 b=wI7rwvk3crZwmnqk8yTVdiopbb3VImzgrtIGOKd+KXa5HWawjKMhcU4fG8prWW+kjKSKIgfbUQZ/LXUrZGmmUQRFWbbBqZfqTbdq/9ZkmNKJvWzHTtbWI5/Q1LDKO24tURkrsOJtMWr068LIZw/tc0RfnMrRMWOBfRdVdEwkhksEzPxx2jRQ1aOitWFZPg2S4/rCsILszE8NXwJT+8DqhwzOKRt8zRY2HfzT6PpmKhbHjbA6vBKq423421Qj2XDbTvtZwaygElCiqdJFGUXdlRgVkqvgAOlZha5UbNU5E+LfTGwA7RVb/958ozpco644S005kcW0SIp0mNlctRtcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyWJKZNAr7h8m8h5VonmErKx9wkO/meruzrMYnS5gA8=;
 b=p62qK9Ejioc2Zh9QqjmaQZCxhPA7mIa2zyw5Q8bAjPtjBmUPHlQFXBX5Vz98NimehAPXDogQ4eMc6cafenn5rjJ861+PgBSHg5/SGust1WvxIpVld9n9KvOBA4oF1abNbSOcElPvYZhBCQPJiJSZO/qEzVl7bz5rhklCgJz+cfnWODqmGBb3cgaQFjMFgS8CpFpXthaud9to34dTT9LXdj0e5THCu7dO1RVOlIsvhsErXKCH0TdhfTY6hivCHYFoI8SURzFbVtobjpE/MxmpVlqgfvFA5VJHY8tVlO1Cmi+V3QnDe5l426nGgqREKjaPtlUKifKuzNxvueO9f4qEIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:05 +0800
Subject: [PATCH v2 4/9] ASoC: codec: cs42l73: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-4-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=1356;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Rnxf1FYlHnF3970LmgJ+r7F5b809BLKPSEb+eSwkAdo=;
 b=w3Ns5fMqY+56821zO7GS1tiHmyQEN/Lo+ephJmM/weQXVccaIEX9Yp6X+EFNCfre8ROW4hWUO
 /iqKHdrdIaEBuo4oFA/D/P7/wPeF33Rf28o/Xxr9rysy08JUm5/coVp
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
X-MS-Office365-Filtering-Correlation-Id: a4141d05-5cc0-4ada-ca5d-08dd85f9e1b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bURwbDcrTCtSMnJnbGpvYWVDSGJXMUNhTWJmRWtJQUFtMXZseDZ4UlJxVENN?=
 =?utf-8?B?MFdqeU84SS9NOCtJK0RXRm5sNlBGblpjRlJEd1BodU5uL0RvWlA5cjlTL3oz?=
 =?utf-8?B?NDlFNE85dFhiQWlFUGpCRHNjWEdXK1VlZWNFak5saTB5c2hablBZYW9iSUw4?=
 =?utf-8?B?ME5nSml6ODROblFEdEdVb1BKdnhwbGwvVzBWampSQkI0YVNwUUtJMnV2Q2kr?=
 =?utf-8?B?akZSMERSR2ZlQVYrZ1A3bjRaajQ0SHdZcWZoQlFoYk1vd3ZDc21PVStrNVJQ?=
 =?utf-8?B?S1hITHY5bzBYTlJ2Z3Mrdkd5ZmJ6UjVoTklzSUZ0czQ5b3hOTnF3YkpqbzR5?=
 =?utf-8?B?SEFXMnZhOEZjM1ZkMEM5WitNREkwaUJBUkZ5RjBvSGxZMThBT1hTcXVicXVO?=
 =?utf-8?B?WjhmZWdsT0U2RDZOOWg2OG8xT3dPL2ZoRytaalNab0JhbndxNzMyMWVoa3RH?=
 =?utf-8?B?RlQ3bUx6OVVIYU9JZFpEVVdNaC9zRjAvNWNieTNiMVNBRWRxKytVTlRRZjZs?=
 =?utf-8?B?OUZFNUdqZVdQSTZLQU1sYWJtMmw5d1hQMWZ0aVFhWDlVOHpycXZqWXZnTUdy?=
 =?utf-8?B?UTlZTmI4QTFmZEs1K1lhcUNzWW9iSzJ6VU9uWThGTVRRdEhjUk5nWG5xTStS?=
 =?utf-8?B?NXcvdlRteFFrWSs1Tk9NZzJuVmNxWmFrYWVDKzd0N2tkT29GVHFLMGxVa1pB?=
 =?utf-8?B?TGwrdy8yWjNSZ0twbVdHdUxzRVlMV0FTazkyejJsRmZ3R1dEWTJDSnQyMUdC?=
 =?utf-8?B?TlRtNkEyNWRUSHRMNUpJYmlVUDR1OUx0WnZWVWhCc1lQTTU4N3FMMDA5cStB?=
 =?utf-8?B?eW14VnRwZHRtVDRIcGVhcExFVWQ1Tm5OWXBLLzVSbGkweHVHODdFSFVmSWxW?=
 =?utf-8?B?SkJBOENhM2JwSDRxNVkxMWJqZnNKK0kxMjVzNkhDaU5zczNQMllRRXhpTjAx?=
 =?utf-8?B?T0JFWjNheXppcTErdFZkdUQyRkdnSXk2T21HUHNsaVFqeHJvclVxZnNzS2U5?=
 =?utf-8?B?anF5ejhSNGpWYU9mbENXUGcvMGwwdUVRb3RjazNvMUFLYkhZc1M3czZtcm1n?=
 =?utf-8?B?SjRDYkJIN2lTYmo4SGhKUTVQZzRMV3orUzdxeEZveDJHR2phQnJPR0FBSmIw?=
 =?utf-8?B?eW0vN0NTanVIWlkyUTFkR0Y5NjNXNmtheUhzVHJWUWc1bW1kNTZtZmg5OTdL?=
 =?utf-8?B?Q3oyTU9BWVhlWm5HWHBKd1BDRFFuMENiRHpNMUU0a0VHYjlUNEdyOEcwN0x4?=
 =?utf-8?B?S0NJQ2pjSUhiZ0F1VXNPc3hZcUwzVlhObXZuUFhoTFpzSU95aFl5bUhQZjNl?=
 =?utf-8?B?NC8xYTREMzdJZVJhM3dsNWVkRnRmeUxERFlFWCtIcnE3MnZLVnpIK1dWOEln?=
 =?utf-8?B?eWl0cDlRdytCS0ozejlmWDJFRWFqMEFUanFKOFZmeUhjdjY3T2VLdTVvTVh4?=
 =?utf-8?B?enpWb0hIb1ZEWXBRaEUzYWRNVms4UUJBK2Q0cmVhbWNudHFKNkRxQ2dmZUQr?=
 =?utf-8?B?cDR4WVRuRWVZR0hkakJZa29wQklyQTNTdU9vc01RZUFhNWhSK1JjVlZyYWJF?=
 =?utf-8?B?MkVWMnQrNFFqV0ZQRUtTcmFrdTcvUUR4SklPSTJHNWpYQkd4dlUwenUreC83?=
 =?utf-8?B?dmRkTE9FZnVEMk9CK1ozV1Q5NVU1Qnp0ZGo0N1pSQXhKanhYTkMrTHpoblBP?=
 =?utf-8?B?cFMxczh4ekx4N3RiamZXejNzS1h1SmdFSWtHeGE2emxuUFVGTG1xRm9pRERP?=
 =?utf-8?B?K3JPaXBFR2VGWlhHemg2R2NtQXY1SnpTbUlxN2hKYWdpclFhSFZLSzhNWXFJ?=
 =?utf-8?B?d2dkREl0SHJIMTVMRE5kQ3pLZG5BbGRLMjZidE9PWk9KT0prWFhia1RSNWx0?=
 =?utf-8?B?Ny9MT1U1ZHQ5MG1vejUyQUpqbVlaL0tjZFh2aVViaGJ6R2ljcFIwbGZlTWdm?=
 =?utf-8?B?QzJVeEk1OVRWSC91eWtYZHVIbXk0WGxxYWMyVGZnejNVYmw0eGhPckNXWGx1?=
 =?utf-8?B?R1paY2xmaG5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUZCL25lQ2o5NHVtc0dFRkwwWDlQdE82RzZZM0NJVU03Y2VieUszS3VrWEd2?=
 =?utf-8?B?bE9rQ29oc01vZStxMmd3VTZHaHh4MkpsUjN1eEtXem9sUmxOVWFLM20rcUNs?=
 =?utf-8?B?c1pmSEh2NE1sblRQY21qV3RwbEYyVEtPOHBIMjFNb21GV2FGSTNWUXh1YjFx?=
 =?utf-8?B?TEJYZkxHVmg0UWxYRmtqTGc5eFN2MEljOVlnK2tReFdEQjVwdVhINEo5WWxK?=
 =?utf-8?B?L01JVkxEM3NqMGJFYVZxeDZrbkFZbzMzU3RSTkVtS1BXVkVERm1ZNUhXM1lv?=
 =?utf-8?B?alJ5VDRITW9laG84RGEvd0VIS000TGhzWHp6V2RkN0hGejBDMWtndkxGLysv?=
 =?utf-8?B?NVN1SjBsdmlnMlo4L0FReWprcDZZb2g2UldNMXU0d1BLaHhSaGFZNTZLd1Y0?=
 =?utf-8?B?ZlVXMlp4Q0xMQ0I0Um1yL3U4ZDJpNzRzTXQ3SnhTcWl6ZWFLS2RuNXRyVUxz?=
 =?utf-8?B?bkNBVUdYTFQ3Z2E5RCtadEJRbkZUQnBibTlWMTJDaWpibHBmbzBBeXl0c3FM?=
 =?utf-8?B?VFJHOHUrSm1wRFVSZ3NYZEVub3RSSW5oUVozcVhOWFptNkVXUnZvanY4ZHU4?=
 =?utf-8?B?MHdBYjVvQ1l4OS9EQzhxT3JZREVLQndXcTBldW9qVTZYZ3dUZUcwZE1kRzJS?=
 =?utf-8?B?bDdXek92Syt2N2FaRjk3UTBTdmMxckN6QVhUMCtsdzRhKzRJai9rWlc2TE1p?=
 =?utf-8?B?L1VNRHhudDUxMVcxaUdJSFFFMGYxT056dkFrVERhVjk1dUZ1dmFVV3ZqOWxz?=
 =?utf-8?B?Vnh0bHg5S1FWTTRuUTZ4TGpwVVJDZTdzb2lJSFV5eWdDOW1tSnVia01wNXkx?=
 =?utf-8?B?bWNFemRHVjZtYzBUUVdhSWNPZ3o1RFBjbFV1QmxhRFBvNEZSVTNlemF3Y0xI?=
 =?utf-8?B?eG41WEFiOTAwV1R0di9wek93ejA4TzlqZitZVWNCRC9MM3QxZEkxczJlNWFl?=
 =?utf-8?B?ZVVoMmdxbEVvTVdjOGg4TWZNRi9iRldiSnkyR0NCRE1rQytSaXp4U1kvdEVG?=
 =?utf-8?B?cVJhaS9mWXc4MU85MFJiZERKbk1GV3c0MzdTMVRjaUVIcUJ4REh3WVlETmtr?=
 =?utf-8?B?aVNaZkZVUU8zb3hyc0RjSmcyVGYzNVRPQU9FK1dtUXlnWG9kZGtybE5jV0hn?=
 =?utf-8?B?aHpIb3NnRXJwVzM0a29KbWJ5UjI3S2R6dXVaYm9HcXZ2MU50SWlhejhVQXlT?=
 =?utf-8?B?aWlRMzZCVHV1ZEFhTjV5dEJ2WWlnMllybEgyazQxQ1FiSXMvWjdWWEJsUklK?=
 =?utf-8?B?cCtjWUVuaGpQQmZpWmZVYnBvTThCOSs3OEZiVEw5VmNHU2d0alZKNThOKzR2?=
 =?utf-8?B?TDVHYUcrQ0puenlGT0tHSmh3OUk4S3ZraWhTdXIvMXV5cnVxaVlOY0E3Slhk?=
 =?utf-8?B?bVdYd0NxamVMbFdqZi83ZGV6TXhlaWI2Wm5RSXFCQU5FNHlrSG91dzIwbVBN?=
 =?utf-8?B?YmFWcnczUzNZZjA3TEl5Q2Z5UFI2ak14ZjhpQmVVYkdmdnExNGVUZ0JuY1FP?=
 =?utf-8?B?MGJUUkNZRUhkTjJ4OVV4ZUxwOVAxQjBGbDlvTXYrYm0vVUFJTDZBbjEvYzlu?=
 =?utf-8?B?bC85MjZDcnBOWnV2UFp3MVZXNGFac0lRS2JLWXc0Wit2RWVtMTBsSnRoWTV0?=
 =?utf-8?B?bWlzN1pUOWt3OTBVdzJVbDgxR09JSmJJNXNaZFZ3WmhmTnVTWGZqN0RtTG45?=
 =?utf-8?B?SkJsalRqaXd3RXRwSHVQaHlHV3NKTTg1UW90UVFNTG5VMDBNK3dtMUQ4UGlK?=
 =?utf-8?B?WkJ6cVJqa1Q4MnphUWRHMWs3cWViSzA0alFrUXFMMzRobk5OY0pGZ1IrTXVB?=
 =?utf-8?B?V0JKVHVQTUNGTHBHOVZvVllHaHpBSURKUmNQRTgya2dpc2Vpa0h1bzdocWpr?=
 =?utf-8?B?Umc0czBLcmFvd3V4MXJITldpOVpoKytFYWxSS3lyN3hkZm1Ma2hYYkxwYTcr?=
 =?utf-8?B?SmliNnJiaVdoK0hFSHZLMEcrdUdOQVFySjV6d3I4WWRwSmNob2duSTJkNElU?=
 =?utf-8?B?c054eXIwV0s5OUxWT1F6WEJCaWdNYThkSXFQNVBCVkJuZ3BDNGZmZTF3c2h2?=
 =?utf-8?B?aXpuZ2UxUEVielY2Q3QrbFR6b1d4eVhnYnpvZStRSDY1SFFPcXlEbGlUMmZz?=
 =?utf-8?Q?9uyNTDABVPFn+m9O5yiVcDtQ4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4141d05-5cc0-4ada-ca5d-08dd85f9e1b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:43.7470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVHVyk4wGMXrZqGMI/QM24m/pX3HK3KLJz+5g0bnF/64b+7p7f1uVfcL7pC5lB3sUOD7iWPKtAcnAr15DMcDZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

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


