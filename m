Return-Path: <linux-gpio+bounces-32035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPFGDJE/nGljCQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 12:52:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2C175B88
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 12:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD37A30584BA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE95B364040;
	Mon, 23 Feb 2026 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v5aawHpj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20623E33D;
	Mon, 23 Feb 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847521; cv=fail; b=JY4jAcCVPj/KRrYdmaE3CPhXhuh+gupdQGHo/orvuMhqOOkRd2lvidHm2/9RX8YqU4K1fBiGeuhLZvIIPeheajBYnfo+/Vhd15xCUgCVATK3vk/pUzH+eOa1tOYQVklHjdcKnAnrKA8KS244Pkv8zPpmlQuQRmX+qlr2KJHEfAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847521; c=relaxed/simple;
	bh=rwiLo6c6Oov+f0Xo3tNe3QQvjNFwTDJMzyrV6YKTo10=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N/N3X4nnuNojtVhj4A1ACfOcvYcDxIe4Duh27VjVdYHAY4J4GbVdBZC/4I2xjuIZbMZnRi0+E+kWuecHz0BlPeQsr4Hw3MFRzKBnZvPPN8iw5BXjwtgu4t5OhywQY/uwiAFlT9eygkW/h50XLEEHy8Tt/cAzXLA/ZLC5nYjkjzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v5aawHpj; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzX0yiOJIBvhFvHySFmQVeyZtv8h6RHKFoPBA2ooyRle4jnnPyTEKpN9QGC4WMPAGWIFpo1RIxAxGOqtDlFVo4H3UGbbgu6UKGaQodfGBelHbEqQLHxbKzHBN5fOdZgrnFGuGETOxMcoeRoT1ROXMMEzFaJVx6hevqvDqgHrnggENneBwNP+4CQPz2mQKLLfN02q6jVtcp4DYnSeVOxDSgcWyykFm7R83PcIAZ2dAeo++vHTYPpsVTnuP3jtrck8Y5xfph73AsxYEFleU4OM7AFyNDeM6PmWoShYwrak/xWehXUYRa+43GIW4rH+MNPH0cn/LtWZyLWxJZ+yNg76Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+msyEEewmHFvgipVZ69CP/uWEpxdwbAJbzOhCRC/NI=;
 b=DKC2+7PsqUuZFR9JHPgyw5lC9uuHs9cRGlxDuQovJjWIjBYswDJVpcggMLUMTpl9M+4Sruv9m/MnQSJC4h/AavsgvnsFZtBXDEjzxfQh2ucNpDNB5/Y/ZSAMXn0m5Yc3iG3j751TNdgYuE6+DPL/7nR38LxYexpRy1oQNvE+lYxof6eUyguC+G3533rwlVZrBds8OtyWE4z54CxASjCXqUkN6gti0SnkzhJhAgmHeMxcmD6x3m35W0n7i4rg2fc+pqz2mWjs9CdJOh5QF/wIgjiyFY+m5zJkhmPNxUWQGYegxt6tcZpZ5MoZfRDAwv5ZMuLYUgNs/TpKNLYMPUQuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+msyEEewmHFvgipVZ69CP/uWEpxdwbAJbzOhCRC/NI=;
 b=v5aawHpj3GRz0VpwI3rWCbO/uwr6I9KCKoBg6mHOhuVp4IMMgAGkRqr3b5yS6qxdvrNzgvd/TqgDSlyTniOVjPnf0snk2I+t+H+Nqf32ncNP0rbQOwJACy28gSH5y5FU5UYMpcc3gdJMMtFuOk6rb2CnRcgeHTlsULKuWcYkKVHoT2k06HZtuad99zy+WVUEtzNHQ9bCpLW2MGUbPv/c1BCsyGQY7HIRDVuDTxR//bwuJGoUcuho4AVynTibQbx+B6Tv8STafFKHfpnUCO4BttBD8pfwI5MB/h73NxRoW3qnG2pQULunATMEgygVyhsQepHlDUHgkDL+sBzPXTjcWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AMBPR04MB11742.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:51:56 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:51:54 +0000
