Return-Path: <linux-gpio+bounces-10185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC32979C9A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 10:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D351F23913
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7D13D52F;
	Mon, 16 Sep 2024 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CW+sF/6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341713B5B3;
	Mon, 16 Sep 2024 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726474504; cv=fail; b=dPVg3E3NUgYCuj1qjpi4p72/F5A3xF5bgomhWj7RHkqvYuiLHgiueVuiy0jCLc1paP8cu30hSl1mqAeo8TGQoOEZCiMMyRQNxKlIKl1FNv8HMfYe94KjrXDaFx6d+WzC/Gj9kY24QcJSaJ8X9ib3iNJmBKu02bbQbYdyEy+num4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726474504; c=relaxed/simple;
	bh=kXkEQ1d75pJGQ41qaMhmtGt6ydPxvQ3w6YDYA9LH3mg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hz9umfrWJGZflINMrhvuQKLSWZlD1BR3VGGCsXnkajhMAFFC1pSC8asdje/9698Mzmx2IBe5Nj0uDX73W/MIv3LsPvxiFPw+Avumokf+rUfKuULLSDIgqTQBUNF27gMT0QnNJh363+ZeInfJ6kP1nfH5/yqLAyrjtdEsBOeRE7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CW+sF/6J; arc=fail smtp.client-ip=52.101.67.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYUFORXBxGYPt4M57YklytGTzW72c84NWAfhj/8xsidhhAAd/El9aoUdTxYtkEv5+iaw/VGmkLFUsLO+vul48L4Ujl0ZtqPFFo10aIjz4hfAQ+ICCj96FHBQWNpVDCTSlKr/MG5fToyVrkZ/7kS5Sbij2lrzzukwipD16uU843acXkKHkRemXBIEOYni15ErcSajpw2hpKGL73gxvjMq8AAuEXgupbw4CEnzt2qlUB+3mDHahF1RDxqRipAzsl0yR0QOTOZLmpavgFsYpqk6eNSx7Ez/BqMaaEPHiNdd9YNxThvfCgax9rb8Ctl/ufSMHHZq+qOiVy8yYtV0rjaFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huZC53wxif6EPy3+hd4kBy7kY7Q97h4EBM5U4Cv1q3Y=;
 b=vtQFtLX649NYxEXtzyAbvfskE0z6UWg8lr66X/cOTeouAjw0yjPzUXVXtFA8zWgM5nfz7XdbzLZq9aGzlzlwbVo5yUzFAYIyx9FvhvCXY0ig1VS+Q3pFp3iiv+vrSVScrW5yZdKmUCroX1NWw+XwTj1qLHYmCTFQIYIpMowi6yxmza7/npMAS5SofWuEPKzQGfVKXLiXucg5MEO7eDz+pcr9Nd+DUKE/ZakKB6OKwu8TE+IbaCrNLdD0dkEVBOffdY8sqKztkvZV7ktOaK8+4dmNHZij0mQEUO1bm3aAxlSD+mHtGEca3jtSxPgrZCpXt1M5yhoFU9DsGVSKYvmgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huZC53wxif6EPy3+hd4kBy7kY7Q97h4EBM5U4Cv1q3Y=;
 b=CW+sF/6JchTy+PeHWKBUXoCdVlCwmf28TfZNyMVRZ6+OqAumAaXHUD7EX4TYD8R4BvSWM1IThTcMAf0Yf38NukIHNMD8DQuSzfgiJ+Gku1V6zFWSkOLFiVwZopmgBQvf6MXIJCCl+69n1IDDNn9bK78bf4oiiISnC3iwUJoHPC9Y7mIE3V6GCmsZJnuryHYvHacktiKUc+kPWJiCEzIxPVf6bH9wj5fEW5ZWfX2sIa3KfHb43QiW/DCLSpy5fSo1nTUi0YtkFEP4If6lU0p+UHW5U7nCq10vN25qqYifSG9AyCe6zXC83Pc6AskQznpOiODuPSF929+o72bGUbkMOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU4PR04MB10597.eurprd04.prod.outlook.com (2603:10a6:10:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 08:14:51 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 08:14:51 +0000
Message-ID: <6be27228-a8ed-4346-a819-3a9d4b1441fa@oss.nxp.com>
Date: Mon, 16 Sep 2024 11:14:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Markus Elfring <Markus.Elfring@web.de>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Phu Luu An <phu.luuan@nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Chester Lin <chester62515@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, s32@nxp.com
References: <20240913082937.444367-4-andrei.stefanescu@oss.nxp.com>
 <65f9ea8f-dd4d-4b57-9c53-cf9a9b475b06@web.de>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <65f9ea8f-dd4d-4b57-9c53-cf9a9b475b06@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0106.eurprd02.prod.outlook.com
 (2603:10a6:208:154::47) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU4PR04MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: b14a8a37-2628-4c81-69a4-08dcd627a33b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGl5TW5MNHdGMHZpUnpsUTUxaXJxVGVCc2ZCMnc5elI0NWtUZTA4MWp0QjhX?=
 =?utf-8?B?R2xkY2wxZGc2NXNHRkplczJjdm9uVWt1WVZGeVdNR1FHcW5SWnNDekZEd2V1?=
 =?utf-8?B?SlhHcGlIaVZxQm04dUVEL3hic2ZlWFZyZmVmRGcxdURZek52T3EwR21jbjA5?=
 =?utf-8?B?MWZVYmltdTNiWnZaU3ZSL1d6QmhrTW81V1BnOEJxdjhJQjFLbVYwUG1DcE5m?=
 =?utf-8?B?ai9UU2NwYy9kc2JXSDVHeVRETWp5NWlYZzhIc24wbENjRVlTcGZKZ1RkbW1l?=
 =?utf-8?B?dmZCa0VCNEhRYW9GK1dGSjdFQzZZUlgrQUN4VnNaT1NqdWMxRzh6K2plN2xG?=
 =?utf-8?B?OXNhdStpQ2JjRVduRTJwbFVNN3BvT0FXelRDWWx2S1FxK0lhNjdjVWsyK2xt?=
 =?utf-8?B?R2VlQk9oZEh5Q0d3eTluYmI5L2ZLK1FDeXJKQjRRWkZDTmJBMndQdXI2SjNG?=
 =?utf-8?B?OVZzQXY1SzJHMXB4WWg4OGNOSmtXQ0F2Z3JRN01XYlNXeTRRZkR4UVhSbG5J?=
 =?utf-8?B?bFlJM3Z6RVBpNEd3RzdPWGZLSTFYamNEblo3YTMyYjh2ekx6WHYreXRlVjQ3?=
 =?utf-8?B?OXo1Y1hKUndqKzRXNUZBMk9Sc3pwZjRMRmo3ZTl5ejhWamQzM1JrdWhJK0xm?=
 =?utf-8?B?T0YvTytTRVB5SE53djhMREdkaWxWbi9oTUtxV1NMWjZ4VDNabUpvOW9tbkp0?=
 =?utf-8?B?Q1pzSWNwRHJvMVZSZ0g3OFRRZDViQVNEY3FFVEdaalJkbXQ1Mm5RNTRGaEpy?=
 =?utf-8?B?WVRqaXIvbzgrZjI0ZTliaDkzdUpYZ1VLeVZPa0RJM0x4L3pERDhCcUxBcWpa?=
 =?utf-8?B?YzV2ektCeCtNT2NnN1JBM3VFRkVUQVpGZ3dBSXF4UTNHVlVIRDAzWHJSYUx4?=
 =?utf-8?B?SFE1NTQ5U2NsaWtWRXVvajJLL2lqZzBaWTNKS0JjNERKTE40OE5Oc3VxYmlV?=
 =?utf-8?B?bFIvQlpRSU50cTdMN1hXSHBxeXlJMHdlOFd6L2FLa1NROHk1UFVVZW5acFNO?=
 =?utf-8?B?NHRQZ0hQTWZaMm01V2UyRThYMGtuYTgrbkVLMGE2dDg2OWlZTmhCVjRDUUpF?=
 =?utf-8?B?Z3RtdVkzRXkzVTVudG5PVHUwTjBoTTdCeHlkL1h4U3ZwUFFCcWFhZ3hMRFVB?=
 =?utf-8?B?ZEVOWTNhUnRrVXpKeDRBN0ZZM1FvTFJIa28vNU10c1pQWlBHYUZWQjBtN3hT?=
 =?utf-8?B?YTZnaTY5WUMyM0Z2UTJiNkRrU2hHdVhmYVovU1NtUmg0VkV3YWRsSWpBYlJY?=
 =?utf-8?B?UUtaei9UbmlnTWJJV1RkTHBxS0p2aTh2WGRUSW5WYklVZXdzMnRnM3lFYWtq?=
 =?utf-8?B?alZFOHNxVTB2UjU5NGYrdFcrOHVBSXMycDNORmN3RFM2OWQyU0hQdGlSYnV0?=
 =?utf-8?B?REM4NnRwN2U2dXFUNnNwMjVVY21lV29Ea2N2NG1TNFBQZm1pZWhwaUhtYXdH?=
 =?utf-8?B?UFBiTGJCVjhtaHZURWlSdjlmOXVmZE9oZC9sU0s2WmNPY2FhOHpvTm54RkNX?=
 =?utf-8?B?S1ZTR25pTm1ia1h0eTBGaFFEb2FGQXpzSkRWdC8yQ25KVHdtOEYwNyt1eEdP?=
 =?utf-8?B?TkErNXRsQnJXU2tnc0g4Qk1yZWRYT1c3TTk1dFpmaG8va0Q0OGd3TzVVa0h6?=
 =?utf-8?B?S2d1cUJ6QUhNZzY4QkQ2Q092NzRNT3RlZGFoNGtPSXhOa2pGbUw4Y3dNSUo0?=
 =?utf-8?B?TFBGM2NjcTFUalNuL09UaGpOQWZsWnFKbXN1T0JqTmlub3VKbzc1c3ptL2Zx?=
 =?utf-8?B?NGtJWktISVVJalR0V0JQbEZncFJpbW5QdXpIWUt3L0VYWEhsVGVGaHA2ZnZK?=
 =?utf-8?B?SWJtTEgrY2ptdGdRMittQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUNXMGZXRlZkNmw5ck9IRFc4UW9jQnBNQ1IvdThDM3Z1bFZudHZJeDkzb0dE?=
 =?utf-8?B?SVlaTG1HWEE1YkdsWVhEOEhCSGRNeXlFWjhmSzFERHBTanVTZzBRbmhHR2Jv?=
 =?utf-8?B?S2RrUjNMczhEOFpIdmpMRUZUNFM4NEdpWDRRVmtYSTkyUW1RalB5bFlNdWZL?=
 =?utf-8?B?S01NeHJPUUZCN21tcktIR3VsbGxkdU9yZTQyZkxwWE5oNFZRK2s5T1FITFdE?=
 =?utf-8?B?NEhadW4wTll2YzFQc1ExMDNTQW9WTHppNHZkTWFaSHplNFZ5RDc1MTg5Y1oy?=
 =?utf-8?B?c2JhcWxoVTYvY1ZmVlZEQ2R5UlJyS3hUOUw3RGd3OGxpK0VsZFdYSnpYSWVY?=
 =?utf-8?B?WGx5eml0ZWxVLzJyV0V0NWtVVVVmVlJPNm1KQUo0a3lQVWlrWUxVcEEvTlcv?=
 =?utf-8?B?S3loMjhYUjFIdFF2OFFDUXlNdHFTWVJMcHkwMmVtZkN5ekw2M3IrNGFvbG9o?=
 =?utf-8?B?M0ZLQmJHM3p5Sk1iMHo5bWZBYWdoQ2JjMyt1MHZLMk9QSGZPT2RJU3NoY0Nw?=
 =?utf-8?B?Y2ZjWjlSOUx2SEF0NDJ6L1Z3b21USzduZ0VXdVJxNlZuOEpkb1ZyMWRmMVlo?=
 =?utf-8?B?MTZuNCswSVNDRFVzS1FENThIZ1B6dnhhQmtLVDVZTE9JVjlvY085Sm9CN2I5?=
 =?utf-8?B?bE1La3l3QkVTby8xNDdSNG54K3pvdzV0K3REUEt6UFZJaDErK2hwNnBOdUt2?=
 =?utf-8?B?SVJRazhFR0lya1YxUkU2OVJPRmtoMUdOemRWK1NoRk92bWs2eU1SUVBONTVH?=
 =?utf-8?B?T3c3V1h0cGpJUUZSSHVmdmJZVjUxNjlUa3Qwc3R4ZUJJV1JVRXpYbjZVWml5?=
 =?utf-8?B?QW14amhEbHZkS2FJUVYxQU41QlRjQUVyQnFoY2Y3NEY3UFI1TDJmUmZBT0U1?=
 =?utf-8?B?WU1CTHhpcjdtekpNZ29XSFhXNzRKR2h1UFZkL2FDVEpiWnAzMThXdGl0VjlC?=
 =?utf-8?B?TmVjd1ROV0JEaHI0WmlBaW1Gei9JTFpIejJpeWlBS2lHWEVZelFmeHR6M3JT?=
 =?utf-8?B?NDg0MGc1SkhXcjZqbVEzeFZrL1ZKb1lkKzBMWmc1cWM4d2N0aW9CTjFockFo?=
 =?utf-8?B?ZWZVNWJOSlY2ekowODlTbEplVlkrQ29xU3pVSHE1L3FuN3IwZDZUK210TGFu?=
 =?utf-8?B?cCtYQjltR3ArRmY0Q2FIMlY4T293bG1iYnRTQXFFeFpmU1d2RDRpVzNlcHNJ?=
 =?utf-8?B?Sk5hVHQ3dGMzOHhaNjZhRUZDOThrUTYzblZYVDFsaFBvaS9RNXJzZnU5TU9S?=
 =?utf-8?B?Y3laK3g3bFNMVDYzTi9WTmNDSnpxSXAycUU0VkJYVXMzMDlPM1Jzb2M3cXlu?=
 =?utf-8?B?aEtjSFNJUmdla2pMVnJYMG5CeHVHTDZMT1VpZURJV0t6OFpQV0FuWEt1eWhT?=
 =?utf-8?B?K0x5b2s3Y1duZCtkM0Y4MGJRRVl3QnJTSDZlWkZPQ1lIMlhmSk1hQ2NwYnNO?=
 =?utf-8?B?eTRoTG5FdVNybStUUTdLS0UyODBuRXoxT1pQd3dLYm9aSUk1RlBwbzRpbGkx?=
 =?utf-8?B?LzBtMFRGdnRmekdBVlQ0Zm9qQUN1QlY5dzF6ZkpCVW9xUnptR2pUd0psU2x1?=
 =?utf-8?B?V3ovWEowbUdweHh5UndYbGRJbEtySklHZkxIMHlzWEU5ZmJQQ3hPbXRsbXB1?=
 =?utf-8?B?RWNteHh4RHBqWDV1RVhSYUM0SG5GTHF4bitxWUNXN2pSbVkvOWdqbmtkOVVI?=
 =?utf-8?B?UG1KSHNFMWpteldnZXo3amg3SlV0Wm4xTDV0SE9kWnRjZFRwRExTdDU1eUlS?=
 =?utf-8?B?Mm02dm9yemtWSU5qYWZGWkVuRzg0VmFta2pYbERSRVY1dFEwclM3RWxSTnNr?=
 =?utf-8?B?SVphLzdaUWFxT3NHV0c1VHVCRE9sSzJvVlNnOUlFYnBVUnpncmhISDkrRDg3?=
 =?utf-8?B?bDJTZTdDZXVWcmdLN2dENnV1eGtmaXBuckRnYitCZmhVYjJ6MTBhU0tQRzlK?=
 =?utf-8?B?eWxrK0tMYWw2NXdDODQxZ1BsSnBZYmZoNUZDNzdwQmtkRm5CaWFWMWdKc25M?=
 =?utf-8?B?TnpMVFloZGlmRnZ4M05Wa21tY2E0cEk1cEN4TkdEMkRZN3J6UjRnSDA2Q3F0?=
 =?utf-8?B?YjR0OXlIc1Q0eWZzU1NNVnZVdHJXN1FkQkRXeFpVVnU2S1pHUHg0bmhsT0hB?=
 =?utf-8?B?NmdiZm1CK0tIZmp0QS9LRDF1WnYwUkRGVDZtRmJkUnY2MElvTkxEeGJZZFRx?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14a8a37-2628-4c81-69a4-08dcd627a33b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 08:14:51.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRjuvov8H3JZ+ryhifbfb/wM2iO7XtKB7ur0K1aXmv/0n5adBZyni/p18KP8/hBUh7ySszAwZ0KcDlgayoZB2JTLJ5BigdI75UkkLMlG7Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10597

Hi Markus,

On 14/09/2024 19:40, Markus Elfring wrote:
> …
>> +++ b/drivers/gpio/gpio-siul2-s32g2.c
>> @@ -0,0 +1,581 @@
> …
>> +static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
>> +				     unsigned int gpio, int dir)
>> +{
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&dev->lock, flags);
> …
>> +	raw_spin_unlock_irqrestore(&dev->lock, flags);
>> +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(raw_spinlock_irqsave)(&dev->lock);”?
> https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/spinlock.h#L551

Thank you very much for the suggestion! I will add it in v3.

> 
> Regards,
> Markus

Best regards,
Andrei


