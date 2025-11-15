Return-Path: <linux-gpio+bounces-28535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7EC60772
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 15:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21B754E3E47
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 14:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523A01A26B;
	Sat, 15 Nov 2025 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="bBKUqpRD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94A168BD
	for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217939; cv=fail; b=nVfQTgClnTxC8ZhtgZOYAVYUYGIkbXCm92I8fW6zrxKRP6A4VQPW1/N42pjR8jAadN+qgyOfzwm4pHm/M1ZClueOzKw+sQBTUdA77LtdJCgPsQ+A6pulNxrB5zTLfn5Li9o0MhOWCoaRLCryoshyK6826XtuF/i+8zJXxiTPOzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217939; c=relaxed/simple;
	bh=ust8n8gfu2lwBqTv3RAZYRaGJPSxCZNgIZDO9bPo0uA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NMFuMyLCpCLMzkV46toJnv8jykeIkCakG2kAN9WLfmqxPvUvnxRDazqnUYP/GurtIejjH83cxaHHW95nU87RnGTjnbzck4G9HS8C9eYWXmNTs7KkV2Fn5+Mi5PHOOTRHHpu67ln975tAuXNY+uFHEwb91p5ADJlcqqBKb+8rPb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=bBKUqpRD; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StN9qa45lRSo6AezeqY0j/qWOhxzlRBHuw/7JblWqZFRqQb2WjEv9SwTkqkfPqriUR+uyliTjChvmpfirTziTr3cxCaQqdNUAKmOOhlzmkK1s9+Ob99XCq/u5aa17UuvPT0rwWHi98idtbqxF6pOkKuuChV/YLPd5LG/CGArXCqF2+xKY3fcEaxqYa+jtOYXPVO9T5Nz/frJ036vGcdUcJ4TCDSY0Lh5RASlOUP+38NXCAaPpQe6fWewQylDw8urFsZ3ztki/JWYTgOCQPsbXjX7bgxi/cxAeyyhzRy2bYbw/pbFizpeT7Z3hhVlVjmBAdAnf67RapJy/WVcNvd/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ust8n8gfu2lwBqTv3RAZYRaGJPSxCZNgIZDO9bPo0uA=;
 b=CKnmbfBG89GGi7jBb7xHi9ZqxCJPtXkliXF3fh5T9jU4rRmdcVURJ32NiDFUINDUnQE/qlAKJNyA+zNy8W3CeXsj27kGHUl4ukpfdwJqh71IH9WZ/DkujLlS2CjKhv3cHIQVPej5l+iX8+EwXq+7zQdm2tl7w4Pn2DvYzstsgZLJE9GsEFid4SCTy9ZmISZxW69FZYvc/gogviofzSj6Z9zPToX/hiqWgr0aUV8xBc+aexTkmOU7QEgabGaXvM8QL+KzXWbAyaiygu+7vaW9Ey2un9T0eM88D7F0/DnLs7PfsIkENTEHEom+fPHOrjrqX1bjhmpgHUN7ovJFJN/lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ust8n8gfu2lwBqTv3RAZYRaGJPSxCZNgIZDO9bPo0uA=;
 b=bBKUqpRDtB4jPFkIz2HLV0jHNq83RuyFEL2fwrEM85ElASD3UbQeVU2GSP/HkNPIaAnsKMSxVX+Fg2c2pgzgqa6CCtZRwI38HQfHjelYIQns3Wx3IAQ4tKezeDo3+6KRDAjFkJTwo472ljRk3X62FLZnJseFsuvBgeZt2TMZDgfvp2yWRxoagNYMNxStvoRvJ9AC3LzkQoCHqe559JwjVkm4F6SCTdAU46ED6wGJ64gT+EDHQzMUJH6qX2HkwCjkXO7BZbV7N+FrP4zQQwhooyN2NeRi1H9z70wDGZtyOO9ecd+j+hsBtvj97LaDBTqeN7pBvaoTMDkIw00kdHji+Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB6796.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sat, 15 Nov
 2025 14:45:34 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 14:45:34 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip
 twice
Thread-Topic: [PATCH libgpiod] dbus: manager: don't try to export the same
 chip twice
