Return-Path: <linux-gpio+bounces-13463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6AA9E2B56
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 19:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C07BEB36D05
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 18:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E291FC7EF;
	Tue,  3 Dec 2024 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="0KKK1LAT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6941FBEA5;
	Tue,  3 Dec 2024 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249934; cv=fail; b=dQVztQDoLrevkHDbyX+SvQ5aGg1gUHfRxp99yfxJ3sJg5oImtByKFUzTRpaMK767N09MXmqw9IQnlW0OuqHp2f/WL6qp5osAwb1mhASiEbl56rIOpViBpHa1I2pffnHJoLx4iTAn0MtmQ+matEeSKCz/Sa3krcV7y1rYjxrXd6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249934; c=relaxed/simple;
	bh=r8V7gjLTjErG/fznz1tnrGTa+mIqNs9dqNrAsx1i+R4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g6r8CEndDg651r0jmH3q2Yuj832iEIf2QKviCiDErO1/tNV4us7/2xsfin5DDnWodowTeYl28MlEtCjTRtEAjqyC4nA0tQL2kW+Jy2+HQANAbUPcJe0toNadmB3/VI4kTzRvOm5jN9+ARH0+C/Mpr33RPdZGwlsz8x2DTZa+Svk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=0KKK1LAT; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWTV0zo5hCG8JGVyaITL2/8EQf9twBO7BlFBoNiD0nWzQgYTPnBaFHdEgp1A3lpIokjPwEV6t2yka9TFaEQrC7yrBAk6Yabe58NyPfb/NIzK50QI+CdLgyvX+lqay7O1z6K1JYTCArNN7ztvmE4OwZPCE0sc1NZ2qyAI658Tu24mBNDhom9CtTUrfv85zjCRi+oURuNHdDzw5heRVk/klggZJjDZfFG5MhBQgpium3qTFrIcGSRnGhY2YPjoMGW5EKvUa7VJmIU/tKjkH1X/4Tt+gpJyyqsF47I0c3DepgoXzVL1XAATeOfnYzBfysbiNFCEIeBNCe7IVkHfDc1OWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8V7gjLTjErG/fznz1tnrGTa+mIqNs9dqNrAsx1i+R4=;
 b=OuHPB3Og736M2Jq+lOCnjNkKLq7GfBTUWQHRDOVFHZI17SJ11ncgqeTrDJe2FilqgC6CJMctyOvG4TbkQGOc62sSUdSl/hMLRLI+XA6ueSEsTzTQ8HDlESuhtEVofYTS16V38VEi17EIXeKQ8VlxOf7wAKbpOD29TRJ3oUvLZxcJ7LLJ76vH2s5mZGQN2gCLzTUhFEb+/s8oQMF5ITbclvloJaCg641vmkdaPEgov3DGbvllechEC0o6z2aA06utAbOtKfcTadxMDjxar2HV17aVIdKebB44w05j7ReVw9dFGVk/TPNTOztUjPZoBezqU/QwkBGsZG+JgSAsLLmS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8V7gjLTjErG/fznz1tnrGTa+mIqNs9dqNrAsx1i+R4=;
 b=0KKK1LAT+R/6r3v5A+5lGX+d5tiRKxb+LygHCSo8yAN3BPG01aUSfKGB9YZI59cHItboChLF/rvxetf1hwGUOYSr13/9kOvVw3hUlw5W89s3t0yBKfyhnIMua9ksuNbHTwrBjpzMvX1m8t2GLp4/vcAKoZmNKBsMj1JJT2i/iRLPnWzyqMa0dsBpkeKoXvNab/o7FDT91YvfdpMS2J7wwDiCC+kLp7Dh0ykuRYr5EzJLgssWwjKH0sRFUO9cdT03Z55eTLJrq9/gsMVpabrfoumjCxJA1P433+Lso4ubpHOlDGffU83zceBZnthxwcSmKwffjl8H9dCHs+F3VGxS6g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PR3PR10MB4094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.9; Tue, 3 Dec
 2024 18:18:49 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8230.008; Tue, 3 Dec 2024
 18:18:49 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "ssantosh@kernel.org" <ssantosh@kernel.org>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "khilman@kernel.org" <khilman@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"grygorii.strashko@ti.com" <grygorii.strashko@ti.com>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with
 COMPILE_TEST=y
Thread-Topic: [PATCH 1/2] gpio: omap: allow building the module with
 COMPILE_TEST=y
