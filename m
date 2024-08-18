Return-Path: <linux-gpio+bounces-8785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4F955D8A
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 18:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ADC11F21234
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495DA148823;
	Sun, 18 Aug 2024 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="MBdPxl7a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2109.outbound.protection.outlook.com [40.107.249.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5A81AD2;
	Sun, 18 Aug 2024 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724000363; cv=fail; b=g8x1v3fMLeJQMdwHZV5dZLK7YJSkT+ODcpsf93PJUjTxZIL93futnvI5V1LGnDwwu/WZwZiNtPY5iAwNtY+QWzpAdsGauG7ergkWp9SLmcEZzbmSkaRjyMuadAFYNnYJ03t0KX3ZQ2I/hiJsHax6s3mw5J3i6f31Obw18Z24Bhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724000363; c=relaxed/simple;
	bh=hvep3TTSgvuTAyI6a5zWe3QE31UXB3zoEZQRzK2SDnQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OYizMtQugX98koqR39zDBaM6d1vAHVU8KYA7oPmK8tJV61MNntkML9qdBdqdngBAHc05n7r8q/iKB6lXdU+qAU341ZzaSEe9+djEYyU1mkkqNb67GdjtfuFBdhDgfPZHT9OFrzCtZ5NJGCjw96453GMKwEq2WjR5lglP78OVbMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=MBdPxl7a; arc=fail smtp.client-ip=40.107.249.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBneMKtK9HjY7NFll/XVvw2G/JEFfHhO7AMXiLxEdHdzQLvl+XGErnB7XiN1jihrXcieWEyQHjiDGZtBfAB2E4HLKr3/Tx5fV6ekT1/ffwZdIiM+oMDhRaPOW2imKmRdj4kFZMcpB0ut6TVmV8/yB3LkJ+KPejBexjj6aQykx4jnhXhArJELKI6BDSaEDdNN7XXiTWZShToNb60A59SnpeWb6CR+HuCa5609YA3GC2eLX85jkzd8ZXNAuMjBacwdC0N3rCBeaJh7ErovidtH/vk59Jk7/5EUaNG+NoZg0mSqOxM3IolQ7mDlkwrIlRIA3SVQcF4tko/3TtKaFSdxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJxBtRafGF+feOEPKN5P9XLSgcRcWq+TTDBONfDFwX4=;
 b=BHFyQWmlAj3cd+xjNDroTKF8S49bB34OF2RN0Q5tiNfIo/sc2fz7yR4bRVB4xHU+88RdxNTmqzhM+rRfKbFKOjkjYjkZumhkRWrME1gGZ9DfVmgRVJtPADzdi5sGiY01ZBdtLQqq3LcCZrx74xbZmH0CE2Vk+lLbqJHhQczUV0RoG3OCReQLxXy8/8PRQPVSv7Uo//MnJ/pfDv4t9mzs/Nu0cKgEkBXUNc7BWaiJp84u5ipw1vE6IiPJGur6C24jx4Oja3xWjT2lLziDZ0JqBfKgMMZtY8+j9CYNS/fBGw638d3ZTRCE2MweRcVBE2bivvlUoSLX/rXOmLd1UkILvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJxBtRafGF+feOEPKN5P9XLSgcRcWq+TTDBONfDFwX4=;
 b=MBdPxl7acsHBsPvc1f2IohlVaV4DQCuuF4nr5RZpWX9yHm96CewP/iafUOxz9B9BspgWKukT3nS3G4+qfIpbtANkvotHoa9O+k7IaFuElcjLBYb/6jMGlt9eJOEyW4nfv4ANc8spQpNVfmZnz1nJElsmGve2+5Ipu3Z2tPLPGfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by DB4PR08MB8008.eurprd08.prod.outlook.com (2603:10a6:10:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Sun, 18 Aug
 2024 16:59:14 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%4]) with mapi id 15.20.7897.010; Sun, 18 Aug 2024
 16:59:14 +0000
