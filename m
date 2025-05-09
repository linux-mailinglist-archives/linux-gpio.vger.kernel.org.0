Return-Path: <linux-gpio+bounces-19815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48854AB0960
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16634C531F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A873726658D;
	Fri,  9 May 2025 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h1DK899X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37226656C;
	Fri,  9 May 2025 04:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766055; cv=fail; b=RoIaltWAUCk6RyEqHqWkXqVHsJ5w3u0niLELCBydivaK42tRcL7Mzup8YXA219nkN07zdVMS1mwPtbJOaEisSdFdZE6wWRj6K8UV4A/1Nv+nEmjUPx3V4JAW3tf9ZAcR9RMbvwzwvfIsjmcgVZWxmrmFsfnfVjLDKzh0b6C9BLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766055; c=relaxed/simple;
	bh=XPVdPghn0ZV+h869NBsb8p2uaI7YvOSKG5FJP8E162o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TXGvtqZdf5iJ9Bo4YJmEyTrus+LHXlqzA0afNOtzG1zZmMd7HD/fvHiUxMw0xi6Ti8o0RbZ4hATNFYsseg9ynqfFQCtEGvwgoEKUqVfxki797h1fkzudUeerrcNKTgO6rN5FykgyiJN3hWAAAoft6QQZBzlWq+lrQtextVF3bEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h1DK899X; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWomLKEwsD/Q/E4A/vpLQDttDHR3+JPoCPJqX/wOtsROr0D97hCgjtDJktNp8eZyPapBHYIbec5ftHO2wB9DsBU5zqDvkZT9qYeuqV/DM+zfVEuw1jylTkmtZFTP2tIDlkWDENsn5ziezoOyvDqkaCleIhZWdsqiMMNGcUDBHFTiYdmjCQHVmii3AxlvOEontxrdhkpcJ9uBttvCexfxrYEBl8K2TkZGIO77r96fNCffNR1jt0tD3Zwme/wUblQmjHrzCg629pYQ8UnyrC5/SY9ndwozR6E7y3A2WFRTrZ4PfhBN3nJOcxNwQBvTMuufIbrqEExRipMQP7AuF000kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkwRetyU53rduLeEtVzRo0QbVvLj3VhvAQTFT81haC4=;
 b=Fd1BvtVu1Wk8VyKBNDNOR9eADa1H3KtIXT4frNRfy/JVchRNG+SCXTCowP290Vqzs4B9J3O7xh8AgVGdgLHY0LYRKv/Vm6TjJxgVdbiCgK3ZnI7q3VFpIb/GBtJzSBEYGTx250AiIVK+F8cBf+LFDXnIAqFSUyfzWV6wqNUYpB5oX1z1NNXxNPRh9nb1Q2Ap6gLGgS38uS2fvhlGHM24WCiQQBOA9FJtjTJFF360ukqNtqBgz4m2DgjoKeWUgQf4VOt+iW/soCR5Zp4H/C834snsQqR7aqQU12OOhGxTRU8avEjIL+eTET0IJq+mxjzsomSsX3JEVdUeIfIE2at7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkwRetyU53rduLeEtVzRo0QbVvLj3VhvAQTFT81haC4=;
 b=h1DK899Xa5ol5ZOrWe80+i4V0vGl8DMxOKhqPuAiKwUUu17Ztasz/t6xYtAa75epwFoz0NPFqw3bJgCfaTrX925+gyi01lJXlDpiBdESuIn26ua9O6NMhgNnChOtvFF021KSlQA9W1Hr6tR7CTn7IjsPzk7ml94MT8S6c3V9ZzZdeqi3YAIlfAcld5Kwe8RRFgnLvWQnJOW3IkJSKJrcKL5w517OXYz6ajBGIXQKwRxh+IWvbAo/STeS3xhBlL99evbr1GW2OiuXU9pNWUknRwuhzaJEElAtzzehgoBAYDvx/orDt9Z5Xvj5xaH0lubC/31yDYO7Ejs9GicmC3ifwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:38 +0800
