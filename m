Return-Path: <linux-gpio+bounces-20394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF248ABED24
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723BA4E2254
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDAB235079;
	Wed, 21 May 2025 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PoeB/nyv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD907232785;
	Wed, 21 May 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812819; cv=fail; b=ioRChW+uC7bYNgPTohg3RpKjLCyyQIwbXSM0uTwUFTH6r5hFGg1DbHRFnWCUl1JtnzgWmy9iRcRWKrzwSzdS6+Ez0lu1L1xDtTuIndhIAVDQJdyjUV12ZmkD9ih4s9mu+EK7eSFbsCLyvLDafVo/4OhGLsWUvnqdGX1/8gnU4iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812819; c=relaxed/simple;
	bh=RNCLlyTUc6GcPE5tUi79NPcvuUD6bQtObPDwsR9tIkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UR8kYObotex3Ft+bMnU+UJzlyIgMnPgUU0Iti5nWBMQ6Oj7QaYBv4PpYLHnbTGCbcnIX+R6oUqeokmYq6c/rEqSohP+2hQtioVZWqccNJpwqtKefg1gsuPRuM5ZeKrZwildAtuFPOBFoGgY+WdnQLAX72LhEYqU6eMTCDBmpED0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PoeB/nyv; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGk8XrH5Ru0FLIZJdMoRTnQZq18Gfy0OrQY19fs3DoyajAaIIhICuWA8l4ltMwgOS1luwJKe3Siawe4P68BgB6XFgtUFsJt8uJ0PFaMCPKoTFJBCJ8oZqBZ/gSsU2088lqGZsd3gfykXtr704dYSt37aw6PEQuBBKydzz7f3B9WwCaJKDFfy6DLQFApJxzgOPrApq3c9JoBkyFQh1EXGskRmVbG0dIqq50UYNndvbSMQerVMFg8sGObMYLufFCoXFstsMc/FY/4JhjXCk1y4Gm0Lahwx/bbBAe596EtGi5Q9iEtLSjCWhZJQg+9AcVDYo8iZSxiueStSOLFNJelxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNCLlyTUc6GcPE5tUi79NPcvuUD6bQtObPDwsR9tIkY=;
 b=fcyf2gj7SYZ6QJR1PGfx9cvVusjGfDT/O1lJACobJyq3J0qCF1SamLhHy6lK8CL5w4C5LO8Awlp262Mm67WrltElVXUdIsDY1elDkz7ccXmUJDnfoWMnS2pslYR1MFQ86NswjEYQROcyTz0jzbAbGnooaqSQzg/nzI6rGA462WSpwZigHz8rYmFn66JzZiAOInn+2Ep5tNxer2el1fd6mX8LhojRBCnE0K0y5m5UT1tW7I4RxjCdzl4O0MDTzH7LbtJynWU18Ui8RZoZP51AIvhUfKsmiI4gUuHIVRMcC1BcgmzxA8nxkQjx7Tj7HKuM58P/xL10U7/WOv7DTTd1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNCLlyTUc6GcPE5tUi79NPcvuUD6bQtObPDwsR9tIkY=;
 b=PoeB/nyvWHxwU3yhp5EB+3fN7gZyITPdLLGdt0Uxs+0E4moCwKNCIrR4K0OP1vcoCVK5y8eaQAEpjOM48jpz4ze6CPi3syVt40p7QJvdeT/eLydpcqaTlQ0/C94K4hqPYzGXRiRHXPgmO8qfAVbMXY5mQ2pasI0blY/tuT8qdJc1cHnXKRMPnCXzqN/DSBGy45DxMCz6NoT4JtIUBRzYNWQa00k1NJ0KmKCTm6eRjfMtJI32G97bIx/mf2EejsuiKi34su9ZtdSANuIhDVapO21JO5Ww1pUGrNp7fTieeLbyjf0gxN6jNFuUIFFjCoIKThBWAKmmcgpenpG6iZQyww==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10393.eurprd04.prod.outlook.com (2603:10a6:150:1c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 07:33:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:33:32 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel test
 robot <lkp@intel.com>
Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Topic: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Index: AQHbyiEjEl7a/CI4dUeAWBDO4NdhhbPcr++AgAAAq+A=
Date: Wed, 21 May 2025 07:33:31 +0000
Message-ID:
 <PAXPR04MB8459A099FF0649D61BD21218889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
 <CAMRc=MfbQMebHDa4_=79ZaFRf_0V47wQHh8bP+MQh1Qj=wjOyA@mail.gmail.com>
In-Reply-To:
 <CAMRc=MfbQMebHDa4_=79ZaFRf_0V47wQHh8bP+MQh1Qj=wjOyA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10393:EE_
x-ms-office365-filtering-correlation-id: 1b36a451-8716-49c1-24ea-08dd9839c9ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dmlXYjNEQVFzR1ZTekp3SnJTazNGNVo5Q0ZPYnppMEU4Rm43YmduNk8zdEp4?=
 =?utf-8?B?aW1lNXgwVE1sSHlITFBtaENrRnFCd0Iwb2h6OHBMR1BPZ2ltcmN0dHFaRXBi?=
 =?utf-8?B?SjFLdDlQbTVhK1pWczl3QjFHNG8yZm1UM1lSZjNnMEYzc2lOM3VWOVZuTUxn?=
 =?utf-8?B?QjlmWjkyYUROVzVHdC9GdVRQaUpTa0ZqRk1Ub1Q0K01QanVQbHFsTnJKQWJa?=
 =?utf-8?B?c1QvTjlQSFFZTVJpb0pCSGtiVFdrUWQ5N29rWVRqcFJSR3RJNFVMK2laRldm?=
 =?utf-8?B?VVRkdmh6dnFNaUp3aVd3U0dQaENGWkcrN1lGUm1RVnBibmMzMW90WkNhdFNE?=
 =?utf-8?B?UjhsOElrdFdHTHllVGFyQnFuYUpSMk15ZGRvZHNlYXRkY1ZmUXZvWmVJUlhE?=
 =?utf-8?B?VlY2TWE3N3dEL2o1VE8xZUdkQzNRdEVDRmp1elp4OUJxdGVpWVNnZ2UvYjUv?=
 =?utf-8?B?VmI0ek5mYzVQQnNGYzhsZDQ0K2U0TXdyN0ZKekNxcVVUT3RzY3lreGZCdmd0?=
 =?utf-8?B?Y0xQT3ZBTEc2VTZ4WWU2Q1NmTEdISmJEWldGMEFJTEF3SGphUnNYTXhxQ25S?=
 =?utf-8?B?WTZpaFNyQlFoOVorMmxhMGUzRVBwNUFLM0JrbEpKdnJEWmRCbllVeHY1VE9v?=
 =?utf-8?B?NmN4OTZJN0ZaWEtuL3haSnBnMC9HYzJ0ekpkdE02b2lUWDVvMkZ2M2Y5UWtJ?=
 =?utf-8?B?OG1TV1J5aTBqVUFDVExNSEFxLzZNbmcxUjBoUm56TkttU3hQY1JTMWNETHZp?=
 =?utf-8?B?VXA0Z2hQbnZTWkdyYW1IaEJFdXpRZGpuVHU1dk1IVzJTT29TM1FNbExhNWtu?=
 =?utf-8?B?K1MzTytsUzhlQktEK0VQYjlOK0R4NTcwL0thZVpMWXVhejhJdlRWb2R0MDNW?=
 =?utf-8?B?ZGJtbU8vdWNmSmNBR2p1SVRXb2FiUVZkcGZFQjRiRStiaWorUlhxQXZObTg0?=
 =?utf-8?B?TjFvVEVVRFBYbGgxR2R0N3FRdHN0L3FZaE1VbURXUUsxd2FUak1sclJyNkFB?=
 =?utf-8?B?Y2Uyd1FMdjFNK040OEdYOHZ5MDlUOU1jTjNGT2lLYktGc0NkeGJ5NE9JK3h2?=
 =?utf-8?B?UmQ0YnVoc0lKampudy9tUCtGdUZCMW5zWjFIcHQ0cS96OFJVTmJGT1BNbXhE?=
 =?utf-8?B?NmlBMnZHZ3dRYnJhY3lxQk5HQWF2WnB0amlMaEtXRVI5WU5mZnEvT1JTWUxr?=
 =?utf-8?B?cEtObnhNM2ZTbmIxVVVpTm9LbHkvSE1KRWpiUzZMVEhpdlBvalpSQ085SjJS?=
 =?utf-8?B?dWFDdjFZTXd3ZGhPcnlMQjZMV1htQmZ3bndWdWlISUF0YUJtSVE0bk1KMlZu?=
 =?utf-8?B?ZlNIenhLcjliWlRnZVA1aCtRVzFuYVp0WWt5ajhEQUdvb3I4WUhMS3BjZDkv?=
 =?utf-8?B?c0NjbVFUNEs5QXBGNlIyeHhYajAyWFE4eVNBTHg2NmJDSFJFdlVSTDkrVk1y?=
 =?utf-8?B?cExKVy96MzFtKzB5dmFJamRpL01GRE9UQkUvaHZ5QjVaaG1tdEFtN2JZdmc3?=
 =?utf-8?B?c0hyV0hna3hCYXNJenk2cjcwdzNyTmp2SXR2VnQ4Z1E4OHRmMHl4K3IwUURI?=
 =?utf-8?B?MlhOQ2wxNXFXUzBqWTJzNFJXM1BxZ21MWGdMYmU1SzJKWmpqWi9DdkxtaVFB?=
 =?utf-8?B?S2dTNWcreGVCUFBUNk5aclNzRUZ1UUJaYmxBUlE5ZVl0VDBhVTNGa1JSTzZm?=
 =?utf-8?B?R2h3cDBlMjlKL2Z6eWp0STRzbnN0cVFDTjAzeXpGUldXVU11NTFmMFFqOUZZ?=
 =?utf-8?B?NExyMGJvcGMyODV6RU5pYTZ2ZFFPRDJSUDFQNElJK3d2ak1kaVJ4ekRhVzNM?=
 =?utf-8?B?RnBYTHc1cVErTzc0eENQVnVQMHBBWlJvYVpBSVNZd1JkK3ozc09pSE5FYzFG?=
 =?utf-8?B?b2VkZFVYb09qKzkvRGRYZjFXWDlGL3Z3Z0VlcFlYMUl6M092cE0xalgwa0Yz?=
 =?utf-8?Q?LCCAEwY1Uwk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UW9YZ3ZoZS9hMlBhOFpmL0JON0dERndNSUYvU3pjMnhOcy92dUdlNVZYVFk0?=
 =?utf-8?B?Qm1tTXNnYldXREp5SlNTYkVQUjEzYzlFczhBZlJUZ2U4QStQOEtCelF4cUgw?=
 =?utf-8?B?cThERmt1NDc1UTRJWmd5Znd2ZXU1N3cyR1R2MXdQWVQxbitqVzBQcDBnaWw3?=
 =?utf-8?B?N044SXhpM0FkTVRHcFg5dEkrUEU5dGdRWFFmYWJNakdFemdQTkVNZjdqSyt2?=
 =?utf-8?B?MXlab21YZmdjMyt1WnA1ZWl2bDVFSmpLWm9rVHMyMy9naXhuS29qUXlPUmZo?=
 =?utf-8?B?cWh1MHBZVW9idENTZ3krU2RadXVtem1MWVdGSDJoays5bXFST1FMOFhFQzJF?=
 =?utf-8?B?NStlbnNtVmo2UGJBdlVWcUE3RjhteGx1aUt3OGRpYTBHK2Z3ZXMxQmtNZjNt?=
 =?utf-8?B?V0cwVk1jK1RxSjZXeEVWN2RGMEdkY2luRHZoUjZLN3hsWHpER0QxRW4wc2Vk?=
 =?utf-8?B?Z2pNQXd0cDRqbFRoTlJ4VEYrL3hKeE00MzFnTUkvNHdkRU1Ba2RVVmNwOUtm?=
 =?utf-8?B?UFllYlA5OStpR0tIcWJuNlZyVHpTOVdxMDZ6WWZWN01ERFkvbTl5TEF2RmxK?=
 =?utf-8?B?d0k1b1dMQkw4eDZnSlJaVEd1N0ZKcnZKQW5sdEp5SldNRnZDUlJIMjFLY21y?=
 =?utf-8?B?OTBrM0dqbFpMc0lxQzcvV0VHVUx6L1NxL2ZsbWpUOXcxVllDL2lVSUpxY2Vu?=
 =?utf-8?B?c2tZUkNlQ0lCTit6ajZCcE5IMHZ6anU0dUF1K3VIb0lUbnNpUWV1bzVlaVln?=
 =?utf-8?B?bUtTL1ZkVFIxbjVhc3BHZTR2UWE2aFdnenJGdTBFckNBL1JvNjBBbWlOMFdZ?=
 =?utf-8?B?Q01Cd1RFTWM2WVRoREllWW03djF5OEZyK3B0Z3g3bXM3ZmlPLzhqYlNtcS8z?=
 =?utf-8?B?QXorVWxxem9GbWZ6cllSb0JPVnhMa2JGTlhWVjVPaksvVFlLbkJFbW5VTS94?=
 =?utf-8?B?UVdYQi9rVWRBalhvSngzMHJQRmlmN2xTcmUwT3paRVF6dnA2dHVXM1F2QTV0?=
 =?utf-8?B?di9IWnRSVEphZDl6TkxUcDZ6MGZpOTJhNVBqWlVFTE5wS0t4aURJWFA1bVoy?=
 =?utf-8?B?WGphK05yMDNOSFJCRDVFRUMyME40TDFDZ1djOGkrampPdGdkbWFPaGI2bXhO?=
 =?utf-8?B?L1V1QXlQWFdVYlFmdENxN09SWUxneTRRbXltck1TZ1NyRmwvVXAzalkyV3Rn?=
 =?utf-8?B?ZFp5K1JaZTUzajVGeFdUOUxRUWhKNVJ6Q0lHa0FRSit2K0NoRDJ6TjBuNkVh?=
 =?utf-8?B?SmhCY3VkNWk4TEZvcllocW1PM2g2Ry9IWU9QRTIwMTk1eFBETWFaYWpoYUww?=
 =?utf-8?B?eXRTdFd6R3NPUFVMdTd4ZlRaRm1QOG1WL1RVUlZQWEQ2TExVWVNhQm1GbytD?=
 =?utf-8?B?SU9lbHY1aXZTV2VkRitEcm1IWmdqMEwzcVBoMk9na0lTd0hUbUxOaDBSMjZq?=
 =?utf-8?B?SCs4NHB4UTU0U3N6S1hwSHFrWDZ2NnRobDUyeWNrRThyM3FBZ2RQOWRFWjBW?=
 =?utf-8?B?dHlpRUZUWkl6MnpWS1hLWlFFdElFanJRWFo0OEJRUjJyeWszdy9JUGNSNEFj?=
 =?utf-8?B?NGZhcVdmd1VOd0trbDNJeUJ4WU1xMjNncWI0cGoza2tXSE5rUTBLbXBMYUl4?=
 =?utf-8?B?NTVEb0RXcHRidjVwaVpibm16VHFYc2t6RHpqZWdKMGVIMnhWcHhNcTZJbEJ3?=
 =?utf-8?B?UmJ3RFVTMnUzcFA1OFllb2x1WERsVVVPd0JLSVBPYjB1czhHdVphWVJwZWd5?=
 =?utf-8?B?ekY1ZnIxWlk2OUE1SXhMT1l4RlhJaWViNGJzdVp3c0lqQlF4V3NUdk5WSUNW?=
 =?utf-8?B?QVJnVVVlVnhBYVp6S2tWajJKckhTcDJkMVE3TFVFN2xaSThMUW14MWlMYlJr?=
 =?utf-8?B?bjBNQVpLNmhwZlZpeTROYWZiSzZpVGpmQjlZOEpBMTZSMmZuRzgxVVcrME51?=
 =?utf-8?B?SVpYeWFoSTZhbWZIQWhTaGxRQmVhQmRsQXg0YStpeFdRaFNWSnNjQWNkSUZv?=
 =?utf-8?B?Z2E4cG9OSnhrcDVxSlV6a2hhOVR2K3hjY0l4NDVXS0N6SUVBMVJmWlJ5VG5o?=
 =?utf-8?B?SXR6SGJEUUJKV2x4aGIyOGQ1QzFaY3haVStFZ3drTDB2ZndqdGRtS1dUc0dt?=
 =?utf-8?Q?a69U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b36a451-8716-49c1-24ea-08dd9839c9ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:33:31.9932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5a7I9SHyxpYhWzJi/Hgy8XrcEnXW9ye8fHKZ5ns8Gp8du+8mmAJ1rGNTDT56PnN66vrjZWvu3tZV0vnoirTaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10393

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlvOiBkYXZpbmNpOiBzZWxlY3QgR1BJT0xJQl9JUlFD
SElQDQo+IA0KPiBPbiBXZWQsIE1heSAyMSwgMjAyNSBhdCA5OjIy4oCvQU0gUGVuZyBGYW4gKE9T
UykNCj4gPHBlbmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFBlbmcg
RmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+DQo+ID4gVGhpcyBkcml2ZXIgdXNlcyBncGlvY2hp
cF9pcnFfcmVxcmVzKCkgYW5kIGdwaW9jaGlwX2lycV9yZWxyZXMoKSB3aGljaA0KPiA+IGFyZSBv
bmx5IGJ1aWx0IHdpdGggR1BJT0xJQl9JUlFDSElQPXkuIEFkZCB0aGUgbWlzc2luZyBLY29uZmln
DQo+IHNlbGVjdC4NCj4gPg0KPiA+IEZpeGVzOiAzZjUwYmIzMTI0ZDcgKCJncGlvOiBkYXZpbmNp
OiBNYWtlIGlycV9jaGlwIGltbXV0YWJsZSIpDQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+IENsb3NlczoNCj4gPg0KPiBodHRwczovL2V1cjAx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkYNCj4g
bG9yZQ0KPiA+IC5rZXJuZWwub3JnJTJGb2Uta2J1aWxkLWFsbCUyRjIwMjUwNTIxMDYwNi5QdWRQ
bTVwQy0NCj4gbGtwJTQwaW50ZWwuY29tJTJGDQo+ID4NCj4gJmRhdGE9MDUlN0MwMiU3Q3Blbmcu
ZmFuJTQwbnhwLmNvbSU3QzY0Mzk3NGFmMTgxMTRmNTg1MGINCj4gMjA4ZGQ5ODM5NDM3ZSUNCj4g
Pg0KPiA3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzg4MzQw
OTM4DQo+IDg1MTg3NTQ1JTdDVW5rbg0KPiA+DQo+IG93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIw
ZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EDQo+IEF3TUNJc0lsQWlPaUpYDQo+ID4NCj4g
YVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2Rh
dA0KPiBhPUdDSmg0UWNpWXANCj4gPiBKTVBBUVFENjNzaDBqZFVia05jeFE1YmJmeG5Md0RMZnMl
M0QmcmVzZXJ2ZWQ9MA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPg0KPiA+IC0tLQ0KPiA+DQo+ID4gSGkgQmFydG9zeiwNCj4gPg0KPiA+ICBJIGZvbGxvdyBz
YW1lIGFwcHJvYWNoIGFzIHlvdSBkaWQuDQo+ID4gIE15IGxhc3QgYnVpbGQgdXNpbmcgbXVsdGkg
ZGVmY29uZmlnIHdhcyBub3QgZW5vdWdoLg0KPiA+ICBJIHRyaWVkIGJ1aWxkIGFsbCBhcmNoL2Fy
bS9jb25maWdzLyosIG5vIGVycm9ycyB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZC4NCj4gPg0KPiA+
IFRoYW5rcywNCj4gPiBQZW5nDQo+ID4NCj4gPiAgZHJpdmVycy9ncGlvL0tjb25maWcgfCAxICsN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZyBpbmRleA0KPiA+
IGE1NTlkNWJiODI0OS4uYzM0NjVmZDgyYjA4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3Bp
by9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4gPiBAQCAtMjUzLDYg
KzI1Myw3IEBAIGNvbmZpZyBHUElPX0RBVklOQ0kNCj4gPiAgICAgICAgIHRyaXN0YXRlICJUSSBE
YXZpbmNpL0tleXN0b25lIEdQSU8gc3VwcG9ydCINCj4gPiAgICAgICAgIGRlZmF1bHQgeSBpZiBB
UkNIX0RBVklOQ0kNCj4gPiAgICAgICAgIGRlcGVuZHMgb24gKChBUk0gfHwgQVJNNjQpICYmIChB
UkNIX0RBVklOQ0kgfHwNCj4gQVJDSF9LRVlTVE9ORQ0KPiA+IHx8IEFSQ0hfSzMpKSB8fCBDT01Q
SUxFX1RFU1QNCj4gPiArICAgICAgIHNlbGVjdCBHUElPTElCX0lSUUNISVANCj4gPiAgICAgICAg
IGhlbHANCj4gPiAgICAgICAgICAgU2F5IHllcyBoZXJlIHRvIGVuYWJsZSBHUElPIHN1cHBvcnQg
Zm9yIFRJIERhdmluY2kvS2V5c3RvbmUNCj4gU29Dcy4NCj4gPg0KPiA+IC0tDQo+ID4gMi4zNy4x
DQo+ID4NCj4gDQo+IEFoLCB5b3UgYmVhdCBtZSB0byBpdCBieSAyIG1pbnV0ZXMuDQoNCk5vIHBy
b2JsZW0sIGp1c3QgZHJvcCBteSBwYXRjaC4gUGljayB5b3Vycywgc2luY2UgSSBjb3BpZWQNCnlv
dSBpZGVhIG9uIHRoZSBmaXguDQoNClRoYW5rcywNClBlbmcNCg0KPiANCj4gQmFydA0K

