Return-Path: <linux-gpio+bounces-18554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571AA82383
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F9417F010
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D5225DB17;
	Wed,  9 Apr 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="TEYbFU3n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021136.outbound.protection.outlook.com [52.101.129.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB3450FE;
	Wed,  9 Apr 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198001; cv=fail; b=UKlGvREadZ13BbnSC8SCHOniA0lSWPEEOXmVhUn6wZ3K4dJhyZo1nRT6ndnYmPaeYsneNl9Xf3bYG7Xg2cauQazdisAcgpoF2k8aLoaotCegx283jtiu07pNkWKJQErpMhhVkHgq8EQEovpwi2BMWvAuW9uV2r5q0BIca58QveU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198001; c=relaxed/simple;
	bh=X0d35a/dwBxswa2Py3B3mdntNB1qQQcc77oOozLOBBE=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=o78otd19uHuvCq8Jeo+w90dPuk2YUpY4vy6ORrVRLLN+e9Feu6oeqqrLbpYvSM7Cm5LTN1KG/8x2eYoUDm9rnaUHiAMh+Hlou2yIXmWUgLr98uZcAl+OMXFsuW4rZtXiqVTXgByBJJX2dWmA+NJJBnxV86EkxAWA955D+G3IIEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=TEYbFU3n; arc=fail smtp.client-ip=52.101.129.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afEyC8aOR4J4LWmJd40I8wKMrvB9MeeF9QNgFxlirtILrbm9+nR86YdE0j4/QRFFjp3iHt33Xw6ESpmSlRXaYkwSaQvlMt1C5wZfYJE+413U4rc1NFjepjnlMc0d1k3F9DUjcFtzF+cjh5MCgZ9zlaa98b/WQk0f6e2EaQJAYuzyFac7rC5z/2RhAH+sCpd3zKRAQ3eemPi2wLa97l3DAV7d74GTi2dLT7dIk6V+34AAtHY00+ZiIpEwOiI9xUu538qQ58mMhPoGP+QitE8W0FAumWZtB7VHS/m90G0txmN8RUddKvXL7ryPJxVPXrammxtEmuZ74DhJNltR6xl99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwEO3Z4Zo2E5VX6iR3hCfldYfFNMnwPJeZGiLi+CjiU=;
 b=YUj5Z2WvSlhwpvpbJ6NLFZ6D1q5+Y+42P56t64SpWUqEYCY8udlB2v6ErlF4CHNDNUi8NyT03Zkn/hfV7EL+tr/UvrAo1Ohli+fxYAZQ3JHkuIdJw/n5hia1BSk6wj/gP6vfk2kjCzfOKHsGNW4hYP6wAIckHSaQ42B7daaEHk9Nc5T5rDAAnstPa3du2H2SzhKZBIB55sIxEMqadc4Ha1DS6Bs4mY012JRIMm0RPHsVRRg3EhLep9V3gRW3I/EotBDAXutb6BT+wxOJFn5e+ADKmNFi1UhZl2e86RtMmJ7znXkfMgShZ803VUxu0ItBMOrxmGZtsxpA8vNO+lj5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwEO3Z4Zo2E5VX6iR3hCfldYfFNMnwPJeZGiLi+CjiU=;
 b=TEYbFU3ndttA9JSg7HL9OQyyeFuBEkCemgGoQdtsxFPgZkrTM2QxGNM2Mc5f0Xhopdjm3puFWVhAjvffqukuuixL3vKjvszk5lrEf4SKQ14SLRKjnnYpJEcRZIOiG66sjp8Rjigo5c9FL6UHzgJmp09h/hd/a7At1vPOInQYRuJY/8amg52ctZS4YXHMuIDioFtQqDiPV1TsFSRsvNC9K4S7NGpIF17DgJz+iTq0lk39jbCul48bpEO+/atFz2sreHYEhksgSBYxg0IPu+r9J+6srgnvt6VVznOgLdrwd+nebRFL95tw89HbkizICvSeUJZdLS10alu2hvTEG+cL0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB6205.apcprd06.prod.outlook.com (2603:1096:101:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 11:26:32 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 11:26:32 +0000
Message-ID: <e0e9e958-2a04-43e8-b2e4-fdc97906fd9d@portwell.com.tw>
Date: Wed, 9 Apr 2025 19:26:29 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0056.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::7)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b59d7b-05d4-4c32-b2e3-08dd77596132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkRhKytVY2ZGOXFQWks3RXpzcG9OaDlweElCdmxCd01wRXRRZldTMGhQL1RE?=
 =?utf-8?B?WER3VVE4emlFREZPTUtnTHJKR05hR3A1L3dubjVNQlcwZ1AxUHpYVjdCRW04?=
 =?utf-8?B?Sld6Ynkwa3p1eTRtZmIrQXlXUll6SXdneUc4UGFIVzNXVXpubXdKcVhtWVdS?=
 =?utf-8?B?TlhFUXVyZDFWRlI5d1g5b1p3Qk5NVWJaNFpreWw4M0oxN3lwWUNXOE50ak0z?=
 =?utf-8?B?YitGK1h5VE5aNE5LTDI5Qys4VHpNRGdEWkF2QysvYnlSd3lQT01EczczdkVT?=
 =?utf-8?B?UHRTTm9rZDZKVGNlaXZkWmZOUEhuU2xZNGw3VXdRMzNpaXRtd2hONFBXSnAw?=
 =?utf-8?B?NktkaHUvSm1DdFUraUhsbGlubFJWUmRLUkoyalc1elV0ZmdYY21abDdTUkFw?=
 =?utf-8?B?bVdaYlh4OGt1UE12MSs3Nm04aXBUTG53OW1IeVRHb3FNOFVmRkRoMnJUM1Ru?=
 =?utf-8?B?cTFiQVFPZU5xaHlONXBuN09PM3B5endmc3U1N2JaNTdhN0hpV2Z4ZlBCWmF2?=
 =?utf-8?B?cjBleXFlWnhjNmswcndVS3Z6RytxT1pXRW9DRTJUR2tURzJ4MnJnQW16Qktt?=
 =?utf-8?B?QTEyY2tzcWU2Q2huWS94K3ViV0NHR0NNNXYvMEl1TFhmTEpHckhobGpIUDZu?=
 =?utf-8?B?UFZ3UjFlZFNPUVcvYlFHaWpWS1hDTGZHdTM2ZmZHVGZwQlZ5QW0rRlJiaEZX?=
 =?utf-8?B?cllnVXh5YWJhM3ozQ0k1bFRBTUMwTXhuWTNVdmtBb0pUd1FWdi9FQlFlZ3pI?=
 =?utf-8?B?TUdPSFNDa0FjM3lGVE0raDIxOEdJT1FRUCt4MFc4TTNORkx1MXJwNUxiaTV3?=
 =?utf-8?B?eUpxMHVtUGlNS3cwK3FJRUpmWktmYlR1alFiV3haU0cxTVNQTm8rTCs2Qmkr?=
 =?utf-8?B?a2FVZ2JwWjZKVXdSbzZIZW1Ud3BtVEFLaGtzbzJYL3dCRGdMdjBWUUJQaStN?=
 =?utf-8?B?ZkI5Q3RLejRHWHhnS2trZ2JTaE9rZWVvL3crK05tN3I4TnlrWGlKejk1Rm13?=
 =?utf-8?B?d1VYcXVnVHdWUHBVU3F5aE10SzZUdm1LRmpjeGdxeEhmcG13VnIvL1p3WHRm?=
 =?utf-8?B?bHhkYlRMN0FLekxzMkpOQkJjZDhrN2V0MWNLT2Znd0hiekZCbG56TEo3TkpL?=
 =?utf-8?B?MjBXWlpQd3Z1VjhiaUxkNUxiZVNFSlNjSG9NbDRqRkdEREtQMFN1Z3Q2VFFq?=
 =?utf-8?B?ZkFiV1FxRWpCZlo5UzdzaHZzdXgzYXRyUjJidFlIb255b3JzaUMrN0pHaW1V?=
 =?utf-8?B?STFOd2xEa25WbGJEU3F5OXhKRUQ1RFBHL2ZleEQrMVpzVjcvV1JYSjVmcldh?=
 =?utf-8?B?TWo0UG4wRE1pOEVJdUUrOFZTZDFIMDNHajdDVjdrWmtqWmM0S0VOVThKbzEw?=
 =?utf-8?B?TXZQdGh2bis4N2Z6ajVwa1ZRYUxkUGJURmNqSjhhNmpDaVBQQnhsS0xMdFps?=
 =?utf-8?B?M1JZZm9EY3dWcmsyQjBHS2FsNnBKR01xV0V4RTFmL2kzRnhPNFNsTHN3NStq?=
 =?utf-8?B?R1BiWGZXblh5MUlMcUcwNWtENzR4VGdScG8wanlaQWNkMkFPekJ4WlhWeTF2?=
 =?utf-8?B?Yy9LbE1PR1daNWxCWGZQSDZVSXRSSWFyMmc3a3pYY3ZRV2VobVVwMzQvOERI?=
 =?utf-8?B?d2pMV0oyZXVONERSa0hwdWg3RWs1RVRMUEp5Z0JMeEJNaitSQVp6c2o0dmk1?=
 =?utf-8?B?cXFtU210ZGE0UENCeGJQMkxCU2tMbGY2R09sbzJBWmZHV0dYbFlsMWpzbGdh?=
 =?utf-8?B?L3BvNkVFdUJSaW1zOGgxOHVZVHN2azhvYk95UnpGV2dVT2Y1NGREbXV1RWlx?=
 =?utf-8?B?MUs4cGk5MlJ6SW1IdmhoQ0NheDE0dU5acWp1NUxIUGFTek92bGpXVXEvTHVi?=
 =?utf-8?Q?GZvLFzW/nDAWB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VOY1o3KzI2WW1jeXRNcVJ5RjRVU0VxeWRvOEl2SVduS3BwbS8wR2Jhek5v?=
 =?utf-8?B?ME1OVWJQcmlTWGYwcFg1aWsvNWhHMit1bnlDNytVVzVnZVpkREMxSEQ4R1c4?=
 =?utf-8?B?L3NhUkpsbm13cDZZZVF1RXFHVEhOUHVGWEYvKzhQSml3eXhRZERYRjI4UUdZ?=
 =?utf-8?B?TEtSZ3dGcUFPUEMwOE16RzA1VlpjYkN4SE1RcThFbjBzaFoyT3hWNTN1TmVV?=
 =?utf-8?B?eVFnZU1RUE95S1Y2WkRvQ09RRDlRVHhhdCs5RTJVV01Fbk9wYjQ5MFpCVmt6?=
 =?utf-8?B?ejJscDJpMm4vb0QrVThBMmFKc0xaWGZMeGpnVUZHS0xwUnFoOWxKMXBKUXRh?=
 =?utf-8?B?RmIvYWxvejZqdTRTUG1VOGtMbkdCanMyR0dCNjdvbVc5V0N3dnMzKzBod2dv?=
 =?utf-8?B?aVVTZTYxQVIzUEZmMFZUTlNLWlZDUEErb2ViWmRRckFEMi93WGo0TjVsN2ha?=
 =?utf-8?B?WXFkaGV6YTR3K2ZZbUgwSTBSZERBVVZjYVppaVlBTUcyUDV2bUk4eGFVeG1v?=
 =?utf-8?B?TGFqMXJjdVdvdnYxQVpSbmV1NWJoK3EzZk5NT0hRbW04ekFaYzZVcEd5a2xy?=
 =?utf-8?B?K011VUNaUCtNRWw5Y0svbTVNY2ZHVTI4bVBDY0VRUE5kbU92NHVTMjZ6cTA1?=
 =?utf-8?B?QnRUeHlRUGtzUVdhVXZ0blhEd2hzdTVRRVYrZmozdkppVmVlRSt6cDBiSm9v?=
 =?utf-8?B?VCs5OGxNbmNuZDZqTjN6TVNMNlFZSGlMUWhqYkF6dWZNckRBbzhrOGJoUDlw?=
 =?utf-8?B?N1hLd3dFdkl1QTRkUXkyc0tsZi9kWFVib2hjUXh6K01jclhjdHZYK3g5bHQw?=
 =?utf-8?B?ZmIvd3V5NmtiLzV1bHB4MnZ2aTRZZXV0eE41eTRyNXdIaXNSYXNKU2Zva0p4?=
 =?utf-8?B?c1V1em40bElIV2lRZTJBRmxBQ2hrY05oUUtrdXEvQXBkYmZvdU1PSkswODlC?=
 =?utf-8?B?YVNMNlhjNCtUUVVnbzZEbGY4Y2dvaGNWWGN0VlNiQzRRSEZsaDZhdzVWYXNN?=
 =?utf-8?B?QVZhR2tJWGxqS25KRVI3d1ptV1Q4azJMTkpQWEVrV0d3VXBwa3NDSHZKcFlV?=
 =?utf-8?B?b1R3WFp5K01sQjRvUW5GZ2p3bWVqeitZdFVRZkp3aEF3K0Rmai82OHNodDI1?=
 =?utf-8?B?aFhPS0hWM0sxMUdHczl6dFN2Z0RvcnhxVG1HcFlhNmxoRDdOWDlka0V5ekZG?=
 =?utf-8?B?ZHgvbkErbWxCSEVENkQxZXRWZm4xSlRsTlY3YnBQRkJndnZQK3BUdGxyVlM5?=
 =?utf-8?B?OUdnYStaaEltSzFZK0dkYWZOTk51ZXRDdHhTTTRxb2dkSnhqWmFyVDA4Uzhl?=
 =?utf-8?B?TDQwRzZ5ZDdkUzNWUFJOUHN2aFJkcUQ2elM5aE0xaUdHTWZZZ0NvNy9rZXRo?=
 =?utf-8?B?UWpRbE83UlhRTkxaZFVFVSs3NVIvZW1oOGdiV1VCWG5mMUlHRSs5aU5hV2VP?=
 =?utf-8?B?M3JWMGhCbGRkNXdvQS81Y3dUSVlaa3ZpaWpXMXI2T1BDZ0I0cFpjdmNSMk56?=
 =?utf-8?B?dlFNMmlVK0VRQ2ZWQ2RiMzk2M1hibjZzQktkcytuTXpBdThZRU5abWs4QURI?=
 =?utf-8?B?VVVud0tEaWY1dEd3VUs5YWlwVTROSGxURGY3WnZYenRGd1JGczdWMGhrOW9k?=
 =?utf-8?B?OUVHaHd5cDhCdE5LeGpQNkprWjNabFBJcGd4aHZGYVE2N1Jrc0dlODF1c1hX?=
 =?utf-8?B?dmhhUE56c3RXTG9IY2lrVlZjWGs2bVF1cVV2OWJBVW9hVjEzTHU1VnhsU1o5?=
 =?utf-8?B?QUxOZWVQT0NIakduaThlZHZoU2hFNUhEb1BNZGQ2RExEbmZWK01UdkdPWC8w?=
 =?utf-8?B?K0RTczVTbWJleDFqalNMcXZBM0dRcXgrejNWYVNxMHk3alA5ZGp4YzlCK0tp?=
 =?utf-8?B?Z3lTZXpDd3U5K2kyeUFCdFkzbVFqbjYrTDlHSndYRXJTWnNXWUsxM0ZTYTlF?=
 =?utf-8?B?R2kyL1p0UHpXdWppTldBc1JvMzFzU3FNYUZFcHZGNUQwRmRqaFl1RnluYS8x?=
 =?utf-8?B?WS9Nak5IRnZDcHBKZ0l2TnlvUmUyWHpIa0tiYk5MOU5xK2pGeG4wL0wyWGVM?=
 =?utf-8?B?NFZsZThSN2t6eEc5Z2liSEFXUVMwTGFrVDU1d1ZVdDVZNkVYbS9qRTQ4SEJa?=
 =?utf-8?B?Q3AwVFpBTlhZYkxxbjAxOGFvV1ExYzlmdFVGaStiRmM2c3hCUzEwcE5yQmlJ?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b59d7b-05d4-4c32-b2e3-08dd77596132
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:26:32.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IddHTuL9QB35RwUJGhqZ3GmsfkUDJW3r3zUVtpnrWJVH7e8nR5KrQwLoMxHd3ZyRXRPgk5uUrY3ml/cRyuvv7Z5Zz/IMv3KJ3ujVzNAd6rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6205

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
V2:
  - Add DMI system check to avoid running on unsupported platforms
  - Add 'force' module parameter to override DMI matching
  - Use request_region() to claim I/O port access
  - Extend WDT timeout handling to use both minute and second registers
  - Increase WDT max timeout from 255s to 15300s
  - Use named defines for WDT enable/disable
  - Remove dummy pr_info() messages
  - Fix several coding style issues (comments, alignment, spacing)

