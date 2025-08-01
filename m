Return-Path: <linux-gpio+bounces-23958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77474B183FE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 16:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4C53AB84D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D662475F7;
	Fri,  1 Aug 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XyXAj9j/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370B246786;
	Fri,  1 Aug 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754059009; cv=fail; b=H5vVnkBes0HTFcuqiG+VL2lq4n2mfVHV46yWfMEnKRHnA8eVt1xnS8lteXtQ5toVHNSBZGcoBTJD81NdFU8SchFVMy+CZy6jxGzgqPwXlwcasVT/nCrK99Iq6aIs8FC1rwttWxsL9T5+2tZVixUcjT50kDTqKv4A4E7dzyp4RbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754059009; c=relaxed/simple;
	bh=/fFLfD+4HkSvXAdmPbJM75JCMBj2fDrkrv8NXcNHFQk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W8XhYktmo/MfdcPxBkXaSqS9saaJ8S6s/tjIc99GEDkgs5Aom3yXqRY/zRFktx0jkTc2/0D9ztM/7ZpqmJm/xMCHCQAO5QEyLGqJAaDbd6FxaquLDmtoajSkGu9ZSnLCkamjaOqwP1i6/jfTBJEdAzLreQ9w9qhwLXxDi7DeLg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XyXAj9j/; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlCN07OQJBaGLeKIXSXXf2wMg9HZ26IwVDvjZItOFw5V2DMcm0Nh0r11+RxGtbhEGOyJvdLrKQr6kGOAk6ceXBFNqmgO7ceR1EaySW6YXzRQsTAMUonfGTdEc2eWUIBzUt624XNYWwH1nJfrJxXnICOE/jQGTjgfZtowKKOlG/IFsb8P2RlH66St8szoaGbeiNU91kdL9+G7eNGtbEUJECX5KCbSQqTrC2hsc2wyYDSBik/VqBUpgliSUenAYt+HualyH++CTVE62D7iPxpfMwdDqOP2Ntaz/NQ7bybtQS9xilzwL3z01j+Pk/Gd6EQae0Ab3ttOBIDc921srR2fDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAMkpd/2qISrxv2TFtqjME7AxTUyJ2mKquza7jf++W0=;
 b=CrxuMus6hehtVWvF40eY7WbJqtCn+EQj9IPNF+gWxNR+RpZZqB51uapigh+7EcdW/WT/FBaKYfRUrTAVCWx6WvcBffbSgmHQnEfKS65qQM7KdQ1qYlwhdazklMBUm9egK+ZufX2VPmMILNXqh0ug12luCbdoiM9Z0MYMPGFNQOiOafoeGRRLZVrW/zdezvuyWPvMF/vmzMD2t9kDIcFxGr30m4z+7tC5d9w9Wstym3ixoD/pdqChJGNTFo2W1y29UY+UNwpgwUsR6ftwaYDJhhRys7eiBzA6FVryDxV+JZdDoa5l7lxIGjw2O6/gIcvR6eg+1e679zt3aJIzs3cPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAMkpd/2qISrxv2TFtqjME7AxTUyJ2mKquza7jf++W0=;
 b=XyXAj9j/zh4O3PFfWNWUk9meo4KulLaLQEjvj+T+OGdlNwhOjbbhddUdymEeC4LNOrOPPPXVtOyRf/AwF+u1PTTklty94SDZfHQ3xrLi84/cL/BBjB8gyK+9WQ0FlDW1veVIyrC5in+wMniGH5GC6QFfq2gSVeS3d9P5RlYlX0UQpfU2I/7sdcu/b/1JYqO550LbAIXwglI0CrqWaEhulwSGX3p0yNo+Q9PvPZ6jnNjc4qiANusj+cYlICpjdjSFg/qoWVe9Ksv1rapv8cZQMfbevP7XwLf0HaglMdOZGlFqa9clhRGT0pur1nN3CEyFed/7hKxl52cQW3qmBpc1hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB8108.eurprd04.prod.outlook.com (2603:10a6:10:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:36:43 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 14:36:43 +0000
Message-ID: <53bc13b9-365e-4212-84f9-85e67c23e067@oss.nxp.com>
Date: Fri, 1 Aug 2025 17:36:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, aisheng.dong@nxp.com,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, echanude@redhat.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
 <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
 <fa24772b-0038-4f51-87c6-15b810d8d454@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <fa24772b-0038-4f51-87c6-15b810d8d454@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:205:1::44) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 53374aad-7abe-4229-4426-08ddd108d595
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUcwNTJLaHk3Y0ZzcmE3Tm9BYnNCU0xiR1JoOFZHSHk3WkZoNmM1M1paMlIy?=
 =?utf-8?B?K2dIQTdkTzRQOUZ1NHRZNlUvT3Z2VFhwZUwxUG1vc3RrUEVyM3VZUGZqNEJu?=
 =?utf-8?B?OWNlS0NzNmJqdkFhNU1SOElkQS95NUlRZEVOMU5UVjMwRm1xWlJSTytMWkEv?=
 =?utf-8?B?MWhJMjUvcE5rd3hPV1VNRE1tZkc1V0RFSXJBd1l5RDllZllHaWxvd1dHSTNy?=
 =?utf-8?B?NEUzRFhva1prbTVKZEVwK2IxUFF2TFhXUFRmVFFXeEV5cjd6WitYUm84UWlz?=
 =?utf-8?B?R0JZQTZwNXE4ZlJ0QksrVnBkbTYvbndQd2ZPTWd2L29rZFhpRDJpQlFabkN3?=
 =?utf-8?B?akJXK0tYcEhrTjM3NlZIWWFJMjhwUjMydHJmS0VUR0Z3b1F1R0ZXL20vTkRB?=
 =?utf-8?B?OEczK0JWRWJVM3BpSmZqVFdkYnVQVkQrTWxyT0hyeWtXSG8yZGtJMjczbEJK?=
 =?utf-8?B?c2toOE9JTXREMTJzOVkvbFJQb3R2UVlVQ3FkVUJ5TzlpWG9Lb1F1WUNIdExQ?=
 =?utf-8?B?RUthZVVCekFCZEFXYWdPWSs1SzNWUWpsRkFWMThJYmhsYXMzd0h4RDZsTkhy?=
 =?utf-8?B?TkFKNVhHcDdnWnk0R0ZPN3lsS3FLVDJ0OCtZbW9NRERhb0Uwa3FVclR6WDJW?=
 =?utf-8?B?Y3E1anVTeFowNlVPczNOdkM1Tk1reUszcjdpTjJzVjJBMGl3b1gyTWhHL1U4?=
 =?utf-8?B?blZzMlI2OEQwWUcvWC9vZURHZ1lkaE4yTG9objBFMG00bFJ6VmllS0hVWXJK?=
 =?utf-8?B?Y24rVFZ6M3BzVm1seDVlUmhuL2grcUdmTTc4QVlPSTVBT0paVHZ5eFFsazJK?=
 =?utf-8?B?R2JLMGVNOTZaTmpxYkQ1RVFzK3lMckoySnBxcHhTNkF3eHovbzlCT01YQWVp?=
 =?utf-8?B?TGJia0psOSsrR2VsSlNpRGhEaGFBY3MwTStCaW5INnVHaEhPZXpLTllxdnFl?=
 =?utf-8?B?SytZUWErbThKY2ZSVlA5Uy8wUTRlRGQvVUh0Rk9qRVhtVU9WZmxaTnJYQmtl?=
 =?utf-8?B?K1ZOUWd0cVV3U2NUNXh0TG96bnVkNHUvd0RIM2l3ZnFTanp2SW1na2Z0Zmwv?=
 =?utf-8?B?YlIrUlBONmxQWC9KZXRNSVZFUjkrZS9CQnhCaU9KWW5oaDZPWU94a0EzeFhT?=
 =?utf-8?B?L3RiTGNGeDNQaTVTQVg3Z3R2Nmxmd0wyT1pvQUxLNzNycy95WGV6UHYzbkRy?=
 =?utf-8?B?UXRvSFEveWdPbFNja3JScEY3U09LejFsMXdtbHdlZng4Q2xDM2dFaklpOExh?=
 =?utf-8?B?UHlGOUFvRnA1Z3pVVW9WT3FOUzhkVmFaQzljQ1E4WjA4KzM4SXQvUFNhSTE4?=
 =?utf-8?B?di9hYkE5a2gxSmR2dU5zMlozK1ZpR2JFTzlEaGloMms5Ymd2VzlPSm9GMU83?=
 =?utf-8?B?M2tiRUxIeGxlUk13ZE9HQTh2ZzhoTDl1ZmZ0Ky84NDRWNlE3TjBiY1NJdUdv?=
 =?utf-8?B?aVRYQktOelpjSCtIcXNLbWlta1B3Um41MlI1cVZiTHRObWR6clJ3Y0VPNTVF?=
 =?utf-8?B?WUhwZVFvNFJDZllXbTNwamRDNjY4MzJTdzVZNUw5UW5paWExQURNTVdRbFIw?=
 =?utf-8?B?Um5hTHNnSHFIQVUydkp5VDEvVFlZbXhVVlcxVmErWTFDeVNZSSswTEFoU1k5?=
 =?utf-8?B?MHJRN0FXbnlmUUdqZm1NdWsvL0t5SmFlUXM3akloN2VjQWNJa1MwblZxVVRG?=
 =?utf-8?B?OUpGWTdiSDUza2RiaWNheVU3TVdwNlNJenY0YlNZOVY1MHBEZy9Fb1R2bHZP?=
 =?utf-8?B?N3laaFllelZUTGZHOFZaYTlEdWZnaTZtdldCN0NVQmRtRCtGQm4vTlVqT3FO?=
 =?utf-8?B?ME1nTmdOK1ZiekYxM1RkdTFrN2lQdWg1ZGtGUWVWRFQ0M0xiUjFVeTF0cGdx?=
 =?utf-8?B?QnBLTFdONUlOM2JSaVJIamNxcS83K05DN2pvazJVVUx2U1pqTGY3TDNvS1hJ?=
 =?utf-8?B?K2w1RXh5SnpQeTB6bTVCUjZlSThkc3NCa3VlSUxxS3NsSmJueHNkS2prSkNU?=
 =?utf-8?Q?OhsFDTnz3wnwNcz+Rf4g7OdesBB8v0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1dsTGNtZmZiRVROdC9pMXViRUh0cDlzU2ZIUHhHbmhsVGN4TzN3RmVSbHBX?=
 =?utf-8?B?ZUZQVkpldXdWTmtaM0Vjd052ME8vb2JXWEpGaUNGWmF3ZkwwUmpIYW1pN2Vm?=
 =?utf-8?B?eUZOQTJKckZUR2o2SXRCRGVBYXFvRS9vZUtRc0JOZG9sSlNSYXJPMDg2dFB0?=
 =?utf-8?B?VHV2MW9FU0pFOEhGNGU5RzNwVDd6RlBLRTFKa05pSVBjOW5HbXowOS9vWVBL?=
 =?utf-8?B?eTRrZTNRVTNHR2l2VnhPaXNVYVFJTVVOS1ZJU1E1NHhDUXdUS3drOVVHWHU4?=
 =?utf-8?B?TUhNQXE0VmRDUTBGVnRLcGlhQzlWZHZ2RFNrMWhkQjFxTTFpVUhIbjlrRkRV?=
 =?utf-8?B?b0tSVjIvcDdXNG54aE55L05QNFhGai80Q1NocVNFNkF5M3M3d0dKNWZFWExY?=
 =?utf-8?B?WHpYbnFsQjNzaW93dy9XaE0xM01CSmFtOUorSWVNNGd6RU9TemxWdEgxL3Jj?=
 =?utf-8?B?akdabTU1WVlFaURjWkFXd1lUZzcxZEZ5VnpXK3hrWnJ5Rm9BUnBDVzZSOHFR?=
 =?utf-8?B?MWlmTXpiRUxuNDZ5TWlLdlNkWXJtellHQXB1ZFVVdG5SRXBabEtraTNzYWRU?=
 =?utf-8?B?ZnYyT0ptclpPaTZydnRheUp6RU80eXhHL2ZhZ0RvODR6dWFxUkQrMkcwL1N1?=
 =?utf-8?B?eDBoc3Y4eXJmVEcxQ3gyWHNia0xPVGhSY1lhR2V6UTR5N1VOSy9MUVZLNjZQ?=
 =?utf-8?B?elFGLzVDOFdBOGxpSGtLaCtjWkRFT2NRYmdYajIrVGxNYW9VMTExTFZsVXdy?=
 =?utf-8?B?WkZrT0ZsNkwxbjE2VExlM3lnVGcycThLYkpxQTRXNTVNK2Z5WGMxeGU5QmQ2?=
 =?utf-8?B?UE9jZGNjK0M1T1BmZWF3akRqYlBXcEY2ZDI3Y0c5dWIxajFreEVpeGdIT1hn?=
 =?utf-8?B?VFRGcE1mMzN0cWR1MTMwRnMwSlY0TW9icnhPNXRxdVNwYnJ6V1pxeU12dlMz?=
 =?utf-8?B?UUF0b2t4V0YrRmIvbnRpT3ZXMHd6OCthUmJJdWN0dWd5b01oc1k0RUxlRko2?=
 =?utf-8?B?T1JoaTFHK2Y1QWJkQkpYRXpnQVBOb25EWCtsWVQzb0ZySVVTWkVpbnlCbmNr?=
 =?utf-8?B?NnkwWWRkVTJoSHY5R0swdEFKelpWc3ZaSldQZUIwSy9MeFpPSkFGME11Wk5J?=
 =?utf-8?B?TG9XWnhvMSt3Q3BhQzZtc3BiUllpOGdXQjlKaFk5aEYxbnR3WEx1YVQ1SG4y?=
 =?utf-8?B?SkN6Uk1iaTF3TVdKRXZIdisrL2ZaMnl1MXdYTmFYcGNwUUt1UW9qdExqTjZW?=
 =?utf-8?B?aXhqY1o4TjlQa3JiTWhPaERIZkFzTlkrWjcwQTBtRmFJSWc1NFJiQysxZVE1?=
 =?utf-8?B?NEU0b0VKckR0aStvR0orekxyeWt4b1dsc0p1UTlVWmx1NEZFbXZ1ZGVnU3dS?=
 =?utf-8?B?VUdBR2NLQjBRWkdvUy90anFnTEIyeGE0a0pKSmdkZDNQRlNiaFg5cWRUY1VC?=
 =?utf-8?B?VGoraDBWb3hyQm9kV1J6ODNpMXhxYnNQRS90NlZRRnh1bEpDVVpwMk9JQ1hi?=
 =?utf-8?B?eWtaVFJUZFRNekx0TVY1TSs4TnhaTS81bGhNODhTU1NrWHAvVlVoZW5UYks3?=
 =?utf-8?B?TnEzYjRoMFFGYkgzSU8zRTUxZ1kxZUpoZGNteTU5cmhGMjRPSWQ0MkpZTEUr?=
 =?utf-8?B?OGl0WHVoUE1yOHUzbTVZZmcwSDNad20wMEdleS9kWXhxa04zdE9ibVFSclpa?=
 =?utf-8?B?MmJ2YmpYdHV0SnZKZGg3SXRiUzViTDdmVzdXQ0FabGxNVHZrempRTS9UVFkw?=
 =?utf-8?B?T016WFpBZ0hNNEtsRUs2M25ONzFGTWNqUytZaS9KaGJ1M2UvMlRmdGcvb3RN?=
 =?utf-8?B?UVhiekQzWFROQTdsdi9YZk9McHRhU2tIcUNoamJXZ2FQNVQ4N2d0cHRzdk1M?=
 =?utf-8?B?aTlpcldUSm9OaXcwd0pFR0ZCOE1yanlLVjJxQUI4cXlyTzJiQlYyL2JZT3or?=
 =?utf-8?B?V050cjVUSEdvcW5kWUIvRm92ZkJNWE9ZU2pCdDU0b2lQMm0ycStZVmRHb2Nq?=
 =?utf-8?B?UjlTUW9vVzR3N1NVVlhKaUJraXd3T0RFTVhWTWhjd2FEbmdHaEdUVFBzcWVz?=
 =?utf-8?B?UUZlNGY0eWRtMWRZV1ZvL2JVTVdoenpidmt0ZCtZVEVacFpHRzVnaUtEUlNK?=
 =?utf-8?B?bmR0KzRmOXJnVlIxYmUwRHFGSHNvOTIzZ09KTCtXSkxZa2VKZjRVS0QwdXVC?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53374aad-7abe-4229-4426-08ddd108d595
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:36:43.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSEKggRWzFP+PfnIYKMuBhz0aXYh6HSp/znH4aT2lO/Mv97G1IvWco1pVYVT6TcCQMTBSCZR+4w/dxY5s2V2kTvWdhll6Hc88Ke/ht1WVeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8108


