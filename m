Return-Path: <linux-gpio+bounces-18090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C60A74958
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 12:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60ABF1758D5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CD021ABA7;
	Fri, 28 Mar 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dhD4z5vE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2040.outbound.protection.outlook.com [40.107.249.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70F1DD877;
	Fri, 28 Mar 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162042; cv=fail; b=bU6/WErWVY6P1RiZRpFlQhRcdL8d8yvluRsy/Qd8Vgn3+hfM+MaHD6KIakA9tX5g+dShH475s1gAkhBHN/DyRGp06E+i63+6aEAkPd7GR/yK9MSb5SUE2Tnap0S9cfK7kwaZhm15hjSqGE8TIfXGOv3NDP5y8AvJuP4pS3HlVj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162042; c=relaxed/simple;
	bh=QBTaNTSR5fdksQoHs8jxjS0nVkjxwBueO5HFtKS8TBc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WfwrOe8MpRmQCkHv/ljeBVYelifwlFXrd5xVywgN0sg6RRRaKqyqMTEpVygdq5L8QtcunhblOrFEGzlwFTyfFpT5o5WsWY1uWJJ1CIZvexPIDe9hSQrs0AHXcbS0olmbzhCS48OJgneDCPrH7qQ47GfmbnmD9jkQCihUvyfZHcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dhD4z5vE; arc=fail smtp.client-ip=40.107.249.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+5Z41UDPFILtR7vZAPu7USk7Alh5+9vGD2pDhLbNoTidcrhyQS3AygoYm2tjixBbTy3aZuBLxZtcNEe39Orvo6UPobuJLSYbagK0KzbKfL5SW2DZe2XjxRvM30v6lM/59cB59IN8yK7xOQ0Vn2fB5MrRJ0UPxubAnLFPfa+397d9frKyVIxW+/zTs+OHVmC9Jf72uRDWFrEdApvXGs9zcbr9wlSz31qN9vWDTi/JauRXEJXjHhyT680NCjAiMsRh1Re1ldmnUwJ1OpYk05UNDUAXBOu9rcklEhriXuUsWiCsv0CukGRLLZA7MOKCPqaG4UKKE3Q1iQkVpnjhnqCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Lbrzz8Z2Lq1wpDWvANeQ1CdSxKd5Cnj/jYBHGg3bls=;
 b=dbKZyoMp1nayAO9ZEtBBhp6CwAQCy9I1Voed6sNqeW1CW3tpDwEUCgAMF4cyZwRoSS2Jsx9+0rTKavrpM6PIEFhDk7FuwzpV3G7Y/jZYbfw1EpRKfL9Zvg9nZKUywlOdVxYnflb8nmdkhVILf7GTqnWuyRFElVyDirRqsq8C5iISP1ND7lKgU2KKxJ9NuAMgytemHSoCPijRUJX7p2+WZZEje5Ltnn3AFgE4EGuWuQFdelVhGwrmlGszZ4S1AG3IT1ZCi+bHJwDd224PEieBRirLsXovowOR+TnbxTgd/7R5bJAvmL+U0WJ3veNPgfz05yrUxD+gO6CFk7HcEIcCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Lbrzz8Z2Lq1wpDWvANeQ1CdSxKd5Cnj/jYBHGg3bls=;
 b=dhD4z5vEo6bJ9sxseuYA5C5LXYZ6bwQcoAqXu9biWkgVR8Ww5C7j5HXZ0BWks142i+XYDuuk0QXvnDiR/BLi+4pbT2THmWvfW3KJBg+Opb4SSKnXEAzOtcqjRvXzI9MnOr76AeWXHSPfjOjPGN/1j2594ruA5WmjfDV5ei7dGFF9MYVT5/8+PZ+WTmCtQCQSF5WDzZRm9KNAX1tT2zSBCCClrJhY7kO8bZP3EEChNEd01qKmpsYVfW+SAWnObRNB8cSsDvdc8DmzFzAYmvZRb5yt112J5hv0IStWO+3BoisT4/B2ZoyrG8+11HYRRtKhEMT9wwhAINQE+IqCb+r+pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10264.eurprd04.prod.outlook.com (2603:10a6:102:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 11:40:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Fri, 28 Mar 2025
 11:40:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set))
