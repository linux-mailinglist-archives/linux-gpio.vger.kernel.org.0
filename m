Return-Path: <linux-gpio+bounces-7962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544059254DF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 09:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FFE284488
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 07:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4A0137911;
	Wed,  3 Jul 2024 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="VTcdq6FN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2116.outbound.protection.outlook.com [40.107.22.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C722C879;
	Wed,  3 Jul 2024 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719992616; cv=fail; b=U3Wg3J3hEFq/2mB++QZ/Np9kbLVyGnix0P3yXt+NgLKnpi4Yt03aKOvHJKvp8J4fC3iAP1lJEx8Q8mHLT1SCMLIekZtWaZwsrPu14d3ENoSu0eo/WEO2WHAWmfgWNf/fCXn1XbIA04Fp2T92IfZWAaTKb+anxlSFtJH2yD1dpmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719992616; c=relaxed/simple;
	bh=r1Sh2FGZkh0H1GMeBfWNCj16TsvWH9E/vhpBXN4ipnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ka+VjtbmICWZZIqfoqZ37i5/vtGsj4OOoDF/77d63JhzLskmTYJuaYpFfjTTb1YCLZv+TtpQ/kQXb/cPnHo5lEW6JF278TCZShdnd3QiEigHtSif/00M0HVkl0OH6htABNjakCavAya1XfZpiNOnTkO47/cP12k3EV77B80fAi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=VTcdq6FN; arc=fail smtp.client-ip=40.107.22.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E023sY7HkdfqLJaXZeJLtRc380C3Da8vg+kH5csTNct5+O0CDK0MKlaB4J2lIVufIt0H+zlAHbKoRcDm2DGEWuEUAYStg8S0it0f5mmyqcZt3zpK+axZEieRr/Lryo0LIHCSnmtqLeAlZ3fViwQVX/EOCDG7za26DnWoliizjgS3g33CpEpe9rsBjx99eShIRi2TcoQRx0Vzf12zJSDmnrE//trqp88zSbe7Huhj9XiJGyrZKs8CbunOLlfO01AWhuixloy0A4thpwP3YE/jix493J8xzpyhCejV1gKsk0u/ROYtKMgBqdvtqI4GMYVU+uVIU3sK39j0q7W5KH5BYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+D4nYTcoxXKoBTaX64BmXATpVA+GRBIRC2YrL9V3L0=;
 b=OAaKjRnX+8pPryEUpCIeU0vn3PtaY4n3LBkgBuqzuhq+wmSoQsAMc3K/iX08BzHVHGqP2bJRTHfDfUt557MnQjVzzbko6Z81DcPXQflZkvpSPpOpIKFWP5RyE2s+NHfN1ZzyRarTuqVwozmIyBD6989Kinlqd0ynYfjGiVHb5c88UoeXnVS8iTZTqStLJYt4rPMYweDySrLahlcdCSfiK163gPwJZ2/T48VDDBcE6r8ZixExgvX+G4XZB8KodrbNlvBQRg00DgFZLBCxZWNc5UVA1Gga75l+vjlik4JP244ZqHiaFXNZ7CeLb2AcXf5ltwFHt+ZoJLoTnVAr4d7Rfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+D4nYTcoxXKoBTaX64BmXATpVA+GRBIRC2YrL9V3L0=;
 b=VTcdq6FN3oiYWK6whGe+NGEo2XGKSk3OHYD/MoWMp8Jle1LDop3CCyxOsBvUCuzmH/LqM+EcsQB11ycdIc7kUjROsmkqbu+Rhj3qe4T9bq4A+v/yabaGlGl2QcBIFyc++10f6Ya9AoEKCI20GRRUCLB1gNQFBih2J1CLDGwtU0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB5919.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 07:43:28 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%6]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 07:43:28 +0000
Message-ID: <3dda06a0-dd5b-4264-a142-562fa7bab3eb@kontron.de>
Date: Wed, 3 Jul 2024 09:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: gpio: vf610: Allow gpio-line-names to be
 set
To: Krzysztof Kozlowski <krzk@kernel.org>, Frieder Schrempf
 <frieder@fris.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Stefan Agner <stefan@agner.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peng Fan <peng.fan@nxp.com>
