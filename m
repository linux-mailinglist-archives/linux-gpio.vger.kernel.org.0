Return-Path: <linux-gpio+bounces-10056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4365977CA4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD051C24DFD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F71D7994;
	Fri, 13 Sep 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R0uDLGw7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752E1B654F;
	Fri, 13 Sep 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726221369; cv=fail; b=Pees4k62hUm6DcHMJv0IKqfQwYZq2eS+gy/AyVqzUcCzmo6NgkGt0SF6dVlurJSoCRVI01DLLITCFqlsg8LSkaT+knO10dNYZI+yeqGuub2s5QIei/OXfPUi268/aUMK/2xCsCDWyuWfl6E6N1wlEi3mbn3qSqELw40AslB3mIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726221369; c=relaxed/simple;
	bh=vzPhhz9UdQ2R+lV0IYgBJM4Er3IpvtvI2jPSD1zRx5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q1ZXRiErz8DLM7sNAsI0W1fRoz2jgMWZ+9Trwj/Njbw7+1qzUmfmerg1I18D312brcuPja6L9uNqa7kGqzoLGS83le2KaRjP+mqxAnwOwSCyikIEZUOnAA5X1S67pLH1BQ4j9fLhuF+L92liAsIK7qXxYrNo+8GdqvSJl69p4EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R0uDLGw7; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+a2TaJBziW9AaAJlDKGypMxY/w9i0yHkwsuBfVwz+018BCy5T9W4c9azZ2RpqK2KOvYABS/w5gH08VpkUWn9SXUhAm5IOAbY84ihlPYjkj3VOWMV3jx0kq1sWELFLiQjIVWvFf+dVDrpu5cuprCB8pk+okaZIPP2tK8VQ6EslfLwyUwxbKXgIbJ3JNBTnqecUJDYnLVMKa5p32aMIHzd2JlaZvYzVMm6/p5VO8OYPCgVO4RuB5vruJEQibBkvJdC4LjZ4F9VYPwcWBkYpCk3SsEyqWQCBDTQyPMd1SRAqW1HcumMyA6f8NJvjz8fFnFcNhlmybc7+t7OOqJEtzjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiR2uDyhsykYBlj3BsqtIJykAoLOQZCMBHDQIqZa/Bw=;
 b=jZ2J6afgm/ePHftnwgVuGsk7oY8A9skS7JHLpbJ3Z/kBGn6f6PgJnJUYv+E9sKptmW2pG179g5aWSZ1im0yNDHq9ys8/Wcbe6wfoog18bdP8or2FpoJF2idlYU/UkfceYen+vyHZSJ5G6JNVPnRsxt0P0TpplxXg7FsUXrmN4JkID4yKiUOBZGTWxRzHyysvjmSBtmp0qy9CO4GLgBEvDRE5GDLC5wJwnH6Ui12DNOq+DtmkUVTedQTS7RHbftp3QtzM5ofp9tlZ70Dv9MWtaY1QAP7RXH7GdMtz/UhEm2KceJfhZcPBJjeyfGxh7oDEihZ6J3c1CMz8l5NiWuf7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiR2uDyhsykYBlj3BsqtIJykAoLOQZCMBHDQIqZa/Bw=;
 b=R0uDLGw7E1gJ5N2qPze9Ndqt+GxD0aYYMYzZqBxv2n9ABplXDfbGxjp9brjTr0wX/mCKjediRQx2sNL7IxLxWl3xtXockHPNcotcvyFgsgEjjhIhfirVshUtCLVOjHYt2+3Mh0N1wBty4UXcRocM6b6ejNKCi4Gb8PPHFG1qOz6HU4ZpnKc7s6Z/7u7ig/X6ELIVyitiRYlAJ7la+DtNtICo84r2KvaIL5I1cudAokGDTKkwJEYxRzyiAG+77L0i1ke5ilwxUXBpX2gDGaK5ca3zQ4fSUhWbOfdorXgz93utw4KkVcz1MvnOqrkxpGcoOmoj8VvHcRv3kHvbMXjI3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 09:56:02 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 09:56:02 +0000
