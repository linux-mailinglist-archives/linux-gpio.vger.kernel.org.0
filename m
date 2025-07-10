Return-Path: <linux-gpio+bounces-23084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EEFB00233
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8FFD1AA56FC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A7268FED;
	Thu, 10 Jul 2025 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P/twSZvg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012069.outbound.protection.outlook.com [52.101.71.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05A257444;
	Thu, 10 Jul 2025 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151335; cv=fail; b=X/9c8uHflby/SyiBOLgUKtUkJMwmIHWwRZ91b+EZAzZ8Lz7ux6YRvWq5/ovEyV9BqtfWxmYGLGMUgPPj7lYNMEBgLCyPfteVp+8RVyFdbaESMvCAKziCLvZU2furVLbQqNwEBP7BslSlsMz5UNXSIqzbOt+9G9VBCvTZEDVt1bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151335; c=relaxed/simple;
	bh=Z3aUGatTn1/5Kmd7nbeYFXSltLSnF/CXECKPebLVKG8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o2A35OOcg5kuhGfe33rZSBdQEMJr5xkhyBl0StiL1MhyHWG06eUsQ+oOszWk1m5+fvftqt2nozxrznh1CrvZ3oScG87Osmbkan/Q2SWmVmLB6u6YRbj0t37gwJCYl/S0vYUFI5dNeKrFB0DmsSUiJMCb2pGYw0SqWCudZpacmMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P/twSZvg; arc=fail smtp.client-ip=52.101.71.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckjQ6VkXVecZBODyEL4hmtm20r2P/ljsT6HIacU7kjHkJkTsRHrtpyMi8/drTjshfm9ICNfNyGEPFh0yiL2zcTvmcqf/uqE2PhmO0xQnVF/WOV/67SmsVJXmuNGI472y1TbGJvaqHsEjDyUzdn8XMXEemJN+LGGUhLZ7BhuPO9fZNJ/U55PD4zM1PP8n2/PTjqonYRW+rSHaI5cDjSjH0MDkIwda7w1A1HCKLn78mBEmYhSrqSmGDYzMzWxJ48K7GKgZY6Em0rTSz8v4iXrFvk7wB3KrwVN2BaJNIUavVf10YZQdnRRIbrvX+mlggSwhiVXxr7LQY3CgH1kCX0wGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7UdALCo5wCcEFWje5Sxh8lNy0bCJDIQErSkCHIdCn4=;
 b=Z+1afdhM9e54HRNFU0kPaqiTWulmcWAMoymXAuGQFInpuCVNNtOkHf0xAm23kDUpHSA6LYHMbER2VqLotmMHxUhjnWcGH9h3N3G/bEbUi3pf8obV6S2HPHVkHHp0wtu5n9//+ud9/MXpIvESTdILc8PbFLGrsQwf/GB2Vb4T85j6bkwdTf6AIJOK3ovkS0Vt+EuEGS4vyS9htOpN4uUlZ7dfqT0UvTI6L4RMIUS+l/Hr2Yq0/oIWTPosdVokapjTs0Heblcbv0EhMPWz017rFqtXo5DgwMpia4oB29E6m8yxGytMI+7peFhedodl9QzKVzPgMZqPh1UXWEyG0V+33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7UdALCo5wCcEFWje5Sxh8lNy0bCJDIQErSkCHIdCn4=;
 b=P/twSZvgh9CEO9IJ23B/oyu/bsWhDv6oAhdJCVHrn2Gm79ywsn2IHlE7IaWHGgJ8e/xWW0Hvu5gLmLF1s0eiq2hwyqYs+0iRXD1OTj3invr/86Q8jBj7dUXsEh20Tk4LJPinpBIOFOLux9MG8DAszxLu404QP94tH0EtdAGb1dlBqQlSoicetDWb611kI0sIiOTusHJc3qcwXQiXIKWKTHFrqrVJJW8G4+HRwz65lSlxeocwDw80QMtwVuVDzUOluMoeIfTKEPAojnag5AnYFFvR9M7VlvsSsaAHUjU+REY8KMRLuMtxL89uOK6/Rylif/4g7PsE3ELAKldnVC+uJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 12:42:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:42:11 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:40:03 +0800
Subject: [PATCH v2 3/3] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-asoc-gpio-1-v2-3-2233b272a1a6@nxp.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
In-Reply-To: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752151210; l=3242;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Z3aUGatTn1/5Kmd7nbeYFXSltLSnF/CXECKPebLVKG8=;
 b=al7dhsL81mRH/Iw/20mWqi2Sy5pRDbH0LvAOjVYOlT6YUlLo3PiM1Ue7BrbjH/VFAq+Ur9tZS
 DDt6+3DMonKBCvISENjuIRZfQX4irHM21+C3SbEVa69kfyAg8jEkrXl
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: b88360e4-c855-4fed-b2f3-08ddbfaf3087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0NWWEdUM29XaGl6L3dDZGJ4SWVJL1JCZTBRN0hDNkwzMDUyajhwUUpPcE5p?=
 =?utf-8?B?S0p2UVNIKzFPOUJ4REVwOFlHcnlueGYxZHZGTGJjYTd2OFd0R2RWRlFWTCtG?=
 =?utf-8?B?U2xLOXpPS0RBeCtuVWlpc1U3NVF1Tis4UmJMTHBLZzRvZTJ4SE1PV0VoOU8y?=
 =?utf-8?B?T2NRS1ZuVDdiVjZqdFhnU3g4TXV4MDJKeUtCUjNHVm8vY0c3cG5WOU1oNllD?=
 =?utf-8?B?bmp5b3RnamdkR3RKYUsxN0Z1RkZxK0dkTG4xeWRwR2pKRHlsWnEwQmNVbWx1?=
 =?utf-8?B?a3l1Mk5sc0p1K1FiK0pNVkxDV2swWmxFUVRCcHFJc2F1aG5FTUlhVGh0eHNJ?=
 =?utf-8?B?d2VmaUFJS3QxKzAzQ3ZDV0l3RVhzWEtoeEdTS0JaWkdubDFzQkkwVVVZYzZ0?=
 =?utf-8?B?SS9RME9UR3FjejFmSDZxK29iQjdOMlZ6NEVPV2pPaUY1YmYvaGNHTGdSRVBD?=
 =?utf-8?B?N1dYM2s1M3BkcDRQM1lWT0JsSno1YkFBbUlOdGFnNWlhNUlkZFpwWnZiVnh5?=
 =?utf-8?B?U3h2L0ZGbGdsMVN2MlhUNzJaV0txYmZSbXpaalJJbUJZQmRFRnRNSThtN1JS?=
 =?utf-8?B?L21PSnF1aXVqVC93KzdwcEVvVFBxM0hNWUk2N051b0F2bDVYbzRiNTJ2WnFY?=
 =?utf-8?B?Y3dmdGM1VXFKa2E2T1NmdkNPcU1ZTlBiR0J4bnJFV1JOOWdVQnhUTi9icExz?=
 =?utf-8?B?VjQ0NjEzbitndS9XRkpXSHlvYU5HS2Z4ZFp5NTB4Mmc2WTIzQmZldjd0ZXha?=
 =?utf-8?B?Vi9OQTI5UzlFRll2aWN2VmFSZWNuWUszbG0rcU5ucjUrdy9KMzNhaXJWbWZL?=
 =?utf-8?B?cFU0cnRUNjQxL1NhSFRwb3k1UEh3V3ZsTnhZWDdZN2RzUUVSb2pNcnlDeHEw?=
 =?utf-8?B?YzVrUlZuVDFacitsczk0bUxKaEUxOUY1cHFUTHRkbmg3VXc5b0JvWXhSWjFz?=
 =?utf-8?B?V3lMZW5PNUV1R0NTOHRUYU1rWmtKRGkwMC95dHR2bWRsaEYyQ0VNZHJBS1Qx?=
 =?utf-8?B?OGVSV2Z6Z3BzeUprNVBQeEJBV3g3TjBkYlp6T3BNcy94YktOL1ZBNGNWbmVj?=
 =?utf-8?B?cUc4UUtEWDh0Q012SGJsRVRic0cxTjRFK1U2Mmd6RXJxUExqaU9QWTlMZlkz?=
 =?utf-8?B?MVN5WWhLOENOcC9WUTZkUnpoRTRBK01TRUwvdDY4N1JWc1VZdHg1d05sZGRU?=
 =?utf-8?B?S3FHUEQ2Yis5bzlOcXlFTWFGQUYrakNjTWhXZmY1b3YzQXJ5Z2U2TzBsZFRS?=
 =?utf-8?B?NGZzZEZhMGtCMDNqQ1B0MFlraFhNaWJoRmg5eFhrWnBmTU5UZDAxbVdMbmZj?=
 =?utf-8?B?ZmVxb0dOYTdYbmx2YzRpREdnYURmMm41bVhMYTdtRTJJN0xiVDlHWUZTdWhW?=
 =?utf-8?B?Y01RUHhyS05aWVNTRXd6cTNWbFhHV0hxbkxjSEkzN1ZsTlM5VmZrSmRxSENI?=
 =?utf-8?B?VkRwdHg0NExKTTdWcVY1aUhyUWdOWHlWcVlHR1d4c0VMSWRWVVM0V05Fbjh5?=
 =?utf-8?B?TXhqQjNWMGpsc0sxaDRpN1pYc3NmTHd5a1dKTnVxWjE0WTBMUGdVMTZDVUZz?=
 =?utf-8?B?TTNaaGdQUmkxU2xuYmJkQW5QN1BuQmhnZzlnTTI0L1NwSjI2b3ZFVXRGTEFG?=
 =?utf-8?B?UmpSaEVPd011aGRncnZYSUNhd09xdVplSjE4NFR2N3EvTERmeHRMUVVWZlYx?=
 =?utf-8?B?UGNBZTBRd0JJdVlZeHpXQ3Y0WkdyYmxnT1lVNktWc1FpSWZadXdjOEVMQ2JS?=
 =?utf-8?B?cXhSQU1aTVU0QWVXMXU0V2xqUklBNFhMeDlLQmFVRFh2VHpTZHg0aE9VbXVk?=
 =?utf-8?B?VGhNSmRjaTRUbmpMV2YxMWdoZmhLVXoweC9VQUQwL2YycDBWZ20xYW4wRUFF?=
 =?utf-8?B?ZXZvWXpVUS9BSHhTUTJtazl2T3BnVDZoMFdObFQ4VElZZU94dEk1dzFZdDRq?=
 =?utf-8?B?RXVKckRoWDJYYkN5aE9IbHgxTHJTTEl6NzhLKzhVVlgwMHZxRWNPOXg5dEtV?=
 =?utf-8?Q?V4q+p5aQkWREDTRxZsY/Zuh5ODZq9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUc3ZlZtekdGUGovVG1RUHF6SVVCekxRb1ZLQjRPY1g1Q3FuWFFNeHZ3NlJo?=
 =?utf-8?B?dnRXY2drQ09aa2o4TGxUY013dkdFL0FhU25hT25yd0xmZVRHMEtRS0xTUkQ3?=
 =?utf-8?B?bXlRNGpLZzJ3bG1wYTJxK1VwNTBQNllhOGFaY1VlV0cyRnRmZXVvNmpBdmhZ?=
 =?utf-8?B?ZTM3YURhbjlnN3lOOFc5OVlMWTlRS2RPelhCOGY5bmM3UVdHMGRwdlIvcFc5?=
 =?utf-8?B?WC9TNHNsaExJeDRpbXlYQVFta0pySUpEamVVZHRtNmExUTd4ZGxpaDhIamZY?=
 =?utf-8?B?c09ucVQrM0c5cW1uSXd4VVk3R3dDNFlxV2o5cnZER1NUazUycW9UbnN5cjc4?=
 =?utf-8?B?QTd0dGdVSmdMRGhWQ282R1B3aWw1QWIvS1dEd2o5dHZVZkFkNHZ1TmVtZUpv?=
 =?utf-8?B?MXlIQlkwYXFHLzRmd25oRnVHVzRQenkvTGxEaE1ZeDVOekJybVAvSHBlbU15?=
 =?utf-8?B?SFNXYWFONWpneHpTdG1qd0NWamR2OVdUcTlCcmxyOXhRYXkvaWlCeG5lWVZB?=
 =?utf-8?B?dUlNZ0U2UHZjRVhoL3RLMGV3M0xaalMxQ1lmalJHaldzbXZQMEdpd3VtZWNN?=
 =?utf-8?B?TkQ0bGJUdmRqSDRhYjV2dERhb2hhVmZ3RGZtSU1KRERCNjFXMngzVzFxRHR3?=
 =?utf-8?B?WXVnSVlIOVNFdEQ2WGVYRDh4UVhDdHVQa2NGRmJBeTluSTBwWTRneXRXd0tH?=
 =?utf-8?B?WnJQWnNqTUJMd283MTBLZ0hnMklZbkd2MkplcHNINHRSNkVFMW42MzdsUFg3?=
 =?utf-8?B?eFJkQVFVdWdyVitWRTliLzBiVmNnZkdZcVd6VXY0L1VrNE84Y0crZWJ2UkhW?=
 =?utf-8?B?dlpTRk9jeVJDeTJERXhHZUN5b0xKN3l6dkJGZ0RHUnk2U2RkUVl1Q1kxdHpi?=
 =?utf-8?B?NHR5N0g2aGt4dGdVczVwaDh6dmg0bVBqbHlzK1pPMzhzcTEwV2RiMXFMYlQz?=
 =?utf-8?B?bzJEQU1SQjdRMlJtdHRRWE8wanhVaW9BNVdJb0ZpczYwK3FRWEJsWEtQTDAv?=
 =?utf-8?B?VTU1YngrR0kyNHdaVlphL0VxL2k5cHpWY3ljeTIrQzV5d1AyVWpRd244SVJ5?=
 =?utf-8?B?L1ZEdTRGMXVWUzNBWk5CZHJPSjFlTmlhSnVFSFRMLzVlOVpybDR1NWo3NFJ1?=
 =?utf-8?B?K1FmL1IxU2dkclZpZ0VqNWFzR1dlNnRzaW5KU3duREJ0ZkRDS0loNXJyQWFZ?=
 =?utf-8?B?MHlHWTQyOStjWFRXL2taMDJCOGFWaWtTTGsxcTZaQXRLUko5UDJNNWhMeWJr?=
 =?utf-8?B?TjE0ZE5wQ0VCYTNJWjZ3QXM2TVR5YUFrSEg5OWNLZHNjWTJRd3QyME12Z0Uy?=
 =?utf-8?B?YzRwQWRYUGZoTkh5Mi9RczRhZCtlRkw2dGRRbzRNMWZhTEhFYXAwajZWcW1O?=
 =?utf-8?B?d1RLQW1xeVUvWXJmVS8wSzJPanFjYWtkQ0RHYWk5Szhua0xKQkJ2RmpyN2JP?=
 =?utf-8?B?b2RTTWlXQ1gwdTZsVEFvdnIydWREazRMQXowRGZSSEwxMDZzM1puY3ZCYWJu?=
 =?utf-8?B?VDlnamk3cE50Nkx4ZGFrYWpvUlpyZjF6NGRWc2VEL2VwOXo0RGZGSi9mZjdv?=
 =?utf-8?B?TlcyRGVVUGZpMUxRR2cxNkpBZzhlOTBPM1lhTkV6aStIWHBiRDV3bmJtQWN3?=
 =?utf-8?B?MUZxWFU1UDMrMkVaOGF5aEVTdjd4NjRwalR5cDdOWnRtODBoekpadGxaNDV6?=
 =?utf-8?B?cTJaUzdHWlBsY1pEclRXRHJmYWFOQXZudjJibnFaT29YU3BhTnVKSHlYM3pv?=
 =?utf-8?B?K1RrMHVDZ0RmdkY3dFN6UVF5QTdDMGtIN3dLYUVvcDlEazNpMmZFRHJrSTlS?=
 =?utf-8?B?WmUrLzlqcmw4bEhZUDZjdmhGeU14ZGFvWlF5MWZoUDJ4eHpVT2x2RGNaWnpp?=
 =?utf-8?B?SmF6ZjdkV3ZiUW1VcW9CNWxDZ2hBdTFFV3dsR2VQTllSbzFBeFBvQit3VFd2?=
 =?utf-8?B?M29sdVNvK2VqU2ViQXBhNWRtMFN1R2FhSTQyNU8vV0dwYUFJSzV4d0VRYXIr?=
 =?utf-8?B?aG5YWVVvVVVjOExQS01QM3lJTnhtMFQ3NjIvUXJBeWFwZzV1RjlwR2JMZnpz?=
 =?utf-8?B?N3R4TGZNQXZUaVpOc2JjcjJ6dmVxcmp2THN6N1Yrb0xoSWZVY0RaNWlwKzkw?=
 =?utf-8?Q?k97q/Y0cXVVLAovHoYye7vm4i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88360e4-c855-4fed-b2f3-08ddbfaf3087
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:42:11.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VQzVbM4b6WxXfI23Um4w9ksup+MGBSuIGPPDGH3xU1A6IVvhclbyl5r3mBJEgxJvozmiQap8CWkHX/OWbIxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173

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
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 2f4147387c4f802bdac983c81b104c000b1fd6ed..3b89980e9bcf2fe93826b5af385d0dca517091a1 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -12,12 +12,11 @@
 #include <linux/cdev.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of_clk.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
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
+		aic32x4->rstn_gpio = NULL;
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
+	if (!aic32x4->rstn_gpio) {
 		ndelay(10);
-		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		/* deassert reset */
+		gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
 		mdelay(1);
 	}
 

-- 
2.37.1


