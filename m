Return-Path: <linux-gpio+bounces-29535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C6FCBCF19
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 09:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82F1F3013946
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 08:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634A5329389;
	Mon, 15 Dec 2025 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="fldGMEEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023106.outbound.protection.outlook.com [52.101.72.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C731354E;
	Mon, 15 Dec 2025 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786841; cv=fail; b=G4LfY2zeOPn3IiM1vS/lvO2ThkVZrkqE1LdQP77BoWAqRqm2xrmjjgz1//QynDTT643D2bZjnIKciG5qGZPOBdbA3+gvtj7O8mCsBmC4Kq8hoA+KdH0DjbULufex0X0WAuGOwCRoKXkcB0EqrjmN3orBbpBoRRfMTKuduWmBxOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786841; c=relaxed/simple;
	bh=RcVkajKEXqa75sDyVcpMqZ4wSRDvOt0VDRQZEbqM+hg=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QXZQ8Bw/GfYAnojqqVkyJZi/Ks5uh15M5tXqgjeXenKXJAaD0crO7PEWrcQrD7I20430Upctvm9W7RF6j6FUEllzJLf144JMeULxmigDX4/WIuAWhzheSGLf2XOcyUr0W1sLpRl9+BB78fGBL/x6K/ImRnBlvBuZSwhP6bbJfwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=fldGMEEG; arc=fail smtp.client-ip=52.101.72.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDiqm6xk2wlu+7QmAfYyuy4aBB4AjwqAD08PGyNjZchmIsslD1sdr8jF1SM+QEr+qWblUbc/do1MozWh73nD9Y7nvFKKtTwjumTP5T4TJl+OgH+1zZxYiXUrA+7VKJdt5QFjcg5UYRsuWVLuAO+qSU9w8m1YUicbPZSNbqHTweDLlUXiwRltBHCOm/vLFq89pWZKm4GvpOJw/tcEcOednitihVbM8FaP+RVpjkwrZNOljYKSxTK90p83j8zIVd7ldsKo/ENIDGporh2xqWRbjWYS4abR/4Iegs/BtbP5NbMQgb/GLNWSuhdXTawn3iq2+7c6d0EliXCBVrGLotDVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y46FjfYgNHr1gBODR2XcEHx+JJK18ZlPRWnQl0IDDA0=;
 b=whOHXfcgCCRfYyuOC4MIiwwqXcMFkT5Bs03jxUsaTwRTVdTpeBZp0Kct0a50a4BXxQXTr7dyPy4qsBKhbW3F4+woshf2oh3ej9ozdrmxa+KL35ehMa6AISKtogR07L5UkDrAVkeq85zkQHv2jWm715Mv+wpjb112yaWhIGaw2quFm9frkb24Uv2/7kC8NBx3alGQHygvBr+jIADBmRv76y3VpNGClZJ++YWzClWR4hQEsq1W664BO1rxX213nL6Q5lwQmb/nDRXusQLiMnH04NUQ3wrH33R7JVAWSStcqAAYKnzisZ8j3qWmZu2iztMX6Tc9oYmoQgJsAfZLMNLz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y46FjfYgNHr1gBODR2XcEHx+JJK18ZlPRWnQl0IDDA0=;
 b=fldGMEEGZlSAIL7db5HeQJE3v0wgZ/b/jkrLeVkvQd+1YsfjZknbYzV1LFiZBBKSXqSVVvM90J39pOo0OIC1GNnN2kWE3HEgqYbh5weBfc+aQzY2HJNcKwHlRggw1lovWHoNxGF897QknDDdjIGauXTrC330r/U2j1lpoPLAhKZo+asS1iiMOjcn2dRKG1KKOiqXvpb52QsU+WQ+7KGmV0PiwqTDbqikX/sSv79cim+CXK/AshoKRx5mAZhEQ1A2Hzf/AuEMg1CAVi/4+TjNBmdNPOCO9WOu4BKMT+6OPLQkk4PLXODpQOYl/zZyZoIs/u0eiVW5AA13gQi9U9TYaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PA6PR06MB10301.eurprd06.prod.outlook.com (2603:10a6:102:51e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:20:31 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 08:20:31 +0000
Message-ID: <c655d548-85be-4c42-a802-d9342ea90aed@vaisala.com>
Date: Mon, 15 Dec 2025 10:20:28 +0200
User-Agent: Mozilla Thunderbird
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
Content-Language: en-US
In-Reply-To: <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF00002E75.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::44) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PA6PR06MB10301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea6f44a-aff5-4d3d-57d9-08de3bb2cfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDBJWHhPblpKU0g5NmJyazlOMmtlazJIcEg2VStnaXZ2Tkk2TGEwUlFhei83?=
 =?utf-8?B?S2ppSDI1WVRKV0tKLzBwMEo5TnR2SGRsMktZOStBN2JIV1F5cXdYZVdrV1Y3?=
 =?utf-8?B?T2JKMDNFOTVuMytycmtlb0FhY0pCZWZtcVlkWWtwNW1Nd3VGUVpmZHA0MWxP?=
 =?utf-8?B?SWVORnQ1Vjc4SS9MVGFsS2xmbS9FaW9iejNSeXhFSldmaDBLNW1nTFNXbmxX?=
 =?utf-8?B?S09RMG50RjUwZmYxRHFDZHB1TVRrc0I3d3BjNnlSVk5VaTFDY1hwdzJRcTVX?=
 =?utf-8?B?UThuRUZDZXlzZ1BRNWcrazZ4SWVoY1R4SVZsVy9sUEhjaGQzaWlCRmh5Q0pq?=
 =?utf-8?B?L3VrclBCYTl1Ulk2Qi9aSWh0L2g2a091VDgzUERVeGNZSDZBckplMjk0NFZ1?=
 =?utf-8?B?Rng0ZGtpdDdTQ0FzNFByZ2hBLzFpWUEyQzl6aWFhaG5Tank3MzUyM2ZGV2ps?=
 =?utf-8?B?TEx4OE5sa2o0Z1BvSUd0UnErN0tSYzRvajhnclcvYnJENU5SL3IrZm9HVCt3?=
 =?utf-8?B?WHN0THNJMEIxdU1qT0x3WnVmaDkyaVpjendOV3NRamh4Y1lWOSs5T0Q3OXZP?=
 =?utf-8?B?QjRxcnR1THlqcklVN1I1Y1lDQm1QZm1SK05POW85YjZSSmMrOTRmN3hRS3FP?=
 =?utf-8?B?ZFBnRlZhSk1lYkZpT0ZzdFBSUmpGdnFHc2lHYlBmS29RaGZCV2NSYVB5dVpo?=
 =?utf-8?B?aVdUUk5FclBkYlJsd083WC9OcE1pT2tmeURjcnNwdnAxYmJBb1J4aFJYTlA5?=
 =?utf-8?B?MmQ2bmh2UW9PZmhrQTdpSXRCcmt5bzdUUEJZZzh3T2VZWmprMTJPbWtkS3Jt?=
 =?utf-8?B?bE5LSEtzak9xM3g3cmRHbUdBL0lvaWpuM3RLQ0RsNUtTc1h3YzJvY0wxQ2FE?=
 =?utf-8?B?TnM3WGh4ajNSUmVGK1FBZzEyeitnY3BNTkdyYjRLdFdvWlc1WjBoelJlWTZq?=
 =?utf-8?B?bVRjVlY4VEdrOENxa3RyMmdPRkJyQXgzVnlwVWNKMWZvK2ZaTWg1RGRrbEJO?=
 =?utf-8?B?OGU4S3R5RVFIVzFvSmdPQVZ6Q3N1RWhXRFhWYnR4Z2dmS3pDMmJiajJSY3pH?=
 =?utf-8?B?TFN0SEoyUS8xRElWYi93N2FsNkw1VDhRcHoxc3ZwOEptOEtSald0cHBzTEJ5?=
 =?utf-8?B?TVJlTUlyc0I5UVMwTnFrZnZvQ054aDNFY3YyTU5jM3NBY0tmUEd1ajhiUjFa?=
 =?utf-8?B?dS9pb2tQWkVsY1RTNm1LT2NFWGd1TGxXUUFic1A1L3g1a3RzcUJwbGM3SkZR?=
 =?utf-8?B?cTFVOStTSFVHUHRsQzdDZC9BVlVGaFpqQ1AwRndMWVlhSXhsT205cjVEQmph?=
 =?utf-8?B?Mnd2bXpTYXBySFlmdUNIaGlCM0NPejFlNTlvbWZ2djMxaU1Uc0ZydVVmbjh6?=
 =?utf-8?B?RExlQXhFV1JsNEpCYktTN004OXJrbFFVK0lnc3pvLytRQ2ZOQ2NiU21HbElI?=
 =?utf-8?B?dTh1emFsWWpSei9ZWU9PNzZkNHMrMXFtZG55UlcyWkxpeFprT3R0RGw4eWpQ?=
 =?utf-8?B?VDZzRmlWdGptY2NEWm10TFM2MTMyWjZ1OStoVCs1M3c4dk5ic25tc2VEbmRj?=
 =?utf-8?B?bTFodGYrdEwxYmJNWUVCaDNwYjVyd3RwSW05TzdTV0hNZFRoV1I5R1hpNUYx?=
 =?utf-8?B?TERZdFlJc3pIQVZSQXpMcFg2amdVSXdGOTVSbCs2ZmdBZkpSZG9MQTgvOUFJ?=
 =?utf-8?B?OWQyZGdwL251S1kyQVdEUnhZOEJ1M3djblBQekt1ZUcreWJrbkdJcXZDYllq?=
 =?utf-8?B?YUtwK240WUFKNEdBVWdFUWdsbDhBRkk5NzlzNnFDVzRLaktFMDcrVGVObjdm?=
 =?utf-8?B?eHo0UnZQb0ttcVFVTXNFNmhFdGdLcHBRMitsckFEMkJvYnNJclM5VkZyeVU5?=
 =?utf-8?B?WDlZNUJJODRvSlhINytsTlhXS0FWUUh6c09FRVhUKzMrUEdvRFRybHZOUnNB?=
 =?utf-8?Q?3QGf4sy6y3rRPQLSsw9h/UocXilcDDpm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZaaTVoWW10V1haMHBqR2FIbVcwTGNzTVA3NVZ1ZGpFV2hrVDJKN09Da3lO?=
 =?utf-8?B?SDBZYkYxT2lkbGJBdTY3M3BLVXh5UFVORzJWb09uUXZ0L2YzVmtSOHoxZThW?=
 =?utf-8?B?L0FPc29BcEZhekhQSGlHb1RhcUVudHY2YTJLRlJkVStnZTV1cUExQUxSb0lx?=
 =?utf-8?B?N1NvVWt4K2piYjdjdEU0TzBKdG0waFZ3UGVXclc0elJUWFZLUWJxaWg3cktt?=
 =?utf-8?B?RVI4VkQzOUFkUzA5cUNqektoNXNKamEycUVjeTNnRk00blRhV0FPRXZuVkVz?=
 =?utf-8?B?OG1CbHRZeEV0RDRSaE5xTGs1Y01Gd1J6YkpLenlxVHM2V0svakplY2pWSWFX?=
 =?utf-8?B?R2FUSVlHcXpPckE1bVUrVU0zOTlhdk5LQ0dxM2wyUnFMc2s2TTVmYzdNSVJK?=
 =?utf-8?B?WW1DWkhreGwvRjBvSzJHaGg2SExIalJaWjQvbW5IbGx0SzUvWnVSOG9mN2ps?=
 =?utf-8?B?YTNWWDRHaFc5KzQxNHdOK2FQNHlyeVJEbGVNcC9yTnZYUGd2aCtCcWlMLy9X?=
 =?utf-8?B?Rk04NEU4R2VoaEt6NWplbDVtbndWSGhOTEJTQk1nQllnRzdsZ1doVGwwbkUy?=
 =?utf-8?B?aGM4TEJyanltSU1nS3B2OXNzY0s4d0taV2FrdzJvdzYwWUt6NWc1c0h2OXRp?=
 =?utf-8?B?TE9OU1pReXRTSDgxVzMyTVI3aUhESGdiOVdxdDhET0FaNDllOVY2NXE4YnQx?=
 =?utf-8?B?S0Frcm0yTWxLbUJyclFqWk9kc09NcFRTNDdBeStRWk9vUlIyK3M2YWdLaGli?=
 =?utf-8?B?Q1R5US9USktYKzhDejRVZHhEOFVLWEFmQWhZODNSYUg0M0dIR3FOZGViYlhp?=
 =?utf-8?B?OTlqQTVoSVJYcXR5M1Z5aEFSVlhEd3ZleGpEd2hWTGc2QVY3aXZXOC94dlVJ?=
 =?utf-8?B?T3JxUS9adTJEdVdqMm9vN2ExS0VuaGlyZWlXUWpnZ05XZk1obm5Md01YcWM2?=
 =?utf-8?B?RXJQNjBYQXprOXFJRWFxbE13YjMyamhWK0dPV29TQmRMSTBZbUJxOTBLRUI4?=
 =?utf-8?B?YjhiemJRZCtjeGlZUDVoZ09FTlFoWlpKU2l2QzBlRittdTF2dGVHT0VtOVpk?=
 =?utf-8?B?bzZBVittK0JpdGkyMnpqd2NBR1RJZGNuaytTYmhWbEk5QXBPeXFrSUVTdTdm?=
 =?utf-8?B?TjVmQVdiTU8zV3VaeWl2Sm8wUWtzZkdzc2svUnpJQ1V3SDhvTWxOZTZtSGFR?=
 =?utf-8?B?eXpCTWgvQXF2TGNOUy9Ta2luZ0RLUVViN3loV3QrbWtuUm1nRm83Nlc1N3N0?=
 =?utf-8?B?ZitIQW15bExBaWdRQkcyeENWT3hMT2NzU2pCNTd0bEdscGpqSllhZWFDY1hL?=
 =?utf-8?B?SDFXaE9GRmgxMHl4d21NbVQvK2NJWGczaXZqTHpPQ3FVT1oya3dxWk1ybllu?=
 =?utf-8?B?YUJkaE9nVy82SVdFQUVEUEtPQXBaOG8vdk5EZElmTU55YkNPMk4vM056ZHVq?=
 =?utf-8?B?bTdsVDg5L0o1Tzl3TzFMYmwrY3pRLzRKUGljM0g1anFuLzZMTkdpUTBZOTBH?=
 =?utf-8?B?RVc2VHU5ZHc1bmc1SFZ5VE9kZ0c2UC9UQWFWQ3diZTFyVFg5YzRJM0dOR2hr?=
 =?utf-8?B?bTFtTysrNit5ZEhENk9PYWtxaUIxWWFEVEhSN1FvbXJqSWVEM2lzQUtuRmxn?=
 =?utf-8?B?WFhWR3VSS0M0U2w1alhVM1hBRzFCeHMxakNuQ3FNRmM2Y01ISGxrV2tycGhZ?=
 =?utf-8?B?eE52dHdKWXg3dHFCZzNzZjRVcjFZRlNITkRBWVpxMHpwVGxPMmswa244WjVE?=
 =?utf-8?B?bzhlYzNLT0dLTTk3R1IyMFFiUzFYWjRjc2tsbkt5UCtIUkFzM1ROSE9VMnh6?=
 =?utf-8?B?WU04ck1xcCtxdHZ0cTJ0NzJjTzd1aHZRWUo2V0hQSy9QcWxYZUFjNWhPa2xw?=
 =?utf-8?B?Q09tUHFMMXFtVnpUcHVxZjJsVmR1QWd2MTRvN0g3S0R3dFVpZzdjeGVFT2dB?=
 =?utf-8?B?RE5IN0h3US9vQlUzZXJrR0lobnN4Ti96OU0zYXJvL2xEb0FPeVVpc2hlcmtR?=
 =?utf-8?B?SFBGRWhDWEc2S3o0NXF4Vk0rM01DS0lLZTdrdDFLREFtVDZXTG1FcXM5dDlw?=
 =?utf-8?B?RjZQdWxQQzZ0NGRrVFBiV1VHL1FzcFFLY2dsSDhWMVl6UU9ka1hDdWFHV0dT?=
 =?utf-8?B?QVd3MEhoMk5mYjYwK1RIOC8yQXo1TGIxUG41TWFZUDZZM3FxeHJKYlJpQkRZ?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea6f44a-aff5-4d3d-57d9-08de3bb2cfc2
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:20:31.0341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5w4V7+24l1yCg8DMO8XrFDzYAG+p3A2dVRMqygVUux4vNSY2z5aEsZL/b+bfAMO7hR0ww8lQkYmol+karztthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR06MB10301

Hi,

On 04/12/2025 18:15, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 How Swap Controller. The device features programmable

I think You mean hot swap controller?

> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  Documentation/hwmon/index.rst   |    1 +
>  Documentation/hwmon/ltc4283.rst |  266 ++++++
>  MAINTAINERS                     |    1 +
>  drivers/hwmon/Kconfig           |   12 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/ltc4283.c         | 1719 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 2000 insertions(+)
> 

This is quite a big patch, I wonder would it ease review to try to add a
minimalistic implementation and after that add new features one by one...

> +module_i2c_driver(ltc4283_driver);
> +
> +MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");

How/Hot

Thanks,
Tomas

> +MODULE_LICENSE("GPL");
> 


