Return-Path: <linux-gpio+bounces-20632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95DAC659D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 11:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FBA3B1729
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 09:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09D827585C;
	Wed, 28 May 2025 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="f+mTSq50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023107.outbound.protection.outlook.com [40.107.162.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD3152E02;
	Wed, 28 May 2025 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424067; cv=fail; b=cO2sMWWErN8J73QpOPZ1+gnjlR+PpLkvmykcVD7gtwsEzJLDYoO1LfYCDlt2xBjUlvpZBKlcDaH5YkeN4c320rSwIO/ukWo7apARe3d7GzAAL8B0wU5ayhk/+pI59bypbCDLNYT+IUnmyV36NGAqFEx0dVDaLrne/543MpWU/Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424067; c=relaxed/simple;
	bh=clsLgmbXMrG8mK9z9LgmXIBBuv3vvTFemmavVBWFMTw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dSrCu258Y2RxUm/OErY8PfvQYWWs13G9O9MevcAgWq/IyIU3sJr7so4fH0Ch3b0N+w39zk9ygzkEMO1uQ2wImh08x08xpuKJIEf53RUjnQPeN0/uT/Ll8fMOBJ/E4cCMsFL3FUtB5U3TCpjFYjEJEsK57E12ZS5ZjfAQzeOX87s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=f+mTSq50; arc=fail smtp.client-ip=40.107.162.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhTFZKSL45k5WDvxTMpKap5zOZxC1hMKNX6aeUp0+N6hHSyS9hrpagYw+lQnpZWRAbjUT0n5BIzSVifK5n5RZgmGxqj/t3RuYo1yYPGR/wbDnsJOBbhK0NQp9JWf2P2QAvOEwqpCTbRbH2vH3brScPs5M456Ab3okO8HxujoZ27M9obNsVt8Er9bCRWzVyY1hanQaaBeAiXI+ocNVXiGtgEgp/cjxt/mmswpqSxz/uAgFQWPefF2MMIjjYgezEMZkEPf1hFeJDU+EnDPBhBNOoZwNKqlD8tpQWqa481pIhaKT1OTc3LWXsSuT8W4B/Pw0iSX4dY/i9DHPKyQVS6Q6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz/Xh3ZL3C2+Zw0PCetO3VgLrD3Rzu/DdkijnqDwc9c=;
 b=Io6SsJWgglnQDe2lv3aklz8HOvMVQVTJt7Ia40LZ4/ZZsu2h9BTRpTF9f9gkgR+4tW5gtYN3nu5DO7a2jqyjjUFIijGN5laDiKlhMwBUqbPprdbCPO6fLbvgdjYiv2d1WzS0y21lveriDsqsk+WTL2ESrDg5k3mgPMVpJPDegUlVaWN1X3frqPpfQg166sptbJh9xmm0LUdALElaXoB9L5FLWHdXyDa8FB1l6KjZSjGVZOK09mD/vP1t9AgOgVACrRohkrVFFcv85bYpzdCuuH5Tt5207jIcGVdUhuyX0tELPbZHBPAd7bsOX87nW85e+mTZX93Nfg0mOIm83yQMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz/Xh3ZL3C2+Zw0PCetO3VgLrD3Rzu/DdkijnqDwc9c=;
 b=f+mTSq501uEHI8P9WBnZqIRNNPmGqJZAO8JDgPKxVD4zd1BeHhy+soCpZh9h0yRdqMpTzKv0hZIL0yqFLdDuSOHcTQAqxcjm35Ds9cumuPtvahXzuRNLs+ybHDGmhWNZLo81OzRuWC2MlDsyh5LXPsmi3BxlzBcg3N57GZv2SF5i6Be+whDw2slSpjcZ/RSDSCyeQILskjE0HFDswBeSeLEHlPvnapYYiyidkDcEVjEh7j3odqlEoac1tz1U3xH+wUVO9WAqK6ov6Oi0Uy0GZQy+G8+Bd7IWxa07et2GjIQGbzRm3s9sIGiVCXbj6Y0rrSD1HdwT+VKhv3NolFY55g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 by PAVPR08MB9481.eurprd08.prod.outlook.com (2603:10a6:102:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 09:21:00 +0000
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42]) by AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42%5]) with mapi id 15.20.8722.027; Wed, 28 May 2025
 09:21:00 +0000
