Return-Path: <linux-gpio+bounces-21902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D76AE1136
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 04:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B073A4A031D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 02:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAA561FF2;
	Fri, 20 Jun 2025 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F7LaarX0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E51A288;
	Fri, 20 Jun 2025 02:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387684; cv=fail; b=lTS/XNwSL602NqeIMSc58bVT3eGEcSwbeF2rUoTSGMzQd4pJBrzaI2gD7yNeJ5VK4avs2VQcK1cKCgmBF6JIHIT5MumdfXYbx9c/i3E/2l5Szuh0WXsabs/QveR69NbvT1us9yyL4x1hO3RjXYXDT+1eVh/cxqiwfJuIRjww8Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387684; c=relaxed/simple;
	bh=ow/B2XCtistnPKfN42lllUnt67q8bggOtkwZRC6XZcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QMLVG01WGO4flzZiMIpq1XIVAtHyprWL4X6tkhypKtyVIyf6mVb65haM7ekKG0u1+iHxby6IUFWkP6s3qDWPDeCNgkwxzDD4aVYEyRwb9Yh9hKfOruXYuxuFwzHV1/To61H+6b22k9Zpd49AwSL8g+0Bq2XON7jZ47M6tQVeHk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F7LaarX0; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3qYa4uBTkbJhRe/anu45JsftYobpzMKMqcYi49nb6EE41aID1+bcSHClDEkLk+KiKTBACk8DP+GQfMGR+GB1RyhILWIO4eueHLIzPnQ53r+JmPWPpNs95o1G0LfH7RrQ6n+vTqKXHrm7OaL/I+LXQYdJLC3HEfQ12bRk/NV1oUhZ3Y3J//wsP1UHRQs/+TSY6qbRxnjQYOf0NG47w4Zci7YvOJ5zR4QN+ztz9MrpVmaOAGZoEKO6d/6gw0tq35byY2vTV1RLgCBW4XXAK8cTBNkIYYyufXMhzbBZOyPaHRy/V+OvVFN9A/uVW9pHGWJWzoq+IFgHaglWRzcVxRX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhpoMyaieHMtMe0X8vBhxMlTCcMMeWdO/YVjI1cG7NM=;
 b=eucsda9DNo3iFI8JJGCfUy9Pq67VCICboI8LQG/BrqSNPyFrBBJPslBENqXiIcwKy0ZfmQ9f1HstzxkkRQIK3NDzuHnRbIbYigRk3IACKPoIknd8NqfKxQoRShQHBWAebjyVnLhTAZg9ySEagyYVuPsyiLbTsBLvjwsswBLxcQIBmUYRWD/fQ4zNEKthHWqFfTA94CoRzTpHyzcD07GnLW3XhyrtNHjkcqJE9XdUqBArZ45CdVNISaGELhzo7CI8vUuiSueGLKw7obU5RW10wJGryM00pRhGw+/yUueoWmAwB9rQkZNljVyjb/4bFmoc6/mZ/kzlvxVQh8AR7ad2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhpoMyaieHMtMe0X8vBhxMlTCcMMeWdO/YVjI1cG7NM=;
 b=F7LaarX0EwmeAK8+p+6Vn3r1/2cJWM6eIkvYSUK9a0m5JFcf7xrTC5rBQZVWOKOPGAbeW2G8/jM4VHs/xUGJRg807e1tYylAAjY6ueLh6uq8gRLhAxNnGSnvthhs+LC0zGc86KH2o90akHoYipoMxiCBtL71ZmDMjqso+F0EQyHmzqBomxjT6iOM03/91bYw4E2ZbcyTzlbbClT1ly0jb3HXa0LLlt7qPmXrN88q8QNUVLJnrILaZ2CDbocTTCJOxIpLfcpggJ9Rkvx0i1u24/ROP8JkUuWugH5rmnB6kB5w6RUOCf7mG/o7q6jA5kSa3ChvuRazSnYkTWLDrREs+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 02:47:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 02:47:58 +0000