Cc: andriy.shevchenko@intel.com,
	krzk@kernel.org
Subject: [PATCH]  ASoC: codec: ak5386: Convert to GPIO descriptors
Date: Fri, 28 Mar 2025 19:39:17 +0800
Message-Id: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10264:EE_
X-MS-Office365-Filtering-Correlation-Id: cc73532b-1ca6-4567-6952-08dd6ded5a26
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzhLK29xazNYb2t3ZEJPdC83U0cvVjUxQ2QxYndzQm9vZG9yQXV6VUE2Z3RG?=
 =?utf-8?B?bmRndDFUMTdqbFBsckFUQUZNaEIvWWtuK0lTT1o1MG9FMGpOSEd5aTlxY0Ft?=
 =?utf-8?B?NWNDTGtiTmlBQTNYdjlsdEV3ZUtRd3ZxOGFUMG5hQ3EyVy96M3lROWN3bDlY?=
 =?utf-8?B?VEcwdit5MldIbkFKWHhvYXYweWJyQWxXRlpMMGhuRXZvcUl0b2UwNlJ3aEZY?=
 =?utf-8?B?ZmI5MWsrUXpZcXo5UTZvekhjaFlyeGplRWtXTHBRMmJrcXNkbnVIOFZ5cUNy?=
 =?utf-8?B?aDRsbTJ3ODcrZ1U1QU9BeTVuWnZ2Rno3eThLRjZUWmxBN3VtYXc0Q2xGajh5?=
 =?utf-8?B?OGZoNnhJSmN4UnFScGhJZUZ0d2o5ZUh5L0lHUE9CM2RkS0hIbjErK0hyK2l5?=
 =?utf-8?B?blloUDJON3NYeXZSY2RkK2dXSTVFVVZDNndJZHk0S3RZWmYxd2dBT2Qvdzg4?=
 =?utf-8?B?RCtPSVZxVG1jRlVUdGFyZUc0Yi92RUpwVEtJVVZ3dFF0cHVBdUY0ZGlpUm9G?=
 =?utf-8?B?WCt4aUF5UktLbTF1RnlYa0YrWGNFL2RRcnkxeldvandTVXpaYko0WW9IMFpp?=
 =?utf-8?B?S0E2MDl3Q2gyTVk1ajg1YnV5T0c1NWZ3cGFuMm9PdHB5NWo4dWdUWVhLQi9D?=
 =?utf-8?B?MDdIeW9RcFVZZXdIVUpnbUd6MWswWlJBTWtWVmFyckx1SXBFVVVKbFpkSm1O?=
 =?utf-8?B?U1pLVkZoa2VobnJzRklUUlRPaEVhMkVkS0JzSFhjcm1jekMyUllJTWJFaFZt?=
 =?utf-8?B?T2ZBSFpsRXcrVUdYQUJpWC81TmM3NmYvYUtCV29JZDVsUkRMWVprRUNkR3ZK?=
 =?utf-8?B?ZjZ2Q0JKWGNVVzF1WkVpSVVhUS9VWjNHSUgyZDRUUmQxdEEyMi8vZCs4Yi9h?=
 =?utf-8?B?YktvdEhmM3ZHWEVHdnZjYnVnUnJ2UTMvY3FyK3ZHYzI1ZjBMS21NaUJCNWph?=
 =?utf-8?B?Q2pYaGFDVVhMSjVxWG9oYkpFbnFnY0hka2RqY21vNEFkclF1RFFoMUd5cGpO?=
 =?utf-8?B?YjJKQnhCYTVSNlVvZk9JMUkybktnVWRvUlo0T1RobGpvS3Y1QiszQ0JzdWVt?=
 =?utf-8?B?OGhMRTVZYzlzWmVzU05LcE5DeWhXT3Q2c0FBeFdsZUwxZEt3bGFPbitzekxT?=
 =?utf-8?B?MFhHT0U4eDdBUWN1aTdQSkJOaDNmQmNsQm9pQUFTTFpXUWl1elIxNGt4dkFa?=
 =?utf-8?B?OHk1b0VpSXh5OHZOMFF0WVRvc05EcWN3dFBnUm04K0dwNmw5enQ2TmI0b05U?=
 =?utf-8?B?eEF4Vm5Pa0FLQkxjaytQMS9qWVNtS003YnFMazU4Tjd6cFM4SXlrUWFtYjMv?=
 =?utf-8?B?V2x2anhiQVhvbGZ4Zm9DTUk0WERGejg4dEJyQ3hpdEx0WktkaGZoL29sOTd1?=
 =?utf-8?B?N1QzQnd5SDNBaitWMjQzL1BvTGRMR0dITTdNY1B3VHFLSkxuaTNSQS9UeGls?=
 =?utf-8?B?cVBLSGU5MkR6bjhOMHhteHo4cXJwTERIRnNzVjRuamlFR0Z1SXVtUFFUanlu?=
 =?utf-8?B?aUc1WWZtMUEzYVVLalI5MVowcHZsZzRrN1RRS3NIeHNYcG5vdm1yYW96dG9U?=
 =?utf-8?B?a2tZOGNxdTRjS3JYZEtYTFNVSHFZYjlJS1kydUFmNnpKcStYUDVFWENrcVJI?=
 =?utf-8?B?RFE5NStzSDRJS1VtWXFHcmx2dHdLcmZsTmE3V1VXNnRrQml1UEpNR0VuUklE?=
 =?utf-8?B?bFlnNkxlYTFOeGZSbSsxREJpY1FvblVnaUhmeS9JaWNlMzFpYVJEY1hUcDl4?=
 =?utf-8?B?WmFvRlhqMzhxZUNuNmc4YXJRSXk5OEU4TitOVjJ1R2RvSHRCcEVkYUdwM3dE?=
 =?utf-8?B?K3lZNkplb0k2OEpqNGpqQXJEMDNUbmxvb1o4RlBOb0JuSEJFVkgzYldvdWJS?=
 =?utf-8?B?K2oyeVRYT0pFTGhDWmExSDZLbEYwQVRSdzg0RmNpN092OEcrSzdNcElKZzk1?=
 =?utf-8?B?RWZ3blBuTGFva3FtZWJXN0FlQVVRRGxpbTVOajhnRloxQVpUSXRxSTF2VXQr?=
 =?utf-8?B?bURhbFltaUFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkQ3Yk5rUFJPMDFJa3h6OUdHWDV5SXRiOG9qbHhEVlk2bklhK3hUUmRjSjN6?=
 =?utf-8?B?cWxUelg2Nm54WEFRR3p6d1ZOc25wSkxqNm93NkpDM3Bra1lSM1hKZ1FvMEhu?=
 =?utf-8?B?MWk4U2xKOGgrc3d2UkhIM2RvMjV2N0xESnZES1I5NFpyUlpxTmx3ZzgzU1pl?=
 =?utf-8?B?YTJvVEFJN25SYkZhcnVSK2I2TFJhN0Y3S0h3eERaVFJoYjFxcUhrK20raHZL?=
 =?utf-8?B?QTNsbWhQbnRXamliSzRKYjc5Z000Sm1XRHc1UVMvRVRFQ2lIandLTEIxcGlG?=
 =?utf-8?B?NnM0WnZTK3Y3eEY4RXJjV043VkpobVZtYmtnSUd3RTZOYm03SHBGMGgvMjZK?=
 =?utf-8?B?Ty96REcyVGREaThrZzk2eHNaVDhVS0wvakxSckdTYkxjU3QvSk5Za0dOVS81?=
 =?utf-8?B?Z0tFN3JvaTZhNEJ3bm56amtnNW9MM2hkbFU0bnZxckZoZlBKTEg4OHZEZ0ZD?=
 =?utf-8?B?SUJtbXFkWXhXQlpBdHcxK2x0UnhGTXM5RzkwQTh3QTV3UjJ6eFpIZDlFVEpv?=
 =?utf-8?B?VXlRaDZDMFVIWnNFaEt2allqamZrWEtRSEFwNklWVS8yeVU5TCtRQkZncVRm?=
 =?utf-8?B?ZWJGd0tkMklhencwb0piNXpBNWhwd1JkRWs5Q2pWQ1NLUUZicUx1VUUvRUcy?=
 =?utf-8?B?cUp4cHVhSjVXaFRMMVlYeU9Hck1YSWM4K0FRTlN4WVl3eno0UGlnYzh4dTBz?=
 =?utf-8?B?V2VjMWpBWHhYNlVvOEdYRm51SGtzSWtGUHR2eGNkTzB0dkU4SkxhYkg1ellj?=
 =?utf-8?B?WW1hYnd2VDJTSnc4RGNad3drT0QzdmVFcjl3R2dUVm5DVDFjc2RLS25SY2Jp?=
 =?utf-8?B?aENyaFZwKzhNSG9uaDNUMjFLVXkwc2RienJaOEVTcVdrWjZKdFlkVWJpWXR4?=
 =?utf-8?B?YmkwYS9Ea2ZZdGQvVWx2SkRJR0RLK3V2QjBOeSs4WFZ1WTlaYUJPZlhxSW5v?=
 =?utf-8?B?MUg5TkU0L1MzK24rSzdEdWg2NzMzK1VhSU1mN1BOV1RUeWVXbTFTSjhnYnhx?=
 =?utf-8?B?aEt1STdFeGxMRU5nYWdiVE1vTy81UkxWMEpwY3VtS1QwbUlDTFFCWERGTlZr?=
 =?utf-8?B?ZnNobTZnNGg1akFaYjhxS1FJWGVlb2JRMzJ6VlZ1TzNGME0xVzVNbXd6M2Rv?=
 =?utf-8?B?QUtaRkozZUh1cGg1alhlUm5wVmV3WlhwaFJzTmh4OUF1WUQ5aWRkREVSSzg2?=
 =?utf-8?B?dTd3eTdHZFJ4cEFZUkJyQ1ExOUplNjIrUU4vaU5VQWkyN0JlRGNMVytnNUVD?=
 =?utf-8?B?dFg5S2Z4cGVZQVRVOXBrZm1FRDZ4YVpzNy90ODZkMURKeURabzhDdmprOGNL?=
 =?utf-8?B?SS85bmNnZlNYeXpLMWxtUFhNcVcwa2RqSHhkU1NubnpQNUZtNHNGSUI1OXov?=
 =?utf-8?B?NDlMKzk4ZllZTCsrN29DcHdWRzBuZHNTL1I5eUdVbldNUkZvS3dEbWF5d3Vj?=
 =?utf-8?B?RlJEQUtVbTQwcURFSEs5Vkx5ZFlPa2k0bmExckJ3UUYydTVMTEpKV0hiQ3BO?=
 =?utf-8?B?UXQ2amxhSVYwb3o5WUFNV1plZWpBeEw2Rk40UmtuOXFsZnRnSDQ2QlhNNnVY?=
 =?utf-8?B?Y2RwQ0VGUzZYbklnNGFxclJkQ25lSlZIZFk1V05ucVBjUjRSWjRHd2lLaUJP?=
 =?utf-8?B?SUJ4bmZhK3gxK2VEbS80Ukd2elBSclFRTTkvM0dkQkNLTFBJbExCbGZkT0dH?=
 =?utf-8?B?ZGJwNGFQcUFPR3h6TTRIR3pxTWphZjZOZnRoc1J4S3ZLU29KM1NYUm1JWUpG?=
 =?utf-8?B?T1VWN2pQcktTYTQ2bExKaXNBZ084N2M5em1uQVV4Nk83c3BQMThEK1FsL2ha?=
 =?utf-8?B?aFVnc1dmaTJGc01MSStaMUFsNE8wQUNOcmMva2VPdTFVU2k0QndsbnNDM2lO?=
 =?utf-8?B?SjhZNkE1em5lcVY0WjJuZzY1OExKV2RjZkw0OEhEelB2dHFHeDIrVHJSc3Bq?=
 =?utf-8?B?blgrOHc1bEsySGRRUG1qYnB1MGgyVXJEWXlzRUZtaExuL2phaWZDUzdBNHht?=
 =?utf-8?B?dU4zNFN6Z0pVTWk2RldKSDQ2QklrNDdJckc3SGdiZTRsSUJ0dDhNeFp5ajl2?=
 =?utf-8?B?MjBnYmNwSWZFT0pDb0F4OElJNFVlNkJVRkFyYm9sTkxzbWMxaUN0WHUxYUtv?=
 =?utf-8?Q?zzBOgw73F3DDLbxTn3LWMjwSn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc73532b-1ca6-4567-6952-08dd6ded5a26
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 11:40:34.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMOYy7RR+8mYi894FhApsKbQOzSbUh/X0PLQLUR3jm6vhm92n7IxSSTkxnELI73PFAIaF32UVOJeU8/Ayxdz8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10264