---
 MAINTAINERS                        |   6 +
 drivers/platform/x86/Kconfig       |  14 ++
 drivers/platform/x86/Makefile      |   3 +
 drivers/platform/x86/portwell-ec.c | 268 +++++++++++++++++++++++++++++
 4 files changed, 291 insertions(+)
 create mode 100644 drivers/platform/x86/portwell-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..c52f819786dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
 F:	kernel/time/posix-*
 F:	kernel/time/namespace.c
 
+PORTWELL EC DRIVER
+M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/portwell-ec.c
+
 POWER MANAGEMENT CORE
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..2f26d1bf0a75 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -779,6 +779,20 @@ config PCENGINES_APU2
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
 
+config PORTWELL_EC
+	tristate "Portwell Embedded Controller driver"
+	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
+	help
+	  This driver provides support for the GPIO pins and watchdog timer
+	  embedded in Portwell's EC.
+
+	  Theoretically, this driver should work on multiple Portwell platforms,
+	  but it has only been tested on the Portwell NANO-6064 board.
+	  If you encounter any issues on other boards, please report them.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called portwell-ec.
+
 config BARCO_P50_GPIO
 	tristate "Barco P50 GPIO driver for identify LED/button"
 	depends on GPIOLIB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..83dd82e04457 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 # PC Engines
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 
+# Portwell
+obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
+
 # Barco
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
new file mode 100644
index 000000000000..e94377906745
--- /dev/null
+++ b/drivers/platform/x86/portwell-ec.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * portwell-ec.c: Portwell embedded controller driver.
+ *
+ * Tested on:
+ *  - Portwell NANO-6064
+ *
+ * This driver provides support for GPIO and Watchdog Timer
+ * functionalities of the Portwell boards with ITE embedded controller (EC).
+ * The EC is accessed through I/O ports and provides:
+ *  - 8 GPIO pins for control and monitoring
+ *  - Hardware watchdog with 1-15300 second timeout range
+ *
+ * It integrates with the Linux GPIO and Watchdog subsystems, allowing
+ * userspace interaction with EC GPIO pins and watchdog control,
+ * ensuring system stability and configurability.
+ *
+ * (C) Copyright 2025 Portwell, Inc.
+ * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/dmi.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/watchdog.h>
+
+#define PORTWELL_EC_IOSPACE 0xe300
+#define PORTWELL_EC_IOSPACE_LEN 0x100
+
+#define PORTWELL_GPIO_PINS 8
+#define PORTWELL_GPIO_DIR_REG 0x2b
+#define PORTWELL_GPIO_VAL_REG 0x2c
+
+#define PORTWELL_WDT_EC_CONFIG_ADDR 0x06
+#define PORTWELL_WDT_CONFIG_ENABLE 0x1
+#define PORTWELL_WDT_CONFIG_DISABLE 0x0
+#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
+#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
+#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 15300 //255*60secs
+
+#define PORTWELL_EC_FW_VENDOR_ADDRESS 0x4d
+#define PORTWELL_EC_FW_VENDOR_LENGTH 3
+#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force loading ec driver without checking DMI boardname");
+
+static const struct dmi_system_id pwec_dmi_table[] = {
+	{
+		.ident = "NANO-6064 series",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
+
+/* Functions for access EC via IOSPACE*/
+
+static void pwec_write(u8 index, u8 data)
+{
+	outb(data, PORTWELL_EC_IOSPACE + index);
+}
+
+static u8 pwec_read(u8 address)
+{
+	return inb(PORTWELL_EC_IOSPACE + address);
+}
+
+/* GPIO functions*/
+
+static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
+}
+
+static void pwec_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
+
+	if (val)
+		tmp |= (1 << offset);
+	else
+		tmp &= ~(1 << offset);
+	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
+}
+
+static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
+
+	if (direction)
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+/*
+ * Changing direction causes issues on some boards,
+ * so direction_input and direction_output are disabled for now.
+ */
+
+static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	return -EOPNOTSUPP;
+}
+
+static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct gpio_chip pwec_gpio_chip = {
+	.label = "portwell-ec-gpio",
+	.get_direction = pwec_gpio_get_direction,
+	.direction_input = pwec_gpio_direction_input,
+	.direction_output = pwec_gpio_direction_output,
+	.get = pwec_gpio_get,
+	.set = pwec_gpio_set,
+	.base = -1,
+	.ngpio = PORTWELL_GPIO_PINS,
+};
+
+/* Watchdog functions*/
+
+static int pwec_wdt_trigger(struct watchdog_device *wdd)
+{
+	int retry = 10;
+	u8 min, sec;
+	unsigned int timeout;
+
+	do {
+		pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
+		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
+		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
+		min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+		sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+		timeout = min * 60 + sec;
+		retry--;
+	} while (timeout != wdd->timeout && retry >= 0);
+	if (retry < 0) {
+		pr_err("watchdog started failed\n");
+		return -EIO;
+	} else
+		return 0;
+}
+
+static int pwec_wdt_start(struct watchdog_device *wdd)
+{
+	return pwec_wdt_trigger(wdd);
+}
+
+static int pwec_wdt_stop(struct watchdog_device *wdd)
+{
+	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISABLE);
+	return 0;
+}
+
+static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
+		return -EINVAL;
+	wdd->timeout = timeout;
+	pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
+	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
+	return 0;
+}
+
+static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u8 min, sec;
+
+	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
+	sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+	return min  * 60 + sec;
+}
+
+static const struct watchdog_ops pwec_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pwec_wdt_start,
+	.stop = pwec_wdt_stop,
+	.ping = pwec_wdt_trigger,
+	.set_timeout = pwec_wdt_set_timeout,
+	.get_timeleft = pwec_wdt_get_timeleft,
+};
+
+static struct watchdog_device ec_wdt_dev = {
+	.info = &(struct watchdog_info){
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "Portwell EC Watchdog",
+	},
+	.ops = &pwec_wdt_ops,
+	.timeout = 60,
+	.min_timeout = 1,
+	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
+};
+
+static int pwec_firmware_vendor_check(void)
+{
+	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
+	u8 i;
+
+	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
+		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
+	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
+
+	return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) == 0) ? 0 : -ENODEV;
+}
+
+static int __init pwec_init(void)
+{
+	int result;
+
+	if (!force) {
+		if (!dmi_check_system(pwec_dmi_table)) {
+			pr_info("unsupported platform\n");
+			return -ENODEV;
+		}
+	}
+
+	if (!request_region(PORTWELL_EC_IOSPACE, PORTWELL_EC_IOSPACE_LEN, "portwell-ec")) {
+		pr_err("I/O region 0xE300-0xE3FF busy\n");
+		return -EBUSY;
+	}
+
+	result = pwec_firmware_vendor_check();
+	if (result < 0)
+		return result;
+
+	result = gpiochip_add_data(&pwec_gpio_chip, NULL);
+	if (result < 0) {
+		pr_err("failed to register Portwell EC GPIO\n");
+		return result;
+	}
+
+	result = watchdog_register_device(&ec_wdt_dev);
+	if (result < 0) {
+		gpiochip_remove(&pwec_gpio_chip);
+		pr_err("failed to register Portwell EC Watchdog\n");
+		return result;
+	}
+
+	return 0;
+}
+
+static void __exit pwec_exit(void)
+{
+	watchdog_unregister_device(&ec_wdt_dev);
+	gpiochip_remove(&pwec_gpio_chip);
+	release_region(PORTWELL_EC_IOSPACE, PORTWELL_EC_IOSPACE_LEN);
+}
+
+module_init(pwec_init);
+module_exit(pwec_exit);
+
+MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw");
+MODULE_DESCRIPTION("Portwell EC Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


