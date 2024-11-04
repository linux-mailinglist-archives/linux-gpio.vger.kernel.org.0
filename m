Return-Path: <linux-gpio+bounces-12513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585499BB2F7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D27A01F212B4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF09C1C3306;
	Mon,  4 Nov 2024 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uzUD7f4H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8671C4A1F;
	Mon,  4 Nov 2024 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718679; cv=fail; b=EZmLgDZCXwotfNjL81q+rrjuqdfiuABuB6guyhDtlw+JqbUnshWVLsZyy016HywUvK22iqq9OWioCnLU/WFsgxebfw/DeC7AwQ66XVdNA6GOjaDScOMOLOcwScuBi1dxymEH4mP2bgbyVlQkyD/eJ0B4DwnkJ9l5oT6+J0npMWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718679; c=relaxed/simple;
	bh=aqu/bWBK5tkp5t9hLAz9+Tm89M6OsoE/4Zr+Q0sLuGg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hbxht8MHp1NkKzTWtLqV7HTe3VhwbhECw7F21Rz7pbPeTcotvVj3M5qkScr/LElmUkAxGcRtLod6L8VyFVUM+8dwLTxdKxdnaXAkuyh0DVNjQkq40XyrTW4QzxAZ1blD5eypsxRPkqrj9HhXGKRIIa//gmR2Be3wFeqrvqkxeO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uzUD7f4H; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7nB1i/eC1UndFxbjvXTGnfloHvMsf5Etb+e5F8wvPo3eay48ytmDAtOSMZFV52KvujUVkRJ+ZmStjcdDia3eu05ELJN/08xcqeNzxmVBxBY61qRK5GLKZ8M51PJ+q34L0OOH8Mkp3LWa8gsPp5B+rCpBwFwq9zrK70aPs48dJ9V2HbIxUmFuYhGN7PsWPn3l8mrK8wUlawoqPJNpdQDnFFSEkOJwOsiF+25c1QDLhR6GHMdEwb1d/OwV8+4jlal6vnoajLk2/Z1bR8khukYY53oKE03Ht6vyhEGldvbmWIdpoRv5KfxWmJ9osi8oWKKv6Hkk/DjU8r1b/QlyhG1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyDEO+ZUa+ip9nk3JqDH+/PO7PqQu2CWLj6WvIoqHcw=;
 b=bPwCaj9XqfytDG22KqLreqQMWCbzdfX857Fiw5/LoEz23FGd9fiDRzfrhW0Ur1ioR5pF3rHnpKisc/y/c80eDNyIEb19FDAveFIaCmX4k6KVXXuJcDZjd1I5nHUA7zeDxphGrS3qHkzu6Mqn/dGYEdrkGaNN2qlEycuWOZYCFxPHeB8rfXl/R2ye27E7ZLoW3fkENaAdRyrjnk5P2vfZuAjMiML4CwMdvp0IYBNDI0NGd8m+gYXx9SPIB3mV+mN4dCBL0Cy8iXKwb+rsVTyHhS5Vwrw5lH7XVtE4bDMpxP4Ej0vtJvmoDuIWmcF1MJhp9XsNY/zCs5KzXHwBxkvniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyDEO+ZUa+ip9nk3JqDH+/PO7PqQu2CWLj6WvIoqHcw=;
 b=uzUD7f4H+cWgMAxqKptejBPSbUAv0oGcPiMbsIsyVkM1TnwcPkn4vioqKfUUApWJDktLkjVNLHBsmIHx+DrMcGpb0XQyyQR4rFs26sSH46i5tpuzNRTOuWV336TFDsSY0goNLdJJq3B4cUnBtNk1ltV0Qr6k+FVTucaE6sCKOqY8YKnQWJVjTcztb4/RcHNqizVGklzsv3CciH1qhoJee7WpK+NqtFPwT5GXMCIEGymKTiyFlfIbqqbisnAuZ+dx4AXRR2HqhdK9f47UmJehYeGYkQ5jLr6dG7/5rTqht/Y1eb1p48a2CQ48KITpdHZzFDtdhldNeGpEy//Lo8IqvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Mon, 4 Nov
 2024 11:11:13 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:11:13 +0000