Date: Fri, 20 Jun 2025 11:58:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250620035816.GA21846@nxa18884-linux>
References: <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
 <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
 <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
 <20250420140944.GB31933@nxa18884-linux>
 <20250422-vigorous-cockatoo-of-growth-bacdb7@sudeepholla>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422-vigorous-cockatoo-of-growth-bacdb7@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fbb89b-6b52-4270-9c13-08ddafa4ddae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE1sSFVpTmJyWUJ0T09LMGhyS211cXZJTnR0dFhIMTVZK1JCVGRVbXRKYkhk?=
 =?utf-8?B?WmtjVjRQeGw2bjBubitwNDY5SDlmSFliSnVDYUpZcml0WGdGdGx1L0xqc25S?=
 =?utf-8?B?VnN3Z1NEcWl4WlNDOGt4UEtFeU5pbTQ0UUtMbDRLbUk1c0N3MWRSNjlISHcz?=
 =?utf-8?B?NTlwS3QreC9JK29nTWN2c0pNTUNPTkN6VWRkNC9LWTZGM1BQLzJBRVhxYks5?=
 =?utf-8?B?aTRiWVN1UklZSDFIaFU2Vm5wVE12Q3cycXI2SzZISTRKQmlqTldJYjd0YTJS?=
 =?utf-8?B?Vm9aendPQlZ6eXl0KzNzOHFRbzdoNS9jUjdsRmtZdG9mbENIZHRabTlZTTdl?=
 =?utf-8?B?ZDhHc2pxOGtpK0VqTW9JOVBVbkFVODNiTEh6UUhqaUhhSXhqeHp2REpERlln?=
 =?utf-8?B?N3FURnpVdEQrNVBaalBmNU1rTGt5MXd3eks3NGptcmV3YkdGVHVBbnZueUtT?=
 =?utf-8?B?TytoWU5EZG1YWnRna1J3cjc1cENwUDBGVC9XRng0aEltNFhtVU91aDdsMHhu?=
 =?utf-8?B?M254WFJtSk1RVGpqTWFCRXBDNGFzN2MxUlBLVWlLcHVOVTk1NGlFbDl0UWdT?=
 =?utf-8?B?akNDRGt6NGNSd3dNV2tPRlJNdEVkNCtSOEdsOHFxZkJqMWRzZUwrT2tPbmhF?=
 =?utf-8?B?aU5NWkJ1NEZ4MDJ1K0c4SElQa0FnK1VvempibFJMTCtQYTlrbE5IT3EzRDZn?=
 =?utf-8?B?Z1ZSWkp2c3dLMEp2YmNQRmtZeGZLanRHOUFZVEZUVTJjRGZlRUZkM1h2SDds?=
 =?utf-8?B?eXRHcno0djJCTXpjbFNXaE4zUG9hektza0ZxUGMydEcweWNJYkRrN2lNbWQ0?=
 =?utf-8?B?NEtDbnkwV3FJY2Z4cU5OckMzcTNobVdZbWMzZVpyNk1oT0FiUjZxZkVnYVkw?=
 =?utf-8?B?T09EZDdoeHBWOVRKMFFDdzV4THE4VnhobnZjVGpoZWtaRWpqSklRL1FRc0JD?=
 =?utf-8?B?T3hNV0JFajRhYWxaY2ZVbUpaVTMyVUhrNTFyVnN3VXA3ejlieUpDazFLdEZk?=
 =?utf-8?B?cGJvSkxFTUY4dTVxbjRlSGRXU2E4QjV2QytXSVJuVGY5KzZKZDJRd2ovNkIv?=
 =?utf-8?B?MFVYNkZNdkN2WFl4Q0Q1QW1vRDN3czIyakxiYWt6K1FOeEwyYlF1S1VnNWpx?=
 =?utf-8?B?SU4vbHMyc0ovOTN1cTJhY0VOcFhZajVPeTNvR0ZVUFhCM1UyTzJvRXNNY2Ey?=
 =?utf-8?B?TjJpbXBsKzgxc3ZQUmV3K3RlZWJDaktmV1gxTzNseVpxSGlVdjIxY0VpWWxt?=
 =?utf-8?B?TWNLdytwZjJXNFhnVjE2KzRqblhDZlFDSmJBSVAyMkdrbzAraDgrWHlRaFIz?=
 =?utf-8?B?Vy9iRlRkUkdIbVdJemhQa1NQblZmbGNMaGZvMTJrQXJTaGNNWkJDT29hSWpW?=
 =?utf-8?B?RXZoTUVDTUFWREN0NUdUU0VRSWdCSjdXNWhYcUtnQzV4cFNNV2Nwb2dvUjNO?=
 =?utf-8?B?dUlVa05MdktnQkxRMG9OU254b1l5NEMxZlh5Mm1IdjVhNnprQ1Y3TDNwcmpK?=
 =?utf-8?B?Zkh6akpwZUZPeDJzRjVlM1Q4VVk3dS95UmlKQjRhNE1DZkFXMEVMYWV2cjF1?=
 =?utf-8?B?Njl0dTZQcHIxaitIUGdsbTNNYXJOajlsY2UvSVpWQjJieDh1MFdlOC95cnJq?=
 =?utf-8?B?VzBvMnFKR0kzbmpBRncyV2dIWmQwOHR4NzFhMFR1Y3psNlZQeFh5SjFIMXk3?=
 =?utf-8?B?aG42czJsS0xEN2hUeDk3a1VnQmJBZEtQSmRxVlZvdjlMYzVyZk5SZ2YydFZW?=
 =?utf-8?B?ZUNVSXNOMW82U0dhRjM2eGlxSSs1c1NHa2dkbGhkQ1B0ZTNmL2tndXBrRGJx?=
 =?utf-8?B?bjkxZWdXYXdaMTArZis1RW1JNkVUd0tmMnExUzZmRC9lM2toZDdNUUlVMEVL?=
 =?utf-8?B?a01hNE1ldXZmbkVTVGFsT0JQZ2thdHJJMXdZNm1VV0IzdW9Hb3E1MEFmdjZk?=
 =?utf-8?B?eitMK1lnd2w4bkIvTkFtVUpsbW5abDJPOGtJalNnWXMyQ3h4RStpNFRydHRM?=
 =?utf-8?Q?QOVjO5lD4lcLySiMkeGELZW7Ul5BY0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0dPRDFpN1hkY0VqOUVCTHhMaHc0WUVucmJvb1lNSmpnN2UydXlwS2tPeUVj?=
 =?utf-8?B?VUp0VU54Z3lLdjNTTmNscW16dkpFQ3lRZWtZUTVoYTI4WWhGUEhFYUlXeWNl?=
 =?utf-8?B?dzZhQUFUYk5oNXhIQTNIVEh4djJMbmt2b1NiWFZjYVZpdGdsRmh6RDkwTERU?=
 =?utf-8?B?TzEyVFRMZ2xLNWl6OGRmU0ZqTmNaVkp6dHdKUmdFY3QvdFMwN2VMQTBoeERR?=
 =?utf-8?B?VUxVZEd0YytNWi8vUHBOUjRPSERhaVhraG9zRVFFVGFCQkliUFlrWWwwU25I?=
 =?utf-8?B?MnpDV0dQWkZ2cncyZ2NDNnBnTUNLQldXOUY3SUdkNmNmTXRwcE9mWmh2eU4z?=
 =?utf-8?B?a3FsRmN3TUF5UTI0djFwbHR6dndYckZpa0F4YzJQcGdQZzZJbHZQa3dHSnJh?=
 =?utf-8?B?ekduN1RIV0J5ak1sTjZXdVB4MitUeGU3UHRUMmhPaG1MdkorQ21TVTFianhL?=
 =?utf-8?B?eTEwbDE0ck5iTU5JMm1sbmdBQkpXQlBIS0k1eGhnVTNTUFNnQ21DNXIwZW5J?=
 =?utf-8?B?M0R6WGpDUTQzYnMvdkc3VGx6WDJTeVBOb25HcFZWM0VzdFlLeEpUL2ErUGlh?=
 =?utf-8?B?ckNHblYzTnRzUkhIZzg5STlqTlNUeVB5RWJQVXp0MFJPUVZXNjF0cVBOYWlF?=
 =?utf-8?B?czZsNEVjREQxOUdkU05Ra3ZLSnM5OVd2K2c5L0ljRU0wNVg3Smk2aUttYUlM?=
 =?utf-8?B?ZGRGd3llUmdaZUc5WkI3M1V6TVZ2NE9wdW9LakZaU3hXZ1N4M1o3a2RiRG8w?=
 =?utf-8?B?MURkeDFNeGNZWGlXSUZiRDdkTkRadVZOVktIT1FwMThBL0tuNmZJN1BoenBT?=
 =?utf-8?B?UkVoWnByMVZBMXN3QTVYUDZtanF0TGd5TnpDY2Z4RGpQZjhWM0trU0ZGOU80?=
 =?utf-8?B?c00zZlVSNzVGQkdqSXFkWEtNR0pzRkp5SVMrV3duVVEydDY0UnNDNGlRWjNK?=
 =?utf-8?B?d3ZiY290NVRnQkJVU1drV0RrZExuZVpEZ0hjdlVZZk1heC93RXZPd3RkVEdq?=
 =?utf-8?B?N25SeW1nMThhRGthWi9DWkFWRitxNU1BVTJOOVFtRzNDWkdWckZ6bHpJZnZB?=
 =?utf-8?B?eSs0MWFjaG1YMjZpZ1QwRm5peHZwTGk1ejVucU14MC96Znh1TDJ1ZCtkQTR3?=
 =?utf-8?B?WnBFQ2ZNM1FrdmNNalM3SDZ4T1ZWbjhXeTYvSStadTU3Qnd3dXQvbGM3TWhQ?=
 =?utf-8?B?OGFCRWh0TG54eHhBMytCT2MrNjhWcGVhbWVEcE1NeDBLYUNyVkNQM0krVmEw?=
 =?utf-8?B?bEhEa3liRGt3NnFia09BS3RIK1dKZVQyWUJ4a3JGcWg2M1JxNHhyVnNpWFJZ?=
 =?utf-8?B?TkpmZ2Nwa1A4SUsvQTFaQU9JMjFNN2p2SzdTSnVmN3NuOGpWNDk2YUcxYW9V?=
 =?utf-8?B?bDRPWG9jNlg1T2ZRZE9zc2xUMy9rTDMzcjFJaXIyTnozc3Bzd2dYWFRQSDh4?=
 =?utf-8?B?OFRLT0VvUlRsQndKVXpVQ3FmREtrN3lTL0ZLZkRDZys2ZSt5Y0htYlp2REtk?=
 =?utf-8?B?NFdoUXdRZS84OTUzcVhrbVU2RFU4WjZsL1pvdjFneVZaR2xlVkllZDFZVkJB?=
 =?utf-8?B?L1BJNTB2R0FFRzFpanhSNVVIUkZuWi9EYzFSZGhHbDdiNUlxRGMzc1NNVHMz?=
 =?utf-8?B?YlVkVXdZaVY2TnBBQzhuTm1GUjVTTVZZNHFHQVJqRkt5QkJJYzdxdytpVDBn?=
 =?utf-8?B?ZUR0ZlQyRUlkQkZtSHB6djJWVUN1VEswWVlrdllmSDhTeGJhQkh3S3JqTFNk?=
 =?utf-8?B?bjZtSlJocDRIbHpPL1pJNDdZdTQyRUVENkw5RWUxcEVXS3JnY0gyQzMrQXZR?=
 =?utf-8?B?MzcwVUJQM3NSTmdNU0hTRkpQZzIvakRsTlo1Q29iNVhSSkUyaFpPT1FYUUx4?=
 =?utf-8?B?UlYwZVR1N2ZTWE9ITjlWeVBWWW9RZXdWZWN2cmpUVjlVdDAwSXFZR3MrVGVu?=
 =?utf-8?B?RjhIekd0ZHBOSnJOWS9CZi9Uc1FCQzBTUjdjMFlEN3VnNlVvOUZLM1hHUXVw?=
 =?utf-8?B?NXlhSVRpZVEvTVJOalRHN0l2SmJkUHE4ZWNSU1JTK0FaL1NINW94T3VkYUxY?=
 =?utf-8?B?eFhUNzNlUTM4QjVqOXduM0lvSTNHMmpvSUgwRGJHZ3d1ZUFueGwyeDMyQXZW?=
 =?utf-8?Q?t7Ov7SfO2SssYGaZL3Twgmbk1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fbb89b-6b52-4270-9c13-08ddafa4ddae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:47:58.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6trJyHky3xquCqsCqoPvHuDmRn8xt2W/FWM+yUuePNadEfK8FH7wv9lKPzjQhY5XD7BFWTzLYOD++uI0Q5feAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

Hi Sudeep,
On Tue, Apr 22, 2025 at 11:16:44AM +0100, Sudeep Holla wrote:
>On Sun, Apr 20, 2025 at 10:09:44PM +0800, Peng Fan wrote:
>> On Thu, Apr 17, 2025 at 03:26:42PM +0100, Sudeep Holla wrote:
>> 
>> >Revert to old behaviour and driver request fw_devlink dependencies to
>> >be created if they rely on them. I am not sure if that is better approach.
>> 
>> This requires to update various drivers(clk,power,perf,pinctrl,regulator) to
>> set the flag SCMI_DEV_SET_FWNODE.
>> 
>> Using SCMI_DEV_NO_FWNODE would avoid updating the various drivers.
>> 
>
>Agreed and good point.
>
>> Anyway, you decide which to go :)
>
>Still undecided 🙁

Is this still in you list?

Thanks,
Peng.
>
>-- 
>Regards,
>Sudeep