Message-ID: <b1f58f49-83b3-48c3-8c44-4c82fcd2f69b@genexis.eu>
Date: Wed, 28 May 2025 11:20:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] pinctrl: airoha: add support for Airoha AN7583 PINs
To: Christian Marangi <ansuelsmth@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-7-ansuelsmth@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20250527222040.32000-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:610:33::28) To AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:EE_|PAVPR08MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b36d26-73fb-4ee3-a9a9-08dd9dc8f621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VENyc2JNK1plSTM0b25IWU4zUXFuNm1QR2IvWmhxK3l6bjhrcGJoaVpFb3Ev?=
 =?utf-8?B?Vlo4eHZjTnUyd3pOT1BYZWZEeWNpak1aSnd4enQ2VmZtbzZkb1JsYnBzWndy?=
 =?utf-8?B?NDMzU3oxV2Fzbjg0ZWFhRy94OEZ0MWRKUG5lVVJVdTFvL29wN09ibUhGUWp3?=
 =?utf-8?B?ZGd0UG4raGxYTGdCRloxbWFZNkRocVlmYjdURWNPSWU0bFRUc2Z1Qy9rR0hO?=
 =?utf-8?B?aklabitiQVB6NW1XRHBTOSttRDRWUUo2RGM2LzdEOE5TdTJVTVVTMVEwZDFk?=
 =?utf-8?B?ZndVVjg4UDFuR1JHTm9jekZLYThLREpHZ3RnQXlzK2NOUlNLSjB5UklIdU5z?=
 =?utf-8?B?SkRLL2NkaEVuMUdNNEFuaDMyTEtFd3MrdGVrSk12OFJYeFNFRkk2OTVkcC9P?=
 =?utf-8?B?TWFEeVkxNngvSmVqOE5mYUJvWFlzbDV1MTdTbitMNkVqNm85clFQV05FdjdJ?=
 =?utf-8?B?ZzJBd2ttRVRrb045NjhzeEFhVEZTS3Uxa2FjY0NPdXVlTkhYY2tCUnhIcW9l?=
 =?utf-8?B?V3IzQ1BGdDEzdUJZV1owNlVnSTVETmFxcGNpdGN6cmoxOEUxOGpUR0ZYalQ3?=
 =?utf-8?B?ZXJuS0Z1UUcxSGNXZndZZ3AweWNPZ3RLc05OK2V2TytmQXpuVWdkY0lzdXpy?=
 =?utf-8?B?ZFdiYjRjcUhIbFk2eGxudTRzazBGdDJKaTJDMnNOQThrem1rS0d0cGY5TUdx?=
 =?utf-8?B?a3FkWkREdXRTc0tPVUtXK2J0NzM4NUd0ZDQ0MWROZ0JENVFSd3NzaThyMG5J?=
 =?utf-8?B?TlJIT01FWFBVR2dTQUw1NW5Kek51b1J4dWN4R2l3Rk1uWllhYmVnOXQwV1F4?=
 =?utf-8?B?ZWsybWNrSEkrWWRpamRCQlFJUUl0aXBxaGZUYkVhZUNKU3FEdm9wNUdFNFdN?=
 =?utf-8?B?Wm5sdnYxYjNGZ1RoY3YvS05idzIraWdnZjJycER2S3FJeWlrcDRXS2p0eHJT?=
 =?utf-8?B?c29XcGErMk8vU2tjVkV2WFFJMUFwVURjbUVsb21jQUxUZDlUcHVYSTBNZGR6?=
 =?utf-8?B?U2tVSExHWVZaaVltYjFUQndFWFdnZ0d2MUZPYWp5QmlPbjF2SWZ3RnF1ZlNa?=
 =?utf-8?B?OGgvQUhOdWVBYmU3ZG1qMWxhZmxxaWxjRkU2KzQ2VVpnYy9KVkxQb0hkT0Ur?=
 =?utf-8?B?aDdVVkRVNXVvWjkyaTNkN2YvNHg1ZkpUY20yY1hjdDJscHFsSUVYdkNiQ2Jh?=
 =?utf-8?B?UEFZWkNNMWh4bGlWQWkyRzJVcnh6Qzc2WU1ZWkJ2SVFPOW00VXVPMlUvdkQv?=
 =?utf-8?B?ay8rS0E2dGZZaThmVmV0OFhTeHJtRDNCd1pudXlpUjRkckxWVUJ1SHFCQmMy?=
 =?utf-8?B?NDNXb1dIQ2tYcXRrbVNqSU9NMTloOUdvUDJWYlB6RTZNUXhSRFRPOW1HR0Uz?=
 =?utf-8?B?bVFPYnNHdXVTVVkyQnUweVM4Yy9JVURWbFhiNkpJaWYyS3lzc2h1TXNsQ2Vn?=
 =?utf-8?B?MktLeVBScm41S3dOT0FTNXpaSzErMzE5alZ2NENnOWEwaHhIcGdObWNkU001?=
 =?utf-8?B?UGVSb1Nrd3Q1eHJyUkpIWlNvallXRmlwRW9MUFVKZ0tWT3RFeUhVQ2pzclVv?=
 =?utf-8?B?UmR4VlFTbDlPdWltbjhXYUMxaUpIMWxSV2dqaHdyUTNqV2c0cHczU3pER1lM?=
 =?utf-8?B?QkNucUk4NmFxb0FET0t4dklsMEZoZEFyQlBnSDJhYjV2OVkxQXdKcFRqc0tq?=
 =?utf-8?B?VmFvYnlqam83QnMvOG90MnJWeUl0QnJ4cjltc1ZCRldBaGREcG1oU0dmUHRk?=
 =?utf-8?B?Nnc0U2JZVExUTTZUS2hrUXlqdFBTRE51OEhGdVlteE5VaHVsaEZ0WDRRclZ0?=
 =?utf-8?B?bGE4ZjhFRS9YVENDcnNaekZ0d3pjbnFpSTRVajMwaWdqYUxXRjdwQjY0V1Yz?=
 =?utf-8?B?R2F4T0d3K09LcTNHdFh2QnZuT3l0U2pacGMzdW1NQnh6R3JaM0NUOFFzSE5a?=
 =?utf-8?B?eE5vRjVkT1ZOYUpMZm5kUjN4dDJPVi9IaWcvNGYzYTRqUzRkcUpaTDhuSHFW?=
 =?utf-8?B?MVVzeTZXNmV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktways2SzlWZ1VQbC9VYWg3MTAxbWFEUzlaSkJVeFZKMVpETzRpaVJoaHpR?=
 =?utf-8?B?dTBJa3QzZitHbnV4NlBmVHdoMnZiNUt6eGtEV0NkVmg4ZHVjQjhVVkozN2Fy?=
 =?utf-8?B?Ni95OXF0TmUvUUZZSzhHemRpY0laM0ZOdnVrVFVYL0dVMTNNeEZRak1XTTVP?=
 =?utf-8?B?dU1vSWF5ajRBZlBidTFFSU9CTkFwbXB1K0VjdUVqQ2MzdG90eHZ1NFZNNnNj?=
 =?utf-8?B?U2xGY0FpT1ROSzJkdy9IdFpFQlRVQkNadi9ETU1iWmFHL0NKWnVZcHZaMklz?=
 =?utf-8?B?c1ZtZkEzSWhsNGNPckl1OTFCbXlmYzl1azA4cC9GNU8xb3RZOHhzODBLdHh4?=
 =?utf-8?B?VStzNHY1K1k2S0JYWWR2dzhwOG1ybjZmTHZXTUcvZkREaHVqa1ZWeXpPK3JR?=
 =?utf-8?B?ZlJaclFMc3RkSS80L0htVUl2blp4aG9Lb3Awcm5CZWJyWUo3WHNIWjZtYkUv?=
 =?utf-8?B?cDgwLzhkRUVxcE5CLzM1c1dZVGIwbm5PbVpTMDZ5RDZKU25Pejg0UGxWY1ly?=
 =?utf-8?B?R0FtbHIwOUFSOFlCbFFMS1dQMDJLV3VOaXpSQTBEWmxya2VFZEhnK29YODNi?=
 =?utf-8?B?alVjU0tTMjhvSzJ6Wjg3NmJhQXJURWdYcTFlbW81eFFtNXluWnNnUDJVTnhy?=
 =?utf-8?B?TmZ2MVFYSHcvQ1ltQ3FTenNvOGwwWHp0R3RVZk01NCs1cTVRd3hOcEE3MzRX?=
 =?utf-8?B?MjRNYk1ObVN1N0JZOCtPMjBLUVJTc3FuR0MvR3RqRlhmTXU4TjNkVmUybE43?=
 =?utf-8?B?VmplWjd0TWdCZzVER1RxWTJPZGlzZW9icVg2TVRvaHpwOWd4eFNvZTg2SWRn?=
 =?utf-8?B?VDNFRzJvaHdDOWdaQ05pNFhHek1hSDMvNGRubTdzeDB5bnFDYnVsN2hyOXNO?=
 =?utf-8?B?SnpSUTRMV0pwNDBaWlVMcDUrc0VCWStZdXZlTWRiazRkK0tEWTdZV0VTWWFJ?=
 =?utf-8?B?V2VMbDlWQThXNkJMc0czeEhwM2ZKRUFzNExrVTZEQmVGQ0hnb2oxN05HaXhi?=
 =?utf-8?B?UHBkMFo2b1JRblpGcy9Kb0JHTkpOV1p3MHVKc1l6UVlHa1cvYzl1TE1hNFVF?=
 =?utf-8?B?M1VTQy8wMmErWVR2M0g3Lzk2WUxSdFB3VVBIS1d6UGI3aXpNUm9naTlTVWp5?=
 =?utf-8?B?a0pZenY3Mkwvd1pJY1FsYlM1MDl3elNqMCtxRktJT01aUlZ3RWtlSEc5YkdM?=
 =?utf-8?B?UlhIN1pxY0hlMmd1Y1U5cFdTdWJHSmJWS2dqVk1IOE1NOEJjOXhyTS9NWnh3?=
 =?utf-8?B?aGdBZHJvRGc4ZTJ6OEh2QnlDSEs1U1Z4OVRUQkg0MzVOM3oyaDdZZ0J5cSt0?=
 =?utf-8?B?QlRaNUgzTEtDMkFoczc0MGYvMnF0NW5McUNycVBDM1pHYTgzanZuWnJqamZv?=
 =?utf-8?B?NGJkeVNXOFQ1Z2Y1QnJZclYrWk1oSVZxSVc1dHBHREo1aC9sQmVPMm5Xcmdm?=
 =?utf-8?B?MCtTamRXbGtlRGFoMkd0SW9ta2QrZ3VKQnFBd3pPL2o4NTZGQkxCSWFTVmRW?=
 =?utf-8?B?eHNHalhqcEp1Q0psNXJ2U0ZVUkxqWU1pZTlxdW5Gd1hJajh1K0plQ2tObllu?=
 =?utf-8?B?dUFYdkI5VDJMRDZaYWRrdlF0OWsrUkJZc0Mwd2FERmgxMFhOWTdnTjZMWjBJ?=
 =?utf-8?B?UU1Ha1BucjFXUlBUWUpMREZTdTIybUZyTEdOcFNxTlJmNXJEMGRiMHpPL1dR?=
 =?utf-8?B?V0RWSVlqSXRRQW45UzhyYXBweUFzWUhnRDFQMUJ0Q3VCd1ZpeUpKRjVlTjBZ?=
 =?utf-8?B?c2NJY1pSUW9zLzBDclBNV3JwRlRWMzZZYkFBSnlOa2YwM1BBVVN0cW9IOUlk?=
 =?utf-8?B?WWRlVnRFK0NPU2Z2T3pPNGJnUTEvWjZNZ3RCOWh6S08yRHdFK3ZjdS9rd0ty?=
 =?utf-8?B?V1ZDQVdOeHVpVGlsSDYwZ2VsaDdFNGovMHgwWFhSbUtabitybTBET1JDU2px?=
 =?utf-8?B?UlpxWlRxZzN1aWV0WC80OFlhS21zUGpWVEkyNWhtOHVPd1JRU0NNZHJXakxz?=
 =?utf-8?B?emJaMmIzamVoRm1ZVGNVZDRhTkVlZ0pSa0pVNVVaem1EZldJUVhvcVdITVQ4?=
 =?utf-8?B?M3NLQllaRDZFUHNrUnpLSGlsV0xkMk15Z0E4MTJpdTB4L2V5OGxhV29YQ3p4?=
 =?utf-8?B?cVNVNlM1Q1lTNDBRd0ZybnpjeU94eE16R2F4QXlHVlM5NEs0UEdrM0l3M3Yx?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b36d26-73fb-4ee3-a9a9-08dd9dc8f621
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4215.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:21:00.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlZvR07DX5wAbeGmEHkD4f29XxxdMJqnh+vp6YseLoiygCTDIwUfT/+pKrYf0FjlA07+qfqHE/8n0LEtMpIAh9A5NgY0TUu8ExquR4VQa14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9481

