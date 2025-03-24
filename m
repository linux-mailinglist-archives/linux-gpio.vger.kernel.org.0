Return-Path: <linux-gpio+bounces-17887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA53A6D30C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 03:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB04B167EE1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 02:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95CF17C224;
	Mon, 24 Mar 2025 02:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y1jZiPAi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2D176AA1;
	Mon, 24 Mar 2025 02:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742783295; cv=fail; b=TWvFwnQDQEVGsJ3Cc+EzcweOlGnCbhhAeRBM3HqxSCu+affCbvFEVbs32MsQAdJRj2ZmwaMxMkAYQdPDRt/kzpixOq1Z76ZvZehpn0Ql3DirVnM9Cps+5CA0dcWIhnvLSQiawxWEOwhNgIn49CZ/8OvdaFsDAHh9q7Fs1juVQqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742783295; c=relaxed/simple;
	bh=KBxeSXnXKIjfokub+bLhLidG9dyvfKY3BY7BhN7WgKw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qNjms2FOW4TaZVE6vT/G6vQZdC/n3KsO3XzbXwtviHrDAv/p8wbnM5DU0AILqmje6lPjQX9HFaCXdsC5/uGtMwrjORwzJvyjGtudjyMxkZGz2wErjpsOIeyIQ7nAmYThWeHQKr7PgYFTl7jlyffUcUaZXkPyqTEuZ2pDl4Y5VxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y1jZiPAi; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv3CcZJCiqnCWFeGmQRGXOaMOrn/QaXDj/rteDAAYtAd5+knpJVUTG80EiQxTBuyibH0877nkIlz0L68FfdA0zJ9G2XxwlQaTZxYLRxA9refANoJUawcy+DIyoTbh8iPAarTyVlMbKpZzNYNVc7prVyGktGi5KnMp56vTlD8dL/LlBfUak6xcgZ9L7BJ6N/pdMXfEn9oV7bAGjET5ywQ7L3OvRQmQMiEZZ4YqNJDKfmV6n7jrVrvQCbedt369Cn2aNKO2I3Vht2nE7rJvdyK+/GZ9dKs0r27HKxa2RU0+LzGQZb0kefuqv5HdJTygr4rp2bBbHB4i1w/PN1OYtaArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1aHxFRghZpOloeIDuKT6dsTXgOvoW/mciMTe63j39Y=;
 b=vdx65RNE3D+nXVn2y0FTHMZF0pU5pb0QQKG3L44zU0apf7PcmPzSSY8YC28BHvXhiIFcLL4nCIZ6opfGILae36/rlwFfF1DnbhpPOlvxMfK5c0HesWQWxBxxvOVaEJZbZvipz3kig072ZkYJwHV5SHQxiuIvWjlh4vxxxjMgQWHu45r1Omr3LAZ79Szed27rZhtgpMEqzGJ3e/UQ344ptFeC/4qFrXh2OSDtvR8gBhboxXLVishhwt4DCrEBAqTb9DZemX5wqE9DJLa0uPsS0LGpGkq2+Egxb3Op8G2u9aAAhqg7O7v9hjFu3uclEkErq2yFmKI8K8yppnn020H3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1aHxFRghZpOloeIDuKT6dsTXgOvoW/mciMTe63j39Y=;
 b=Y1jZiPAiulZEq+6J5VrxhlMZ+9tKkJpAZDtTPFivKcuKxJn3rOKXgpOe5C5odjSp+2tLa3x2PxBVmQLC/Qzy+jCpupBxwib2K70WtSpoVyKKwMIquCZzQLJK/679wDDNeLKKJIWAIv1tRbOlVO3nl+FgJom+E8QUG1GuclJHu2rAnq4C71sRBbd73morBzSVui7kqA/UiHJWFKVk3J55GjkG4kPOHDuqEuL4dXs+K/iYZ5dvQxo4GncGj+1gB0W3omWFIJh7Q85jAdLS1wEFDyht4XKmTX28E29W6OYcfVFtVUxOudKL8cmsjgUL3TxGiww5QJ10ha8k8bTxW2FrkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:28:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:28:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 10:26:55 +0800
