Return-Path: <linux-gpio+bounces-10485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262E987F2E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655B81C20AA5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 07:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78F317C9E8;
	Fri, 27 Sep 2024 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IlPe8ydb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869066BFC0;
	Fri, 27 Sep 2024 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727421248; cv=fail; b=KfGiWhriUP+S5pjdWVLyNJGW9IGevdbaKWm1Hzu/C9js7w2BsULG+vaDJSBl2XZqxxEiepLSoHjENI06AzSC4FTv7xnb2Nu3bUThTT55Fg5Cm15GKPCQSfF7MX/cxtdrx448NM8t4fJKR+e0PQRamURfOcab5IFc2Vm7bi2iAqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727421248; c=relaxed/simple;
	bh=DJmY/uSgtKbP0lMdeX0NEey3QnNuBmCBjpcL2q07b74=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NsGevOiCAdfa+oamc8BidX5S9I6JnrIuzG6iXjbv8qkN8Whi1LeNSG8unpbuOy/HCBZXBe/XyU97xOEYEztDL+uGxadBgu+XAvknxCJ1RdDNTbufwEN6Z74exxeoedVHNb8cCRnm9tTVsO0jATvnAbSXttZzlqjiW7DEaJtMJF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IlPe8ydb; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckBwGFw3hrKxyle9BHXFf90Pzumb1WYf05uL1ClZdk5LJDMxATLVlGPt/s+5sIuVSo0hLY0+BdLUdkWf54ucUWmNv/kt9SXu0bD7ialKWiye1dVR7vvcNXT9EzXQJ/nrLIXUuMvCZBp/rvBRI4csZMNo16i9B2Z+jojGY1uRa7I1j0FZuLEAr+nr0BazVevvLFdku3TiBBTFOMSErCCar8vvN7ql+e2wudcbSdxEPhRjem20s5738ygVFlbyAoIhsHSSAFEg589Z1Dyh8GuvF9rzg7UdTE9IcVDu6hfcRj3dPZrGBZC3rXrl13W7Ihe5Xwmsb9SDdYUEM2JpQ+33tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQd5OcGcI6XeCl97b6y0mnFfjEAgrWUG9BBojihtx7E=;
 b=FWTA8y6fhQwPH7B/s2y/4DBCCal8Xwnw3VPPzAobe+ZhUkO5t6sr8jwKxNldaGdA1OXf/In0Zuf0h9PtWo/sKyfoNR6mJYSTL4eJJMPgbZFLnUxjMfD2zfaAiLiFJEwOOigXhFuVXqZ0F5YlGrdZV4M75CEGpuXOE8V5jKmWKUYnt7Z6lnDjRh4BV3OIN1ppcedABq3a/rIXhCrdqmunx1K3JwvR8Vvl25FqOWA4nXQbNG56rnPkvv7g6JH6SA5F26CdtNNonjo8B9fS0r0ufY4waE9P9+0qKX0ZB7UcwnInjL9wFV82qcBB9ThL0qsApqw9J7b4n8rhQxODdYz77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQd5OcGcI6XeCl97b6y0mnFfjEAgrWUG9BBojihtx7E=;
 b=IlPe8ydb4VHpzz8xJT0bxfY6IKPpeFPxS6A3TPo3BAefuCNPYeVXueVO+ozseud82OfPdLEWvy0HEBijNlEdVcZjyK3COtzxhTZ0ISW0vTPrvCrcV/REc0PSCQNWM9Q4p37ysN44sm9yBtHQfGwjOhKyZe5DXdFe9yUcQRnoOu8bj2wqxglz9Qa8O3VQCF4UlJr4ak8NkkVZqJb5sD2YeHdiZzhqtKqhpxeEmoXLIxMquOrCCfwi0jw8nEGt3QPBrqJ4KV1xt0wUvfhXuc0mSvNz4T9kcnZ+gzrm+Pf/a8kkMp63QVZCBt4RbjGDuR6a3WJNt6i8eArWTat1ACqNDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 27 Sep
 2024 07:14:03 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Fri, 27 Sep 2024
 07:14:03 +0000
