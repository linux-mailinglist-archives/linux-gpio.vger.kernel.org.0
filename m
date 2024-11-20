Return-Path: <linux-gpio+bounces-13154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DF9D3711
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A6FB23047
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50DA199934;
	Wed, 20 Nov 2024 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YhtUSeRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBF1991AA;
	Wed, 20 Nov 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094980; cv=fail; b=bWEVURmrYl2Jto+j5wa1E8KlFI+uNRZFwJJ2hLFOXjlNR9x5IC1t4V52tCJTW8OlQ4fL/XGgBHEFSvuhqgEW2D6ty0lvHxT4C2Y+hCTEf23qW4EkCZwDIxxpO7ww4nS3g+iqbTrDT6ZLtJQofHgG4y99zR6srbCOUg4Q2+3cKF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094980; c=relaxed/simple;
	bh=JG+0atfUtC5y1KTiSY/iz6JtBtXEUSIxy10RSFXWwJo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k9/7dm+RQ1UgNXOw5g9cq4XQJsZe1wZMfKd0MYWuN0yUupfUPQPjHOpZ7sTqTTlWwebPvngcWNbSMBic+2a9ISpoANK2JZMzntoWXehhmQnrRSD5U3FpqkMi1igwv0dM1mVRHIPJ4BLz0cF8D/RkiVPmP7BiVbIg0BhNFognrE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YhtUSeRt; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6mUcY4LnJ+IBjcC74R2knKSfFxYFF2PIyXzLjK0muY/3p8l6RrmHLzN55V/JLiXnmXRZbGRU8sQ+ENZ8sc6XbR2vTztitl+FY0dxu8RwcX9iCvRSTUOW/H9eJwfo91u9wVGcPtpzf2V/KxKcNNibyPtV3RDDtk3IRm0+sz0cT5TwojBQFW4xyt7iLv0gSCfrHNh10yj3ISzCYn4t37DLBD9B0rM7ojUBsxLHRrasJPFum4VyDcMLkq3VOTPX77Gmnqkc4OpGOOHTAaEOSO6d9ddwrPbN+OuvAakeJADYG5dLgfGZP4+zlWXH19KWdzFL8kV7ahvi++L3hKO1sFY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ypFVnKR5BO/9ynrUGi7Oj17avEawxbE8MC8eRhHH8w=;
 b=kCWPvZ8rtD1fAUnxa5LYy2AjeC3jUJsf+ql8TNC0xATPuWbaMSg3AyY8u/aNuNdKrk60S/k5Ih1n/OU2Mwmh1pEmUsFyl1UEWezLWhQjGfTezvmf2ZjMeka20Coa5Lz9sGBqthm/iwS8gXbHtg/TNOV+blXy0nmv0hfaxrI75VpIaMwJ8SWDp0kAoaSzey9GIZqxBbgQAZkou3pQyv8vLOIZKzpg4DaEdLzz+firmBHFjPwjHxo5iQOLp4TU+4LgjkTrIDVmocFJOnU1lP4hHEQg9UpechSCQRNBImc4t+oeMR/wctbvXpQSWDxmkv1fl8DCjNDxUNh0TUmFDEglHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ypFVnKR5BO/9ynrUGi7Oj17avEawxbE8MC8eRhHH8w=;
 b=YhtUSeRtIfLB30NQ7tHGxtOcgYQXXEWNKHg+ARMAukFiLTJl4/qiIvy5Ok0+C6vrqdQUhwO6X+bp1b+f9fIhjaXAfzYHeMdH1nQUqag9Uwg7r55xms/Zwgrb9SgVSRhKyUKOi3iyKJQ1wRpZdV5d2CwKuzOpr0/UuIi1uQqchGUGWAzFc1XDEgaxsHpxEQ2vym+cWVqHvPE873qZe141CyAu1n+RSau08Y+3t85si38hScs4rmfkMI7/9nuKhLMUCRC8cdTuCwla+OHVRmOHAf9eJINEaRMZ5SiD5dbaJbNCfq+e8ioqZeKPe8lnajmyEwRI9SfZe3sITBIUvNBJYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 09:29:34 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8182.013; Wed, 20 Nov 2024
 09:29:34 +0000