Message-ID: <377507f5-e9f8-47b9-bd0c-d1fb0ffeac92@genexis.eu>
Date: Sun, 18 Aug 2024 18:59:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
 ansuelsmth@gmail.com
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|DB4PR08MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: a2079ca4-21ed-48f1-4f39-08dcbfa716b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTA2SHlCUnYvWGpXQlRaTitqZklOZXhCR1Q3dXBXMCsvZmhZY0s2Q09PdHhG?=
 =?utf-8?B?NFJsQXFBTzF5c1FkeUZiMEZCRzdoMUZ4ME1rZmVTUXdKbVhlejRSZzR2aCtw?=
 =?utf-8?B?WHN3Qzh1SmJGOXQ4UkRucFJXd2toNkFLeHIxUnY5WDVuRHFzVjhGbGhQaFl5?=
 =?utf-8?B?Tmc1VWhGbmdOdm5sVUJBRWhLK3FLSzFCWG91YU1Wd0tkTkw0YXMxTFF6YUl4?=
 =?utf-8?B?MzBHQ1A2dnhMWHVqV01WN0tMUnZNMThQdEVCa280cFJ2MEs0dEpQRFdJUzFY?=
 =?utf-8?B?c0JkV2tFRzNaaUtyN25kZ1h5b1c1bXJlRTZQVUJuYW1UbnoyL1lIZTE3ZFN4?=
 =?utf-8?B?ekthMjRGNUFiZDB1Vm44WG8zWkNJNWpFdHQ1c3lpWnRtQ2NSRENRamdBTy95?=
 =?utf-8?B?a0Nid2E3Q05CczQwUGxsZVpGeGxlZWdtb1BIU1QxYnUyOGlIdUZESDBCKyt6?=
 =?utf-8?B?bFA5dUlscnJJWVhFNTM3cnV2Y2FHd0NjZ09hNVJIaTZrYnU3ZzJwRXpmaDRE?=
 =?utf-8?B?Y1dyQ0RqZnVMaVhoYnVaZENSR0ppV3pNaXNaZUp1eUQrNDN5Mmo2T21oSlk1?=
 =?utf-8?B?WWJrOE5ZSzh4ckxOWC9pWnRjcmk3Vzg1bjZ5Mk1wYW1ONERLb3NHRmxNUUhM?=
 =?utf-8?B?LzIxYXNkclVoWE8reWgyU3cybGY0bTRqRkQxdzc4bTh1dDFTY3J3WnBBMkF1?=
 =?utf-8?B?VXo2bGlmZzlUZkZmY21WY1kyZFY1d0dsU213L3JQQThaUFl2cVpNaTE1VHZY?=
 =?utf-8?B?TldlSkpFdTU3d00waFc5SWgzSW1aMW5kT0swZU04Mkt0TWI1R0dEOURmUkpJ?=
 =?utf-8?B?TkR5WXdXWnB0aVdNSDRIZms0SlQwYVpTMGlQdlpXRXVuaGJseXZmbllFQy9l?=
 =?utf-8?B?WWtCUWJtMFhMZUhSRzNlRUl5V1JoR3ZHRXhDMEplZENKRDZWSlBqVmZ0TlN4?=
 =?utf-8?B?QTVzUEY4dHpUZUFQNHFBeFE0dUNMMDQyL2N2R0pvNmJjVENielkwdDdGZ3NM?=
 =?utf-8?B?QkVvWks2VnF2NXdjV29SUEduM2d0L1BETTVRcml6aDhzMUVhWlY4aVNoQU1j?=
 =?utf-8?B?Mzh2NmJiVS9oQXNjVnk1NGxEeDhWNitjZno4a1NvQ0lpSWlwS3ZSQzcrR3JL?=
 =?utf-8?B?Wm5FOThOdVExZ2t5VjNDaFFMT05IUTlCUWhzRUxQZUF1NnErT29VN0lUVEJE?=
 =?utf-8?B?TVc3YlhrVUNja2N3SW44NGhHaGovZVVXQlMwSHhnaTFEM0VsZTBuWHJaUmlF?=
 =?utf-8?B?ZWJnYWY2T01VNloxaGR2S0t6OFZvQ0l5eVc2MmxVaDl4Z0NSUXVPSWU2TU9J?=
 =?utf-8?B?Z1A1TU9sanZ5UEdRTUVwSGQ4ZWoxZlJpUDlid01EeS96K3hZUmNMaDhSZ1B2?=
 =?utf-8?B?bkQxaUxYN1BnRjBOVWFBWlJZU1Rua0RDdnFySTBvZnlhUWJSU1hxOEtycGZy?=
 =?utf-8?B?RlprRnNvWEIzZEw5OEN5NStRd3J6M29UMzNGejM5Mlc3ZzJMNC9XYndIRS91?=
 =?utf-8?B?U1grYWNHVU1yaXFUajFIRTc3c2lFdVA4djl0VVF4QytSOG5vNkhKZ0c1c29Y?=
 =?utf-8?B?UG01a1VjRmY2RU04a3llWTN5bzdIUGxqaWlJT0szN2xEUmhGanRLY2ZlYUZD?=
 =?utf-8?B?NFRzQ2tpd1g1MERyV0NRVDJBcFoyVXFFU0RZOXJKUjltbEpvK3Z5L0ttZFV1?=
 =?utf-8?B?Y3BVZEtYMUJKVmFQdWtNRldDSE5zSkM0S3VmK2VvS09XWDRSSWFNUHRKL1h5?=
 =?utf-8?B?cGljMW1vTy9OaFJLemk5YkRXenVOMlFvTkE1MEJxZTliSjg0S3VsenhVUkNK?=
 =?utf-8?B?TjE3d04vcXd4M3lmTnhDQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU5naE1BaVRiVTEvcUZpU0t6Y1RMMVJ2Mlo4K0c2cTl3Q2FIZU5GLy9uRFhQ?=
 =?utf-8?B?K2M5VVpzSTl3Z2E1ck52WXVYc0RCN2ZQRlJVOTA4S1hqaXpaNjFwZGR6QnN4?=
 =?utf-8?B?M2dvWi9iM3lTZWpDODdWSEpUYXQvdHc1UEt1Sk0xQThreXZEOVhqbFlmeFl1?=
 =?utf-8?B?NlU1QVR6SzNlNzFsdWhZenE5emkxTGI5QXNTd29DNTgrTWQ1Wit2Ym5wNTlI?=
 =?utf-8?B?ZC9oNFNkdWhvUHFtRTZvUis1UW1KcEV1ek5SdXBqN1dFZnpPRlFaTFRlaW10?=
 =?utf-8?B?dkpGWWdVZ2tSd0Z5YXBrcFFHbnpVOVJUeDFDZ0VmMUJjNDJWU2FzZnBFMjhw?=
 =?utf-8?B?ZHNwTnhMTzgxWWh3WlVPOC9oNkJnQm9SQ3RRaS9ZMnpBNXlBbE9INjgzZTZW?=
 =?utf-8?B?TFlXVTFBUFFITzZqenlwcDVDUkF5S2p6ZTFBSFd3ZVF0dythSG1IMDBCTVgx?=
 =?utf-8?B?S0JBMzZJUW92dWc3Uy83ZEw0OWFGb0IzaGtjaWI0cTd1VThBVFpIV1U2c1BD?=
 =?utf-8?B?alM0cERIZzJpNkJneUtkM3JvUk1FckdUOE9hR09HNXAzWUhmRmczWjRRN2pk?=
 =?utf-8?B?enF1YWpIM2NaOVZGVnYxaERFYlp3T0FBZlhxcjA0ODRQSHpYbXVNUlBnbS9q?=
 =?utf-8?B?NExScDY0R1o2OTFDSllxQWZWcTFnRUVFckdGcXY1WVRsaGwrZWNtTTM1Ry95?=
 =?utf-8?B?VmtIZzJ0NUw1T25RT1dLbHdXZFc4SUg4NmJMTDYwdmtrVXJwemxNc3dBaURI?=
 =?utf-8?B?VFR3a3ArQ2ZPcnJDUHltYXU1RU81dWNmRlN4YWZHcldmcngvcjNXMGN0YTJZ?=
 =?utf-8?B?VEx0UGhwbVlYTktKZnVjWnE4NWNHV1NwL1pMaTRuVmZkemJxdUVBYzlHZ2VQ?=
 =?utf-8?B?a2RYN2FYaGZkM2RpTHMraVlSTFR1ajFvdEIxelNvdXVyc3UyYndKckYxNzJY?=
 =?utf-8?B?MEh4dXl4ZE5mc1cyMHA1dDhkQmhiWEZwNUdqRlh3SmZXb1FvT2xKM2w2MkVx?=
 =?utf-8?B?Z0pIOGVJZXlPaklsNkYwSXkxbEw5UC9pOVA3R013REtBVFJkWk1yV3JTekND?=
 =?utf-8?B?MDdUUFlHQVF4ZXNRWXNaSXduem1VbEdTblB4WStLNGR2OXJObjVuQWlXQ1Z2?=
 =?utf-8?B?OVBkQlB0bjFOS1Z2VFlHZStjT1BldUt2b2l3M1NHNkFhNzAzUEFkS0lkUTdx?=
 =?utf-8?B?NUxya2c3QWtFUFlna2trM1NJL21OMTRaa3ZKemlUN3hYdGpOY1FtRGxXbXk4?=
 =?utf-8?B?Vm0rM0xCTDZDb3BtcTBZNGQvZ2lDMjdQMU43ZU4zR0NRNUV4cTBac3BpNW1o?=
 =?utf-8?B?TmtIS3RMUHVudmlBK01aWlpLQXFwckJKSmx4amlrdHhkV2p4QmpzbCtLSmMy?=
 =?utf-8?B?SkR5dG9EN1hWYXVXT25jT2VweTlrbmZHQVRkaExtVmo5aUFObEFsM2ZMTnpY?=
 =?utf-8?B?UFZWWXU2ZGcvZU1qUllkYllIRmlqNFZMcDlMYzVMSExZbHlPQWFoeDNPSmZv?=
 =?utf-8?B?djZWN2tXcDJaTnhLcElDRFZWV1FPT3FNWEV4MUNRYmFTL0krR2lqUkZqekFr?=
 =?utf-8?B?em1OYkNZREZWYXk2T284WEhKRmZleFJUaHJWTXNFWVh5a1ptZmNmb2dSNUUx?=
 =?utf-8?B?b3RZcGVNK3dzRFdteGt0UjNENWpKWVRwallPNHRRcmJBSndWWmZXbDEyU3VL?=
 =?utf-8?B?a2NPY0tlZFB0cUhEbWlYWUtxQ25wbFVGMzY5c3BrWEk2eVBrRkhiZTMxODVR?=
 =?utf-8?B?RCtYaUlyNHJ3TGFOODA3azJLajc1T0kyMURnM2dDUndVSERTVDVJMzJwNGNs?=
 =?utf-8?B?WEVvUk5KMXhiZFZMVTk4MTJWT09FVUo3Z0RLS3Nkd2twK0xrQ3pVY3JQUlZj?=
 =?utf-8?B?ZDh1T2V3Z1laQ3VvTER5ZitXYVdQbi9mRXdPM1FxQ3Vrb0tpaHhDY1NkNDlk?=
 =?utf-8?B?M2pXWk1wdmpDdlI5Zld4WnpDVDFadDdLQW1ndWZqd0RCMXZ4czZHUnp2LzVt?=
 =?utf-8?B?NS9lSklpU0ZZQkF2Q3ZtY1NDNThXb29ad0tVZGVKb2E5TThXWit4VlZaek96?=
 =?utf-8?B?QWRQVDl1MmhDVURFYWZ2Q1dqS2hIdGorNkovZDFGVWFGN1RaWGtCZ1pZTS9z?=
 =?utf-8?B?bmRmT3B3YXRpbCtPYzBEY3dnblpWL3F3ZVlvRXdqN0pLckpUeS9vWkIzVmdC?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a2079ca4-21ed-48f1-4f39-08dcbfa716b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2024 16:59:14.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ3jYYcJVAv5L52czkGxxZdLgmd+lC1sH3N86VeHSKz56zZ7Ks0Fd8YmHwHT1/hNaZ7ejC0TeehOQCOlSoGmWn/9HB80P6MDyc9g3RFFA9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8008

