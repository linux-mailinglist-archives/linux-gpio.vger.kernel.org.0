Return-Path: <linux-gpio+bounces-19372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F866A9E622
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8433BC7F8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E16F1C5D7B;
	Mon, 28 Apr 2025 02:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WPioakRr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47D1C5D63;
	Mon, 28 Apr 2025 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806261; cv=fail; b=fqqIoFkH1mn852PKhu9V32nsjPG3Bs17Wr+pQLf4Zz1EkdUOeEXteJaMXow9OMoK2AQckzFp+usLSQwsddFAAMhEjol8VjdwX4IKx8EKCxP2ZYLJKWpQnEEAGW0LtaIv3o7TIzlm5Dc//vD+zuDQaE0McCioUvEdczy1uTLBDy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806261; c=relaxed/simple;
	bh=8n74JpaJd8SEiBdM5D64PuEs8zkPjwC+sVMiQCsHB6s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kvZBpnywg4SYDKF03mKL7fvm0VvAuvSaqHAW4VOwhEul6y011Drz5NTjbirdhnvL6+Pc6/8zD7NTmJeYEHZpb091LvJbxeXmUuc1ceB3D02w+pVkP8wWBRXmI8pVIYay8f7AvYubWi8N2iNWvdFouPkUvkenNgMUruTpGVYTzYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WPioakRr; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRidNis0/NbnFuM39+VUYnd3DgR8Bo6hmlZtLl0ssCAT85ehbvBHAnd5S132GQsexFNie0qD4m3DVYmGfIzw6uG8uvtCGqbS+u8wjLEeLNZATOFbGBhflpFclfqKnpH1N2Bhn7PEqPnbFMNTkZhVk1gfvFaNRXM4bv1NHVZH3UiiW9SXomFO/SteEIFVtlMkgErQL6AgBsJDiOthSCvnXTCOX0pbNGOkt4ji3an1hit/rpuJrTXgMRThpaUREEDuQ0Bp8gCaXmMDTm+7OdZhCVkmYSiW93WqFeXKDHtrkoqwleho/BsZBAIOpEMkWgUHqf1TcPQVuk887sbqykc87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuSDkgF1rArvMyxQXpJysk3JPN72vmz9Br3JUxiPA2s=;
 b=UL5YJDKIFquDMLodabGXdcJRUyk7+ElPOL8bsPspKYg74HhPmYpIchKklXdTctkwFnRGI7qRJUUReGzuhDeITP/fUNcXiY72TExPZ1XVOQ2+1gufcVNsWyW/97AVGyfc5oqMTODhrH87iA385/6d7RSHQkuxuPsgYq0fFY6hVHLx/jPW2QWh3QQUcKhreBH9c9QKV2i6S1vV8mZYEO2cQk/EpvtakkWJD/Qfy7F0Js/eyXEOddZkXvg6U5SepCOn8qP0E6xUWcVpnmL5fTkcwxoK5a89py58bdWCrItMlXy58Pf0vIbJaujbPRe5hEm/ri547Jd0uh7UYCIhsZ6rhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuSDkgF1rArvMyxQXpJysk3JPN72vmz9Br3JUxiPA2s=;
 b=WPioakRrJLf3rkwSJXLHmN380a+Y0H+Vhfx0riy0HXikREXExsC9aT5nM/0c2Jrw4JPF656qbfia11shMZT2lhnybpJRU+LR25zQJ9D4Bo+6GNynkewmC7DozgEiDH0G8TYmi/ZG6MupZK0K7GaLD0gKPxy+5uls+es9IH/47kVC8Qfgt/MsYWTZgUExljzycwuPXsTSLLumu7Z8fPAYLhyeF8m20/tbFYN4nK785rXI99bIBxnXocZkYr32Li0TbmKakAtFiYf1huSVJDjt5TEmgtxVJp240WgpuWaU8L53CNaxnot9nyKuzW2z0+HIMu05zrO1A5HM6Q5dqc/eHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:08 +0800