> Thank you for the review! I've just taken a look over soc_device
> and I agree, this driver should be a soc_device. I will convert
> it in the next revision.
> 

Hi Arnd,

I took a more in-depth look over soc_device and how to apply it to SIUL2
and I have encountered an issue. Downstream [1], [2], [3] we use SIUL2
nvmem-cells to set the PCIe vendor id partially based on the part number
and also to ensure that the SerDes subsystem is present. I don't think we can
achieve this with a soc_device driver. I saw that we could export a custom
attribute but I don't think we can read it from the PCIe driver.

Apart from the proposed NVMEM driver, there is also an option of exporting
a syscon regmap for the registers which provide information about the SoC.

I have seen that typically NVMEM drivers export information read from fuses
but I think having a NVMEM driver is nicer way to access the information
instead of using a syscon regmap and manually extracting the needed bits. 

To provide a bit of context: the SIUL2 IP has two registers called
SIUL2 MCU ID Register (MIDR1/2) which export information such as:
the part number, major, minor, package, maximum frequency,
flash size, SRAM size, SerDes susbsytem presence and so on.

S32G2/3 SoCs have two SIUL2 blocks named SIUL2_0 and SIUL2_1. We need
to export the MIDR1/2 registers of both SIUL2 hardware blocks.

What do you think? Would it be ok to keep the existing NVMEM implementation?
Do you have any other suggestions?

Best regards,
Andrei

[1] - https://github.com/nxp-auto-linux/linux/blob/release/bsp44.0-6.6.85-rt/arch/arm64/boot/dts/freescale/s32cc.dtsi#L1036
[2] - https://github.com/nxp-auto-linux/linux/blob/release/bsp44.0-6.6.85-rt/drivers/pci/controller/dwc/pci-s32cc.c#L832
[3] - https://github.com/nxp-auto-linux/linux/blob/release/bsp44.0-6.6.85-rt/drivers/pci/controller/dwc/pci-s32cc.c#L163



