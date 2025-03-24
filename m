Return-Path: <linux-gpio+bounces-17912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396DA6D98E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 12:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B913A2A96
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 11:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772FA25E832;
	Mon, 24 Mar 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TdDvLfVd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D325E47D;
	Mon, 24 Mar 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817162; cv=fail; b=sHjEwIPQVonVgjEVyZ1zqdtaWhVnuF6DdDVmuHuKx2m3lepvCfn2Ppm8VYu2yURB4E0bWtf+dZAYPKLHhJht2cTG0gERvvkh4mP6cAbyfDukBMKDcCuKJAy4lF9Szn2h3Dj3ynVyvaIVtEzZzx5axWMnk2zK4jC9OihEULncKDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817162; c=relaxed/simple;
	bh=clBLY6CTjup4wOQ0/L626b6aymnbE1kq3ZpcfBvAZPs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qAHi8yk2bbpBWnvTXwRfsl9FguYMEchHxqp5XIH9Lo9rMUSXfxcl0pQF5gcBuhPYPZQBSpq5ImUF4/96q/qGvgHMUqDC4aYtCFtozTqn8sale7joii0MelhwLnb/bnuL9n3z3nCgO7eHogUe5D+VzEmLdWxZraiBU7P4x1I+xwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TdDvLfVd; arc=fail smtp.client-ip=40.107.105.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toamur910b67lVJWdRmWQsmJLEsJoeU92Vt8NIS5Kba+Uno+qh6TiljgikMZuLbYEtCGvm+n/Xa5UqByt293puGZ2PGTm0ZhINuBvyeBKahRecYW9hXEMazaJ+JAlR/hvQPfUZKYb/RC+prqTocx5wq/6myJeLatb8uOoxbC/R5dlWmPoEv5amcwiNl67XFgwpSW14bSml9PycLxkek8/iR65qSaVfvDvc+udN+NbwHddkXoJVQDsYI/2GTvggqWplWhYbT7ksKZc2JcYXcev175Ytcz80yEc/TjqxMp4xmchCKWcgSjZ7lzSUK76lDL/k77su0ksjvmH0/5xlDN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgBNSK4ySIw3VgQKwYgVCvAqc9nYi/Toq0XR0gV2Rc=;
 b=I6H42Rp9dM9McFbOpug+fgt8D4q7sB4OMoJyRlebPmevrDQumQeTsDgNT7WRgKbQ0Wxd8IPQ7VFRzKPdNW7dCpOSCnI5cym3/jPzqyqeCbJagYRsOcuTh5In2Iz56FLwwSNdGAO4Q/ZJn+PfnuobuFRS7lAOqh7RQlQ3UwatE4WGk+sUfCGoWNpNdqwm5E5u/BjvNiXVQY766ffEeZuVxb2Il3tHJ8v2tNdMDEiEGC3vlkAbu3jr6R4WNcd39MZN0F64huIzq4bfwknYHK0UmWMZnMHJO5zKhWVT4wSknPjQ0D7DS0+gK2lgjLdafxQxkeeiN309+zVTGG96ozuztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgBNSK4ySIw3VgQKwYgVCvAqc9nYi/Toq0XR0gV2Rc=;
 b=TdDvLfVdFoA0hKJraW1C8g5v6NjwrvFwN1PmNAIv9k6eqaMmYm/ShFWaHEqznqAF+MWJoDQ3bK4g4tf6M7pgUNe8dKrEgfTStOQltorwKLXfecIZ5XJgorhjn/vFcVI2/beX5rPMP/bxEv0jZj3ER8O5bf+1A16rj15yti0wkkpNhy75h4BsQ9wbjXlldcI90+rBP19+vKIsPsY6eU1zri8oYktdMlQsX0r2bLF++wIMvwjZIcxR2Gsz+RUokLPW7GijtFzFZmvtKy7lPUqmt/QupJFbcRDLpEEDGe4+bU5zN9/+zECwT/CPvqn+dH4opbFfkBOgxF86riYxNZHlnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:52:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 11:52:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 24 Mar 2025 19:51:27 +0800