Hi.

On 28/05/2025 00:20, Christian Marangi wrote:
> Add all the required entry to add suppot for Airoha AN7583 PINs.
> 
> Where possible the same function group are used from Airoha EN7581 to
> reduce code duplication.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-airoha.c | 733 ++++++++++++++++++++++
>   1 file changed, 733 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index 8c8d5b598f4f..0960649d5d66 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -75,6 +75,7 @@
>   #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
>   #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
>   #define GPIO_PCM_SPI_CS2_MODE_P128_MASK		BIT(18)
> +#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
>   #define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
>   #define GPIO_PCM_SPI_MODE_MASK			BIT(16)
>   #define GPIO_PCM2_MODE_MASK			BIT(13)

Missing are the pinmuxes for the following:

	{ RG_BCDR_FLUSH_EN,	IOMUX3, 1<<28},
	{ RG_GPIO_PON2_MODE,	IOMUX3, 1<<27},
	{ RG_MDIO_0_GPIO_MODE,	IOMUX3, 1<<26},
	{ RG_MDC_0_GPIO_MODE,	IOMUX3, 1<<25},
	{ RG_UART_RXD_GPIO_MODE,	IOMUX3, 1<<24},
	{ RG_UART_TXD_GPIO_MODE,	IOMUX3, 1<<23},
	{ RG_SPI_MISO_GPIO_MODE,	IOMUX3, 1<<22},
	{ RG_SPI_MOSI_GPIO_MODE,	IOMUX3, 1<<21},
	{ RG_SPI_CS_GPIO_MODE,	IOMUX3, 1<<20},
	{ RG_SPI_CLK_GPIO_MODE,	IOMUX3, 1<<19},
	{ RG_I2C1_SDA_GPIO_MODE,	IOMUX3, 1<<18},
	{ RG_I2C1_SCL_GPIO_MODE,	IOMUX3, 1<<17},
	{ RG_I2C0_SDA_GPIO_MODE,	IOMUX3, 1<<16},
	{ RG_I2C0_SCL_GPIO_MODE,	IOMUX3, 1<<15},



