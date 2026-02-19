Return-Path: <linux-gpio+bounces-31862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDnQINX1lmndrQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 12:36:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4C15E523
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 12:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D90430233F3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E192FD1B3;
	Thu, 19 Feb 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HE9EXOX6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD8241695;
	Thu, 19 Feb 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771501008; cv=fail; b=Zueg7FHJzNU04kIKnTO/5UcviAkqzj66OueB6TYQ+XTEehaA7aQwlG0UUxgb10BTX6qv1egIGdtMkF0dUokkga0/OPT1H2JF0r6qjlWTNRIlinTHUfrNaPQAN++T717GmKDj6EvwEFEs7kf8e3jhzYRSEgisNLypI+SJPMVrWvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771501008; c=relaxed/simple;
	bh=EVbVcb4fKll/WYw5lWrKPCXeEGiCBW8KSvHzMnqw8Q4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W7iOnFfxB0QRFSR7WP9Tf6iAvLN70MoJM5eTvThGLkDUv1YNst9eG2/krKQrJSu45gH0ug8n2ver7TDsKHDMBsd+L2URR8ZH2G0IYDkHDHfJQw6HFbfiHD/D7K5Hsw4XG7158M9q/OIS4kTcDzR0MzrdarmEw08xafF8JSPMmnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HE9EXOX6; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbcEh2VGRJqA5X3l15PfQN6t/7jz2zpoaxJ6DBnpw70NoPzYnnP8H5FI7iQe0MfSPdGbbn3QiwA14SCt/sY4l1UjmZqLHLcAJCGZcdgvs7pWZYAU23DvoqZlkTsJA1vlT1aUAIQvOq7pcxM5gYFe4mWcVm9HfxoPQIuppMdDATXcmPai/02MBJ+1pKn4m5ErONskqSl3w2FaSNUvqggjqiTs0HyZx/cAJ+1h6pFhqXUHxrIENMHNtOwn5gIBYjzIhqH8QeH71JhfwQSHu5ifBq3CB/BofTxMKhpeYtE/LdaVVdXV5izHF6qdZ/kjQ5V4LjxHAMZlRj5PvWOqaIWdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVRSK5d9ERx8Eel2oE2pD8E+VnADDlSA2pMCvvSensU=;
 b=Kuic/g1+J6s89oSUASrW7/8+4LUi9+z6XmgL/C6bCKP+7p41hfqx2hzw4d33gt8V0LPijGkKAn8QM72zcfWJS654KT6OdIYNmN5GRZT0sl4KK3zVLVPvvQsqHARHNIRvbO+0nBEjXuZltWrRe+/+O8E0LfUO4R69isJT2NaLrpgsund1g/vzvw5l4sd48Gp+loryWb/VvOa8YCCGcRFBhzbdgc1H8Bg8GgtgWIkBaZ0De0XOGYzrwhL17758mUTUWA/WD6yA8mp6teyWivYGXQHI80x8B9iJ6VYuwNlUYPeHawVirK1Yi4Drpwkoari65Tsrmbcc2qGFtQq1E8q+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVRSK5d9ERx8Eel2oE2pD8E+VnADDlSA2pMCvvSensU=;
 b=HE9EXOX6HIfwT57RmybvC0Zk0kyAvSV0ik2XrvewPn8AlFZXFtcLegL+tPn6xU8QTCgG0EiXdiBvBWx+j+E6lWdWkf6QjQgFrTjb3sGuV6taOS+cgFFdDy+UPpabpmPHbj+PugIj9Xg69H39rZCK8HSDfhxO+up7vvCQUIcDODRoSsIt9H4pmRDmvQnRlWYfnK56BEpHDjUcjkjnm8MxNAzcFqeHq8LKPwEMz9q7rsXsLNCIX8bZ8cRbt3OvbwempaPU25t+clwoRD+PL/Xna6VWBy30JljylTTk+/xrQjXnTQeexTCPlNcR+bm2xSRltfcnIhDzTfmHf9fMRdI7Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9376.eurprd04.prod.outlook.com (2603:10a6:102:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 11:36:41 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 11:36:41 +0000
Message-ID: <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
Date: Thu, 19 Feb 2026 13:36:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260121021913.GA1704619-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::17) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: c66938dd-9b63-411e-94d9-08de6fab26b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0g1bHMvQ3ZIZTZlN2Z0cytlNERlS3lQUFh6RURVVkRXcWxnV2dxdWtCMGQy?=
 =?utf-8?B?eklqSHpkc2RqNjVvbmltVnFXQUE4eDF1bHhRSnVDNUJrejFIVTRRMS9iUUZm?=
 =?utf-8?B?VHV5alg2MFZNUmI4eWVaNVZFbk5ZVEFzVnI1M3dyQm81Ym5CZlhzRndKWGsw?=
 =?utf-8?B?M0tvZ2NZOFluK1FNcnlNa2QzVVJJVWt2RVJseXMxaTFuUFVNY3ZZUjZrdk9o?=
 =?utf-8?B?UFFmRGVodk1ZTVpVbTF6WTMzNnZZTEJKbnBCOFFCSFZOd2hGbk12Z1ZkNVZP?=
 =?utf-8?B?dlk3a3FNU0lscWYxYmZJOUFtd0NGM005T2ZIaTZSWG5RaW5ndDVva3g1RXhr?=
 =?utf-8?B?SjYyUXpFbHhiSWdBM3VjbkFPNktyUFRLSUNoUEg3VGh3U1NCRG8zYTJSejBR?=
 =?utf-8?B?L3BUdkdIQStXazBudkxnZHJXbEZxMXFTbk5PbjdYTHRnMFBOZ3ZORWFWNHVG?=
 =?utf-8?B?M2pKckV2Nk4zLzhoejRibHEzNTBhK1NpYVUyNnIvbEZML3phY2RJOHNoYnkr?=
 =?utf-8?B?ckdoc3Zjdm9BdWYzRXYrTGtuTm9zeG4zMVJITVhuODBSdGU0VEJOaHo4Titk?=
 =?utf-8?B?QUxPNnN0MXYvSXdLYnZCalN1ZmZRSThkcmwySnhVU1lWMmRFdnNXeHRYVERK?=
 =?utf-8?B?OGxWUCt0cWdRcTdtajdVeDFEOHk5bFhQRU9YckdBemdZeC9sQ3VIL216TU5O?=
 =?utf-8?B?Q2JlMGZaSUM0b3hpQ2hYaGcwMHk0empCNkRtVnY0eDJoVlZ1RHAwQkowLzdm?=
 =?utf-8?B?T3dKVnMrbTJYc3lFVU4vLzlzUXdLTmEvR0svV0tNYkVUZmhPd0hnaFR6d2pF?=
 =?utf-8?B?aXRCb3hsajVhZlErWDZLeVJ0SmRvenphNXhRQU9VcDIzN2M2bC9PY09HU1Yz?=
 =?utf-8?B?cklucG1UOWRVc1dqTm1JQjRCaDZENTBucC80WHpPRGNhaXZiaDk1c3VuNEpk?=
 =?utf-8?B?QzdQbGZvTk5GY0FtdmhqVHo1VkVwMk5LL3JjUjkvRDRMRDltaklGc3ZQZXZJ?=
 =?utf-8?B?WFc2aDVmTkdWQU1WclFqQ2RrWGVIbTlSTmN5aGRJN1g0VEdxWVEvV3ppdVBC?=
 =?utf-8?B?RVZYbCt3b0xJLzlDbmxNM0NVaytyVnhUMWdVcFFhVU50eFdHWUZrWXA1Rldr?=
 =?utf-8?B?UmR6UVdHTDg4UTB1d2FZTWg2dkxxQ0VzeWhKVkFFcWtmZzNHckpOOTNLU2Ju?=
 =?utf-8?B?QVJRWXlMd29lM3A5ZEhhQ2VkS0Zud1NRM1FrMlVKd2JDOUdMOFFlbE1kZWIy?=
 =?utf-8?B?TC9KRWxRZWFDQ0RENElUaklBdjVpeWxycENCWk92UEVUZGIzSHpmcUtjVk4x?=
 =?utf-8?B?VEs2bFo1WXVEODYzVVQrRFN3L3lTbXBWeXRrL1hDdzBsK0hEQjdNSVNSRXN5?=
 =?utf-8?B?VmRsaHk4QkZ3OEZHQVV4MWRkMzdVWVVKVWFBVXRFN2xONk1qWWl3NWlXY1du?=
 =?utf-8?B?ZjZpZkJVM1d1TmtIdzNkeFdibkVxZytGWWdheFZjY1hIWW54ZURpbEg5aER1?=
 =?utf-8?B?T2lpTXVuTXR3Rk1BOG5ZWjk2eko3MjViWGd5R3E2c0N4bGVVM2RJL3V3cGZ5?=
 =?utf-8?B?Y1cyNTZidiszemREaWk2QTBENEl5ZjhmeWRWbDRrTGdLa1luTGhSc1VCeFNa?=
 =?utf-8?B?MXB4Z1o5VGNSU0FqSmJRUGRoTVdCQUFGN09RWm5SSWVhNVUvMjZlckRJcVQz?=
 =?utf-8?B?N3hubGVLeU95RWhnZzN3MzBZdmdmYjZuQmxBQ0RscEZRbmYxak5pWWk4RFUx?=
 =?utf-8?B?NnZ2RnNHZzJGbUIzZlQydG1yOXQzbUpQSzRhNnFXR0doc2djQitrbUg2VU9U?=
 =?utf-8?B?M0pFWEFHQVdBaGdoR3NNeWFtZUY1OURlUGFJUVZjdERWUnBBYUUrNXNPbjR5?=
 =?utf-8?B?Qk1GWTVvSHBja0dZQlhSdllwVWc2dXV3VUpnOUF3UXlML25wcmoxYzNab29x?=
 =?utf-8?B?YXlmaktQS21SWTk0YW45dkpLcUZ1NnUzODZZMmJXV1A0dUJOQzhUT0g3YkZj?=
 =?utf-8?B?UzhIZjU1RmdwUUJQQ01JcEFnWkFFaTQ4ZE43eXZkQllNWXZpYWJyMVVTRmVO?=
 =?utf-8?B?akFFamtvdDYzN2FDOEw5U3ZxNUJEaVBpdGlWaGhsc3FMSGlQNWdkS0V6ZWlq?=
 =?utf-8?Q?3XAC9HHdGOFN5DQHLbXxvywtu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXh4SlBBV3hIRkRwRFg4OXBSb0Z4QVZXQ2lhdDBxb2ZhRXQrbm15enAzeWh6?=
 =?utf-8?B?YzdMMVVGbndSenA1TWZjQXpjZXowUkltRDNwV3ByMEFIYUphNXh5YUpnY2FZ?=
 =?utf-8?B?cUFJZ1FCc2hxNWFUbDk3QmgzTGpDOVA4YUxyeDF1U3crcXYra3dvVXFGbTFR?=
 =?utf-8?B?WmxjOGk5VjA2ZHNlS1h6dVBLU1ZqQ2NEZzVSd3E2VnByM2QzOElQNGZNbEtD?=
 =?utf-8?B?bDlEbWJ3cGdWRVl5UlJGeW9OUnhPNFNjays0UXFsckRnVHUyY2pNOVB4NkJi?=
 =?utf-8?B?NXN6VXhiMGxJZzJ4Sm04N3l1QmM2ZXMrQXM0aHFVTnBCZDl0ZUNtYi9tdTEv?=
 =?utf-8?B?bFNCdm5yOG5wc052VFc4N2tTN04xTnlTMkVlMElqZmtESHdnMUVmVkM5RWVS?=
 =?utf-8?B?aXZOMFZaMmRhU3NPenhHbmRFMlNQV2VkOEw5ZE9UN01SbldFRVdUQ0dMUW0v?=
 =?utf-8?B?bTdtZnlibVN0TStuWk1EUUdSNTVucUZ6VjVtQnNDdWtBQmk3Z3VXcmYyVzdJ?=
 =?utf-8?B?eTkvajd1OHJjaEhrSVlIclIvdlVCNE5LS2IvbjhNZ21EeVkwdWNxcWxKOWpQ?=
 =?utf-8?B?Smg3ajVxV05JNTNLOUdnVzFwTmZ3NGpIL1hLYXVwNytZa0ZKZzk4amhvQmdZ?=
 =?utf-8?B?emhRNnd6eGlyRk5wM1pVUmpYRytPelVHYjdwQ0V2UzZRT0R0a0RtaktXZU14?=
 =?utf-8?B?TVZzR3pXMFZDVzZocDUrdXdKbW1uTHlTd3lkMlpvcE5IYmU2Zm9udFl3cVUw?=
 =?utf-8?B?NHQrWGJ4UEswWFlGZTVISTk0VDRvYThBT1o0c0VRdklKQjQxZlJDaE16b2dt?=
 =?utf-8?B?enIvb2NkaE1NeTdGcHJmd1NsZnhoYk01bVZRN0ZHZ1d0cGtFVzhidEtwZkhP?=
 =?utf-8?B?MGNyVEpJaDU0amVuWTUyWG12UG9UNWVYQlN1YzA3bGpYWGZ5d3JJVFB6WWhj?=
 =?utf-8?B?TFZ0Y3d1U3dkM0VFSDRjYTFzWmk4YWg5NUk0RGgwcUFpRVF6Y2pqdmhxMnVs?=
 =?utf-8?B?S2lMWEphWmFKcUkrSzRrMjFXVE9nTkRQNE1hN2pMSERMbm1nMjNIWWRrWGp3?=
 =?utf-8?B?d1pISkw0R2xRbTlGMUZISXJTdkJRbG15aGd4aXNxNjdxUVJTeE1ocWhXQUlD?=
 =?utf-8?B?cGNadkFpTGpDdGErUUp0NlB1akFWRExzdkhBYkUvYjluZjEvNWppdDY3NUNG?=
 =?utf-8?B?NVEwTHBqL3BqYnBnRUx3YzlTVGFJWFF1ZUZBQ0xDVnZqak1iZ3NSZkFoR1lP?=
 =?utf-8?B?WHJsSk5wQVpYeHhJWWxpOTFwMHFnN3hXRGZIYUQwdkZLL1lsd01JbTEwVmhx?=
 =?utf-8?B?U1dWY2UvVi9SYzVxSkd4SEt2RXBOQklzVGpkdmJwMjFFS205T1R6L2ZFUzBv?=
 =?utf-8?B?akdNZS9PbDJ1cDZTZHVVN0ZpNVd3V1A0K1N2dG5saytORUJvdlVyUk1HWjdm?=
 =?utf-8?B?WG5WUis4UzlTd0d4dHdIcGNuQVgweHhkY2ozK3FibXdLUDM3UnFrWHpaQ1Bw?=
 =?utf-8?B?NWZPNTlZeEt1L1FiSndMaWpvOStrUzhtSU5wMUI5U0FTWE1qTDZkM3lYbERG?=
 =?utf-8?B?UkszcUwyVUZKL040aUZMQU9MbVRMcU9id0lZYW51cFBjNHNVVDJFS05sK1Z2?=
 =?utf-8?B?K1lkbVBHVWIwS08zcWJCQ0tyL0ZmT01uc3lPZDByRm9UUWczWEY4MnhwOU16?=
 =?utf-8?B?UTM3Rlp6dzNNQmRzaHBDaVlDUGthcFNHZjlWL3psaDZJN0xpZ2dKS28xZjEx?=
 =?utf-8?B?eGNuSTRPNlhNbHdyRFBZQ3RZMzVwZFMwTG9KcGFRVDRscmJzZ2gzaERoMGVa?=
 =?utf-8?B?aXFsM2VJWW1QVU9YTmp4bUpTVEFtM3YwSkpROVp1ekJTVk14SUM0RDE5aHNU?=
 =?utf-8?B?RWJGRndjUk92aTM1eUsxdmRqR1diZTc3Qk5NTVU0RzdRajVFR2lPVmNUV2l0?=
 =?utf-8?B?RWV0QjVxQi9qVDM5WWpzdm9JRDVYQ1dyb3R4UTdKSkc4SG8xNStNOFVVOXFX?=
 =?utf-8?B?SGk1MXJ6ZjJGaGRMa1BaMVAxUDJjdDJZOTJZS2pqb0ZieVNWd3FGQ2swbXZS?=
 =?utf-8?B?SkN6WVh2MG81UTNwcytvWks4NVZhOWdKNUo3T2d3ZG01aWhzajFIaXRYUDU0?=
 =?utf-8?B?QjZQUFZqUHNVUHJhMkpLUXZrZnBnVGJ1bHBnaDBqUFBQMVBheTZFQm9Cb0gx?=
 =?utf-8?B?NEsvNkF5N01RSmRPWDF0UzZELzIrak1IUVNONnFhamhIdGt3S3NtOWZaZlJa?=
 =?utf-8?B?WHNVd20vQTNWWkF3OFNHTHE5SjZEdHNzNzlCamxQbjY5cFJlZmg2dWpTZklX?=
 =?utf-8?B?NFJTaUx0bkZFcjYvSDNlVGphSFFkS1g2VnUraXFiNVBOTm03Q25MN1NKT3FS?=
 =?utf-8?Q?r/p9e/2G/mxZqG4eHTZ+zOR/L9pLPmzY5vwha?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66938dd-9b63-411e-94d9-08de6fab26b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 11:36:41.4666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDGb6B+Xcz/sOIlXOolk++BLDU/dsvDwPne7+mV7AmkLf5z1X3JPpVScdXtYWWd5YRZYfj2tbPJ5/VsSP+GBeoTh/7l5Hcjr3rMNZmJXhkDnzpeUV81gXI+q3owSMMQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31862-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email,oss.nxp.com:mid,2.159.138.16:email,4009c000:email]