Subject: [PATCH v2 1/3] ASoC: codec: wcd939x: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-wcd-gpiod-v2-1-773f67ce3b56@nxp.com>
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, Johan Hovold <johan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742817094; l=2626;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=70jr6uAvczABhCM5Jlgve8nrHarquKaD/mWAZ0z+24s=;
 b=IeaXLnWbBlYiwkkX700XtWUHNv9wjbI3oxxTyXqVppIyVHKJKg3w/Do1t7iGx+LGQqNeujLq+
 di1keOpsT33ADLuAI+mnbJA71SU1fPQc65q0qBF62gIRhscJWjFS55/
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 6399d413-c25d-4631-9a69-08dd6aca5ec8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmZLeHVJck90SGhMdmUvTkZ2K2dZcXdJVXhGUnlBYWhLWWh3SGthR2ZHMFJB?=
 =?utf-8?B?MC9pTC8zR3F3TWJ3dndJRngxelFqWUJ5bDZUSExvUEp4MjB5QWJMRFZYcTk1?=
 =?utf-8?B?d3I5eHRHdERjTm4rNjd4cjlYMU9TTHVEdWpJd2w4MHFxVUdOdld3eC9XT1lW?=
 =?utf-8?B?dXlXVnZNL2hrS2p3a0NlR2VoQW14RTMxZ29pYUVsMFh3VmNEWkEyd1NiWW1z?=
 =?utf-8?B?VWthQ09PajhFM2FsYytnT0FpVWpoYUJJc0t4WE1yeWswUjNBcmZhQXNDZ3Rt?=
 =?utf-8?B?eFVNNWRLNTFQMzZHcVJaR25yNXlIS28zY1ZSUVpXTUxGNjQyVFgyZC91ZHVC?=
 =?utf-8?B?S1ZaTEtoaXVWOEx2VG1aMnhhRG9LSFhLaTF5ei9lZDNWZ1RqaWV3MWlHNG1V?=
 =?utf-8?B?OEJPR3owOXRtNGhrSEZsN0dJWmY4d3pKeWNoTXAwUmVvYW5IKzg3UWdlQStw?=
 =?utf-8?B?ZWpzUDhydFA0L0lvM3VtWmwraGdaMTRlVGR3b0ppNWx2ZWdiaWpXZFJmMmRB?=
 =?utf-8?B?aXh0TjF1eFdNRXp4OFpEM2dnMDN4MVlGV09xcjJ3VVdYVFg3d2VjK1F2WmVC?=
 =?utf-8?B?TExIWjc0Wk5kZGpsWU1xRWxjemQvM014bXhneVhIYkZSRUVER1VnSHIxT3Zn?=
 =?utf-8?B?V2psUnlvdE5zUzMySHJMMk9EWHA1MmczZTZHNzRDN2JSaEdQeUtsSTQxMHNH?=
 =?utf-8?B?cUlHd2NZaWlRMUFOaHkzV2xwWlFySno2RmVheHprKzRkaGhyVTNQcjhlSkda?=
 =?utf-8?B?OVhtSmltbktnZVhUVWkyWjFmU25PMG82MTZDVS9EemxGVkdRRFpCVGdndi9r?=
 =?utf-8?B?ay9JbzBUaS9XMy9hWjAxMFJvSUNaTmtWdEFnbTRHeEcyYmtrY28yQURPZTl4?=
 =?utf-8?B?SytNWUtUSXNxSXBaKzJpTmN3ZXpJeUlhODBJL01zNU5tdTI5b0YyNEE5MFU0?=
 =?utf-8?B?cytxMjdSR2FBbkFJVCt4ZjgzdkZvQk1Jeis0RzNDM3FVWDNsN204c3hsL1RE?=
 =?utf-8?B?ZmRlTDhiNTllN0UyeGZBbUl6U25uZlE2YXFqc01SWTVnQXd6aXhtb290SzRo?=
 =?utf-8?B?Lzk1ckRhWmFyMllIU1FoZ2l4QXRnZHpDRFU5blZNOE1MM1ZkeDc1R2VwU3kw?=
 =?utf-8?B?YzZBZ3FlSkFiUXJLUUUzdWJMUHREZC9uNVVCQzVsdFNBYTNpdzhWVVpBUjFJ?=
 =?utf-8?B?TG5zZ0hKVUNqb0lmTC85YnV4bEtiYU0rR2hFVVJMQytvMkZQNDNENzNMeHRF?=
 =?utf-8?B?U1ZRRkZDOEhKbFFiaDVjZ0RxS0FIR3h5Y3VoaUhWUU51MzB2YndUSlhNL1BO?=
 =?utf-8?B?YWJNS2NkTVBJU09UZzBRK0UvTlVza2xFYlpIRkgwZ1FuWURMUkxkcjJET2dS?=
 =?utf-8?B?cXdHWlp4c2NjaHd2M1cvREV6UkRYSjdZa2YvRDFoZmJPd3lsWDBUMVNJcHJD?=
 =?utf-8?B?MmV6aEJFR3NrRUM5c2lhY1BBYWpWZHhnTEtWb1hDQ3BnaVQ2QzhjZk9lRjVI?=
 =?utf-8?B?UkVHdGZmMDBFYlhCZnV6YitpR2ttc0pmdi81ZmRHWkxidkNFckZSbU9lME4w?=
 =?utf-8?B?c3RuMFB1R3FNdDVLOGNLb3FVUTMyWEFBbWk3YUNYc01uZjNMQk9SZUFJbG5O?=
 =?utf-8?B?THRpS3dyVUl0YVZXQjRLbm1hZzFSRE8ySmhQZVBJS2hEY3NrQ3Z2N1FHN2RT?=
 =?utf-8?B?TCtMbEIwQ2xCcG9GOE9UWFI2NmJhMFhPdC9nU1V2ejQySHhhT29leG9PT0hy?=
 =?utf-8?B?dDJ5K3kySW85OWg5U0dOQWszYWNxNk53QzA3OWVCYUtDZVNuaGFhbFpxRHlj?=
 =?utf-8?B?a2doUi92RytiWW9hdUdFMnhTYUtFUnlsMTZjWnh6eHBBelUzZkcrbGpNZlZR?=
 =?utf-8?B?a2xzVnErY3BDU0Z2SE5SNThtYUk0bEYrVEVLbFJ0RFRBOUlOclA2VlRZNDBM?=
 =?utf-8?Q?wXYqPvEypVI0N3tZVBa2liNY+38dPI/b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUVsOHNpYUFFaG96Y2FRWEl5aGJKQVVxRmF6SXF2MEUwRHN4RVVGTE90dDJ3?=
 =?utf-8?B?K0toT3lhaFUxd3pNMVNaUkxmNXJtakdLbnpVR0xCaEttU2RVcERTT2Y5ZTMx?=
 =?utf-8?B?TjA2RGV5eXB1bmJzcHVPZDBsYUNTQnIxK0NYdEVNQ0tvRU9KUS9rV3BVR29w?=
 =?utf-8?B?YWRxRmRVaG5NcWhiNnpqeG1CTkFLQ1MxMWRjMENBampweko3Y1ZUcmYvZlVQ?=
 =?utf-8?B?YUdqQlZhRG1KY1NIMFdHTEpuZlloL0lRc2tXY0lIWXdhdTJUZXBKYXZBdVpT?=
 =?utf-8?B?S2pYUkFzczFxK3VjOFlZQjdNMDFvTFdGYkV6N3VNOWRhK002MFlDTElUOWxp?=
 =?utf-8?B?eHFVMUpEYUxUSHVSdHI1U3dwUmx5YVF5TU1UeU1pTGxDQUd2bCt2TjU1Qm5L?=
 =?utf-8?B?Q3JBUUFjU3hDNzFTbnF3VUQ0WjgySnJqdzhVUExUSmNkMStNcDcyenBSUjAv?=
 =?utf-8?B?M00wUGx6KzIvZDlma0hSWTFMeFBQM3Nvb3BIalJ3RTdQeURTcHZwMFpNNSty?=
 =?utf-8?B?ZU5qNzlBYUZFVFBxUWpkWWJIVTJzOGZLcHptSmJpcE9SdHFQa0M2b0ZpZHRm?=
 =?utf-8?B?Yms5ZlZwU2dUcS9Bb3FteUVnSGpCQjlmRmhCZUNNUWpjcUpxeGZxQW16QzhK?=
 =?utf-8?B?cXNYaURiSy9lOVhYc3FTL0s4RSswem9lVTVKYVRZQ3RqVVhWcFNTY2hGM054?=
 =?utf-8?B?TzVrLzZ1bUllTW9XSUgyN3cvQ29DR3FUNm05WmZpcVIycmN4c0VpS0JJN28r?=
 =?utf-8?B?Rm9xTGZGZ0xDOEloTHZ2UlBLdVBnNXlBeUdxams1SHhsSTRzbGJkMFh2YmRD?=
 =?utf-8?B?WUxUWWtIOFl4UnJ5a29rYjV4VHR6MVFJM2pmY0J5SXhZRkxPemxVL1FYN3lr?=
 =?utf-8?B?K2gvaW8wMW4zVVY5bzdQSlFEYUFmTE5Rc1VEMVo1Tm1GUUR5aVAwUHg5Yzdr?=
 =?utf-8?B?Yk1wUjl6bkViTUpheFFKeTNwYkNQc1dLR3MrR3lOUnBGbmNpNmdLSGd0QjRB?=
 =?utf-8?B?MTJzOFNkeVlZdFd2VFRyenc4MXZobTR2RE5xZFZqNDVvOWJtWS9OUHV4T2Fr?=
 =?utf-8?B?VzlIUzFpeUV3amdxRVdIbWtaRzFRMHFLSkhUa09vd1V3NWYyaFQ1RURtNEtz?=
 =?utf-8?B?b0dKTVRwY0VpSmhPeEtVZFNsYzduSURkank0SjRhd3QzUXBnNWlmNjFlYzJv?=
 =?utf-8?B?SXlib2RzQzlGREVUcVNwdEtuRGZZNW5TRm1pQnZPeVg2dE5hSk12N0pIdG9o?=
 =?utf-8?B?YUY0ckFaRkdqYi9uOFl0UUlOOCt1Yk1OeGFuaU5OUjFOYTBtcTlNTEdPYjd5?=
 =?utf-8?B?YjZOM3N0c0FPaHA0QVNpTUcrUmc5T2dWbWJRVGxncjd5YzlQS0FGelh0MlpK?=
 =?utf-8?B?RUs1cU5rdkl5L1pWakFoYjY5R0Q2QWh5ci9iV0xsZzJrbmZkb0VkVFBZZTM0?=
 =?utf-8?B?WkRvWFVFZThUN2Y1SzF3NU4xV2x5bXhLRitkVTVtMVJqZjU2eWdFVGxIVklu?=
 =?utf-8?B?RzJuZ1dEYll2R0Z4TzBzUWNZYXdIeVcvVkxQcDhXWk1GaVQ3ODVJZzQwa1JX?=
 =?utf-8?B?VExUVGc2U2lraWRmQ0c1NHBGc1B5MzRIdHBjOTJXN3Q2QVN5T3FJTTF3WW1r?=
 =?utf-8?B?TzBwT2twYzBXR21CelozMkFYZ1JEWFNWWU5yMWlkWW5ONWRwT2swRVArd3ha?=
 =?utf-8?B?WFZMZGtZWjRSc3ZiMUw0NUZWNFFGS3BzSTVxUmV5dVdkeW1DSlhMb2EvYUhQ?=
 =?utf-8?B?dFA1aGlIdnMyQll1WXY1OGhHUjZCYm5XajNIUVJ2a2lhRUNvQTJxbGZBRE5U?=
 =?utf-8?B?cXpCYmxZenc2bThhTE1qL3R5TjZzdzBEZEtnektIblJxWnBtRFVua3dweDE4?=
 =?utf-8?B?TnhWVk1OekJSbmYvbFhZY21sdFZONVBwZTlUenBxV1hKOHg2WUxla1RoT0xw?=
 =?utf-8?B?TnR1Mlo0OFdxdHl0OXd6OENVYXpoRU1zZHVKMGlkTkVsalQzTk9YNkozSkZo?=
 =?utf-8?B?anlDL2ZicGdWK1FzSWhEZVFqNHVxWWdPTUEwN25xNTk4V1o2M3ZsLzU5L2JE?=
 =?utf-8?B?RXFjTUp4VG1MUHAzVjRTMjVpWWtyZVdHdEU5OU5wZytMYmZCUTJBTDE1T2kw?=
 =?utf-8?Q?wc7TG+mf5b/ygls+xgmSinjG7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6399d413-c25d-4631-9a69-08dd6aca5ec8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:52:36.4562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RltyDcxBctdLFSBfyWVLVr2nD+Sem+9VutHhkfVeOe/XZeTKx9ORe9V9R0e8QEF8FRt3zwXKz0Mqn8fsQDCGzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use dev_gpiod_get to get GPIO descriptor.
 - Use gpiod_set_value to configure output value.