Subject: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742783224; l=2428;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vXU5oXYDT7pq3hwycqWjcyFZmAO8bXnWtI77J5aaCG8=;
 b=Fm36vZcx4B+KH/INgDc/rnJ6v+ZEwNV1LwL/9wre18nc6M5z1AONBCk/rurqhQJ214wwBGfvZ
 N/Dy2rcijNYC8G3Y3Uxc745Lzi17uhHqntYxJyYKfDHVUl3k8B65VBn
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: affe3574-8ef1-4e6d-080a-08dd6a7b844e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTkzT3NJOVpGd0YxOVFiaGtPWW1vckZtbUtSOFFzRnBLem9WMSthWTJnVFAz?=
 =?utf-8?B?aUpFTkhnejdXRjlONnU4YmZjZmxjRm9vc05OWkttN1dNVUEwckN0MHZtSGlq?=
 =?utf-8?B?dklia0lNVXdXOGNXYkxROUdTcVVOMHNORENqSS9RZlRpb2xYbXNuVE9pRFBm?=
 =?utf-8?B?K2lwdzBtUEZSVG4zN1RWMVM3NlUwY3M1Y0xreGh6VHhab3U3U0JIZWxnR1ho?=
 =?utf-8?B?NFlZajN0Z3lPYkF1ay9pMU42ZXRlV0czdmtDTEtsOXp3TGpUWkJrN1Z2Rm81?=
 =?utf-8?B?WFgyZWlWdzBxbEdySmt3UzhXaitqaGQwVkxEZEJDNk0rUCs3a1hISlhWTjlO?=
 =?utf-8?B?VUtIMllxaHdIcUFmcGtGL213TVhOMzBsNTVlUzUyS3IrQ3I3UEZHMWpwc01r?=
 =?utf-8?B?ZnlyQ0dDZXd1dFNkWFFFdEhmYzlNR1NmNTlTVnZnYitQcHk4UG5LUVZuZlUx?=
 =?utf-8?B?cHduVWxlYmVJdUw2di9VRlJMNDhLR0JSK2RSVHduN2tESlFoQzFwQjNDK3Rj?=
 =?utf-8?B?blp4cDRWRzF4R0tTVExTTy9NZEpnbFcxY0VhU0liblY5LzFrMmpmdHY1ZWdF?=
 =?utf-8?B?WTNMUlZ1VmZLZUYyRittWG9NUnJ4REIxWlUvT0dKdGxFZzNSRzU1SUJiNWEr?=
 =?utf-8?B?eFFSem4xRTFROE1vTEY0MFh6ZEVwdG5iQTJodTYyZ2ZiQnl6bldWM25wKzdG?=
 =?utf-8?B?SHlubTZsVEVicjRKcVJ5d0Q4Y01wWEZpeUpNQzdLV0NTT3hlTHNadWFrQ1Bz?=
 =?utf-8?B?Q0FIa25GWDZMSmtEcnYvRWJ5aGNaUndQM1VBRFhOc2hzMVpZR21Nd2M5enFl?=
 =?utf-8?B?RE0xRTlRSURTdVdDcFhqdUJxYXdETFhwaiszUjFWRGRyeHQzc3lua245bE9F?=
 =?utf-8?B?R2F1ajB0VHhicXVDVklnL3g0bHp6N09OYlpXRit1ZW1xTTYvY2kxUFVOd3I1?=
 =?utf-8?B?dUExaGRpK0N1S2Q3NFo0WTVaVVRtM2ZsUWtCbGEweVMvTDRFbDErM1VUOXZV?=
 =?utf-8?B?S2lhYTZ6UG1LeExuREJ4QkJjZ3BCSFlkM0JKdXJuOEkzbFI3ODZkVXMrODJL?=
 =?utf-8?B?NEIrTUxvM3NGZ0k0RzVkd0dvT1BNRUFUNWlRYldhK3VQc2R3ckw0RkF4bjc0?=
 =?utf-8?B?ZWFqclU5d0l0WFV4aDY4c1BXWXk2SVVKTE5aY2VIWURaRWVRdnExVHBEOTJU?=
 =?utf-8?B?QUdnSFhHTjJ5THFHL1Rwa1M4bjNJbllXODVBTzUwdFprNG9zSzhNUmVYdXV6?=
 =?utf-8?B?U1B5eXNKTVJNWjJBTTVoT1YyVE1haWJzVWpPQTBORWFNK00ydkJ1SkVtODY0?=
 =?utf-8?B?M0xvUTJoMmQrQ1BwWHZjVmFicVlEUHE4SkxPOHJXb1EzZEJ6WURrMHMrREFv?=
 =?utf-8?B?TVNhYXNnYk5sNEVQOS9tdm1KQ0NNYVhVcm1ndUsvYW5SNHkrbjR1WmNNUnhI?=
 =?utf-8?B?Z3JmQkgzT1YxN1pBUGUzbkRVeDgyTTFPUkw1RkRmL1RIK2RCOFFrL0hHV3dm?=
 =?utf-8?B?RGQ1bkU3eGFzWG1oUGFRMUJzV2lhNkUrdXkwZUlQTXdKa1dqUkdXejlscFFv?=
 =?utf-8?B?bDZZL3hWNm5pQjRHaGVCaFFjaHlrSGRvTlBvZ1kvZ0RtU245K0J4aGxjeXgr?=
 =?utf-8?B?ZFUwNzZ4NHNUU3oycE5FK0JSMms0WXR3Vzg1R1dGYTBHdWpPdDJxbXR3UUJ5?=
 =?utf-8?B?Q0w2Y3RKUEJ0NzU0Tjc1WUhNanJnL2tTUnBzK3JtLzJOMWpvai94RVFReHUr?=
 =?utf-8?B?cnJRUW56MFFBaWhlT3dROXZPRjVoZGdha0pVWEw1Z0JMVmtkaXRsS0p4bVNm?=
 =?utf-8?B?THdxNDMzWFBzUnY5cUNKYWpTYXcwcDNQc2tBS2VXSnlHbm9YOUxCbzYvR3Zn?=
 =?utf-8?B?bUM0My9FYmF2bVVyaE5DZGZyRmlGcXJ1M0RyS0NRWEN4a3FxSnhRZUlvek9n?=
 =?utf-8?Q?/5rt18eTMLTYmwqwZHvmHb3+6KlkNSvs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0RFMDRheDIxZ050NVJFK1EwMTJYU2ttK0dVMUYxMnZRTVE0UisrRzdRL3I2?=
 =?utf-8?B?Z2VYMUNjOTBkd3pXa0R2ZWpSUDMzcS9sQ0VsbFRIcXptWUN3ODJVMk0wejZX?=
 =?utf-8?B?Yjk2eUNTK3RoeUJSdzVLeDg0WU5tTHM5Mmw1SnV4Tld0NFJoLzc5aUJGNVY0?=
 =?utf-8?B?WlE4VThzcERDbWtsTFhhQWlZR0Y4WXVYdkEyZEVNaDltd3JWU1VNQ1RyYXdC?=
 =?utf-8?B?M25BM2NBTVk2azBJcjhvL096RnI0enpEcFVMdGsrbTluSU0rdE1vRWkwc1Rx?=
 =?utf-8?B?Y2gwdVJ6RU9MMThTZHVNVXMvTnVaMllObHdDMVpSK0FoNDBFOTgzQ0dqU1k5?=
 =?utf-8?B?ZlpndHJaeSticVYzbzFwZzFTMko2VHR6SGMrMFJWR2Rlei9SYTA2M0lSYnRq?=
 =?utf-8?B?ZmE4QTl1VUMvNm91d0s3aFQweFdQdVV3YXZsOGJLTjd6V05DNFlEQVh0bmIz?=
 =?utf-8?B?WTZuaUorSi9SZVJlSVFIUkx5UmpNUVBYeVJJemQzQUVKWnVNdGgwby9JcWZE?=
 =?utf-8?B?NmVWYjJxSVl3cDRNT1JHR1paTTIrRWg1eExOaXdxMHFiYTBESzBPQ3NrT1BZ?=
 =?utf-8?B?Q1lJL3dDUXFQMFhGOTIwODBKYkVCQllzYVBHRlZuQmtRV3RmbjJoOUhsOFc0?=
 =?utf-8?B?amdORTJ1N0phRXZoVDZSWlFSVzdtQTVxVXNnRXk2VVlzUmRRK2wrSFNSM2Jo?=
 =?utf-8?B?bm01dmx0cFB5YzFoWkQzMEFJNUlJNzgyTWhBOGxybTdsV2dUazU1aXB3ZitF?=
 =?utf-8?B?aWFHclU5UVZ0UnhoekFySHNWTm4zR01XQ1VmQkNybUdLQlk0SmhRNEhEa09L?=
 =?utf-8?B?MDJIbEZBUmxqUTBsRThFVkpVR0QvMzMyZVhjVU02US9TOStmcFhaUWswK1I0?=
 =?utf-8?B?c3VON2c4cnpFMjJoVEhlTEdhMW01Y1hpTDN2eEJ6L0R2NHRLb2VJTTkwc0tu?=
 =?utf-8?B?R3JjZkJscC95cEpHY1ZoSTNLdGMvMzlxNzFoZ3orVzlMY2VDYm5pNXdSbTNR?=
 =?utf-8?B?b3JnVWhMQXZvNmFHQkYycjNxUU1LUWFNS2FvUDh0L25UYmFTN1EzQVVTUmt3?=
 =?utf-8?B?L2ZsY2xodTdTT3hJaFFSbUpyb0NtNkdneEtRQjcrUUVSOW5BRllvN1M4WnNL?=
 =?utf-8?B?RDVSejhwa2J5QlcxZXkvUjhtcXFNYytGc0ZpK3lUUXFyRkVteXRhdUNGMXlE?=
 =?utf-8?B?WTlaUSthR1pmODkrN3VBMGRrSitQb2VoaTV4enJPUHpqbkYxOTR3dzZ2QkRn?=
 =?utf-8?B?eStMcWx1dEVzWG1qQy91QlJhYnRuN2hzUmRRb0h5NklCd0ZUTy9mTDhUSzhw?=
 =?utf-8?B?bjNHSTlQaHBvaXRMQ015Q0RKUDBjNnNKQnYyaXZhNmxac2dyUlNEbHJCN2VF?=
 =?utf-8?B?aFoyYk0xTHhqZG9MdFVjUWRLTGpSRllSWHd3WmVVRzdqakR2U0o0N2h3S3Jw?=
 =?utf-8?B?Z2dTZ1JPUFgvdzJ2MjZDaUZQWkVqRkRtMWV3OXdYcExoQ0VSdWw4MHZpYjdC?=
 =?utf-8?B?MjI4Uy83blZMdHdtWlZ4YVl5YktCRVFvN2FXOVladWJhTW5YNkNhSkROaTVm?=
 =?utf-8?B?T2Q3d3pmZlQxNWh6WXRBOGtRZzhSVHF1SFU1RTk5KzltS3dpTExBTDB5OXVo?=
 =?utf-8?B?QWZIdXhLbkdmdW9jOXpzUExIc3FhU3FsNHRXdHZZL1JuN09OcVVqVi9YR0J4?=
 =?utf-8?B?NFU2UjBydlIzMXRvZkgvUlRaUU1IMHc0YzBmczBtRDh2dHpoUUdzL3M1YkZD?=
 =?utf-8?B?VXN1ekxiWUpwRERBcFVpTzBPTlZUVmExRU13VXhKcG9CcEFHUWdvOSt0T01Q?=
 =?utf-8?B?Z2o5ZHdUODFvRTZGOTVxMDIxUHVKNkwxaFdQN25xQzJGRmFEZHZGaUZsTnVD?=
 =?utf-8?B?Y2pHU256NGUwNUNha3U3ZEhYZk1WZGtGVGVQNWhsWm5QNFkzNjR1N1hyNVNP?=
 =?utf-8?B?Q3p5OEMxZHg1VHZreFBIdjl2cXZoOE5YZSsyVzBjREZ1MElaeDFrOWNlUmxY?=
 =?utf-8?B?cTJRaHZxSWlKcEdUaVN4aGpqKzRiSkg1VWU4anpjK3kwMFFhNlpZTkVJVjBp?=
 =?utf-8?B?anVvUld5OFJwU01VV2V0Z3RnUWg0c2psUWN2ak5JSlZrRTZ3Q2JtbFJuTkMz?=
 =?utf-8?Q?7OY2MBGYxVTjOHxfOLUeLGIsa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affe3574-8ef1-4e6d-080a-08dd6a7b844e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:28:09.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ris/F3gmZ4u7INJ0utGpETmaefcL1brK8NOdsIC/7b1rRKJhToeBO+qzKsndpWY0bN9KVuEYtC1jOf/y0bts/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use dev_gpiod_get to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd938x.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 1ae498c323912ed799dcc033e7777936d90c9284..c70da29406f36883e4926eca40ab5ba5df02c383 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -11,7 +11,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -171,7 +170,7 @@ struct wcd938x_priv {
 	int flyback_cur_det_disable;
 	int ear_rx_path;
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct gpio_desc *us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
@@ -3251,9 +3250,9 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
-	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd938x->reset_gpio < 0)
-		return dev_err_probe(dev, wcd938x->reset_gpio,
+	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(wcd938x->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd938x->reset_gpio),
 				     "Failed to get reset gpio\n");
 
 	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
@@ -3297,10 +3296,10 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 static int wcd938x_reset(struct wcd938x_priv *wcd938x)
 {
-	gpio_direction_output(wcd938x->reset_gpio, 0);
+	gpiod_set_value(wcd938x->reset_gpio, 1);
 	/* 20us sleep required after pulling the reset gpio to LOW */
 	usleep_range(20, 30);
-	gpio_set_value(wcd938x->reset_gpio, 1);
+	gpiod_set_value(wcd938x->reset_gpio, 0);
 	/* 20us sleep required after pulling the reset gpio to HIGH */
 	usleep_range(20, 30);
 

-- 
2.37.1


