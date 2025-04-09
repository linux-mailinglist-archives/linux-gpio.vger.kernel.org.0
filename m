Return-Path: <linux-gpio+bounces-18610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50EA831F4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 22:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E75118A3478
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 20:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FAA215182;
	Wed,  9 Apr 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JxeF93MR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FLiiSWxs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A25215043;
	Wed,  9 Apr 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230575; cv=fail; b=AhyKEPdxiAufFuaBM7J6H57O7V0EInMacsNBtl9U0UqP94xr1P41oPCu116pDKKm0OeHpy86lO8Jb7UtjavUJ0HOtDsOLjoVz97JIL08kV9z0IPVF2U0xdDYQRs1PAwGFoZ6zzHKDAXmEx+oR6jbDy/Jfr/2IELkvvLCJ1x+oOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230575; c=relaxed/simple;
	bh=iJ76maD1YcYRU1GZgqccI1bF8YXPJ+t0ofLEqm9yLNE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jszv4JXPeqlyBHl9VevanOOqym97nLt5ECFeNVbKHGKOKdqb5UgoEeEmBYXyo4boaRxq1KksOFT5d2WUE5yxCJsc4je2yQ2pbZ847QLRIkZ9YSQXXNOfVSqkTRh7owCnjjw+Bzjf2X0pi912QqQkH5VoQ0VEhk/c4QEC+SMH898=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JxeF93MR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FLiiSWxs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Gu1h5014708;
	Wed, 9 Apr 2025 20:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=sDXHm/lCD7+6+tYoFeqrVQkvnrDg71gdaotnFg/lM8E=; b=
	JxeF93MRQXxUp+fJYCxcrfInoJih7YfKzHZqBFCeLSoSIQRn8ZwD1L2gyE6Hc9WW
	irNOUhRiKO/7ltybiy8HmL8cqm87L5GFtSrGoEu4qiZRgvlS44ZXKl5ichOPJKdP
	we4//PJHer5tNXz6dPnZpNjG/X0i1cqLsDf6jgDtgzycrzRIU/KP7PAzv7pL/2Rj
	ysgjXiDS4aV2KJsqgB+kgzEB+GXumP26xe/XBsF61IaZUMYzGOof2MQKA9PxAfZ8
	0ysn0zb8ybDtLEECESytyXQqbZ9hwZb0a99BLbVSVjqsTZlVICF+BJ+ZDVKTb/JE
	Uh+rlFW5rfEVLaDFQdQ+pA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tuebr3cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 20:29:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539JddBE023792;
	Wed, 9 Apr 2025 20:29:12 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010004.outbound.protection.outlook.com [40.93.11.4])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyhmj1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 20:29:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMTD9ORBpn2NuB/Wjb6hoYmdRka/SESVU/ewu2uRnYCF+uq8vtxUuzVLyXpp2DoJ41656XOPpD1Yngu6OnshsryxJuxrD7l/FCxE7xWD5zDZ0D/hKA/qoF0x03eNSAOaEHwgmkSlbUNDylBR6eqaMXszPR51lXUWQpnyz5Mm2Fh26eeVr0+VRndWy4MdGPrN8h4x7uIYRlJDOBk6NCKWT7sZjUyJ+PZdtIBwwiI87uxGAu7eE0LtizxH0IiLdbhj+21AiJrWaPQcqgWNaVjupkP9sfatrnB8WoANS78G9jnd094rsl4pd4TTSJb9zvUavYsZWvwFqa/Mt8aoZckpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDXHm/lCD7+6+tYoFeqrVQkvnrDg71gdaotnFg/lM8E=;
 b=wZ7zeQZNkK7PI3I8V64t5waPcycd15u7JDG32Gku8GrexShkYXinKfZjzAVwchRhigDDW96LWmSrOGVuua8b7E5QLiC/1lIY0UsVgznvMpdeBpbvQx555QdqY7Tj1MPWBpkKia4XpUXJ1tu5DaU9RYFOMkq8Z0i/XfztSh0f2iv8QFUG7obuicfe7Twhc1JsHVe+fKkntkaJiWodsBgtkalLzwZpKINuQHMPyZyePS27+z2sC4c+yeAuD89Z61+Mxtz5C6PGHmnlqxnabHHWuT7Q7UePPYaCTBn9kAUZ/o4ByOoTguG5ii9WIxrs8owl1jLUnVCeh2OtZJQlb+SB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDXHm/lCD7+6+tYoFeqrVQkvnrDg71gdaotnFg/lM8E=;
 b=FLiiSWxsnz7P6t5144eCvRSP4F7gxsANQF01J85ZovQh+T9QFylxR0Z3gmnhFkdYqleoEO24FYzVLrmC2OGqwziHhP16989ct1L5uQjDFp6XctwzU8jLLZf4jaePw2VNriuRq0dME/u0sw8mH4ItFfvGmqC9bo6oO/dfMqniFi8=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DM6PR10MB4267.namprd10.prod.outlook.com (2603:10b6:5:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 20:28:56 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 20:28:56 +0000
Message-ID: <369cb94e-290f-425a-93e7-fcde11221dee@oracle.com>
Date: Thu, 10 Apr 2025 01:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] ASoC: mediatek: mt8196: add platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250407120708.26495-1-darren.ye@mediatek.com>
 <20250407120708.26495-9-darren.ye@mediatek.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250407120708.26495-9-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0159.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DM6PR10MB4267:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ca1099-6a52-4362-63b2-08dd77a526a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkg4NjYyVGp6TGQyTU5YaDlZM2loeGVENWJ2VmdJelduc1FrNUIwOGhwN2ZT?=
 =?utf-8?B?eGVtUW5yUmVvdEZ1bk4vVVRwaVk3cHdZSVpEbmRnUUI3UythRnFsMUMrQTZP?=
 =?utf-8?B?cGwvTk5KS0E2VTc4YVRXSkdwMFlycFVJQnBxUEZxZkVMdXhSQi91ajFKai82?=
 =?utf-8?B?b25wb3RieGM1N3c3ZWFrczhmOEpUL3NPU2dOcENGa1VhVnU2ei9MQjlMNWRv?=
 =?utf-8?B?bCt1MTgvNXlWQzQ0T0hsUGNISFE0WXNRMWpVVVRQQ0luQnlMbG5pa2tkU3dR?=
 =?utf-8?B?YlRMUFFMZHlxTTJ0QXFPV0ZEUTBtYVNhMm9YcGkyZTMvWWcrRGhUajllcDMv?=
 =?utf-8?B?dDZxcXcrZVhTUDFYTHVFTjFRN2ZyQjBWTXdpeGF6QjFKK2g3dk5ma2Q2ZWV2?=
 =?utf-8?B?VFdvcHJka0VLdGw4VU03RElCU2taY05EZndBSFBPdDdhRDl1V251ZnFwVVFm?=
 =?utf-8?B?L2JpSUh1Rks1QXpBR05hdERUQlB5N2V1dGtOd09jT1dnczRtMHc4cldlZ1lP?=
 =?utf-8?B?bHE5WS92SEx0ZFl4WVNuNVorcjlKajBZOUs2S3dmN1ZqLzE1VkpheXBLbnZi?=
 =?utf-8?B?OGFNYmx0NFNBeXNadVhhZTEzSi8zaFViajJiOXl5Sk5NOW5WaWM1VzNIZ3Er?=
 =?utf-8?B?aXpUa1BHb0JRM3ZSWFcwSnVYQW0xZHU2cnlOZVRRRkVkWXdmcWlCcWNpVkR0?=
 =?utf-8?B?bG5vcjB1b3VUU0pPU21zS3M1QVBrUkQxME9GVGZHUytQWEhhN1F2RGRWZ3Ns?=
 =?utf-8?B?V1p5REVQeDNXVWQvNlZONlZxM3llRDUxTzl3My9WMzM3Tnh1c2tmYThZaDBW?=
 =?utf-8?B?YWU3VnNoQ0F1MUlDSFlKZVRDT01DWDVCajRBdjFreld2bitleEtTWkcrMmZq?=
 =?utf-8?B?akI3Z1o2VmVxWHdLK3RxSm9UdDN5QlBpdExKNm1FRkZTOVV5YkNqRmVDeitP?=
 =?utf-8?B?ZFhZSUFUMnJ2VXNjdGtiTGZqOVVvb2JWOVdKR0U1bmo4THlnTjh0VXordHA0?=
 =?utf-8?B?RzQ1RExvUlhsdVBDN3ZSU29UeVR4Y1JZN1hjZUtCTEo2d2NTNEpjVTlSME01?=
 =?utf-8?B?YnFXMExvY0xCMHFhc25MSkVWbE9vN1JFUFR5bG1KUTR5cEpiUTFRaElzNEpY?=
 =?utf-8?B?a3o5bUFZMnhnS0lUcXpERUZHOFpteGs4YXB6bm1sdGozVUlMbm8yUjdkMEpu?=
 =?utf-8?B?YzZlUVpFM1M5c3E1Vy9qV2NueUlRY1VvTFZOMklvNWY5S2U5cFY2Mlcyd0N1?=
 =?utf-8?B?d1BZcmQ0dnVLU05TSmIvTmlpSWc0MktYbnZKZExsVnhvWnI2VW9xUWtNTFN4?=
 =?utf-8?B?WFFYZUx0R3BqNm9kSS9VVnd5NWhKbGhScGdlUGdiRkVHNjJRUFlKLzBkRzJj?=
 =?utf-8?B?Z3FiU2Qzd2dXSFlsWlFnY3RLVG1Eb09ONDBWTTY3VGdNN09LL0c0NW5jTDF0?=
 =?utf-8?B?MENmZTE3U0IzajAzWTQ2V1lBd3hya2p2dGRzOHNtbS9jL2ZBa3A3N1MrN21Z?=
 =?utf-8?B?TThsN0h2RG56TnJMczBYZnVLcU1rcGpkdUowN1REemRudXk4WWFJWU40a3lY?=
 =?utf-8?B?TktzRW16VzN3VGdJaVVnaG94NldLVnlvSXNqSlZJV1hhVUdmUU1jQlJLbnli?=
 =?utf-8?B?ZE1TaGo0bVQ5c0l3ZU9RM3V1eXp5NzVUYWdkL2IwNFdCd04zVnJJd2J0ajlU?=
 =?utf-8?B?Vkc0QVVwTFJUamJqUXltdVdiZUNQSUNhQ0JIeUNTTGVNUVVqVE1seS9lZE5m?=
 =?utf-8?B?ZGN0d2drREVmVk02NjZSNjNjMHM5aTRjYmZvaER4RUpEbCtaQm5iNkxvV2g5?=
 =?utf-8?B?Z0dBQUM0TVFYZUdBMFZwaGs5NFhqT2dpaUhWcWRqNExEU24vaWtyam5oWERL?=
 =?utf-8?B?NE1hY3F3b3N0ZlNuYUhRR21Cc0grOTlJZlIwQjQ1Z3hpNzBKYUlHUFA0cHVF?=
 =?utf-8?B?YWZlRVRoSkI3dkhUNVA2RFRtVXdrOVg0UlRFRVh3ZW55L21iYi9YN2xZc1hp?=
 =?utf-8?B?VlFBSTFvbktBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2JXMzZ0Qk5aMXhvTDFKZWp5ZDR0UHgxMTNrY1FzM3dTL2NDZS9MV0tmSXpn?=
 =?utf-8?B?Mm45Z3B1b2FndElqNUFnMEFmQjFjSUhLWVZqcUMwUElDdUZiNlZ6aXAwUzZ4?=
 =?utf-8?B?WmE0NzBiSy9QeHU2T1c2TWwrMVpMYXBnL2hqTG1OSUdrYkpSOTd1dnNnSGE0?=
 =?utf-8?B?ZEQ1blpmbmExK3d4Sm8xZmVESE9tejc0UDBTSlJUUmxKZ0RKR3JSRkZad0hM?=
 =?utf-8?B?WXZGdnZhc1I2QzFRa0drNFgzVjhhN3d1cjZFbHN6UmxvYjZEQWE1b0htdXQ0?=
 =?utf-8?B?OUVaVGNlNEVoYmZmaDVVQVdvRm11bG4rei9GbUtlRGwydG1BZHErUmNsNnNo?=
 =?utf-8?B?N056bllGUjJiazRxT0VTaTAvWVg5OG5hSktJZUt3Sm5CQ25OYW9ZN3VIVTRS?=
 =?utf-8?B?TUdpWm1WL01LZHRFem0zbTM5ZWZGTmEzV0tKSGxPZGdCdnAxQVBJSktmZ091?=
 =?utf-8?B?QjZhUnVuY2xtT29DUktKdGJqYVlJeDNDNVorcDU1aXF4NmNMTmhNVG83K1lj?=
 =?utf-8?B?NUFNVmpUZndiUlVFOVQ2a0N1ZExkVk9LczEvRlUzcnBIYmxoSkREZHl0dnJZ?=
 =?utf-8?B?VThTR1M1ektJTGY4MjNXWlFmU1ZRbURwYVpldW9YbzZMZzBDZlF1eStWQ3ZC?=
 =?utf-8?B?OFJGYS9TclZNa3dCSGFjK01yaTVxQ0JNZTU5ckZTcTc3TS8zc1BzTTNZU2k4?=
 =?utf-8?B?TlB0d00yMXBDVXRKanhPREZCbFNYOGJ6MEVwamVvcG9uWG9lbVlvRlBVNzZp?=
 =?utf-8?B?Y3JxZGdUNlZVTXBDUTBnczYyT1ZwdlIrMEZnTWYyWGFjaU5PcWNjTlBPOU1q?=
 =?utf-8?B?ZTMrUlJLS2RnMzJOam1NdE10Rjh3ODZoOHZ0MWZuaitxTWU1WkVMblhCeHp3?=
 =?utf-8?B?MExNV2Vudk5GbVBxRkRYaVQzUHNxbjVmNndIbDAySS9GMlA0U3VLY3E3Wmtr?=
 =?utf-8?B?Vk5LMDd0dEdLZUIvN01oYVI4TmZQQWhkd3RYWEhaajhqN0ZsajBBVC9Icmsv?=
 =?utf-8?B?ZU9BNk5ZRU4yaWQ0cmNDQW1pSVFBYXVJTE5VRlFCNEZnTGI0Rkp4K3IvYzJY?=
 =?utf-8?B?eUJUUXJrZ0xOekQwcE9iS09IcUpVMk94UFBsM2w3K0xDcjBaeHpDTkM5SCt3?=
 =?utf-8?B?WGxiZWR0L3BmL01mZE1mVjRPYXREMVJTWU9DTVEwQ1NZMEVjRlF0Q2pMR0d4?=
 =?utf-8?B?bjZjc29KVnFndm8xeTVqamtDTms3eWorb2NYR2FyZFAyTElrcUN4V2syZk9O?=
 =?utf-8?B?U0phZWl5azhLWnVCU0x3NUtjbWdtWmREQ0R4b2NlNVdod3J0aGNRQU1SMGtC?=
 =?utf-8?B?SDhMVUM0dzVMVC9TM0RhL0R0UURvY2tNREZsbnJlRkt3N09TMC8yWGhGNTg4?=
 =?utf-8?B?b2xIVUF2Tlk4YjdmQ2ZteVZaZTU2Q3hudVYrUkRnVW5MdTkwY1RLVThqRFNK?=
 =?utf-8?B?d2FYYy9XUnZZYzhhOG5hVEZpRWg3eHpBbUxxQXVFYWtOQklrcHBOdVhUMUM4?=
 =?utf-8?B?b2Z4b2x2UHRoRnVPQXBIRFZnS3FnK0ltNnNCL01qSEJpZTkzSE4vaUplcW5R?=
 =?utf-8?B?Zy9TcXg2cWZSb3Z3Y2lSbDJ6MW11TjRCY3RUQlR0NnRjeDZ1bDBVbzJNK3VX?=
 =?utf-8?B?RDB3ZDJISHM0aDZtQkZqWHVsRG55a3UzTDlWQlhNbHhzT3QrcHdrcURORnJa?=
 =?utf-8?B?UkRKUU9pYjdLMEUya1ZjK0xGWjNoQXpRakd0eE1OM1pqQ29ycEdiVlZ6cEJ2?=
 =?utf-8?B?OWlrLytLU2FXa0FJVVV3WVIySFNVYTZqdks5S2JPY3J5eFRMTjNldjQ3cUJY?=
 =?utf-8?B?d1hBUFo2Q0FNSlZrY0VwVU1sY3RyRVNudnY1Mi9PanhWWVE0RXlNMWRrekx0?=
 =?utf-8?B?UzZObGcvdFV0S3BNaXpkM0pOQ3JES0JzRmhrWWRCSXNuNlVZTGZYMmtrTExO?=
 =?utf-8?B?M3B4NEh3NkQ5VmtjalF4VGJoMzZ0cGduV29MaWxXSDhHSTFUemljRGpkYTlB?=
 =?utf-8?B?WndxTjYydnc0TkJ1OUFaRUR0cHF1WlFMaTlUZHNoWlFycGtZaE9zWVpyWTM5?=
 =?utf-8?B?NXBuWlh1L29aWFI2bnlpNWZBdTY3RFljQm1pTVVEY21qSXNraXQ2VElPN0VE?=
 =?utf-8?B?Z08za3dNV2VSS1g1TWpYa3dHRU0xdVQreGpxNzBLZ2x3S0E5VSt3WGQ4SUs2?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g9Ln/K5AREXhtk9pnvGm4OOVz5e0dgsIUypNDEf2lLAa2Pa7ONErEkhK/9hzNV93SouhZXETYDMCLoamgZs2b/HnmjyxpavLZ+BVIDwi24tYO53cuQqeWGuMucdLcIFRhYd4eAzfdId2OmU17ESBtryO9S792GNmxhxGmjqjI3oKpT+hfrUV6gX2phlkNoxA3heFPK3ev2snqVVhkQN9ElGiI8LQHD7IqqpW/Q71IJGizNqt1SU9SSOqHn0F1d9PsfEtsdV/4sme81fOcFooV42wDhU8aocz2/BKzi/zDpB81ffpP1oumqfOApTPTHM0R4+QYJEvr+L2Vhkt1azNLObz8kGe3Wz0ZiQMu/Cpd/9m1hY0MnxoNNE22kDR25wjBc3RYT3tQ8DT9X/J34OCHJXCAogQf+yj5yOShhTKPi0+rLkz/rk09dgkx7UFzz+9Ebjpg/pAnmQdCcF2SRJntV+io2AneP/sfRslLvGQKJ3MU0bysmU0zyUoYcl8vr5VjcqWTCKMwmFul7YR/ydZJxqjMmkQQoYyMIRpCDxSISC9idcIUamYmZOARzfOupikrkrv8iGL8S9YTTdBjY8QpYDvDcujRrgCDRgyeYvWHcs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ca1099-6a52-4362-63b2-08dd77a526a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 20:28:56.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX1WAIBxiaO6Vb+Ygb8ZYqYEQrCZeDOy5JIWzXVA/1A4gA93ulT9tL7rXlw+npXAlhfek8RSAt0VRb+WQ6P2TdpQxv2dmjxEgBSwgPgNXNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504090138
