Return-Path: <linux-gpio+bounces-25734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3BB48D05
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E9A7ACF1B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4897B2FCBFC;
	Mon,  8 Sep 2025 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="r6ErgcKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020101.outbound.protection.outlook.com [52.101.69.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6A2FAC0B;
	Mon,  8 Sep 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333536; cv=fail; b=SIQ26Z0zscwKFqzdegHFkLIK6Qa8no1yVUruTYnTw3JwbnbjcC6mE1WYVfnhLiuK9b+F806/Q3RVdAT0DDkBbsNIbqnOXYxT8c8uP9D2EhZk0CW+7iaClFyZ4Z5YMGIQ4SIM73z7IjgDdPXtcpVNEvNT0EWrn/GchGSSW7wWZM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333536; c=relaxed/simple;
	bh=Zpo83mNPt6BBz9cvJqG3rSCu2sv6FAx8kTKnoN3zhPw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WZSbhANpJKr8R3WHWERnbp5JRZI8ZwYhRHR+KizagdZMNts/pADRD7zO5xOvAH3v1WlbNdOlgScH5tHsIOllMWJid7YCeSukp5iSyUHOKclNfteS+oe2dzgi5v8lw2bZyumWFgls0i6jlIiYYwDs4DIP7/nytFLUz+7273sbD8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=r6ErgcKq; arc=fail smtp.client-ip=52.101.69.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xd19w3nNt2NfhPuIlRH0pMSNQr/EBf+Rn0VajIWAEAy0GRhNjvDv9BeH8KYHwYMrE428X+BCabQwq5VS06uqm3Nwm/nDTzCZ4AmEQAO0rBPUbjQZsuJ3IwU1QCs9JvFSFxCldfVFKTnigQbXgcQQFk0EkT1KDQ/ISp0qcOv2ilCAdWDKLHib78rFQadDyWQLCia03uRQAONmcjuCdpPGpRPIL+vNGjJe8bMxa7VtrGS6Bv+P5Ts/xhV4GOuw6OGXqWRKUiJ461EakCwYUsP0aR2+h8coBWnPz4OnbY8KEVAkwbo0zEPJ3XRXFgYdbDwxclUy+8vhmV00omINM/JjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3AverxdiG8MfOCtqosHciLapPnidCqPzbRCv52paz0=;
 b=OANmn357SavlYZrCZWXFcrGzCtXv/gHlbnVHh2uH9UoQCFLq5MNAFZ+jgu3Iewz5zMhXWczFJO1c8SH3A7NpZHKGxIC+ccSVHR455JZczk6+11q/gElLXai1RlDKylRmg5Nou4vlj2SoYvSe8NdIQFKWch7+af3pfjv0KXQA44800DCdFKPcbvBGupQqyu7bLNRlIL+3UYkT3nr0lyTmlDpZovgCFtMoO3wVEvlv8qM0MY9/9vpYf3kg0gIAFkYXuFuSJM9SyqDRcxaVs0U9zUKyazPXyHmF0CGZO64UXBFhOd+azRUGyuW718wGRsoFRvokCKssxG/teCWzWpS+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3AverxdiG8MfOCtqosHciLapPnidCqPzbRCv52paz0=;
 b=r6ErgcKqiybE3LYbQeLAnIiDw10U+Uf/C4vMugimMxo3AlqJEk6EauO4WSM9Mhrhg+k1H/04eDLKCAaCgqaI27PzgSRvWPManW5h+aSeCic6ck7umDfI1vSduMeQ/r6QBY4ObBQ3+Pvrhh/qvWZgkoWckQJXsIbl9Jwg6VX+thkHwcmj61XYIBJSAUFYMcziCX0o3PeF7YBrltE8wahz2iAHP9e3X1IhZrs7EiEY77z4OBmNA9EUfMscLFNh1u7OHWl5fBS/WOeVw1zfYFmc9H2alQtIMHhrhXTB48w6P9pVDmeiL0A9QqOS9q2u2UAfFfHOL72VxL/XWiLPjy8IsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DB4PR08MB8006.eurprd08.prod.outlook.com (2603:10a6:10:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 12:12:10 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9073.026; Mon, 8 Sep 2025
 12:12:09 +0000
Message-ID: <081b9cb6-f5c6-434a-bd14-c043db752cda@genexis.eu>
Date: Mon, 8 Sep 2025 14:12:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0089.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::9) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DB4PR08MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf8cac7-3383-4a07-f829-08ddeed0ef88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b21oN0lTMGdjQzVweEpuZXQ2SGxOTzV1L1ZkbWhhY2dpNG50RTFVTEtxa1ha?=
 =?utf-8?B?NGtxZkIzQlhIOXI0VVlrMCtDYUVWQjY2MVFnNlprUVJLSG1aMUw3TWIrTHNk?=
 =?utf-8?B?aVR5VWY3TGNTWHd5aWlzb3VPZjFTVVM5Y1pDREd2bDFCaFFxVFFlS2IzZitN?=
 =?utf-8?B?c1Y0emRWQzdKYWQyMk1tcHFzU0RETHdqTFhuTEZDU3BRZlFuUms1Rkw5UXV3?=
 =?utf-8?B?bGxzMTAxcm10cnhsNXVieFk0NXFZV2dPVXFKUzMyc1NPWFFPZkFCb24xS1BD?=
 =?utf-8?B?WlVlc2oxbUtCSTh1TTMzdXFVWDRUU2M1Q3hIanpvcUd4eG0wQm9RNkFtYmpy?=
 =?utf-8?B?cUxZcTlNZUZ4emNPbGllOVRLTVpRTXh3OTV0elVHU1BVdDRIUHZiL0x0NGw0?=
 =?utf-8?B?M0hFZVhPNitvVkxac1poaXcrZ1h5K3RKYkJDdzFzL0M0RnFUUFI3WkRZUDFQ?=
 =?utf-8?B?dDdiNTZCRzJUbUxJYlJYSU5aalVuVEp1ZnF3cEwxMSs0R00zYUJPMGJuWkxF?=
 =?utf-8?B?L21ZT3kvbUl1a3ZsTlRlU2ZwTUllUTQxM2pIeGNodTVYWTBMbmFudTFPSFBY?=
 =?utf-8?B?OXVhY3dRWEp3UEo0TjdZUGtIOUNJdXBJUjVXWk9oYzJPMlZKVHB0cU9OV3E0?=
 =?utf-8?B?MVM5L2VXWExZVm93MVFwSHMvZUttK3FUcWZUaVh0MGRKeW5adGp3NEk5RnBI?=
 =?utf-8?B?NVhBL3JxQVUxV0hSbVpqSUtRdWoyK2RPU3hzVEZ3aGZnN01qand5Mk5jL3o3?=
 =?utf-8?B?UFVma3RscSswVHd6aVRaS041QUFTaFVvdnYvaXJESWhuc2hwekoxbXM5cVRj?=
 =?utf-8?B?UU1IbU45WStSL21GSFE3NFJQbmVPeFR2ZzhjZXdsOWJrRTY0d2oyV0NGRlkr?=
 =?utf-8?B?OFc2cU1FRDRHMzhVc3JkeVNKeVErYm1ZTlh2NjA0M0Ntd2FxdldVbW1acFlp?=
 =?utf-8?B?Tm1QRkVsdDY4MmV6RHNwUWVXSUt3Qy9uSnd2a2pHUmRlZ1hoSUJxWVg4NStl?=
 =?utf-8?B?VVRxbzg3MXZjZWhFV3lKVkRvOEJsdXlrRVI3Tks4eDlJTkFMc0tPOHRub1ll?=
 =?utf-8?B?a29rY2J4MnhkVWRjQ3Zhd2xrNFo2eHNCNFZiRW13VUlzdDREYktxZW43S2N5?=
 =?utf-8?B?eGtmdU82NEdjZERaWVozRE5kWnVBRGE2d2FrSFhLUHZvVnhZZ0VpNnYvSENF?=
 =?utf-8?B?dTIzdm5NQlBrNk1GeWJWc250a3oyZytjS0RjRlBHdU5OcklUaER6SlJtakMy?=
 =?utf-8?B?ZVduQ2k4NmpqWDRObE1EdmJPZW5xRFBnbmhwZ25BV1grWjFSOXNTUHFzT3Bk?=
 =?utf-8?B?WkZyQTcrQVYzLzlBb1prNVBnRFVBWk1pb3dZY00rUmhWcFFqTVRPbno3QTNZ?=
 =?utf-8?B?dnZhcEwrZUJ4cnQ2MmlhSHluOXJhdUlMT01WMDlLL21EbjJ3amNyL0dMUDFj?=
 =?utf-8?B?ZU13S3VadlFTVXRMQThzb3pWa1lsS2hxLzJaOFJsdE5pTmVmUVYvbjJJZlJU?=
 =?utf-8?B?WHhHanBORHJhOUIrZTlJUW1mOU1Hem05WVR5eE1na2h4VWVubkFvRjhBbm5v?=
 =?utf-8?B?RlJMbDNFZWsxektlM05OVGFJUmJJcHBsLzkwNkVPeVh2eDFEdTdjOGVETXJo?=
 =?utf-8?B?UEh3VlV1cDEvaFNPT3FBeWdwWHpHbDZTZzdBYUdVNUVpVXY3ZTNIRTZZTHdP?=
 =?utf-8?B?bkxtOG12Q04ySWhmSnAwVUNteHpoT1FiVlZMakNOTS9uYWRQQUFyMjhRbExJ?=
 =?utf-8?B?QmpUbXhOMkRhcjFnZTVmQnNZaUF6ZXNld2c0cE93MC9YdTh4NkdCN2lwVGgw?=
 =?utf-8?B?WXl2RGNuR01pL04zWngvQjRpK0ZiZG5YbWVCSHR6a201UXBXK3BBN2wwakM4?=
 =?utf-8?B?V2xFTmdXL2VFNys3OC9nVXEwVkhFTzhUNTZnemZwQU16TDlqc214MWJLN2NS?=
 =?utf-8?B?czFEdmtYVThTczQwWFA0eTZIZ2FHc09pSlUwaEcyaEZNZ1lxMytsaEFXUG0v?=
 =?utf-8?B?aU43MnpNanBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWJ1ZitqUUdZTUpKUy9FNUliODh3bGZ5OCtyQWxQL0F5b2FmUFh0MGlQdjBD?=
 =?utf-8?B?dVpwa3o3b083WHFpWFJkbFdYeHFYZC9PTzlEeWlkSGtMd1NVZXFQcVVpdXlR?=
 =?utf-8?B?a3NLQnNyYlMyU2pnR2dUdGhMTjJhVjdLZzJvWWtDSDk4NE1yOEZ4REFNd0Z6?=
 =?utf-8?B?MFZLZyt0ZUlCMEcyWkVsaWVhLzlPejR4NzJTOWlRdE1VbEhYZFpFUDM0R3Nk?=
 =?utf-8?B?WkFxelVUZXdUUEhHN20rWUFaSFVKUjNCRXo0bFdURGx4UVhEUTFSNVpKUkoz?=
 =?utf-8?B?T3B2d3JpS3BGL08xQVJUUFlBTVlWS2ZJYmVvVmFpNE9YNkh2K1pMbTB6TzZq?=
 =?utf-8?B?WmMvazVvMTVxT3p6K3ozNnNuRVRnc1JBRnpYcWdTUmo0dHRXc0M3U01RVVhw?=
 =?utf-8?B?a1ZDNERuS09JMEU1WEsra1JtZjhES0IvZE9hUjE4YUhaTlpMVzFaZkczMVdn?=
 =?utf-8?B?aUV2azcrT3Y2NzRNVEQ1UGdXU01DVFdqK1lnOGxQcHpwTzJnWERpM2E4Vnl4?=
 =?utf-8?B?NG9MbjhMcFgxRmlTeFdZOGFqNGdVdnRtZ0M4UE1tSG1qZFBBR3RPOUgxblNs?=
 =?utf-8?B?NzErZnFoVFg5d251RFlZZm1XaTZNNzErWnZMZFBYU3NuNWg3aHZoSXdUVll5?=
 =?utf-8?B?MVYvQkFmck5BV2kyN2FZeXY1TEVpbURSc2lUYW5pUmYxWXNibnNSNjVsdWZC?=
 =?utf-8?B?ZUYzeHN6Z0JBV3FHZkVSck9ybUg0Uk5QQUlFcG54T056MzlkS0M3ZVUydnRS?=
 =?utf-8?B?OEo2S3FTTUY3L1lid2ZVeXRlVzRXWkYyTmU5NHh1YjZaODJTcDlIVFNHbTNP?=
 =?utf-8?B?SjFNYnpaWGM1YkxmdVIxVFlmUEZjaVAway9iKzhCSkUyL01ZZTJpeWYxN0Vu?=
 =?utf-8?B?RklMZW90Ry85WTUvR0hPeHpBeHdDWS9RWE12QWlTMEw4cFdqanF3aXVIbUYy?=
 =?utf-8?B?TnFUQWZtWkQ5YXRMZk80UFRGVHN0bkVObGFjMnI1a0JUNTVRWWRVRlk2ZUky?=
 =?utf-8?B?b2gwamphajdMcGZuRktXK1IyUnRmZXJXcG82OHdRNDIwQTFMTkF4QVlsV093?=
 =?utf-8?B?ZmNLV3pidElaZTVTR0k2cXpVL20yWmdhbWM3QjFZZG5GSnRxdHRxbnRoSzZ0?=
 =?utf-8?B?QTRLb1ZFTzM5aTU4TWhOc2xhc1A3b3pSSmp4NDFoL0hyMU94ZnhVUE9va1N6?=
 =?utf-8?B?b0pWRUpIeHJHMFRFRmhDeUp0WUkwNUR0dHgxQmgrYmpKMFZwRkFSUTFxTzhP?=
 =?utf-8?B?aHlDTDZEbjdreDB4R2Q2cUsyT2FpV2NXVGJBcmR4RWRTUXN6U2gybkkrNlJ4?=
 =?utf-8?B?Y29EeExJRU1DbTloLzhuRCs5Y0crUnVaU21OZkJqNU9nWFVic1pKRys0MXVp?=
 =?utf-8?B?dHRzejdqVDk1OWx6MEx5aEo3amN1VlgrWUhkM2k2N2dYZUJtZjZBMHc2c0hM?=
 =?utf-8?B?aFEySUNDT0kwUEplZERCc09zMVBoRWtjZHdZZkRXbHRBWmpidmJxMCtGMWR3?=
 =?utf-8?B?aElxQ1RNc2dFUGZickZjYkIwUGJtSkllYTJqd2RHUklJREQxNGJyREN0VzA0?=
 =?utf-8?B?aWdSdDJmK1Bid1l5UFFxMWZ6cWFrcGJyWUhBeHpaQVk1WXJoU3VYcWFmeGJa?=
 =?utf-8?B?NVFEV1J3SjJxLzRIdm10RCsydFRMdUNuZjh2cjYvMkNuWU52MVdxOW4rUDhM?=
 =?utf-8?B?eDY5RHZ3RU9XMlEvQkpUaWxORTdXNEtSME41b3Z2Ymt4ZitzOHhhL2tXM0pU?=
 =?utf-8?B?ZlJNd011YTlEdWFka1dmMEdVZUFxTUFveUQzN0hicnVlQk9tc2tnK2hQMmtD?=
 =?utf-8?B?SmszTjl1SWJMaytlUmlvQ1JocGorUmpUVnh6ekhEYXBZRFQxWE5NUVpSaGk1?=
 =?utf-8?B?d295SEV2U2Q4M1JzSEc2dGM1VG05T2h0azVNU3RVSGI0SWsvUUg3bC82MTlz?=
 =?utf-8?B?R0Y0a0UwYnhuUXFwRk9qeTV3VTJxWkpiQkRtYmZZSm1UOWtqN2h1eDQ5Y0xz?=
 =?utf-8?B?WVg5NVNSR0E3OXVIYW1EUEE3MmgvdHFNNDNMUUI5dGRybS9RZ2JHeTN0SGhW?=
 =?utf-8?B?UkdET1FkVk1GRTZpVWdndE9KcnhWM2RTVmR2b2l5WTZUamQ0RjhLVzBFY3NU?=
 =?utf-8?B?S043Q3Y3WFVzUW9ZTmZYdDdyZ1oxbEoxQ2VtTE1KVFBEd0M4ak1zeDd6VGZP?=
 =?utf-8?B?a3E3WkVHOEdWTCtFZXB4VXRORlZpTjhvbk5NdWdJemZoUGQ4SVdsL3Y0Unpw?=
 =?utf-8?B?VmVjWk80cGhsbUl0WDBqOU5LdXpBPT0=?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf8cac7-3383-4a07-f829-08ddeed0ef88
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:12:09.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cecVJ1f7KOjUI2GNsDnnODIVA3UObbGLCDICFHh41KTSd5RBSTtZczKu2GnmV/Kn65F+qch/qT/7tI+elTw/8/ehC/YozKvJ1LIiQU4X/MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8006

On 2025-09-08 13:37, Christian Marangi wrote:
> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
>
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.
>
> Applying this configuration permits correct functionality of any
> externally attached PHY.


Hi, the hardware design guide mentions that gpio1 and gpio2 has some 
limitations when the mdio function is used and there is a chip errata 
for the 7581 that also mentions mdio. This indicates that the SoC has 
issues with mdio function to pin routing.

During my testing it seemed like the gpio1 and gpio2 pins where bridged 
to the mdc/mdio pins (they are not the same). When setting force enable 
on gpio1/gpio2 the bridging stopped and the pins seemed to return to the 
gpio1/2 function. Without the force enable set my guess is that the 
bridged gpio pins pull-up or pull-down is enough to interfere with mdio 
bus signal integrity causing the external phy issues.

Thus ACK from me to this change.

MvH

Benjamin Larsson


