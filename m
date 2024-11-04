Return-Path: <linux-gpio+bounces-12522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 621069BB3C0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857F51C2243F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FB11B3937;
	Mon,  4 Nov 2024 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t91F5m3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4A1B0F2C;
	Mon,  4 Nov 2024 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730720772; cv=fail; b=LxuY/M3MVrBLUIxeqzikpTLWDosxljQel0pnpwi+KPByW6vdPy3b669yrdQXyv39c5DkrgmoCcR3Ac0/cVloWpE4mcvXWOGp1SAbFKkMAN+POxmE5GK1s85l+hKcN+sMnAqaU6RGVHE9D99+FgdCtnfhcfMajlcvfxL0Hcib2Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730720772; c=relaxed/simple;
	bh=A0fhL477UubuK2RrdRs2G9lHrv5N9drPQ4LtEAYDCQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fhX8q+wtv+xzEvTc+oe7YWM4KUBudiqPAL7PgrI7s/RWnA3MR1VypgelTGQoxDqgYCtwKR0cKdu8aH99Qw0+mE16YpiyTaz90wpVv65glGL+08PmeLtNfDE2LCBWfEUeAHm27cQyIqtK16yWdt3rB/6ZCx9qB55i7h63nDtMlTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t91F5m3h; arc=fail smtp.client-ip=40.107.247.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuB1OAErZA5degsxa2J18OcpG9BxuIX2778ptuDgEny6U5qZLy+0qbXz+nmF0ChL2+jnGU8XsyIez1plYjBnSFV2lI1PX9WPTjDU3HhL5RdGY2sS0Cgcr9EX55C4OqpCaPXRAMUyYKMIzbOVjC7nPGx2nSQn2EjQENKulHpr8b9rmjYfj4PVXI/U6XeMg/12jC/md9OYiC3nifBfzH0g8L15t/rMDcZIVPY4d3pMe/xMStLgcvyVR14Y1uNtgSRFmcX+jwFNtsiMoGd/3FTq2aeUK2lZkdpFYq9bEnooIcjrt4GULq6LuGBnsqW4zzLuNLiRh7STo366vZYlDBsHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0gsoD5fxiStSEFQCJfd3h2WQnic3J99x+e/vw68DC8=;
 b=wu0Evh0EPauOs4kec1nAbI79W6hG6GpIIM8gm6oshjCjfkupnsxP9YO2raOQ1KvAnP+WPlIOqADIbTqYOTIu9qXx15ZYbdrZjZ9gm9d+19SUwY+IApieYVq9zeGZgSwgg5AO+tgYggcPP3iTl5xRrVDACa2OJB0aFr3iNRY69EbMSw/U8Brt2Txk4CaRdv+OaCbPP2509MOtlbOHGGbsTMh2w6XdavRHDFwIO1CsNKIGktXKnsrw+c/R7F+1S6bjzbsf7/NuUFqxcDG2+5yAobXxVCuYrRO+VC4BZJnRZvH6sMI8pQGaEXMctmYX6DGdEBZe8AuDgdieF50IX20aDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0gsoD5fxiStSEFQCJfd3h2WQnic3J99x+e/vw68DC8=;
 b=t91F5m3hlCRvXtNU9YS1ZR+5nujzNEitTDLvsC+jv0w+ik7hDzkk78YBbZ9PoabWMqIYfL4VY2aW7o4+wxJectpZbYpw5gZYkcHjoukAlImn2seLKMueuvoRXhkGlC/BdfUGpSA6SgqESu9Yk3C53r7C4sbueoSjx+VMB8Yv8et31y0o8ddOmDuXfUhurjxx0QO8e82emOha765s1zn/Lyqp9lulVllB7qr2B5jMBwkuI46a1v1Cw9vPJMoIut1NiPakhXdSOULGqrZ+WlP6y5mUVpnN5ptCU7Ho/vwEXdIUHj+u3xjJlQv2b2hfBiV44ZqD5BNrDkvsaEPC4CJiuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:46:02 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:46:02 +0000
