Return-Path: <linux-gpio+bounces-16298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA3A3DAF8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0C8166A99
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B39E1F76C6;
	Thu, 20 Feb 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ResFTDK0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66003C3C;
	Thu, 20 Feb 2025 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057123; cv=fail; b=eeMcFysXy9lRiAMUpS7iy9cPv6FUC6qGcZw+sEsDK/VCsNOMEn0rOeBNqutoJCuKaoYNPvbLc3JzvXjCVByuGfpqJGkWCLqUMjjbofe9LyYemtKb4cGwvYEK3YEbUmINWUN9taslBH3z/r0Ef59AMoSWLH1rbljlR4tcowOwFxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057123; c=relaxed/simple;
	bh=vM4GlmdB0Y7s8z55d809lf4oPy2XZjN02+c2aoMAObk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WhVUhpC+qnqemJRyXcT+he335gkqJhzCceMt+IMBkxcuLAS5ZV7IQgOgkzJUh4h+ZgiZa1w+I8Y50O/w57JwD2CPB/3qTh/FGQWzWOIYNRSWZF6VrCLE9xlRmAJEFM3Im/kin9ietr1GS/4OBFF3sr9dL9pP0ATtKO3wN+pMef0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ResFTDK0; arc=fail smtp.client-ip=40.107.22.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHruLFTqFkydWasmhLLWqLu1QluNM2mkARGM0ivEePM4gIdpKjv1MfMQHDKBhjLA+xGUmGpKld2TYgVUNnkeNYvdIjDyzQGGsoLR5ksmmwNbrikgwbzk6s5Tkxmke5H4vJ7cRry1GWyS+JCbM1pbp5G2IEXAEpSr8W9K9s3HbMM2uWQ2UgHqFa3maK2GCyXSKCrcfhaDVTSsYhIJteUSz+CMcWnlk+2Y5vnOgsTUF429jdO6kS3h1SNIeLcIf9uOYaz9DG7N+GIOCqoNqEQ94ueZuklTdbFQh+L9frJx8eeiXEg/QTJpxjiq1L11gjK67XB6w00GjWr5N42qK6ZhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57tnFRE13W6w6yK9eycl0g5TN49BYlL5pkZTHM8PP3I=;
 b=t2DJKf5O4YblHqSMPUWIy8NmGAgd5TnavmWsXr1Cs2tgticdzHu1KOAqOh/7iSQoKBzKTA2tQIQ+qvSA+7V5TAVotvThwUz7kVZKtVodGkgDXWb6bR8Lk0z/Ei2YlFSZeC5t+t7dyJYoTDqyC4pA1CqzybFTV2Lca4c5lTnwHO/JRCN0g99Lfmc7hHy55NB04YlXh6/vVf6qKRCFq3YFKBy0KUfzK6tHqdGfNPxKpj/NwN9Z7DCWfB19WgdKr/0jl/haELewwAHWLDEXB96cCF6HDzKixIiG0Ja6QuRVE1FIbA+C3xCnukhBLc+GdeL4+50IbY+GL7ajTHrAMJIOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57tnFRE13W6w6yK9eycl0g5TN49BYlL5pkZTHM8PP3I=;
 b=ResFTDK0q/Yxf7pn275HKeTs4Hn4L323FI5tKT01VuXRjFgjkoNV9LYrxM2pAYUlWcriJ2tG5nnn23iA/todLMi5iIoA22ioq9cgD1GCltugLmPQxFTeyd8zW6xvpkHaikyJg3XTzWUIeU5LmSGfwnF04K5PgPUb5Zd4RT7Cs1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 13:11:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 13:11:58 +0000
