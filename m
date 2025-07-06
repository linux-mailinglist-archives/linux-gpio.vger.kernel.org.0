Return-Path: <linux-gpio+bounces-22827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70607AFA279
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 03:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749B8189C40F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 01:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7D41684B4;
	Sun,  6 Jul 2025 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EeOJgeaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3F156C79;
	Sun,  6 Jul 2025 01:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751764001; cv=fail; b=D56R2xhNpFyyen+pO43zqcTk3EHI9FuKJ7jOS3GkEKYWTXfQjKPXLp1DcJJ/NUoh6KzpzODmN7+kDGCjmR+a0VVsgBwbSNL8eQrac3r/5OqVzQEbyXLd/eh76bun/Sa5lEu5gT6lCM88Q9wzLFWevE8PW8eT7aOOKlsM3szQQrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751764001; c=relaxed/simple;
	bh=kMCFW3RMgRt8hBOUlhDKM9LURkbMkVd6f+eEV8nuhwU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WSFtHNBnG9KqkDIxRAeQ8AtdYSdsFoFsuAg28t/WzbJ1hrgC3U81zgar30Qv0FydgpvVD9Tjd6x+IyLC8QZCeiOo05j+lNbLE+gQWnbJ56i/gtwaF6e6z+mnox/X7YglurxExFi7JwvRnlYZGmBgtoudclHWsJ75hmCoDNW3lmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EeOJgeaH; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2Eze6Uf2K1s5/H5i0Hy6kxpbOXwqTL2RxMihTJVwS3T6O1lFgML49JweljdKGskbK8AccM73lYBjrcc82u11XgMM5QS/FJgIL/YoqHUxppG7/4iAQr/gA1PLne/F/Zupp9s3NQ5frW4NzrUH23p0KVHynb1kNxM65u5RezCP4MKdU/qjNzXsmoNY8F4fFHEqK3i01O6YUnXiyahPc/i/7MhJDBd53HFBc0Bsy7kT5q+r+yGu7ges0IDvSHjH4yMLDMaSW1A1fk4xmGBRttRJTmsQU1myjRK04tjvNyIVs/A/ooNwQnn1zSbe8OvSodQ79pbGymDWK31wurGVo3F1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dc1R3fohPM5ucdJACMOn3R5pjHup/cE2rNK9kaoibI=;
 b=n+l0IjhWIQ8rUo9W23nqOqGuLKRHc81dRv2F+meSVcxmhTgcd5Dzt9QJxARa6kgvLah1qt6/J86fqEI+JdAMfbftYrGPkMYooSUgIjpIAvS1Qa5QfwEIMdcE6kjYj8kkPzJ7a+PO8wonlij5/kISUDnc02x3CHcnV1DGyIZ6OoZMtuGF/TBrIQDPppkEHeoksifgDb9YMSj7mCQeLOtvxmiwAwc3FN9FxCjgIIkD2q9PpFxLl9H1UgoimXX+nfciNYujrXTqx86/TU5TJjAywJb3DbgRBbUcUxBKAOKoVMe0U06PuGxxNAMMDvF+XH2Lb2DRTyVAvxY2tJ/WHud66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dc1R3fohPM5ucdJACMOn3R5pjHup/cE2rNK9kaoibI=;
 b=EeOJgeaHYMSyNnmuLtDnAhgFbn4dCpCvMgeGgKeXCuv9zRHOLW2jZ1ARLFIeH3vU733IBtf/xifaibiU80UrysWV1OK5Rgbyk+WGECqZQYg2yXYEdxurREa53IIBYXbNjvHNcZZX3urP5IGj4wt2BQMQPEXkjs+NNwNpdvpt1oVwWfa2MAOa6fh5eoYEqhZdzFyqm0DqlNc/ib1hHliKDcTqeB3GJsP7sVlJyvctQKYIuifsZldcYx61xaXB23qeF2Daz8XrZGHcF77QQyqgEunKzHlzvLEvM60M+u6yaVtrmYz8p4ZDlw2g7zS0jODb3pJYHSpJJtR+kSaEmuCr1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9894.eurprd04.prod.outlook.com (2603:10a6:20b:655::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:06:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:06:37 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 06 Jul 2025 09:04:24 +0800
Subject: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-asoc-gpio-1-v1-2-f0912095e923@nxp.com>
References: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
In-Reply-To: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751763885; l=3783;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=kMCFW3RMgRt8hBOUlhDKM9LURkbMkVd6f+eEV8nuhwU=;
 b=6SQD02sIby5a2i2VNx76ybnJmcUaKq4y3J1pBT0AB5NwqogGVTjHbI6ZlpoKQYZL4P85ULK36
 ClHEgET/Cv+C/7t0/XXBxs8HZ6Sml8bU2hVLCQZ0PhNdO+PKo0jeltW
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 653572db-baa1-48f9-7fef-08ddbc295b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ellWSlEvRk1wTUhaMlh6UGxBY1ZFZ3krZWJWcW1aQ1NxZWlHQ1NSeXFScFN5?=
 =?utf-8?B?YSt4YzVTaEdkdkVkV0ZnQldJNkp5QStpZ2xCTlVudEVNVFhQakYvYmVwNXJL?=
 =?utf-8?B?T0RhMGZMWlI0ck5pcE5WbFJIYm45QW01V2RGMWlLNkVWNVhEZ2RVckN5WW0y?=
 =?utf-8?B?ajNqeGlpS3Q0OHYvQXhKVjc2Q0pDUnNCSlJhUG44angzQXdnWVVQYkxSbDBI?=
 =?utf-8?B?VXNFTExVSkxJaEdWckJiSk02Z2R2TGJ1cjlOMGVOTmFwYzF3dHVWRFZobGRt?=
 =?utf-8?B?OEFDWWJmYXVPMUdITDIzOFBTN0plTEF6TjJTZ3NyV3FIWFAwb2ZYVGZYSXNm?=
 =?utf-8?B?V2tTNVlSL0N2d1pIcmdQMWJJTWtLOTZ3em5VUzQvMmlmeENqOUpXOWVpeVcy?=
 =?utf-8?B?bWwySWROeVBqM0dkQ3J6NVVvbHlsSTZFd0kvRWI0NjB2SkNRRGtod05qVXB0?=
 =?utf-8?B?OXZRbVlWZGxKRVF4Rnc3OEpvaU9aQXllcndTbys4RmQ1OEJqaVhqMjBOZlNz?=
 =?utf-8?B?WTVwMmdETzZvb2g5blhIZ1doTTFZaVJpVlRoMVR3anVuajJTN3NiOVJqNUYy?=
 =?utf-8?B?c0w5eXhueHc0NGxXOEFMZWg5NVg3MlNJcVVsQXRTVGZ4MllKUVd3cHhaenB6?=
 =?utf-8?B?MVNIc2tYYzF6ZHBOSHE3ZERhNFhZem41cDJDbGI4bkxIMXZmeWRkNW1QOG93?=
 =?utf-8?B?RWM5RjZiRzVjOXVrMXlJU2RPN0l4SnRjMjFWemV1WUZXb3d4d3UyTDFHa1Nw?=
 =?utf-8?B?YU4yb0JNRVhhTk9Id3d4bkVCT1h4RVBOdmh1dU1jNm16N2kzOTZzb2pZQkp1?=
 =?utf-8?B?MXlFMUpZaFdhLzVvcGY2ZkRqYmpXSjg0eXkyMGx1NlNvWUxmVUwzMlAvaFhr?=
 =?utf-8?B?T0dLM2MwbU9DTlliK3djZ3R0UHQwenQrRXFlZFFvNGZTKzVrd1QxbDYzUTd4?=
 =?utf-8?B?OVUyY2RvL2lwWkY3RGpidTlCbnFmTW44ckYwZDlyRUcycUtRNjAwSU1TalY0?=
 =?utf-8?B?QU56Tm00ckVWZzBZTDB1RUcvRmFMTzZCQkxYTlJkRXBQQkhHUytIVEd0bTQv?=
 =?utf-8?B?ZVVUSEU1S1duQU9PVTFyZ0VOdjRZUjhrdXduV3VzdlJxODBSNHZobmgyczYz?=
 =?utf-8?B?NWdJUXB6TTdqdnhpYyttU1Z6NzhzbGh2Q0srYzMwcDNVeTVJcktucUNxSUwz?=
 =?utf-8?B?UW5OVC8vRDBIVEw0K3hTRGV3ejB0UUhtQ0dLeCsrSVJxN2cyRWpnRjNYMXlp?=
 =?utf-8?B?NXBUSkx3dDVDSGtjVUgxZ2ZVR2dXLzZEOWxpRG05cFpPOFZMWnpxd3ZlZ0Y4?=
 =?utf-8?B?U2FMQmcyN1FTTWVET29YM3BCekZPV1dpcEl3MjE0ck1UeW9oZ3UvNkU3MVFX?=
 =?utf-8?B?TGxDR255eE1jaktXWmExSjRMUDhGanUwdGRQdXBxTmVsNjgxbVdsL1VKLyts?=
 =?utf-8?B?cWIyWE5FY1hmZWtZdWt2Zk9QSVRldHJiUy9UTkJocHFXUUQ4cGtuNGcxQkN4?=
 =?utf-8?B?L1Y4QmZabnFONS9zcmJ3ekhmK1ByMFdpZ2ZUb2toVUhQYmQwN2c2d3FlOXYv?=
 =?utf-8?B?WDJORW1EVEc5d1NIT3hSdUFvYkVsNVhONFM1RGtEeVcwRE1GZExZazRJeUhW?=
 =?utf-8?B?NFBwUlp0aDVxR3VoZENibmIwdUVkY3hxWXVOQ1JCaGY3cFFpRko4VVkwdFd3?=
 =?utf-8?B?eXZXY0prTjRiUHl6aHFuZGNrODEwNFpCc08yQzA4SzlFN0Nha3JTUXVROWpi?=
 =?utf-8?B?aHBXVVRVcEsrZXY0bVdTY1pyRHlFVWhIb1ViWFlSNFZpZG85RGhmY3diNTRN?=
 =?utf-8?B?K1JTOW5hSVgyK2VlTFNVdWp1SUFkTjZxM0lMKzB6b1NwWE1PZEFlSjZ5NkFs?=
 =?utf-8?B?cWFNTmtjVnlUZ0xVUmJ0SGZhMUdxcmNrZlYxTkR5QnI1M3l6Zld0RVNTeExZ?=
 =?utf-8?B?aklJRE9VTUNkSXVDbDVaVklTKzI4UCtveVlDaHpiV2JvRm5RbHFESDM1aWZI?=
 =?utf-8?B?VTBKK1VGY0Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTI3aHJVdDMrV0RBVU5DcXVIYStFaHhUZnYweHcrYjBWS01QMlJJT3AxQ3VY?=
 =?utf-8?B?SGpLSlJKOEZjQlR6VVRZSFh0N24xNDdsdzBSdG5JN0Y3OGNmWWhBTVpLVDQ0?=
 =?utf-8?B?SFVwUjBLT2p0WWVPVmRtN085aWlOMHpuMkF3cTVMdzlnY2VMTFRtZDE1K3hs?=
 =?utf-8?B?NjY2NUZQemxFOUdraEhhWDNuVGZadDhCb3BkWWJOTGIrM3plUVMzNlB5Qml5?=
 =?utf-8?B?ZmFvWXRBd1JIZk5wZGx3bEthYlB1MlhWZEpyR0ZBUFMwSldmMkxCc3ZRTS9j?=
 =?utf-8?B?QUgrR3k4ZUJ5UnkyVkJYNVFNY0VGYkc0WWI1bTNEMkFpeHpIRll1MEUvMEoz?=
 =?utf-8?B?NWt6bElyY3ZhaWszRUZuZjl0b2EvZ09KMkVtVGc0WkNmZzQ1T2hsS2RSWE9a?=
 =?utf-8?B?MDVqR3lOdXhFU2JTZFFJMW4zcU02M0grRU56RW5MQ092ZlVSNCtHVHg3ZFVC?=
 =?utf-8?B?NytiUkhSM0ZHVTZhYURnVDZsbjdkbit2bEEwMWUyZkkvbkljYmFyS3R5djlQ?=
 =?utf-8?B?ZU1PUHFjaVBDSnVwWXRjNmpoTGhqbno4Z29zQm1vVE93SWpNd20vdnBiMjkz?=
 =?utf-8?B?WTlVS0xsV0pDL1IybUtpOUxBYmhKMGFJT2hQcTBTWVppbXBtZXNjU1R0Yk93?=
 =?utf-8?B?aktPK0NabVNkS3EzRitqaUd2ZnROMHhRQ0xMQjJhRmt1KyttM0lZMjFOYXVP?=
 =?utf-8?B?MFFlMEZabjA0RmpQT3lPM1AvdHlnQ3Y2WDdKckUxV3ZSbVFjOFlSK3U4a3Qz?=
 =?utf-8?B?WGdOVVkvR1BhQXdVblEwQXBLdllLWW1Lb2tFVTZyZkhMYnBsUCswTVdoRUF5?=
 =?utf-8?B?am15MjloYW5wemNOaUxKOUVWVVNKUHR0bDBzZkxrbGdtY080R1cyTFpONG5X?=
 =?utf-8?B?UEpUTURtTXJFK0ZpTzdxUHg1R0lWUVZBUjh5c1BQU2kwU042SjJFUnlJeWY2?=
 =?utf-8?B?SElkTXpFbDJjUzVsUzg5bVZSbHQ2OGl5V0ZPUnZzKzRBU3RqaDIramIxbVUr?=
 =?utf-8?B?d09oNjBycUNZTVQ4cGJBamNHQytJZTJCWkliQ0JHRUxjRytiRnR1Q3o2bWF6?=
 =?utf-8?B?SWJkY0IzSUlGQjdnUXd0ckJMUmZCaEZ2RU12NDFIUjNDbzc5Ni9kMHJTWG95?=
 =?utf-8?B?NndydlB2Snk1bGppU1NJclc2bTRQMVZBSHlJRjlINThyVm43NW5BMW12Nnlp?=
 =?utf-8?B?WnZ6M2tlMkhIb0prUktJR29nMGxyczc1ampvdkZnU2JnKzQ4WFp2RnNSRFlo?=
 =?utf-8?B?QVdFK1lvUnpGblB4NDJvTnJCdmpVdkg0WjZRSlFndVhzTmdXVnc5M09QMmtw?=
 =?utf-8?B?WmxvQ2FnNGNla1BWNGg0cENLemlpYlNsVDJSdHJZZTYzMlU5ckkrckUxRkdT?=
 =?utf-8?B?TnNFVWx3UEVtTU9CanhadzMremk2U2tCU2JGNk5JRnFqOHM1ZEUzOUE3MWt0?=
 =?utf-8?B?dlNkSUJEK3plVERtZDIxS0xrOE4zNUNMNWJ0bC9OWVRFMUQrWStYYTVDeE5Z?=
 =?utf-8?B?R1A1YlRRM0VuVHJ2NnBScE5lU1JLZG5GcWpZZjIwdjNlbndEUnc5LzhVR2p4?=
 =?utf-8?B?U2NGRXdVRU5MbUFxZ2VkcFpqMXNlMFhCMHRQZmFFL0o5TXNONGViSjJMSFNG?=
 =?utf-8?B?dXdkRkM4TUFmZmdOcStSbXhSWE5QMHNKSWZ5eWNEQkIrWjVIV3BFV3dMWHdT?=
 =?utf-8?B?dlZtQ3F0UEJOaUdCeTdIQXJxSmh4UTVaQ2lXUEtHSk5sK2dHeWJWNzBUVlpJ?=
 =?utf-8?B?YW9xZGZhMC83dTUrdk1FQ1JtcVRjVzAyNGY1MUMxb3QrY3YxT2xjOTE4N1VJ?=
 =?utf-8?B?R3pXUTVaQzBXTW1OQVZnak1Oc01hQjBiYkorU1N0RWxJeXB4OTViVy9QYWJj?=
 =?utf-8?B?ZXduSGgvb1hHK0hneHBKemxBV1YydTY3S2tyQmRHSkFUblM5ZGdSV1pVNnRF?=
 =?utf-8?B?NzlKeDZxbUxHcm9DckxiRWd1c3lzclNma2RDRnc0bjB2bklkci9qUzFMM3kw?=
 =?utf-8?B?TjVieTlJMWlGVWNtRGlGTlRuNlhURzcwWEx6Yk9JN2xkQ1dDcGxkMHNEQ2pu?=
 =?utf-8?B?QThwMkcwVHo0T1JwU1FGamdud2lIUTVGQml6OEpHOUROUEtQOVd5RzF0cTBP?=
 =?utf-8?Q?K5Z/+j+sajH4O7UDKGZaa0AUo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653572db-baa1-48f9-7fef-08ddbc295b51
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:06:36.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSC18D5LnMw7c/BUXxANAn7b35asqd3NPI1juvJmlFpZZEkxO3v0q/Xkk5avtUxR6BbQS6Hwu3hhThc/SC3bUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9894

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
   name.
 - Use gpiod_set_value to configure output value.

While at here, reorder the included headers.

Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
polarity for reset-gpios, so all should work as expected with this patch.

Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 44 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a20dd2dd552679d33174edaee 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -9,27 +9,26 @@
  * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/cdev.h>
-#include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of_clk.h>
+#include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 
-#include <sound/tlv320aic32x4.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
+#include <sound/tlv320aic32x4.h>
 
 #include "tlv320aic32x4.h"
 
@@ -38,7 +37,7 @@ struct aic32x4_priv {
 	u32 power_cfg;
 	u32 micpga_routing;
 	bool swapdacs;
-	int rstn_gpio;
+	struct gpio_desc *rstn_gpio;
 	const char *mclk_name;
 
 	struct regulator *supply_ldo;
@@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 
 	aic32x4->swapdacs = false;
 	aic32x4->micpga_routing = 0;
-	aic32x4->rstn_gpio = of_get_named_gpio(np, "reset-gpios", 0);
+	/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
+	aic32x4->rstn_gpio = devm_gpiod_get_optional(aic32x4->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(aic32x4->rstn_gpio)) {
+		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4->rstn_gpio),
+				     "Failed to get reset gpio\n");
+	} else {
+		gpiod_set_consumer_name(aic32x4->rstn_gpio, "tlv320aic32x4_rstn");
+	}
 
 	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
 				aic32x4_setup->gpio_func, 5) >= 0)
@@ -1372,26 +1378,20 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		aic32x4->power_cfg = 0;
 		aic32x4->swapdacs = false;
 		aic32x4->micpga_routing = 0;
-		aic32x4->rstn_gpio = -1;
+		aic32x4->rstn_gpio = ERR_PTR(-ENOENT);
 		aic32x4->mclk_name = "mclk";
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
-		ret = devm_gpio_request_one(dev, aic32x4->rstn_gpio,
-				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
-		if (ret != 0)
-			return ret;
-	}
-
 	ret = aic32x4_setup_regulators(dev, aic32x4);
 	if (ret) {
 		dev_err(dev, "Failed to setup regulators\n");
 		return ret;
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
+	if (!IS_ERR(aic32x4->rstn_gpio)) {
 		ndelay(10);
-		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		/* deassert reset */
+		gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
 		mdelay(1);
 	}
 

-- 
2.37.1