Message-ID: <73d0eddd-f36d-4bcb-ae23-e0f21c3eb178@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:45:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] pinctrl: s32cc: add driver for GPIO functionality
To: Markus Elfring <Markus.Elfring@web.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, s32@nxp.com, Bartosz Golaszewski
 <brgl@bgdev.pl>, Chester Lin <chester62515@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai
 <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
 <fdf5702a-b739-4643-8288-86e6cfb8403d@web.de>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <fdf5702a-b739-4643-8288-86e6cfb8403d@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::24) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf6f5cd-e4c7-4323-2ddd-08dcfcc641ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3BMeDRWT3FMek5nYUFpTGRiZG1KWnIxOUxsSGZCQ3lUUzJ3UVU3eFRlMFRY?=
 =?utf-8?B?Y1NhQmhyT1gyT0FGeTgrNS9LY2lhOVhEOFlzODdCdXlidjBDNGgvS2Vnd3VO?=
 =?utf-8?B?SmNJZi93SEg1K1VMSlJ1cHJWVzMrY3FJSWIyRjg2UHB4Tys0RUVUYVpJaVJB?=
 =?utf-8?B?eVY5TVJ5bEFVMGc5L2Q3Sk1yT29HcVkwQ3h2bGk4dHdKV1hvS0NXYTRFdmpF?=
 =?utf-8?B?aEhHUWNubUtKZm41aEMwOXA3b0FIMjdiVkoxN2xkRWlqbTJGNUZCMWxtMGtp?=
 =?utf-8?B?U0FoSS9BclpnVnNkbHByVEo1ZHBDV1NzTjRZODFEODlKQndzdFhZa2VzbHVK?=
 =?utf-8?B?QktlSkhNYkdWOEdFQm9jUEo0cGVDOXV0RWdOYlpmVXEyejRPeDcyYUVNWkFr?=
 =?utf-8?B?L3BWc1Fva1U3ZTN3QkZwWVROalNxNU56MjhPQnAwa2pVekkraWZ2Z3ErYjk2?=
 =?utf-8?B?OGFhS3NEQXpTb0ZnV1ZBUXFQTHI1S3UvQ0l5cU1KSitRd0dDakRuUVdBc1VS?=
 =?utf-8?B?NFFPVkRuUEM3TmY3WVN1dTd1dTUvekNxVWN2blFxVzJOWjRDOUJoU2hKTHJ5?=
 =?utf-8?B?NXRTczVtUklZNHhCU0hVS2dGTVp1Rk1Gd2tONjl6cDhwWHRjT3ZsMmtIdGY2?=
 =?utf-8?B?WSsvVDRCeGt5QUdtanpLMllyczVVVUxjcWlYenlGYTJrSkM0TkJwT0xWVHYy?=
 =?utf-8?B?YTFVbGU1SGVWeGVGdThPcklnY2d2Y0lXWThFc2ZCTUlqa2hnOUxtODBWeXp3?=
 =?utf-8?B?SFExY3kyUzg5Q05DTnJtS2NWbHJHTDhLS3IreGsrK25TS0FQMUxEQWNXWWRS?=
 =?utf-8?B?VEh5aGdMa1d6SWcyM2t4YmthWnJ1VU5VZTNoS2Z4OXlTaHhYdmtEUmhpNnF5?=
 =?utf-8?B?QVpEajVrR1IxK2VGL2xVZ0ZjQ2Z2a3hodkJRNXJPeFJjc2dwWkd2SldEYldz?=
 =?utf-8?B?a3p3ZEIxUmFWMDc2VVZTT1JpR3JoSzkvWlpUcE5vYXFDY1dBRmlMYXFPSllH?=
 =?utf-8?B?dmJiT0NTZGZDc3dWQy9mdDRDRVZwYzRCQVJ1UjQ0bm5nM3EyelpDdXlQRWQx?=
 =?utf-8?B?MFk3REJTSTJFZ2w4WFBvQ0IwVlNIVGJENWVIamo5NUttMTVOd0pkamRnbUlI?=
 =?utf-8?B?L3h6M0xXWUZPL1B5WHRmdnlvaEtrNUNMalkxSjhMUWZCRzdGdFJMUXFGdnQ4?=
 =?utf-8?B?d2JYbUpyTUdpeVlNQ3hjdVNNa1pFNE1aR1VpeUdpUkJUcnIxcGJOWWZWWkxZ?=
 =?utf-8?B?YmUwa2NLYWNERUFYbmZkWS9kZkJhWHNabTE3WUlJRmNidmlBSHFSazlWVTVL?=
 =?utf-8?B?U3VNeEszTm4xVUxqd3FVSXRjcW9EbWNLTGIzMXZPNDJRSFcwaVBkSHovUWgw?=
 =?utf-8?B?SnJvVU1GZlZqQ2U1ZkhYd2R2LzhpM25xZklZT01GSDhmSEdLTU1JaUFyL3Bh?=
 =?utf-8?B?MWRoamhEdmhjY05PNmJub21zdGh1TUQ5ek8vSWxtaUtiN0RJeXB6d1UzczNC?=
 =?utf-8?B?VW94YlBYazVkWWVJdFc2cEIvb2FUdm9vZk8yU0czZWNpUGlZNWF1WVg0aFI0?=
 =?utf-8?B?U3RvRHNyaUtzb01tSVhMeTlkNGZXZ0hJeit2SG84eGJreWlLVWRsV1Z5NmlP?=
 =?utf-8?B?WjdaQjVQYmtwVU9hZjB2VVVFdmRCRzJxVTR6NzJFaGF4cWZLK0hSQTVlelY2?=
 =?utf-8?B?bThLNnUycUVFK1RVV1ZZcGZ1NzZGdFJ3cVpBS3hxakdGdE84aE1JWDcvclVt?=
 =?utf-8?Q?+MT76GSHn4mPBXKRH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVCRGkvRFE5eEovMnN0SGxuT2t1Y1h1ZjY2UldTcVE1aEJXOHRXVFhwU3F6?=
 =?utf-8?B?ZHNudW8zMGx5aGlnSUhlQTJnT2M0QjdRQmZRbGZCcUo5dldPcHZ3M091YWlH?=
 =?utf-8?B?OGlGcmx1OUVoSkVJR21BSUthZXpkb1JTL2ZDOFMzSWUzemlNNW8zSXNRZXFl?=
 =?utf-8?B?ajBESlZpWUpLMkdLc0JyUFZtSmY3L3p5bHpNRlRJRHRzaHRmdHlnSjFUUVNq?=
 =?utf-8?B?OXhZemNwRXRUd0pFQjNuckdHWDBmcWZPN2hPOXo4blFPTDhSRkxOTTdyTnln?=
 =?utf-8?B?SDIyVmh3T1NkNDg4bUlNL0k3bVExTE5ES0IwL25BKy9nR0h6QndLVnduN0JC?=
 =?utf-8?B?WGM2NjJvdCtLbk9iWEx0bjJaejFsNWs2QU1ibzNFblUxMkFWSngrSVA4a0ZR?=
 =?utf-8?B?bmw4aVVSa1dEM0Qxa0FjVnp2WlJScXFTckdyNDh1SjNTL3FISlQrVVRLS1p1?=
 =?utf-8?B?MVYyencyN1dYTVlmVVYyTnFSVUlicnB0V3JJRnNwLzlNdEkzdmYzWU12WXdS?=
 =?utf-8?B?RlYyUzV0dWR4RVJJTjlwVnZQSXczTlB4VWJadUMxbEt4WDNiaGd5ZUV5U3l5?=
 =?utf-8?B?UjZjTThvMUl0K0k5a0dtN2I1a0Z0TzRudTlSWi9BcFMreVBPL1llNGJvYWli?=
 =?utf-8?B?WGtrbmZuZFlweDZFcUIwYzZ0Z0lpaHcrYWhGNkhnMm91ZEhJTnpaRzVia1NO?=
 =?utf-8?B?ZDRSUHhpVit2dVRrMjhxMDZFb1NpbXhaQmxuSEM1NFN0OUpiQXpML0NPdXJY?=
 =?utf-8?B?WFhlSFZ3QnRqSmZVc2hHZExoOXBLVURSRit3RU8xem9CakhnTzF5bVRJN0FK?=
 =?utf-8?B?WGRpZVJ1V05pSTZkSFlGRmFaMHpmUTJVWXF0dlA2Z3RWQjAyTXRJbGZ0cGRE?=
 =?utf-8?B?M2k2aEswKzJONWhYaDkzZ0xBQzA5VHBuVEh6b0lsSjhHcjdIT1Bna1M2Q3p3?=
 =?utf-8?B?MENnMTdYdXF5Tm9qUzBObkMxcHEvWHJoeHY1bkRUTnFiMDFCaWpld1NzN2ZX?=
 =?utf-8?B?Wm5ERjNwRmZzNnlLSXc5bWxpY05xRFMwbllSNUowSS93eWJFOW0zb24xNENj?=
 =?utf-8?B?cVJuUDJqdFdwYWJaRXRZR2QrMUhMUC9tN1dlQUJ1Rm1WT1FxRTU4VUtGdXlL?=
 =?utf-8?B?Q2QwSWpSMGNCVGtxV1BJZmdKMlNsSVNPOWdoaG02bnduaDhUNjZlSlBuSVlK?=
 =?utf-8?B?N05CbUVNdkppdVFySnkzMXloakI5T1N1eEZhYkoyNEpmT0dxYy9heWszZ09q?=
 =?utf-8?B?azdQUUhSSjRyVk9CNWVGNnZha2JyNnJPdlk0cnh1RGNPZ2JSd0IvaVpUaE9q?=
 =?utf-8?B?bkxsQ1NHOHhrT1pwWm00aFlqbzdtZmVtbzB3RlpCOWlobzY4Z2dlT2JpU1M3?=
 =?utf-8?B?MWJCVVFmRG9HQWpXODROeTNtT1FoSUZsRjN3QkxyMWVXTUNEYktZbUhvZ2VJ?=
 =?utf-8?B?N3V0dGk4TCtSMm44VVdFcXpSZW1VbEs2MTM5bjNBTm8vb3VmODhJWldVTkd1?=
 =?utf-8?B?L0FiZXAwZy9STHRVMnBOV0JReXVXUXgzM3dYR0lFeDVNclE0ejFSTUFDK0lK?=
 =?utf-8?B?TnppMUhZMlFwVkJRZVRmRnVCNGlFSkU3WDNTS0h6OGUvOFZkTngxd2RVaisr?=
 =?utf-8?B?TmlPK3lmSklVWXBBMmNHUEM5QlVwWjdPT1NRTmwxK2xaNjZYeWJQNm1uc1RT?=
 =?utf-8?B?aTB0eDgzUDhQeEZYQ1h0MU5hejNCS2R0b2ViR0g3bFlONjRQTGJyczZKWGNT?=
 =?utf-8?B?VHdvQnJTYUduNytTUWNtdHdldlR1V2toR3YyMkJ1NlNtNzAwOGhUN1dFb0Rz?=
 =?utf-8?B?Ny9janMzaGkySjlkOXY3WEFhV1g5bzcrREFtQWdGY0xrUTJMeHlVOGF2d1c0?=
 =?utf-8?B?NHpZSlNtYmJWektkMTU4QjYwZkFZeXdLRUZ2M0E1TWwvck5MM2FZeFJlRk56?=
 =?utf-8?B?OGYyaC9ER3l3STd3YS8rd1lqZ0RYeDhDRUc0MS9GZEJFWGpFRmg4eGMwQUVP?=
 =?utf-8?B?UC8vMURGV3pzUGJmb3Q1M1VtM3FjOFpnOWFsYmEwaHVoUnZkaWJYbjhvTFds?=
 =?utf-8?B?QXZaRHlVYVRnSTFEVVdzUkJiNTNtNEcrc1FkUXpBVDNzckhiOTdjd29Idm9H?=
 =?utf-8?B?VXp5dmtJKzlUR1JPRGs5R3NMdy9KUVNYaXRLQkYrSHNTRzhXRzVucm1VRkhB?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf6f5cd-e4c7-4323-2ddd-08dcfcc641ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:46:02.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uj3LLrF5iZS8glgK4jGmZTBjQKsQ1a8gsibELF8+5gx9wH83idN3T0gg2lSLTmnKALy+ofeXWkKsKsVWl0XDMopUr4nL0L3KLMbR+zH8PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

Hi Markus,

On 01/11/2024 17:45, Markus Elfring wrote:
>> Add basic GPIO functionality (request, free, get, set) for the existing
>> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
>> coupled.
> …
>> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> …
>> +static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
>> +{
> …
>> +	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
>> +	list_add(&gpio_pin->list, &ipctl->gpio_configs);
>> +	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(spinlock_irqsave)(&ipctl->gpio_configs_lock);”?

Thank you for the suggestion! I will fix it in v6.

Best regards,
Andrei

> https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/spinlock.h#L551
> 
> Regards,
> Markus