Subject: [PATCH RFC 7/9] gpio: xgene-sb: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-7-639377c98288@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1802;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=hlzn7+kz34e+S5Z+vmcN6kj5jbURUYIZf51GmHf01Qk=;
 b=l8eUAm32i2fOhJoKboUlttzOs7XJd3Dos0FvvBeEYrY3ibbEdIGNow0oopkD9IRo47pJlLMqm
 EY/nKG/eH01D4qBhEy6mGowiVUiLDFShQ7I6h2pcJ+LEqw3PUg4Nk2t
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
X-MS-Office365-Filtering-Correlation-Id: 64601b14-f260-4582-b350-08dd8eb49b3a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWR5d3g4KytESXJTNE1VOW4xSWs1Vm5oODhGVTVlcE1xaFJvOUVaS3UwYldo?=
 =?utf-8?B?WVp2S3JDaFlGZ1pLWHFNSEJNdEJMWlRWbjRMT3hBblA2dUJVZmlDM09aRE5L?=
 =?utf-8?B?Q3N4RkdNRGFUeTlyWVA4dGg3WDBtb25FQ0JlMGloTGlXNzhndGIwN2c0b3Y2?=
 =?utf-8?B?ZVR5dWlwbS9YNm1hd2JjNmprR2tEeFQzWVg5QmUzSEY0NXdreHNsa2VYZ29w?=
 =?utf-8?B?a1B2NHRKV2ZnQ1JmaVlreVdoTmJWbkFqb0hsdGNjcHgrQ2ZtQndsSjMxenZF?=
 =?utf-8?B?NzAvL1p0djR2Y205Q2V6Y2VpUG5weVo5a29KVnhGZW5RUjNEOCtQUmZxQ0FY?=
 =?utf-8?B?SHpyTjUzUWNIYXJiYTZFQVc5MXJMb1J5b2paVG83T1BoZnRXMkNWcERLb3FF?=
 =?utf-8?B?U0Z6eGRiTjBtSk9xazV3S1dlUUx2eFY3RHhpQ0xNZnR5SVNKMEdpNFp5b2cx?=
 =?utf-8?B?clowb3cxcWt5WG1PZSt6WVJlSTdkdDhnUDdXQTkrQmtNYS8vaGNyRHB4SE1Q?=
 =?utf-8?B?cDdpdFFaTHhTV3grMHFiM3FXNlYxK3VrZTE4OGtxelFSY3BXSXhlS0grcTU5?=
 =?utf-8?B?bmt0Y3FUcC9EMmFIM0FrL0djbGNrcmQyZTI3d05tTUlqQXV1U0pubW9IcSta?=
 =?utf-8?B?QUpqam9nNXRiaFllMG01TndTa2ZnaHVBNXdmdkRpdFJFbm5RT3hNeTJuc254?=
 =?utf-8?B?WFBzb215VmxPS1liQjFZV1UzUTAybWxpQXNGOG5FQWFzVE95Skd4NjJDY3Ro?=
 =?utf-8?B?czdEaWJXbVdLQ1ZGWVkrYnRuSXNRQjArWXYrZ25CVVgwcXNnWE40ZzNldlFq?=
 =?utf-8?B?SjJBNGpJRjRuU25KZmJJdVk0YjV1SGpwUDE1T1FUYVZjdFRldUJLb1lTbUNT?=
 =?utf-8?B?U2t1VkFQMVNHbG5DcTRIU21ldXZGV256RUJhUWczR0Rpa0dPWFVibVRGSUg3?=
 =?utf-8?B?bm5hVUh0UFc3V0QwK0pEMzlLMEtIaTdkZGZHcENKZlNodVJpdkVlNm4yQkN0?=
 =?utf-8?B?ZFlaU2FIRnFKcG5kRWg1dlc2VjhYalB2M0FhWWUxbnFvWGorSHJmakd3Z0lY?=
 =?utf-8?B?MS83YmNhUEJ3VzFUQ2d3Q29MWHFTZjg5Q2h5M2FmSGYyb2kyeWh1L1NGZTY1?=
 =?utf-8?B?bXdOZytyNzNSWjRraE5ocitxT2hlVHFKRnNZOCs1QWpzWFVWbVY5c1JaRXp0?=
 =?utf-8?B?WTZMWHlXeU9kUEtQM0hRdzZjViszcDBBbXdXeGhxSzFaczZJWExkRFRSV3ky?=
 =?utf-8?B?K0ZrRWhkYk1QekdoQ1FxNlQvOTBCeFZZYTk4b3I0V2JORDVzSzdzTE5lSHdJ?=
 =?utf-8?B?TmNSQjVEOVFCMllXSWNXMTIrYm5CT0JreUFRcjYzYVhHakYrdE9URkp5Wkl2?=
 =?utf-8?B?cjd5dytzbDh1Vmd4ZzV4c3FUVzNDT2pqNFVNZkNZbk5UbExheDlNOVBLODFm?=
 =?utf-8?B?Ui9EaTVHL0U2dUh5QXlVZFptVnIzcE5SRmk4U09mT0JNN0VDRU5uSmt0VXNl?=
 =?utf-8?B?em5FaE16cHlWQVN0YXBkS1ZwdzJDb2tCb0dadUh3WG03YXQveWYya0xXYUxW?=
 =?utf-8?B?MllqY203K2IrTXZmbjRkWXRHUnpYUHRJR2ljL0IxZDhWTGlxbThPSHBJQ0l4?=
 =?utf-8?B?MldxOTI1cHFBdS9kL2o2Q3BBeEdudDhFT0lzSmtsSko0SWtubWZkalcwaSt4?=
 =?utf-8?B?bzR4bTE1ZEhiK0tnNWZZZGR1WFNxb29RYytwdnpGeGJmWkdpdWJxVmJqMzRK?=
 =?utf-8?B?MWhtZVdqZWgramxXUkFkRUZrUmlPZncyV1VhQ3FkMmlsdEVmZzZNWGt5T2VG?=
 =?utf-8?B?Ui9IaENlUmJyOUVrNmt4cFhPQXl4UTZsVWt1RFFMOTIvWU9TV2Y3QjZIamww?=
 =?utf-8?B?QjRkc1JOL2s2aTd2MEFTZ212cjRCLy9qcktTRUhuYVRNRk5tSFYrRmdmZzZU?=
 =?utf-8?B?VmhIRXFtdU1QNkNLbFhlKzc2dngxMkNjcGlEUW0vQVdwcGpseUJZaERFU1Jj?=
 =?utf-8?B?bDBhZ2N2WGk3RE9BRENPMzI4dHgvTDN2TWkwZnVQM1ozSGZOTWNRelBsQmdw?=
 =?utf-8?Q?dsXQ1+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ny9saCtpaDNhYXhBOGRQbzhlWGx1YVorZ3dTbUxCK0pOc3BlbERpamtsNWt6?=
 =?utf-8?B?SkdzaEgrdk9LaU13R1hBblgwMmZabXNqM3NQTnkxWjBHY1NLaVFHcTRHUThQ?=
 =?utf-8?B?bXBtU1VPUVpXb2xwWnY1NUdzWWg5emNwSjAvOTBPeDhTVmxsSW5aRHJyMStX?=
 =?utf-8?B?Q2hGY2VyRjBCNTZNMzEwQmpRNnNsNnhBVkQ4dklvNmNzZHRwb1MxdWJQVjVV?=
 =?utf-8?B?ZUJTamlyODVnbU8zR0pVVHJlYnBuK25JYXF1dWw5YVlxQndtang2ai91K3hJ?=
 =?utf-8?B?YXhBZ1lYZ0trT3kyTlBoUG1SNm1JT1lVV1dUb3licnI0dXpzTGRtZkxCNld2?=
 =?utf-8?B?NmMzKyt1TDdvcTVPQ0g4WFhwaUZyTk5DT2pYOHViV1NpYXBmb0dDS0dJOWJY?=
 =?utf-8?B?NENKTFYzWnB6VWtUYnUzb1E3aHIzblplUUFxYUFRQVRJUU9Ec2luQmVmSWV4?=
 =?utf-8?B?MklXalpJNmxqVHhwejRmYWtNZFcvS3Y0TnRhNm5HZW1KTzM2OVI0bG41KzVS?=
 =?utf-8?B?dktzZ2w4OUZVL0U2ZmhCOGZNa3p1WnRiNjZ0bWlmbGxEeWFJakFXSzEwT09Q?=
 =?utf-8?B?WkQ3c1lDOFgvNExSSm04ZlRnZ0FHaHRyTW9RbHpDcnFGZktzdGxKOUhvUHlr?=
 =?utf-8?B?L25oQlBqR3BOK1dweFZCSDlyUzFoTnUzcGFkWE9zVklxQzlLMFFLVjBPL3hz?=
 =?utf-8?B?L0JkS2hqVUZPSFIrNzMzZWZpL1lNaUk5TzdZbGJiYitzSk9teHI1Q2o0ZlQ5?=
 =?utf-8?B?R3NoNnpDb3E5WXFEYzd5cmpGSVJlMVZFQktTeldkaXlHT0t6UUZKNDEvOTBi?=
 =?utf-8?B?TmNSL1VBR00yTjl5dHByY2QxMk40TmJBUGp4b1hUbENYdW9QL2paY1pDaHFm?=
 =?utf-8?B?ZGdsQnNSeWxIZkp0eUUvQ0ZjVmZ3TGRkd1pQQkdRQ3lZZzNpaStkb2VFVGhG?=
 =?utf-8?B?clRpYkZaL05QRkJUOW1Ma3NpMmYyeU5VTjJvSmdlSnNMUkFNSnVsajZQTkQ2?=
 =?utf-8?B?VnFkY3ZPdW9xdHpOS2xBY1FSdmFFM3l6UVVXM1V4R1V2RmdsMFhZRjh3Qjdn?=
 =?utf-8?B?SjQvUTViTmFveHJCM2ozNVdPblJwbnhqbmtaaElOWFhHWGt4ais5MHgxNjM3?=
 =?utf-8?B?MFVZRi9SMSt1ZEtLbVhkaDdqSlVMRm9RNUdLZmwwVFFqWHZWVnNlWHB4eldu?=
 =?utf-8?B?UGNXeVZOUldhN2YyanZyYW1QcFRKM2djNHpqNFZyeFdrNUF0cnRxc1Q5K3lV?=
 =?utf-8?B?Z0JjSlV6L084ZjdEK2lSK0NqbFhwNFFFYm5NWFc5REMvUHVZNDJZQ2F5YmlM?=
 =?utf-8?B?RGp5bVhFZkkwQS9zeXkxTkJ2VzJnZUVCNTlEOElyZUV6T0lrL0N1a0ErcnFo?=
 =?utf-8?B?SmdJeTNDYWUwUG51QVpaUmV4ZTg0V3pwUFBkVnIvSGdSZVVhQVk3SjZKWWxY?=
 =?utf-8?B?U09YYlpyVHRVTkFzTjNOL0F4eXZxdjBNdVI3bW5jd2hZb0tyaGc4MW9ySjlB?=
 =?utf-8?B?NitkZ1JzT3hFbHB1VTFJcXhPbnp3dU9qWExEMnI2Zm1Cc2ZHVktvT2dVVEFC?=
 =?utf-8?B?Q1I0ak9PWk0vTm5GcHQxaVdadmRWSkcyYUhvdzBNL1R5NUhqUFNVYmdKQThS?=
 =?utf-8?B?Sy9Ra0NpWGVpZmtMWlF6R3JTbk5reDJYS2FEWVgzaTBzd1J1Y0lJc3RmQTdm?=
 =?utf-8?B?RXBXZVR3czkrRURUWHo2dGdER3RUS3NPQWdxN2dqRGN1UnNnSUhUUE5IMEpp?=
 =?utf-8?B?b2xiTmdQbWdxK1I2K1lQM1M3K0VYZ0k2UERPRk9KbVFBTlBnSjYyc05zMG5U?=
 =?utf-8?B?Vm5qTjhFWnlKL2xFQTdwTjUvT0tnMlF0eUsvcG1ITENkZU5oN0E1T05zY0dS?=
 =?utf-8?B?NzBPWVdlZU9DRkdpWDNha3RNOW84MG9tWGRRY1pRWnVtTkExSnpkNmJ6aHdr?=
 =?utf-8?B?ODR4N1J0K05aVndMWGNsZ0lFT2s4bGJJMjdCby92cjZvTjFZQXJ2WUhobmxQ?=
 =?utf-8?B?TzUrOXA4SnRId1czc3gvanMyTk5KUVhZQW1kcjdOMmQ4WFN4U3Fub2FCS1Fm?=
 =?utf-8?B?QlIrZ29xL3hlUkw0V3NmRkQ0aWxoa2VJaVI2dDhlTFFsc2x2aGhrVEZHaFZL?=
 =?utf-8?Q?Vomxo3vGezmpGlrxg6oMqPweM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64601b14-f260-4582-b350-08dd8eb49b3a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:30.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQVNVzW7LVCQoklS37xXjOe+CgBZ53CciR4Uug47GPpvIsiOTIpsg5x6DLseojtwGqt2Co8tVzIU07fUBFEyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Constify xgene_gpio_sb_irq_chip, flag the irq_chip as IRQCHIP_IMMUTABLE,