X-Proofpoint-GUID: mHwhFR0hYxiB2HADhwblbOgjBC23oZtq
X-Proofpoint-ORIG-GUID: mHwhFR0hYxiB2HADhwblbOgjBC23oZtq



On 07-04-2025 17:36, Darren.Ye wrote:
> From: Darren Ye<darren.ye@mediatek.com>
> 
> Add mt8196 platform driver.
> 
> Signed-off-by: Darren Ye<darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                 |   10 +
>   sound/soc/mediatek/Makefile                |    1 +
>   sound/soc/mediatek/mt8196/Makefile         |   14 +
>   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 5070 ++++++++++++++++++++
>   4 files changed, 5095 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/Makefile
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3033e2d3fe16..606f221e238c 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -204,6 +204,16 @@ config SND_SOC_MT8186_MT6366
>   	  Select Y if you have such device.
>   	  If unsure select "N".
>   
> +config SND_SOC_MT8196
> +	tristate "ASoC support for Mediatek MT8196 chip"
> +	depends on ARCH_MEDIATEK
> +	select SND_SOC_MEDIATEK
> +	help
> +	  This adds ASoC driver for Mediatek MT8196 boards
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
is this not depends on COMMON_CLK and select SND_SOC_MT6358/6359 not 
require ?

>   config SND_SOC_MTK_BTCVSD
>   	tristate "ALSA BT SCO CVSD/MSBC Driver"
>   	help
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index 4b55434f2168..11d7c484a5d3 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
>   obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
>   obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
obj-$(CONFIG_SND_SOC_MT8196) += mt8196/ should be after mt8195.