Message-ID: <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
Date: Mon, 23 Feb 2026 13:51:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::16) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AMBPR04MB11742:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c33daad-3665-47d6-afab-08de72d1f07e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDhOeThVazFwcnBhRW9wZ2hlQm5jMWwrd1VpWUpHOWZ3bEMvMUtvTFh4anNL?=
 =?utf-8?B?T2gzVE1GYnlRZ0xRRURmdjEwYjhyOXF0L2R1UTExT2FFU0Z2UFlWSVNJWHYr?=
 =?utf-8?B?dkhuVlJaQTg4OUlieHlPazkxajNMQ3JiRDFuRGk5blUrR0ZIYnRBUklQaEND?=
 =?utf-8?B?TzlvUHlzdDZFRHlTNmd0OGdBY2VrdmlCVnJIeGVhOElDOHp1dldsY2YzcjdM?=
 =?utf-8?B?a1hETHRSczNuS2llODhWTldMM2dEdU95a3ZmbFFoQUdaWmkxTGwxUFFhcnZY?=
 =?utf-8?B?NTJ3d0NubnFZdVdMdStUMTR5ZzFqc1Y3b2VtbGxRSExFaEordUpEd1RiZHdo?=
 =?utf-8?B?ckhvUjdRRlVwT2I5QzRwYmRnQTNncW56aHk3QUtkbmR0SmtqM2pZQlJiVHRE?=
 =?utf-8?B?OXZ5bG80Y0pBMlhQeEhrZVE1eHRnMkNGUkVzSEpOdTJ1MSt0Z0NsM3lybnJv?=
 =?utf-8?B?Q1MwQ0Q2bUpDcnUxYk1GZ1lBUEJHVHpvNmpLSE5Fc29oWlFTR1ZLc3c4S3p6?=
 =?utf-8?B?VjVRTVJMUFdNS3dUcjBpb0wwV29idlBGbW1laDRyT2pqTTZDK3cwbjZYWkVF?=
 =?utf-8?B?V24zMkxUUUc1Mmt0VitRdmJ1YjMwd1JEYmNneitlaTYrd2NiaGUra0lDcWpt?=
 =?utf-8?B?b0xtaDlwQ09GUzd3QmNROXBMbHdtQjg4WnpLOUJnZnBGMU9paWVYU1dXUkRa?=
 =?utf-8?B?QXBvV1FQQkoyV0FYSzB0QTlYaFRTdE56elFDRFRPbjZsWmh3OTNOdDhCNitl?=
 =?utf-8?B?K2c0U0YrVWwzOFFrU0NPMmc3dkJVaWlmcG5YQ1BhbW1iZEFjVnh3aXNyZTFH?=
 =?utf-8?B?RDhXRlFwNjdpdkJiNjdiYitBQnhOMEwwOWJmV3VvbDBaWjRpZjlKZzdOeXZt?=
 =?utf-8?B?RFpEUEtwckFRaFpMVWhkNk40WGRxc3NTV0pMQ0pTb0JpY3ZVL2N5NE1mTkJP?=
 =?utf-8?B?UlNDMTBUWk8zbklHZmxzVHBxaHlTNldMa1l3YVM2ZnlxZUsrN1ZMa3ZKbHcr?=
 =?utf-8?B?aE5DaHF0aEdJMGNJMHNsRCt1V2tzaEV4N05kVXoxcStKNTVSYkYvTkVkNzBz?=
 =?utf-8?B?STcxbnk1bDNZcGRyVGdvQTBCNlM1NEV2Q3QwMEE0K2JsQW1kNWF5ekYxdGQ2?=
 =?utf-8?B?bUxHOGNjdUZzQUdjeUVxc0RUeUMvWDFySjFGVzZpQzB0cmx4NW9sUXUrREtS?=
 =?utf-8?B?dDVuaE5DQzZ2NUg5ODMrTm5Dek5hS0U1VEIvaWJMNUlRQUNSOEx4QnVjcWhN?=
 =?utf-8?B?RE1mbm04eEI1MElxeFJoN0RTVHhvK0h5L1lMNXBWQzgybHlKdHZDZm55a0lo?=
 =?utf-8?B?STBNdGVkTmRtVnliV1ZiUU45eVBYOE0xai8wdFZtOW4zMktSY1orcFk3ZE53?=
 =?utf-8?B?d2pCN1h6K3V0cFEwdE55bmVxSlBHK01HWVZWSENqclVvcDVXMk9TM2VNMVpk?=
 =?utf-8?B?Ump0OGNWZXZGZG9DVTBJb2MxOTlvZ0MyV3J0K1ovNmtRcDkwb2NGcFdrWGtL?=
 =?utf-8?B?RW45cVVnQitDanljcm9PWjV6WW12SWpiamtSU0I4MGN0OUtpdXZpWkp1MDlq?=
 =?utf-8?B?dDdrVE5rSmY0a3NaQVpjYzllUHVmc1pLYXhENXFRVXZibjFLVlhLTTNMUTFE?=
 =?utf-8?B?NW1yN000R0g3ZVNXQjVLTFEraHpjcHdWZHVwS2FMU0lvaHRveHcrNjIycHlQ?=
 =?utf-8?B?OW1TZk13OVVhRjBnRExPSUJ0MjJ6YWxxbitwR29XZEJka1V0OHAzOUtPZ21O?=
 =?utf-8?B?dUZrUmp1cWhjTHNRVi8xd0xsTkx3SUI5UTI4MEEzbUlodlhNUGJ2M3dseFF6?=
 =?utf-8?B?eGhTMWZNZG94aHRFemFxSVlmYVR4NjI4RlMxbXUvOHErcjhodU80OHNIQ0w2?=
 =?utf-8?B?WG9BRTRhOU83dlZjWkljSlN1STdtaktVNmk4RzBmVHNyU09McjFzdHBJUGJZ?=
 =?utf-8?B?eWtUM2tmVFFzQ29Zc1hYMEc3TFdZV3lMczN6RVNlYlFabERTWHY0QVhDaDNz?=
 =?utf-8?B?djdXblUyYlRBaklpRUo4UTB3bng3Rk1BS2grZW1sOXRGQkhzV0ljeit5ZTkr?=
 =?utf-8?Q?ETnq5j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My9IcTFDS1U4UEZIaTJvQnFJdTBGMEpFWkpTbXF4Unhnb1hPYUxBTXdMMmFq?=
 =?utf-8?B?eHIyTnJUUVp1ME5aR3FiS1M5TVV6Z0JHdkNtc1JWYmpLWGJlRXBwanR2R0ky?=
 =?utf-8?B?SUZoV0JkVjlBM2xSNmE3aEhmVVhZOG5pbDVDMlZiVSsrQzFXbDVZZ0UyS3pF?=
 =?utf-8?B?dlpZeEgwandYZVhUYWVVSHZ0KzY1ekZId2J0aGhacy9QSllxTEUyZ3ZRRUkz?=
 =?utf-8?B?VFcxYXpoUHNxRmVFUVVRRGNMSmhFYXpIQXBMemZja2hrK2RqWGFieCtDWWVt?=
 =?utf-8?B?VVhoYnh6UmhlK3VrQjlHeVk0bno5T0MwT2dQbHBnSmIzbnUxdnNWTm9vVmRZ?=
 =?utf-8?B?T25hTWRkc3BFT1FHZS9hQzM2bzdlMXZlN0hwSHpEbGZ6T0dOU2I0V1FRTzM1?=
 =?utf-8?B?NjlsSkp0dVJ3ckE4L0tqV21ES3Fab1VXN1Q4cjlsbm4rZ1djYVVVb2dyd0tF?=
 =?utf-8?B?WVhPd2ZGQmVHMkhFelJTVGlJUXlGN2ZibGZ6ZUJiVkoyeENacWUzdWFDSnA1?=
 =?utf-8?B?ZWFGTzV0M05rRVlRQ0pHSm9OVzVud2tGUVJVK3E4alJJMUhkL09RTEk2YUFB?=
 =?utf-8?B?dFBBOG05WEU4SWpZZEwxNVgxdmJVRi9NNFdtZllSTVFtMEpFRktZMVE0enNR?=
 =?utf-8?B?cHF0U0NwSkEwZURaK0o0d2ZiNmtEc2p0STVwb1BpYmU1WjNNQURXbU8yTVUv?=
 =?utf-8?B?SHBiQk45V3pkNCtVNjJKYkFzTVdrYjhqd0JLaDZEYllyTmduN0Z4M2RETWd1?=
 =?utf-8?B?WUh1K1I3NnNpbmRqRWFDK09LRUtZak5oOXFCbDJkYUFYQVJMTzB1OVQ0MFRF?=
 =?utf-8?B?aFdwak9BbzJNZ3pRR2JyUW5GM3RCZ2xPaXBFUDRMQVJmWEFGZlNWL3B1MzRC?=
 =?utf-8?B?bm5lMURubGcrbW1TcGdlT1oxV2FCM2RidkZ2dE5hRHlMK3RIZ3U0anBIdlpz?=
 =?utf-8?B?c1FVb1JVdmFYTWxybjJzMzMzN1NOcGhrUng5MW55aHhMYVhabjQ5aFJaWW11?=
 =?utf-8?B?TzBhNk5FMkZybjdsY2tCbEx2cVNlejBKY0hSS2ovVHpSOTV1MkVNVXc1MEIr?=
 =?utf-8?B?NmhLK01LaER0WWFXR0tLV2g0Q01RVUxsYTdYcXZKL2NsakNKVzJqODdhVnJm?=
 =?utf-8?B?Zm53UDRYTWNuK01KWXpvMVBhaVgxRnc2TlR6dkUwd1haNkxhSk9uQUhsdHNX?=
 =?utf-8?B?REdnVVhWVjU0OVQwbVBLZGdVVVAvYXhsZzdEM0JKdTBOS0J4SlhRNFNrMnpo?=
 =?utf-8?B?THpxSHQzVnBLL1Q0V3FUajB2ZGMrK3QySHVrZE50TTVtSjFzOVdDZWZHUUZB?=
 =?utf-8?B?YVUwNk8wdEFLU2kxMXlTcmM3NEtESEY3QjB4dUdGQjlPd1ZnSlZ5ZzJseW80?=
 =?utf-8?B?UGowMnZIRDc3dVlHUURHcTUzelBkblhGd1Z6alV4Z3V6UmJzSC9GVk80UmhS?=
 =?utf-8?B?Tk92VFQxYzhtRTFBeThnMDI0Z0l1ZFBpMjJJMkNYWUhuQU13MHptdThmSUpS?=
 =?utf-8?B?RE5kQSsrY3dSbHF5Wm9QaFRRZVFIRUNvWlQ1cEVBUXFkSnN3RGNxTFFMZnFN?=
 =?utf-8?B?RjJqdFRwdE5vVWxwQjRVNkRZeHhrUldHU2VQNjU0Z2tyRkFib0JSK3AyVEtP?=
 =?utf-8?B?c0xSWENYbG1uRDBZOXR0dll6TGovdXlsK0J4Vm1MaTFWN0RRNUQvSFdQNllo?=
 =?utf-8?B?ZTlMbTRkTmczQlZiMlUyRDRzQzRzM08yTWRsR0FHd2c0U20yY2x4YnN6aGs1?=
 =?utf-8?B?TDNSSEZKd2swY0JsdHVLNklaOHY5aXpBLzlla21GL1A0dnFLdkFXOTFzZFZQ?=
 =?utf-8?B?TEp3bWhGY3R1T0ZXeTk4RkVjZWJjUXR2NVpaSHFwM2NFcjJ1OXkzWDBYMHVn?=
 =?utf-8?B?N1FrSzU0anBSVzIya3lGSHc4SHFMTythdHZBamtKc1E4bUZYVUplYnIyY3Nz?=
 =?utf-8?B?UE5iaWQ2VlpOVXZpeG1iZzc1K3VTSnlaTlF6N25qM3hwNDkwUHdtSm1MK05i?=
 =?utf-8?B?Z2txdjRqMEZwamhyZmIrb0E0ZFRuMld5Wk1SQ3phY1JOd01yWGM4czFWQjZB?=
 =?utf-8?B?UmlYWjV3eE5ldzNEN0J1a3BFbEVsV0ZudkVvbXpNdGhWdHUyUU01cktMZ0xw?=
 =?utf-8?B?SkJYd0ZCS1ZVdnVlbFlic2s5TVZiR2IwSHBXTTRUT0h2YXNJMVJLcmt5VjR6?=
 =?utf-8?B?TjRvTG0ySWhWZ1p4enZKOVdOa2tWVzJwb0h2UTRtK2JrM0Z3VTR0ZVhVQ29V?=
 =?utf-8?B?YUQvUXRnWDNkeVo4L2luVjdRdW9IcldDNDVRcktDNmZXV0kyN29yWnVvaVBI?=
 =?utf-8?B?Y0g5M0FucWtvdnVQSWxDaXFYUnplc04vWUJMUWJuQzV3QUhZWE80MEI3TkxP?=
 =?utf-8?Q?0OpUPt9LOTBaEI9VGBjArP8rZmXsPn3o9mvdF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c33daad-3665-47d6-afab-08de72d1f07e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:51:54.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGAqv2kC0+GcJ/yKLytOJ5ygeM1eTxsIMPPGi/E0FJNhCN/dM6yAdW3f7zU/oGNTdV7v1RhEt7lpm29x30LCYF1MfeJlfBNHbIhd6aa8E/ltse6xHGjiuVe3pJ/BbAbf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11742
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32035-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,4009c000:email,2.159.138.16:email,2.104.116.128:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6D2C175B88
X-Rspamd-Action: no action