References: <20240702103155.321855-1-frieder@fris.de>
 <20240702103155.321855-4-frieder@fris.de>
 <26ad845a-3fde-47f0-8541-fa8c751530b2@kernel.org>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <26ad845a-3fde-47f0-8541-fa8c751530b2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c96def-3aab-405a-bd36-08dc9b33d3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0FpQSt6SWZIYjdxT1RLbmNRY1ZFU3NYR3ZiemdLT3FlR1JMR0dCcHBLd0xz?=
 =?utf-8?B?NHRhdDd1NFd1bEJkMjQ5Y1RCYUoxZHFIM3lNZTdTZFdLdGRkSWZacHMrSkhK?=
 =?utf-8?B?S2ZiV094cUt2dXMzNTUzL2d3TmRrWGlTbHVnSDRGcjdjbjNPVUJEYWtxMlh4?=
 =?utf-8?B?Q0xqSFhBdTZuY3c0OWsxQmR0MTVpRDhHbEdpUlAwNVlLb3lNN1JSWjZ6R3BH?=
 =?utf-8?B?Y25sQmVwcWZqcDhNdkJwQjlxT0tQRm9lTnVXNm56UEtpREZCTlNaQ1JtSkND?=
 =?utf-8?B?TmxPcG9WSHdmTThlaDBMODBvUWhTNDVrcFFPRE9CRWYxNXRXdDlRb3lvZ3di?=
 =?utf-8?B?Y2t3MlU2Nmw1cmFFN1FMMjZXQ0ZNVy9taDNRY3pPVUhxT3FLc204U0Q2akpl?=
 =?utf-8?B?ZWgvTG9wRy8rdjlZazlRR01nUUYrZTJnNUEwL3V4TEFtdUhYamI3K1FyS2hq?=
 =?utf-8?B?SlZTS1ZVZzZIMWFlQVdjZ1NoTzhsRWRzd2F1NjlmVjhERnM1eEgyN09jcGxW?=
 =?utf-8?B?NXY1L2ZiS1VPNkJwcmtNNVVPRWZaSytTVzkxYXVoUEVZdzlKeXVISnhBSTA4?=
 =?utf-8?B?U2tsVWFiMC92YzN1OGloQlJBeWpISFhPSDJaOWtKQW9FdURiTmRWNlB5MFlw?=
 =?utf-8?B?RlZyVWVqajl4SktkWm14UHVsbGl3R09oOE9renFlR3VRWkRtMnZ4eW11Z1BR?=
 =?utf-8?B?eVVBa24yS2F3UmVwQmNHYmNrQUc0M0dtOXJlUWV6Qm9FUWdxOFlSems3YVJr?=
 =?utf-8?B?SGJMUFdTbWx2aEVpNzcxK2ZOSTRrUXdzME9sN3luc2hTWWlJWEx0NWp5MFQ1?=
 =?utf-8?B?QWN3OEpZQkxUV0pINm5BelJreUc0RnhjN3J6ZTdsdGdGakZDNHZsUnZGbXFI?=
 =?utf-8?B?NFFPVncyTGc5eXVJbHE5Q0NCTG9uN2VlemNKMG5tUVBXVnhqRnc4QkpOK0c5?=
 =?utf-8?B?SzFXR1RBM2lieVFNL3RZdWUrSlhzUjRpUmJYaks0QlpXYTlMWnhRcEpIRG80?=
 =?utf-8?B?UFdYRzJkVm52YXRJRVRFSXZCWDc0NEkwemJxYmxJNVlmRGl6c1lNOTRlZlA2?=
 =?utf-8?B?c2huTGZZdkFoWGdVMTlyaWx0MVpiOERFSGhqanNneURsL0ZYVTFsNWVBakRJ?=
 =?utf-8?B?ME9hekk2eTFhemVCY2dONWlCUDMweFFFVm1za3Z5eFVVTEcxcU5WL0xESUI0?=
 =?utf-8?B?UUpPQlRYaWdud0dTZVJQR01DVDkya0xSVjgzdko0N1U0V1Q3TjFyN3lpWitn?=
 =?utf-8?B?cStUdlRXSWZ3MW5wd0trdmdqWnlpMklheDl0QnN0ZVIwRGtPQjVTZndyT1F0?=
 =?utf-8?B?d2lKTXNWMTJ3Q21kZVIxMCtRYUpaenVHNWxwbnJ5R2hnMEM1TUF0ZVI5dmNB?=
 =?utf-8?B?aFFqYXU0alhuL3hXQmQzV3IyRFJOSHlVYTJmb1F5amNtUzJuM2kyWkdYekp4?=
 =?utf-8?B?UTk2RUd4SGJiem11Smk3NXN0MmZVSWdlZ2Zmd1pZOWtvdStjc0dhUnFOV09u?=
 =?utf-8?B?Z0xCMWg5ZS95NUY2b0d6azhVVmxuMEhKVDVvVGoyUW5Wbm5kaHVDTzNEZHBv?=
 =?utf-8?B?WmhDNDZOckpBQnZSbW5ZUXpIeU5WMU1makRYV0NqLzl0Q1pnMEFBYlVRZjNx?=
 =?utf-8?B?akM3aFFUMkFTQ254dnd5ZWJ6cUR3aERMSWEwcjdOaDRuVGtTdnE1YU1oL3o1?=
 =?utf-8?B?VkFyRXRvYU5kNEVycEZGekYxV3FpMnM4b2lvOWZEVXJ1OWNzb24wWlJFRDB4?=
 =?utf-8?B?VjB5aWZzdTB0cVZkODdqUStDaW1SV1cyb09YZEZ1ZFhkSENIaTROVUl5ZlRm?=
 =?utf-8?B?UjBPaDNLMU9xZTFFZVhCSDRFQ3VmNVY3Ui9GcEJmd0dYRzNHT3p2U01VMmpM?=
 =?utf-8?Q?puz5E8OZNWG29?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS83T3h2K3l6SHJHanY2Wk9ScXFBZWNSbm4zRkJyNHQ0N25mQWJtNyt6L1dU?=
 =?utf-8?B?NlM4MlZmT0NFQ0dCN3ZEUW1aSnJaR2JUMDlBNmJGS2hxbHJsU0xxUS91dUNw?=
 =?utf-8?B?NlRQZnU5bERvbFA4S0hFTDgvTzd4RHI1TStuLzc2R0dUelRDZVRJOWozTy9U?=
 =?utf-8?B?ZytZcVV2WmtGWGRtNnFIeWtJdHBtMWdRam51ckF5N3g5VVZST1NEOHR5RGNE?=
 =?utf-8?B?MTFhQUo5VFRQa0V2WXRGMG5XOXBwRTJuQmZ4aFcvR2kya3lScllGaWRTYUdh?=
 =?utf-8?B?NWxwRXlqMlhlSHNRQkZpem9xRkY0RFJoZnJTSndaVjFkNnVSL21McXVibkl0?=
 =?utf-8?B?THJTTXNkdytmTmZETEVhdk5JajlMQkJnOHBLanFhNHdQNUYzZnFRSmFON2Zo?=
 =?utf-8?B?L0d0YkdpRllhVWs0dm5qUXZZQzJtcEUyRUtrT1o0YWswelNsdjNNYnl6b21n?=
 =?utf-8?B?UjZCY29waS9vak9KQlkrUm9iTzRTYkIwaGRtQU4xZmZoSHJOZlN1N200anF4?=
 =?utf-8?B?ZkVhdmoxYlFZVmRPT1hvK2lWdnNCVnhXeDlBTVBMREZEL2h1OTVJS1d3MTQx?=
 =?utf-8?B?RE5CVERFeWR3ZGJkRW5oOHM2ZU84K2dCU3piV1o2TXpiWVpNTEdab3k1RHRk?=
 =?utf-8?B?UlRuVTBLSWNURnVpOFp4c0xoZjVVSW5VYlhzaXJpL1BuV0R6blliVFI4cE9H?=
 =?utf-8?B?aWZZbW44b2ZNMWsrZlpOWWhVL2tEN2hyK0tuU2Y2dFIxUHJDd2VhSXFMNFR0?=
 =?utf-8?B?WXQ1UDdCR2Rqem9ZNTRnYXZKK2l3R1k2R1d5S2pZbnVoUzVQdmRNZ0hxL0du?=
 =?utf-8?B?LzY2RGh1QmJTTGtlZy8wbmhCMlVqL0J0NmtZYXJwMTltaDdiYnN4V25XVHJJ?=
 =?utf-8?B?SzdySkhBcVhvS0ZBbUw4TkN0ekh5d29mQXk4azB1WW5BaFJjZERxMjRUajZH?=
 =?utf-8?B?RjNaSGVOeTcrdjhpYk9wcnRLOXFMcEs3cGpjdjRNVW4rZ2lKTzhGMDZtSVkz?=
 =?utf-8?B?Wi9MQVMxOW1TRUo2VTVSYU53WUthcU0vbHhBeHRER0hmaDFwS2VidnIyOWNv?=
 =?utf-8?B?V0UyVU1IYjJORmxINXBweHphT09lTHY0cTZDcnpGQ1BJWXZtUWYwWlkwTXY2?=
 =?utf-8?B?Umw3WXB6KzEzKzBPVmVFNnFHdW52d2cxRkdvQVRmVHMvcHk4UzFaOFpBbEtS?=
 =?utf-8?B?SlZKR1J0OVJRMFNNelNLdkRRMFVtN3VObE9rUVlxVVN1Y1A3TDQyUk4xd2xJ?=
 =?utf-8?B?RHFRTEJKQlFvOE9yYWY2Tk1RMHhBeStNVVNlMm1GNlRwN0NYUnJWQ2lLUC9y?=
 =?utf-8?B?QUxQUlh0bHN6S09PZ0Nub1BZRmR3VTlBdHdRNUw0Ym5zOEFMZmQ0Rm9SUDJx?=
 =?utf-8?B?eDRGTUM0TGF6azZ5Y0o5Y2YwNGRRQlFpR01QRElqTWVxcGxGSHlRUHZIYWRw?=
 =?utf-8?B?SEZ4bVozTzVIOWlmaHBoOFEwTjBVNVVrWFh3TXNtNmxvZjVBc2R1UXRDUjNV?=
 =?utf-8?B?aEFnUGZZOUNWbnE2WGlLUml0UCtnZ1lKQkdscVlmeUVYNzV3MGdIbFNpUEdH?=
 =?utf-8?B?SHB5TXZONUFZZWdXRUpVaXBIVXdrdE80dktqM2RaWFo3akJKU25HZTFCQUhk?=
 =?utf-8?B?YzF2MmQvTTdNYzNPeStDbXRoclpCSjNvTy9ZTnNjekUvajUxbUFBNTRESTZk?=
 =?utf-8?B?UnREb0twbGpoajVIZmNKMjN2aTR4Q1VtMERwQkFlTWdJeGJnak9vRjlTYVFy?=
 =?utf-8?B?RWEvWldpSGFQYWJLdmpZQWl6TGlKSWFTR3VMZVZOUWR0S2FYQ3lITFBrMXp2?=
 =?utf-8?B?aThJODBxZDd0bEhNYzduMUZJeFFQYXh0d0hGRGErSjRiU0hjTTJ0YW9UV0Za?=
 =?utf-8?B?SU1YTzJMQ01lc1htMXV6aDVtaXVNamY4SlgxejVGbUhmS3RyU0FKeFpoSUt1?=
 =?utf-8?B?WVRvNHk1OStERDREaTkvSjlFUFdHMGJFRkM2b1pZZHcvb0tkdEpoRmtueTZp?=
 =?utf-8?B?SHVuOHRiU2h0aGhDaWhxd3pDZStHaWpRSlRoUjlMMEkzUG9uenZtekF0N0pt?=
 =?utf-8?B?d0JXSmpCUzRGb3hqVnA5cFdrRHZXellmdmpYL3Vkb0hjVDFEcUFaN2JNWFFP?=
 =?utf-8?B?eG1kT1RIOG1lanpCai9XMzJ6Q0NRNDU1MHE1eS9ySENRTHQxV3Bkb3ZCbEx5?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c96def-3aab-405a-bd36-08dc9b33d3e1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 07:43:28.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Fwr9R32AgKz7VeaCNmSG8waH72Av1qDrREevRanwWRjNJAUvM0TTkN38d3IpR9OZqtif0PTCFtMPCFBbtZPZlx99vU0rKSB8HoLaG6aFJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5919

Hi Krzysztof,

thanks for reviewing!

On 02.07.24 4:23 PM, Krzysztof Kozlowski wrote:
> On 02/07/2024 12:31, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Describe common "gpio-line-names" property to fix dtbs_check warnings
>> like:
>>
>>   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000:
> 
> There is no such file. You cannot use future work as reason for a
> warning. Simply such warning does not exist at this point and
> introducing warnings knowingly is also not correct.

Ok, I will change the commit message and not mention the warning.

> 
>>     'gpio-line-names' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>> index a27f929502575..7230ba1a386ae 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>> @@ -50,6 +50,7 @@ properties:
>>      const: 2
>>  
>>    gpio-controller: true
>> +  gpio-line-names: true
> 
> maxItems are not known?

I will set "minItems: 1" and "maxItems: 32" as this is the proper range
for the number of values.

Thanks
Frieder