Message-ID: <1e184db3-e85a-4582-ac3e-5d0b48733a57@oss.nxp.com>
Date: Fri, 13 Sep 2024 12:55:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, linux-arm-kernel@lists.infradead.org
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
 <172622015057.2463404.4285438986782752017.robh@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <172622015057.2463404.4285438986782752017.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PA4PR04MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 7446fc65-5f86-49a0-a93f-08dcd3da46aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U05FQ2hWUE4vUzFpRjBhanJkSjVCZ0U5aWorb1VHK1FnM24zKzhQWXF0bnNP?=
 =?utf-8?B?NlkreEt6THJ3dEY5bEd4bTZ6eFB4YnBtYnNaV2pQd1JFUGNSSng4aUI1V211?=
 =?utf-8?B?TG14YWFSYnJGMWFyZGpyZEMrbDlIZ0JHWHEwY0JQTG1KeXdSbS9Zbmc3ajFO?=
 =?utf-8?B?a25tUWxCajBsNjBCZzdsN2FWUXlYTEppa3JNbXNYQlhCaGRNanR6Y2Q4Vmlq?=
 =?utf-8?B?Mkw1bnlrMTN2L3BiN0FmTGQrRW5aWGhyM21JT2tNOFhaTTJsbDNZU3B6VDVm?=
 =?utf-8?B?akJZUktuSVpHdEttVXYyUldBZ2x4eCsxM0E1cGZ4Q01xRDB0SHNDYmpjOHhX?=
 =?utf-8?B?ekNCekV4eWt6MFd4eG4xZEZnNDlTQzdhN3ovaVZPeFBZTEJ2eklUMmZBUEpT?=
 =?utf-8?B?QzVVTUpUYVB2eDRzdVhJazFXU3QxRmJOV2pvT2NCSHh2Uk1BaGh5RmszZ29a?=
 =?utf-8?B?V0ZtbnY1eTdzSXJ3cGZOOURVZlZQRnJmUHNBczFSWWppVTYwRWU4TUxZUEh5?=
 =?utf-8?B?dmVFTW1sN2F5K0FBeXI1aDVONGxLdXlHcVhQNDhRdXY4VUk2dUh6UFJ1WHBX?=
 =?utf-8?B?dXFBQVp0VmRZOTVoazJvcDBnd1NmSGFWdUhjczh3eHlvZWo4R1VRN1RtME01?=
 =?utf-8?B?K244R3MxdnhHbHlaQUtWNFlvYXVlWE1RcVp5Sm91RkYwZXRLaFVvTnVLd3RZ?=
 =?utf-8?B?OGhSdlBtKzhianRLbUFQWGhBemtxaWR4Rmg0ZzcwU1Z3TXZvMEZlQllvcUdo?=
 =?utf-8?B?SCtlL0tPZnBaK0pXQ1k5aTZZNnVSaHBhTHJVZVVoYzZXT3Z2WldQRUJHN3Y3?=
 =?utf-8?B?QUdvMDlOQy96d1BiamdIbVZVOEF3blJOZ1JqTnJIdkRHUzJIU1g1ci9Pd2c0?=
 =?utf-8?B?NEJMcnFMWGxhVTExUUxzaEUzd3d0NzRmeFMyUmhvQjlKOUVYM1lTWEZ1a2Jq?=
 =?utf-8?B?YWhoaUVXV1E2VUVGYk50V3A0K3dUMDdxNnRvblpjeDZIRlZhZXpzcUZ0Qkg2?=
 =?utf-8?B?TFdBUGJRbWo1cG1kWUNmc0FrU1ZSMmJ0b2krNnRnZGZuQ1liUVFTU2p0K2hM?=
 =?utf-8?B?NXFuVCtGUk95REdiZ1p5SmZ0VnJZbkJmM3lGcmhhaVJVNXNLQS8zR0hTN01B?=
 =?utf-8?B?RGRhU1hBYmpMZ0VpUWJuNVhqQm1nWjVHNGQ0MldEc3M3MHVaclVLYTNmWVQy?=
 =?utf-8?B?aUtaV0JsRUp3WXR3aGlOMmViWk50Ty9FWDVuUkZReWcxL0pKc1RYdC9uZWdV?=
 =?utf-8?B?L0xNN2pBTEdnUWRaNlNiQlZKSndqV3pHUHUxRS9zUDloK3hTRnhGdFB5VnBZ?=
 =?utf-8?B?UG5lRGlGbEp2N2xnUUpxOGtZRFM3RXZ4TVVtN2pmbHlSQzdEbTRIM2xzZkJx?=
 =?utf-8?B?YWFoeGVVVGFxU2FwN0NCeE5ENFRhMmw3ZkZXR2EwSy9EdVNoRUxDNGRXM1R4?=
 =?utf-8?B?K256dG5ZSmU0WlpnNmsyL21FVzN1dTNrNnYrNVZZY0pmMXBZVGdEam0zQ2p1?=
 =?utf-8?B?bXN0amlPVWozWkV1U0FZbStLYmZBYTdGdkh1emF1cVlwdlhMOVVxSFpVc0lK?=
 =?utf-8?B?bGh2ZXFOZTVOcjdyV1hjQjZzMENGQjc3clM0c0U2M1NId2tYTVcveUZ5aytz?=
 =?utf-8?B?SXQ5UlF0R3hQQU5iQUYybXFsVk5ZVDd2QjhReWg5eEl0TVIvNGRQREQ2OG5k?=
 =?utf-8?B?akNnRWRWQ040WXBZUzdHcXpFZlZESEd1dXpZOTBnQWM3dkc5a3ZpbjMvNkdY?=
 =?utf-8?B?c042MzF2eDh5MEpkbTFtVVp1RzZRbGJJZDZPVWFSWVJ4dUJlWGErbldvS3RL?=
 =?utf-8?B?SHA2WkIxaTEzSGJqTjFRZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3pWVmpkV1l3blArdW1NMXhSbEZZSGkrcWZ6a2dFMyt6QTNoN3Ztc2lHS0la?=
 =?utf-8?B?Y1hQZ1Q5TWRxTnQ0N2tNemNGMzJndmUwL285bzByZGViMnovMUhyRlR3eStZ?=
 =?utf-8?B?bGtRYmtIcVZuQmNCMm11eW9hUjZGeUttdnhjV2dMaFkrMHN3V3pvUDAydERU?=
 =?utf-8?B?TlJ0YXo3UzBHRkFuNytJVDBFVUU4YmlwVjRaRWg2L1p3R3hIYzcxRmJxNDNs?=
 =?utf-8?B?UlgvTnlCbk4ycEJaRVV3eVRENi9vdnh2bkN3cWRBZ1dNUUV1WWxCcXJ3OENC?=
 =?utf-8?B?b3VGa0d6cDZoak1CSk9SVURDY3dQajRCY0Joc0d6RWlnK3BxUFE4Qk5Qa2tW?=
 =?utf-8?B?eWt5N2RVMzhFTVRhN0hwSzRzMmhsMDlEdGFPbXMxZEFmcmtuaVVjSVluZjBB?=
 =?utf-8?B?eTlFWWJCTGMxTjh5MDJNSGVlMFBYdmd4aE5ob2JIZVVML3FMNUxaMnNsVzMx?=
 =?utf-8?B?amYxRXBkM3ZLRnJiQWk1VEhsWXpyb2Y5RkZWZkY1RmFQZklhdkkwbDRrVEpT?=
 =?utf-8?B?RjdXYlBJcWNTL3U0TDJjRUF6S3JiMnlzV3JoUDJXTTRya3VyMzVGcVpBdCta?=
 =?utf-8?B?enJaLzkrNlRyRVllTkdqbkJIV2wvNm92NUE3V3Q1Y0ZsUkZ0bG8vUFFUcUJC?=
 =?utf-8?B?QTVnME5tNGJhNWhablI5UXRUZy9zOURuaFI1ek1NUDF4bTFEbHd1YXZQenZW?=
 =?utf-8?B?UUV3dG5BNVZhNzFmS2NzUGZUbnA3MXZ2b1U1aTh1Qm9Hdi85VFc5MlZnZGVh?=
 =?utf-8?B?NWc1aTY2US9BeC9yUVlaSEtSTEx6WkUrZkk3R3RjL0xaTXd0ejBEeXBCdnZE?=
 =?utf-8?B?cmpnSWRpWjRLOGptOG9zdkV0UmdreVROTHdhejNMU0JuTGxCeXhMY01yZUdQ?=
 =?utf-8?B?V0hYdzMrZDVxWnkwNlNyS0JybjdLeDF3M1hmYkUyWFNjMllMaldkS2N4WmFn?=
 =?utf-8?B?MThDelNjeS9iSytRbnZubXZuWmVDMmFkNEVvZHljWHBzdjJnVmV6YVJiVlZG?=
 =?utf-8?B?ZkFvYkw4OTVzb2hPSXFRMCtMNkNKWEY0Y3dBSy9BcVdwQmIwYmlZd1BIS096?=
 =?utf-8?B?QVR1T0RUOTF4bmN1OWFnb2VhaGRBSndCYWZ0ZENNNjZ0a21sMmtHTUwvdEEx?=
 =?utf-8?B?TkJiTzd6SEllR05OZVdNY0RvdDdKWjE1dUdqNDdxa3IxNERwSEJMdkJJQTZl?=
 =?utf-8?B?anFibTIvNnhRR0c1ZGhRaVJJODdRellma0pkeVR4ODBmUXp3YkllTzdNbE9t?=
 =?utf-8?B?eThjRkxQOHE0cFRsRmQwUnB2SzFvaHl5WnRWV3VNTnJFdWFvYUcvVE9OdzFu?=
 =?utf-8?B?bEtVVzM0cjhUdzBhMlNNUWtROFppYlpmWlQyRVcvYUF0SDMxSm0zcDRCbFJK?=
 =?utf-8?B?MnM0U2xwYjVua0E2ZFN5VExUT2lLbVRPQnF4Y0kxb010bnA2SUlnakcyeW1T?=
 =?utf-8?B?T0pXU3pRUFhwd1lCeTg2emZHdGlnbnc3UUhvNnF5VzlteWo1akQ5amRXakdm?=
 =?utf-8?B?NFU3cnVPQ2tXNzUxSWg3KzgybHZ1d0hramFEUjFkeUlyT0FrcXdRa21Cdk9D?=
 =?utf-8?B?QStRdFBzWTF5b1VIVVEzQmd2QlAxTkRXWkQ2T3VGaHFNU2cwWWJSbEdJS29q?=
 =?utf-8?B?dXArT1NzVFlvdEU0NWgwb2ppSm5iU3JQbTVjcyt4US95aVVOaUltYTJPR3RZ?=
 =?utf-8?B?eWh6eTgxTmpYOXVMdVd0cGw4QnlVVXBDVFhnMUpxNERsUElmWEpUZy9yVlpJ?=
 =?utf-8?B?WmhUMGJzUXJiOE1rMVRyYmVuTUxjVmZjallWUXFlUkZNYUZGS1NGbVkzWWJ0?=
 =?utf-8?B?NmJQNlprT2w1T050THRmRytad3Nnb2llVElWMmZkWEdWanMzaDJPT1VJdXpE?=
 =?utf-8?B?Y3VsTUsxeVNXSCtzYXh0eWY2aEc5ZDM0VUFWeWNreENNR2RvanZTbis4aTBy?=
 =?utf-8?B?V2crVE5HbFJ4eTl5ZzhwTVVza0Y4SUxZOHQyQzEySTVIOFRVaXJicytVd2Y3?=
 =?utf-8?B?Wk5aM1E2RmlQdGpjUitIUkp0a01IN0VTQlUzTXRXN0d3cGJ5Yi9VeWNLRzls?=
 =?utf-8?B?NVExMi90QjlTeUI3czFrMVVjV2RJaEcvNjhSb0dLMlVMVUdrZURmZUJuZEts?=
 =?utf-8?B?Vy93SUhjL2VZS0sxN25haURCempGM1U3cDdmWXQrZUNPNHFYNWN2QlpYQXEz?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7446fc65-5f86-49a0-a93f-08dcd3da46aa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:56:02.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od16CgvtKNvSKRjF5yw6Uky+2y/L1dQ/AI9MYswoZLqkgzwXBSDigF5Sy4zV9UDuf/FX7iWrP2T593dcVYwpqfgix5dSpqWlTumAshzJtRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552

Hi,

On 13/09/2024 12:35, Rob Herring (Arm) wrote:
> 
> On Fri, 13 Sep 2024 11:29:33 +0300, Andrei Stefanescu wrote:
>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>
>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>> ---
>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 106 ++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
>  	 $id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml
>  	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> 
> doc reference errors (make refcheckdocs):
> 

I am sorry for this, I forgot to run the 'dt_binding_check' on this version. I will wait a bit for
other comments and I will fix in v3.

Best regards,
Andrei


