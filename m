Return-Path: <linux-gpio+bounces-40071-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bDQZEHNcVmoi4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40071-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:57:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E19AE756B67
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 17:57:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=advantech.com header.s=selector2 header.b=JzLGVzwp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40071-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40071-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=advantech.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DBB830AA98A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3B2496906;
	Tue, 14 Jul 2026 15:55:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023088.outbound.protection.outlook.com [40.107.44.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DF4968E7;
	Tue, 14 Jul 2026 15:55:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044545; cv=fail; b=nLQ9n/RbqUEKlbwf1/3uyMUORX5QCfX2Fvqw8uEx/eqyP13i8wANhgb5V35VzTwv7JyD1p0Tb1XG5cjm7/D1F50LQN0x2A6uXw65cGMZ5VzKB7DCrf8usNXWVd4iJ66Rh296TlA+amaonUFH0horiPDeiFPo22Bhi7aSyeAgI08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044545; c=relaxed/simple;
	bh=oou5EX6wko0UQV1pGcLo6KFSWBrfZXvtu2v9g4IUFYQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AG8Joq8DuSJHK+tQWpbKAyO2sQJ8Vp60LxNajED3v7sOJ23D2OfLWYi8n1uw/R1QXg8mDtC880eXlKypYL4es02EQpszjaLL//efH0i3BVhST8ET6APLF0ppsmkmPJHhFUGOhaCb6zZu1nua/0jRjb3dzBshmDeQH6yY1kAORLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=JzLGVzwp; arc=fail smtp.client-ip=40.107.44.88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9LyEOhneifpN9qSCQTlrUwS3e+sXcx7EDF46SlO1FCZDIFC/Wgh9zDnfvuEgyBSUuiXyKqnWgvO1VnJX0S/ctHCqEc/cWlnQheRRCyF5DinifLKJu61t1FOXZuT6MCcdON+tSz2zkcrbMnR90qcABeCh9ZrqGdzei38lcLaAW614JDx/QXAxnK5m7qGOx6IyjYqH5f+WtWkUn2KYXqAeELyCsPcNeHRa/I8iN7PJre9h1IE/HTqhXycAvQt3EfHMzNh6t0gIfRef1ujRCh/Vk84MhDz+RxMzYtCLwhnWiP10bClhE+9hzWnfEXOwP6c7Fl3o7p6R/j4bqywvYdFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk9LJQQw4sZQVdRKE2JlB7HEHAS42YR0iXpC+U/843U=;
 b=XEgQzTaIc6aun6FBghvC2sLIOS1wZtE1qu5JL/l4SzZUmbQNrA2hazcebqN28Mk8LEcvIBWNHbpkHzVIyDM4zhLevv7WSkcGYzkSHIf5x1cgYfQAsjJ50puFXJ8zZdcyB4NnuTi9dyH9Lsy2qKZDf2WEU1ZLrMf3HRQp7P3Vly7OdbSaHHZGWFeaUxPDBMzswugRH3W9oQKrw2tWx8YB3cFtCBg9Gncs9CYM8S7IADbY0oQRvE2Nyd3s/rBzQ4ofxOzvWfFYt+Wr7pICnx/T976rrdu3cT9DgMASrjSCmA32WzjFFFBmdz8vymIxj1lUoDLcg9GjRCwVdHDdpBT+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk9LJQQw4sZQVdRKE2JlB7HEHAS42YR0iXpC+U/843U=;
 b=JzLGVzwpP5dP/kfIbc13+tVKy7uypEpcTBdEechZpqodtuFBMCjQ15x2MD27zRJ96368cbaznLl7jVoyeIOvztd1h9HN9sRAXmrlxVgppVCFK7uCjOHKe2aibO+yfHLD5Q58c3Bm+bqKkOfkmSNAgRH92CQkoaiu5S2fQO12HQ+q5tDRXL+uzSLpG5SsPYyWJFh3pvxPG1FS3UthRHvHprg5rmILrc9AvzrtJ95buB764Q3JvQmiZef4+4s//oJKw/5kCxHPS40IEBlaKZmOk1m0LpiglN13ApCA10VpJUDBI2pXrOmNQ3b4nITUFOW58p1GMJzkbDVusVXGQd3gZw==
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by KUXPR02MB8880.apcprd02.prod.outlook.com (2603:1096:d10:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 15:55:38 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::44e6:6433:8000:35aa%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:55:38 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Tue, 14 Jul 2026 17:54:22 +0200
Subject: [PATCH v2 8/8] Add Advantech EIO Fan driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-upstream-v2-v2-8-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
In-Reply-To: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15387;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=oou5EX6wko0UQV1pGcLo6KFSWBrfZXvtu2v9g4IUFYQ=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBqVlu53q3gUkwUYQH8HdAki/DKyAgBrtPVaKwnr
 oqdwmSIkIqJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCalZbuQAKCRDO7dCnvL2w
 CZKzC/0SWurZo5szHyfqYKIFal3m4r7gGIMEbQi65aPuNmQg3Al6QMowRXtTrm10YOC94euhLWV
 q1B3k0COnprwuyTLfQwj0f7pcGkT5ArGz7Ry5RYfOxFecLHPCzbh1LvmUBvNgudI+Uk5grdPg0J
 uX0iDa9ZrFoGiSkt+sQwv8mBqJPZsDDUqVu+OiZyErhHgcLAy0MxejxP2PUuQ79b8tuqbux3q0Z
 EI9sIrcP+XCl7IexQrxuzuuZkFX9B6tk627uxSRVBQ8nnnpHjw792I+50o+XEKKSHNRgndQ7CtP
 4+BYee7kVqVYSdmI4e+P5CMv9GobGPHy57sBTO+TooJoMxcqLEUwaCL4EVBtJOfgcv/0QBVzpXg
 zMsLaJPC0mVLpDNKRIymeNrFHK2vKv6/dY9G7jFLDTp8NcPvrXMgJoYenIpb+4eWBypIadl+yXV
 QGHNpGMLckK9YnVRZYljgy1QfaZDiQXVUHDvjPJv04v+o2NKxZL+vV4NUlarMIogTecBU=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|KUXPR02MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: f86e397f-9116-417a-b839-08dee1c05950
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|23010399003|11063799006|6133799003|56012099006|55112099003|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	DRXHT7buVyLBhWo1P0zwalYHr4ignpVJbbQn7Rjv9SqoZ5RhoHYYrz5cCKAKAAkp/tfoV4nmT9f6T31XygaBvH38i4Hp2nEJGKDwtKUs+da9tqKMNNDgWObZJeUrk7Veqqr2yMvDsxu1/9ent5Vrdip6oRqlWJu2y9yWd1hsI1AV4Tz++ZIufNiwjsaDbWnzT0Zce1io1ql1nkJl22kburR2kytH6M4v698GEf8wGJ1PwuS2MTAdSDkvhzVEBX4qK/ey9uMCpUttjG5rQFo2L3WLGuvAJpugxKl/0kODcZggNoAIRchJpYduukZQT3AhlcYx9MiF42rUd1JVquQC4OCRY0GS1cZZ9TvkXPBR08cKZIvnPLGEMe/0HTN63ehnkTbvaNH7zR5BP3F6masGRcrFFvN8fo0gTDJZR+Nnc1UIG/qZHCnNtuTvpz/Qs6FjdPlnRmcUUBXXimtoktUUPREHiovT+bj8XyUi2SE1WV9ptMnPQlyYf+O9JFjMtCHSsNeRcDOpBmEqnflW1eVnO3O+kCwTqf+ihEZoXnrQ9aXBgqLe1Fda/qSHV7XIWWJQC6bwsi6B2EMnb4CRtCImxc9he6dntsNQNGK1Y9U0GFd8DdDKBz/OVSRn4orBeHdvjElC6SFxn76DGkE2uzW+wQkaFqLvvO4hflp20ZnQINR/w6XbtqSc1jXvhCOUzk+1yhLbahSdJVeV083opHB2KaWF4SqoiH/EILXHcDKSLrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(55112099003)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUMzWjNtbGlRekR6enUvSTVXNVJ1c25UWStGY3ZJM3FEWGFVZUUxUm5zWkJa?=
 =?utf-8?B?Sjh0VHQxY0MzaUNJTGs2OXM1MndMOHJBOU5XNVZWNllyTmh2NmZVcDdhNm1Y?=
 =?utf-8?B?bXBCbHJqSTFTOGJPbko4VDhLRXZKTWlwcXVYYTFZaWZob1BuSmlCR2FnK0Nh?=
 =?utf-8?B?SlNFMnV3ZUh5VXBXUStGaHQwYW1ZYzBxSHdDZGxPcmJ1Zk9rbDNKekFtZk0w?=
 =?utf-8?B?a3lnUHh3VWU1QXBLZFFBMTQyNUpoTWIrcXAxY0l0cmY4MlFlM0tsYW9FaG9P?=
 =?utf-8?B?VW1YY3p4cThnRkhqQVZQazM4ZHh3WTAvK0RSUy9CUk05clAxUnZYenRJczdm?=
 =?utf-8?B?YkNWclNQb2hQb2JRVEdrazZjRG9mWC9JYWgyd2twd1dXSTB4V0hLOHFCUkg4?=
 =?utf-8?B?R2ZDRFlWMnVwZHBZYUZYNG14NldNQlVzcTNPV0pxNjBadGJtTHFyMW1IVG1O?=
 =?utf-8?B?S1gvU2pkWU85bm1jcFk0WmJtZFhIWTgzUnFXQ3gyckhJYitoUHRHelAzYS9F?=
 =?utf-8?B?VWhWUGVDOTdVeTA5NUI5eEtFaVd0REJ4Vjg3N1hTZUdtTDFQcFpMNjZsL1FI?=
 =?utf-8?B?NGZhRU9BakY5OU9tTm8xZTg2LzVHcDhFZTlRQVZ6TUd4TWF0Lzg2OENpbjNR?=
 =?utf-8?B?VkNUQSszU2k5YUkvZndMTGFjY3RSSWRnZmFqTVhjOHZ4WS9sajRZdFRGYk9t?=
 =?utf-8?B?bmhrSGFBMTBYMDE2SFV0VnFEUEh1eDYreEx1WTdxM2VkcDFQVGh3QXJaT21m?=
 =?utf-8?B?SVA5bWNYVU9UMi9CN2xNZ1kxZDltc0tnTldoSXRoN3Q2aHpaeXZSNnh3b3dS?=
 =?utf-8?B?VHd5MFZTVCtlcUFiMmdsSHFwamRqWGw1cTVNWUlBVmpNVExKRDdNcy9EZ1lW?=
 =?utf-8?B?MFRPeFlEQVFzRnYvUzRGWCtZaFAzRnBreG1xYVMzL1JOT094eGdpREs3YjdJ?=
 =?utf-8?B?V3RQd3hCdXpQRGxobWVOcVByNjUzME1Uck50Tnp3MTk4dFowRVFTSVZBbGNt?=
 =?utf-8?B?Sm5WNk8vdzIyMU9IYTlDdmQ2TS9yb1BJa245ODVmZ25UTUhUZldDU21BMGEw?=
 =?utf-8?B?Z3BOaHczTVJUcXZGNisvOVJjM1laOVFBQ2preEhwampRMU1qWkxIUjI5VHhp?=
 =?utf-8?B?bHlMbG53anR2YnVPR3lzNFRIOExhWG5ZZXhYckNlVFZ4MUNKeER1MS9Lc0Jq?=
 =?utf-8?B?aFQwa3Y3MkQrSzFjS2xjUkVKa0Jzd0s2UkhEUFNLcFVIaDh1MjBrNjlHdDNQ?=
 =?utf-8?B?UjFqallZbG1CK3MwOU5IcDBsc3dob2E2dTRRTDlEMzR6QURqcDBEd1pyV2Np?=
 =?utf-8?B?Z0lFb2JBMkM3RXhLRXFuOVpYSmxzbDBSdUNSUXpLMlRvMmN4SmNtMlZBL2h5?=
 =?utf-8?B?SmtQa2pGMzRYUG42aEJXSkJUdEJGaEhGb20zOHhja0x4Mm0xdHpjUlNkeXNJ?=
 =?utf-8?B?Y1VrRHViK3RYaTJLM3U1b1p2Qm5oNzhQVGtreFg5OGZkanM5TWpzNGtzVUpZ?=
 =?utf-8?B?djduMmdnZWlSQk1ZYVlDSE1iemtyZXNYOEU4U3EyWnJUaDQ2Yi95VWpaampK?=
 =?utf-8?B?OWNPZHVsWVhTT2dVaGhmcXpIVTh4TjZzZ2Z3ZmswMWV6M1VvUTVHQ2M4SGJX?=
 =?utf-8?B?ZGlkNHY2eG1DK3U1KzRlY2lMTlpuQmdzejBLc05TTFBRY1gxa2pWOUh0aHE4?=
 =?utf-8?B?Y2hFR3hrcFZqbFFYbTBMaGgxY3FTSUxEcWpNSHE1MEVocHhrK1MrbVNteHlm?=
 =?utf-8?B?aXlsdVdHWWwvWjlLc2RCZ2gvTlVXNDVubVRYL2dkQkdDejBlTHJhNFNsakNl?=
 =?utf-8?B?L1huL3ByemZHUzhlTVlFSFo5TkVMbTZaWnhKYVNqTThwd285VGtrUmlKVVBw?=
 =?utf-8?B?UXZMdDgycnNtRmYrTFlCNUtxeC9hSzdRcHkvcEtNUGZpL1FXZnBCTEpqWCtB?=
 =?utf-8?B?NVNoRExmY05LS1dNR0JPTGlDQ0ZGekN5eGlBUWhsQTB4VHllMTZBOHZDWllD?=
 =?utf-8?B?d3lWWjRHc3I4VzZhMVJsaXlsaldDYUV4N0laL2JNUXU1cGx3dStDMUFvZk8y?=
 =?utf-8?B?NlVOZ211UHRYUFBmVFVEQUNLczNBb01JRVI4bnQxYkx0R0M1V255UWUwTkdr?=
 =?utf-8?B?R284MytsUnRGWC8rSlU4WHNac3RoV2I2N1c1cWFEUVJ6NGJmTzlKdHlhLy9X?=
 =?utf-8?B?ZmRuWGtKVmVWTWxiYU1EV05zeXVpK0ZTeFMzU1JpNnpmVm91TitSS0VHSVJ4?=
 =?utf-8?B?azhZMnlEVExER1JxOTVTeVJDV1huSHBnV1drNDZkNW5QMXFXcm9TWmxibCsx?=
 =?utf-8?B?emVmYXdGdjYvR2Y2aTMwYWlDTElHRkJJR25mVHl2U3dLUS93YXZySVFBYllE?=
 =?utf-8?Q?nODzA053c0YB+fjk=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86e397f-9116-417a-b839-08dee1c05950
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:55:38.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4REQdZmml//hp4r7dZhElX7BuWjK0Jgo8kqKMA+9flzqbH/jr7TThyRvmIDa4WSzEMKva/is8IRHxqXor6RFH2QkcHflZc4hvDACxEm2f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR02MB8880
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[advantech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[advantech.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40071-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:wim@linux-watchdog.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-kernel@vger.kernel.org,m:mfd@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wenkai.chung@advantech.com.tw,m:francisco.aragon-trivino@advantech.com,m:hongzhi.wang@advantech.com,m:mikhail.tsukerman@advantech.com,m:thomas.kastner@advantech.com,m:ramiro.oliveira@advantech.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,gmail.com,gmx.de,linux-watchdog.org,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ramiro.oliveira@advantech.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[advantech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com.tw:email,advantech.com:from_mime,advantech.com:mid,advantech.com:email,advantech.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E19AE756B67

This commit adds the driver to control the Advantech EIO Fan block,
which is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS               |   1 +
 drivers/thermal/Kconfig   |   8 +
 drivers/thermal/Makefile  |   1 +
 drivers/thermal/eio_fan.c | 478 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 488 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ded89e70d6cc..5d5d4ac54030 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -616,6 +616,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/thermal/eio_fan.c
 F:	drivers/thermal/eio_thermal.c
 F:	drivers/video/backlight/eio_bl.c
 F:	drivers/watchdog/eio_wdt.c
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index fc078012a989..a52ec50c8cc5 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -436,6 +436,14 @@ config EIO_THERMAL
 	  the Linux thermal framework. It communicates with the EC through the
 	  EIO MFD core.
 
+config EIO_FAN
+        tristate "Advantech EIO Fan cooling device"
+        depends on MFD_EIO && THERMAL
+        help
+          Fan cooling device for the Advantech EIO. This driver exposes a
+          thermal cooling device with controllable states (e.g. Auto/Manual/PWM).
+          It communicates with the EC through the EIO MFD core.
+
 menu "Mediatek thermal drivers"
 depends on ARCH_MEDIATEK || COMPILE_TEST
 source "drivers/thermal/mediatek/Kconfig"
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 6abce8933e34..872f733b6ad4 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
 obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
 obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
 obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
+obj-$(CONFIG_EIO_FAN)		+= eio_fan.o
 obj-$(CONFIG_EIO_THERMAL)	+= eio_thermal.o
 obj-y				+= intel/
 obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-thermal/
diff --git a/drivers/thermal/eio_fan.c b/drivers/thermal/eio_fan.c
new file mode 100644
index 000000000000..e07b18c2ec44
--- /dev/null
+++ b/drivers/thermal/eio_fan.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * eio_fan
+ * ============
+ * Thermal zone driver for Advantech EIO embedded controller's smart
+ * fan mechanism.
+ *
+ * We create a sysfs 'name' of the zone, point out where the fan is. Such as
+ * CPU0, SYS3, etc.
+ *
+ * The sysfs 'fan_mode' can be one of 'Stop', 'Full', 'Manual' or 'Auto'.
+ * If 'Manual'. You can control fan speed via sysfs 'PWM'.
+ * If it is 'Auto'. It enables the smart fan mechanism as below.
+ *
+ * In EIO chip. The smart fan has 3 trips. When the temperature is:
+ * - Over Temp High(trip0), the Fan runs at the fan PWM High.
+ * - Between Temp Low and Temp High(trip1 - trip0), the fan PWM value slopes
+ *   from PWM Low to PWM High.
+ * - Between Temp Stop and Temp Low(trip2 - trip1), the fan PWM is PWM low.
+ * - Below Temp Stop, the fan stopped.
+ *
+ * (PWM)|
+ *	|
+ * High |............................. ______________
+ * (Max)|			      /:
+ *	|			     / :
+ *	|			    /  :
+ *	|			   /   :
+ *	|			  /    :
+ *	|			 /     :
+ *	|			/      :
+ *	|		       /       :
+ *  Low	|.......... __________/	       :
+ *	|	    |	      :	       :
+ *	|	    |	      :	       :
+ *    0	+===========+---------+--------+-------------
+ *	0	   Stop	     Low      High	(Temp)
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+
+#define CMD_FAN_WRITE		0x24
+#define CMD_FAN_READ		0x25
+#define FAN_MAX			0x04
+
+#define CMD_THERM_WRITE		0x10
+#define CMD_THERM_READ		0x11
+#define THERM_MAX		0x04
+#define THERM_MULTI		100
+
+#define CTRL_STATE		0x00
+#define CTRL_TYPE		0x01
+#define CTRL_CTRL		0x02
+#define CTRL_ERROR		0x04
+#define CTRL_VALUE		0x10
+#define CTRL_INVERT		0x11
+#define CTRL_FREQ		0x12
+#define CTRL_THERM_HIGH		0x13
+#define CTRL_THERM_LOW		0x14
+#define CTRL_THERM_STOP		0x15
+#define CTRL_PWM_HIGH		0x16
+#define CTRL_PWM_LOW		0x17
+#define CTRL_THERM_SRC		0x20
+
+#define CTRLMODE_STOP		0x00
+#define CTRLMODE_FULL		0x01
+#define CTRLMODE_MANUAL		0x02
+#define CTRLMODE_AUTO		0x03
+
+#define DUTY_MAX		100
+#define UNIT_PER_TEMP		10
+#define NAME_SIZE		4
+
+#define TRIP_HIGH		0
+#define TRIP_LOW		1
+#define TRIP_STOP		2
+#define TRIP_NUM		3
+
+/* Bitfields inside CTRL_CTRL */
+#define FAN_MODE_MASK           GENMASK(1, 0)
+#define FAN_SCM_BIT             BIT(2)
+#define FAN_FRAME_BIT           BIT(3)
+#define FAN_SRC_MASK            GENMASK(7, 4)
+
+#define FAN_SRC(val)            (((int)(val)) >> 4)
+
+#ifndef DECI_KELVIN_TO_MILLI_CELSIUS
+#define DECI_KELVIN_TO_MILLI_CELSIUS(t)  ((((t) - 2731) * 100))
+#endif
+
+#ifndef MILLI_CELSIUS_TO_DECI_KELVIN
+#define MILLI_CELSIUS_TO_DECI_KELVIN(t)  ((((t) / 100) + 2731))
+#endif
+
+static const u8 pmc_len[CTRL_THERM_SRC + 1] = {
+/*      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f */
+	1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	1, 1, 4, 2, 2, 2, 1, 1, 2, 2, 2, 0, 0, 0, 0, 0,
+	1,
+};
+
+static const char fan_name[0x20][NAME_SIZE + 1] = {
+	"CPU0", "CPU1", "CPU2", "CPU3", "SYS0", "SYS1", "SYS2", "SYS3",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "OEM0", "OEM1", "OEM2", "OEM3",
+};
+
+struct eio_fan_trip {
+	u8 trip_ctl;
+};
+
+struct eio_fan_dev {
+	struct device *mfd;
+	struct device *dev;
+	u8 id;
+	struct thermal_zone_device *tzd;
+	struct eio_fan_trip trip_priv[TRIP_NUM];
+};
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_FAN_WRITE,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = pmc_len[ctrl],
+		.payload   = (u8 *)data,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_FAN_READ,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = pmc_len[ctrl],
+		.payload   = (u8 *)data,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read_therm(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_READ,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = 2,
+		.payload   = (u8 *)data,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int eio_fan_get_temp(struct thermal_zone_device *tzd, int *temp)
+{
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	struct device *mfd = fan->mfd;
+	u8 ch = fan->id;
+	int sensor = 0;
+	u16 val = 0;
+	int ret;
+
+	ret = pmc_read(mfd, CTRL_CTRL, ch, &sensor);
+	if (ret)
+		return ret;
+
+	ret = pmc_read_therm(mfd, CTRL_VALUE, (u8)FAN_SRC(sensor), &val);
+	if (ret)
+		return ret;
+
+	*temp = DECI_KELVIN_TO_MILLI_CELSIUS(val);
+	return 0;
+}
+
+static int eio_fan_set_trip_temp(struct thermal_zone_device *tzd,
+				 const struct thermal_trip *trip, int temp)
+{
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	const struct eio_fan_trip *fan_trip = trip->priv;
+	u8 ctl = CTRL_THERM_HIGH + fan_trip->trip_ctl;
+	u16 val;
+
+	if (temp < 1000)
+		return -EINVAL;
+
+	val = MILLI_CELSIUS_TO_DECI_KELVIN(temp);
+	return pmc_write(fan->mfd, ctl, fan->id, &val);
+}
+
+static bool eio_fan_should_bind(struct thermal_zone_device *tzd,
+				const struct thermal_trip *trip,
+				struct thermal_cooling_device *cdev,
+				struct cooling_spec *spec)
+{
+	struct eio_fan_dev *tz_fan  = thermal_zone_device_priv(tzd);
+	struct eio_fan_dev *cd_fan  = cdev->devdata;
+
+	if (!tz_fan || !cd_fan)
+		return false;
+
+	if (tz_fan->mfd != cd_fan->mfd || tz_fan->id != cd_fan->id)
+		return false;
+
+	return true;
+}
+
+static const struct thermal_zone_device_ops zone_ops = {
+	.get_temp = eio_fan_get_temp,
+	.set_trip_temp = eio_fan_set_trip_temp,
+	.should_bind   = eio_fan_should_bind,
+};
+
+static int eio_fan_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	*state = 100;
+	return 0;
+}
+
+static int eio_fan_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct eio_fan_dev *fan = cdev->devdata;
+	int fan_mode = 0;
+	u8 duty = 0;
+	int ret = 0;
+
+	*state = 0;
+	ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &fan_mode);
+	if (ret)
+		return ret;
+
+	switch (fan_mode & FAN_MODE_MASK) {
+	case CTRLMODE_STOP:
+		*state = 0;
+		break;
+	case CTRLMODE_FULL:
+		*state = 100;
+		break;
+	case CTRLMODE_AUTO:
+		*state = 0;
+		ret = 0;
+		break;
+	case CTRLMODE_MANUAL:
+		ret = pmc_read(fan->mfd, CTRL_VALUE, fan->id, &duty);
+		if (ret)
+			return ret;
+		duty = (u8)clamp_val(duty, 0, 100);
+		*state = duty;
+		break;
+	default:
+		*state = 0;
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int eio_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct eio_fan_dev *fan = cdev->devdata;
+	u8 ctrl = 0;
+	u8 duty;
+	int ret;
+
+	ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &ctrl);
+	if (ret)
+		return ret;
+
+	if ((ctrl & FAN_MODE_MASK) != CTRLMODE_MANUAL)
+		return -EOPNOTSUPP;
+
+	duty = (u8)clamp_val(state, 0, 100);
+
+	ret = pmc_write(fan->mfd, CTRL_VALUE, fan->id, &duty);
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops cooling_ops = {
+	.get_max_state = eio_fan_get_max_state,
+	.get_cur_state = eio_fan_get_cur_state,
+	.set_cur_state = eio_fan_set_cur_state,
+};
+
+static ssize_t fan_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	static const char * const names[] = { "Stop", "Full", "Manual", "Auto" };
+	struct thermal_zone_device *tzd = dev_get_drvdata(dev);
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	u8 mode = 0;
+
+	int ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &mode);
+
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", names[mode & 0x03]);
+}
+
+static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	static const char * const names[] = { "Stop", "Full", "Manual", "Auto" };
+	struct thermal_zone_device *tzd = dev_get_drvdata(dev);
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	u8 ctrl, newc;
+	int mode_idx, ret;
+
+	for (mode_idx = 0; mode_idx < ARRAY_SIZE(names); mode_idx++) {
+		if (strncasecmp(buf, names[mode_idx], strlen(names[mode_idx])))
+			continue;
+
+		ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &ctrl);
+		if (ret)
+			return -EIO;
+
+		newc  = ctrl & FAN_SRC_MASK;
+
+		switch (mode_idx) {
+		case CTRLMODE_AUTO:
+			newc |= FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_AUTO;
+			break;
+		case CTRLMODE_MANUAL:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_MANUAL;
+			break;
+		case CTRLMODE_FULL:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_FULL;
+			break;
+		case CTRLMODE_STOP:
+		default:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_STOP;
+			break;
+		}
+
+		ret = pmc_write(fan->mfd, CTRL_CTRL, fan->id, &newc);
+		return ret ? ret : count;
+	}
+
+	return -EINVAL;
+}
+
+static DEVICE_ATTR_RW(fan_mode);
+
+static int eio_fan_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int fan_id;
+	int ret;
+
+	if (!dev_get_drvdata(dev->parent)) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (fan_id = 0; fan_id < FAN_MAX; fan_id++) {
+		u8 state = 0, name = 0;
+		int trip_hi = 0, trip_lo = 0, trip_stop = 0;
+		int pwm_hi = 0, pwm_lo = 0;
+		struct eio_fan_dev *fan;
+		struct thermal_zone_device *tzd;
+		struct thermal_cooling_device *cdev;
+
+		if (pmc_read(dev->parent, CTRL_STATE, fan_id, &state) ||
+		    pmc_read(dev->parent, CTRL_TYPE, fan_id, &name) ||
+		    pmc_read(dev->parent, CTRL_THERM_HIGH, fan_id, &trip_hi) ||
+		    pmc_read(dev->parent, CTRL_THERM_LOW, fan_id, &trip_lo) ||
+		    pmc_read(dev->parent, CTRL_THERM_STOP, fan_id, &trip_stop) ||
+		    pmc_read(dev->parent, CTRL_PWM_HIGH, fan_id, &pwm_hi) ||
+		    pmc_read(dev->parent, CTRL_PWM_LOW, fan_id, &pwm_lo)) {
+			dev_info(dev, "fan%u: pmc read error, skipping\n", fan_id);
+			continue;
+		}
+
+		if (!(state & 0x1)) {
+			dev_info(dev, "fan%u: firmware reports disabled\n", fan_id);
+			continue;
+		}
+
+		if (!fan_name[name][0]) {
+			dev_info(dev, "fan%u: unknown name index %u\n", fan_id, name);
+			continue;
+		}
+
+		fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
+		if (!fan)
+			return -ENOMEM;
+
+		fan->mfd = dev->parent;
+		fan->id  = (u8)fan_id;
+
+		fan->trip_priv[TRIP_HIGH].trip_ctl = CTRL_THERM_HIGH;
+		fan->trip_priv[TRIP_LOW].trip_ctl  = CTRL_THERM_LOW;
+		fan->trip_priv[TRIP_STOP].trip_ctl = CTRL_THERM_STOP;
+
+		struct thermal_trip trips[TRIP_NUM] = {
+			[TRIP_HIGH] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_HIGH],
+			},
+			[TRIP_LOW] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_LOW],
+			},
+			[TRIP_STOP] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_STOP],
+			},
+		};
+
+		tzd = thermal_zone_device_register_with_trips(fan_name[name],
+							      trips, TRIP_NUM,
+							      fan,
+							      &zone_ops,
+							      NULL,
+							      0, 0);
+		if (IS_ERR(tzd))
+			return PTR_ERR(tzd);
+
+		cdev = thermal_cooling_device_register(fan_name[name], fan, &cooling_ops);
+		if (IS_ERR(cdev)) {
+			thermal_zone_device_unregister(tzd);
+			dev_err(dev, "fan%u: cdev register failed: %ld\n",
+				fan_id, PTR_ERR(cdev));
+			return PTR_ERR(cdev);
+		}
+
+		dev_set_drvdata(thermal_zone_device(tzd), tzd);
+		ret = device_create_file(thermal_zone_device(tzd), &dev_attr_fan_mode);
+		if (ret)
+			dev_warn(dev, "Error create thermal zone fan_mode sysfs\n");
+	}
+	return 0;
+}
+
+static struct platform_driver eio_fan_driver = {
+	.probe  = eio_fan_probe,
+	.driver = {
+		.name = "eio_fan",
+	},
+};
+
+module_platform_driver(eio_fan_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Fan driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