Subject: [PATCH v2 7/9] ASoC: codec: cs42l52: Sort headers alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-7-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=1427;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PMZRjDpt688WDjiwQ+z2E0Ozl5KXy1gAZEh02jgL4rk=;
 b=uXHtdejsv5cdIiDaa0TVk8yIRYMrMGy52xnJoPEHu7giqWkXi+DTslifRkar9EDcyKqaYS/EJ
 dWw/6rfnzPCC7JqjdSmDNYr8ZeOL4yIM3E4AoPJQfa5RR2hH0sY3eMv
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
X-MS-Office365-Filtering-Correlation-Id: 1e949426-c483-4d5f-233b-08dd85f9e8db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0FqbzlETi80K2xpRXVIcmxjOWhyQTRuenlhQ3BCTTArTUlUbStEOVlCR2Vy?=
 =?utf-8?B?eStYZDJqVmRoQWgwWCtmZ0tpazAza3YxOFF5Y21sWElZU2pUNDluenpHQXo3?=
 =?utf-8?B?YWcwTFkxVVBsZVppSEppZWJMU2xEVmwvNnFrSUNNMm14SE9CQmMveit2MjBq?=
 =?utf-8?B?N0gra3BoRkQ3cjRkSjhlTk8xeGVrVCtmSU5rVFRSYTc5WGM3TnIwZ3lMd2Zm?=
 =?utf-8?B?QXU5c0FjcGZ3ZXZoTy9sRXRsa2thSU9hTTM3aWlSamROT3hsN2hBVHN0enRW?=
 =?utf-8?B?M0hrdW9jazZKQS82b1FqQ0gvYXlvZ3NqY0IrMWlkTFpMRHFQdC95WVd1eGpF?=
 =?utf-8?B?UzBMam1mM0ozZTYrbEk3RWc5NVQ2YUFKMmh3czQ4ZTJ2L2NYV01tVm9wSXpP?=
 =?utf-8?B?ZnFKWmVtZ2p5MWo4SlQwWFpNNVd1WndGZXVNWVlwUXNYejB4bkhWMUpETXhx?=
 =?utf-8?B?TUFpNHBaZDVLL2cydzFYbFZPK0ZGdTc2ZC9TOHpRMllGb29WV1VzcDZGNjVk?=
 =?utf-8?B?c3BHWmN5NzNWeDlhV2FDeGpXVjB4MXRZU1RyY0xBTFc0blBpNzMwQW5TNmdj?=
 =?utf-8?B?NDZ6SG1xWlUzUkxKYkRnd0FTcm5kQmZtYUx5dURtL2JnV0JocnFFNEJiSGlN?=
 =?utf-8?B?bUk0U1crc2k1djZyN3grdkxsMmF1TndRMFZ3YmtDbm55MFF5YWxRMEM0NEUx?=
 =?utf-8?B?Qlc0VlRuN2tvV0lNa2tiQXV6V3lWVUU2U3dINm9IQ1RpTVRrZ0Fpa2FLb2dG?=
 =?utf-8?B?amlIeWNEb2VyV0dDc2R6c1FLeG5EZmlSNmdadmtDYXhhU1I3NlNrNXZ4YWhi?=
 =?utf-8?B?MTh3U3l6eWtLbzlJcGZTb21XejVxMWZXK0ZjalVWRHk1c1VkdmlqUWtLZko4?=
 =?utf-8?B?TUpZSHlNYnV4cUVTcnQvWGhwRGlLenB3eGdLTldLODAvWkJPc3FIUS9TZUsr?=
 =?utf-8?B?d01rNndVaXQyaWlKamFpRFNMdlZ0dHFyWVZXZmhRWWxYR2FUenRnNVVPdnY4?=
 =?utf-8?B?cTR3ZE9XUFMyd2t6TEora2FQdEJUV0l4cHlaSzQzdDM4Wm04NWZucmdxVmJn?=
 =?utf-8?B?dE9jVXQzT2Q5cVZNdjFZQ3NSUTdQT244SXN2alBnNlZyUndLcmxwQ0hmSUtB?=
 =?utf-8?B?TElYQytiNDkwSXFpZGxMTG01SFV0bCt4a0hhYTRPa2g1azR2akYzTzFKMlBn?=
 =?utf-8?B?TlI2MlBDZWU5QUV2V2g3azViMGhrSXQxQTloT2VHK3RTWmFRdktlRHlDTHNj?=
 =?utf-8?B?Sm1qT1MycnBseno1Yk1SSHZjS1RRRnJyZWlJeDZvR0pEWGVaciszRXhUTUtW?=
 =?utf-8?B?aFNNZVdQOTNmc0ViejlFTGduYWUxOFNjd2pQbU1JeERqQzJ0QjBYdFZxOGNt?=
 =?utf-8?B?SG9nbjFtV3lCSFNGcTQyY2g3L0U2aW43YkplYTVCRDQ4aDROK3I0dnZRK1dR?=
 =?utf-8?B?ajkvdGgwUFJOc3ZlTUhRWTF1aTBHbnJRRlh0L0xqSXo0NFl2Q2V1YW9XRlh4?=
 =?utf-8?B?bzI5aFFXdmRKMTVMWDZ5RTA1bDJjV1o0ZUJjRFg3eWVyaG1qYVlJK0FraGJG?=
 =?utf-8?B?M0w0eUdQSUhZd014dGZRUWY5RGo1T3lGOG4zQ1dKcElPOVZuTGN2bDMrbGVh?=
 =?utf-8?B?SnpoUGd3N2M2TkowOVJWUnVYZ0tVSWFaUktzbHc5cVV2SHl0OXdmMm1Saldr?=
 =?utf-8?B?L1hDdTA3cXk3SXBkSTRDL3NqSjFRV0krWXVlUGlxT1poRVAvK0h1aVpiRmov?=
 =?utf-8?B?WjdUMTF0aUxTbGc2aHhMMlUxVGhRNWo3STYrOHJ6TVBzalpBY2FPNGxCZWtE?=
 =?utf-8?B?UVkwcDJaWHYwVmc4VTNnNDgrU3V0enQvYWlHN1g3Z3JuMkUrai9lUUpDdk9J?=
 =?utf-8?B?SmxOVTVkc1kySm9KbzNRaUZyR3h6QS82N1cwR0RoYXU5VmgwYU1uMjNQNlpT?=
 =?utf-8?B?U0JlNnE0aDdLQzJ3Y2ZudUM0VlQ1V254L1dSbWFjc3MvNjJtWFlSMm5JaDIz?=
 =?utf-8?B?cHVNRWdtcFlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lzM3RJT0FVTTlRUzVXdjBZbDdhZExOeVRtaEVWMHpPZWk4MnhnNlE2UGJj?=
 =?utf-8?B?YTI0RElqQ2JwcWNYQm13czZQVjZpTjNhS1lMdnQ1NHVvTm95bFZhYkkrOEtD?=
 =?utf-8?B?cFIxVDJoc2NMTDFKMnpucFBxUkh0THZlcEppUTFsdFF5N3VSTEc4RCswdlZq?=
 =?utf-8?B?L1dyUGJBblRHeU8zRjR5cTVMeEVkNWgyWFk0SUtFNkc3aU9CeExJRDlvODFu?=
 =?utf-8?B?ZDhINkNOWjFJK250dmUxL2xodDNGZTlsK1paQnU5Ti8wNlYzcHRoZlFSYUJX?=
 =?utf-8?B?d3pLS3BhQTJGdXlFeXBLNnRJUS9nQXlObnpvL3gxL2VBVWxKcnVueStNV1BV?=
 =?utf-8?B?aVR1Y1Y1RThrcWpWaHRLRTZhM3E0VVpGVWJLc0NmSFIvSVAvTkhQRkR6SEw4?=
 =?utf-8?B?THhsR0k0Q1BRWnhrUGNXeDV5VTNLamFuSUxUR3ZicWo2OGJsUzZqdkJzWng1?=
 =?utf-8?B?MUtvYlZVSVVsRVcydjNvQys3T1pHa3VJSW1QanRUc2RTSWlNU3RCYXl0ZDk5?=
 =?utf-8?B?ckJyelkvaitUZ2g0MVZGUThaQ2JqTjlDMGlDdUxKTWw0T3A3eWhscGZqZWpK?=
 =?utf-8?B?ODloT1JHazRLcVFKTUsyeWczV3UzS3NVdk1JejBVUDRKT2F6Mi94Z0hFRms3?=
 =?utf-8?B?eHlXOHBVL2E5eEdaTzRMam9nT2Y4bHRpaGI1L1dkNmxxNUlHOTJNNEVDVDJ1?=
 =?utf-8?B?Qkk3TEJJeDZSL0NXbmROS3VGNERxYjQ3L3hUR3ArTGhvbTRRQ1hkTkdVM1JB?=
 =?utf-8?B?TWw1Slg5Q3FFbVBGMzl0N0IrVVZhc1lRbXlrNUpNUUpOaWlSTDRidXZlQzFm?=
 =?utf-8?B?MWFRVmhIelRrYXVBVjh5ZzJZMzIxamM4SUdiZ3k3V2pPYlVSQmFuNnVpdmFF?=
 =?utf-8?B?Uk9qVHFVMWtUVTJRMldpQlQ1QVdOc2EyQVZJM1c4M0Y5V0c0c3k1S01DR2xQ?=
 =?utf-8?B?TDQvWitjcmJyNzJVeVFsZmp6UDI4S2h2dm0zMFI1Q1BpWTYyQlIzaVlNMk0x?=
 =?utf-8?B?ZmlBQm9rZ1pvYkNKV1c1VXd4MGRwTWNMcG80R1Jkd3Z0ZVVGWmU5b2VHMkVn?=
 =?utf-8?B?aU5teVhmM1NxbzJibzM4ZVIzV09uMlVnYUpCM0EzK0w0R3I3eGNxSDJMVFQ2?=
 =?utf-8?B?T1VhUzZGaUJNZTVOdkM3K1liM1hveWlXaUg1M2NhaWtyL3FuUDR6dlR5Z2l6?=
 =?utf-8?B?aXJYSFZxUUtldEpFWGdlZUxiaWlNbGJ1MDhJdFJCY3BUaWVQbzZQd2VsRnNC?=
 =?utf-8?B?VTF1WjNZdlpHOW40YUh2d1BuOVJOUzZKcmtsbDJ6NE5pSEduUUxsTTZvTFNl?=
 =?utf-8?B?U1FqSWRYb0tROGR2UkN0c0Z5dlh3aW4yK3QzNXVlMmJENnJQQ2JFbEgyTjNI?=
 =?utf-8?B?TFA0NWJxWTdMNnZnYUNiWWNvOURsblZZOUhYU1ZwTEZnSWkrM0htQjFKdlJq?=
 =?utf-8?B?b0trRXg4MUtNTmlFRkswelh4NUdtTWRnSzVzT1ZpY0RFdE51QjducEpjeXBR?=
 =?utf-8?B?VTI5TTdXdGNYYXBnaW4rQlFTby9FOHVVNmxNenF2cUw3SEgxWlhZNjhWbnY4?=
 =?utf-8?B?MVJMNUdMTzdNUE9yeDlGUWRpcW9IbEdxOWZGZkd1cExKb2U5eGF4RTNaNmty?=
 =?utf-8?B?NllZb3dRQnVBRnhEQjlyS0htTXV3dndQczliRVhEOHRraEFrcjFIVmx1UVEv?=
 =?utf-8?B?OWZQWllGT1hMZzlzaFVlTHdVSnpPQmJ2THdocDNtaDVTL3Voc1Q1K2lPT2JD?=
 =?utf-8?B?VG51eHlpOHpTekNuSGpsTzlCWkRkVHJmWjAzTGxqaVVMWXZPZjFzc0ppYzNE?=
 =?utf-8?B?dkdnbVVLU1FkY3NJZXNCRGo2UWN6cnFRZzVWVHVoc2VQaTdFa0t1M000d2dD?=
 =?utf-8?B?KzhIa0tSWlJSeG1oRlpUYkNxaXhQWi9IbGRhOUZ1UnNFMUh5VGV0WUxPLzlO?=
 =?utf-8?B?UWMzM1paOFV4SVFMWmlkU0YrMGkwaktKZzBMMVE2cUVUVzJUZFlxUU83L0xv?=
 =?utf-8?B?SmFhd3lBelp0dzhxQm1yaEo0T1oyU2NvaDlUNUJkRnY4QU9sMVJMMS9CS1hE?=
 =?utf-8?B?S3NBeTB6Qm5NaEk2a1VQbmFtdm45b2x5ZU1NODdDL1M5cGprcUFFMjlacUxp?=
 =?utf-8?Q?lfwP/Std75aObYtFJ+p3EPE/D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e949426-c483-4d5f-233b-08dd85f9e8db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:55.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxI8Ga43lQIOl6+mdl9sNGXoPdSVqSsSWK/AUxI87wn86S3furv6NeEV4y4eEaSQualfSjuCTqO2MoSy1t0i2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

Sort headers alphabetically to easily insert new ones
and drop unused ones.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l52.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index cd3f92c19045ad32f1f0f0f1764390640d68eb10..ba2ccc818ba6cc1b5fbcfb38e07e9bc8f68c4a6e 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -8,27 +8,27 @@
  * Author: Brian Austin <brian.austin@cirrus.com>
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/of_gpio.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
-#include <linux/input.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/platform_device.h>
 #include <sound/core.h>
+#include <sound/cs42l52.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l52.h>
 #include "cs42l52.h"
 
 struct sp_config {

-- 
2.37.1


