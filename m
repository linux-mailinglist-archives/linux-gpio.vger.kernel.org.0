Return-Path: <linux-gpio+bounces-28976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFD1C7BE8C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 23:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448A53A67F3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 22:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B856227FD5B;
	Fri, 21 Nov 2025 22:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="neUcpbFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021114.outbound.protection.outlook.com [52.101.70.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D6230CDAA;
	Fri, 21 Nov 2025 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765658; cv=fail; b=tBOVGVJo4PT3fuMfkdrbYskiKA6MDJbwKNWdgBObGNfAsjfW2Y1ntrLuCrx4/w8yAOjYKv3l1gJI87AwFfR6zWBCisJ1saEEJEel43fy9YBfpS/ynrfMKyrY6d1JpAoFOfFR2vgWVL7b8pc7w6j1u39EPF5vqgoTyFM8SC8PfR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765658; c=relaxed/simple;
	bh=Al2+xs3LfnWOi/rO2jqTdT61aSfyUhae5gmMVgZa0Z8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SRNz7SW1tF6zmTVh8ZIVixKnxOL9FugUNjBMPUmvHDs/9UPd5FicOqMbwEdHrc9jCyzo4NXhIAGVSpt/QPMXuBlO9hYpa3Be6MCx1dXLj4cWxbceyhtxJkC2x4VZRnaaoM+p4MWK4nq7rVGZ0vDqyYp+IxYq1im23rK5xxTHMuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=neUcpbFp; arc=fail smtp.client-ip=52.101.70.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UChV+YHraN5sJnIYBX7YMykvQtkcTI9QPTFGy2T128R2o6RwhV3MpjfN6+FnqG9z3CcuJGhUl5yuIw1rHcequPMsrcHhyXWEm4Os6hIIpMSuMlpqaMzolX4igNhNGU2jvsxGUOouNFi+96mCYg1KOp9XyLoUca89vQp3sDRUf+pAkVHL8lqKUwjna3oz3umgACi6YRGXCOd+nRNyW4B6Ag3BRIti3HnaW+SP5EcTyczr4kyBIg/xNK7zVKdqHzoM831HjxGP8p2F4zqJJV7v9+Cg2OL69+pNT5klRnDHwjf09LvLB8xBoM1hq5Y7+kf96wKg4Z/7vBTAxu44/e+AZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+am8W/sJ5dZmGrdSXuhD25sZGXOgwVp3o6Y0MnoTCio=;
 b=C8K4aupHoPvvu9Jz7h2xxCrp9RZK2porLQAe0ZT+GljDqlWkiSomBjy+ioJML5XEwnQuZ/93DiYwsa3Vf9ot/rEtDg7ijJnRoK/YFMUJaok+HAToe6HcYU13iecN2r6E4E1ZFPNX0BNi1p6zFPZTSJ/DYmHReosbakzDRHb+ebwkfTiITiShZ+1yIJUy/klUuO23UW8o2kqairNIUBME7jvb4W8zhuS1CRiSX+oagHYE/+LRHLPyawzuUbH4rzdFxq2Bm0rdQs3c1bKsWxe3QP9RhTgeznDiB1hOGGT/MWtpJvX24/ZYzrNdF82jBx+eWDppBtt/TfaWS9Y/uqz5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+am8W/sJ5dZmGrdSXuhD25sZGXOgwVp3o6Y0MnoTCio=;
 b=neUcpbFpMGZN8/FphbCXRhlIhx3KsQZpETOHneeJSoT1kFw/vl8Vti44nmSmzoJZJoQOSPJXxV9uHEQmJEUspIOEBXZUywVqQ9zyrsIKCPxPbulhjd5T1ZSJLMfGtzc6cnV1/GcL+ZP7O/Moh9UkkA8eY62z1tZl7ZKEs819eyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by VI0PR02MB11576.eurprd02.prod.outlook.com (2603:10a6:800:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 22:54:02 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 22:54:02 +0000
Message-ID: <0bda62bf-c0f1-49c8-2f86-8128b5c92a0c@axentia.se>
Date: Fri, 21 Nov 2025 23:54:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] mux: gpio: add support for ADG1712 quad SPST switch
Content-Language: en-US
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Srinivas Kandagatla <srini@kernel.org>, David Lechner
 <dlechner@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20251121115750.20119-1-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::23) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|VI0PR02MB11576:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad6358e-ad6b-453c-7f7d-08de2950dd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkVlTjhIWWhWT0RDR0V3NWljczdML01PYVFXYVBCV1k1MnpPeFViU2lycTZ3?=
 =?utf-8?B?WkZnU1V1NlN6aHg4YkJnczN0S2VPYVJMWG4wYkdxT3dCQUFBczVFWXZvajY4?=
 =?utf-8?B?S0RHcFozRXArRkR6QUs2R0J6WUxnSGdoWkRZSU80RHNoYzAyd0tFeVg1bVNv?=
 =?utf-8?B?Mkd0NjY0aDZXNGNKUzEzTjJteE01RFJlQmpmS003R0ZnYWo3MGxKVzRIc1Za?=
 =?utf-8?B?dEovdjNpK0ZKRm9hUXAyRkpERXBSd3lNbkc3cWV0VURhMzRLdUtMZEtYbUti?=
 =?utf-8?B?YUFKL2xJbFZJb1M2b0p2YTFBUkFmZHpvNEowc3g3YlFBb3FPT3haeWVPellW?=
 =?utf-8?B?VFY4NmFWS2wzeEZpd1R3cE9vdkpySks0RVVaaEJuZVlRdnBmbHVWcDZHcFda?=
 =?utf-8?B?QkN6VXBMMjhTbDRmZXFFS2VzU044NFRBVmdlM3ZsQk14ajBPZzF1RE5pSENu?=
 =?utf-8?B?TTZ2WHlzNVRDdWx5ZjF2WkhybndRdHQvL3R3VGJXcGU1N3hjbXdlM1dTTjF1?=
 =?utf-8?B?djUwTkVaRk5CenBIOXhyeXJVTks5UFd3Z3B2VFBxanZOQWlRU3M5ck1pa2FI?=
 =?utf-8?B?Qk9sQ0w3bzhzVzNGWEc2YnhjT3hFZ0Zpb1FRZEN1cFJ6Uy9FSFg1NURFK2dD?=
 =?utf-8?B?Z1dyQ3RBV21kK1pxdjBzUk1BcXhLdGZsT0xsTXJBYTNBRkdsMUJJc3drYWxD?=
 =?utf-8?B?WXlqYzhkbDFDL001eitoRHZRVWFINEdEdVNWRDg0V1FMOXNjeGtTSjZsczIy?=
 =?utf-8?B?VjNoOU9MWGtsTXROZzNlNzFpU1o3Q2x3ZkZXZGIrdmpyUXZsQ3ZtQ2RldTZU?=
 =?utf-8?B?bU9EVkpML3NocmM4UXJQMWJKZ1Q3bHZRWGFHZW5qRVJFSDNJN3I5YUdjVk9y?=
 =?utf-8?B?MS8zOXFpYlQzOEc1N2l5OU1VM084Y0QyVmFuUklodnRPREwyYTRGRFIzQVV4?=
 =?utf-8?B?aElTTitkdEJwc25WWVRucTdXQjcxUkliLzRBMjJnZHBENU9YT3U4c0htZWtV?=
 =?utf-8?B?MXd0ZGtPVVppb1lYbzhoY0d5VHo0YWhudkFvUUYzQWxtcFI4QTIySEJlRzZp?=
 =?utf-8?B?bzVOcThUeklVNkV3Mi95SnJDOVVxWWR0bFBJcHAzVEdMTElWZHZuM1RVRWF1?=
 =?utf-8?B?V1hGUlZOYm52dGlRdW8wcHRqTVN6MHdaQlFJTWZtVkIwWm4rdmRqV2dLVzA3?=
 =?utf-8?B?VW9LTFFtMkgvOUdFQXVYUFErN1QxRE1SdmwzelVjT1BuVGlvS2I3R1JXYUtz?=
 =?utf-8?B?TGtQck13a3FjbngyS1pzaHB2NGlWUzMwaFBKT3NJdVFwcE1neWIzc2VlSFdk?=
 =?utf-8?B?SlZWL2RGb1NzRWMxL1d5cGJhd2RmeFFyekR5b1NITmNiTFFmczg5OGRiNmRN?=
 =?utf-8?B?S2VPaGVaa3l2SGQ5eFJXY0dIUnJTcHFzZS9UblVaenB5c0ZZdHFLZ2NXSDlM?=
 =?utf-8?B?OGZGSnpaSC9ad0c1NGhMWHlBNFpVTWZ2NTBsV3Q1Y2pKQ2MzZXdPZGtDOWpJ?=
 =?utf-8?B?ckJsbisyazNldXFJZzUwcFcrOGNBKzlvcTVscHBrdHRwMlVwcFpCNEhJengz?=
 =?utf-8?B?a3lhL3ErWU54bmRONW9XTVB6Y0k1SW1oKzh5cW5aUmw2N3NBUG1LTGNyblRt?=
 =?utf-8?B?eEI2ZkxDNVdOYXFBbUxUYkRTK3ZOMkNHZCtCSWRXTldBUlJ5WHRBMjc4YjA1?=
 =?utf-8?B?R2ZKRHBPa2U0ZUIwT0FZMFlWQkpGSm40OThOb0hsNHhBVE9leDZKNDlrK0R1?=
 =?utf-8?B?WUNxVXAvcEJxUVBTaGZKVEI1TjNzaUZ6WW1HaEk3TG1seFE1dWt0dmQ4YXVx?=
 =?utf-8?B?TlZadlZ5NTJVREFqb2t2Szgvaks2ZWROZy9Hd0dJS3dTYk1DOURRc0o3cU84?=
 =?utf-8?B?L2d1TnJMNWxQQjBNb1VCeGlWZXZBeVB1Q0U3SUl4YTNxMEl4TXlURTlkbE5Q?=
 =?utf-8?B?dU9nR3k3RkVBcmdsbTVQYzdVYW1CM2J6RXpDOU5Vc1o1N29JOGpFanZhKzI5?=
 =?utf-8?Q?Tq1yKefjiMHhOZfDv0XBx20t0qbzWA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGVUdEExYjQ3VjRId1A3cHRzVjlNbGYwYUNMNG8venRmK0lmZTVZMmFRSXBz?=
 =?utf-8?B?Z3o3eXBRUmtrMUdjMmlsZ0tuRU9WR05Vb0RQVGYxWHBQK3lkZTRuY1V0UVQy?=
 =?utf-8?B?YTY5QklVc2NsUFNTOXZhZzFzc1hlQnRhelhWdFBRcHoydVpBV29ZcUZ2WC9w?=
 =?utf-8?B?S2p1YXUzYmpkaVVmMElrTTJDanBVeVZ2RE56RFlLMFUwMmJUblJsVU5aWWor?=
 =?utf-8?B?WStWRGxhb3QrR091WWViZ1ArelVIbXVLSlZlWndKdkxkaTJIWlFIbkg1SVZh?=
 =?utf-8?B?VXl2bHhKQW1KdWcwMmROazJWM2oxeDdaclJuUE1HMXljeVFKeDlUTGV0MTZJ?=
 =?utf-8?B?SGQrREZaTG9yT3pLbGl1ZTM4YmNjdWkzMUNTMktXbTc3QXRRSnNuT0d0S3I3?=
 =?utf-8?B?THd6c2p4QkxoQkE5T0RhYnoyTFh1ZWpaMTh3Ym9jcEQ3bXh6UGVOdnlLaXly?=
 =?utf-8?B?NkUrS2svRVhkNkc1Ym12UDZwelJEMlFoaVd4akhpa0hsYjJFdFpXcmNQSDll?=
 =?utf-8?B?azFTN3VOUmxDZHU5VGo3S251YWk1QVB0U1pCWmRIdHA3emEzYzZjeGtWaHdH?=
 =?utf-8?B?ZnhFL3ZWZHdFNFhZM293RlNFN25tdWxZT2N0UDltUUxHOUFkVFplaU13VUxV?=
 =?utf-8?B?ek1XNDR0Zi9paHFwcU81czZ3Z2tQOWlDV3pKWm5YeWtKZSs0Wk5PU2luRE45?=
 =?utf-8?B?NVV5bkV1YmNOQnJrTVlzQlh3c2c2VzZEUDVlTTlmT2ZIMXB4eDJrM1VDQmpv?=
 =?utf-8?B?aHFlVXl4RnNNQUp5QTdYZjhBc1BRRUljTUw1VmlSYk1FKzV0WUhoMTVvK0ZS?=
 =?utf-8?B?MEhuaFlXUnBDZmsxemlnRGVjZ1d4L1RTaVJBNUxXVUxVTW0ranh5c0tNbWxn?=
 =?utf-8?B?QnB1QWRSeUJOQ2xyckFJZ1hEc1R0Q0o4SFp3dmhUd2F5OFpGQjZBZXJwKysv?=
 =?utf-8?B?WHNOdk4zQjNsM0Y3bEVPQll3TXIwSS9ZaXNKdDF0ZFEvUGdxUEdpVXVxM3Y1?=
 =?utf-8?B?eEFNMW8rejUyczlhMlZLNDJXaDZRK2RHWXRPN2cvL1ptZk9zeEJiRGdhb2h3?=
 =?utf-8?B?MGlUNWVudVM5cElCMTAzWk9RRk9QZmJlb2syRlVzK29GUThtWWpzMDk3eG1y?=
 =?utf-8?B?YmNCQ1B6MzRJcXdtK096aTB6NlpRMVM4UEFGSGJ0N0szVlFGSCszWmVtaUdh?=
 =?utf-8?B?YTRGOUo0cDVoN2lFdmhnTHVKTDFDU1BGcEZZYzhWU2FBSnRNbGUybTdycm5O?=
 =?utf-8?B?SHcxUEJwZTdDSkRRT1pVZUQvZjJ5ZE1HRWJhUFhJeGFQTkxHNEF6YTVGNWQx?=
 =?utf-8?B?MU01bzgrNURBZ1lvNFdENW1nd0xHZHJaZGRhcUc3RmMxUzFaYmNPdXNSdEhV?=
 =?utf-8?B?OXJ1NWkyVG5GajFkajJVbTJkRjJXRDA3cE00VXIvTUVhK04vRlBGeExTMUtT?=
 =?utf-8?B?Y0s4UzZGR1JtcXExU2hrVmdDVkljZGRlTitCRlR4NmlNYjYrcUJvRG1DT29i?=
 =?utf-8?B?TkFQelFBV1BxSndMRTYvOU10TVNCU3IyRVZHblFiR0tzOUxHUktVb3ZnZHo3?=
 =?utf-8?B?ZnNWcGNEUVR5MWNQM0E5QVRFV0l4bHhuZXJRTmZhTlpmNUU1ZUxYTnFYYkRI?=
 =?utf-8?B?R1NWbS9QN0xXU0tuWjQ2eXdRN1dCakFrblBGQ1dpMWFneUZLMGpubUdzQU4r?=
 =?utf-8?B?UW0xQVJoUVp6RkxRckpEUndEcGVEOHU2a0YrSE14am4rUVlJMi9UZ1ZiL2dM?=
 =?utf-8?B?bTF2SFlJZ1l4TFJmd1U3K0RGU2F0SURUQVAvTm5GOHI4RUFqTEF0djJTajR4?=
 =?utf-8?B?ZlJkdTE0T1VrcVMvdFRCbll2ZHF2SitvbThSNEhqNTAweWFWeEhnZXN5c1Jv?=
 =?utf-8?B?b0RiaEFxWThBMS8vdU5UbC9UNGpXUWNIc25OQmlpTktGQVNnTmZ4WWc1dDFz?=
 =?utf-8?B?cmtNYkd2aitHOFdUTmpsZFp3WnZicXVnVGE0TEQvbk0zWGRkdG1GUzVZeFlB?=
 =?utf-8?B?OUIwMFdBd0hhOUs0OTV2NWJBSFJOU1Z4eUtmNUl3aUZwVEtsVnVBMWgyR0VV?=
 =?utf-8?B?VlJZTElIc0IzSEpFWjdYSG0xQzg2SDI3MGY5YzNKbXZkeWZUVk5DbEgyelB3?=
 =?utf-8?Q?Cehu4UtQ3FwoNcB38B4pHzLP1?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad6358e-ad6b-453c-7f7d-08de2950dd2c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:54:02.0395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkBaaFXKgVcu1nz+KINEC1N79eWMV1i0AaZO7DBYzcykKwcqj4SefmttBjq5lsp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11576