On 2/20/2026 4:41 PM, Krzysztof Kozlowski wrote:
> On 20/02/2026 15:36, Khristine Andreea Barbulescu wrote:
>> Hello Krzysztof,
>>
>> On 2/20/2026 12:16 PM, Krzysztof Kozlowski wrote:
>>> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On 19/02/2026 12:36, Khristine Andreea Barbulescu wrote:
>>>>>
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>
>>>>> You have 'reg' so the node name should have unit-address.
>>>>>
>>>>> However, there's not any real DT resources in this child node, so you
>>>>> should just drop it.
>>>>>
>>>>
>>>> For context, SIUL2 exposes a set of platform‑capability and SoC identification registers that are split across the two discontiguous ranges: SIUL2-0 and SIUL2-1. These registers are the source of SoC information (e.g. identification and capability flags) that other subsystems are expected to consume (e.g. PCI Express). Because those fields are physically divided between the two SIUL2 ranges, consumers need reliable access to both ranges to correctly discover and configure the platform.
>>>>
>>>> Hence, my proposal is to keep the two 'syscon' child nodes.
>>>
>>> Please wrap your replies correctly, so this will be easily parseable.
>>>
>>> I do not understand the reasoning. If you have two register ranges, you
>>> have two <reg> entries and having a child node has nothing to do with it.
>>>
>>
>> I’ve reorganized the SIUL2 node with two syscon subnodes for the two
>> register regions used to read system info, and a separate
>> pinctrl/GPIO child (as discussed in the v8 06/10 thread [0]). The parent
>> SIUL2 node now carries the bus addressing and ranges:
> 
> That's not the answer to the comment. Read again:
> 
> 1. Reviewer: No resources, so no separate node.
> 2. Your answer: some soc capability and two address spaces
> 3. Reviewer: Does not matter, address spaces can go again to original place
> 4. Irrelevant reply.
> 
> So again, read the first comment - do you have dedicated resources in
> children?
> 
>>  
>>     siul2: siul2@4009c000 {
>>         compatible = "nxp,s32g3-siul2", "nxp,s32g2-siul2";
>>         #address-cells = <1>;
>>         #size-cells = <1>;
>>         ranges = <0x4009c000 0x4009c000 0x179c>,
>> 		 <0x44010000 0x44010000 0x17b0>;
>>  
>>         siul20: siul20@4009c000 {
>>             compatible = "nxp,s32g-siul2-syscfg", "syscon";
>>             reg = <0x4009c000 0x179c>;
> 
> 0x179c is odd size. Looks fake.
> 
> 
>>         };
>>  
>>         siul21: siul21@44010000 {
>>             compatible = "nxp,s32g-siul2-syscfg", "syscon";
> 
> And two same devices with same compatible proof it.
> 
> Best regards,
> Krzysztof

We don’t have dedicated resources for children. In particular,
there are no resources allocated specifically for nodes like
"nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
driver and other drivers that read SoC‑specific information from
those shared registers.
 
My alternative is to keep two separate syscon providers for the
SIUL2-0 and SIUL2-1 and have consumers (pinctrl/gpio , PCIe, etc.)
reference them via phandles:

    siul20: syscon@4009c000 {
        compatible = "nxp,s32g-siul20-syscfg", "syscon";
        reg = <0x4009c000 0x2000>;
    };
 
    siul21: syscon@44010000 {
        compatible = "nxp,s32g-siul21-syscfg", "syscon";
        reg = <0x44010000 0x2000>;
    };
 
    pinctrl: pinctrl {
        compatible = "nxp,s32g-siul2-pinctrl";
        gpio-controller;
        #gpio-cells = <2>;
        gpio-ranges = <&pinctrl 0 0 102>, <&pinctrl 112 112 79>;
        interrupt-controller;
        #interrupt-cells = <2>;
        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
        syscon = <&siul20>, <&siul21>;
 
        jtag_pins: jtag-pins {
            jtag-grp0 {
                pinmux = <0x0>;
                input-enable;
                bias-pull-up;
                slew-rate = <166>;
            };
        };
    };
 
    pcie@40400000 {
        reg = <...>;
        /* PCIe Dev ID */
        syscon = <&siul20>;
    };
 
I’ve seen similar approaches upstream [0].
Would this be acceptable (even if not ideal),
or do you prefer a different layout?

Best regards,
Khristine
 
[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml#n182