X-Rspamd-Queue-Id: D2E4C15E523
X-Rspamd-Action: no action

Hello Rob,

On 1/21/2026 4:19 AM, Rob Herring wrote:
> On Tue, Jan 20, 2026 at 01:59:13PM +0200, Khristine Andreea Barbulescu wrote:
>> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>
>> Add the new dt-bindings for the NXP SIUL2 module which is a multi
>> function device. It can export information about the SoC, configure
>> the pinmux&pinconf for pins and it is also a GPIO controller with
>> interrupt capability.
>>
>> The existing SIUL2 pinctrl bindings becomes deprecated because it
>> do not correctly describe the hardware. The SIUL2 module also
>> offers GPIO control and exposes some registers which contain
>> information about the SoC. Adding drivers for these functionalities
>> would result in incorrect bindings with a lot of carved out regions
>> for registers.
>>
>> SIUL2 is a complex module that spans multiple register regions
>> and provides several functions: pinmux and pin configuration
>> through MSCR and IMCR registers, GPIO control through PGPDO
>> and PGPDI registers, interrupt configuration registers,
>> and SoC identification registers (MIDR).
>> These registers are grouped under two instances, SIUL2_0 and
>> SIUL2_1, and share the same functional context. The legacy
>> binding models SIUL2 as a standalone pinctrl node, which only
>> covers MSCR and IMCR.
>>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
>>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
>>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
>>  2 files changed, 167 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> 
> Doesn't look like this was tested...
> 
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>> new file mode 100644
>> index 000000000000..ec743cf5f73e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>> @@ -0,0 +1,165 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright 2024 NXP
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
>> +
>> +maintainers:
>> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> +
>> +description: |
>> +  SIUL2 is a hardware block which implements pinmuxing,
>> +  pinconf, GPIOs (some with interrupt capability) and
>> +  registers which contain information about the SoC.
>> +  There are generally two SIUL2 modules whose functionality
>> +  is grouped together. For example interrupt configuration
>> +  registers are part of SIUL2_1 even though interrupts are
>> +  also available for SIUL2_0 pins.
>> +
>> +  The following register types are exported by SIUL2:
>> +    - MIDR (MCU ID Register) - information related to the SoC
>> +    - interrupt configuration registers
>> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
>> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
>> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
>> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
>> +
>> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
>> +  16bit wide.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: nxp,s32g2-siul2
>> +      - items:
>> +          - enum:
>> +              - nxp,s32g3-siul2
>> +          - const: nxp,s32g2-siul2
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges:
>> +    description: Address translation ranges for child nodes.
>> +
>> +
>> +patternProperties:
>> +  "^siul2_[0-1]$":
> 
> Don't use '_'.
Will be fixed.
> 
>> +    type: object
>> +    description: SIUL2 hardware instances represented as syscon.
>> +    properties:
>> +      compatible:
>> +        const: syscon
> 
> 'syscon' alone is not allowed.