Thread-Index: AQHcVWrJiIxc8vuKkkSx3HGVJLRr8bTycgGAgAAByoCAAFF+AIABA8kAgAAJFAA=
Date: Sat, 15 Nov 2025 14:45:33 +0000
Message-ID: <b6e590126c08c2c5405c29a90adf7bd6c439f151.camel@siemens.com>
References: <20251114132957.33750-1-brgl@bgdev.pl>
	 <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
	 <CAMRc=MdFOFiZpjkec+zsx64Ww7MDhT8eSmCrFR4SparxhexX_Q@mail.gmail.com>
	 <3c3bd52678aee5f1d7b93d59ad351c3a304ae8a9.camel@siemens.com>
	 <CAMRc=McLiuf6mUKLMbhurehqKKRyJMF1icztVv7knC5XRP7rDg@mail.gmail.com>
In-Reply-To:
 <CAMRc=McLiuf6mUKLMbhurehqKKRyJMF1icztVv7knC5XRP7rDg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB6796:EE_
x-ms-office365-filtering-correlation-id: ce5371f4-ca9d-4a06-d4c8-08de2455a1e6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NE5DL1lDVDhtazN5Rit6a2ZjTzhYVlJLTVZFVk80MEpvWXp1T3EyMTA3YjlZ?=
 =?utf-8?B?ZWhnMzQxZ3dZZTVsayt6WWNsK2JGMVZhdGdMdVIyZ3Z4OTdObVRqTTUwSmlk?=
 =?utf-8?B?MitLK2RGc3RpUmNJT1RuL2wzNXpyamtLQy9xUHhKOVpHODFlbHFkUkYzYU96?=
 =?utf-8?B?bWoySXBha0FBNHdzWEdvOFZkSmdZaFl3SDR5VWxXUjdJVmJaenhJRGVObzRM?=
 =?utf-8?B?OXdvYUU3Y0tXRFlhN2tPZzN6L01aZEZBQzZMdzhNeTBrZDBjUFBCWU1WNE1w?=
 =?utf-8?B?bGY1T0hHNmlOdmF6WlM5NmNiQVJNZWE2d28wRmo2ck93cWZlSXhybDBDNktO?=
 =?utf-8?B?UFlpQlVCdkZPTUhDZUJWb2RNeTJ5TmhyZXNLT0pVWDNPZmtvVnlSVnZDV09L?=
 =?utf-8?B?UXFRa1lUMXBDakxFY2dMR2FScnk5VWFmZm9sUExqNU5yL2xTL1gzU3lsMm5I?=
 =?utf-8?B?Rmp1UDdnLzJXSGN1ZkpXQ2p6VHIvaytwMTFTVTZHYi9WMTZjNUNCNGVTbXha?=
 =?utf-8?B?TDFsZkVMUW8rRzJnTHF3eHVYVWcrV3VKbWVxdk9TM2VNd0w4MU5QZmcxdkJs?=
 =?utf-8?B?VmF1THk3MzBQdjRCK09vV3UyZnVZaXI1bnp5ZW84N0Vlb1lZNFdCTS9XT0Ft?=
 =?utf-8?B?ckIyb0dBM3RTSzlLbzdVUGMrTHMzLzBMazNnN1pzVUhCOUI1YURnd05TY1RO?=
 =?utf-8?B?c251TGl3QnM1ZFpvUG1BTVdqbUxEM2VLa0N2SzJaQWtYelJmNkk1a1o0MmNw?=
 =?utf-8?B?cW1BamNIazEyRFVBNXIrMk0rL0s2NnY0dVBPMUxGZWFUMjFaVFdMY0ZSdk1Y?=
 =?utf-8?B?RmVabUtWUVFOa213T2lwYm5EakpaUEoxRXRKcHZacXpnV2ZUMllKRUhwK2Ex?=
 =?utf-8?B?Unl0N2pxakpaNkhyUkF3VUhZY1dsNktlTnV1dUY2UWdMYXloa2RkdHhDRWRT?=
 =?utf-8?B?WE1iT1hqQTFGRkVsMVhUSU1aR2xrTDlpQ3MwMmZWem10ZHMyVFBBQ09XSkEy?=
 =?utf-8?B?UkZQTit2SmhIZHFCaUZVSTNjZ3UrdUlDckFiV1FKaG41Nkx4dXpvdHpVQjZz?=
 =?utf-8?B?eklNK1cxSWhiaFJLNTBXc2NJbjBNa05GR2NaMXJRUlpoVlRua0hLWUUyNlhM?=
 =?utf-8?B?aGFsVVRRZ3AvUEF0V0plOWFOcklOWjI4RU1Ea2xaZi9SVmlmMmJKM3p0YkVU?=
 =?utf-8?B?YUh3emZESkdjTU83V3ZiSVZIc21iS08vMHZMQkdXSmJIdWs1U2V4cjVJTUVM?=
 =?utf-8?B?RGtpR0pvYzFsbVdKTVJsbW8zSHZKY0ZTUktIYlZzWlpCbnl1SlpHYTdlaWJh?=
 =?utf-8?B?Z2szNjN2WHV2ZndFZ3VoVkRrZ2pOS25zY3pJZWZQVXhSdzl0RFVvckVYU29T?=
 =?utf-8?B?Vm5kUEJ6dzZJcDNIZ1ZVMkt5Y0crREY3V0Ixc1VwRVRoVGNieE1RVmFHeDRG?=
 =?utf-8?B?Y3BveElhQ0RuNzZwYjBMRlYva0hKTXJyTEFwNzNxTFAxOTJ1cWh5SDk1ZlQ4?=
 =?utf-8?B?N3FvNXdZY080ZlhiQ25ib0hUV3BvT1JTeEU3UjRrWG5jc1NiRmk2V3ZhY0Fn?=
 =?utf-8?B?SFJFdlRLNklBN3l4MzdOaHJoK0s5N3FsR2JCUUFGa0xRc01SSXBaQndkVXhx?=
 =?utf-8?B?ZWE5KzE4enBScC9aR2o0NTdxNHJocVVwQ0N5SS8yZHE1Rk84dTVPOHR2VWZJ?=
 =?utf-8?B?RUxlRGZYNE4yMmZPcStPTnhVMURINW13MkxnaUFGaW1LZkVoZFFnUFRCNnlU?=
 =?utf-8?B?RTNnLy9CRGZ2L3dtN0wrNnk3UUJQMDNtQmxHbzZkK1JSeTZuSE9yUERkeHlS?=
 =?utf-8?B?c1lpSWlUbzhDUS9yZnZ0TEZoV0hmRktEc0JNN3dNWHNHWTlwUi9rQUlSREpS?=
 =?utf-8?B?STJMUzNJVUdPT0Nub0xFM0NyeXlWNUw3UkVaZDNpZVgzMWVDY1ZQTitmcCt3?=
 =?utf-8?B?SzFRUXZMVFMvbUQ2MkMvTGE0bWVKMjZSMERJalV1d09aNFpMNkQ4YnZxRE1T?=
 =?utf-8?B?NlJYVzVTQWwvaklkdld1bmJiOEVSZ3JjT2kxSnI3WlJQYW5nbU5XRW9xaGdT?=
 =?utf-8?Q?iFxXIQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm9pM2NPV0psUDZkRzVleXR4WnJGRGd2aXF3bEpMeXFaNXk1Zmd4SURFRkpz?=
 =?utf-8?B?RU0zZTFjVk1Mc2dPOTVIamttUVBESTQrNGhWVkdNRitnOXY0MC83cEtlVnN0?=
 =?utf-8?B?SkpMbTRMNDNLOXhYNnhyZ1N1Wk9ydUx6UTZOY1YvNXBXZWhHS21hY3I4Qk1S?=
 =?utf-8?B?ZXhncEJEMlBHRWNtNkQzUTVXSFFmT2hSY0VqTFJhYVRIZTNTYVNJbmdvdjB5?=
 =?utf-8?B?K2RpMnNneEZPOTJNdUhqWVJxNWFKNDNBd1FuUjlJN1RzZGswWlZ3eEZnRzFa?=
 =?utf-8?B?MW9KbHRHVWNib0VRR1pGMUtMUmxCS1hkT3lPajQxYUhSYVJjZzJaTHAxT1lj?=
 =?utf-8?B?Z3Q1SnhZZmtvR3NOT2JCTHVMNTJuOFpsbDE5elo5REF0a09JSVBzUWhBcXNt?=
 =?utf-8?B?NlpjVUU1eksyZW5aN2hUQmdXemU2ZnVFdWJSUGs4MktRZktnZTNVbW1DaG1W?=
 =?utf-8?B?aW43MzZVWkRGZG1zZjdCdUJLaVo2QnNuSGtvTmdIRkhlc1RDa3AxZVhMK2Iv?=
 =?utf-8?B?WFl5dDhKZUwvOGVlVVJnZUxGRXZqek4vM0xhaXlSL0NyY3o5cnF2bm1SMS9L?=
 =?utf-8?B?bU1ia2lqVDhEUDlYVi83ZHRCZ29LVk94RGxwbDNJek1DdE84eU1nMUFSZ3Nz?=
 =?utf-8?B?dUpNSVdYWnczNzhJRDN4Y2JFOUNvYU9BLzFaNCtpdVZCRzlsSXVHTTNnaFE0?=
 =?utf-8?B?UXVNSWlRZzZDY0h0ejVMVlRyQ29YdC8wU2FQeTdieHV5SVg3K3UxVmpHVFo3?=
 =?utf-8?B?bUIvSnpFcnBlcEtvdnozSTRhbXI5eW5NbXF2eWpuY2xGVUMyelIrLzVlS0Ri?=
 =?utf-8?B?NTNZRHhzVllsTkJlQysrSnVFR0w4bXpURSs4MEs4cTgxNzNOQzkwajhNZTFV?=
 =?utf-8?B?SVV3NHhhbG9TSi9VYzdiMTF3Qnk2c2JIQTAxenFiMk9pVjFoN1hjdENmczNZ?=
 =?utf-8?B?aE9WT1RHdFhTVWdVV1drQ09ITkJoV1JCUVBlWnZ3R1hmRDV6ZTVxeVU3a2Zh?=
 =?utf-8?B?a3lBSDlZMU1WdzBQVENldFpXZEx4OFVENUIxUU5MWW1tS21nQmxzNnRQNSs1?=
 =?utf-8?B?T09ud3BJVXJrUkM0emJ4dm5aTWZrY1NYZnNnWlhOd1F3THQ1UUpWYU9xZU5s?=
 =?utf-8?B?dWR1US93SEpWNmo1aDVWRy9mMjhOZCt5akNMN1FBMHBYdmE2TzZwMUgxajFq?=
 =?utf-8?B?WmxIRkpoN1lzeWQxYi9PQWduRVhaSkIyTFNUMi9MTGMvd0p6NnVjSnRwR0l5?=
 =?utf-8?B?Vi9FdEJWZGo2R2FEQmlwYkJLU2dyYnlXbW4vdE9JQnlYVFNYL0ZMZk1RaFhI?=
 =?utf-8?B?NFRSY0ZONG53aE9JbnIvKzlmL0hjeDBIbWRnYmxxVzg3OU9WYW10cysvaDNH?=
 =?utf-8?B?Q1dIT2t1NmxueEwrUWhnVjVmQU5kRzNhWElCOUtCSzRaVTJsRUJMaWtxVnVM?=
 =?utf-8?B?dEdTRWdGSGNSNmJHcEJOaVVDRTV0dkZveDVmMHNzVUtjQXBVa0FkRHVxaWtQ?=
 =?utf-8?B?c2x6UWxVcThVQzJOZTJZN3hXMW9Gblh5WlJ0ek8yc0pXcnBlQmFkQWJqamNM?=
 =?utf-8?B?Uit4Mml3ZjQzQWVKQTN4K3lyLzRtU0FOWGkxWjBYN3dKSlo2cDA4Ym93MDVK?=
 =?utf-8?B?RFNyM3RuTUIvYThHTU1LYnRPUVlBL3lRVXR1citqZHkrS25RNGx4eno5TEU2?=
 =?utf-8?B?dStXY01hckpuMVFMbVIrZWQxb2lPdURnV044WVdJUG15V1dHS1BMc29qZU1k?=
 =?utf-8?B?ZWNqL0JlVk5qNUw0Nit2Y2tubXhuajJ5UUNCaEJSR283a0tDa0duUjNYUXp1?=
 =?utf-8?B?eTlmQk1OOGwrQm45MlFMRGVpYmduM2t2VkkvcFVpT1U2M3BWSTZGUEtUdVl5?=
 =?utf-8?B?RHJkYzJqUzdhNld0eFR2MFd0N2E1RkJjcjQzREl1UFl5RWs3Mk9TV0RoK3gr?=
 =?utf-8?B?MGMxWjJkdktSZDVVQmFPNjVmb3ZTU2sxZU9PSFZFcTl3K2tPTS9HMkJoWUZF?=
 =?utf-8?B?NmlmS2pPbmhJc01GUGhTWjZyeW9CZGFtQ3FTM3F2bDJXVE1ndGJyVzNLUmhZ?=
 =?utf-8?B?dXdSV3JHR3MvaElCVHEvWVdENVNWNTArTVZOR3lrcW1Eb3hrL1U1VDlqSGYv?=
 =?utf-8?B?U0Jna2Zzd1lVWFlWNHRkQTB5eTBoa0JCemFMbmZOZ2p4SXA0SmpkcDRiemwv?=
 =?utf-8?Q?WVTfPNVvdNXyaKRB9QRhh7E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAB9DB098F8CA14F99FB269678C6FACE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5371f4-ca9d-4a06-d4c8-08de2455a1e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2025 14:45:33.9652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofTEnDr3PTqouy3+4jkttIUXWVV3FWe5sT9jbhX/nJ4zFeLds827ndHyMSthh31oQuWsFZtC29IzIiFyohcaQlK1Y6fCdVz6WvopZLbzeqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6796

