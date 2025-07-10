Return-Path: <linux-gpio+bounces-23096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D01B00516
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14EB1C42FFB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91A4274B3F;
	Thu, 10 Jul 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cHfaUrre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662E02749E9;
	Thu, 10 Jul 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157343; cv=fail; b=g5qWMjscuBjsdiDd3DVoCb26u9OhXRuSWz4T+sSzlwMJXGp97w4X2lCKeb1wkCo6RM/SJSY/4W7CF5tUK3vwDHlJLzGRNHFKgXe0JgUmeOvrh15kRVBE89jHTGgnSbI8j8XmsOHLn2OgepPtemrAg/OwfPl2eR1CQphtZ7UVtXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157343; c=relaxed/simple;
	bh=HFSbgD/yG3CV/mxarDDVlUpGmx3UtVclnnn+hklLkvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lcFx54lVcSGD0/PDmit1sNpW65oISwUW7m3+XsuZ0SmLeqFjKBlMQBTMr2iw9gF8uFsVqGBTsWNfeOvZ9b2UgwqCIRXSi7ieAPNOz51KVROv1zyicEZR/NrvIELBwr7aU0UKq/H3Q8AmD+83xOfEvbw1aqgpHdpnj+EGNyBU06w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cHfaUrre; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0WZR3971zsn85t2eVr9gzCVuRJDVdgUqT0YnOwyYgXVhi2ZF2zCWmiIU1A2j0OdpFmnJTy7s1tVJW/fJhjHLPW3gG7IT2HQv+KmuqFwEpy5sO3P8uTCvK2JrjZzXqOzM3Rncxkes63yM4eJvRhlqB7LoyXKNECkKamrTS76X6tQEM8cYELEUfcXWTs4I5LghSqRNdKwnDixbE3CfH/zVhdtWqtWcWTecVrBHxngi7FazTzeLbnIId1UZ2VOibsxFEvgUwyid3CVG1/ytYiQqqIxJWcku9qSiUVI1gKjmyo1Vdn/UFrL5odpg2UzdCp8Wm5VKYdzVn09lWDZgLW5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkkqhIGxAflSbckGN1mJg6cGP2JgYkNOw9oZiVdG168=;
 b=ml/HX/XVu5RlVrNkPp7o9sUbZkxsTlLwrCfHdynw0ijZpJM3YIzBgZIWHT3wMagv2tWHwu8sZ1LCl3q5ckI4YjWM/pxb4Ai2UGqh1dBKsBNRYfRf6s/sOlssb3WICdjXZdwnTbmoI3F7nWkGTGFDV6Ii5iHi8fVNH4KBmVk2DjkHLuYKhqeax0gLsouTee/ONXkQ8rUuCwYqmjeT/7vJapiw1GBmbVeBIH5Uom5BYjhBjan4XSZwPZCek9HBh8shiOaMWgSE/bhHLCDGGKyEfbJ3MgXUCiC29JDUFLhbl4TDHf3XxEIb0/PYtnJF+FBuQzb4sNFUpdupsYsCcX6AaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkkqhIGxAflSbckGN1mJg6cGP2JgYkNOw9oZiVdG168=;
 b=cHfaUrreeLSDvr26LUk4unui4NhE7TCXtd3mv6uF7BjN0VK1IbnnK9SNc5IX4ulghAerWycfsX4FokcRl/6mpGGALR8ETk0whnPR8O8QPZyMnk0Hg4FoFr6N5jByAH23tHwF9K8mx00QIolkGQaiutZ0QIt0ZqzaYT/anMdBnaeqzfWGZIlzNRPgY+hng98r5wDE+e9wjkBQyYF+VBzaqMYU+UciMwbsrDTnPMEyutGaJtSGjZK6zthWJucz3ofog6EYgAq4aKn+9TB/R0Fk6gHnZ8UA8LepqbxL/iOQlS7Xd3RZNZqDMCwTXxXVKrHRTCPCxotYXJDrCce9YOLvAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:17 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:17 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 07/12] pinctrl: s32g2: change the driver to also be probed as an MFD cell