Message-ID: <ef10bfee-dfa1-4968-a99d-d7eaf958353c@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:11:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
 <ZyUZzGqYIabgCFZ/@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <ZyUZzGqYIabgCFZ/@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9448b4-937c-4aa6-9833-08dcfcc16411
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ams1eHZkYTdPNWNYZ3l2dzA4dDhiMnlBcXpuWHFJZXhOMUxOTlU2WnNBZVE4?=
 =?utf-8?B?SnRwaHVpR1VYd2lzYWRsR1pvdHFLV3IxcWlVUnk2RUh5N1k4R3hDT0cva044?=
 =?utf-8?B?anJqV2lPWVVWZ1ZsRE5SeVhzR21SQnVKb0Z1NmhZSDdSM3FnYnY4K1k1NEdD?=
 =?utf-8?B?SlUyc1hZZkJQTVduNnN3VktIZjVDSnBkK1B1YTRuQlFyOHNzbnZRSUd5TjBF?=
 =?utf-8?B?UlFFWVQ5ZnRxaDIzbk5OeWZZRWtBOEJGUWZnWGU4bHk1Y0pEeHlzVzdLbWdw?=
 =?utf-8?B?V0NwMjJvR21nOE9PR0xJOU1UUXVabGo2ajRKbkp4ek9KdEdKbFFOdWZvejZ0?=
 =?utf-8?B?K2Y4dEdMcnJ4VXUya2hwVU50ZUdQV3lkQU4vRGNCSjZWRmFWNk5IeGM3L3RD?=
 =?utf-8?B?cVE0TnRpVkdkWVh5ZjNGeEFGaVNWUzBLQUdYcjNRandyV1dURjVQMjNkU2Rp?=
 =?utf-8?B?RnVyQzFSWEo1cDh4R3puSHRyUXZNa29FZzFsOGJkY0Z6dFpIY09MV2R0UFpz?=
 =?utf-8?B?REdrZUtnZ2tCNDZrKytPNmdXRW1NMXVkZjJDWW10UyttNS9hSkMrenV4czFN?=
 =?utf-8?B?a09pMWxZNTBhR1liOGc1Tm43Q3lYaktNK0dKR2k5blZraG9mVjdUTmRqU2JC?=
 =?utf-8?B?bWhNNnphVlh2MDBROXpOSEhrbEt3akVvMFpRYUdIY2lrWnlGWFpLSzMvRFE3?=
 =?utf-8?B?UkhpSUN6TmJsQ24rUFQzQUgrSWdMWndzKzIzSTl6QXVoRGtGQkorYU5raFpy?=
 =?utf-8?B?NFg3NXlPZG5GUUJjdmIvTzFwMGsyNWtwRTkyeTR0U00yUWdTczlqdDhNSmg4?=
 =?utf-8?B?RjZWYi9yMDRGU0JzbHRnU2RlVVNkYjVCemZHQ3FCeTNBQjZNSHgyTGRGUDlS?=
 =?utf-8?B?QWpsbHpsNzluSTVmaGdSYVBNSG9TVjkwNE1lbThhTUxHSzhNZHJMOExLMW9D?=
 =?utf-8?B?TmxpTFhvOFJoeHhiazVJc251ZlpUYkRLSi9Db0dvUGZUQzVhRktQVWVPMzBt?=
 =?utf-8?B?bVd1a1BENWxZOWQwWFRkR0NGZ0ViQXR3RzZCV29ObkNGOTd2THFMVURrNUpy?=
 =?utf-8?B?U1ArVmtIbDE1dktYVDI3RDZYZUpiYVJoQjFjTTlEdnRXZEN6N211U3VFYkFw?=
 =?utf-8?B?WW5wMzNpZ0w2Nzg3R2lMSSs3NmZBTHgxMkpQUkFFbDV2Rm5yenBJaGdkUnRl?=
 =?utf-8?B?NmV0aFRVb0pkU0xSZmxvTDh4T0E2YUdMSldSV2RCWUNuNlg3cEhwVlF5Q3Bi?=
 =?utf-8?B?emdLWnJMb0E1cHpWVXlhbXdydlR2WjJxdDd6V0U5MWg1UnVQbjVUNkJuLzVN?=
 =?utf-8?B?cE5qQ20rOFhMaE5BTmZXcmVrWUQ2Sk50c1k5TjA4NzZyTHRWVk5ZMGYwNVA2?=
 =?utf-8?B?bVVXaTNpNERTN1UzQ0ZSeGNRYkNHVWtlK0I4VytYRU9TREdUUzJDUjBPb1M0?=
 =?utf-8?B?c0FURmx5YVgyRDJlYllNcGRYZmZ3cUY5R1VJV21BaFRJNUM1ZktQSlZoUkVp?=
 =?utf-8?B?ZmY1SkZyNnJ6STR1OFlYcEdrVCt2dXlNSjNXNVQ5SU9BWlJrZ1BTYmxUa1BU?=
 =?utf-8?B?Q1hXZDloZEphbytGV0ljeHMrTW4vcFZ4cG5OODl2YU9nVnV5Ukd4dGU1Q090?=
 =?utf-8?B?cDJ5MG1pbDVabFYvWVNma0Z2SUcrQWdyR2cwUHlVNHczaWpRcTFNbGlnZjh6?=
 =?utf-8?B?clFBcGg3bnZtbVdycTUrcjZCbVdtYW94VzE3RERWU0RMNEV5bVhOMnExMmh5?=
 =?utf-8?Q?KvUaU0Oj6nDFuY1T6A1EhnUjwlp01hlQWqXtS73?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGRlTmdIdGJzaXRGWktoNGFZalpMVVNiZEMyZzlkL0ZvQlVRZVNPeWJOWmVX?=
 =?utf-8?B?L1AraXFVd3kzUkJyTWN6WG5qZFVETXZjMkxhVXcrdTVlcmtiMkhPNElOQXZX?=
 =?utf-8?B?L093U3RPYW14TGxaakRTZERWaEJyaVVxY1hQclpGQ05SVVAydkxIVkVwUEFT?=
 =?utf-8?B?cWYwN3ZhcE5EeThKa3M4dDJ0T0NYUDUwNDg2QzBySHlXOFpmTFRjSno3YWd1?=
 =?utf-8?B?Q3k1NE4wRUtzYWxGNUlOZjgxL3VwTkVHNWFSbTAxMlQyY0ZHb2o3ZzRDZjBp?=
 =?utf-8?B?M0VFNytPb1ZxeW1ZdEFwRkxXalY4RDA5ZWFKb1ZZWVVVVHBBMjczcjR2T1pK?=
 =?utf-8?B?OE02aEFZZ1lSVkU3bk1iNkVieDFWRzhlOUhiU0RKL2w0K3VMSDNrbGJUbVpk?=
 =?utf-8?B?NlVIUVJvOUh1M1BCR2hkNEpOZFpOYXczM25OTmozQ3VHTDNIU24zK2loakNL?=
 =?utf-8?B?cDFkMmhEU1ZkdGxnSjVldE9wcncwcTd1WU9VUmVWL0NZVGs1TkI1S2ZnalNW?=
 =?utf-8?B?eC9TOGx1c2FVYkVhM04wZm8xUXV4ZzRiUkhRdDRjeksxelgwdzMvZHNDZWd6?=
 =?utf-8?B?UVRGMHljQkNJKzE5aFhqK0RGVGxSK2t4UGJYOWpFWWIrK1FUYnJVNmNUem11?=
 =?utf-8?B?NWVXS0dINzNOd2lJTlVoSDRYQXhyREdXY0I4VUpZaENOMkZIbXA3K0g5OWYv?=
 =?utf-8?B?T21RcE9wbjRCT05NZC9qdDUvUTJCakxoM1g2RUlQRHR0aGxDdittbFI5bjV6?=
 =?utf-8?B?dy84UnI4cXJ4cXpINTN6NDIwdDg4Z04rUGNxYkN2d3dKUXg1aXBTSTljV2VK?=
 =?utf-8?B?NDNJY0ZaQ1J1VndtNWdoTWJlUU1VaG9lU1JLVFI2L3pFSjc2SFZrYUNUT2p6?=
 =?utf-8?B?OGduKzczbGFVR0Z4OVZySUQyK3pBbXNLZ2paN0ZLbE9NNHBETXR4eFZFLytZ?=
 =?utf-8?B?bHowdXp3V29QM1ZHeTNRbVVHWTV1b2o4dTNXYmNVOXpYQWV0TVVRaWdtVFVO?=
 =?utf-8?B?bjUyNTFlRElweGJzY3dWRnVzR254WHIvNHBRZDl1SmZFT0drYm83WHVZUTZo?=
 =?utf-8?B?blpoUE9XSWgyM0RvS3YvdExnaU1ZMVp0TDlMR2ZDUFgxeEdRdlRxNTFIR2R3?=
 =?utf-8?B?RThUb0JtVEZLTW1xbXEwMGtuNnJUR0dCTFpiOXNTRW1yYjBZYVBIQnI1eXFQ?=
 =?utf-8?B?SHkxbkdRRnRUcGUrZUJRZzhXT0xtNVVGdmRMeXpKT3FEY1JITnBMamJGRGdZ?=
 =?utf-8?B?M0FSTlN6TGlWN0VQSHF1T2RHOUtnUld4YTEzNE41UHBualFveW45VlgyaWc4?=
 =?utf-8?B?YzJueXVySjR2L05UTlBZK1pDVGZPQWRwMXFEYnJQYWJWYkVkWldVeW5rU2kz?=
 =?utf-8?B?MVpZWGNMamlpNWd1RlE0ZVg5b2tlQ3FBN0V0MWhXallYUlBpTjdpMEE3NHlh?=
 =?utf-8?B?dkFuNjdPZUtWK2dXV3B0Q2t6ODUyQ3FnQlR5OFRhdXllTkNOWUNiZXp0dVhz?=
 =?utf-8?B?MWZPSmJWUVovbWZzUkRFZzFJZmZEMmg0d05nY3IvZGxFdXY0bVA1RDhkcUN5?=
 =?utf-8?B?TUtqVVBQZHhVU0ZuVGtraGtYWUhVQ0t1b3kxRVl6WXljL0J2R0NLMDBmZ0xr?=
 =?utf-8?B?czBNaVd2MEE1Z2ZkUnlBL3VHUXpoeHRib25oRFJlUzZoQjIybEl0YU5CTW5I?=
 =?utf-8?B?YmN0MHZaQTNJa2EzT3BjT2VqZ1BtNXZmd1p5djFoWG9iaXp5UDZ3REhJaUo1?=
 =?utf-8?B?VzRSRmF4WDZWSEhYOHowZ1hiZVlSQVVrdWlYTG9aUm9PR2NmdWVvM2dRUHhN?=
 =?utf-8?B?Mk1JUEpKVHNMbUFidElNZTREZndyUXp2NXNDSzZacy96cy9EN3VyanZzbWcz?=
 =?utf-8?B?TCttbkVhakhYOVpUc1hIbTgydWV1aVg0ZlBIdFNXUGR2cEg2YUdKYzlGN00v?=
 =?utf-8?B?OFVmOFhya05oWlM4NnVkVkZPQ1lRRnZqUVNGWUkwTGloOGg2aEdOMk5rK01X?=
 =?utf-8?B?RC9KeU9JNS85MWZDV3hGakJFdWdIQ1F1Y2J2TzhaWkZCcXYzOWozV1NWVndH?=
 =?utf-8?B?YUpzNU9OdXdHN05Wd0xjWklWdy9GdEVEZkpNTHc3a1FzQlNZRWM3NTEvL0la?=
 =?utf-8?B?RkM0bHdHTk8zYVd2QXNhSUNLREx2aVNQSTZpK3FaVmtKU3orUUprcWFaZVA3?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9448b4-937c-4aa6-9833-08dcfcc16411
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:11:13.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yy+eimTiSE+ihNQISvrOJW2GfpbWPNjAjtM4t8h5OpP5T5ftm4B/AeM7aZx0Qh2k58sNjMQUklytuVN616Njyvupq9N/MJhlG+9a2MabfZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046