Message-ID: <8bdf05e8-ee92-4551-80a8-1efe948d7a18@oss.nxp.com>
Date: Wed, 20 Nov 2024 11:29:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
 <2ccbf862-2b3e-4c08-b6bd-d9571e88a675@kernel.org>
 <34ec26f5-25c1-4510-a4df-caffb75a3d9e@oss.nxp.com>
 <0868a2b6-5b1c-4cdd-9f87-808b4a00914e@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <0868a2b6-5b1c-4cdd-9f87-808b4a00914e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 586d5e0d-6a00-40ea-11ff-08dd0945d87f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUlwbUJNclRVK3ZjMHJDb1hpUVpucDRJU2lUMUQ0a0YzSjlNU2s1OXhvNEls?=
 =?utf-8?B?WUFKZ2xvR1ErRUErbS9yK21OYzF0bDY0NHQzYUo3THN0bFhNbGlyVDFDclB5?=
 =?utf-8?B?NDdnNlZmay9TblJzUWlyaHF6cTRhWU5VSFVheFc2WVNrNVEzb1Q5VlY1a0JK?=
 =?utf-8?B?OGc1cXJpU1BnL2xYNUkxMk4ydUljQTI2aWJreFpxc0F1RnBMaG1pRFNGWkN1?=
 =?utf-8?B?VXVEVk5GRUpFZkI0dTUzMGVTQ1NtTXpOc3RUMFYxWUwyUG02bEFHUi9jby9k?=
 =?utf-8?B?Y3MzRDl6eUxXS3ptQ3JaaVN4TlVQa2hqMmQybjBLNFhYRXJBWWYrUytMQ1BW?=
 =?utf-8?B?Y2xGVnhPUHVpNUtMRGpKcDVFOHF0MHhxa2VKQnp2aDFRa2U4OUxvNTdoc2JF?=
 =?utf-8?B?dVFaOGZmZytKcEF1YS9wMDJ5Wmo4WmtySHBxK2lkNWFMSW55c1Zya2FlVWli?=
 =?utf-8?B?SlFlNEs2eUtUUzd2dEsrNEtKdEs1KzVxSmJXOFI2VDcvbFRNL0xFazVvOWt1?=
 =?utf-8?B?aldseDg4QU8wNy80dFhFeWhtNmk1SVFFelBERnFXTDc2N01yb083UDVVUytI?=
 =?utf-8?B?UmtacUUraTNmaldJTEFQZXRmbU9PNm9QTWhVZVpPcElkTHl5ck9PcXlQZnpo?=
 =?utf-8?B?TDV6MEhZb1ByVndWK2pTUVlVZndjRnZHaGh1RzRZajQraEVURHJGeit4R2pN?=
 =?utf-8?B?dmdaVHdOU2ZhS01VZEJWSC9pQUV4dWdjc3hpbDQ5VjRCYk05eUxMV0krTDY2?=
 =?utf-8?B?WWNZTFRVdHZhQWQxellha3ViZW95R0M1TjYwdVRQWVpCNlZCa1FKVzg0QW8v?=
 =?utf-8?B?NjBFUURPWDREOEduaGR5OWR0ampnNURYSmF5MG5jOXRzTWlyNVZaMGcwZWVl?=
 =?utf-8?B?VGNyQWxhRHBlNGUveng4YlVHcDNwOSt4czlhenRDOUoxOTE1MG1pM3dham1n?=
 =?utf-8?B?Qjd5YldxbHd6Uy9aUlczcmdSRFU0NUZwK3NabzJlVkFCNGFIdkUvQ0pJczBE?=
 =?utf-8?B?QVEzTnF6cThLUi9IRVEwZnpkeCtLeTRBMGszTnpIRFJjd0VjeTh6V1UwNHFk?=
 =?utf-8?B?TnRWSldWeGJKQUFKZ2syYWxhNEVXNERJckpqS0l6YjZONkNBY1Q0a2sxa3hO?=
 =?utf-8?B?RS9SZFZudWhGa2xaUFAxNC9ncWRicDBGQ3dzdzI5WWNOV3p1bW1QTzNGNkVF?=
 =?utf-8?B?WHNQNkQ5VWVyTEJ1MEpMWUVtRExtbFNQZUpJZWQwcnIzYjUrNHF5Tk9pNURy?=
 =?utf-8?B?d0RqZjZEcmNJc0l1ODRCOGhQeFBRTXIxbnhsY00vVWZSMnV1N05qV1pvWFdx?=
 =?utf-8?B?a0tEdzIwVXIvQktmai9pNnYwTkNlT3AxZkNubk5MdDFCTEU3ZHc1SGw0OTVa?=
 =?utf-8?B?blE1Y1hVR1lpM2RHZHF6bCtYelhINHh4M0JpdjZ6UUJFOWFPRUhwbDJBWGhN?=
 =?utf-8?B?ZzhJTm10SEtpZHhPeVlTemtNMVJFVnJTOERWUmd6UGNDYWxlYVVWYzJSdHpK?=
 =?utf-8?B?N1R2WGdBUS9jL1RGMXAwNmxqelhUQnFnQnozRytpeERHSy9ZdVVUYTNvd2p0?=
 =?utf-8?B?S1Z3ZGI4aXc3eEpZOXNCNHkzL2Z5ZGRlZE4zNDl1NW1oKzRsMGg1TUZaL3V6?=
 =?utf-8?B?czM5L2k4WUtaYmo2RDhpWDhITkFDYkJZZThIYm8xN1cyOXZqYXByWFFtSmwy?=
 =?utf-8?B?R1hWUmlpd09oR2hJd2JZN2RiRyt2eVJkaWJiQVlVQTVhL3R6NjZ2VVhlMjBr?=
 =?utf-8?Q?zmbsV/i0Q2rvvQDIN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkxVakZqckNTOWl1SHNHTktIckVIOEFLb0lGRXg0RTNyd2Ivby9aQjViQjE0?=
 =?utf-8?B?TjlTcWJXNVROZUllVEZUeC9LMC9obVR5ZXJjWTN1YjZhS2RhYThaU1l5dzZs?=
 =?utf-8?B?VnRyRFVNY1BuUjR2blRPWUhpTmV2NUZKays0enhDV0kxV0s3U3RSQUVWVnFW?=
 =?utf-8?B?MURERmx2T21mN2FUR3FtQWZNY1NGV0FKazF2bk10dWpGTDFGZU5obmZWMEhr?=
 =?utf-8?B?MUgrOVZJQ1U4aS9vNEprVktETkxva2k1TGZxM25WRlZQdERhYWMvK0ZzNGVl?=
 =?utf-8?B?S3d3R2RkcGg3aHN1cFpuRkw1SHNoa2pBcnJTMkQxNGFXTHlraHRnRW1ZRVhP?=
 =?utf-8?B?aWJ5ZkhMWENxSjJPRE1hMytyWDNobEdqZTMvN0tmVXFWdXpIQ2V1d1pjcXQ5?=
 =?utf-8?B?VmxCTUZ0c3UzZ3p0N0psUWFQVnZxN1dyc1FacVZtUzRyTE1PeThWM0ptdEhE?=
 =?utf-8?B?SzR6T1RpdDBUU2tqWnpYYlgvVTQ0a1NIT0NMZDNCM3BXaHRCVDZ3SkwybHIx?=
 =?utf-8?B?N2pPRWJOS2E4ZzBFZ0c4S0puUjdtTTFaL252WTk4QURXZzNQWjZ4K2hLVWZi?=
 =?utf-8?B?OSsyN05SL2V2eFdxY0pINUdGVENJWkZZTVA1MHgzdml3NXNoQVhMejdIaFJm?=
 =?utf-8?B?bEdLZjRCYjE0SHVHQ1FWU3ZnYUZMYklRbU5DaVd6Q1pPVjNtVENDRTk0bksv?=
 =?utf-8?B?RUU1MWFBVitKWWdqUUx6V2JDNXp6ZTFubEFpeEcycGpDZUttWG13TDhFakF4?=
 =?utf-8?B?MEpUSy95aUkzNDFjQ2RkZFovSFlWV3Jtb2FrSVBCSTF5WTdUZjBQYWt2NGxG?=
 =?utf-8?B?UlJEdVlqU0lmN1REek4vRnB1aUh5cGhEUGlIa0lpUmZsVXlYTWZQWU91M3c0?=
 =?utf-8?B?cVF5V2Vwb2daODlaekZldnlVT0N3VzhIUFdoanJBWWJWckhOem4zcS9MZ1R2?=
 =?utf-8?B?NVRaa3ZUa2Q4NFFWMlpDY3VsKzJpMFcyb2l5M2FTKzBCMVZsd282OFZ0cCs5?=
 =?utf-8?B?aFRLNXRQWG1ZcTlJSUZZMExFSjJ0cDZFdktTaGRFUExjeTJjVVlpN2FoNHZx?=
 =?utf-8?B?NW56enJLYkoxRkdkQTB3d0ZpYUtIdm5IQ2VUOGxualo1Z2ducnFaMjIwdnZO?=
 =?utf-8?B?QmNoZTdBdERNeXN0ODR2Q3ZYRXFwdjJTbGU2Z2FWNDUrSU9BMzVYZTRBNHVw?=
 =?utf-8?B?bWRIL1ZiaFhwVElmVDV4ZGxJYnh0KzE0WEJxT0EyazFvWEh3MEd5NTZXdDJH?=
 =?utf-8?B?N21GdFJSSkpKb0UzbFVnaUxGYmR1ekdJOXRObzFvNW9keWRwb1E2K0tNOXEw?=
 =?utf-8?B?cEYxOStpS1N0eXIwK08rcWF5WVhxRTU2YWZoVkpVMXR4TWFIa3RJN1lPdFJW?=
 =?utf-8?B?ZFl3aG8wZDdJRnI5d0Y0ZVB1dXJGOWRqVFM4dFdaM0xvZWdjWDV0c1VWc3Vu?=
 =?utf-8?B?WGdGZzgvWFFXZ3lQVm9ZdndONVE2b3VFU0dmb3pLN1FqMHFRUTAwdHN1UVRk?=
 =?utf-8?B?UldFU1UrTTFwSmx4MFhBNExhR202Y2p1UmsxTEVFSkZTOUlYRU5tbDlpTVJv?=
 =?utf-8?B?ZmdnZ3lzRGt1NWRzNXVGS09iTTNGUDJCamYwOUx0YjE2VUdXSUZEUUlsN3Uv?=
 =?utf-8?B?eXlLd0d5Tmg3cWpWbmZ3RmtSZ1o2c0FNSjROTEswem05L296YklwV0JUK2hJ?=
 =?utf-8?B?cndPWVNGcExGTXBIbnVIK3NLYkt5Wmg5bkFiRUpvdXhnaS9UMUg0RlpHdjEz?=
 =?utf-8?B?WERoZVBhUHE0eDg0a3docUx1UnpMRUx1OFNGeGYvVUtpVDNwYmIrTm5LaFl4?=
 =?utf-8?B?Mm8vYnNMTUlUYXJiUjBKcVhrTi9ZdkVTUGk4U0pramVLL2dtQTNVMjlSSGN0?=
 =?utf-8?B?eGp3dTBUNGZSQzZCaUJRU2s5Y2hIVXI4NWtqZjYxcWc4bzgxN2FyV24zYnA2?=
 =?utf-8?B?dEszSXVteFBIUjdpUW0xYzNGU08rSkpiSFlQOFI1d2l0SktoNElBa2VqUEow?=
 =?utf-8?B?bGZ4SEtid1ZYbDJqK2tIclBqdFU4bldjNDVBRG5wZ095eDZQQy83WWRjbEoz?=
 =?utf-8?B?SDdsNTNWOFhObWc0Qk1xQldGZ3ZIWlNQUXZKaWh3MS9xYWJ5alZOZ1lMK2Nw?=
 =?utf-8?B?UnRrWkRDWVFXbVYyZ3dqakJ3RWc5UEo1ekVFcUMwaGhtTkNjemxGZGE1ckhp?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586d5e0d-6a00-40ea-11ff-08dd0945d87f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 09:29:34.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3c2qYUk1pnlVF0aBNmL9UM+XZk9VrDfoHqvbuCnmMEUga3Sh+a5vpxIU5rD8vjx/dC6T7vu8tvF4yG+FgTPSXnY0ZZ514ITdjOMNo6e4Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811