Message-ID: <3ce67283-e484-4450-a67c-23ed1e36945f@cherry.de>
Date: Thu, 20 Feb 2025 14:11:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-1-6abbf043050e@cherry.de>
 <20250220122424.GB20111@pendragon.ideasonboard.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250220122424.GB20111@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ea1cc5-9353-4733-bf84-08dd51b027cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkEydGJ1MTlWa1ozbXdlYTJNeVlSeTcvcTJiaXNYR2ZhbjNPOWtqeFB1NVRi?=
 =?utf-8?B?VVRqTjZhWDl0RmlEQUtIUnNwYmNRcHlkdmFudnE3WEpEVnVYaUhqeHljcHJS?=
 =?utf-8?B?TmI3bkxyWE0wSFg0YXJXSWVhRldtaHF1UnFEbmNKOEEwOHNNNWYvUGRoQXFQ?=
 =?utf-8?B?ZVBqL1hRQURodHBkbUFyaG9tK2p0MU81MXJaTjlmU0Y0Q0VXQkZtdXE4aS9R?=
 =?utf-8?B?bTdMc0FiMXhqTUtmZmM0TlVnVGlTOUJOaFFTMnVjUHp2U3pDUUlQQlF0WW94?=
 =?utf-8?B?aVZEY2MvSjNyRDgyb2NjL3A3dUFDaWhPR2FDMGVmeENybjg0ZW9nSDBtM2lz?=
 =?utf-8?B?cXlVWkF6UlNMWWlOK0gwclZ3WXJvOXlTdktxVWhkei9CN3hqWEFqaEZCMWxF?=
 =?utf-8?B?eWF2S01TenIyb09wNnhiTlFhUytlVVJma1Q3cm9Bb3hPa2xuSExlK2kxKytw?=
 =?utf-8?B?VjkyUDE0cUpYOGxuZWQvWGhNeU1XUHNrUTg4eUdRR01OTzM4Q1hoTzNKQkJ2?=
 =?utf-8?B?Z3FOZk1aSHJscHJOc3dUUW1wVERsQmk1UGVTL3psT3k5UDQ3K1RTZlFKSzd0?=
 =?utf-8?B?YmlhcWg0SmNqV1JRTGZWb1RUREQ2YWRmeWJDQjNrOVl6a251amJiYXVpYURQ?=
 =?utf-8?B?ZlVXcFk1a08xM2pVVk9zbE9MTnlueTBLVXhzOWlNQ2NKU2EvY3g5RFZmV1Za?=
 =?utf-8?B?bnRoeTF3YmFqUFFDRm45Sy9FMmFUQ1RyYW43UFk3dVFaOXBXUHdSSEZPaFhQ?=
 =?utf-8?B?Rm84RnVNUUtEWThtVWJQRDI0cDBqbERCTUJTeWZRSFFlZWVQZFdGYnp0a1Zi?=
 =?utf-8?B?clNUbk1wYTdqeWlUSis5d1c2TFhwRFk3T3dCWGd0SnR2MG5WVGlvakVQMWhm?=
 =?utf-8?B?SytqZXJTajFoaGhXZXVBV2tRaXBQZjd4ODlzRnVjUFBuSHhUeWIvd21YT2My?=
 =?utf-8?B?eGhKSXowY0FwL1QzTWhrZ1dpbWNuYkQ2UkV5ODRHTzZacytSVUE0Z2lpNjNp?=
 =?utf-8?B?NWYvSXpwc3MyTHRudE1XVXRzUnhWekJJZFBxcEhwcDgvQ25rZWM1MVhTeFZo?=
 =?utf-8?B?Q202b0E1MFVpQmFya1hvdHlxaU15NDJsTW5NZ3JNZlROVmMwQ1pLRnNDcStY?=
 =?utf-8?B?VGxkNzNPTE1oUWwxQmIzZG54VktBcVRLcHV1ZHBvVmYweTEvMENEdmFKSFZB?=
 =?utf-8?B?Mzhad2p6UWxvUWlleWxTZ0pxdEw3RlZqTkZoaWlrNmt2NlozLzFLQXNZTC9H?=
 =?utf-8?B?eVpzZS9raFlSa3Z1ZFNQdSsyZzBGQi9TdmpUeGd6aFUzQW5mbHo1LzdXaDRO?=
 =?utf-8?B?NE5MRjhGOHRqOEt5RGthTVlWR3U0ZW50c3ZhM2Jaam83Ly9xMzF3eDlBeXN4?=
 =?utf-8?B?V0UwN3JTbEVLTWxRL3lRNTdHWFdRdCtKUDVVS004M3phNStlNTU4UEdlZ1E4?=
 =?utf-8?B?MnMrdytQeEh0dFpzbEk3elNGRkFRc0VIczRIeGtGTFk4TzgwVXNWVmF5QTFi?=
 =?utf-8?B?T3RJRnoxVjVzdFJGZXVFWnlaSkRXRXIvRERZVmFHRitJMXhKUUphZ0pJcXJ2?=
 =?utf-8?B?MndNVnFHWnRsWDdsTUR6LzhjakZxbXRQUHhCTlBoajRMWGwvcDNvMzNFMTdX?=
 =?utf-8?B?Y2lmMTJGUDNVa29VVUxVUDJYOVkyTzBDcTE1eWFSMUxJNy9hQUJpUWdMeE91?=
 =?utf-8?B?c0NPdnZBZENhRkZFZk1LTklnQmVYdHptN3RwQStEaWRpNzRaWG5MVGxIY0xj?=
 =?utf-8?B?Z05uSFg0RzBUTnhRc05zcWM2dm03czhReVFNeUM3ZEFvbUlIcEtwMlVmMGJm?=
 =?utf-8?B?c3J3U0dHN001dzNOK2I1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZqaTBsVVBjU3ZlM21iRzh6ZkFlMXBUODE5djBGcHFodEh1YTFwRytSa0xm?=
 =?utf-8?B?aEMrVUVKMnFLd2hJQ2hEWXhlcVFrczZWU0daR1BDK2hDZXdYMEUxeWVPYWNN?=
 =?utf-8?B?NkJPTjF3Nk52TVNSMXJiamhmTkZqQnFEamtxeldGWEhLTEN3dCt2QkZqQXFW?=
 =?utf-8?B?dG9INTZWU1RtOFgrT01xL0JpQkhBMndSRkdCWXlYUWs1WHdKa3BlbXNVOUNB?=
 =?utf-8?B?K2g3TDZ6cER6dlJCTWN6M1BSRkg5N3BUdXR6Qkg4OXhxb1RjQzRHR1VPNmgx?=
 =?utf-8?B?bUdTU21rdzgxTzQ5cGN5Ri9DNXVEeEFLQ2dFRU5FMCtBYkl0STBIcWxtUTRN?=
 =?utf-8?B?enMrTUNqSW1ILzBOSC91SDRoZENweGlNTENKOGtWQWFaQTZicjRoWVZMU1R1?=
 =?utf-8?B?S3doeXhmeFBxMDJhUkhTMlFKUzQrNm9kM1lxd1dtaXVGTXh1STJXeVVVNDFR?=
 =?utf-8?B?RkdlT0NDMXhoUzg0RXhINjhqeWdXRkdDTlptMnhFUHVTaDdOelgrQURLa0h3?=
 =?utf-8?B?ajBuSElVVGdScGFnSzVhc3ZVSnhMOHY3RitEYlJubiszNW9mS0dtMXl3d3lo?=
 =?utf-8?B?Tmg1R20xOXdYR0xieThHT1pSMzRTYUF0MHcwd1F4ZGtMYTJLb043UU8yOEQr?=
 =?utf-8?B?bHZZL2ZoZ25uZlh6WVRKczF4RVl5V3YrK3M0UkxsaEd6WndYUGpETnk0REVT?=
 =?utf-8?B?bklZS05BaTBObzE1MW1aS2xnTlRqZ0grVzVYYWFoNFZJK2h2RUhhMVBrcUhC?=
 =?utf-8?B?a2t3T3hubkc3dCtoZlJaSDNSbWpXT2NxZWwvQXBVcFJsU2pwcHlUL21aZ3hT?=
 =?utf-8?B?elJSdGJiUDVodXc3a3dxcHh3NmhpNnMvZjU3UDF1TXlzZ3REV3pHd0o1YnNx?=
 =?utf-8?B?RFRiWTllZXY2K3BFK1gwTFZVUEpuUXpEM1g0WVlqeWh1NlkvS3J5RlNVT2lv?=
 =?utf-8?B?dHFqdmo0bS9RMnRNZ3JMcVpmemRxa3haSFJrUTk0WHhzVm9nU3IyRlVaSDJj?=
 =?utf-8?B?UHRHNE1nRGQ1eHY3OXVvcU85aVYxM2NHRk1vSWpWTlpDRmc3NkdjMkFkT2lE?=
 =?utf-8?B?eWJWeUp4MkZNR0pabEtENlRSdnVzWE80VU9KUkVKZlJrRHcybW5BbkRxWDUw?=
 =?utf-8?B?cnhmOE5vYVRzNjVHN0xtR25EOUVlZmg4VGRHaGFIVTVYNXdidmZZVHNza2dC?=
 =?utf-8?B?Ym9UZEQ4WTJFUDJIWmRJcFlPSElZV09WTk1BeWtqQzdNNFdGQzJibHMwcGQv?=
 =?utf-8?B?V09oWjRLZmQxR1JWT2tGaXRKZTBwa1poOWFMN0pCR1oyTmFRUG1ZV3dYZHlo?=
 =?utf-8?B?ajUxZDN2Yk1wanVieVI4Wk9sNDNUSUp2YVR5OGRTN2VyWjdzL0NFNURvYThu?=
 =?utf-8?B?Qy9MbmJFdXpXVVRYYWdjY3lZM2pDb0p5Zi9MK2tXZ1c0dlZoV3dzeDRLOENr?=
 =?utf-8?B?bDZyZVZ1bDVmd2d6eHA2NU54Qms0OWFBZTVJL3BDcEVNMncxL3JYOE5xYkUw?=
 =?utf-8?B?S1NwT1ZpeHpNQk9UaDJ4MG9FenU0MVJsRElSbFlYSVFEdzFRc1ZCU3VFV2Qr?=
 =?utf-8?B?T3EvSWpmVWhsd0FZUjVYdytHdXlldjJBaGp6Z1M3dWcydUpoRzF0anVRbDV5?=
 =?utf-8?B?ejF4UFFaWEV4QmVpLzVDVGs2eGtOenVqOGdKMllPaTQvSWc4YzI5bVhQSFZo?=
 =?utf-8?B?ZitRRzgydEt4cVc2UkVvT0lVS3g4Nzl0MWFkTnpXV3JWL016M1ViUVVsb1Ju?=
 =?utf-8?B?TG5NdEVydnB5Y0xUMlhNaFpxaUZXYy9wT3Z5bTY2N0cxVU9NbFRuRGxhby9L?=
 =?utf-8?B?YVhMazNVMk5WNmhyZis0SXQvbnBDNSszTElCNXVrMXgrdmIyQ01tUVRLKzhp?=
 =?utf-8?B?enQzUzBwVC9CaGtzTGRmT3FHeXJ0MGxJVHRKK2RJdUhGbE5IMzVweGtDWE1Z?=
 =?utf-8?B?YnlqWW9YeUUxZlp6Yk5zd2IzS0FQZkpVOHBwNUJxNEk1RFVKUEEvZUUrZjFi?=
 =?utf-8?B?c3drdFA0b0lPaTZjejRncTJ4YlNWVVBJRFErbUlUVjI2eFhPOFFUSmpPaSt6?=
 =?utf-8?B?dXFoOVk5MTZ4bWJwT29tNXhneFhvU2lXWlRuSHhTTXozYUN4V05IbXhSVVhS?=
 =?utf-8?B?N0pVSmxqU2xyZHpGUEJlQmRPZnpRVURTNzVaWk01cEZDY1VFYjNMVFhmaEd0?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ea1cc5-9353-4733-bf84-08dd51b027cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 13:11:58.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Jwu+LfJc8TAiQWIXnUfPMi+/lxYWgYpf4k4IP5rc2M2Qg9XytfvZyTPE37FkTvdnGUR8k13iarzKReWpNvfjRWdoqDPaCJlUD9TdE4LBE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