Date: Thu, 10 Jul 2025 17:20:30 +0300
Message-ID: <20250710142038.1986052-8-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd2859d-2213-4ef1-d236-08ddbfbd2c57
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWV0MHlGSVNYaDJycEV0WWJHanZ4bk9JNUpWY0sxRGluYWt5UnZXd01MU3J3?=
 =?utf-8?B?dWN0K3E1dW5tOEUzaThsOCtZWWdwRGFFQnB3ZUxld1NSM2FBTkdwSGIwSW5Q?=
 =?utf-8?B?NnV0KzJKdFVBcHR4cCt6Y3BwMzg5QTBwOWthNXBITC9VcnltTHRHMGZBUjdL?=
 =?utf-8?B?OG5zckZNeG1IR3RDYVBpUEU0aStpOVdPY3ZBVTEvYk5LQVhLclh2Wnh5RTVp?=
 =?utf-8?B?M24vWEc2L0tBdk92MnZwMUhhNkoyY3JUcFhWTmNVMkE1V2hIRXV5RHRJbExi?=
 =?utf-8?B?dGVPQ2I0TFBtcVVHU1RmdE82THRKQm5xc09vTHN5YURBZWJTdVpYY2NuMVhi?=
 =?utf-8?B?eVB1WDlQYXpjQmsxcy9rQ04yTXZDamM1czdLcTVMaG5RbmpYR1dCNUFLV0NR?=
 =?utf-8?B?UmZ6alFVWHlzMjFrZUQ2V0h3ZW5BZDFBbHN0dndKVisvK3pHNjZPdE1lcXIv?=
 =?utf-8?B?bEVQL0tUU1NzVnhaRis2azBpUlFkRUU1dTBwVDVPRlY3V3R2RGZENzJMSHpC?=
 =?utf-8?B?aEFxeE1zbVBDZ2NBU2NHTDNMWHdOV3J5OGxIanljUlphblA2b01aMU15cDFT?=
 =?utf-8?B?NnIvbG11dG9GVWRTSERtMkdLMDR5V3JQTFhQV1BMWjJsOXhKcTYwYlBILzdm?=
 =?utf-8?B?UDM0WWQxNHBvVGNWc05SM1IzZGtiYjMzTFptcjA2Rk90WmdBdzVxOWZyMTMx?=
 =?utf-8?B?MEdQcy9LTGZtSzE2bEFBZmp6ZldHbWp0WForWTM2V21VR3pLdGN0ZXRBb0ty?=
 =?utf-8?B?TUpuY2FpRXpra1JORmE5eDA1dCsvbWtYSnBTanMrbVFXTUtCNForaEhCZzFj?=
 =?utf-8?B?dDh5aU41dkxFYmRwWVlGSmgxZjc5VFVkYU9YU2ZmZFI1Z2pCa281N25jNTNG?=
 =?utf-8?B?U2xTQXV1RUJvSE9jY1JuSGQxdkxMbmc0clArcnJ0SHdGVkpCa245RDUrTGpB?=
 =?utf-8?B?R2NYb2dPbmw4N09QV0JQMkEyZkdIWmZiQWdzaEtKYjBvSmR4N0pmc1QxTzUx?=
 =?utf-8?B?My9TSkJvbUFVWndwbm92eVBwQUJPSlc0c1U5SWVKQ01ValJuVEVOVTJZbDFr?=
 =?utf-8?B?aDR3aW93azJkNG1MemNUOXpDQXFrMUIxNUFDYU5oZ2Z5clZWV21SRlBFZnNX?=
 =?utf-8?B?dEVyREZnNXpRZXlpMFpITG9nWUxRa0xXL1BzSWFNMldJa1BZNkY3OW1uSnIv?=
 =?utf-8?B?ZzZSNFg3ZTg5UnF3RzB2c1lDSzAyeWFRM3dCald3Wk1XVU1Zd2U3eGFxOCtt?=
 =?utf-8?B?WlJwRUNId0pBUmdaQWhJQVpmOFB6Y08ra0U1TURELzN6ZUNzcjZhY0d5NDNz?=
 =?utf-8?B?Z0FZSk00Rko2V0dBakJ3KzFyNWhmVm5xTjM0SlZPOUpSU0k1eUR4Z21tdGZL?=
 =?utf-8?B?OGpJVWUxbnRFbU1nbzlVZTcwVHo1SGlhU0YrTHFhVzc1YVBXVXI0dmVoL3lj?=
 =?utf-8?B?cldhM2JaRUI2N2hLV1RMZkMvcFpFb3dhbU03clF1REVqSXcwZUFRVmtSVmdN?=
 =?utf-8?B?TDFqRE1lWWg4cVQrV3d0S0pPNmN2bGdnVGJZZXhnM3VtaU45bDJpYTBEVTdh?=
 =?utf-8?B?QlA3WWtEbUlRWWd2ZXlsTjc0d0dhRTRKN1hmUFdJTE50ZzhKZG1MSWxNSnlz?=
 =?utf-8?B?SlU4RzNGV21ueGN3Qm9nTmZ5M3p1eE9SdmJiL2FxSUxldEg4SkxKSVdjZ0Vl?=
 =?utf-8?B?NVRNdGJNWVJkU3VQVTc4Nm5kSVpxTkJCUk1hMEFsOWdUdURvZXlLbFFUdTcw?=
 =?utf-8?B?ZUwwZ1JKUTRHYmpGbmdlZzA3REs5YjBHcmF5aTVKN0FNdXhYdDlrenBLNnRM?=
 =?utf-8?B?MyttdG03anpkSFdQZGdCbUR6eFRpQlhWMnA5V3pYcnlsbTcvWldoeksrZklH?=
 =?utf-8?B?czJORm4rbGxIaUJJZjVhcmhabExUc0RTTHd5SE5kSXpxSlg3eFhaKzE3THhR?=
 =?utf-8?B?UjVZUnAxczR5SkloalovcDU2OHFDTzFORG9pMlJ5QUtsSDcrM015OWYvVko1?=
 =?utf-8?Q?KGGUH1OcUdBBmowiEUMJeqlY9xF4IY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJRZC9Yd092R3gxa0tJaCtSdHRrODVvWTFjYkJNK0FINUJJdmJhQ1ZBM0E5?=
 =?utf-8?B?WXU2Yms5ZUNpT3ZNMFJXbmRBdHJMS2w0ZG5oY0gwdDZaU3BaRmUvT2dQb0Q2?=
 =?utf-8?B?bXd1dlFoRGxtZTRvdWFlMzRBSmpIdFVJRlhEZVhDVXlDNnNHeUx0eTcwakkw?=
 =?utf-8?B?TkxpaFMvaGtqcGhjTTg5UHFzYVpFaGVDYVByTXZmZHFaQkZqR081S2F1RFBV?=
 =?utf-8?B?bnBsVnZXL2tOdTRzbUcyZkIzd0U3Y0owdE5jakN5cXkrSmsrdWVZa3RaaHJC?=
 =?utf-8?B?Wnp4R3FQVmJJdUx5YmRmaWRpM05xNHE0ZGJ6YkJuZmJselBjK2o3MDFnaEp1?=
 =?utf-8?B?bTBvT3NKRzZaUi9QWTd3UnlWQkpZOTRXdit6cDhjcTI5T3NjQ2dxdnZ5YXlE?=
 =?utf-8?B?byt4czB6RE00aVdzL0xzdVZuVkZXbXgvdlZ2TG9MN2xnMlhtc2NOK3hYeDRl?=
 =?utf-8?B?UFQ5SS9lcEVQQjZmc1VyQmg3eUF6VjNOSGFVcTREMHRuM05YVnlGQ1JNR0cw?=
 =?utf-8?B?SjNJWEg3SDZOV2U1NTNic1Q3VW9kM0RWdEFuclhTWnpCYTdoNjMxT0J4b1RT?=
 =?utf-8?B?R2FWV2xOMGcyajJYWUxMUU1sNmZZRzk2Q2ZSQy9GMXBzODdRbVRMeE5vanc4?=
 =?utf-8?B?dEptSFk2M3lvMUR2dlRQTEVhbnlvVSt4ajg2Skx1NHpMRmRLUFBIeFBkMHEy?=
 =?utf-8?B?ZjRWUWQxUDJweVJFZGFoSm4yWHp6MWRRWEVLQzNGdm9nenk1T3F2ZE9PVWxD?=
 =?utf-8?B?NzZvZkx4OHlPU0NiRmdkSWg4MDY5OHNMYU54Ti9ya2U2RU9zRFpWVGpncmpm?=
 =?utf-8?B?TFBJTmY2KzJZcVJCUlF1RTQrTDJYL25QZXlKa012ejJoRmsxa2FKaHpUQm9W?=
 =?utf-8?B?N05ZMlVoR2pad3BsUm0rNzVFWTBndC83OXhpUFE1OVpiTmcwdkFnNythYUVL?=
 =?utf-8?B?amtGckpFSERjTDFtTjJ0MWVxVjJtMDRCMHBMYWh1WkptRDBTaEhPbUkwSy85?=
 =?utf-8?B?UmMzRTRTMldXN1RYWlJNQUNQZVJzQ3hMc1NxQnJhRkZSazZJbGFBTi9BTjBh?=
 =?utf-8?B?MFVLYk9IL3Bjd1JaUDNJSjYrODZYYS95VDdMQWdYdFhKNEZyRWhkRFJGRXo3?=
 =?utf-8?B?dytXU0xmSWZtRTBaSitBOTJiWE5kTUx4YTVudWJkSzc0NGpMbWJwbEdPTWpv?=
 =?utf-8?B?eGRubVB3dmlLMFhnbUxpM05GaDNTaEZTQ3hwTUtCWU1OVTkvNXkxVVRZcDk3?=
 =?utf-8?B?NXpUMFVheDY1aWphczNFRnBNdXhoQVQ4eTd0T3pzTHJOMVRMakQyWE16clVq?=
 =?utf-8?B?R1RHeUU1MWJ4VUZyb3hSYjBWNE52WUtFNUdpWW50b1B2S0VDMHk0TW52eGF0?=
 =?utf-8?B?RTVLdWJ2bG9raUdsZk85T1hoWndOTDJydnVPNXU2Mnp1eFFSWHM0TW05Rngw?=
 =?utf-8?B?aklYWC9DZWU0NjdJTjM2eVhIdHZRaE03Wk9QYlQvT3NKNU5vdVZ0c0thdDRq?=
 =?utf-8?B?Rit1b0NGWmpZVDRzQlNpVCtrcXJkL3U5K2tiV09kbjAyWG85OWdYZ3ZMQ0tu?=
 =?utf-8?B?Y010SWFCdzBTeGJyb0ZsN3VMdk1wTHd5OWdnbFNpK1hiK2tSdU1EMUNtcVFv?=
 =?utf-8?B?dHRzbVZYN0NoelVIMUJzOXVGTEwxSUFCU2tlZlRSdjlJNHVpc0N6WVdXRk9G?=
 =?utf-8?B?QXVONVBzTWNxQlM3MnVpMG0wNHR3UXV6eTRmWjdscDVjLzhvTDdJa01ISHEw?=
 =?utf-8?B?cVZJbngvdjhaQngwTGFlUjlTUmR5N3JhUEY4cGJGYmM2SElYZk5rUEo5R3p6?=
 =?utf-8?B?aTZlNDRsR2ZEcVlLTVU5aDBJeUprZ09DaTF6NGQvUUF1YVhYVTRsU0hwWTVD?=
 =?utf-8?B?cFNkT3hHUTJKcGFrV0c3bmM3V0lWVEsxb3M2ajZNQ204bURVek9ma05NdlBO?=
 =?utf-8?B?bXNSWUlwMmtKanV4YzhJVHEvU1FzMk9tUzBtN0x0UFlER1lzRitTQ05hU3RR?=
 =?utf-8?B?QlFxYnZWQnN3Z1RiQ0RmWThid2p6TGRteHRSTEdNQmdybGc1UzhEN1IrL2RS?=
 =?utf-8?B?cGJJTHg4eGVIbnZPc0dpVGx0S0xLejd3UVdJalRUQm5rYzc4TnY1QjRHMlhl?=
 =?utf-8?B?S2lLUUd5b3hYelFGeWtpMUFjMG9hS2JYUldEcG9HSDdEdlZQd3FJTXNsd291?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd2859d-2213-4ef1-d236-08ddbfbd2c57
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:17.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn7UqQY0awwME92/51aFXWAYSSpZ2MIv2BjJJEWabIH8lrFjwHo+tYNy4PQ+lRCjazlaqcAacFLNDpKnacekkmLZgGKzL7Q1r0Sx8AzwPAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
The new bindings for the SIUL2 represent it as an MFD device:
- one cell for combined pinctrl&GPIO
- one cell for an NVMEM driver

