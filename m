Return-Path: <linux-gpio+bounces-23094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C930EB0050F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E6C93AD1F2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FC3274670;
	Thu, 10 Jul 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cBdrRcCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13132741CD;
	Thu, 10 Jul 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157338; cv=fail; b=IdE+TAWv/EZbF7agHdUX9XScpILoLl8hOx6CZq9a75Hpo8gpQjoORHwCj/TKXu40Oy4zopRv5vmLeI1lYhaavSeKe1HO85PvYaKcIwGV3V8452rCUz9moXnm+KrS2F8G5x87ayfKSkBYb5tVrOHevE5QBudtnzwap7gjaGUmlEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157338; c=relaxed/simple;
	bh=NSM9BYD3N74YB7RMfAOqqPazwt/ixQAq+OGRt7GDk3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ke5TYRMVLMZY9xyf5y6BcPnqsH+Dzl/P95g3BFrn/wRGd75twLk5Xd9E3xOP1VC4GHF8SBQaKPVK2YgtrWFUBF9qy5Z4e2+Ibw2oS3e9bgmcauCYxtx8V4JN/O48Gd80G0KvmL3odBTQPisjZYMNnrE0OyM9di0eLgvoCEIfPsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cBdrRcCm; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STkBkehgpNGkN3yDgeoHzvewtLBR1Vw48Da/WxD9tnCHbprWk4cTgA93C0cB6tMI8q5rLOkGslWz/roSWpu+wQ6LEjHwbAtzRRgdADoYyfrpSA49vSuwtd4PXT2uc7P3f7dp26oMd1SFScoZQHQX2vco8TcpmhFSUKaHcJhdhHrdhGRj3UoY0cAQESZoX4oUrbnj3L61X5Eid+RzoGaHDZ4HkIF4XWE3PutqUFWuCf6ggD0wvl74AwQxTkViqmlPi1dYPpEufJX30yePz/RKjriAFcdQj550C0Gq4ZeY1o5WVqqAyTsJtMJKJIGkCRiqPKq9b8lK6pnl5wMjumkE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqvW5LtGzoLXNiflXolcndBMsukNOB8RhMrWkKkz9H8=;
 b=H5wKffhXosfWhRJ6Y+H4AI3IZTdlm1XOwsu0OF5vpuyiaYeDeNeijlf58qpVNmPT5KYjtXcoFHtHyNJbMzJl84vfUjLmPlAjyGB+NUXy6mi0PPA6IbCJxo8fjtwuoN0NrOMbcG78IP7ptH4XSywpxw+8wNzxS24ort1z69R6MZH94gNdO5GY5xrQdJyCoFJW8/S6tj4EPLUpfnSyigw5S9IX/ScD42asM7wlGs0ZKqYfiHYoztUB8Z/S2t5N3DuVskGnmmQtpsfLpNMPnbn+kTGeUcYzR9+sTj5P/M38kV+cNSNcokNswMimZoDuHng4gpt/NEEqzpks3uJOKgGBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqvW5LtGzoLXNiflXolcndBMsukNOB8RhMrWkKkz9H8=;
 b=cBdrRcCmaSMdRoiPMK7BL8pq8VuBcHu/lOoeovdIqnRMM6ZqyZsROer4IEaeTfFZodMAQclp90iM+MEMZmTeW6ifgpjzx6aEc71MfiRr1jl2Hpyrpn+QNEMtrPENp4ufnfR2s6md5JlfiKRHrtViD/C/j4DmMpbZeJV4dBhJZjcI3+Hof9Li+x7Yl2JzIfBVocde9OQFUfSWuq+t4C6P1SHivp/NYxLtgwdqQaUXWyX094c2vLHBKYDYyof/q2br0P1fNvU1NZCl57mu29hj42OHuqtveZFXCcX7aQHO6dJ609Lv8fREly9Lrl+POTF14WWz6Qaji9/z23/Xza6WaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:12 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:12 +0000
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
Subject: [PATCH v7 05/12] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Thu, 10 Jul 2025 17:20:28 +0300
Message-ID: <20250710142038.1986052-6-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9fd66c8c-45a1-4a87-64cb-08ddbfbd2969
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXg5RGp0czRTN3F2c1c0REJIOUhCc3RwQUx4TGtEYmlYODJZajVaWEtIQUZX?=
 =?utf-8?B?M3NNMUkwekhlaGF4YWRGWWw5VEVkckdHT2IxS2FaVnF4MXhVeXR0RUZhOXkw?=
 =?utf-8?B?RWRZdmVJQlEzdXFxb3Q0bzN0QjlDWE0rZjB6VDZ5R3dMS0F1dHhJbjB6Z1hQ?=
 =?utf-8?B?d1Y4QzFoYnJaV1RJTEZnOTdZWkVUT1Q3VUdTRmxrVysydUQzSXRUZGN1SXJh?=
 =?utf-8?B?VmNkRWRYMkxhQTlaU1dXTzQvejJvUTRteElPQ1lXWUE4T29mbk1udThDYUJY?=
 =?utf-8?B?YnlCKzE1d2d2WUpkb0kzdGNDd1NTM0xBdW1UZE9LeG1SY24ybmN5aks2S3lL?=
 =?utf-8?B?cmI2RFc2Ukd3eXo4YlROV29Kd2pZNTNqTnhYREp3L2JFZFJQZ3ZHK3Z3ZzZq?=
 =?utf-8?B?bGxKV3NRMHdLNHJFQzR4N3FZRXZnMEtMTTFDelpZNUFTWmdEVElrNFNpWklo?=
 =?utf-8?B?b21henB2SWdMeHB6TmMweFpTSVZjNXRZSUI0VFpaNHc4aXNmMUVlY2FCK0VP?=
 =?utf-8?B?bmwxQUUyVHUwWUdsWTNKcjQ5NnFBV1Y3emt2MU4wVVpsT29qQWdFZ2JrT0tt?=
 =?utf-8?B?NGV3MFRLS3JVZFhKaytoUDZDaVZhZStQRzBqY0VHQkpVZ25ZeEtEYUV5bWJp?=
 =?utf-8?B?c0tOeWY4eU1SRVJhYXhicEROZStRSFlvTVJlUlY2cVZxbndDeGZKS1JKaTJ3?=
 =?utf-8?B?c1NhTGZUa3h0YnNkTlJtV1pNdXYwV1lTZUQrYlMrTlUydExjUndyaHo2TGVY?=
 =?utf-8?B?NFFpWkFSZXk1azdpczgzMzIzSm5MNTFtNnkxb2FxTDM1cWswejF5aHF3Njdw?=
 =?utf-8?B?T2RYdzhXT1dENjgzUFYwSWJ0eUpqMTFGY3cvN2RnU3RZYXc1K1ZWRWlicmox?=
 =?utf-8?B?Yit4MGphOW0zbFhNV0dFYlpGYjBBamMrcEIzYk0wNG1LSjB2WklSRFdPaHNZ?=
 =?utf-8?B?cCthRm1mZ2QwVHhnSHVLNFlWUFhqVVA5ang2aU5nT2lBTUR1KzNFZ3VqUzR4?=
 =?utf-8?B?MFYyMmQxVzJhdmVRYzJ3YTV1RlZjeUROSm9PUDQyRHFoUk84YllObVduQWdJ?=
 =?utf-8?B?bkhMZ1daeGJ6V3JsSDVmSmNzN0UvaXpLQitXV013cS9tTERjdTcrbzJrbW9w?=
 =?utf-8?B?ZUFrU3RucEluWnJiSnFJbzh0UDBJaWxZMmw0elpMNnNVbkdJaWVRdEFxdnNR?=
 =?utf-8?B?d1crTVZES1R5UmtMQk83eXpoSjJWU0FPUlM2cllMTk43ZTZXRDJHaTFCenRm?=
 =?utf-8?B?WHU4RlY3L0VqMWZoM1RTcTc5SElHN0ZtbWhzUTdvZWpic01kRnhDaFRaM1Z0?=
 =?utf-8?B?ZkQ5RUZYVnR4RXFxS0NxblR4dmxONVJwZ1I0R1B5L0orWTdpY3d0NU0rRS96?=
 =?utf-8?B?V1NzQXRxRGRCSk90U2xONzZVS1U2dW1IZmkvbWRXVzVkc2hXdnFlRnJMUnF5?=
 =?utf-8?B?WTJ5eWhWMUh6aVhBaURLOG5maEl4ZkFBSmluUHB6NC9Ga2NhMjZxWTB3SXY4?=
 =?utf-8?B?VTFtR3N1VEJXZzM4bjdlbnRSay8rTmRmandTK2k2YTNxUVYydXpwV3RFN2tM?=
 =?utf-8?B?Z1JyS1RYZG5QT3haZTdiTEorL1ZBOUV1eGtMVEJ5UmdJRHZyUlZkVTdnaUkr?=
 =?utf-8?B?T2Zzc29TZEZpbTFZNHBQQVhVYzBMM0I2dHBxNHp1MGFVZW5KQzY4YlVrTjVE?=
 =?utf-8?B?T3Z2eXZDenk2ZjNOVExwY2o5UkVPK2pOcVRvRXlhZzVwUWxWZWJqdERvT3B4?=
 =?utf-8?B?UkxCM1VmTHFnMFJFemovTmpXZ0RFWEJSUDN4dXc0a05mak5mUnRhM0FmTSs2?=
 =?utf-8?B?djZQOG1vQkJhSnRVTlZUWm1VdU95V3VTM2FlYUFmbE9HVnhsUExFSnM1N3Az?=
 =?utf-8?B?T3NOZDQySnpYZ3NzQWN4Zytpc0tZZEZ6WG03dWpFNjVySWhQVHRCWFk2UGVV?=
 =?utf-8?B?TGE0d3ZJbDVpaWpUYUxFdW1WVXNKR1BmdFY3bHBVcHY1R2NEYnJJQ0tIenBC?=
 =?utf-8?Q?UwrQ+ujgMkcvGFqLFD4HJDe6BY5Deg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzdnRS9ueDBXamxkZU5GVkhYNFNsUGZ2ZUwwU2VpWWJwTWUwcVdQa3doTG5I?=
 =?utf-8?B?RlJQUU40SDNNM1hnRlFsRUNndTkxMnNyN0YyVUVNQ3hRVVdEWDhpQTlrWFkr?=
 =?utf-8?B?c1hBSnRhci9uZjlydnppMVF3cU9Sa0lFcmZOU1dHKzMzcWxYZDdoNGcxcVYx?=
 =?utf-8?B?dUs0UkxwWkczRk1QMW5kNVFpK3lzN1Q5aERhUUZFOHNwZGRITVVOMC9WWmFH?=
 =?utf-8?B?YUNmZnFQTnRZRnRQK3hQcnN3MjBuNzBDWFExcnc5a1pSSmtwc3lqczZtaWFp?=
 =?utf-8?B?MEFXTDRGYmpIb0xjZ2VEVzl4OW40dE5CczEwR0l1ejA3bk9RSDBNRlR5V3dB?=
 =?utf-8?B?VWZyMjFFTmJKMFVwbVZNbDROYkwrdVVqUXdxQkQwa29GbW9GdFNoS2EySDh1?=
 =?utf-8?B?RjhTcWZWRU4vNEhuM2xHWkVZY3dTRHY4ZTRhMzJ5Ry8ycXlRY2s0VWlTY3Nm?=
 =?utf-8?B?dkNVelEwdWdLcnJnYm1KeUhpVWN2b1dnNTk1S3hkV2pIM1NaQlp2anIxcE1B?=
 =?utf-8?B?UmRMb2UxMU0vWDVtUXR2bEhNc010eThQUGQ5V1JSeTRtdEwyZEZ0SlJmaXFW?=
 =?utf-8?B?OXlwQVdqNUZQZHNBcmgyYjRrQ0l5V01la1hlaG5DZDJud1VTeFhzQm80Z3JV?=
 =?utf-8?B?V2VvdjNQMmprMmk3dkRPZEVlWWk2QmJ4Qk1FSk0wRSt6cW1xbFhDanZGMDBo?=
 =?utf-8?B?MUxodHY0UFVBYWRFd0RaaktWNGsvd2J3aC83LzBibEd4eVhyZUErMCtTUCtR?=
 =?utf-8?B?T3ZySTl5RU1xbFBQeGxpWDgrN3Vqd1lYeWkrNkF3ZEpYdjF6a2gxY1NDZUFU?=
 =?utf-8?B?QWZuY3ZUdVF5cjVxdVB1V3VPTTZSUTl3QzVKbGcrbmd5WW83NjN2TkFjK21B?=
 =?utf-8?B?Y0Y3bDNBTUJDZUVMc3hiWnB2ZTRsSkNSZm5GMUpHbU9zcnJNN1VOZUF4SStX?=
 =?utf-8?B?Sk9QcEcrL00wUlJWV09PS3JGaXNFaE9FaVhIL1Rjb2FmdDFyZkx3TTR0anE5?=
 =?utf-8?B?YXhDbUp1UXJNUHRhcEQ0RmdEZGZuQkJDREQ4WWtCVm1XQmdXSTBrZDBaVFha?=
 =?utf-8?B?d1lFS05ZL3lrTUd0YVhReTkxamc5bm5DekIyYnZPZ2gzR3Via3RFVHVjU01P?=
 =?utf-8?B?dzZScG1jbDE4RnpxSlFzNzB0VnZscUhxOUM0SnF1cWorVVB5MjBBWk5ORzBP?=
 =?utf-8?B?anptWitVQWY4YUhBRHdMZU5ycFRSWmtsb1JNcm5ZNDRITmhaSEtCdVdIamRW?=
 =?utf-8?B?TzNtakwxZDZsSnJJV09jcUM3YWhuYVg3L2s3ckV3eWxicEliRWtESHovb1NX?=
 =?utf-8?B?d0dlWEVWbE1ZWm0rT0s0WEVLM1V0NnZYRXdYZEt6anJkejRJVitMMHJBUk1y?=
 =?utf-8?B?T2k1clNxQ0RMajE5QW85NUVJd2FvTzZ2cjlUc0dZY290Y0pJMGlUTlhKSU9u?=
 =?utf-8?B?MmQvejh5L0RjeWlEekhEeEROdFU5MExndmE0YkZnNGIwSXRRdThVTlVOcWVG?=
 =?utf-8?B?MGt6bEN2L3ZIcFFUNkRQV0ZWTkc4cWhlYUVPVUw3dGNGR3dBZVpQL0lUcG1G?=
 =?utf-8?B?NXM2ZEFYcnl5ajE4eXhoNTJVYnZ1WHZzNnV6TkZlMmcwU3ZGNDVIRmJnMkVB?=
 =?utf-8?B?ZEFqTUFUU0pFQ0w2cExsdlFNYTc1MWx1Z0JDODZKMUFhYkNLYlEwYW94OFpN?=
 =?utf-8?B?WVcwUXpRb1AxVjZjcEhBOFNUVWJsendJVTI1MmZJMTVzdHFLM0xId2dKNGx6?=
 =?utf-8?B?K1JXMFo2S0NOb3RxNTJjNitFU0J0eUp1Z3BTcDJGQ1pKYUVMV0VZT3R0OE1Z?=
 =?utf-8?B?dXMrMk9vRkxKM2crUGl4VE5UK2ovNStwR25vcWJldUhBVWdmUmtnN1J4RVBw?=
 =?utf-8?B?MlhYdy93S01HRHlQZWJ5YUgzb0FTYzdQMWlpQVJCWFVXWkdLdU1zM2JvRUdE?=
 =?utf-8?B?RFA0RmI1QUNrRmVrcDdqMVFrM1JwRXRHQUN6b1FuVEZvbXVtVG9FMUE3alAy?=
 =?utf-8?B?WHpjRHhMdnZHYmliRUsrZVhEM0VTUFpEU1orL3hFMjBwZDN2NFZOaGRHa1hi?=
 =?utf-8?B?SUJLTktUblRacUMwalFLT3BKVzMrbzdQaHZwb1orY1pjOVh4bXdDa0ZsaXZI?=
 =?utf-8?B?UTZxaHY5QzNZazBTR1RJcGRRTllvUk1FMnNxeUxlTmNMWWp0SHp1aWhNTEhv?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd66c8c-45a1-4a87-64cb-08ddbfbd2969
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:12.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oiTN7SdqYtnF4dUAmfhBonVbJotasFME77k7wZ4YUAasBCtH7dP8DQV+V48doTpGDG8NnO4jApI8Flg/VHBHz6E4nBZ1uVxFS3t5BFyAFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index c90cd96a9dc4..c03dac643cb3 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -973,10 +973,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -989,7 +989,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.45.2