On 18/08/2024 18:02, Andrew Lunn wrote:
>>
>> Hi, per my understanding there is no public datasheet/register reference
>> manual.
>>
>> But here is the division of regions of the registers in the gpio block and
>> how it is currently divided between the drivers (according to my current
>> understanding).
>>
>> 1FBF0200, gpio/pinctrl
>> 1FBF0204, gpio/pinctrl
>> 1FBF0208, gpio/pinctrl
>> 1FBF020C, gpio/pinctrl
>> 1FBF0210, gpio/pinctrl
>> 1FBF0214, gpio/pinctrl
> A typical SoC has multiple instances of a GPIO controller. Each GPIO
> controller typically has 4 or 5 registers: In, Out, Direction,
> Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
> contiguous, you could have one DT node per controller, rather than one
> node for all GPIO controllers.
>
> If the hardware designer has really messed up and fully interleaved
> GPIO and PWM, it might be better to have an MFD. The MFD node has a
> single reg covering the entire range. The MFD would then map the whole
> range, and provide accessors to the child devices. Hard code the
> knowledge of what registers are where. Given how badly the hardware is
> designed, it is unlikely it will get reused in the future, so there is
> no point putting lots of stuff into DT. Hard code it.
>
> 	Andrew

Hi, the pwm driver could be re-used on the EN7523 SoC. Future Airoha 
SoCs will most likely have the same ip-block also.

MvH

Benjamin Larsson