Thread-Index: AQHbRaJAxMtYXQr7ikeQFKFjxAcoMLLU1FMA
Date: Tue, 3 Dec 2024 18:18:49 +0000
Message-ID: <2399cb52d90908c7fce551de8f3a1ce71927118c.camel@siemens.com>
References: <20241203164143.29852-1-brgl@bgdev.pl>
In-Reply-To: <20241203164143.29852-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PR3PR10MB4094:EE_
x-ms-office365-filtering-correlation-id: 8432dd0d-8863-417b-4b25-08dd13c6ef04
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWVvYTFJWFFnSDQ1cjk5b1kwSWtVV2hjS0lDa29wVE42VnVJZnkvK2hnQWJO?=
 =?utf-8?B?MVlseDh4dndtbUN2c29xZUR2S0JPNFA0NVZ6UlVVaHpOV2VOblhXcDhpNWpw?=
 =?utf-8?B?dGE5cTAvdUdCbXkvQXJLNjVIUVVQWWZzUzJRY29vMmFzWWszUkhic3JEbUdo?=
 =?utf-8?B?TUNZNGZ4b1JGRjFyV3AvVVZjTXRnK05JWmVrd0NvRlpmU3pKK2JtRjg4d0Va?=
 =?utf-8?B?QUIvUk41UWwxRy9uU1g2NzVXay9wZzNYOFhoMTJKd1VmcC9zYklvbUhxV0w3?=
 =?utf-8?B?UjdxT0dUeE4xRDNOQnlOY0Y2bEkzNDNNT0ltcmNxV0VXaW1iVUlDN2h1QmYr?=
 =?utf-8?B?YWNGbTZVN09DaDd3MGtYdVV6OEpvWHVOTU1aWkNucWR6bWQrdkptdkx5MFd4?=
 =?utf-8?B?V0U5bDV4ZlN6RXQ5ODRETjNlZ1FEZ2ZBNk90Slo3SDdjaEorMi8rcnMvMXgw?=
 =?utf-8?B?M1RwSzlOcFlVaHNyOVJISGVsaC9hanYrZEdxOHQ0NU9pNHRxdC9yZDFaUE1E?=
 =?utf-8?B?SEpDbVhHNmRFcG9hclpoYkMwNE1WaW05d1ZqU2E4dmMraDBjaFZielVYc2NH?=
 =?utf-8?B?cTY1S2ZrQ3Q3Z000bzlPUitOby9HZmNnOGtKVE1DVk8wTHVQUzdFMGxjQzZw?=
 =?utf-8?B?dVNhNkk0dVVDWk8zMzV6dkE4aGZ2UlRnb0lJcllJVnFQT3dlT2VCdkk1eFFK?=
 =?utf-8?B?bzZ6dzdscWgwbFQ3cys0TjRaNGtuSUlUOE9nZm1zbU02UDRyN1lMK205QjRi?=
 =?utf-8?B?eGE5N0pjeU45Y2pnOTh5bVEzbnhLM09Zd3FPWGRKWGJuWmRkMm9QS09rcmtE?=
 =?utf-8?B?OXhIeGxHSmNjTjdwZzY2bTExa2lZQ2JnZk5QTVc5VGh3TjI1dWs3MVFxRXFr?=
 =?utf-8?B?OFVoU1VDZUlMMUY4WTVRSzdaYjFkSkQzN0VNNUVmUjV1aElUakUrTEdrdUp5?=
 =?utf-8?B?UjdBVmVqTlk1L2ZaUjBETDJ3Ni9EcEw5QW1jVVc4TVIxSEZuWGlUcmZ0VHlL?=
 =?utf-8?B?OEpCVGZQdmsvVHo2ZUJhMzRrZXQ2NHFVeXZUSGREZEtBa0s4UVpJNHpMOTJO?=
 =?utf-8?B?ckV2QSt2V2dqeDNqcXFES3BaTnRKMzRTV053c0Vtc3RkakhKTjZjMjRYM0J4?=
 =?utf-8?B?OERpeEtuL0VEMlNqMjBWbTlYMkVMaGxMelRkV0tYeE84Y1R4TE1NN2RtTVp6?=
 =?utf-8?B?NHYrVkJqMGNRbVpzcnpZT09YN2IxZzJ6dndiQUc3K042SXVjWXNNS3NpNEhL?=
 =?utf-8?B?bnRiT3dDZEF4UjJTVGNPNEJNVitYL0pvU2hOeUQ2T3ZNT2hQQU51aGoxNjY5?=
 =?utf-8?B?N3VyaWpHQytURDhCSWVpWFZYTFRranJFWWQyRHMzbS9SSGpHTmFvN3JFdlk5?=
 =?utf-8?B?TjhoVHFVRWFnb1g2elJrdTI5ZGc1clRnRjNCeFRmb2N6SmJWN0dTcVhUMjBV?=
 =?utf-8?B?T0tpRm56MnlzcUFPWHozVDVZZFhpUlp3aGtZYXBUVGs4b0lvY3ZkUzlXT0tj?=
 =?utf-8?B?RzRwbmdhNzNlRVZFMmxOM3hGMEgxWFp1Y3UrMG9iMkZpSXVBd2pFdmt6NFVq?=
 =?utf-8?B?UG5LSWs2M1RYUW5qdExXdjArQlBSR1UwUnZ4VEFyOE9nUmpVUEtOTEdsMVNU?=
 =?utf-8?B?YU1XbzNJVUdSUDltYWwvZzVoaXJGRkFIZmoxVzdIUXhjTUhRMThwVW9ob2hC?=
 =?utf-8?B?anNsRC9renEzdkdQUnJ2UFR5Z1NzT0lvcEpZUm5mQTJjMHR1N2JZdzZuQ1BZ?=
 =?utf-8?B?RGgwVHpKdTlLRTBWbVN6bGlMaUlaWDlPNnFYcEhlSVJGQ1F4dXgzbVJLZ2pI?=
 =?utf-8?Q?PtK7Sy8Cpy3Ur4nKUghXvX8IWgvg40MhxmaaE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0ZtMXk1bXVoNXFEMFhpVEFtUUpWNHZSQlFScGRSNnd2bk9XWHA3bzFibFBn?=
 =?utf-8?B?SklaVkNJWmIyQ29GdUI4cXJLVHNKUzNzVzdCZERMeHc3Y2pwM2NlNkFibjBx?=
 =?utf-8?B?aWxRcGlEV0RndHVwWmhkbmovdllPQ1FzRzR5eEJiMGFDbkFLMHRORnJmK1o4?=
 =?utf-8?B?N0N4bU1XKzhPRWJldkRPa2FHcStLcEtUc2NPRVBVbHo5VDZiTzB5dGQzOXNF?=
 =?utf-8?B?S0F5Nm1wZTdQdVJWeFJYVGZkYXRPcFprSEcxYmVzN1VHODdHU2d5U0dmbW5h?=
 =?utf-8?B?UllVRXRZVjNvQWVQb3YreDVSR0E4Y3JWbDZLL3BkcE9rODNBbG1uWk9JZ25k?=
 =?utf-8?B?STF4VjJhUjhOZTZNRlhieDRVQzBhNW54SHRsMHdYa2JENE5MRUlLT1pybHk4?=
 =?utf-8?B?eHhaMExoSTFpNjhDTW9nN0FEc0JPNTBhdDdGZGNpbGVSVlZmZjdvMm9pYmhF?=
 =?utf-8?B?UUhDRExFeWo4WndzY2FkUUVHWVlRdktQcktQd2VmV05FWW1jZmV1RlI0LzRK?=
 =?utf-8?B?bFRGT0MyNDZ0NE9FZUdndFhsVGlJOXRsZWk3b2RoYUNjV0RNQUVCOFo4V2Ex?=
 =?utf-8?B?dzVWSWE3YmcyK3lZNUV1UHd0bTlFcGIrRVFod2IxRDFlbTAxbDRoQ2UrMTho?=
 =?utf-8?B?S0UxRzRKczBBdVRVZW5TejJ6aURBTFQ4V0c5S3pxZ29JazZzWmZBN0FGdTls?=
 =?utf-8?B?bFhaSThHaDN6YldQY2k2bEI1bldFT0oyQ1J2YktWZnJ3ZzlOS1A2VzNQMm9i?=
 =?utf-8?B?UDNZUG5hUmhmTzlUL2RSb05vbUpwaUJNQmp3R2Vpa05JUWpQRnVHY1EzRkoz?=
 =?utf-8?B?czB2am9icS9uMFZDYXRKRU5VVXQ5cnRTVjZOZktaQmkwSlNTVGFiOXF5L2w4?=
 =?utf-8?B?R1kyZlk3Q0ZHQXA5KytlbTdUd2Evek81N2NIWkg0alFhRUFUMnpxbzQxZm5s?=
 =?utf-8?B?cStaOGYxdHdqcTgyQnNqcHZYbFhsYnlqdTJIZnJ2Um02d3M3aDhTb1IvOE5J?=
 =?utf-8?B?MzhyR0EvRXhrZGluOWZsK0h5UFdkSys4MENPcDdGMmJRN3l5OW9aNnlGWjVs?=
 =?utf-8?B?MkdVTlYrVEgzMFRGUmRjY2hVZnZQQ0JwcGtURk1nOXFyVnZZUkgzQnRleVBQ?=
 =?utf-8?B?RG1VMk9IVTVvLzdqcUhSdzc4WGRONkNhZnhpRjlqbnVOd1hZUWNVdmdZMnNO?=
 =?utf-8?B?VldkRHo5UHhId3VKcmlpQlFuNkJxeG91cm1JWmtUSStWYW5iOW44SmFPanhG?=
 =?utf-8?B?aXJ6L28zSWZVT2kvZWdxRWViWjNHemZNNTRpS2ZlYzlsNGIvaXVPUm5BWkNu?=
 =?utf-8?B?Zk95WjNycEYzbkl1OG14aGZ5RUkyWlNqVWFzblZKZUZ5aDM4MEU1Y0NZMENI?=
 =?utf-8?B?UFQyRi9SSUxMbUs0cEx4RDVvc3crRjRSYzBpZytxRWthVFRyNzEvOUtSeVRC?=
 =?utf-8?B?cHJGb2MyL0QzdWVTZFZORVVDWGtlNy9VazcyV1ZtUUR1ZHhrT1VyOWdkMjJZ?=
 =?utf-8?B?UnNUL1dyNTJhR3cxMzNmbzlQbk9HTjBpTUpVa3JsUXUvK1lxWkZjYWhvUXR2?=
 =?utf-8?B?UzRnVGFObmN2OVhoRFBGSzJQVkVVanJMMFY2UTRhaW1ONWZtVEJQMkNsYjVm?=
 =?utf-8?B?T1JvNXV4NFNnc09mN2pGQW1IYXU0d1JHWVFYNDNKM0RNVXdBNnVrWGFteVF4?=
 =?utf-8?B?NjN0VTlOWnFIWEhnV2graldSaE0vamJIblIxcTlZb3lFWjRQSlhFSmJKTWcx?=
 =?utf-8?B?V1VqR0VRaHNNdGZRM3BsYWk5VEhnL1dyMnRWQ0lwN0l3U0VkR21wcmoxaWlQ?=
 =?utf-8?B?RlNPblBnUWsrdldyQzgwZFVra2lUaEw1U0pYSkxrQkZYR2d6TnY3alJwcElI?=
 =?utf-8?B?dk96aG9pYzRYcW05MmVUOVJYSFR2eXV1ZW10VThGeTgwdXlFMHZIVzhrWU5V?=
 =?utf-8?B?U3JWa2d3Ry9kc0ZhdzB4dHd5T1hvYkdzVnRPZG1qUEQvekZIZ3FFNXVhY2FW?=
 =?utf-8?B?d2FDUE9ZaHM5VlRKd25MVnFRQXdCaERGeW5JbmRScUhvUjE0RW1Ea2xVQytV?=
 =?utf-8?B?V1ZKVXdybmZpN3laaUlWaWhpeHFESlVqMm16ZVdIZXVvZnN5Q2NBanRTVUdp?=
 =?utf-8?B?enE4b3UzZUwrUnJvNFkyTXF5SDNpMlQ2MmNlaVNzMlpqb0hCbWtIdStBd0Ny?=
 =?utf-8?Q?Nq14Cm8jZqzIJUyUEsdrTLM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81A1F3422630E24590652F20DC67F74B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432dd0d-8863-417b-4b25-08dd13c6ef04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 18:18:49.0366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjgXM4qq+tN49PUQ6mQ3mURdhFgJJl/PcoQ2Q8rtOOTZVFV5yM41rsZzQTkmFLB9Qehl3W5GHpbDFJ3m3ORVXhdRoUlimNCV9YlyauR6jVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4094