This commit allows the existing driver to also be probed as an MFD cell.
The changes only impact the way the driver initializes the regmaps for
accessing MSCR and IMCR registers.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |   4 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 132 ++++++++++++++++++++++------
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  32 +++++--
 3 files changed, 136 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index add3c77ddfed..6ce7981208c7 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -2,7 +2,7 @@
  *
  * S32 pinmux core definitions
  *
- * Copyright 2016-2020, 2022 NXP
+ * Copyright 2016-2020, 2022, 2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Linaro Ltd.
@@ -28,6 +28,7 @@ struct s32_pin_group {
  * struct s32_pin_range - pin ID range for each memory region.
  * @start: start pin ID
  * @end: end pin ID
+ * @legacy: legacy standalone pinctrl driver or MFD cell
  */
 struct s32_pin_range {
 	unsigned int start;
@@ -39,6 +40,7 @@ struct s32_pinctrl_soc_data {
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
 	unsigned int mem_regions;
+	bool legacy;
 };
 
 struct s32_pinctrl_soc_info {
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index c03dac643cb3..18b81b246bec 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -39,6 +40,8 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+#define NVMEM_LAYOUT		"nvmem-layout"
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -101,6 +104,8 @@ struct s32_pinctrl_context {
  * @gpio_configs: saved configurations for GPIO pins
  * @gpio_configs_lock: lock for the `gpio_configs` list
  * @saved_context: configuration saved over system sleep
+ * @legacy: true if the old pinctrl bindings are in use
+ *	    instead of the newer MFD based ones
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -112,6 +117,7 @@ struct s32_pinctrl {
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context saved_context;
 #endif
+	bool legacy;
 };
 
 static struct s32_pinctrl_mem_region *
@@ -131,6 +137,19 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
+static struct device *s32_get_dev(struct s32_pinctrl *ipctl)
+{
+	if (ipctl->legacy)
+		return ipctl->dev;
+
+	return ipctl->dev->parent;
+}
+
+static struct device_node *s32_get_np(struct s32_pinctrl *ipctl)
+{
+	return s32_get_dev(ipctl)->of_node;
+}
+
 static int s32_check_pin(struct pinctrl_dev *pctldev,
 			 unsigned int pin)
 {
@@ -231,7 +250,7 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 				    const char *func_name)
 {
 	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = ipctl->dev;
+	struct device *dev = s32_get_dev(ipctl);
 	unsigned long *cfgs = NULL;
 	unsigned int n_cfgs, reserve = 1;
 	int n_pins, ret;
@@ -682,6 +701,11 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
+{
+	return container_of(chip, struct s32_pinctrl, gc);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -803,8 +827,8 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 }
 
 static int s32_pinctrl_parse_functions(struct device_node *np,
-					struct s32_pinctrl_soc_info *info,
-					u32 index)
+				       struct s32_pinctrl_soc_info *info,
+				       u32 index)
 {
 	struct pinfunction *func;
 	struct s32_pin_group *grp;
@@ -842,31 +866,24 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	return 0;
 }
 
-static int s32_pinctrl_probe_dt(struct platform_device *pdev,
-				struct s32_pinctrl *ipctl)
+static int legacy_s32_pinctrl_regmap_init(struct platform_device *pdev,
+					  struct s32_pinctrl *ipctl)
 {
 	struct s32_pinctrl_soc_info *info = ipctl->info;
-	struct device_node *np = pdev->dev.of_node;
+	const struct s32_pinctrl_soc_data *soc_data;
+	unsigned int mem_regions;
 	struct resource *res;
 	struct regmap *map;
 	void __iomem *base;
-	unsigned int mem_regions = info->soc_data->mem_regions;
-	int ret;
-	u32 nfuncs = 0;
 	u32 i = 0;
 
-	if (!np)
-		return -ENODEV;
+	soc_data = info->soc_data;
 
-	if (mem_regions == 0 || mem_regions >= 10000) {
-		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
-		return -EINVAL;
-	}
-
-	ipctl->regions = devm_kcalloc(&pdev->dev, mem_regions,
-				      sizeof(*ipctl->regions), GFP_KERNEL);
-	if (!ipctl->regions)
-		return -ENOMEM;
+	mem_regions = info->soc_data->mem_regions;
+	if (mem_regions == 0 || mem_regions >= 10000)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "mem_regions is invalid: %u\n",
+				     mem_regions);
 
 	for (i = 0; i < mem_regions; i++) {
 		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
@@ -881,7 +898,7 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 						 s32_regmap_config.reg_stride;
 
 		map = devm_regmap_init_mmio(&pdev->dev, base,
-						&s32_regmap_config);
+					    &s32_regmap_config);
 		if (IS_ERR(map)) {
 			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
 			return PTR_ERR(map);
@@ -891,7 +908,53 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
 	}
 
-	nfuncs = of_get_child_count(np);
+	return 0;
+}
+
+static int s32_pinctrl_mfd_regmap_init(struct platform_device *pdev,
+				       struct s32_pinctrl *ipctl)
+
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct s32_pinctrl_soc_info *info = ipctl->info;
+	const struct s32_pinctrl_soc_data *soc_data;
+	unsigned int mem_regions;
+	u8 regmap_type;
+	u32 i = 0, j;
+
+	soc_data = info->soc_data;
+
+	/* One MSCR and one IMCR region per SIUL2 module. */
+	mem_regions = info->soc_data->mem_regions;
+	if (mem_regions != mfd->num_siul2 * 2)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "mem_regions is invalid: %u\n",
+				     mem_regions);
+
+	for (i = 0; i < mem_regions; i++) {
+		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
+		j = i % mfd->num_siul2;
+		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
+		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
+	}
+
+	return 0;
+}
+
+static int s32_pinctrl_probe_dt(struct platform_device *pdev,
+				struct s32_pinctrl *ipctl)
+{
+	struct s32_pinctrl_soc_info *info = ipctl->info;
+	struct device_node *np = s32_get_np(ipctl);
+	u32 nfuncs = 0, i = 0;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	for_each_child_of_node_scoped(np, child)
+		if (strncmp(child->name, NVMEM_LAYOUT, sizeof(NVMEM_LAYOUT)))
+			++nfuncs;
 	if (nfuncs <= 0)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "No functions defined\n");
@@ -904,15 +967,18 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 
 	info->ngroups = 0;
 	for_each_child_of_node_scoped(np, child)
-		info->ngroups += of_get_child_count(child);
+		if (strncmp(child->name, NVMEM_LAYOUT, sizeof(NVMEM_LAYOUT)))
+			info->ngroups += of_get_child_count(child);
 
 	info->groups = devm_kcalloc(&pdev->dev, info->ngroups,
 				    sizeof(*info->groups), GFP_KERNEL);
 	if (!info->groups)
 		return -ENOMEM;
 
-	i = 0;
 	for_each_child_of_node_scoped(np, child) {
+		if (!strncmp(child->name, NVMEM_LAYOUT, sizeof(NVMEM_LAYOUT)))
+			continue;
+
 		ret = s32_pinctrl_parse_functions(child, info, i++);
 		if (ret)
 			return ret;
@@ -968,12 +1034,28 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->confops = &s32_pinconf_ops;
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
+	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
+				      sizeof(*ipctl->regions), GFP_KERNEL);
+	if (!ipctl->regions)
+		return -ENOMEM;
+
+	ipctl->legacy = soc_data->legacy;
+	if (soc_data->legacy)
+		ret = legacy_s32_pinctrl_regmap_init(pdev, ipctl);
+	else
+		ret = s32_pinctrl_mfd_regmap_init(pdev, ipctl);
+
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to init driver regmap!\n");
+
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+	ret = devm_pinctrl_register_and_init(s32_get_dev(ipctl),
+					     s32_pinctrl_desc,
 					     ipctl, &ipctl->pctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index c49d28793b69..2d56ffb1a109 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -3,7 +3,7 @@
  * NXP S32G pinctrl driver
  *
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright 2017-2018, 2020-2022, 2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  */
 
@@ -762,7 +762,7 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 	S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
 };
 
-static const struct s32_pin_range s32_pin_ranges_siul2[] = {
+static const struct s32_pin_range legacy_s32_pin_ranges_siul2[] = {
 	/* MSCR pin ID ranges */
 	S32_PIN_RANGE(0, 101),
 	S32_PIN_RANGE(112, 122),
@@ -773,27 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	S32_PIN_RANGE(942, 1007),
 };
 
-static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+static const struct s32_pinctrl_soc_data legacy_s32_pinctrl_data = {
 	.pins = s32_pinctrl_pads_siul2,
 	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
-	.mem_pin_ranges = s32_pin_ranges_siul2,
-	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.mem_pin_ranges = legacy_s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(legacy_s32_pin_ranges_siul2),
+	.legacy = true,
 };
 
 static const struct of_device_id s32_pinctrl_of_match[] = {
 	{
 		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
+		.data = &legacy_s32_pinctrl_data,
 	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
 
+static const struct s32_pin_range s32_pin_ranges_siul2[] = {
+	/* MSCR pin ID ranges */
+	S32_PIN_RANGE(0, 101),
+	S32_PIN_RANGE(112, 190),
+	/* IMCR pin ID ranges */
+	S32_PIN_RANGE(512, 595),
+	S32_PIN_RANGE(631, 1007),
+};
+
+static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+	.pins = s32_pinctrl_pads_siul2,
+	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
+	.mem_pin_ranges = s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.legacy = false,
+};
+
 static int s32g_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct s32_pinctrl_soc_data *soc_data;
 
 	soc_data = of_device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		soc_data = &s32_pinctrl_data;
 
 	return s32_pinctrl_probe(pdev, soc_data);
 }
-- 
2.45.2


