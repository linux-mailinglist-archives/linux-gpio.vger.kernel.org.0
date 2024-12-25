Return-Path: <linux-gpio+bounces-14230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191B9FC412
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 09:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0761883A03
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 08:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B911531F9;
	Wed, 25 Dec 2024 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="paW91xgq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE2146A9F;
	Wed, 25 Dec 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735114887; cv=fail; b=HbWnAl3JbzjgBJjC9uDW4eya//FqruD1mmwGIbRCZTLM77/T53zaZZ4l5cfXLjCP29TeChR4hfF0qfnM/5O094s6cqNfhAcA9K7rq4phzfor/6okdxwF8mkN/m/HUelGIGDiyh0IwlE/ayFGSgBj+kgLjj8CXHn+nhP6fOPm3V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735114887; c=relaxed/simple;
	bh=ztTNvBjyM2GdOIbjICjOms+n4ACWCVHnpgjWYX6R7oE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sS6sw9bkXnl7TAx/mZ1T9j0EdggAUiQkh3uviJ2uQ1NYedEVsGpCQyyIFn+b4pZ9emb7QKOJxqtRaq3BZ5jnNtw1oUmzfUylI8mIzShVfMHEkJg1oYgUUn58qh7S4zaSni592DG8KLzbzXYFPVUVgRy1671I6rjtBcrvxifOF08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=paW91xgq; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIxdhKI16bl6Z2tOV4qm5+0cScsl92MmGalAK3FQVwbPOSsuORWh3HkU/omHRHKnAQgmjafj/UxQ3bYrdpxk9uYkufpbPwBvjykStyIab8WIn1KWs0O5LD3xuxenpQSZaI65jaVEkxcyW1/MFDNkJZAx0rcjPm7fbfWV1R3ZMvG/E3Tix3m6ZN28/k0Ng3CPHUm1SCq5Q/8JB/bCvUCCE8QELxptVJ0TpCooNyFy9gBnimdnMZ0lBYW4bKUcoO/D+EKeiyGbV62b/1N0uDEuflx8VG6wxFFhduxYbODw6KNvEkz8SbYqS54NNbg8a5a6/ZvBwUWboj+UboM6hycZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lgjoIelcFWeO/3uQ6g9StYO1DWE3pRbCcbM6dX6/yk=;
 b=ZfHgNUdi1HpxKKdU2HdiPdqBUNx/H7MUhJh7onlPodPH6XI53KwRPcFOjexIeuuOFtU1DDHicAmoYjiKWFJ74FIEKJ/rfqD3oVESkcZb9CNWoD1bpG39vewuJk/xFnCXeenxN54ZcIuu8jVS0bzi+iOtVlDm4IKwIuVElWcR2/TsqcIz4UfN7IYtUhFgkwF5lN2aGHUFUW98eAiYdCRJ0dhHdKLQzn6SfnRA2bVVwZj7ZDextHvfK63kmHZ4MwbphmAAXkeAR7Gi2t/CCe+EQzew2IbHi1jE7hsOeuWB5CS8LF/5Ct1yJZ+AaonIljSYdpiCpZk2K5aUkBHjzKUnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lgjoIelcFWeO/3uQ6g9StYO1DWE3pRbCcbM6dX6/yk=;
 b=paW91xgqGDS8lG10ly9LC/5NiE66KymtM71Gfj2U3pv1RgsSXdXGoFZ/ixk6pKn3kioppPQy6uI6SinMWjTmR1T57GvLBvsXzseNJUvHr/ab2T0QyMSg0kbNhb60eWk+HQm1z71K+xOq5x1RvnWatVU1wpUx0aniJmJO9OqUzB+1VgvIxBQNGol3rFh1NFQ6WuTrOy26cU8kt5DGjb/8o3ZFfEFteWl78DTwrtAeH97mm1KGLiiiGL9UWgKyDIw+YxJhz3QMdnV6PNxLbfyQbmTrHGvxubzx1302uEsDH5g30UD+sHT4m90/bEiEKI8I8DRPnOcVUkgWwxAhmXcMcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 25 Dec
 2024 08:21:23 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 08:21:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Dec 2024 16:20:44 +0800