> @@ -129,6 +130,8 @@
>   
>   /* CONF */
>   #define REG_I2C_SDA_E2				0x001c
> +#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
> +#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
>   #define SPI_MISO_E2_MASK			BIT(14)
>   #define SPI_MOSI_E2_MASK			BIT(13)
>   #define SPI_CLK_E2_MASK				BIT(12)
> @@ -136,12 +139,16 @@
>   #define PCIE2_RESET_E2_MASK			BIT(10)
>   #define PCIE1_RESET_E2_MASK			BIT(9)
>   #define PCIE0_RESET_E2_MASK			BIT(8)
> +#define AN7583_MDIO_0_E2_MASK			BIT(5)
> +#define AN7583_MDC_0_E2_MASK			BIT(4)
>   #define UART1_RXD_E2_MASK			BIT(3)
>   #define UART1_TXD_E2_MASK			BIT(2)
>   #define I2C_SCL_E2_MASK				BIT(1)
>   #define I2C_SDA_E2_MASK				BIT(0)
>   
>   #define REG_I2C_SDA_E4				0x0020
> +#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
> +#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
>   #define SPI_MISO_E4_MASK			BIT(14)
>   #define SPI_MOSI_E4_MASK			BIT(13)
>   #define SPI_CLK_E4_MASK				BIT(12)
> @@ -149,6 +156,8 @@
>   #define PCIE2_RESET_E4_MASK			BIT(10)
>   #define PCIE1_RESET_E4_MASK			BIT(9)
>   #define PCIE0_RESET_E4_MASK			BIT(8)
> +#define AN7583_MDIO_0_E4_MASK			BIT(5)
> +#define AN7583_MDC_0_E4_MASK			BIT(4)
>   #define UART1_RXD_E4_MASK			BIT(3)
>   #define UART1_TXD_E4_MASK			BIT(2)
>   #define I2C_SCL_E4_MASK				BIT(1)
> @@ -160,6 +169,8 @@
>   #define REG_GPIO_H_E4				0x0030
>   
>   #define REG_I2C_SDA_PU				0x0044
> +#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
> +#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
>   #define SPI_MISO_PU_MASK			BIT(14)
>   #define SPI_MOSI_PU_MASK			BIT(13)
>   #define SPI_CLK_PU_MASK				BIT(12)
> @@ -167,12 +178,16 @@
>   #define PCIE2_RESET_PU_MASK			BIT(10)
>   #define PCIE1_RESET_PU_MASK			BIT(9)
>   #define PCIE0_RESET_PU_MASK			BIT(8)
> +#define AN7583_MDIO_0_PU_MASK			BIT(5)
> +#define AN7583_MDC_0_PU_MASK			BIT(4)
>   #define UART1_RXD_PU_MASK			BIT(3)
>   #define UART1_TXD_PU_MASK			BIT(2)
>   #define I2C_SCL_PU_MASK				BIT(1)
>   #define I2C_SDA_PU_MASK				BIT(0)
>   
>   #define REG_I2C_SDA_PD				0x0048
> +#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
> +#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
>   #define SPI_MISO_PD_MASK			BIT(14)
>   #define SPI_MOSI_PD_MASK			BIT(13)
>   #define SPI_CLK_PD_MASK				BIT(12)
> @@ -180,6 +195,8 @@
>   #define PCIE2_RESET_PD_MASK			BIT(10)
>   #define PCIE1_RESET_PD_MASK			BIT(9)
>   #define PCIE0_RESET_PD_MASK			BIT(8)
> +#define AN7583_MDIO_0_PD_MASK			BIT(5)
> +#define AN7583_MDC_0_PD_MASK			BIT(4)
>   #define UART1_RXD_PD_MASK			BIT(3)
>   #define UART1_TXD_PD_MASK			BIT(2)
>   #define I2C_SCL_PD_MASK				BIT(1)
> @@ -627,10 +644,223 @@ static const struct pingroup en7581_pinctrl_groups[] = {
>   	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
>   };
>   
> +static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
> +	PINCTRL_PIN(2, "gpio0"),
> +	PINCTRL_PIN(3, "gpio1"),
> +	PINCTRL_PIN(4, "gpio2"),
> +	PINCTRL_PIN(5, "gpio3"),
> +	PINCTRL_PIN(6, "gpio4"),
> +	PINCTRL_PIN(7, "gpio5"),
> +	PINCTRL_PIN(8, "gpio6"),
> +	PINCTRL_PIN(9, "gpio7"),
> +	PINCTRL_PIN(10, "gpio8"),
> +	PINCTRL_PIN(11, "gpio9"),
> +	PINCTRL_PIN(12, "gpio10"),
> +	PINCTRL_PIN(13, "gpio11"),
> +	PINCTRL_PIN(14, "gpio12"),
> +	PINCTRL_PIN(15, "gpio13"),
> +	PINCTRL_PIN(16, "gpio14"),
> +	PINCTRL_PIN(17, "gpio15"),
> +	PINCTRL_PIN(18, "gpio16"),
> +	PINCTRL_PIN(19, "gpio17"),
> +	PINCTRL_PIN(20, "gpio18"),
> +	PINCTRL_PIN(21, "gpio19"),
> +	PINCTRL_PIN(22, "gpio20"),
> +	PINCTRL_PIN(23, "gpio21"),
> +	PINCTRL_PIN(24, "gpio22"),
> +	PINCTRL_PIN(25, "gpio23"),
> +	PINCTRL_PIN(26, "gpio24"),
> +	PINCTRL_PIN(27, "gpio25"),
> +	PINCTRL_PIN(28, "gpio26"),
> +	PINCTRL_PIN(29, "gpio27"),
> +	PINCTRL_PIN(30, "gpio28"),
> +	PINCTRL_PIN(31, "gpio29"),
> +	PINCTRL_PIN(32, "gpio30"),
> +	PINCTRL_PIN(33, "gpio31"),
> +	PINCTRL_PIN(34, "gpio32"),
> +	PINCTRL_PIN(35, "gpio33"),
> +	PINCTRL_PIN(36, "gpio34"),
> +	PINCTRL_PIN(37, "gpio35"),
> +	PINCTRL_PIN(38, "gpio36"),
> +	PINCTRL_PIN(39, "gpio37"),
> +	PINCTRL_PIN(40, "gpio38"),
> +	PINCTRL_PIN(41, "i2c0_scl"),
> +	PINCTRL_PIN(42, "i2c0_sda"),
> +	PINCTRL_PIN(43, "i2c1_scl"),
> +	PINCTRL_PIN(44, "i2c1_sda"),
> +	PINCTRL_PIN(45, "spi_clk"),
> +	PINCTRL_PIN(46, "spi_cs"),
> +	PINCTRL_PIN(47, "spi_mosi"),
> +	PINCTRL_PIN(48, "spi_miso"),
> +	PINCTRL_PIN(49, "uart_txd"),
> +	PINCTRL_PIN(50, "uart_rxd"),
> +	PINCTRL_PIN(51, "pcie_reset0"),
> +	PINCTRL_PIN(52, "pcie_reset1"),
> +	PINCTRL_PIN(53, "mdc_0"),
> +	PINCTRL_PIN(54, "mdio_0"),
> +};
> +
> +static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };

I have other pin numbers listed in my documentation (my numbers align 
with gpio number).

static const int pon_pins0[] = { 13, 14, 17, 18 };
static const int pon_pins1[] = { 36, 37, 38 };
static const int olt_pins0[] = { 34, 35, 36, 37, 38 };


MvH
Benjamin Larsson