SGkgQmFydG9zeiwNCg0KT24gU2F0LCAyMDI1LTExLTE1IGF0IDE1OjEzICswMTAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiA+ID4gSXMgdGhpcyB3aXRoIG15IHBhdGNoIHRob3VnaD8g
Z3Bpby1tYW5hZ2VyIGRvZXMgc3Bhd24gNCBhZGRpdGlvbmFsDQo+ID4gPiB0aHJlYWRzIGJ1dCB0
aGlzIGlzIGludGVybmFsIHRvIEdMaWIgYW5kIEdEQnVzIGFuZCBBRkFJSyBhbGwgdGhlDQo+ID4g
PiBwcm9jZXNzaW5nIHdlIGV4cGxpY2l0bHkgZG8gaW4gdGhlIGRhZW1vbiBoYXBwZW5zIGluIGEg
c2luZ2xlIHRocmVhZC4NCj4gPiA+IE5vdCBzdXJlIGhvdyB0aGlzIHdvdWxkIHJhY2UuDQo+ID4g
DQo+ID4gbm8sIHRoZSBhYm92ZSBsb2cgaXMgZnJvbSB0aGUgdW5wYXRjaGVkIHZlcnNpb24sIHRo
ZSBvcmlnaW5hbCByYWNlLg0KPiA+IEknZCBzYXkgdGhhdCB3aXRoIHRoZSBwYXRjaCB0aGUgcmFj
ZSB3b3VsZCBiZWNvbWUgbW9yZSBzdWJ0bGUgKGxlc3MgcHJvYmFibGUsDQo+ID4gYnV0IHVsdGlt
YXRlbHkgbm90IHdvcmtlZCBhcm91bmQpLg0KPiA+IA0KPiA+IEJ1dCBuZXZlciBtaW5kLCBJIHRo
aW5rIHRoZSBwYXRjaCB3aWxsIGFsd2F5cyBiZSByZXF1aXJlZCBmb3IgdGhlIGNhc2UNCj4gPiBv
ZiByZS10cmlnZ2VyZWQgdWV2ZW50cyAod2hlbiBpdCBkb2Vzbid0IHJhY2Ugd2l0aCBzdGFydHVw
IGFuZA0KPiA+IGdwaW9kYnVzX2RhZW1vbl9wcm9jZXNzX2NoaXBfZGV2KCkgYW55IGxvbmdlciku
DQo+ID4gDQo+ID4gSSdsbCB0cnkgdG8gcmVwcm9kdWNlIGdwaW9kYnVzX2RhZW1vbl9wcm9jZXNz
X2NoaXBfZGV2KCkgdnMNCj4gPiBncGlvZGJ1c19kYWVtb25fb25fdWV2ZW50KCkgcmFjZSAoaWYg
dGhlcmUgaXMgb25lKS4uLg0KPiA+IA0KPiANCj4gQnV0IHRoZXkgY2Fubm90IHBvc3NpYmx5IHJh
Y2UsIHRoZXkgcnVuIC0gYW5kIEkganVzdCB2ZXJpZmllZCBpdCAtIG9uDQo+IHRoZSBzYW1lIHRo
cmVhZC4NCg0KdGhhbmtzIGZvciBkb3VibGUtY2hlY2tpbmchDQoNClNlZW1zIHRoYXQgbXkgaW5p
dGlhbCBpc3N1ZSBoYXMgYmVlbiBjYXVzZWQgYnkgc2xpZ2h0bHkgZGVsYXllZCB1ZXZlbnRzDQp0
aGVuLCBhcnJpdmluZyByaWdodCBhZnRlciByZWdpc3RyYXJ0aW9uIGZyb20gZ3Bpb2RidXNfZGFl
bW9uX3Byb2Nlc3NfY2hpcF9kZXYoKQ0KaW4gYSBub3JtYWwgc3lzdGVtIHN0YXJ0dXAuDQoNCkFu
ZCB5b3UgcGF0Y2ggc2hhbGwgZml4IHRoaXMgc2NlbmFyaW8gYXMgd2VsbC4NCg0KVGhhbmsgeW91
IGFuZCBoYXZlIGEgbmljZSB3ZWVrZW5kIQ0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1l
bnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

