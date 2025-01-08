Return-Path: <linux-gpio+bounces-14587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4502A0517D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 04:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03DF1643A7
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2025 03:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1CB198E6F;
	Wed,  8 Jan 2025 03:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Am6J/YtP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2127.outbound.protection.outlook.com [40.107.117.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F8186284;
	Wed,  8 Jan 2025 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736306100; cv=fail; b=T3QhjFzikIjJaJO4zoFqw6wpHQIcKDTvRZjWWr5RBbzvZIOdxv65gGLr2LmW7EhW+KGSosvHYDNV3YEkIYvZ3Z3nS9ggeZLUtFeJEJalUEijlJ+87EOoVBbaAyhKAGdde1kTGSglGVifj1s9NnL3duPDlbqntFxRd4l58szbcpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736306100; c=relaxed/simple;
	bh=xRPkc6zzNFXIQQDVwLd97CLMLd95A3MxkCPlEtlB7nE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M7Dw98cX/z6CSMMkv12zpscdD+++TLILGXF7SGfxgIOs4XZEvk/yKJhu0aI3u3B07UphVlkdRHarwF87B+JoPCNa+cotvcTEUq279q7RdGasYToCVhYPLCPILLcCyw5gwgwkMfBfKp91KxGcEdPavNtOEr8d6Voj00Y9CPwVWjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Am6J/YtP; arc=fail smtp.client-ip=40.107.117.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS3G/g11zCTGJkMi6r/OLlU9iAUzoHp1V/vIlxxtkDt4EFo2Kn2EAaJ90azRtgKpA6zC0LkYbBsYAiM4iId7wgCD3JK0kizs5ZK6dLGG1jshDD6gxaEOtqZF1ZM0u2awy/kyU5D4iVx+VGBpXFzTw8Dd/krIIyPLTp78YtPTd39cYByIUs0jXxltdKFOP0LgmWaJuLurpfTrKDH2G/MDc5CaTpI+WPGNcJWAggjkHU3XsonT5Tg5ga8P8GakUXN62pJxzp2NhYE89YS8/+TTRyDMeCjLMTrnGYiC7FlBwjRLgh36gY3NMGItz87KexvpojaYr8FtPM2Fda3wicYbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4tQTpdfFrdQLSfhbvMjMGeLcK+YOUWZWwq+UMOC2oo=;
 b=KEx3qNuw6eDvX9JsoVl7BHWwMWYKbCZYhrk56F3+MzhGYah/tDa1JHT5ckLlOQZNOMt9hOgJSacBu69lD9wuEaeesAxD9ND3hprfTK20PNyhpMJGeeGAn2q+Y6nOuACyNs2gSGPpIj5qif7xM60iPvDsMtrLqOAFysuu5KWyzngQQHALIHbkcrQh6ZVHgRfEPLuAk2jbZojJ35NOC/IPAH87ukCkEEzRLGLm/WQmqCH3i6CR+O6T3DDEUiCgA8M97KAtBoLF3/8Ixz4Byxc5tiPnySt7bsWZsv9Z5dxGc2P2NNy1dS1ButNOi6P1Gv+JDkfJqCTBg7c5yltAkWhLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4tQTpdfFrdQLSfhbvMjMGeLcK+YOUWZWwq+UMOC2oo=;
 b=Am6J/YtPN1hrQFTToVo19cxOypZo0BPf4Cvdf9z5C24NSfN94XtxcuiaFfar4DJvxLcMOHVe5QaEg7AMntDLFvtTUN4WVU8NR3BUYkyLD8eeRlzt9jBlJta1lYTclKqXlffyxc8LQguVNoIThj1XE2+WfqPoiavl2DPAdJxJHw1vTrm/Q6a0LufQMNdakLMgYGzQQzDuTt23EfYGG3WbRIEs20krk5oQiqOWmvUsMiUQZQaX5klr2GydqajfUaho3cRjyTeQFiuXiIzjLIhGz9OQDd9GS8vZd7L2tlQSucWiCbbYrKbweDZxgkZWhJIGGwGPWez1gZVakhUjXI4biw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7936.apcprd03.prod.outlook.com (2603:1096:990:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 03:14:53 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 03:14:53 +0000
Message-ID: <cabfb078-8aed-4e4e-8eec-194f2a24df93@amlogic.com>
Date: Wed, 8 Jan 2025 11:14:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
 <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
 <CACRpkdYrUDK9RsJ0VzksUNAyZ=grdQLAkMN1_BjeqQumY8bjSw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdYrUDK9RsJ0VzksUNAyZ=grdQLAkMN1_BjeqQumY8bjSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: f011fa9c-a3b1-4334-710f-08dd2f929ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0d0RDcrWWp2NHVKK2dldWhna0F0T2dZdUJWQk81T1hlR083ZUV1WnNTKytD?=
 =?utf-8?B?ZUlrYzJMbWE3QU5UUnlBQlc2aUVHamE5OFAwdFFuRFphaWNLZFZCYlBHQjBL?=
 =?utf-8?B?QmVLOHM2QjdGK0czbXVTQ3FjMk9yNVpzSnNzaE04Mm9yb2NBR2owYjlja1NO?=
 =?utf-8?B?Y1JBanFnMDBJOCtIbE1sTThXNy9VRzY3cW8zMEoyLy82VE1yRjFDVEVZQ0Ro?=
 =?utf-8?B?UWNTdGRIWURia1ZqSkwwTW05TzBlZEJtZFUzc20zVEMrRituR3VuV2ZyUnVR?=
 =?utf-8?B?a3VEb1lyMlhDYkRNTG9KRWFRTURJNEtFSHZtRS9FS0xVTEtkNFFOaVpSRlFK?=
 =?utf-8?B?VzFGZFEwd2tsczlDOHc2Q2RBdnRlRkphMVhTNEdJQ0x4UXVyMzhrcS94bEZm?=
 =?utf-8?B?Q3o3OUZMaFVqdlFxeWJTTmsyR05JWTc2M3l0T3dhcWlHbEVaTmYwN0NSaWNR?=
 =?utf-8?B?OU5oODhrd3VVKys3U0dHL2hDaGtWRi9ZSXVnNUd5WkxrQWFMZHA0UlBtQ0wz?=
 =?utf-8?B?a1czMnJ2VVRiVXZFdFN2Rk54SDhqVEZPNFBHQlczTTd1R0FGL0xLNUJGalkw?=
 =?utf-8?B?S0tDVUQ1ZUNqOWlZUVk0Q1RPZlU0dENCMlY4L0lVdmpncHh3V0hnNUJLdEIx?=
 =?utf-8?B?VWQ4ZTZyai9ZUVdYaloyUjZBcGw0Q0hDTVV6SW1rek53bG9EbS9TeXhZQkNz?=
 =?utf-8?B?L0FDMGppT1VEamc0YVE3RjYvNHBjMmlvQ0lVU1NwUkRYSG1SaVlCb1JwMzg3?=
 =?utf-8?B?Z3drVStvYmxJcExKV012aTM2bWtxUHp5dWEvd2hGRERPWFlkaDFldzdmbXla?=
 =?utf-8?B?blVDcklNTWtjcVR5eGJRL3Ayd0pkTVZDREFHYU5xWjZPRWh1cnl0WHQwOFNE?=
 =?utf-8?B?OUpTN3VlUmZMVjZHLzd4eFpJUWM2QTFMbjJ2MTZheDJGS2JVRXd6YllKSW9J?=
 =?utf-8?B?OXpPa3lsbDg3UzNCWnVwL0NkbU00WnMxd2lCTkZsNjE1QmFrYS9pUGxyOGhK?=
 =?utf-8?B?RHZJUnR6bHpscFZuMmFvMjJ3bzBJOEN6dXhHQ3ZYKzJaejI5cjNVQ0RJd1dH?=
 =?utf-8?B?clluVDdQVytwL1BBbW1nOEFWSXNlRlJVamx0OTI0TkRWaG82b1lTa2YyNzFR?=
 =?utf-8?B?UTRzZThLditiUVpId09ud0Q0dmhtVGRMUm13Vk90RysxQkhvQUN0d3RNSmt4?=
 =?utf-8?B?Y29ZdmhXOUd6S0dJQklHazcxSGpTQlpndlo5WlJSbGpFM096OW90aFdETlRH?=
 =?utf-8?B?WW9VaVM3U2FHZ3hhRzlpeG5ScGNSdE5jWDVUK2JJRjNYYVM2NFRRdU9oY0VK?=
 =?utf-8?B?YXNVYm1ZQ0szZ28xM0UxbU1NZVUwVEVqTlZiK1Vpalg3N3ZCMDRrRG5ZWXRU?=
 =?utf-8?B?N3VmZHhVWG5qVkE4SFBWeDB6L2EzdFpNRlJjWmtQVEl5elBtNko5NkVjaHlm?=
 =?utf-8?B?Y3l1U2pQWFpwN1NWTVhUMkpJQkQwSS9ONmllS3FlU1RGK0Z1S25BWnBLb3o1?=
 =?utf-8?B?WTFXbGFLZFBxc2dVa2ViT0MxamNpZW04RHdvcWJ5ZkppRUp6c3l4VnNIeU5B?=
 =?utf-8?B?SXh4R2IrdkdUYmtjZU1Dakk1eUVqcnF5NzQxbDBjZ2dYQzA0eGhVeUNxdzdk?=
 =?utf-8?B?UnMxZmZJUHdwUnB1cUtScG16ZXU2bUNtY2NZYkpXYmx5bVFRaXNXT3hhT0dV?=
 =?utf-8?B?cG9BZU5EMWlYV2FEUVhKdERrMU44TXMwQnhPRFBBMkhySmJWVHBRQW9SY3Fh?=
 =?utf-8?B?N2dFeG9SaXdKdGhvRmg0Z01hL3hhcmF6YmhqNHJNMU5kQkNncGk3VzdmZmJB?=
 =?utf-8?B?a3gxaTVNSTBMWHM0RS9IdmlTeVNSSU4renNHbnFESml5bDhjNTBMWlFpVDBC?=
 =?utf-8?Q?CkBUkwumTuU6M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDg1aUJTYjdGN1JhSmFBT1BmSEhFdXRDQk5WMlNuZUt4ZGQ3NXlpMVNNeU9K?=
 =?utf-8?B?b2Y3WTFpclRLemEyWHA0UjFVZEQyZkhRSXpFbzRBVWU2SlBpNXY0Ulo1SWs2?=
 =?utf-8?B?UjFWbHcvZFZhYllXQTFJcVpVS004c2VnR1J0RloyUmpBT0NuNnc3TVVGMWUz?=
 =?utf-8?B?bnNJRW5UUGVOaXp0eHo4Qy9oQUV1RGlJVStzcGp2WGVGSk1ERGczL2tSSkdz?=
 =?utf-8?B?ZzhrUGlUTkZwdDdPSHB0eU5OdHoyaCtGWEVDRDcwdEgySDJyTEtSWEdJTDJL?=
 =?utf-8?B?VXBnMjNBeUk2Y0FwSjl5aURNY00zVUZhMnJHYTF2M0Rhbkl5M1lSR1R5WXNk?=
 =?utf-8?B?Um4zRFlpOUQzN0crcmhGQjNWTHRyMzRiVm5vbG0wc01KSE9UVVJ5RlUyZEEz?=
 =?utf-8?B?WkRnZjlzQk5nL0Q0d3h5VXJMYTRWeXR1UkVNek1LYjNzZDFCZ3JRakNkVk5u?=
 =?utf-8?B?dm1zMi83SlBOTURCSnVrbWxkRGVKMlI1YnFWMVNjTFNvQ0lKSlBFVHcvbEcx?=
 =?utf-8?B?L1FpMExNWFJvRDRXSFExZFBRcEpuK3hmNnFYZVI1ZHAvRm5ka3B6V0ZHWVVQ?=
 =?utf-8?B?c0RtcjliM3NnQlNDdHBDMHpESDUrbTJjQmU4SlhXbkhJRzA5NWRydkxubmYw?=
 =?utf-8?B?WjNhR3hPVlphRitYK0VYSytmVkNrdk1EVkJlMUYyTFZjY0NoclVtenNNQkJ5?=
 =?utf-8?B?U0N5VThmcDA3UGs5dFlmSGlnMlYybTI1MytVQkNlc05GVGo0S0ZTOFBHR0ZN?=
 =?utf-8?B?VFhNODhkMmMxdEtmV0x2dGljaDR6ckN0UXlNT0RjMEdZVUlXbnNPaVZnTGZN?=
 =?utf-8?B?R0o0emJUTyttN0FvV3FOc1NBeWVJay9uZUhZUkswa2piZjljOHpIZzdVWmoy?=
 =?utf-8?B?Y2EzWkdRZmU1TzM1dTFyWlA3SlRMcVFVTWJzTE5XWk1wT2NIUmlFVUNIZ0dj?=
 =?utf-8?B?ODJvVzZ0NzI0cW9MWmFwQUVlaEFveGlNdlM1ZStLQlhJYmhyTEtpTmYyWHNo?=
 =?utf-8?B?a1lxcncrdzJTckxLRHpMMUZ1WldVUHd2aDVZRWtOeWliTkVvVWJUVnl2YStL?=
 =?utf-8?B?Vk1ncmhYQmtiQUhFSnByZnV3YitaZ0tjSzJ0ek9DNmFqa0FEUHQxaGhweTNG?=
 =?utf-8?B?VnBEZ0l5T0NHVzJ3YnNnNitCSTdkWGxFbWZKZ1VteHVSOHJDa2IwM042MXM1?=
 =?utf-8?B?dy84QVArZm5YdVlFWjgrbDd3TnZ5WDRhTlJxYUdEWXRBUHFMQVZpZm9RalZK?=
 =?utf-8?B?YStycjhPMktVVGgvMVpoS3dxb1gwaVNtTG9idmJwNVY5MFRZU1J3Z1F3aEx3?=
 =?utf-8?B?VGZQS0FqZGJTcUgvbVhZWURDc21oaWw2RHdnZ2hObHlmaVBVcCtTaG5uZWRW?=
 =?utf-8?B?aHpTczFmUHdTTG1wRG8rNzQvUDdSdktPVWQrSjc1YjNFemVreldlNXdGOW4v?=
 =?utf-8?B?a3JrbjN0SE1KTzBPY05XeGNIb0hBR1ZEZG13TmpibDFhTlU1U0l0amRwN2dV?=
 =?utf-8?B?YTZYcWp2THJVaDJ0Qjl6NFFPczQyTDJxQTlIbWRoTDRDVU9nVlMrOTVtOWR5?=
 =?utf-8?B?OHl6bWdkQ0FNMm1yUWRNRDhZaTFVUm9TbWEyOS85b0RFUjRDVjdPSGFCeW5i?=
 =?utf-8?B?K1Jvcm1YTXJOV1lDK3E4Ni8zZ1ErOGg5Q1VpdmpkNDE3b24yYmZkaWV0VnZo?=
 =?utf-8?B?Qm5abUgwVlVRZTJRdXZRYnp1VjhOSXF1TUNrZWNxSXU0TDdQZExvclgxZkFw?=
 =?utf-8?B?UW9FYitJQ0Q0dE1mSUl4UVVweGd5bUVUWGQ4c1B1N21zK1dybW9BTFZSQTBk?=
 =?utf-8?B?Y3ZCZWJSaFh4TGJHaUNwdTdPL2VrRTNnMVhLZWs2ZXVhNFJyYU1hS3NBb25S?=
 =?utf-8?B?cTdDQ1Vndy9RUjJvU1AxYWNLdVZBcXJPd1haQkcraytjZ2J0ckxFWkpZL3hS?=
 =?utf-8?B?c1BrMDdBQkpUdS9DWCtGNTk4aDNHcjA0WlRIUXo4Y3ltZXZ4ejBhYzRqN1R5?=
 =?utf-8?B?RHJxcFpOZTBDVU1DaUpnWE9hUjRxdktBMXVVQVlsOHJ3OW5JTFJRcFhDSlJU?=
 =?utf-8?B?MHFhTTRadWRkRFMyV2pyRlB0Qm5VZU5LQVM1S0gwZXBCSzN2MkZVVmZ6YXR2?=
 =?utf-8?B?TGh0dE45d3FHb25ISExxaGkzcXUrVDZ2dUhqcnlhM1NQbXZGaTZMR1RjMkZa?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f011fa9c-a3b1-4334-710f-08dd2f929ec2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:14:53.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MF2CLFgRGyzd8US6NR69cY+KXgahi/v/vqmDdyKp0B0eUR4otEEv5EBF/ejVgGAP5/lTR6WYQI1cQBm82T2w3AIgtRRqRiPMEgl8KVSrT0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7936

Hi Linus,
    Thanks for your reply.

On 2025/1/7 23:18, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 26, 2024 at 8:57 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> 
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> When describing pin mux func through pinmux propertity,
>> a standard API is added for support. The pinmux contains pin
>> identification and mux values, which can include multiple
>> pins. And groups configuration use other word. DTS such as:
>>
>> func-name {
>>          group_alias: group-name{
>>                  pinmux= <pin_id << 8 | mux_value)>,
>>                          <pin_id << 8 | mux_value)>;
>>                  bias-pull-up;
>>                  drive-strength-microamp = <4000>;
>>          };
>> };
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> There are some build errors, but I really like the path taken with
> the utility function here!
> 
I will fix the issue Reported by kernel test robot next version.
> Yours,
> Linus Walleij

