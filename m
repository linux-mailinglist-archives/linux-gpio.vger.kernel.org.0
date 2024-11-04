Return-Path: <linux-gpio+bounces-12521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE119BB3B8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A251F21781
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E851A1B3922;
	Mon,  4 Nov 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Yu6oeRIa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2077.outbound.protection.outlook.com [40.107.241.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120D16EC0E;
	Mon,  4 Nov 2024 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730720708; cv=fail; b=h3Ox3gG/YBrYPLmCilMW+T9uQAe8ItnSRP43ATPFnpIuQHd4uQgpLedDvdar99ms5r705Sahg2aRz7KdqrTZPU1lrjPRv67DM8atCwyyZTd0fEAUg9OcujuGrfu1eFRB0rLcXJJv1tXSvq2Zb4cWYEKn0UaKtSfwLrLdpLS5fOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730720708; c=relaxed/simple;
	bh=/cCYLIhMKLYW5CKDvutddxjV0gb/XrtXfPaM+6pw6c0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qzuL9QCYGIS0acrHUADejVbV20Tw0oAqD1sJJIDCPkcTwslXVVfQNCofY7J+j2Pt+UfeuvnCR0LpgD9WTYIxEfH6BP7gEkdGK70TkF4m31h+LxymXgTRbZkYEetuvGqXIdCFat7/esZJ2mm1kHCKNt5HzSMDBLlQLScIi3pDqwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Yu6oeRIa; arc=fail smtp.client-ip=40.107.241.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJl7VSkE9tUhsaf/AxoYWv4uETz/wrZZi5dTIJXV0LxKwxeaFapG0kufxZjagTIQn9Zoe8jthZp/N1O5IrGpig5DwNtZX3Gmx//F6fNKt6n5ozf1q4nVp6SkzLp6U5Rv47ND7yJECAss4DDix1MBsGXwC5i04i3oHlboMqqL31gpkloQpxTbujSf0qL9jMjilJPgEddRF0iWqaOQf8RQMl1i9PGDzQqGA6xqH6B9TeJyod2fQ9gtCf1dn7zv4F+huf4uYuNJY38fAYfW0v2I6at25D8cHNjQbSpJCR9wJzuY970UwPh2zp5S2cBe5pysYy73Yx58F+ca8UvvJm0WMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA7vlXyKTSMVNkPzq7HpaC/XAE3o9N4+Mxf0TtXb9iA=;
 b=w3vOAV4ckSB7hmZfzC6rCYwQK/gGeM3PVFv5GltXZIyWtxp/vkGAcfK/TH2lemN23KJuZEggUiJ9GTcfMWaIoiEIXJoCbtJ/xNuIysyB688qfKdAO5MxUetkTmwtP/pOTLJgzu5xQNb58Wg5uy0tFIUedGqqmI5MYYyATCbe01ve/imu8ioeGfA8NrvexWN+5ai4QqEmpcdHdZaQAjUxxg14Gqwadi5i3+AOCeBzKE9Bp6ufWPuFfq/lSlag5k5TirUVufMQpdJyhhPMn7ZgWLy7vSLUYxGotQZsvI2QE57gEQkIC0dvLhI8qZdq3D5Wq4Y24dyuziqFS2Pe9sOdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA7vlXyKTSMVNkPzq7HpaC/XAE3o9N4+Mxf0TtXb9iA=;
 b=Yu6oeRIaL9SqdnwwxUo9ILOxp2iwgqxB6sNRA0KCoDThrKJPUN69xPH35jh3TUxFYrPNgIpTG/dwL2EHsrazqfxl2x2JKijdLN/c7uTb6sF/AqWN98F3/aUUKt+D4EbOqGMjKlVgfcCFUD+o8eDELuSD9hah9LxdeaEHCnqeOfkVezXGN58MsH/eNOHoAlLm8tbEF6xmbUcluqUIDrmYHXrVyLvX4Ct5WtFmtRukglNbIJ84XWG9LGjFgKh3SMUNFTapRDKLHadIliIYbaEeaafN/ulZLdZn7IbY5y3UEhOiva/SAo5y4wGtECfKMxui076QTYB1JpK8ezpjNfFn5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:45:02 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:44:59 +0000
Message-ID: <61b200ef-891c-4c8b-9d57-fcc064f52ab1@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:44:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
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
 <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
 <5lgrrlmn3lgk7wtkxcujdtp47fslxxtt2gcaqqarpestswyorm@6fnlwtmxlvbe>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <5lgrrlmn3lgk7wtkxcujdtp47fslxxtt2gcaqqarpestswyorm@6fnlwtmxlvbe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0097.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::14) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 211e8bb0-b51e-4ba8-58b4-08dcfcc61c64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2ZPcEw4OXB0dGhMb2MzN0lSa0w1NFNqd1JZQTNybHdMMUR0YUxOZlpxMmRP?=
 =?utf-8?B?eVFTVDR5U1R0aERGRzVpTUl6ekpFUkY5eG9Vb05IakJLQ0hOeTF1L0tveTIr?=
 =?utf-8?B?RkpFS1dOZWhuRDhEeVlrN2psZ3JuSlVlT1FwdG1xMUoyL0FzS09zOU5nVmFK?=
 =?utf-8?B?RmgxRmNtdGNYSitJU3NPOWRjRkdVYkk0bHNFcGo4TmlBZXhBYXVhaGRlZzRY?=
 =?utf-8?B?OGZFbmlFOG92c25ybWVVejZsbVRRT0pzRW04NmJIMVliTTF6QmVlN2ZZYlVT?=
 =?utf-8?B?Y0FRZVdkdGxkMXpaT3czMG5EemF1L01SQ3hKTVJyTkdpZUJNMlZLWndpUEVk?=
 =?utf-8?B?YUdmNU5Wb3Q0OHl5R1RBNUpQaDg1NDdCYWF1NVRIZnEyUkd3WUdoQXFpYnB2?=
 =?utf-8?B?N0VERkg4d0VtOG51TnlEY3dZN1VoN2hSMXhhUDhwcGJXSXF0VWVVdVhZZTg3?=
 =?utf-8?B?VmFRZkQzTkFvZlRvNkFnZU14NmZ5WWFGSUVUODFoTUNFMHFET3ZROG5vZkc4?=
 =?utf-8?B?NTNKcnNUcEpNK1V3ajY2Y1Q0NHhXcFAzMDNCRHlmQktsZVVUbzY4OExZM0pG?=
 =?utf-8?B?N2pqYlV5ekpjWU4rdnN3Q25LOUFJeFQ0aENkRm1WMWY5M2xWdUZEK3VQampL?=
 =?utf-8?B?K3kwRUpNU05ReWRqeENlVzJhTWJhQXVjeE1RcmR5REo3SFo0MUJQNEtaTUph?=
 =?utf-8?B?ZmxvZ1E4QllxZVplYUh5d0NsSmMycVF4d21WbTdNaDZRbW5USzR1OXVEN1J2?=
 =?utf-8?B?Q21ldUR1eWNrSFJzZmJvNkNDOGpMMmZCVTFaSEpienlETk9XblRoWFBWWFNT?=
 =?utf-8?B?MmFXVTJvbmlNVXVDdmUySjhFbkNVOXFXRldNZEpVSDRCK1V0dEpReGIrbXVH?=
 =?utf-8?B?SGN6OGJleXNLZmlYampra0VTVWRvRnFEZ2NaTnVKbVFiN1huVUh5YXBnNk9V?=
 =?utf-8?B?VmtXd3JGSWZvWmdxNzNEL1ZFWjVoTDRuRno1TzVsQUl1SzArWlhDRk1wK3Jt?=
 =?utf-8?B?L1ZpdGhrQkZhV1FhWkQ5Szg5NGR4TXA1K2Q0WlRoVzRsK2VvS3Q3eGtXMnNj?=
 =?utf-8?B?a2ZaUXMrcUpNQjNseGpCOER1clBOREt6VFFMMElZREtvN1BVZklGYktYTkRB?=
 =?utf-8?B?WUR1SjluOEpOSnhmOU1GNDh2alhmMHJxNFNNNFc0VkFJdkJaWkdPNitObW9K?=
 =?utf-8?B?OERuVUJSSEhxYWdrbEpKZEFhcjBQVi9yNWlPakhxc2tEaEF4dXFHeVJWL2Vt?=
 =?utf-8?B?RVQzYkNyYko2ZGNIYk5hNHhrdUFQK0I1c211UHBBbzZRbjBzYmpvYktuTXJP?=
 =?utf-8?B?aDZjMElhcmFJaEhOZ1lLenNuU3NmQlhKZnF4RzB4MjE0d1h6dDNGaUdsSnJx?=
 =?utf-8?B?d3JVQ1ZiR250eTI5NlFtVDJjK2RzaUlNbWtzVU5UTGxFT3hrZGFNWndmeGU3?=
 =?utf-8?B?SmhuSFJ5citiRkZYdmhkdzRxRmR3aEYwM2xmSzNzd0pXOGJ2S0RGWE1VQ3BT?=
 =?utf-8?B?Y2lhd2hHdmFJY3Y4RE5aanhmU21mVTdlaFhuYWxaN2doMzdIekVaYTJFVVhx?=
 =?utf-8?B?T1NvWFdsWmNXZFROQ0FOeWF1SzZrU0JQVytCVHN0eDErTTBkaGQxSHFqdnZs?=
 =?utf-8?B?b2ZPRjRwNlg2b0FSMmRtUWR3azIvVWhMQ01zeFBzblBmV0E0UkNINVhna0h2?=
 =?utf-8?B?bkVxNVkzbURSY3BxV21UNEx2TjkvUHFDMmxVLzEyRXVOcmZXcC9yRkttbVU5?=
 =?utf-8?Q?8tqUcyi77Bpsea+WdVE4TUzO1nCycigj/fJmtDo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGFaTzYrdXZCSGVZNVR0bVV2WFhpeGUweW1tdUd1ODI1YWppMDFZSmUwVFk1?=
 =?utf-8?B?bVpLSEpYUnBKRWxxUEVKeDVCT09neVZ3OWhmNHA1RThvQURmVmxpbTJmZEhZ?=
 =?utf-8?B?NkFtMkR0MEpoOFhVWjZ5UWlNRnR3eTJLUXU1YXFuZUQ3c2FyTW9TUHNKN3dK?=
 =?utf-8?B?NC9mNjBWc2poYng0aVZCRzNKNHc3blVqeTNlYmY4V0JHaUlnSzVseHVzUW0w?=
 =?utf-8?B?Nk4raDlHcnJGUDFDZnFnenpvdzc5OEU4TjJjcVNvYjlhM3dJc1RBN0l6ZDBn?=
 =?utf-8?B?QWpyS09iNkl1Z1gxNTRBaXE4K2plY0xuNzlOWWZLRE1vTERHSytTdzNlWEw5?=
 =?utf-8?B?czlTVkVkYmhJZ3o4NS9pSVFTQXM2eGF2SFFOZ2docVlZTEhOcFU2bTc2Z3FG?=
 =?utf-8?B?Q1BjeGh5R2puSkFHYmJOMHhOYlZiWU4wd2tUUjVlazVJazEyWk1HbkVvVmwr?=
 =?utf-8?B?K1pLSWlRLytiWWZZd1pJR1MzN0NOQ0ZSbEMxU2NrVW5LVHJlbEd1cmFaeGJL?=
 =?utf-8?B?ZWxIZWpkUmNWek95SXZzYkNWT2V5UDhFS2tLcnRQay9vWmlZN2VONlJGVjQx?=
 =?utf-8?B?QlY5Y0MyRU05MHJDSFgvYWk0MTl6U1pZZTRlNE5LK3BiZGQveDhDK2VzMy9l?=
 =?utf-8?B?NDd4TTE3UXBjYjFqOHBHMTFQajlQSWhPYk9ramRWd3NQelBGTGtWVzhxRGpk?=
 =?utf-8?B?aDV4KzROd01LWnAxRUViSnM2VEIvSVhzVkora2V5UVJJNlZ2VUgwTk9Tdkox?=
 =?utf-8?B?T25QZDR3YnZvU1B0VndxOWJmNkFqSVByWTdtSWpSajcvK3dWSmVYZWl0Z3RC?=
 =?utf-8?B?b3RuOFBETGtzdkZsbVgvK1U1UlRvK3VQWFVkY0w4cVFWWWtIZE1BcUxVRUQy?=
 =?utf-8?B?NVJFZGxCa3N1Z3V0NjcrSVdFL04wL2lDaERTSGNPejhnQjVpVWhGQnA4RUNE?=
 =?utf-8?B?aFdpVnI5R3N3YjFkbTJLREFPa3VqQW5lZEQ2eXI5clBWemlQSG5KNTFEYmpU?=
 =?utf-8?B?RFFwMkdlMDRVUEZGMFovVk1vZmtWRzlhZ21OcFFoYzFQbys5aGovczgraGg1?=
 =?utf-8?B?d09hU01CYWxYRjFxRDhISHcySDJnbzVvZHptcGI0SHF3RHpMc1VGZjJGZlhr?=
 =?utf-8?B?eUhMZ01ia0VYMStURXNZM1BSUXRkdXdVWTh2UHVFMXBIaUxSMjJic1dVUTZH?=
 =?utf-8?B?cGo3S1p5aUw2TEZaM05YVmdZazlxL0duaVE5aktKK2UrcmgzVUd1bU5MdE1o?=
 =?utf-8?B?cHJVcWxETTRDaDh6Q2Zyb3R3L1QwejNZdUtoRFNKMktkdStLbEdkQUh6OU5U?=
 =?utf-8?B?Z0QwUkVCbG5qaHRRZUVoS2lrRWFrQm5GNlpHOVFYVHVSK29CcSs2UVBxMlJE?=
 =?utf-8?B?T0NKanlYSHBYTmVpYU5yeGlKNTVLWEN6L3A2YkNYdmlJOC9XRHZJaWtqNEls?=
 =?utf-8?B?VjVUOWk2end0K1JJLy9kZmJqL1Viem80ZFZsd2QxODFCSHJSMGxmQzZ4dFI1?=
 =?utf-8?B?MXVlQkJheVFxekVENVVOd21UcG5oLytRT1h0QVVsai9EQlhqcTBoajJoaWVh?=
 =?utf-8?B?eEVEU0FzMDl2SktBMXo0eFZVb2ZSVWZ6WGtqc3diUkt3cmRMZGNLUWdmN3I2?=
 =?utf-8?B?Ym4xMTFZSUFCSU5GeDA3d1hzNHJWMC9WS0pVWG1wQVBRMG8vSExVM1NHL3Zr?=
 =?utf-8?B?dk9QWXZBRlRURG5xa2ZFVUhvUnpBUFNoTDRKTnB1UGdlNHcraEl4RURXSS9Q?=
 =?utf-8?B?NlFSTGRQMUZiMjNZT3BkMEY0S3RrOElSQUd4MjNYTEphMURtNjY3a3FQZkFh?=
 =?utf-8?B?U1FxdlovVjJYWnFkSGhuZTFMQWhZandJWWYrKzB1R1JKeUVZUUhOdlpLdmhK?=
 =?utf-8?B?eGFWU3V0U1FZcUZTanZRbjRTWXdLN3lIdTBEUWpkNVl5VEIydFpjSUJwYzNa?=
 =?utf-8?B?bm4ranYvNDdFUStERkpHbEFzQ0IvSlc3NENpMElFa25JRXArSlBUdThBSk56?=
 =?utf-8?B?cnhMT1Q5NzVwbjdIWi9SRmY0U1FtM3RoMm9rS1ZocW1uRHVlNVh4TEpaeEor?=
 =?utf-8?B?b2M1Zm5XRzhxWGhxRmRsY2xGcDRubTBqRXFxR21nNHVzRzI4eElPUE1HbEdn?=
 =?utf-8?B?SUNpRTBOMVZuNmJMSHA4elV2L3FGZUZRMXpycGRCdUgwMXBOOHJXM2xhUTF0?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211e8bb0-b51e-4ba8-58b4-08dcfcc61c64
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:44:59.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f3WLc5WFE1P2TXX3Q6CvGtqut1tdXH6lyxbwmWBzJKn9QTGCQzdGx4iUWhsdkACVsHxwAtu1Bns0QE8tju+JUve41F+qAdS75jPA3JD26U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