>   obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
> +obj-$(CONFIG_SND_SOC_MT8196) += mt8196/
> diff --git a/sound/soc/mediatek/mt8196/Makefile b/sound/soc/mediatek/mt8196/Makefile
> new file mode 100644
> index 000000000000..9bcc09a9a94d
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# common include path
> +subdir-ccflags-y += -I$(srctree)/sound/soc/mediatek/common
> +
> +# platform driver
> +obj-$(CONFIG_SND_SOC_MT8196) += snd-soc-mt8196-afe.o
> +snd-soc-mt8196-afe-objs += \
> +	mt8196-afe-pcm.o \
> +	mt8196-afe-clk.o \
> +	mt8196-dai-adda.o \
> +	mt8196-dai-i2s.o \
> +	mt8196-dai-tdm.o
> +
need to follow right sequence like mediatek/mt8195/Makefile

> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> new file mode 100644
> index 000000000000..84ccbc7419c7
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> @@ -0,0 +1,5070 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Mediatek ALSA SoC AFE platform driver for 8196
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye<darren.ye@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/of_device.h>
> +#include <sound/soc.h>
> +#include <linux/of_reserved_mem.h>
> +
> +#include "mt8196-afe-common.h"
> +#include "mtk-afe-platform-driver.h"
> +#include "mtk-afe-fe-dai.h"
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-interconnection.h"
> +

header required to be in a sequence. easy to read!
#include "mt8196-afe-clk.h"
#include "mt8196-afe-common.h"
#include "mtk-afe-fe-dai.h"
#include "mtk-afe-platform-driver.h"
#include "mt8196-interconnection.h"

> +static const struct snd_pcm_hardware mt8196_afe_hardware = {
> +	.info = (SNDRV_PCM_INFO_MMAP |
> +		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
> +		 SNDRV_PCM_INFO_INTERLEAVED |
> +		 SNDRV_PCM_INFO_MMAP_VALID),
> +	.formats = (SNDRV_PCM_FMTBIT_S16_LE |
> +		    SNDRV_PCM_FMTBIT_S24_LE |
> +		    SNDRV_PCM_FMTBIT_S32_LE),
> +	.period_bytes_min = 96,
> +	.period_bytes_max = 4 * 48 * 1024,
> +	.periods_min = 2,
> +	.periods_max = 256,
> +	.buffer_bytes_max = 256 * 1024,
> +	.fifo_size = 0,
> +};
> +


Thanks,
Alok