Hi!

2025-11-21 at 12:57, Antoniu Miclaus wrote:
> [You don't often get email from antoniu.miclaus@analog.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This series adds support for the Analog Devices ADG1712 quad single-pole/
> single-throw (SPST) switch to the existing GPIO multiplexer driver.
> 
> The ADG1712 contains four independent switches, each controlled by a
> dedicated GPIO pin. Unlike traditional multiplexers that use GPIOs as
> binary-encoded selectors, the ADG1712 treats each GPIO as a direct switch
> controller.
> 
> However, the existing gpio-mux driver architecture handles this perfectly
> by treating the mux state (0-15) as representing all possible combinations
> of the four independent switches. The existing mux_gpio_set() function uses
> gpiod_multi_set_value_cansleep() which treats the state as a bitmap,
> setting each GPIO according to the corresponding bit position.
> 
> For example:
> - State 0 (0000): All switches OFF
> - State 5 (0101): SW1=ON, SW2=OFF, SW3=ON, SW4=OFF
> - State 15 (1111): All switches ON
> 
> This approach allows the ADG1712 to leverage the existing mux framework
> for switch control while reusing all existing gpio-mux infrastructure
> without any code changes beyond adding the compatible string.

No, this is just wrong. If you were to treat the four SPST switches
as some kind of a edge case muxes, they would need to be represented
as four *independent* mux controllers. What you have done when you
tied the four gpios together like this would be appropriate for
a single SP16T mux. Which is not exactly what you have...

So, this series abuses the mux design and is therefore rejected.
Sorry.

Side note, representing the four switches as muxes works perfectly
w/o adding an explicit compatible. Just use four nodes compatible
with "gpio-mux" with a single gpio each. But of course, this foils
the synchronized update property, which I suspect is important, but
that's not a problem the mux subsystem can be expected to solve.

Cheers,
Peter