Hi Krzysztof,

On 02/11/2024 10:51, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 10:06:10AM +0200, Andrei Stefanescu wrote:
>> +	/* Order is MSCR regions first, then IMCR ones */
>>  	for (i = 0; i < mem_regions; i++) {
>> -		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
>> -		if (IS_ERR(base))
>> -			return PTR_ERR(base);
>> -
>> -		snprintf(ipctl->regions[i].name,
>> -			 sizeof(ipctl->regions[i].name), "map%u", i);
>> -
>> -		s32_regmap_config.name = ipctl->regions[i].name;
>> -		s32_regmap_config.max_register = resource_size(res) -
>> -						 s32_regmap_config.reg_stride;
>> -
>> -		map = devm_regmap_init_mmio(&pdev->dev, base,
>> -						&s32_regmap_config);
>> -		if (IS_ERR(map)) {
>> -			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
>> -			return PTR_ERR(map);
>> -		}
>> -
>> -		ipctl->regions[i].map = map;
>> +		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
>> +		j = i % mfd->num_siul2;
>> +		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
>>  		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
> 
> This looks like breaking all the users. Nothing in commit msg about
> this: about rationale, impact or backwards compatibility.
> 
> Nothing in changelog in cover letter explaining such sudden change in
> approach.
> 
> Sorry, that's a NAK.

I will add a detailed explanation for the change in v6. I changed the existing
implementation because of feedback received in this series and in [0]. The SIUL2
module has the pinctrl&GPIO functionality tightly coupled, which required us to
carve out the registers between GPIO & pinctrl and it resulted in a long and detailed
list.

Also, in the future, we will also have some nvmem cells exported which are part
of SIUL2.

Best regards,
Andrei

[0] - https://lore.kernel.org/linux-gpio/20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com/

> 
> Best regards,
> Krzysztof
> 