Hi Frank,

Thank you for your review!

>> +      - description: SIUL2_1 module memory
> 
> description have not provide more informaiton.
> maxItems: 2 should be enough here.
>

I will fix in v6.

>> +
>> +patternProperties:
>> +  '-hog(-[0-9]+)?$':
>> +    required:
>> +      - gpio-hog
>> +
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      '-grp[0-9]$':
>> +        type: object
>> +        allOf:
>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
>> +        description:
>> +          Pinctrl node's client devices specify pin muxes using subnodes,
>> +          which in turn use the standard properties below.
>> +
>> +        properties:
>> +          bias-disable: true
>> +          bias-high-impedance: true
>> +          bias-pull-up: true
>> +          bias-pull-down: true
>> +          drive-open-drain: true
>> +          input-enable: true
>> +          output-enable: true
> 
> suppose needn't such common property, if use
> 	unevaluatedProperties: false

This part was taken from pinctrl/nxp,s32g2-siul2-pinctrl.yaml and, if I remember
correctly, feedback from that patch's review was to explicitly specify which
properties are supported by this binding. Would it be ok to keep this section
as-is(with all of the supported properties and the additionalProperties: false)?

>> +
>> +          pinmux:
>> +            description: |
> 
> needn't "|" here
> 
>> +              An integer array for representing pinmux configurations of
>> +              a device. Each integer consists of a PIN_ID and a 4-bit
>> +              selected signal source(SSS) as IOMUX setting, which is
>> +              calculated as: pinmux = (PIN_ID << 4 | SSS)

I need it here because of the "pinmux = (PIN_ID << 4 | SSS)" part. 

>> +
>> +          slew-rate:
>> +            description: Supported slew rate based on Fmax values (MHz)
>> +            enum: [83, 133, 150, 166, 208]
>> +
>> +        additionalProperties: false
> 
> It should be unevaluatedProperties: false because there $ref.

Do you mean to change "additionalProperties:false" to "unevaluatedProperties:false"?
If I understand correctly "additionalProperties:false" only allows the explicitly mentioned
subset of properties from other schemas whereas "unevaluatedProperties:false" allows all
properties from other schemas. I would like to permit only the mentioned properties. Would
that be ok?


>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    siul2: siul2@4009c000 {
> 
> needn't label siul2.

I will fix in v6.

>> +
>> +        jtag-grp1 {
>> +          pinmux = <0x11>;
>> +          slew-rate = <166>;
>> +        };
> 
> one example should be enough.

I will fix in v6.


Best regards,
Andrei