From: Peng Fan <peng.fan@nxp.com>

 of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use dev_gpiod_get_optional to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 1 to power up
AK5386, and set value 0 to power down.
Per datasheet for PDN(reset_gpio in the driver):
 Power Down & Reset Mode Pin
 “H”: Power up, “L”: Power down & Reset
 The AK5386 must be reset once upon power-up.

There is no in-tree DTS using this codec, and the dt-bindings not
specify polarity. Per driver and datasheet, the gpio polarity should be
active-high which is to power up the codec. So using GPIOD_OUT_LOW
when get the GPIO descriptor matches GPIOF_OUT_INIT_LOW when using
of_gpio API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 The Documentation/devicetree/bindings/sound/ak5386.txt not specify
 polarity(this seems bug), so per code and datasheet, I think it
 should be active-high. I could add a quirk in gpiolib-of to force
 active-high or acitive-low if you think needed.

 sound/soc/codecs/ak5386.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 21a44476f48d..ff635141b37f 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -6,11 +6,10 @@
  * (c) 2013 Daniel Mack <zonque@gmail.com>
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
@@ -20,7 +19,7 @@ static const char * const supply_names[] = {
 };
 
 struct ak5386_priv {
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
 };
 
@@ -110,8 +109,8 @@ static int ak5386_hw_params(struct snd_pcm_substream *substream,
 	 * the AK5386 in power-down mode (PDN pin = “L”).
 	 */
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 1);
+	if (priv->reset_gpio)
+		gpiod_set_value(priv->reset_gpio, 1);
 
 	return 0;
 }
@@ -122,8 +121,8 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak5386_priv *priv = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 0);
+	if (priv->reset_gpio)
+		gpiod_set_value(priv->reset_gpio, 0);
 
 	return 0;
 }
@@ -177,14 +176,12 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	priv->reset_gpio = of_get_named_gpio(dev->of_node,
-					     "reset-gpio", 0);
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get AK5386 reset GPIO\n");
 
-	if (gpio_is_valid(priv->reset_gpio))
-		if (devm_gpio_request_one(dev, priv->reset_gpio,
-					  GPIOF_OUT_INIT_LOW,
-					  "AK5386 Reset"))
-			priv->reset_gpio = -EINVAL;
+	gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");
 
 	return devm_snd_soc_register_component(dev, &soc_component_ak5386,
 				      &ak5386_dai, 1);
-- 
2.37.1