Will add a SoC specific compatible too.

> 
>> +      reg:
>> +        maxItems: 1
> 
> You have 'reg' so the node name should have unit-address.
> 
> However, there's not any real DT resources in this child node, so you 
> should just drop it.
> 

For context, SIUL2 exposes a set of platform‑capability and SoC identification registers that are split across the two discontiguous ranges: SIUL2-0 and SIUL2-1. These registers are the source of SoC information (e.g. identification and capability flags) that other subsystems are expected to consume (e.g. PCI Express). Because those fields are physically divided between the two SIUL2 ranges, consumers need reliable access to both ranges to correctly discover and configure the platform.

Hence, my proposal is to keep the two 'syscon' child nodes.

>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +  "-hog(-[0-9]+)?$":
>> +    required:
>> +      - gpio-hog
>> +
>> +  "-pins$":
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      "-grp[0-9]$":
>> +        type: object
>> +        allOf:
>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
>> +        description:
>> +          Pinctrl node's client devices specify pin muxes using subnodes,
>> +          which in turn use the standard properties below.
>> +
>> +        properties:
>> +          pinmux:
>> +            description: |
>> +              An integer array for representing pinmux configurations of
>> +              a device. Each integer consists of a PIN_ID and a 4-bit
>> +              selected signal source(SSS) as IOMUX setting, which is
>> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
>> +
>> +          slew-rate:
>> +            description: Supported slew rate based on Fmax values (MHz)
>> +            enum: [83, 133, 150, 166, 208]
>> +        required:
>> +          - pinmux
>> +
>> +        unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - gpio-controller
>> +  - "#gpio-cells"
>> +  - gpio-ranges
>> +  - interrupts
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pinctrl@4009c000 {
>> +      compatible = "nxp,s32g2-siul2";
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      siul2_0: siul2_0@4009c000 {
>> +        compatible = "syscon";
>> +        reg = <0x0 0x4009c000 0x0 0x179c>;
>> +      };
>> +
>> +      siul2_1: siul2_1@44010000 {
>> +        compatible = "syscon";
>> +        reg = <0x0 0x44010000 0x0 0x17b0>;
>> +      };
>> +
>> +      jtag-pins {
>> +        jtag-grp0 {
>> +          pinmux = <0x0>;
>> +          input-enable;
>> +          bias-pull-up;
>> +          slew-rate = <166>;
>> +        };
>> +      };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> index a24286e4def6..332397a21394 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> @@ -11,6 +11,8 @@ maintainers:
>>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>>    - Chester Lin <chester62515@gmail.com>
>>  
>> +deprecated: true
>> +
> 
> I don't really see why you can't just extend this binding with GPIO and 
> interrupt provider properties.

The existing SIUL2 pinctrl binding only describes the MSCR/IMCR registers and treats SIUL2 as a standalone pinctrl block. This is incomplete and does not correctly represent the SIUL2 hardware, which also provides GPIO control, interrupt configuration, and MIDR identification registers across two register windows. Extending the old binding would require incompatible ABI changes and would result in carved-out subregions, which is discouraged.

> 
> Rob