With legacy of_gpio API, the driver set gpio value 0 to assert reset,
and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 means
output low, set value 0 means output high with gpiod API.

The in-tree DTS files have the right polarity set up already so we
can expect this to "just work".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/wcd939x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 0a87a79772da6c0ed3c7dd7d098e949b9cead2a4..837c86ceb1097254f4029087ce401c5a8645bf21 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -15,7 +15,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/of.h>
 #include <sound/jack.h>
@@ -201,7 +200,7 @@ struct wcd939x_priv {
 	u32 hph_mode;
 	u32 tx_mode[TX_ADC_MAX];
 	int variant;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -3239,10 +3238,11 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 #endif /* CONFIG_TYPEC */
 	int ret;
 
-	wcd939x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd939x->reset_gpio < 0)
-		return dev_err_probe(dev, wcd939x->reset_gpio,
-				     "Failed to get reset gpio\n");
+	wcd939x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(wcd939x->reset_gpio)) {
+		ret = PTR_ERR(wcd939x->reset_gpio);
+		return dev_err_probe(dev, ret, "Failed to get reset gpio\n");
+	}
 
 	wcd939x->supplies[0].supply = "vdd-rxtx";
 	wcd939x->supplies[1].supply = "vdd-io";
@@ -3290,10 +3290,10 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 
 static int wcd939x_reset(struct wcd939x_priv *wcd939x)
 {
-	gpio_direction_output(wcd939x->reset_gpio, 0);
+	gpiod_set_value(wcd939x->reset_gpio, 1);
 	/* 20us sleep required after pulling the reset gpio to LOW */
 	usleep_range(20, 30);
-	gpio_set_value(wcd939x->reset_gpio, 1);
+	gpiod_set_value(wcd939x->reset_gpio, 0);
 	/* 20us sleep required after pulling the reset gpio to HIGH */
 	usleep_range(20, 30);
 

-- 
2.37.1