add the new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-xgene-sb.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 48b829733b1509d9e0b409a0422f95ddb78d4525..b51b1fa726bb5ac6fce21f93e98035b5f684ee88 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -103,12 +103,32 @@ static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)
 		return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
-static struct irq_chip xgene_gpio_sb_irq_chip = {
+static void xgene_gpio_sb_irq_mask(struct irq_data *d)
+{
+	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+
+	gpiochip_disable_irq(&priv->gc, d->hwirq);
+}
+
+static void xgene_gpio_sb_irq_unmask(struct irq_data *d)
+{
+	struct xgene_gpio_sb *priv = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(&priv->gc, d->hwirq);
+
+	irq_chip_unmask_parent(d);
+}
+
+static const struct irq_chip xgene_gpio_sb_irq_chip = {
 	.name           = "sbgpio",
 	.irq_eoi	= irq_chip_eoi_parent,
-	.irq_mask       = irq_chip_mask_parent,
-	.irq_unmask     = irq_chip_unmask_parent,
+	.irq_mask       = xgene_gpio_sb_irq_mask,
+	.irq_unmask     = xgene_gpio_sb_irq_unmask,
 	.irq_set_type   = xgene_gpio_sb_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int xgene_gpio_sb_to_irq(struct gpio_chip *gc, u32 gpio)

-- 
2.37.1