Subject: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735114854; l=2342;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=JW09hdqF5JaCHbplXrnEbMAc0+E3O5ENXdWtWvzXaNI=;
 b=Ggq8/JPv3bg3R3clWpvIw5WzQ65da95nsyi11ZHMwhlRLA0qYBXUdZZzfUjJ6GK+fvYgFkqUd
 8anqAeKysNHCp+9BCMrs/5YJMCQCC4vkgxsG7X/T+AwuiEwC6vX4Ucy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB8PR04MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ae3737-8719-4a34-56e8-08dd24bd1e3a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFVGUXpIMEZqalQwQ1Rrb3BVWGdaanFIMTFsSnFpYS9iT1c4U3VqOTVtOFZh?=
 =?utf-8?B?TjZCb2Z0Z29Tc2NkaVM1SVhQcjlIZEQxQUFBelFBbDE4TjlKd0pqMmRoVUZ1?=
 =?utf-8?B?NUQ4VU9LTDdNSnMzUzBMLy9GR2dnbFNDS1JHMGNHNTZEbVd5UW5VOFlFNVpT?=
 =?utf-8?B?ZnBtK3cwUklJSENQRDREY1lGY2dISGpqYkNWWHJ4MzB1Umc1aE00MU95UDdi?=
 =?utf-8?B?RVhsZmZxd3NFYWFyeHdRM01BWVFpZkZseGJjcit5MTZVMzc5TzU3SkwyWkpm?=
 =?utf-8?B?VldaOFJoTVNpcDNpRlgzZzBUVi9YdWdFMktxWHpjMjZPT3F1OE9TdE5UL0o3?=
 =?utf-8?B?STByU0VWN1Z3UEVYZndoTHEwb2hrN3lvR1UydjdtcC8yM3JRVVN2YnpOU3JX?=
 =?utf-8?B?VW9tY0hBUzhaRVJENnJ6TjlwQzZQcGtIZEdscE1nY0ZYc1cwVVd2REhUYnpO?=
 =?utf-8?B?Wm5WZmkxVTcxaUhOaDVJSXNhb29raXp2ZFRqbE9VVU4xbTJsaWtLR0tPTjh3?=
 =?utf-8?B?aTZXRGtZNmVINTNocWcvR3ZUbTlYeElOQ2dFOVR6aGlQUTZXQkJuU2t2aHo4?=
 =?utf-8?B?b2Vqa3RSc2dLczMyTzV4REFxMXZrWGtPZytaOXEvYnE5SW9wTE83MC9CK0Ev?=
 =?utf-8?B?SXk5K3psSDc4SW8wQ3V2OHFHMkNlME9vSjByZGtJTERMQ3gwOUViTXowakFu?=
 =?utf-8?B?aTZjY01MTDFnZEFPZ1FzZnBEU0FMUVNXdnJiYm5rTHoyTjVNRDc5S1dKYThY?=
 =?utf-8?B?dzFTanQzc0tDellvOVBzb0E4dmh2bEQ2TVRlejJHNmM0UXhMY0dmTlByMDYv?=
 =?utf-8?B?aWNaTGU5WVVYR2x0QWRURDdsT0NZU2dSZTA1SVdUZVNTaGpkZlJYczUrS2M5?=
 =?utf-8?B?K0dNMEYvSkJPVEhUWlZjN1Z4bVMyUEtkZjcya2hvTXlzTHhhZE9pQ01FeHVL?=
 =?utf-8?B?ZUgyYUFEbnJZa1JHNUltUTRTcWx6UXBrREdDeVhMOC9mZFduRWM2VjVKWXdT?=
 =?utf-8?B?cmxVMXBXd3RuNlJ4OGk1QjFVSjArMUlhUFJ6c211RjhDMUJYejVSTVN0Q1Zs?=
 =?utf-8?B?VldnNVFQdmRmS2tvKzNnV1FDS3pPVXkwZ0RUOG8rU0pkNFBjVVUyMHplb0pY?=
 =?utf-8?B?TkYxMGhRRDM4RWR6UWZNVVZnM0QySEg0dmJVWi9DdWYyRUhXMnk5REtsb0Fa?=
 =?utf-8?B?RlpTcE5waTlmZGJjWXZMNEREVFZUc24yWEdYekRXUTEwS0ZqcmRkbkVpc2s0?=
 =?utf-8?B?bXJVWVFyQzFaZ0NzYS9DVVRRSHRRWE51SkVvK2hxaEltb2RYNWtxQ0lTa05V?=
 =?utf-8?B?VkVqSGZGdnZGOU1lQ2lVaUFpR2FLTGdpVEdobldHNkc2Tks5OHpXQjhsZitx?=
 =?utf-8?B?d28wWTM5ZU80aXdNM2tHWnJuY3FvYVlPcWNBelFzR08rM05zOXZKK2ErVmtM?=
 =?utf-8?B?TEsyTFc3emgzWHNjV2FZS2NCSHFlNWxra0s1Yk8wSTdMbFcrY21pQ29VWlo4?=
 =?utf-8?B?dHAzMEYrc2pLZm1QMFRWT0hGby9wcFZwbU9CbG9DbDRlUWtUTG84ZENOaDR5?=
 =?utf-8?B?b2pRNWJJTEdSd0xEZjJsVnROa1RJQ0UrOHNocm9kRG9mTXlXQkd5dlNGQ1J2?=
 =?utf-8?B?K0RTZUxnbjRja0UzdFA0LzQ2WVNONkN1OTdSNWtqV0t6QkdlajVRSWdzZ0pN?=
 =?utf-8?B?a3ZKTGZ5WTUxdXVuUm1Jb0swb3Q1dWJ3cm5hejBoRThRNDE4cnZlRFhWd0Rs?=
 =?utf-8?B?STlFRjZEVmJNNVRpRzNyb2ovU3NkVDVMQi9ZdlFwUTRmQjBiczZtREN2aTh4?=
 =?utf-8?B?UTM0WFdyYzFtZ2IzdHl0ZWdQVXhQbHByaWVDdWk5UjA3RTdOV05ETC9UVnJp?=
 =?utf-8?B?QkV0ekhoU1BzdjFuaEFqekNsdnNmQmM1eUhqZUxPMHMwcHV0N3NXdStldGdl?=
 =?utf-8?B?OHBBei9Pa3hWZlcrWTBFOTdsZUcrNzFSYjhkMGdqeW9qRkhFMjJlQVM5UTU4?=
 =?utf-8?B?T2pqbGRLZG1RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0FBZEYwZjdNeXl4bG94cFd6VllaN25QSkg1WjNDMnBoL0RWcGxDMUVHcGk3?=
 =?utf-8?B?MTlxajFJM09mT1JIVktsZEtHbHVRMXdXcU9HQUdhUHdCbDYrWWlLTys3aURV?=
 =?utf-8?B?RElHQ3FnZEhid0lnVVRVRkVmYXBkYzBBQzB0RTRSZEpERkR6TjJlaWtINGFo?=
 =?utf-8?B?MWxXYmJsM0J1RmV4SnN3ZVRvQys0ZkZMQUV2OWlLUVJ1UHNsU1ZIbTg1V2VS?=
 =?utf-8?B?THFrdkxYWU9oV2l5Vk9FaWRHRTZxWnpLd2Foa2xBcUh3TEhVM2RtazZETVd2?=
 =?utf-8?B?YmdPbDZUdFY3a1ZHelRhR2xJLzNaS1JpT3pGZjlpUGpYVEN1SU1SYit5TTAz?=
 =?utf-8?B?UEFCcWFYbCt5cE5IY3l6TFVicFJZUkJkZ2YzWHNkb0Vzb0VnTDUvNnh1eEc3?=
 =?utf-8?B?Y0NhOXcrOHcyQWdhQVphUmNmSUZObVZGSVl4bC9uNy9hTXI4V09xTzAyUzAz?=
 =?utf-8?B?VDBMaFNqTjRxQ3h5VXowTjQwRjhHSWZ3dEwrNTFlUmxpMGpoUnVWbCtwZUc0?=
 =?utf-8?B?elpVOEhPcVYxQUhGNkpwNDIyQXl5dEpRQ1NFRUcwd0tTb0NhTjgzaXNzbTF5?=
 =?utf-8?B?WG0vWmhqN0ZmOXpwQWNja2xQb05yRHcwMWIyU2NkSS9PamErMS81WXd1dHV6?=
 =?utf-8?B?c2p3UmpabkcySVJ1RTByTEJQdlJBQ3B0T0tVMkxmWkxSSnhSSnRNNUNqWmhi?=
 =?utf-8?B?VDVJWTAyWWFGbGNOOUgrNkRmQ2hKd3NaWEUveWxvOUFjQVVnTWlPQXRrUS9R?=
 =?utf-8?B?L0JLaTN4VFJvWkxieExqd1FRbWVteUtZNWRMNitocWhvb3FZNW56QjQ5TmRn?=
 =?utf-8?B?SVk3bHNnQnZRKzBEYllaclpTaGl4Zmp5WkxMWFBZekdwWjdoaXViTGMrQng4?=
 =?utf-8?B?Y0J1Z2VJSHZQWW5vZ1dUeEdaQ21iTGZDajZlbkhFOWRUUmhWNCtlSGloMElt?=
 =?utf-8?B?Y1F5YlRoekQ5TS8ySmVvRDFDT0ZsMHgrQlptdTUyTXRaUCtXekpVejBlY2x6?=
 =?utf-8?B?U3o3MXhwckltN1hNb09EQTlUS3U5RWVIS2ZVU3NMOFBGcjM5K0VvSTUrbW9t?=
 =?utf-8?B?anpVZExYT29TRzVrbE0yWjIvTm5nR0h0VGtOdkNPU0dEZUY5aEhWZEZ5Si93?=
 =?utf-8?B?RkgwSzlpUWU4WnMwSDRlMHZTOWZOTUJBaWVXMzR0ZmNrc3FubXJOTjcxWWdV?=
 =?utf-8?B?bnZOU0M5VEtwd1ZwM0RVU2k5d0NMa3J0bFE5cnhUQWg2dm1mOTMrRXVjSUxN?=
 =?utf-8?B?SSs3cEZhdy9FTE5sOC9MY01wWmxPNHlJNFdkZW51WDZRWTg2aHE4aGZzeVg5?=
 =?utf-8?B?UEtUREl2Z0EwVmxzZkErWGtmSjhTbXM0Y0tpN0RGU1Z6VXBpVGRVOUdWTnkx?=
 =?utf-8?B?ZzdRTFpYaEQ5WHcyZnVMZWE5SUZSN05ZUCtRakJTRExJRExRWklYanh5eW9X?=
 =?utf-8?B?dlVGem1TenZOMS9RYUtnMjc3UmVGRlM1VXBpekJYUkYxZW5yRStRK2JJZ01l?=
 =?utf-8?B?NWRQSEpFLzdPWTUzZEdielpRMThQVThPZktRK3hsQlY2MzBFSVIyK0czZGk4?=
 =?utf-8?B?STdaeGN3NzJ6bjIreFVsYUhDL2NqQVYzV3BFUWpwZ1Jtb3hGSGM0Wk8xUG5z?=
 =?utf-8?B?Q3NJUEhidDk4c25SVVp1QmlFdUZOaDFnTlhZak0yRHptUVYzVlB6RisrZ204?=
 =?utf-8?B?ZE51cTZPVGFYZFJCTlpINVB5MFp4dnBXZHovR1JaT2F4RVBYQlVqNG5scDF3?=
 =?utf-8?B?WXVtTUs1U2dxQ29oc29admsrVVRlYmhFSjlyb3VpWmlQanFabXNTblVrdXdz?=
 =?utf-8?B?TndJVUVYUzlVNTBseEhUOVBiVkphSlNMcm4yMWZuYjBDVkNMbElnUU1uY2lP?=
 =?utf-8?B?VjFScTVTaVY0cWpqZytuaTFVRzlRQWR5SWRRcnRmV1pSRU9jWnFQT1psRlls?=
 =?utf-8?B?eWg4N3NkNzRhZWFkTm1selJYcE82Y0d6U0owRHJ5QnZsZkE5U2wzYVFsS2FB?=
 =?utf-8?B?d3NoRTZ4STZEMGZqRkhTczl6b2ZpcmFya1lCVWRtcFlidDd1WWVHOWRqakJq?=
 =?utf-8?B?cDBld0pmc1g2RmZ1bURiMVNRaUtqRStWWDFGekFLYkRqa2hUK0d5cU13V25G?=
 =?utf-8?Q?QCjiIUgMbKVJ1ahs8RChcHIDB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ae3737-8719-4a34-56e8-08dd24bd1e3a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 08:21:23.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1zklGKYHV8MJmod+zBN26ObWYUTK87puK3Ks0YOvXTY3yr+9FgFAUV+Ksat1Q4GM38SKjAm7q9zJxgppxKcJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

From: Peng Fan <peng.fan@nxp.com>

Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
will be created. But the fwnode->dev could only point to one device.

If scmi cpufreq device created earlier, the fwnode->dev will point to
the scmi cpufreq device. Then the fw_devlink will link performance
domain user device(consumer) to the scmi cpufreq device(supplier).
But actually the performance domain user device, such as GPU, should use
the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
the GPU driver will defer probe always, because of the scmi cpufreq
device not ready.

Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
for scmi cpufreq device.

Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb65484543044b4424fbe3b67245466 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	device_unregister(&scmi_dev->dev);
 }
 
+static int
+__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
+		       int protocol, const char *name)
+{
+	/* cpufreq device does not need to be supplier from devlink perspective */
+	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
+		return 0;
+
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+
+	return 0;
+}
+
 static struct scmi_device *
 __scmi_device_create(struct device_node *np, struct device *parent,
 		     int protocol, const char *name)
@@ -397,7 +410,7 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	__scmi_device_set_node(scmi_dev, np, protocol, name);
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);

-- 
2.37.1


