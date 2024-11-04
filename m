Return-Path: <linux-gpio+bounces-12519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA89BB36E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC9D2844E7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD301C302B;
	Mon,  4 Nov 2024 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MncH9+PG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2069.outbound.protection.outlook.com [40.107.103.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306B1C2DB0;
	Mon,  4 Nov 2024 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719758; cv=fail; b=aVXX88uocrc/kv1QHZiGr4DHiIYWt0nAoPJMS9TMG8QFKK0AZR57ufro/flMEy9Qqc1NfAqPFahUC4gy9AFYPdz/esXdEkEN7xgODqW+g8wJR+lOYOy7itEOJV1Xw9vtfQhwH35EYcLZRqlUYob7LpVxBocp5fkZGNflAekhn00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719758; c=relaxed/simple;
	bh=+DKzFSeSRgKNuZO7Ykk8Yp+lLmBgwoGBaAEy1H/LVOM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pVhoDs8B5oOGu1RbM63MBDcFBhsDxYv5NpfzDLikhTDeNXBJTRnOumJu9w2sH3ToEB+Q680m8o9KHSdOnwx+bc6uE/zSK4TRjuu6HB3Bh2hNjA7/KzgeuohgRHmfG51+Ltba+PiHmUtI06iRuqsR+3GG+tM2/DO27W6nXhJ+tNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MncH9+PG; arc=fail smtp.client-ip=40.107.103.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgRPSx2nMV+qvyYLqsGgJD6gteMCHpXbmR6SARawteP4FvpXoZyGme77z6ak+kBLhL5J5DZ6qI0ftLa+Qb08bX3hy3PyAqCAptbW0UJQ7BUYTLtG5NbWcx8d3i/U01DeRihafHR0szKxbr7rSilG7RKz6xkQNc8cU2v7I7tZeUl+yGxBGdiyma+05LtYkhyYzHXw15YDTAgynesfzgaqvsvtlc3PmzBtCq35uaWXuZ/WoG0kFtwgTZvY/tIstrZl0glmdSwukymr7/vFNpNpHG9tA6qJN+Yse6TXulm2Gttax9tUnCwxzUm0aRtLNoekHW/KueaDgHwKNW3ODyZ1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+ekRC8r5VRaxPYErbg7eREsa7roK7CPfNnf7sCkuAI=;
 b=OwAFcx+zN2wYCMsFr/UiyVSPXdCajygaOcTBEF+Ra6xg6lFiujqBJSbuJ3OX6ffRPK3FewxECdn/mYjW1nDCf/64hoYTw2+jG2yKBuJQvFQ//YQP7h1dIPFEsRmY1m32dwvnecc+9no7pJLmLkLC6FWC+CVGzvDtQ9xx5F7fB7CQeDGdPhVyIZtrxRyA3U4AaNgxbPJf8eznP2nIGYlR9KuwqHk17++vtGA4Swnm45cKtaMOIGlt7qH5Hgc2MxwAANoT+P/SumyxSFScmE6ssXWPJPirJmSlK5nYb0WImBGy5obWnjPt5s1ywxq+juJZ+gCT3h6dwU4xUk1vTMU2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+ekRC8r5VRaxPYErbg7eREsa7roK7CPfNnf7sCkuAI=;
 b=MncH9+PGAiZpmV67yHRQd/DNkWsFgPSGvpoC95hoxd3+GU2GBc4PNlcoz3dw9U+4Yb7+7T62zL/FcRNBsI5DwWW+Q9oPtX7G61LhEmxF3JMtHrAC1WToJkX5EdVtwiAOBBUWSaMaO81h74mQLXBogaf9tdRgebt/E2Ia5Qlxehx2acmHmbhxQxRp9juMrjVqSbR1DS9KP2ZmNPw+boqgl35r6umK11oTGc2VFT1zWodg9TWYKbyl0I8frHCX7tpWOUW2ympRuA1fyEnPwv12z0m2hMAw2eGbovG2+ayPiZRFpHMILVbZeTmXwt0qoPIQ4edS98wlBWtlFxVK+hkuhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB10034.eurprd04.prod.outlook.com (2603:10a6:10:4c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:29:11 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:29:10 +0000
Message-ID: <c00566a9-3a3e-4c12-ab83-5e006d9273dc@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:29:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
 <z5ky5g46tsdmrabplgjbt3ahlnkn7gljkwsxjshwpkdqqnirwr@wavvhc2wudlh>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <z5ky5g46tsdmrabplgjbt3ahlnkn7gljkwsxjshwpkdqqnirwr@wavvhc2wudlh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: d32961a2-99f5-4e6e-f9f2-08dcfcc3e6fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG5UcmhSendJMkluL0lzZ08xOHRKRTlQQ1FoKzJWWUxiWnYyWDFQVHNzYnlk?=
 =?utf-8?B?c3FLN3B6MDBSRGF4SHFnWmJnSTkyalorTlVTQWlPMTVxblY1WVBPN1YyWHlV?=
 =?utf-8?B?eWxVa3JXdThJV21jVGJIUzdDcmI3eGoxZXBCSWpvNStGbkJtRDB3aHdBZ2pj?=
 =?utf-8?B?NkpaODI3bG5RR3lCL0hCRlorUjM0Vm1wQzhLSDVERVhpekk4cGpsVk9ZMjhr?=
 =?utf-8?B?UEZmMlFjT0NtWXQ2NGhCQVJsaW43L1RxRWtJRzR4NXlCSzR6ZWRPYnRUQWpu?=
 =?utf-8?B?ZVFDUzFJVEMrdU5Yb2QzSWxZVVdSV3JzY3U3VDdRZWRYQXprSGJrQ29PQjlR?=
 =?utf-8?B?UFk2bmdPWWJLdUYrZjc5ZkJ4R1RXTi95NnlhYUgwR29tckdWUzVBWGZKNGNV?=
 =?utf-8?B?UDFwK0ViZGdrTUNSemd2WXBuSkwvd2dFQkk5UUYwaHYrcDJOSXVkZ3J0TE1k?=
 =?utf-8?B?NjNXcmdwVmV4eFdNeXQrZlpVMTdSSEd0N2l3OG13c2RMbjU2M0ttYy9LdFBV?=
 =?utf-8?B?RmdiV2lOcW11YzRmUmxINUswa1lmeEtxTDAzN1N1NytXMGRRNXRrOXE4WTR1?=
 =?utf-8?B?dDdoU1B4YWRCQS95WnFacjVGQ2U3eC9SYWZ0L0YrK3d5eXFsRHZKTlBaK3Y3?=
 =?utf-8?B?bThtMTF2cENhUFlRVUVRenlSaU9wUjFqNHJPTnpMV2JKbnhvZUtCZituRzJR?=
 =?utf-8?B?b0JKSkZpVGxHQVMwMjBrUVlWdnhjdittOXdkdithcVl4Q0c1SHpEQWJFQXNI?=
 =?utf-8?B?SzlYN1Y0a2hlQWNYaXp4KzhwUkk1bDhLU1Q3Qnc0em5FeXQ2SVpNSU1ac21x?=
 =?utf-8?B?QTFCclRtaDVVeGg2ODJFb0pWcGI2M2FoN0FFSmJJckUralFTNkdIMVhhUEJ3?=
 =?utf-8?B?U3M2WVhNb3pSYXl2aVZuVHJhS1FmODJGTWpKVkN0K3duaDFycCtCemxyVTdw?=
 =?utf-8?B?azRXNG9EazF3aWVuY3pKaEI1WTQ4U3pxbDBtTjJPMVZNVG1DcVdNTHlFNStV?=
 =?utf-8?B?NTJ0dHNzeEliRHZyVW9wMmpnUytmODczRWszbm4wMVhKdFFWV0hHTHZmMCs2?=
 =?utf-8?B?ZFh0cTBsUHhINllaUXg1YStOeVpJZlUvRWpjU0NHQ1hFbS9BcDVVanpITUJK?=
 =?utf-8?B?YXFScEF2eWdtMXlPSGdmRjhxcFY2Q1NIYkIzZWUwU3NWSnVrbUFrS1dJblFk?=
 =?utf-8?B?K3dPaHFIN043dEFCQzFrL1JZQ2crK1lvK3QvQmpyQmZGL0Zub2FzWFRlQWxG?=
 =?utf-8?B?aXNsRmx5dzVGNHVSWk81d2l0SzRQckh6YWt2VnUxTGZqWkViUFZkcUtCSktl?=
 =?utf-8?B?aGkvVnA4L1pCU2w1OGxuTnhMU1VZZ3FqWnZIdnlxWVZPamE0VGlWYm9HVHdN?=
 =?utf-8?B?SFh6MDJGZm1iYklzYkxUdVUyVmJ1MURjYUh3Tm9PcUlnVEV4RWtybVBtL0lX?=
 =?utf-8?B?eFhwRktyTFFpUlZPSUZ2U0VkSnVxSGdxRzhuYkt1SnNWOTBiNmJNTnhZTG44?=
 =?utf-8?B?dkV5UmsrbkFsQXFPYXIyQ2hIbFRQc2JEVnkxVXRpQktVTHZ5YVV2S1RZWUpj?=
 =?utf-8?B?UkFLbmRWRzZzVHVZcnRDdERxRTNZVkJZZ3pSS2UzWnVnd3k5dk96VjMyWTc1?=
 =?utf-8?B?OWp1dFpjY0IyTlBUU2VjV2hBSFFKT3F3SldPaUZaQmpkbVRac3JDKzBZdXBi?=
 =?utf-8?B?aEE4UE9XbGx6dFM4Kzk4Q1dRTFU0RTFHRVdueWV2OG9YOHlPZGw1TG9pNXBl?=
 =?utf-8?Q?EznxXomWPLhf43HDdulxJSI53sHvAp9/1TTcix/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTJEUENCZVJFUEp5RkxPdEYycmVsQ3c0bzFvRDcxNzhKZzVHVTR0emRtT2My?=
 =?utf-8?B?QkNHWHd4VHhuOWt4NHdTQW5wdGcxVEh1aVVQbXl4cFVUaEFRdm40V3hMWU1N?=
 =?utf-8?B?Q2dKMXlyQ01sYjVmaTV0YmpINVEvZCtHUzh5SWh5MUhkbERMVW5IZVNuNTRk?=
 =?utf-8?B?SVJWZFc2WjdJbXU1QUxDK3JacUwzZHNhb1laQVEraGpXTW5qMngwbnBQMWI3?=
 =?utf-8?B?Smo0cC9uSlFOZkJRYzFTdjQ0dVl3TXBxM241T1R1STFqNDQ1SlZkN01YcENT?=
 =?utf-8?B?V2hoT25qTnpIYk95UnZRWFRqakFtWHdDOVB3RFJxRHBxdm5mSFgvWjAxNUlV?=
 =?utf-8?B?R1pCS2l4eTQydWt6NEt5d2FlT3FtMFNNamRzWVRjamVPRjNTMGM0TThiKzVZ?=
 =?utf-8?B?RWFlWXBmdUpTQ0NxV2VpbDFYa05WVzB2L05mRUhpNUxCcmxEdFRjLzVzeDQx?=
 =?utf-8?B?NVJ1Z2JkNEozYzBEV0NLdUFpS0p0SnNHeDY2ZEFGWjR1QVMxQithZHZzMEdx?=
 =?utf-8?B?VmQ5ZW5rNTdYTmdQMHMrK3hDUHNRcUpOSTk5bFBCNHJ3dnRwdGVGdyszNUNr?=
 =?utf-8?B?NzVqQzliU2lZNWoydHNmM1kxZGdMRll5eG1pU0xkUGtrMGhkWTJFaHd2OFl6?=
 =?utf-8?B?bXhjYjh1YmNNR2tsRmI2bkdCRFBDUXpaQ3k2bUp2QnJMaUVTbnQzV3hvNXY5?=
 =?utf-8?B?SU45U3pVMEs0bmFRUUYvTUJ3RzZrMWRWaEw3VjVHbTVoR2xPTm1UTkxlREFq?=
 =?utf-8?B?RWtId01obGhnQ1d6S3RGaVFlUHhnWDBVZVp0N0tmdFpJd29uNmlCa050YS83?=
 =?utf-8?B?Mm0yV0I2T3NxU3c5NFI1dVcybHNTUWF3b0ZsdlYrM2huSVRhLzlGQVpINTZY?=
 =?utf-8?B?Yjc2Nkh2ZVFSSGpQRzBvY2FsNmk4VHZDVURDTlkzd2VHU21qbzZ6V0VHR0lr?=
 =?utf-8?B?OFA2T0pwQkJTVU5KU3ZrRFZSd3FyUzdYbWVJUW1FenBUVU9LZVFRcVI5c3Yr?=
 =?utf-8?B?anhRZkE0UnBBTGdzK0hpbG9FVytVVXB5R3FTa3czUE82SXJmM3FIR2s4R2Vr?=
 =?utf-8?B?K1piMC9oQlFaQ3l1M1NwOXEvRmVncmxhVkViOWJralRGUkNJV0tmRkRyY1VU?=
 =?utf-8?B?eHJtWitpNkhIaTNnU09LdTh5NzhqSEh1cVpXQWZXcVdWeU1UY2JPT3lyRSs4?=
 =?utf-8?B?engrY1I5alYvVFRjUFRQaU9WcE9odWhGR3ROWW1uVFF5UDlFUFBQdnpWQm1F?=
 =?utf-8?B?MzM1Nzc5OTVqYnBsaUttdTVuam1oUW1tTmcrNTM3Qy9jLzZMZWhZOTFyOVh2?=
 =?utf-8?B?TGE1UmVQTFFuLzZISFRCR2lxUWdwRTVuZnhRdEo4SVZlVC9FeGl4alZISVo1?=
 =?utf-8?B?UDMrTWF4c2EwdG5xT3cwYmw5TjdGTEl0RFg1MVZUV2hDWWxNRDNZc2FXZGdy?=
 =?utf-8?B?c0FSVUVUWTBxVFVIZFZwZndOODFuSXpmbVJiNWJJREpCb0owd0lGREZGT0hN?=
 =?utf-8?B?Nk1rMk0yZk9wTlZES2ZtU1NnMDZ6THpTZE1Gam42SlFUeGVWSEtKUUhjRWVK?=
 =?utf-8?B?Uk9UZldIRGdZUFk1b1lKT2hISC9RSVVxL3ZpQ1A0TXZRZ1Radzl5OGtCcHJw?=
 =?utf-8?B?Y3pkaVFvd3VZR284bnFNS28xeXRSeXhaaVFTS0tFTGlLVGVwTjBJcnVYektQ?=
 =?utf-8?B?V0U1QktMVUpla2R4QlJLeGZwcXk0TDlEMmRQRlFCWGtiQjBlaGV4cThkYTQ5?=
 =?utf-8?B?NStmMWx0YmNRbGpNWXYxQ0lPNGg1MURUVmRNcHY0M1F5VFg4NUFQRWJXVEhT?=
 =?utf-8?B?SFpDajR5VFI4WnZCSS84cndKbmxkeWUyQUlXSlRsNFk1eXVVYU9MVi9TQ0dq?=
 =?utf-8?B?eWFtaDE5N3hNS0xrRzQ2RURhdHJnS0tENXQwVXNReXIzU2cxZ3dlWnB0Qkw3?=
 =?utf-8?B?ZmRrdWUvM2tJVlhrS2cyMFlpZkRGd2xDT2ZkTzNmNEluODkzbXE1MWxUSUY1?=
 =?utf-8?B?bHlWRzZNS1UwS1F3WnJ0MHhLd2Z0Q3d3eTVhTTN1dnQ1dHRkaHYzMUxjdWdy?=
 =?utf-8?B?UDRzb1JqMnd1MEZxeU0vNmhNeHNjMFI0MHozL2ZVS1RYbXlHeDVuTS9FUzVr?=
 =?utf-8?B?bzlGY1dpZ1M0OHlTc21rc0R2TnYxQVN6ZUtycHRtNnZKeTMrQ2o5ZDVqcnA1?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32961a2-99f5-4e6e-f9f2-08dcfcc3e6fa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:29:10.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7vmRaufJBE/9ebLq/BdMMniLgbppaleL9rE90mU95Zj8zptJUH1mJLgYrnnPM6DuHgonTkhddM2OaAfEjTVANCtQmtzykDDCizNd9csqZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10034

Hi Krzysztof,

On 02/11/2024 10:52, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 10:06:08AM +0200, Andrei Stefanescu wrote:
>> +static int nxp_siul2_probe(struct platform_device *pdev)
>> +{
>> +	struct nxp_siul2_mfd *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->num_siul2 = S32G_NUM_SIUL2;
>> +	priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
>> +				   sizeof(*priv->siul2), GFP_KERNEL);
>> +	if (!priv->siul2)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	ret = nxp_siul2_parse_dtb(pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
>> +				    NULL, 0, NULL);
>> +}
>> +
>> +static const struct of_device_id nxp_siul2_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-siul2" },
>> +	{ .compatible = "nxp,s32g3-siul2" },
> 
> So devices are comaptible? Why doesn't your binding express it?

Yes, as far as I know, there is no difference in the integration
of the SIUL2 module for S32G2 and S32G3 SoCs. I am not sure how
to express this compatibility. Should I mention the "nxp,s32g3-siul2"
compatible as a fallback one?

Best regards,
Andrei

> 
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, nxp_siul2_dt_ids);
>> +
>> +static struct platform_driver nxp_siul2_mfd_driver = {
>> +	.driver = {
>> +		.name		= "nxp-siul2-mfd",
>> +		.of_match_table	= nxp_siul2_dt_ids,
>> +	},
>> +	.probe = nxp_siul2_probe,
>> +};
> 
> Best regards,
> Krzysztof
> 