Hi Krzysztof,

>>>> +	if (npins < 0)
>>>> +		return dev_err_probe(dev, -EINVAL,
>>>> +				     "Failed to read 'pinmux' in node %s\n",
>>>> +				     grp->data.name);
>>>
>>> I do not see how this change is related. Looks you are mixing cleanups
>>> with refactoring into MFD cell. These are two different things.
>>
>> Yes, I also included some small refactoring changes. I didn't think they were
>> important enough to include them in a separate commit. Would you like me to separate
>> them in another commit?
> 
> You cannot include such changes along other, meaningful changes. This
> does not apply to this patch only but all contributions. There is a
> clear policy how cleanups, bugs and new things are being upstreamed:
> https://elixir.bootlin.com/linux/v6.12/source/Documentation/process/submitting-patches.rst#L168
> 
> Please read above document very carefully. This is v6 and we still
> circle around absolute basics.

I will split these changes in two commits in v7.

> 
>>
>>>> -	if (mem_regions == 0 || mem_regions >= 10000) {
>>>> -		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
>>>> -		return -EINVAL;
>>>> -	}
>>>> +	/* one MSCR and one IMCR region per SIUL2 module */
>>>
>>> How is this related to converion into MFD cell?
>>
>> We no longer parse the device tree to configure the regmaps, we instead
>> get them from the mfd driver. This is the main point of converting this
>> driver into an mfd cell. 
>>
>>>
>>> Still looks like an ABI break.
>>>
>>
>> Yes, the driver no longer adheres to the nxp,s32g2-siul2-pinctrl.yaml binding.
> 
> I did not find in commit msg explanation that this is ABI break and why
> it is allowed. I asked for it.

I will explicitly mention this in v7.

> 
>>
>> The intention is to deprecate that binding since it doesn't correctly describe
>> the hardware. I am not sure on how to do this. I thought that changing this
>> driver and removing the old compatible would be enough.
> 
> No, you cannot break the ABI. Either you deprecate this or just don't touch.

Yes, I would like to deprecate the binding. I am not sure on how to do this.
I saw that some bindings have a "deprecated: true" property at the top-level.
Should I also add a commit which does that in v7 or are there other steps
for deprecating a binding?

Best regards,
Andrei