T24gVHVlLCAyMDI0LTEyLTAzIGF0IDE3OjQxICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxp
bmFyby5vcmc+DQo+IA0KPiBGb3IgYmV0dGVyIGJ1aWxkIGNvdmVyYWdlLCBhbGxvdyBidWlsZGlu
ZyB0aGUgZ3Bpby1vbWFwIGRyaXZlciB3aXRoDQo+IENPTVBJTEVfVEVTVCBLY29uZmlnIG9wdGlv
biBlbmFibGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2
ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3Bpby9LY29uZmlnIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9LY29uZmln
IGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gaW5kZXggNTZmZWU1OGUyODFlNy4uZmI5MjNjY2Q3
OTAyOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gKysrIGIvZHJpdmVy
cy9ncGlvL0tjb25maWcNCj4gQEAgLTUzMCw3ICs1MzAsNyBAQCBjb25maWcgR1BJT19PQ1RFT04N
Cj4gwqBjb25maWcgR1BJT19PTUFQDQo+IMKgCXRyaXN0YXRlICJUSSBPTUFQIEdQSU8gc3VwcG9y
dCIgaWYgQVJDSF9PTUFQMlBMVVMgfHwgQ09NUElMRV9URVNUDQo+IMKgCWRlZmF1bHQgeSBpZiBB
UkNIX09NQVANCj4gLQlkZXBlbmRzIG9uIEFSTQ0KPiArCWRlcGVuZHMgb24gQVJNIHx8IENPTVBJ
TEVfVEVTVA0KPiDCoAlzZWxlY3QgR0VORVJJQ19JUlFfQ0hJUA0KPiDCoAlzZWxlY3QgR1BJT0xJ
Ql9JUlFDSElQDQo+IMKgCWhlbHANCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMg
QUcNCnd3dy5zaWVtZW5zLmNvbQ0K