Hi Laurent,

On 2/20/25 1:24 PM, Laurent Pinchart wrote:
> Hi Quentin,
> 
> Thank you for the patch.
> 
> On Thu, Feb 20, 2025 at 10:56:51AM +0100, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> A few of the I2C GPIO expander chips supported by this binding have a
>> RESETN pin to be able to reset the chip. The chip is held in reset while
>> the pin is low, therefore the polarity of reset-gpios is expected to
>> reflect that, i.e. a GPIO_ACTIVE_HIGH means the GPIO will be held low
>> for reset and released high, GPIO_ACTIVE_LOW means the GPIO will be held
>> high for reset and released low.
> 
> I think the convention in DT is the opposite. The DT property is
> "reset-gpios", no "resetn-gpio", so the polarity should indicate how to
> drive the GPIO to assert a logical "reset". GPIO_ACTIVE_LOW should mean
> that the chip will be in reset when the physical GPIO is 0.
> 

Oh boy. I actually meant the opposite. What a brain fart. You can see 
the implementation in the driver too, if I am not having a second brain 
fart, it should follow what you're saying. I activate/assert 
(GPIOD_OUT_HIGH) then release/deassert (gpiod_set_value(x, 0)), so if 
you have a line straight from the SoC to the RESETN pin, you'd need 
GPIO_ACTIVE_LOW in DT to model that.

The polarity of the line should match the reset state. I.e. if 
GPIO_ACTIVE_LOW for reset-gpio, it means the chip is in reset when the 
line is low. It exits reset when high.

I got confused by the GPIOD_OUT_HIGH flag I used in the driver to 
*assert* the reset, which is putting the line in logical high (or rather 
"active"), which is "drive low" for me on all my devices that'll make 
use of it (no inverter on the line, so RESETN meaning is kept, 0V = 
reset; I have GPIO_ACTIVE_LOW for my reset GPIO and it does reflect 
that, c.f. 
https://lore.kernel.org/linux-rockchip/20250220-ringneck-dtbos-v1-4-25c97f2385e6@cherry.de/T/#u).

Cheers,
Quentin

