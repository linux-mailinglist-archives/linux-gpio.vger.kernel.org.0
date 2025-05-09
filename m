Return-Path: <linux-gpio+bounces-19809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E9AB0955
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA1C9C07B2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B92264A84;
	Fri,  9 May 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ToQgj6T+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2041.outbound.protection.outlook.com [40.107.249.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDC264633;
	Fri,  9 May 2025 04:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766032; cv=fail; b=sKaCldbWKmjKYyCCex2OGNEPJd7aSNANhctNbPQCSoW2hq5GaAuctJbUQ6RGYCTk8K0bw+kO0Shb5t/mOxvAXX+WnCRb/Ubt4GFXMKufpobXCyFVMJY5x26P9TbGP5vq3YuUBdA3DJiM+wIqUpCqoYG99oQ+62GVWzXUIp4DMDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766032; c=relaxed/simple;
	bh=VzHhN9I4lLjZJT316RIURX3UVBZMrOsA9pUkfyh8sxU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i5gOaaykZgp84fp3Lgf4G+Evsj9+26AtqVG4QvyZkqOt0cao3nXGXz0LChh0abSLOOsvvKSYZ47opiUUDE51Wh9Q/T6hJc8iNbBjH1XfsyjN8smUbI6Jj7RIP0Tv2WQqktwSbgOq1ceOBWkpiFQXOoIHqq6HMWj2tPrFJLFeXGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ToQgj6T+; arc=fail smtp.client-ip=40.107.249.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxEOxc0ro9nf/HxWAkiEgOAQ6uvdGrGkmzJRV1Jm2eN7kYmfSeiBo4AbmznJ5E0xppVQg/InCVGr0G14cQl+qRoTnw94gjPinokvIdFsPhzNdrlQuc2ylMispT5jI5NsTxfeuXCmATgtTMvuMHyUPj/kFuQwenRXFtJXdRoFwGC3Oz7+iIXOIk6CJYeBwj82FUeHtKnLhby6DYtiPlITeEDxGpzIzUKcUrvdfLTNK/l3OkGjJSVqjteYnaooaSszzUDzioMypSFS58Ryo4E+83LDyo7Cus4xq/kbiVoHyIHmfatr8T+Srhj+I4mEo81oYL2W+Cm2QAx+pZoHA5OSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS7b4LgF6GBGG7jzg46Ynpmrw8c37xEpmIqwlULhey0=;
 b=LYVSFmJ1sjUlmv+nkmSOAwePkcQ2qv123MwNUQSzrK/EOKa0+YtUfDdpsTXVFvosOp8gM2n39H5Nf9+pSyisEctix5v6yGJrjTeuxvSUvQP0lw4I/etOEQCOjPcXCtooF+UaPzxatU2sylSF6nhjFrMSp/opyquRAlIDH1LFeMQPJZStTKObLyKOi0/vTfY0yXHoGZcub8/LjaOtAm6hL1Xi5Oa9gallnEHOK/mpmcyTNNyDD9DYf7zTCmsw7zH8psmREW8hMwS6aC1RSzbbm3yzfs2BUGRqOVRttjnBoHAEVBarIu1zK/fPrAfTjCd6qE9Vd94RJGAst8WBCJDPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS7b4LgF6GBGG7jzg46Ynpmrw8c37xEpmIqwlULhey0=;
 b=ToQgj6T+mBp0/0rMKxGDEOuU8XcmVTHqWDAlIGYIdzPbTf6Q2v5ULYWVYrCFxXuks9gCZstVf3ZAfgmYUP4P+goIzD5RPxJjUZbW2ojmM0Qf1h1QuR69qnUZ+rhvkTDLY5bVes18jtHKGtXwZipQdKqA4HYoIiT0SRe+RTy9EhwK83OL658wWk//vsYEeOASIjYixwJocHHUeWl3qYtjtjgNCu/wMKqxCoG5X7EazNWIJr3LJnyjcHWxqCTdcZ3K9fSehK7ulknXPTtLO1Qrf+Tqzc9e8Vcx/9z3Kxn+11uRGSNEnrXh/mJ5sW2pdivJyNdOcWCV2DexmxGRejFD9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:32 +0800
Subject: [PATCH RFC 1/9] gpio: bcm-kona: make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-1-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1154;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+czX987lHw7YdsJy0OqqXqyZxlQ8brvuzmo4B/Dqc/o=;
 b=6mZxSUh54AnoFAjeksq5/Gcgi2jFo/JlxzSucdd4eMV40L6I6OtR/OT7fP90VuwWjIMF12tbs
 7QjnkXTM/+hBH276Nm9nZXLB68AH1nP7sc0IKVc0cRRAfBITf5sxX+8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 548fc7c2-7ee7-4dcb-3d22-08dd8eb48dae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3pEUjVWcGVDWEd0YWoxNG8ySmtUTmYzVkdqaUtqcTBPQ2hqNWZ4YzFlN2VT?=
 =?utf-8?B?eDI3b2VET1M2TitqU1o4bCtBb3lGV05zQ3Z0YXVBbllON2x6U0xuWkxlYU5Z?=
 =?utf-8?B?cG9SZ3NGVFZrRk9aWVRKR01qU2NrY0JjU2VxT1dUQUFDR3RqcWQwenhCS3VW?=
 =?utf-8?B?ZGxQKzkvTGVQMndFcXdQYUZBZW9FWXUxWUxwUmwxVzd5TkJIeXRjT0lqeENM?=
 =?utf-8?B?ZjdObWdtQlZoSTN3YXl4TVJGUUJidG9GN1RtWHhPL2ZkTUtsL2dVcG5xcFB4?=
 =?utf-8?B?cmFWODRCRW8rVjNVRi81eE51ekdxc0RjbDJwZE1kcWEvZDZ0YmdvRjEvSEt0?=
 =?utf-8?B?N2JybDQ0NGMzNWxXR0dHOC9ES0dJdmM4OUdLM0dSbnVQU1pHbTNBeTZBMEwy?=
 =?utf-8?B?ZDVidytWWFJoOXNSS3pCeFRlaFNTbjZiR2JIQ0d5VVFEWkNmVktqWU03Z1pk?=
 =?utf-8?B?Vm1JZmNRdG5MTlkzWW80bGo2bW1jMG1hTU9DQ0VBeUlORG1LeStuTEFqd1Yw?=
 =?utf-8?B?TEhQdjlGZVd3YmFTam1idTAvTjVoOWdXcmhRbnZmUkN1d2l3OFl0OVRlSkx6?=
 =?utf-8?B?R1lIeDFtUS9oV04veXZNM0pxbFJ4OERtQmNQZ0VIa3NDQldkN2k4cEpDdk9k?=
 =?utf-8?B?S2tPQWdNQ1diczBCUkN5SCtGcWVYejBkdmhySE9MMis4REZlajlzK0tsUDNL?=
 =?utf-8?B?cnRlL3lJdE5pZE5XeUhaWXdtVGd2T0IzTUF4NFRCWjFhektnK01mTkZlS3d6?=
 =?utf-8?B?N2RaN2tjZVhNSTFoU2xpUkIzdUIydm5sU05YT1BGb2gyNHQrUHhZQzc2SERZ?=
 =?utf-8?B?SGpzejJIMjBkdGtTekR1UW0weVhKTTNGSWpwbG9FMGJNS2FTTUI5akx6aVor?=
 =?utf-8?B?bGtyaXJGM3pxUFlVNEI4NUpFK3pjSjR3bmhUbVgwYnlMTjRrRHJnQWdrV1oy?=
 =?utf-8?B?WDFHVHZrVWZZek16VEI2RzFtWG9jSW96SjhnSzZqTzZGK2Vib2JQMGUwNzJ4?=
 =?utf-8?B?Q0M1TDd4MVBwcnNJOU9OdTBFVDl1emIzMEp4cDI5ekNVcHhkS1JoYTc2M3JK?=
 =?utf-8?B?bmVMallTOVprUzdMbnJLUVdvL0ZTakxPa3JTamdBWThnYkMyTUtjSzhPdVNr?=
 =?utf-8?B?UEE3ajc2U0lmaFRudFRRbEhuRVMxa1o1MzlDRzdqVHkxZ0dIbUtZTmVQNzNo?=
 =?utf-8?B?SGRLUVlXVFBkTWd0MXdncVd4cjVkd3VML0xMcU5UeGpkcnBEOWhhbGJibHM0?=
 =?utf-8?B?QTRRYlp6ZGtQRlVJN3FPc3RzVjQwd2l1KzJqRGZLZk9vZUtXaEE2TXNnVmFW?=
 =?utf-8?B?TnFWU2svVUNMcmQ5VjhKUTl1TmJoaXd1WW9aZEJuR2tHNm1qdUZPU2xTditp?=
 =?utf-8?B?NGtPaUdRTEx2UkswbUQ5YVphSDdXdnRrYVNYZDdZNXZLRlZWSmp3dUM4U1Z2?=
 =?utf-8?B?RE5mS1VZWG1ZR0VwTzlTektwamRKcnBaNWhtWWVqdjcxNEppZnRDRUlZWFdB?=
 =?utf-8?B?WWtsRWJWeUQxUXdnTk9hMFVoK3RpMEZ2SC92QWdVQjFMYS90QndWV0kxWkVo?=
 =?utf-8?B?UzM4Snk3ZUxFTmVpdDcyZk1QVlduSXcwL1h4ZjZOaHJ1WHhSL0N6N3pKZG9m?=
 =?utf-8?B?amFVU0NRNk1MZFZUbUhSTDh0RmJ3a1pCWHZQTU1sNjFtUGQ5dUxJallkYVFM?=
 =?utf-8?B?cE5UYUVLeEs0WmUyZklwZE1QZlFuN2g2Ni9Sa3liQU93S1k4L05LSnVqYy8w?=
 =?utf-8?B?YVNSd0g3WlZ0SmVlbUFsYXpMY1JxRFVGdjJ5blppSGpRMHBPdWhIQmdrUDVM?=
 =?utf-8?B?bzFZajdMM2JveldkL2syUGdyWmRocTg1dUJrUXk1cjQ0Q3l4Q1h1R2ZxYits?=
 =?utf-8?B?dm5KVXJwcjJsYm9DWTQyM3ozN3hITVdMazhYZWx1UzdSMHVBS2xQYkVxa0Vn?=
 =?utf-8?B?VkZrcHJQWksrQ1RZY0p0SFkydkgrdTlUL2MzOHNTTDdUUHcrQVQzdmZRL25M?=
 =?utf-8?B?Z1ppVkcrb3pZaXoxaitUUnMyNGtaRW1jMEdhZjRULy9jQk5CNkF4WEFWUmha?=
 =?utf-8?Q?yoUqmB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emFjdFpRbXhibTc1N0xVK25waTlhVldkY3FFVzlNNnpwUjJQVzdLc2Q2YXdq?=
 =?utf-8?B?Z3JtRFRzeVM5UUdIZkZXYjlYby91WTJrRGVNK2V2QTFqQnJuK2owVTFqdkdL?=
 =?utf-8?B?SXN3cUczM2k1VlcrckRhOERxaFg0TUJDZy9mUFdPVU9zK1EyaTNpYkgwa2tp?=
 =?utf-8?B?cWZoVG5FZXBlK0tjTGkvVlhvWHcxNm9pODlkSFR0WHlOWStyelBXNU9pMUlr?=
 =?utf-8?B?azlzQk13VlVnZHRuNlMvZHhBUkJHWXc4T0wrN1g3NnlwTm55S0pPQmxJaXVX?=
 =?utf-8?B?UEthcURTZkcwOEQ2dERIaEU0aDZhKy9Gb1o4M1VMckFOTTJMdG5KTW9oRDM2?=
 =?utf-8?B?Ri9uc0pCZXdZTWNrY1MxVWY5bldDbDU4bVJwRUVCY1FyZENKOWhPdnZNYWUw?=
 =?utf-8?B?SUtZcERxS3FMM2wrNnZwQ0tVQk5UejhSK1FMVWU2bkp6ZkllY0pqbDByNzJU?=
 =?utf-8?B?NW0zUmRxRDRmQml6c0swSS9abGErcGFsTWlHUGJpc2dLKzI0SVp0dVpnNHlS?=
 =?utf-8?B?STQ0MjFyMzRROHhKWU9QTlpVczNodjlUNEMrT0g5R3d0eWF6RERBWmdFOG80?=
 =?utf-8?B?cmNJTm1QNi8zR2JFVzNGTVk1dHBSV2dzbDZiWG9CM0VyWWNaZDhEMlIrN3RN?=
 =?utf-8?B?Ry9KQm5PUTIvWThxaDMwQWtxazdOMXdWZVk3WCtwT2YvaXVWTkVnZHl5TlUr?=
 =?utf-8?B?bFdEVHlaamI3alA5NTdKejBsSWJBdCtTQm1xZERpYjZFK0xZMmpxZEhKa3o2?=
 =?utf-8?B?RVd6MVBwUGFaTDN2d2h6eG5SWTUwQUFmMXgvWTU4ejRxZ2lDOWx4bGxlMUo4?=
 =?utf-8?B?ZXRhYjlMTG5UcnhzcWRhdTFxZGFKYUM5US9MdnhVWWxQc0NCRUFlUVdtaDRy?=
 =?utf-8?B?aTBOVkhsdXM2NjArL3gyeHpmZ0hHdVBKRGY0TzFSNlloR0VTS3dUcExobGQy?=
 =?utf-8?B?T2lQNzlMZkNXN1RnZkJpdnBHb3lUNnB0YWJFaFNDSjVtTlJJOWVCMzBiSHRm?=
 =?utf-8?B?V3Y0WnlLS3p2L0xYNnFIUjd3ZEJXcEkyQW03RGFqVUpwRGw0Z3Mzc0pCWDN2?=
 =?utf-8?B?TjB0RTdjNkx2N2w3R1YyYUZhZDJTSE1UaG1XbXc3dk5zRXRadmc2TW5XTzN0?=
 =?utf-8?B?TXNkRmhKUzRoWUtKUkJtMXpNUHZ6WENrSFNINFMrR1J1TnpxUUpGa1VwbG0z?=
 =?utf-8?B?Z01GRXlaeW52NVZqaHJYZDRPT0dyWVJwdVJYSklUYU1wWlk4bHo3c0lCSE1V?=
 =?utf-8?B?ajJhenIvdzc3OTZxcEN5NER0aWp6c2x1d3JQRXlpNlRaNVB0SDczOGc5Zm5w?=
 =?utf-8?B?UEVxbnA3Y2M5TTNHMWdMaFpGS3F5eGtYdERmbXlpdklpM09MM1dWWkpQOVhG?=
 =?utf-8?B?T1R2eTFHM1VXU0ZRejdmTHhlZ3g4dzlRRFE2QWw0dVhEV0dLZVd3SlZDT0Fy?=
 =?utf-8?B?N3VsS25ycVhPS3NkaHZzQVJVMFQ4WjVVeXAra3V2dVcvbkdBcGdRL2tKV09X?=
 =?utf-8?B?MmV2d2NtdW0raWRmM2N2ai9qdng0WWQ5djFrNUg4K2g5SzFQbnA5eUN5T1dE?=
 =?utf-8?B?VHREL3NFUVhkRnBHUjRGemNhZ1ZlRHFQRTVDV2k4WSt5OG05SVRnRDhwTUZy?=
 =?utf-8?B?ZWFMZ3M3YnVXeHoxME42T2RENmdXUTNUQ0hRVU9vVDR2TGlqTXArRUdueTMv?=
 =?utf-8?B?L0hUcURwcFhHYUhuUGF4ZThQOXhub0wzUG9FYVhWRktBRGFHYkZBSDRwcWxz?=
 =?utf-8?B?bGpxK0s1d2p0eGd5cFYvVVZTRlU3QWVYbWRJbm10YWtFeUllQUhpMHAyMFFo?=
 =?utf-8?B?TmNHcFNHNHg1Tk4xMkFxSnlYKzROVHpiMEdGYzFjWlQ4T2l2cks5NENYaHJD?=
 =?utf-8?B?UU4wOXB1eTVJS0dhbEc3REdyRlNxdkwrbVNSSUt4dGVUVW9lbEpiY1ZTam9X?=
 =?utf-8?B?VUx0bjRkdWt0SHQ3MFFYNW51UGp6V0ZlWnd6OXlReDRwbWxQaDJnclJhdWpv?=
 =?utf-8?B?QXZ3Zjl1OXZZS1dHbDRrV3Z5T0NNUUFNeDA1TmkwMDdUTEMvbEVLS2RBZ2xT?=
 =?utf-8?B?NmQ0YlR2V3ZPdXFONnZjNmordmhLK3lVNmN6bFlMSkZBOThFQ2FlTGFKditr?=
 =?utf-8?Q?BxT8Z1lP/mj8xqx9KmIvBGVCk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548fc7c2-7ee7-4dcb-3d22-08dd8eb48dae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:08.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hx2Z2q1UVucpX0YU5CuttWw+9pVth0Tw2CtSh3wd9To8/IAygfTS2R7E98hSV8FheuNd1W7MGVapMVcVhTnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

The gpiolib is moving to make irq_chip immutable, otherwise
there is warning: "not an immutable chip, please consider fixing it!"

The bcm_gpio_irq_chip already has irq hooks configured correctly,
bcm_kona_gpio_irq_mask/bcm_kona_gpio_irq_unmask calls gpiochip_disable_irq/
gpiochip_enable_irq, and bcm_kona_gpio_irq_reqres/irq_release_resources
calls gpiochip_reqres_irq/gpiochip_relres_irq.

So just need to  flag it as IRQCHIP_IMMUTABLE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-bcm-kona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 17c287dc747151c6217c11fe77d83e3542e830c2..8f22cb36004d4b27a3ca33352dd1ae176aee5331 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -516,6 +516,7 @@ static struct irq_chip bcm_gpio_irq_chip = {
 	.irq_set_type = bcm_kona_gpio_irq_set_type,
 	.irq_request_resources = bcm_kona_gpio_irq_reqres,
 	.irq_release_resources = bcm_kona_gpio_irq_relres,
+	.flags = IRQCHIP_IMMUTABLE,
 };
 
 static struct of_device_id const bcm_kona_gpio_of_match[] = {

-- 
2.37.1