Message-ID: <c2d8f121-903d-4722-825f-c00604ef3991@oss.nxp.com>
Date: Fri, 27 Sep 2024 10:13:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
 <20240926-apricot-unfasten-5577c54a3e2f@spud>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240926-apricot-unfasten-5577c54a3e2f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0059.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::26) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b8427d-ee58-4698-84e2-08dcdec3f73b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkZNMWRsbWFXS3JWdjdBTHJ4UUo3cHlnZURHbUVEazlZRUgwR1ppYllVZjdp?=
 =?utf-8?B?dDUrTFU3ckhKUTdlQmdNdEtvaGdYVDRPd3BqZnZaK3drVkhnMHZmc29JVUlq?=
 =?utf-8?B?NDZ5b1ZyQlkxa3FFU0ZGVjR1RkNWNUl6alpPSFNGV0JpMVV0cnAvcDd6UHNC?=
 =?utf-8?B?WU1MNHoxZVRFM3RGYm0xa245VzlyQURreUNpMTUxVlRoTm4zV3M3TE5ML25l?=
 =?utf-8?B?YWlQNm1JQS92dFBRRHFQZGplcnJsc2RxZ1RuMGgxeHZZOHN1ZGVsQmF1RTk3?=
 =?utf-8?B?Y2NnY1RQRkRSTmdmbDRvQThzQ1RKNDlvWHVwbGxxTTMvYnN4QmdRMUE3emM1?=
 =?utf-8?B?YmZ4bm1KSkxRSnV0Yzd1S2tjVHBEdnNobkxLNVFpSU55aEZjbmJNUml5c0NV?=
 =?utf-8?B?SW5kZXhGSWxUdDVOa0tPZy95cVFCUHdycWM5M1lYOERkSmZKNytCdnN6a0Rj?=
 =?utf-8?B?b1hBT0NrYUI1eUxleGRoNFpoNlI0di9waUhVejhTanFRdzNJRDVQem1OS3hH?=
 =?utf-8?B?bE0rVGIreWkzWG56c2ZmUUZHRXh2VERYZ0dJSzVua0VQNyt1UXpPaGYreUhp?=
 =?utf-8?B?VXY4dTdPdnBxUWloVy9EYkQ3eFRDaDJLRlUxSUdQUUd4eXkwWUovaWVJT2lX?=
 =?utf-8?B?YUVkM2l4bzEvbUM4d2x0QWM5V0hTR1JTVVpBN051dmtoYW5yekdyRUhiT283?=
 =?utf-8?B?ek80dmZDbUE3LzdMM1RnZUhQWk1RYU1tYWVNdDhxT2Y4VWNkdW9xT0RoaVBP?=
 =?utf-8?B?TmIydlVSbGd4aURMck9mRkJkQmZ0U2tKcXowM0hZbHpHektSTjl3MUhNTjg1?=
 =?utf-8?B?V0pSZ3Q2UzdJY0FWM1lJaFB1anl0cXowL1lxMDBIWVlpT09vN2FhY216T2pu?=
 =?utf-8?B?MHJmMWNKZ1dMMjlxTFh4d3VzK2NpNUlaTXcreEY3SWFMdjFaM3E2cm4xRE5n?=
 =?utf-8?B?U2pFd3N2Q3M4NEsvRFYrRE8wRlRldTR3QXZPRHNTMCtHbkorMC9GRzIyUm1Q?=
 =?utf-8?B?WWovR2Nta3J4ekswb0piSjY1STRiWXZobWN2bFJua3p3dWFXbzRzZDhBa2JM?=
 =?utf-8?B?VmZuNFBQVkkwcWpQQVAxa1BEcGttSEYyS0loTUxaNUlOMk9JelVLdTNIUy84?=
 =?utf-8?B?RVdOcS9NSWpWdXJ5dWpXODBnWWV2d1p6TGQ1UUFsMVF1aW45UTltcHczYUdh?=
 =?utf-8?B?RTBCV3EzYWJ5eE9RN0c0c2dkQVRHditpS01VbzNvODkxdDVkeFZnREFzbk9R?=
 =?utf-8?B?K1FQanJFN1p6R0NyNENISWtacFE0VmNCTTFoZjNaOTJYTm0wc2ozUGRPUDgy?=
 =?utf-8?B?THVMdFFSZTJ5eUJaM3dLZm1vTXhTUXNzdzBnNzBOMmFuZVUvMmNnWUF3VU02?=
 =?utf-8?B?dHVFTG4xUi8rVEJIbGlrQ1J6NVYrTGJJZXRlUHZISnl0aG1OdTlCOFVLaDRh?=
 =?utf-8?B?NjJNbjVWaTlmWVprQ2FwRHJtL04wNElUc1ROWGh2eXp4cHpuQWRkTDN0SFZD?=
 =?utf-8?B?MWZqMFlGTEZkM21BekV6ZUg0VEZsN3BFUEdzZit2OXc1OExJNG9NTmhUUU1l?=
 =?utf-8?B?My95cis2eU1sVnRlZFZyUk9VNEVTOEc5Z2xnTTU4VTRsd2wxN3B3VDgzSVNn?=
 =?utf-8?B?NVhabEhBYWpvOTJpZUZQQ0ViNVFFS1dhc2hkbVR6djBZUjFZSEtXZGgwSVlK?=
 =?utf-8?B?aG45YnBhZDlWQkF4S1d0aGxQaGNKTFp0VzJPTUVKYzN0WVo2YnFpUVhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUR4V0tzdSt1YWt1UGpHS2RlS0lZalBwZXZPelNoOVAxVUtYeU1WWEJCZG9R?=
 =?utf-8?B?YktsWG5Wb25idzg3NHVzVkQwM0lvdUdxd1RTb1hMQ1pwSm1IRnVUR3F0bXV3?=
 =?utf-8?B?MlpaTmQ3Ny9mcHo3RkE2c2xza2tQeXAydkwyZnZYSEQvMGFLTlBWWExtN29y?=
 =?utf-8?B?VzlOR2VKamhSTk12cEdYWmtxZTErYnJ2MEtXeGhzbnhydVNiQWZOcys0dUs3?=
 =?utf-8?B?eEl2Y3ViTlUrc0FJanE5T3RaeHpRMU0rd0NsS2hHUXZJMjZIOHVTajJRcTBk?=
 =?utf-8?B?ZmJDN3ZZMXVlTWRKUTNudC8yNFU3Rk9qdHRNT1B3WVE5YzBOUUsvbFhaMFhv?=
 =?utf-8?B?R1J2d3QwcTVnZEFwNG92T3h6MkpieGpoV1dYcko2NkliSWdUT3V1bEN3YnZm?=
 =?utf-8?B?L3F2MUlHYnFVRVhtaFhEOFZaaVV6dHdTSFZjZ21LVkpNQ0ROMTA1dTRqWEpB?=
 =?utf-8?B?d2NUcWV3V09sZE9WTVpmeWg5Wk9DQWZUc2o4NUNjZDN3Mm0vc09LQUxKVlps?=
 =?utf-8?B?MDZEaXBmd1ZiT1d6SEN0NWdlM0tnZHB0QlZYSWpOUllXcmwrVlRJbEJKZHFQ?=
 =?utf-8?B?MGhrcVhuUUhZbWJaNGZpWDA4LzhBcTNWdG1IZlplcmsxTjNjUTlBOW5GOGZn?=
 =?utf-8?B?emZlYlozcjFXeWlyanZGQVZsbkorS3FEbWpOWU00azlXYk54bkR2MktIeDIr?=
 =?utf-8?B?UDNpNXlrVlE0YWwyTUpmRERsK1V0Qk56RzlmUW9MbWpCMmpNR29XQkZHZmov?=
 =?utf-8?B?TDZPU3hYOEFuSXRBY0Ewd09BN0dSZFJ1NkhTeDVIYVZWc0lMb2doUmhLYUtH?=
 =?utf-8?B?WHg2N3RCUStGOXVORG4xYit4N1diQmhnckFPTkV6R29mT0FkNitKZjJoQ0hG?=
 =?utf-8?B?eUdWbS9XcVkzTG1zWmNmS050OCs3bmhwME4wWDNFYUhqSFd6bEJhclRvNGU1?=
 =?utf-8?B?WWIrTG5rUUV1STZBRE85QmovRkgzYXlna1dmamZNYUFWbXZqZW1CNFpEdWdE?=
 =?utf-8?B?QkQ1anFnbkkwY2RDTHVsM0ZiQjdsczIvQmxXSHlwRSt2TjB5Wi83VU1hNW4y?=
 =?utf-8?B?OEFKb3BuSEgybWg0NGE2OCtKVWVTNnZwRXovaGZZQndsWlZlRHM2Q0FwY1Jj?=
 =?utf-8?B?VFA4aFI4SER2cTNJWmdZSFBUMmE0NlJxL09mVXdmYUxGRVA0WGM1Y2dySlJH?=
 =?utf-8?B?aEpFdHZpcGgzbGVYSEpEL2tUVnlMY3F1dHk2NkNQMTBSVXhCWjRhNGZhV2pX?=
 =?utf-8?B?NnhLNlIzczdneG5WTkVGUHdTMlBuUzc1QjRKMW9kVHl0WXplVUJpUkd4NC9q?=
 =?utf-8?B?OE1mcFc5VDBiM1FoelZCTHBMTGJzTWVrcEcvdGQyMC8zT3BjNVJhcXloRlMx?=
 =?utf-8?B?MkRBem9SN0xlNE9HNzBOejhBbXB0cGswdURxSW5hQVpKL2FCeXNpZWVZM3Av?=
 =?utf-8?B?amhSTENhTHZ0STdmTlo5bHJlNUthc1M2ZUJEcnJGR3RXdVlGQy9DSVZ6N1Vx?=
 =?utf-8?B?Tm9XY0VYeFVnRnZMd215N1J4aktoTmJUVXNNSDhyQ2ZDejFEM21uN0N5Tjdj?=
 =?utf-8?B?bVREOUlDN3NvK0VWV3VYTmFBdXkyeXJwQmtZdk92RG1HME1xRWZab1krT3RL?=
 =?utf-8?B?c2M3UlZyZWJHV25hbUlVd0JXWnF2QUVNNU53UnN4OFV6Rnh2akxwNk01Um10?=
 =?utf-8?B?OHlEUEhEQkZTa09ianZoMlFjM1AvazViVU8waXJKcTZLK1o0U1ZXc2RrdDBT?=
 =?utf-8?B?RDhHSThBREFHSHZxSnBma1NaMFQvcWJoWWUxcUpLclhBS0pXWmdZdzBmRGRu?=
 =?utf-8?B?OWt0RnljQ25nMWNya3FwR3RxbnZ0YmxFNXN6dkNrWHlqMXRURFZGWkExMXpz?=
 =?utf-8?B?Vlg4M3dQbTNNNDl5M0F0YzZhMU1Wbkg1UXNGMFNubTZXN0U4ZWF3N2VYTkJT?=
 =?utf-8?B?bmZNUVQycElUNTY3eUprWmE4bnBFUzlmZUdNc1BuMlpQUFVkWlBuMy9rL1Za?=
 =?utf-8?B?cW84MmxlVnpEaC8xMnp6SEdnYTNsZ29DcWJxeVIvRzA1QzJWNDQxM2RDcjE2?=
 =?utf-8?B?V1dLUTNmbTFsMWxISUNOcmVMeXZqb2lLQURMT3BtQ2t0YjF2NmVNYjBwV3hW?=
 =?utf-8?B?MU1vY08xNjlMbXkwMEFBWEk5T01aUERNeGlaS3JjeVdKV1RMQmdVemJrV0Fm?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b8427d-ee58-4698-84e2-08dcdec3f73b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:14:03.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjH2KAIwInaCEPwbVm9BBYsIdN5JTQ0OvjHxXL6MdgPNxmwwvadwD7fBGQzaXeD53XBpJRKZeR7tL0UtaUODng/egG939SZil53G+GM+8gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

