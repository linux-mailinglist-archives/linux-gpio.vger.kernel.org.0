Return-Path: <linux-gpio+bounces-12931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F51A9C6CBF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52BC7B28E58
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCED1FCF49;
	Wed, 13 Nov 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZvHQ81fd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05751FB88B;
	Wed, 13 Nov 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492773; cv=fail; b=lB4Eu3EZckubrUMBTBzRPnvDHMd/AFESCl6yqOpwkL79KOQUXUHg6OkFLhFSlNJIkfalhzHrv7YhIrw8/FFp0kr31TvwJ3ehPbLdByrgJfxDixwW/jndNRRkeNCmu35MHJr0MGNeFwhA6Ga5cMjYzGPP+Yni/akGbSsd+zadIYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492773; c=relaxed/simple;
	bh=Iq1DHLajzm/1aUJCcgGzQoUkVF1yC/LNegicjqZQ1Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPwGo65MKGmSHl3z5QsntXKxUrHIPP0hqTTPcCozlwRYcV/aGBJcf9QgskriWBAgQY+twgALKVbq/UUlZP9x64QAQ+AjT2foQhLFgcV6SMf+TyHXJer+nCLXbrLPJCvSK0ExhuhFInvyGnUj7p9xCEc2tvxfkmISO7Ze6EMgAQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZvHQ81fd; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Devs/9wZtRbazkamS1f3iI5L1XeJQxx7P3uElr1n5kKUlyrG5k6LDc9e3QqPTYtaqpidubcgYtIrj1sDdgDlDKFXBONLBTonXyymMKBgsP/gqx+DeoNMWyKfpeCM8+5XdNJXcfFnDclArNiphQkhLdjUf9rgZK6BMbv8Siot8qhdqh460h/oFWjMdyumUM2R/waN58MPbDz3vk8Vv1F45gLUqqd6DggbStqW43QCKBenyyDUuTkQGDHbD/0a3NwL51yptSqHPGZFvetMSwUqJVJN6W5tzmJ022sbkMda86m8QsbjubA8dKzlgev9LA6Qu3+Tc4hL5y2hCq4w8HEmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhuoVUdlxKCIAUVq6j+EX8ECSiAZSLCgHoHWNam5lQo=;
 b=gNIBODEumuexhO0Q7JPfxpoosGKdSkvyOeq473Ucxh5rS/5TqrOHZn0PNlmB45DyfvmvSfS56X0nrpnbnj79rtS8lNIoasuvlSAcQw++BLeUaS+aJ9AAweWPo9/4U9JO7d6uvMNiA8ieWSpiYRH0N6Y2Z7qQKnJEXEkc7XNyn9nexoBY4L3jGtI5Lkfei7pzHBDcDSU8YobvMAzLFdAS9+qvHLYAVy8XJJ2zkV+mtNsdd7Yb2Hc5zKWHipLRbb0GBo73s8A+TeeWjX6aqeqWWLOksKiIoNIWYncjCj4xgGVspphC/IdW0KMVVnmW2JFIK+BBrB3OF8jABnVwgyYfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhuoVUdlxKCIAUVq6j+EX8ECSiAZSLCgHoHWNam5lQo=;
 b=ZvHQ81fdeGoMj2jgG1A/upAMAmnG1OrLgv/G1yn8/EJpzmY9Q/0gS8AUdkM07OO1PAs6VAqU+bWONIATZV3kOx8YP+Sg2LIVFzhus94benqicqv7rUNPSfrEmmGGe8kOrDHBwEELiVP2tTXKvTCB+3hmaK5BXKl1eBvVbjkYzmbicg7emy7IxSmNnvVgvWX3WyIDd1mltF8T91LsqBet7e6geLg49u2Bj/3VyImvPqKh2LBBQ4PzDRWFjkkr/Psx1kpz96zQeA+hdVBkK3sS75EJtK2oSXwDJamSlZ+uP6yROAZtlIDRsKkKa8U+ksyWpU2mjxhCM1ONvVm5RgRbwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 10:12:45 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:45 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 7/7] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
