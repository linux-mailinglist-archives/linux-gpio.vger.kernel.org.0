Return-Path: <linux-gpio+bounces-10460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20F9875AA
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF9A1C256F3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 14:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B820114B94B;
	Thu, 26 Sep 2024 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ng/5Itqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2082.outbound.protection.outlook.com [40.107.249.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A613D891;
	Thu, 26 Sep 2024 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361120; cv=fail; b=WU/A8s4AaurXW6OaiE1GpAFhm4MtZLyLwDjjY2bth5BWgkRrA7/lhwcej3PULic3zJlZFicrKMKV7kIOe+pi6lurJoRJ/lRSpdGKiw93ftJl6Vqa9ncocU2w6iKcaeyWcNniAW4jrIWQa7TayvMXqGj9XoP3VzyB+7GhHTingsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361120; c=relaxed/simple;
	bh=cg3nh/0xqyKrb8WS53QHlw0YioVf/qfpcdW8C+PUY/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2uRmylccvCE2F3wPEGszGqgrekLL/WRnFVSmNV6HS+83WK7Ktm44NuM7xa/bbrHIuTTobQ+zLtIrhGX9Mfd/jvvJf1eAi5fqTlvOCMsNi58X3ObK8WCIAPI8AqMYwhslVCBEkpY5VFwVffztukmHP5lHKi0y6m18DpmQMvbF4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ng/5Itqx; arc=fail smtp.client-ip=40.107.249.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEAXzThOUDLN8qRXLWhOjNlLQfMU4l2QNVAZEWYF2oiYy7Cvo5XvhCi6DRSZrPaDRaC252FHiuSqwk1zCk7mbzWvRGNL3ooc3ZOcl/lwaSU5XsXLmIK7DokTvrCJOjvPu0smGaXVBOIgE6PqcJgS40sHom4WyaFMxLMB84AEIs8gr3F7/LfsSYBr3HRK6n30Admk8YIU03l2jAAkCIN3JDjTwvk4TDKZ3EZImJTYDAvMhBoHVg6tQ6Wb6VX/4CDcxfSFBMQC8qtPhaUnxlo4kywAUnV4B7g2vaqT7+dKyzF5966sOuyTQz0GIULIQNYmPze68TR9zdXylW78qR1juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adzHJ1u+haq0OopMnC/hgMBYg+qqVAhJEhzx5nEN5VI=;
 b=Do3h+e2DgQAyFi8wJY10VNYpkRoinPp8kYLGULknSkFOSLPFJWFjnrxUaWBP8rVmOq8b48RiPmYmRs0Bksrw6DO0+qAoFB8ngV64zdzhHwWhgEyGh3Vfw1H8KgGnZFao8WNdeKgY7ra61QB0Ab3iZ2hIhVmUukNiK1M+4799Ou1oomCxwlmmMCT27rirxPFt0HOkl/QcBVtyyMcG6uwnG85CtmcHDGsBq6zQLd2SgXsvhzd+MPst84K+B/rFY4Mh1VG+Ivvxr5UyuW7Cci9ppcffCs6Angy3MCx3nufVHNEiBhFky3T6drZZ2bIytNXAPUO8U8zEeeZmNax/TtjXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adzHJ1u+haq0OopMnC/hgMBYg+qqVAhJEhzx5nEN5VI=;
 b=ng/5ItqxOWvq1qiDURaeChZ9LqDrpzZnwRarVBzYc1RuG39q8iOmwD4to28Cd/wK/8JlfPdQLwqPm1Akcfqcb+G8JWBlFcquUYykZFjZgteT13uu/k8S//GAeg/6h95xlEvYdQTkZGeStEkQHDdyEap5KogatfG1CUGpWrae2U6vy1Hv/Kx4euxHcTysTpPhA3lNWXewt2u9KjI3MzmE97r3zjX8s73mc7UlRgGcRgDT8Kn2Qcrj9WosmPqWGOr3q0jkVxyiSfvSlvOmlRWMliMh+2Uv1/D18EFPaE7lp13iQAQBJWWWOPzgmvDSTrrqKSZ9Idd3YlAD5WiuecHTbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by GV1PR04MB10485.eurprd04.prod.outlook.com (2603:10a6:150:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:31:52 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 14:31:52 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3 SoCs
Date: Thu, 26 Sep 2024 17:31:19 +0300
Message-ID: <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0101.eurprd02.prod.outlook.com
 (2603:10a6:208:154::42) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|GV1PR04MB10485:EE_
X-MS-Office365-Filtering-Correlation-Id: 529dfb3d-41d8-4c50-ea2c-08dcde37f65f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjVKand5MHRsaHVMdE9NS2pHN2xTT0ZsRnFUTDEraVJrUHpjUGZjeklUa0Fq?=
 =?utf-8?B?ZUg4VFdQMC9NZHdVMXhqb3lxWFRMWEFRYVJGRDZ1MDdzQXp5STF2L0ZEeFlQ?=
 =?utf-8?B?dGRQMHlIbVMrNjE2Qzd1VG1aRG0vZm1xY1ZLR1JwS1d3aXlXTDlHYjJoOXph?=
 =?utf-8?B?c3BxTkhBdXQ1YWNVelE5Q0V1b2M5cmVXQXZlK1hVQkJlbUo3ZG56NXpNcXcv?=
 =?utf-8?B?TDFqNnorQmZmczZYRU5VeXltMUo3UEM5MFpDQXhQRVFpNFFnQVdXbDBhQ2p0?=
 =?utf-8?B?S08wdWxxZ3lmaVJIZGlpSjRPSWU0ellhbjJ3dTY1YU4xM2NwU0dPbENwYW05?=
 =?utf-8?B?d0NNV3N3V0VOMXBkSWgxZjd4eGQyWHVQandYaDNMVWlYL09OYTBmcWxQNzBh?=
 =?utf-8?B?TTFSWkI5MnZGTGhXL1FURG4ydU9EVXVUWW1BcW12ZjlhckRERE9hZERxVTh1?=
 =?utf-8?B?Rmx6MGhnNG4xVFZDZ1ZjRk82NkFydEFSc1ZwNVk4NDhUMG1RN0JDMXV3YnUv?=
 =?utf-8?B?T1RTSEpUTlVIZDZtSzdKWlZMMVp3MzlGRmI3amJzOVFwdGxhTnZva3pjZU9n?=
 =?utf-8?B?K3BPcXZFOXFGZ25hVnpKRmt0MnVBcmE0bFV3VUNKUFZVVjZCVzVGaVVnVVlh?=
 =?utf-8?B?dnB3NWVtWThCRThvQnhMTUhoR2hVTVNXNGVqV3Q5ZFhQZCtXWFZFL2VPQXkw?=
 =?utf-8?B?Nng1ZzFQaW9PcTUrNE1Lbkw4T3dCNUYzdDlDYlMwTm9odVVITDBCcXNOSmJT?=
 =?utf-8?B?UXQ2Q0tON1kzdzdEMkkvbE0yUzB2TmV3ekJlTy9sMGhlcU9GeFkyM3NLNngz?=
 =?utf-8?B?L04zZ0ViTThKZGZrdTA1SWZmQndTR0NXWkMrTjRRNzN0RExRUnl2M1lhTllE?=
 =?utf-8?B?TVJobmVRQlhwbGRjY1VoMyswLzEzSWNSeDdKVS9Qa0F1dThlVTJDWlovQlRt?=
 =?utf-8?B?TWZJMGVkdFJUOGhGejFuVFhGZXZFSEgvc0pYd1lHN1hxRDI0QThaL3pQV3Fx?=
 =?utf-8?B?SzhXekttRGlwRlE2Y1BJMHUwQ0ZLb2VGYXRhNk5vOE0xTmtBZlovTHN3MUti?=
 =?utf-8?B?TDIrOU5MNWZKTVNMMC9sZVFMWEtLcDEreU5pQkkxYm1hYkR5ZDUrMGhzNE9o?=
 =?utf-8?B?VFRUOFhWcDU4dEZNY1FETUg1a2FjQnErcG5zM2xMV2x0SVZtam9tTUJiWEFH?=
 =?utf-8?B?UmFhdi9CQWM2emZWenk3c1BhdEJWSmUwQ3JMdkRuRjQydzlBeE5kR0MzUUpP?=
 =?utf-8?B?ZkNtVTFIRWNYV09VSC9sWmUrM0VlR05TM05BNmg1ZkRISnhhNndHNlZTVG5U?=
 =?utf-8?B?ZGhUSXVWeG1PMWxtWFdZbGlLQ1ZCUWVGWkZxaEtPU0FVODF5MFdNTk1RcmxH?=
 =?utf-8?B?alFqMjNDY2M1dDhVWFc2UlUxV3p2ZUEwalFqcjBKcWlJcXhFNTVJYlcrT2lR?=
 =?utf-8?B?Y0dOdlpvOGxaVHBjRDZvNDJRNFpKMm0ybG1XUGkrN3FlQnMveU1tN1dKR09v?=
 =?utf-8?B?NklJMkMvbzdYZXN1dkVMZzVaYlBTempyY0Y5Z0ZyaGJXaUdNdUhGRktwZjQz?=
 =?utf-8?B?VjdEVW44NjBaUXJPWnUzQjdiR3gyLzdWTlFWS2lTd1JrbzdJYmhFZS9US2JB?=
 =?utf-8?B?L2owYUFaYjZqRFEwcjhSdVg2ZnUwY2hXM2h1MFV0djhwME8xYys4NHVYMUs5?=
 =?utf-8?B?OFhEc1VuS3g1N1RxNjdTay95ZkN3OWg3RnRNRnJmdUlzbmd6SVJSdmpTbzZE?=
 =?utf-8?B?V043NU1BaWlSQ0xFMXBEMUNxUmljaGJxRFFnUGpnanZZZzBML2ExaGIzcUtY?=
 =?utf-8?B?dnNhVGtXOEtEMmZzV1VOcE5YZVc5RW1heGZURCs0ZzFnN3ZsQWhYSzExK2Q0?=
 =?utf-8?B?TWI0K0pvWUJQOTJ0ZEpoVzRuQTVQSlF2WTJsRU9BRWthcUZBNWZLM2c0K0Z2?=
 =?utf-8?Q?B/CHQ51wnbE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2tvRUhBUnZ4RUM5bWQvK2hzdW9RM3hUS0VGV3JjMGtkZk80MXdoZ2pDMUlI?=
 =?utf-8?B?dlN1RnpMVnJjYm1pSUQ0N053ZXpXdTdlNFozZDZ6cUdVMWtwTFFjNFpyOExP?=
 =?utf-8?B?N25DTmRncUE0Rko0NjV1cUpVdEdRaXorWm1XbDZ1NTJNSStYNVRMRTJFbjBm?=
 =?utf-8?B?emMzNEVHa1VkazN5dHltZmVoOE04S0hyaEJqenlhRTdXakNPRkl3Vlh1OTBy?=
 =?utf-8?B?WHF6VkQ4cTlpc3M1Mkg2MmVndzNGNFhBSnFmOURHeFJjdnUrcnZPVVYzY0c1?=
 =?utf-8?B?bnpEVSsrdVJ1WG5xQ2t3OWthNG9GTnZVQ1VLRDQzeGtTdXV6cnZwSFhHb2FM?=
 =?utf-8?B?ZU1PWnlSemQyaWRuaUQvdmJ6R1l2Q0tUcUtISkw4SEhGMXprRTJXL1hlVmJn?=
 =?utf-8?B?SUZRWmR1T1BlOFd0dGF0K1hDWnlKNmxMZEpzUGhMaCs1c3V3OERGT014YnFQ?=
 =?utf-8?B?Q2ZkTC9aeVh0bUhLQlI0T3pZc0dyVERyZDFEM09xN2JIK251enhuekFCSzc0?=
 =?utf-8?B?VGxpRXBueUw5bUV2R29HdSt2L0lZOVZOZmVXSk5vTUpSQTQ5M28vM3Y3OXlY?=
 =?utf-8?B?OW5ORnlDaEJ5dFZReEZHekdHZlQ5cGdxTWJON3o5eTVJRUNyRUtOOURURjFM?=
 =?utf-8?B?bWxyWXEvVG5BUEM2RjZ6ajdvaVd4SnQvNTJLanRIbmFrdElEaFFyRGhiMWdG?=
 =?utf-8?B?RnNlVm9RbHJkd3p3Z3NHdWNNaHM5amh4MzF5T2JETUtNenpWK2hVN2ZEQW9s?=
 =?utf-8?B?K0d1UUdZcmRoc0RtbTBaeDF5Z2NieGdyOVN3cDlCVVhhMXdSVjV1c1pMaXZV?=
 =?utf-8?B?VVRKcXFwWHFhbFNWRUFic1ZOSFlFTnEzSEtEa004SGdQTW5yMWdXb3JWdzd1?=
 =?utf-8?B?dm5pNXBuR1EwV2d6WUJLQU1zWHdUM0F6WEhSNUcxaHNsemNGZzU1d1hmMXN3?=
 =?utf-8?B?YW9wUmZHNjBjcHkySnNsZlQwWGE3LzJyOGw5V0c5VmlTSkpCMysrSjhsclpC?=
 =?utf-8?B?aTlyaTA0bnR0TXpyYUg3MWtXUEorRmhpYVo4c21ZRWRpWDNhY3lBYVN1SHlJ?=
 =?utf-8?B?K2pxY01uYkNmU0J1ekVLWkZabGZSVGlxWnVyZGhlVFEvWnRYbC9LOENsM0ZN?=
 =?utf-8?B?ekFLRUhWZUhhQy9RdEhhOS9wajdFZXlnM2ZwZ1kzRmVNaFR3blN2UDVTVGQ4?=
 =?utf-8?B?L3V4Y0pUUUhPa2hjVW9PMDcvS2UzUXByNnVlbEhzT3BQR05Fc0s5UEFpcmpz?=
 =?utf-8?B?ODg5RXZ0aCtQZE12QW9GNXpFbjVXdXpvdit2NWNGUTIyS2haczBrNHBuMlNh?=
 =?utf-8?B?NFRBb0FmQXFQMTVFNmViU3JqUFp2MGZ5a250ODZvbmZoQ0pMWEVsR090VTB0?=
 =?utf-8?B?U20zK2E2UE1LMTZmSUFKYXUvZ1VGM2xJdU5JanFjYmdydnJxanA2bVZZRlF5?=
 =?utf-8?B?dzRwQ2NUcUJtajdZdk02aTQrZnZoTnYrbVF6cjIwWWFRQTc2N3FoSGlwMjFF?=
 =?utf-8?B?L1VxZHh4WGltSmd1MzRYNlVFT2FJdUF1RzFmWVlwSjdOZm9kK1VyaTZ3M1hF?=
 =?utf-8?B?dkxsMm1FVEZtL3dQSm5KMVJkaHNQSy9ldlVKaEtJcnJ2YmpDTVBNUmRyZVdl?=
 =?utf-8?B?bGsrVms5aTRsbDNxdEtPaHBDaGVOZXc4WFRkRkltd0NnZFcvNVRKcDhud3VS?=
 =?utf-8?B?NUE3NERWU3VtU1dtT2hzTXdjUlprMzdmY2x6NmNjTWpTSkxFYUw2S2c0RDk4?=
 =?utf-8?B?YkdiZU1oZXQvcXZadDNjbjQ5bjZoMUxFamMrRmdUbGFxRWlSS1lEdFVEMm5D?=
 =?utf-8?B?MmZ6TUJkSHNyRXBhYklBdG8weURJMDZDQTZaWUo4Y3RHYzFUc3JqbTNVRlRB?=
 =?utf-8?B?YVcvUHYxNENwL0NlcHZDNVpWTWxZU1l4Wnk1aFFHdk1NWFhWVVl3ODg5ZEt1?=
 =?utf-8?B?cWQra0VsY2Zuc3ptOEVhQ2pKN3dTRUJDWFh2OGJGQk1ZMmdRS294ODZjOTQv?=
 =?utf-8?B?VDVDVlFhV1pPNXVMT2V0UjNaVDRWS1ZHbzVYUk1PVHJlTzRUK0ZwQzhYNGR6?=
 =?utf-8?B?aDhSQ1AyN3N3cy9iZVljSlNpclNqYXFLODVFNzdINDNheGFna3loYjc3Q3VG?=
 =?utf-8?B?aE8xN3I0Z3JXZFFhTTI1M2N6V3BDSWMyYkdPZEVoVFpqdWttVFRYTjc1NnA4?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529dfb3d-41d8-4c50-ea2c-08dcde37f65f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:31:51.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUW2VS0RayO2Sef/gkdBcjMuMmzoCsmkngcvxIMchyFufrU/dJJn1+aUeMOw6GJXGXuBJ/0r8qYfxUbZpOOhkcxBIhl9CQ3B4GeSZ/VRr5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10485

Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.

Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
new file mode 100644
index 000000000000..4556505ee9c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2 SIUL2 GPIO controller
+
+maintainers:
+  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
+  - Larisa Grigore <larisa.grigore@nxp.com>
+  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
+
+description:
+  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
+  chips. It includes an IRQ controller for all pins which have
+  an EIRQ associated.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-siul2-gpio
+      - items:
+        - const: nxp,s32g3-siul2-gpio
+        - const: nxp,s32g2-siul2-gpio
+
+  reg:
+    items:
+      - description: PGPDO (output value) registers for SIUL2_0
+      - description: PGPDO (output value) registers for SIUL2_1
+      - description: PGPDI (input value) registers for SIUL2_0
+      - description: PGPDI (input value) registers for SIUL2_1
+      - description: EIRQ (interrupt) configuration registers from SIUL2_1
+      - description: EIRQ IMCR registers for interrupt muxing between pads
+
+  reg-names:
+    items:
+      - const: opads0
+      - const: opads1
+      - const: ipads0
+      - const: ipads1
+      - const: eirqs
+      - const: eirq-imcrs
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 2
+    maxItems: 2
+
+  gpio-reserved-ranges:
+    minItems: 2
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-reserved-ranges
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@4009d700 {
+        compatible = "nxp,s32g2-siul2-gpio";
+        reg = <0x4009d700 0x10>,
+              <0x44011700 0x18>,
+              <0x4009d740 0x10>,
+              <0x44011740 0x18>,
+              <0x44010010 0xb4>,
+              <0x44011078 0x80>;
+        reg-names = "opads0", "opads1", "ipads0",
+                    "ipads1", "eirqs", "eirq-imcrs";
+        gpio-controller;
+        #gpio-cells = <2>;
+                      /* GPIO 0-101 */
+        gpio-ranges = <&pinctrl 0 0 102>,
+                      /* GPIO 112-190 */
+                      <&pinctrl 112 112 79>;
+        gpio-reserved-ranges = <102 10>, <123 21>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.45.2