Hi Conor,

Thank you very much for the prompt review!

On 26/09/2024 18:38, Conor Dooley wrote:
> On Thu, Sep 26, 2024 at 05:31:19PM +0300, Andrei Stefanescu wrote:
>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> What's up with this SoB chain? You're the author what did
> the other 3 people do? Are they missing co-developed-by tags?

Yes, thank you for suggesting it! I will also add Co-developed-by tags
for them. In the end it should look like this:

Co-developed-by: Phu Luu An <phu.luuan@nxp.com>
Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    gpio@4009d700 {
>> +        compatible = "nxp,s32g2-siul2-gpio";
>> +        reg = <0x4009d700 0x10>,
>> +              <0x44011700 0x18>,
>> +              <0x4009d740 0x10>,
>> +              <0x44011740 0x18>,
>> +              <0x44010010 0xb4>,
>> +              <0x44011078 0x80>;
> 
> Huh, I only noticed this now. Are you sure that this is a correct
> representation of this device, and it is not really part of some syscon?
> The "random" nature of the addresses  and the tiny sizes of the
> reservations make it seem that way. What other devices are in these
> regions?
> 
> Additionally, it looks like "opads0" and "ipads0" are in a different
> region to their "1" equivalents. Should this really be represented as
> two disctint GPIO controllers?

I will add a bit more context regarding the hardware.

The hardware module which implements pinctrl & GPIO is called SIUL2.
For both S32G2 and S32G3 we have the same version of the module and 
it is integrated in the same way. Each SoC has two SIUL2 instances which
mostly have the same register types and only differ in the number
of pads associated to them:

- SIUL2_0 mapped at address 0x4009c000, handling pins 0 - 101
- SIUL2_1 mapped at address 0x44010000, handling pins 112 - 190

There are multiple registers for the SIUL2 modules which are important
for pinctrl & GPIO:

- MSCR (Multiplexed Signal Configuration Register)
  It configures the function of a pin and some
  pinconf properties:
    - input buffer
    - output buffer
    - open-drain
    - pull-up/pull-down
    - slew rate
  Function 0 means the pin is to be used as a GPIO.

- IMCR (Input Multiplexed Signal and Configuration Register)
  If the signal on this pad is to be read by another hardware
  module, this register is similar to a multiplexer, its value
  configures which pad the hardware will link to the module.
  As an example let's consider the I2C0 SDA line. It has one
  IMCR associated to it. Below are its possible pins and
  corresponding IMCR values:
    pin 16 <- 2
    pin 24 <- 7
    pin 31 <- 3
    pin 122 <- 4 
      (Note that MSCR122 is part of SIUL2_1 but the IMCR for
       I2C0_SDA is part of SIUL2_0)
    pin 153 <- 5
    pin 161 <- 6
  The IMCR values should be aligned with the function bits in the
  MSCR bits. If we want to use pin 122 for I2C0_SDA we will configure
  the function bits in MSCR122 and write the value 4 to the I2C0_SDA
  IMCR. 

- PGPDO/PGPDI Parallel GPIO Pad Data Out/In
  16 bit registers where each bit(besides some gaps) represents
  a GPIO's output/input value

- DISR0, DIRER0, IREER0, IFEER0
  These registers are used for: status, enable, rising/falling edge
  configuration for interrupts. We have 32 interrupts called EIRQ and
  each interrupt has one or more pads associated with it (controlled
  by an IMCR register per EIRQ).

  However, one important thing to note is that even though there are
  EIRQs for SIUL2_0 pads, all the interrupt registers mentioned above
  are only present in SIUL2_1.

Because of mixed pins (I2C0_SDA in the example above with the MSCR
in SIUL2_1 for pad 122 and the IMCR in SIUL2_0) and the interrupt
configuration registers in SIUL2_1 we decided to have a single
driver instance.

> 
> 
> Cheers,
> Conor.
> 

Best regards,
Andrei