Date: Wed, 13 Nov 2024 12:10:59 +0200
Message-ID: <20241113101124.1279648-8-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d6c7aa-8b90-4792-2ef5-08dd03cbb7a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVM2aVEzM3pvcDd4Q0ZBMXRhREV1Qjc5aWZHR0orWlpPbTU3WUpoZ0R2NElo?=
 =?utf-8?B?bzhNK3V1Z0FQM2E2ZHAvYzFYMmZvK3F4Q0FISy9Pd3FJUFRqYlJlLzJJYzMv?=
 =?utf-8?B?b25iMGRhL091QTQ0SWYvNWNnTmtheFZGVzlzRlhFcUR3TVNDdGRYNVJ4MWtq?=
 =?utf-8?B?aUxIWjgwZlFpV3h5L1ltWGR2bHh2NHB1Mkc1aWxoVjhTRFVVcG0rRGhDZlZy?=
 =?utf-8?B?K1g4eUo2NWJIQmRYTUlEaWNtZUgxRXNRb0JSOWNwcWVxYkQ3VncrWTRJTXFy?=
 =?utf-8?B?OW1ZbWJ0N0o5NkRaSWtoeVJCK3kyR3NzdmNpdW9IWE5xZ0dtZGFuOWJlalNH?=
 =?utf-8?B?ajhKdS9ybGZRSTEva0pBVHFzcjRuRSttTWNKRkFGZGROZkpKVGRKSVJNcTI1?=
 =?utf-8?B?WjFVeGRCcE5xZFZSMW96MS8rdTdidXdSUGlVazJIc3ZWRGlXenFiZGZhZzNs?=
 =?utf-8?B?bTVpejczZ3h3TVlyNHZld2J6UDZEbFBrbUhHQ2JCSUs4THZyaUpxNWRGdDBR?=
 =?utf-8?B?RzRyZWtsS3ZFNkJ6ekhTOFc1NUtiSUJJRUwwaUtvMllrV1RTNUwvVkV3V25S?=
 =?utf-8?B?TTc4ZEljK2xkcVhvZW1OakE4TXhRZ2RTT1Z4WFBxYnBtRmhXWjZJbElya1Rk?=
 =?utf-8?B?N2xmcXZ3R2hvN250TEI0OFJNNEFoRTRQQzZNYmM3bHJqb2JKQWp3T29ZaUQ3?=
 =?utf-8?B?QkNyZDcwaEZjOCtlUG54bW8xNmQveVRKYWp3Qm1NNHg4UW9RRndXeU9lcUw4?=
 =?utf-8?B?QzQ2aXNEZXA4aEJ2enFqUS96bVl1aTBVd1R0UnU2TEN6MHJQb1FOZ1VIZHZq?=
 =?utf-8?B?MDRaMUM1MXVNb1hkN2Q2Y2NLYlVXdXZBSVVlTDEzSEEzTk41ME9vQTBWajND?=
 =?utf-8?B?cXphQm51Qzk4M2VGU2VtMmp4T3ZTVklEVUxCcVIzNGNuTDJ2ZlNvLzBwd0Ju?=
 =?utf-8?B?ci9xaVVWcXdlY25lU1FnNWZiMzVpanBNNU5QMkVRUDFxWE4rL1NsTUdMMi84?=
 =?utf-8?B?Z2YwSmI4MG9oZEhpL0RkeU1aQXg0QXNaY0ozT2loVWlodk8rSXZYQ3N1L0Vs?=
 =?utf-8?B?NWF4TUxzUm00cVJjQ3FPZGRlVUlHMVE1RHFoQ28xRTllaW9Vd2lpNmtCdXdL?=
 =?utf-8?B?QmlKWUtQOU9XcE9FNlNJajNNTUhoQ2VudS92TmN3ZjNTZ0l2V1IyU25ybnlQ?=
 =?utf-8?B?ekRSOTJLUndXQzhyejJhSnp3dkRsa1BNM0s1Q2JXaE1wSnRhcTlBb1QwNi84?=
 =?utf-8?B?T3RIMFBWbDFPSWFDeDgxQmJPNjVzaEtTbzI1TXc0RkluZUlzNXZMWVA5cHdR?=
 =?utf-8?B?S2FiOFYzd1Q0ZW9BNTVMSjd1MEdDL0NRK1JNTG5jUElWUjQvOENSOXdEbkJP?=
 =?utf-8?B?Tm8vNlFxZGtQdGdnamN2Z3AwdHJ5Nm9Sb05Ha0phdlFZamx4YXFpS1V2dWxN?=
 =?utf-8?B?SVJGWHlNeGYramFhMVlqQlVTOUNmMEdCNWZCT1l4eGQzZkpEYWpKQ1BYWVJ4?=
 =?utf-8?B?ZXhmVmNwbzBZMVNaN1dQWnBSWGZPdXl2NDBydzN0eFRrMWpqeGd4Y2NtT0E2?=
 =?utf-8?B?SWw0eDR1NlJLeFNMWlR3WWd2Yk5nbXIxRGdPTnJyQ1dmTEZEMmZtZU52V0Ru?=
 =?utf-8?B?ZStRelBEVmFPTFY5MngxMndSbllrT2lyODgzcDBLM3pjQU9LYzVDMExTVGlT?=
 =?utf-8?B?UTNDZkVXMWFXUC9UU1dRcGFKWWE3YWJCb1lmT2FzeVJTY28wL3dKV0s4SGgy?=
 =?utf-8?B?S3BiY05qOWhWL3lUSE1xaVQxWFBHdUFhTExMZjdaMFRvSzIxem5KTzlPalBM?=
 =?utf-8?B?b1U2Qmo0TGRKdGRmU3JDR0RnZ1B4RkZEVDdoTmlDUE1IZ1dLS3Bmd2NBQkRw?=
 =?utf-8?Q?rwtKgSuMa2Bz6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0dhc0hqTXd5VlBHYWNpY1NNY0ZkRlRiQkUxZlE3bjIzQURVOVVKUGl4bk9U?=
 =?utf-8?B?bXhFb3Arcm1lcmRSNFJaV1JySlhDVGNWSGJvS29KV1FjczZHbHBacElrMmtL?=
 =?utf-8?B?YUF2L1Nhd20wS1lKZFpwVmk1YStPd1RHbkIrWVpVYTZlRU53aGk2K2pqblpB?=
 =?utf-8?B?Zk5GaUFZNTJKRUdSQVU5cWlwK0N2citXNStnaVRSUzJTaGw2alpZZHNqNkVj?=
 =?utf-8?B?SjRiU052WFJTU3R5Vi9WYzZRV1VwNy9ZbHVIdVgvNU5yU3RNQ1A3ZGVOekli?=
 =?utf-8?B?VWV5RWxHbUw2K1kvdDg5TCttZ1Mwei9aZVlmYjRJQXBRWlFUNDVOeU5lQy8v?=
 =?utf-8?B?a01uMlZlQzJyNWd1aWVSYXFReVhia0g0RmZMK2pPcnU0dk8yTkZOeVUycTIx?=
 =?utf-8?B?eUNBOXBJNHpnbHpzbmFwR0IrUkp5bEN1bnlUTURoNWI0SmlpcWIxN2cycUFF?=
 =?utf-8?B?L0dKVUFzbWo3SThOK2RKTzhqYzNVbGZ2UGZWUGd5YXJTR094ZXg3YXFIWDFS?=
 =?utf-8?B?QTVmTEM0RTl0bDdjTjFXR3ZqeUt4ajVrY1RYWVBVSUNHUHdPNFo5c0d4RmZS?=
 =?utf-8?B?eVRrYTBBRlpyOGRXR3ZBOTByeHJtMGF4QVJoTjVQeVBxb1NTS1NBT1RqU2lz?=
 =?utf-8?B?Y2QrWVhhZEZDZExBbkRVK2JJVTBuSUYwdDNQclIwZnFDUFpFaXhTK0hkSHU0?=
 =?utf-8?B?OTNhUk8vY1VDNnlyMGx2OXpSUFFmd1dOOTNKT00wU3ppTDhPbkZmNTJBOS9L?=
 =?utf-8?B?N3p3aDF1NTVtbk10N2NXYTRHdEIyRDV0MlFnZzNmMlIrVUVscWhJejJlRmll?=
 =?utf-8?B?cHNCTEs0cHplQXdYZHdoTTdQSkRxRWplR2ZZeEY1TUlnbXZVMVAwWm9ZVEN2?=
 =?utf-8?B?SDM4VjdPRU40RHVvWUhpN3FnS2w4bFFlbUcydEt3OUlGVFBBbnZ4UTl2dy9N?=
 =?utf-8?B?R2dqQkRaQzVoSHFyazFSODBDTmt4eE1rOWpzT254bXZHRzhHWXF2MUdleTBE?=
 =?utf-8?B?eDV4L2ZybytyZktzWFltaDZ1dTFabHVaTTFaeDdJU3VEOTltNVd5aFBMdXFt?=
 =?utf-8?B?MzJKRWhHMUhSMnRLd2NRR1NkNEpTU1hsQUtuUnhLRCtSdXNNWlNkMUxkSjl3?=
 =?utf-8?B?aWM1dk04aDNTdG1JclpRMnB6R1Fmd1FObFhzRGxndTB3NGxxaU1VNDgvTjZF?=
 =?utf-8?B?L2c5REJsUW85cXNyUkVmRThndWl3SWJEaUZMWGh5QUZFUnVHdXZ0MnJUelBZ?=
 =?utf-8?B?cWp0RGV3ZTROWGo4NFNGQ0RYOEEzR2JYY00yRWVyRlB6aE9TNG5XbStTWGFw?=
 =?utf-8?B?eGcyaVozWjB6eGkzQ3BBUFM0L0x5Yk9sSFBRQ0o5VU1oSVg1d0psWmhtazdX?=
 =?utf-8?B?WlIrTGZaY0NzQndzZVlUSkdKNkswZWNneWJHWENTVko2ZmExOTVwbDdyeDVa?=
 =?utf-8?B?MThueFE0ZENibzVsclJVRUdzTnVwc053aG9RUzlETGJoSW5hN01ycUdlMUcv?=
 =?utf-8?B?SUdEek5GL3lTNWRubGpkYjZtQzBXSmFYTFg5UStyV1NPSWNJUVpOOTRYdjNU?=
 =?utf-8?B?UHhXN1BtRWh3c0lsZHpvVzU2WUFIbk1sT2hnd2RaQW9aTGtKVFp5OG1kcXMr?=
 =?utf-8?B?ZXRFdTRtejlibmJ1U003RXh2c0R2QzV3VDNtQmFyejZkQjFxSERSZWVYZm9w?=
 =?utf-8?B?SGFhYW53K0RFOGZqK0pldmNGcjc5dm9LT1c2anVFTy8xMHg4bElIdWltR0dq?=
 =?utf-8?B?bTBYcHVPY2xjVG5UZmxIQU96MHNRUTNPY3ZyS3gwR2RLUDNIRTNzcm1Ybmlm?=
 =?utf-8?B?OENsVXFmbjlIWnJJSktNZzNqczArdytMVy9pZXczZUlJbTZYYVlsSVBDQnFQ?=
 =?utf-8?B?am4vcFVYclc0WEp1Yzk1VGY1VFY5Q0VOOE9JNHB2bGdJZUFLSXUvaThCVzRV?=
 =?utf-8?B?MkhOeVdlWWRqaXJLZzJsSjFhUzFEWFk1cDdlNW1DcksyMnc2TktEZEFMTkdx?=
 =?utf-8?B?V0x6WjRpZW1KTmR0aEo0MFV4dzA0dnEwV0piMndreHNZbERWR0FWL3lpUktO?=
 =?utf-8?B?OFRNRE1jdFB3QXZiR0hPc2ZBS2NVYTJWdWl6U202U1RYeGRkalFzWkJWNmw0?=
 =?utf-8?B?STVFV0VqdHQ3ZVhPUUR2SFE3UXNZYm1Rd3NKK1ptalRncFpJTUhoSXp0UDR4?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d6c7aa-8b90-4792-2ef5-08dd03cbb7a5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:45.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqIJUzeX81GRNy61KL29ZHPyGdnoXIYpAQV6eOcoBvc0syd9AWfnlJnMidaoum7PbdZuGgLyxKmfY1H9eW3lZbyLX7gylMTZYW819UPkPGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

Add the new MFD driver for the SIUL2 module under the NXP S32G existing
entry. This MFD driver currently has one cell for a combined pinctrl&GPIO
driver and will, in the future, contain another cell for an NVMEM driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bdae0faf000c..cfbaceea5f40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2787,7 +2787,9 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/mfd/nxp-siul2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
-- 
2.45.2


