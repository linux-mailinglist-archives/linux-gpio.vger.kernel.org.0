Return-Path: <linux-gpio+bounces-12517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DFE9BB341
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 12:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4754A1F22E40
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 11:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB751C4A1F;
	Mon,  4 Nov 2024 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C1Xppnfw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C31CCED2;
	Mon,  4 Nov 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719296; cv=fail; b=aEulQOQZaxkjcFjTzsJwIWrfGm+QuGoFG+nMQPAFD3v+T/hiNuop5S01dzogxs2OS63gLld7VX8yUt4UXaU7gGZoRma9TxIkL0HcrlAA/e4KmA/i3Es3zImUhQCCvjJJgOjtNdPM0Mn16haBKyizKBy8tNsQgFoUyq9vUS10Dmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719296; c=relaxed/simple;
	bh=1ZJlZWta8e2HLzneSKxd1jE2Wjh3sCBSmAgRn6/RlwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GPcPBtLkmElOz1fqHrAQJ/ltCV2b1gqXfEBgrTy8tH3r/NVERhrxENRxUB04nMdhdIv3wv1FOIikA0ZCLU3ap4xTghpRW/oUHJwA5Xqz9HfSCNSNwK0DoMWjQyOtj1nb0wpeUUvoUKneJh7/kVdOPqGf++Vdyl63HYZm4inMvUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C1Xppnfw; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK3qOGBTL8IWzxJwHI9SPts59bYKs+89LR2fI4CnJgTF7KLJfqlWgBDzAgIiFeT2nksUVSvQ+uwyJARN15sC79AZZNJRlbe1vv6jbA67QkOMWLe7T5AL/7bwWWPpZw12MrSCd2IyTsLxEddOIu/k11d+CdrSoc6gGJVNCciBWqKW0RABMC31WR1V4xVuB41QGMRf/Dm992PcTnAe9RrCswaDAO7uAYrkZj9KzPQxsTIkdqA8qfclEpy0jO0CyZEUnQjH0ZbDNwinzMKnacTumC7/qKExGS9/vg3efLWw44K5YR9mYw7vpo9McugFJt/8Jw0+9+1fSrQiCiezPQubag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WboOU/X0GCvP3FVh04Z6BajNjf4S7IbbEEGntZ8NW00=;
 b=OoV7HdLUF+DE5WEWuRpXMzS8jk2yTEjk75lXv86ee3FyN+aFVpjnWzVXqadG7ca7IAcRD4SUaIA7tUciGAcQQM/RLYEGGv8Hg81M0OE0zT4wMArzRFU4BIeZj1QhOy3tf7WMa8n5b6lub9iRutWjUSnwqvS/QIYz25abIl4Uxx09LmpB9fXex6+TgCRJ1Jy3q8OfumfnVSASe0KFbbvJ0rQzy1lI0MQ75tl7vGJvnRf24eb/3KqVLR65l6j7r9OOOrvrDysF/vZVgZapKYf6ig2EzHZULXkN9uYXVCM1QyT1EMHTLKqLOz6AKtC5Y0lmz/VAZHN3NNJuC39kpIv7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WboOU/X0GCvP3FVh04Z6BajNjf4S7IbbEEGntZ8NW00=;
 b=C1XppnfwBkFk6EQn49ixd97oVMy0iJ8Hdac9Sqh2E30wwkKtXqBreKj70EG3VhrWtzXDXb4DghyWohA7X0uAF9aqJMmeT/tBbbgctpFik9kNVHdvuWA9GELFyyNbQZG68g00O9Tjzqd5lPZippkQY69pufMejAyOg26ZTp59EvxPVHAfyflV0VLgJOQ8utDsm8iAip3wQTDeusOSG5cDFAG9qX+KVHBmxcFt6Sq8ZpQh+odwcvboK/foLnKPOrrDG97ZVHFZGlEOcYWB98cYsDtFDY3XbrKkmdo5Sp5Kq/K73PqetDPcK+W9njsaOqF1VGDhSpXz/DnSgTnYgAoBqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 11:21:30 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 11:21:30 +0000
Message-ID: <32c1a67d-57c8-4357-a7f0-3537b5d616a2@oss.nxp.com>
Date: Mon, 4 Nov 2024 13:21:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
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
 <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
 <vlkhmja7xjfjin5yffnet5ava62shsoflmkzfav6c2ylh3o6kk@hvpnmd4uyjca>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <vlkhmja7xjfjin5yffnet5ava62shsoflmkzfav6c2ylh3o6kk@hvpnmd4uyjca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::6) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b9cc58-6413-43fd-5f8c-08dcfcc2d4df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDJNMXFkenZsaWlZWk84bzNjN2xiMjRYTkVkVzFVY3JGZTE1VURGbUZBZUZl?=
 =?utf-8?B?VUlicHNwZi9RZm95b2svaStsOGRkMzQ5end5UE5icXhnN3lpOG9rWlEvL3RQ?=
 =?utf-8?B?bWUyYmZvcXVhZkdMbkZsdVhGSjJlMDhIRERLeE8zUVlKY2ZUM21TMUdVaEw2?=
 =?utf-8?B?UGlDaUhrMkpwSkp3UksxWDhQSVFSSnFLR2ZtcEx5aDZqeGhNTUw1L1hhZHFU?=
 =?utf-8?B?b1l1Q0FsWVBhRm4zek1nbGJpdUZMbDBWWWsyWEIrOEd5WmNvNFdQdExQZ3pM?=
 =?utf-8?B?R0h2SnkxUVhKOWkzRkRDZWpZQm1JWGJFRU5vYUdpbEVFditEVk1NVnRyL1ZO?=
 =?utf-8?B?cE1Xb2hSNzZOY0lkbWFGTG1ocjl2bk1sYXhTbEhmU3RVMmVqSnV2TTkwb2xj?=
 =?utf-8?B?MnpaVWQ3QmdzTlBmOUk0V1RTalN5OWpVdzBuVVBzdEl3Qmw0d01nN0RXbFcw?=
 =?utf-8?B?VjdRTzZOOStlVGNqM0dKaWFGd1BGTE9aOTB0Yyt4Q1h5Q1VGS3M5MktNNzJt?=
 =?utf-8?B?bjYwcFJYYlpMd2NaeE1YR0tRUHBuRUVBZ3ExeVNqbXFnU0ZacjM3dkdRV1hl?=
 =?utf-8?B?VDRSN0x3QW1vYXhYYThUN2djU3p1MjNCK0Y1dmdoUDcrcVJCYzlIOHJlczhu?=
 =?utf-8?B?TkcyMk4rTGFBZG5SWUwyR2xZRDVhU1hSRXY1TFFGMi9IT0VYbFhmSTZidm54?=
 =?utf-8?B?V0VrYXcyTTBRNVhYeWs2SjVKMTRoV0JNMVN2QmgrN3JMbDhNTENPditLT3RH?=
 =?utf-8?B?MDdMUU5ZMWVzT2twMlVRT1VPRXo2cnpCNURnY1hHUmVOQlc0WFJrcm5jVUt2?=
 =?utf-8?B?VFFUcnV6UU1oek5KMFhSRVU3ZlZYSEUvU3RmYW94REUyWkJnWXZ1Tm1YejRQ?=
 =?utf-8?B?bDFVRWFxbWJtY1JDWE5lY3dHTjlFbGlMd1loc3lwbks5N21kVnl4S0ovOWRj?=
 =?utf-8?B?UTRIa2QxVkhPR2w4dGRSUjIrZFI2em5CWFRnbGdnTVVPYzIvMnRaeDJPYS9p?=
 =?utf-8?B?dTJ5YVFkR2JIZjA0VFNFZUFPUmY4bzFLMW1sbjJOc09VNHh2YTFka2NYZDlU?=
 =?utf-8?B?ZmhldHU3RGx3aWtURTdENk0za1RNcGFBcko0T2pMb29XV0dJbzhCZGNTdXJh?=
 =?utf-8?B?cjRDQzNlcHc3OTdOWW5iV0pBdSt5clFHRXB1WUpGd2tJcldTMU9EcGR0Qytv?=
 =?utf-8?B?ZW9jRE55ZE41aGtQajZtVTVWRWF4VER5VWZ2UlBLVlVwdmZyRzN1eFZFbXor?=
 =?utf-8?B?aGRGYXdJSUd6SlJCamF5VUNNS1hvd1U3Z2V0empyM2pYN1JlZnh2N3ZmN0s5?=
 =?utf-8?B?cEZKS0YxeHU4TTY1bktqb1U4YXhTdzQ4Y3lTbjlGclNveFVYUnNQek9GU2hy?=
 =?utf-8?B?cElpK2ZDczNhWVJ2V2VlczVWbzF6NlBxT0JOenZORUl2d2FBTWRTeTRFT2hK?=
 =?utf-8?B?TEliTHVwODE0NmoyajZkUmNRV1Jkd0l0TTZYNlpGQlpuS0ZUQlFqSmgwSXU2?=
 =?utf-8?B?UHNMeW1idXBFdEwxb3lFazNFR0szejRHUEwycm1UR3plbWtrT2tkZ0pCeDlG?=
 =?utf-8?B?VzRIWEF0b01qQ1NZcHVZaGlPQTlDL1lzTHVubzBmNWlCeE5YVG1wR3ZsZVBo?=
 =?utf-8?B?UFM3cjhaTjk1L1AzY2V1dEtRQmRNekx3R0xwZUNUaVRUemtHMHJrRUJ3dVZX?=
 =?utf-8?Q?jBCzlV/JSfUW3YA8b7Xf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0dQbmJxOERyVzRIdTlLeisxUThKREgvQTcxRDc3WStXN25QeVBOak4veVZ3?=
 =?utf-8?B?ZEpMUE14TXJPaFNpVCs3MEdLNkZwT1oxMFBRTytyVThpa1R1Q2RGdzBtSU1V?=
 =?utf-8?B?aFhiQURyeHk0R3lRWE9RMmUzeUhaNmZXWFlZNFdnamE0QWJHN3A4cjZKRTZl?=
 =?utf-8?B?a1NFeVFXRWFEUVFXczk0OUtabkw2QXU4cTdHZWkwQi9MSTZmb1U2NDJLL1NB?=
 =?utf-8?B?SWpFUGEwcVpaQ0xkRkxEOTEySk1SajE4eEVjS1lUMVkwUG1RTFl1NFc5ZVJL?=
 =?utf-8?B?ZlJxcGJFOUxNamxkSUxYRUYzZkphKyt5MzZvUFA5UzkrTjdlUzJnaVpkazBF?=
 =?utf-8?B?OWJ4VjB6dE5PK21JMjZ0cjV6Y0ZaOU1hYnp0bnAxQlBIRk14aC9hWWNrQmsr?=
 =?utf-8?B?RmJMMi80cUEyc1VSNFJSL00rQzc2UnNEYUZNeTRQN0FiMWcxOUdoS1ZpR3l1?=
 =?utf-8?B?c2h4dFh0NmVRSlg2aVVtSGNhSnZKLzBORUpBQUlHaGRXNzhNbEFqOC8wN01B?=
 =?utf-8?B?Vkc1OFFGdjAzTXhDNTZkMWYwVDE1ZUNFRm4vemVMMWYrbkhtWDIzTW1yNDNH?=
 =?utf-8?B?dTIrMWMxTWMzZVBQa2QwY3VtWk9WZ3F2NU9wWXBxcGxpTTBTdG9wOFc5MGJL?=
 =?utf-8?B?TmVFVUhMM0VjVlJMczJyQ0c5SGdJcnI5WG5peFVhUHpCK3pnWWFRQ3pFelMx?=
 =?utf-8?B?WUJMR2ZOOVpWVjJ3WTRtamtPVHlabGljaForZ1pGMkEzbVhNVE02SlBNUXQw?=
 =?utf-8?B?TFRuLzJCZTk1TkZnWXZLRVRnMmNGdVZGTFFRV1d0TTQvMkdYOGxkWWRGaVJS?=
 =?utf-8?B?bW5XaTdxcEEvTEE3OFJGamZ6TEZpTUlOeWFLdXpZd3owdTdsR016OHFCRVF5?=
 =?utf-8?B?NXFXT1dCY2NsOStUN0cxQ05LQzkrdWtwTlF5UnJvQnBkT045anh5eEUyK2pz?=
 =?utf-8?B?bzJpSTFndzlPQVQ5UXIzZHUvZ2NIWEd1VzdCc3ErYnA5MXZCMlM2T0V3S0FT?=
 =?utf-8?B?UnhZbk53NS9JT3FrR1gzZWM4Tk50RStIUHRsVW9HRjdzSG84aDIxbUg1ZlI1?=
 =?utf-8?B?c05JWVNvWERVSzcvb3lURWtZbVowZHZDS2hmNGVnaldPWTgzOXZZbTNnZXNQ?=
 =?utf-8?B?T3dMT3VITXExcEMrSGhuODcxQ2VGSy96eEkrdG01aHNqYWVhNDNGTDRGeHlN?=
 =?utf-8?B?TWd0N2FSbFg3eDZLalZEWDFncXN5bjh4a1NqRjdLejJjNkJwWUpUQXlPWEg1?=
 =?utf-8?B?ZXUzb1dJdExKazQ1cE5KcjV4d0JBZVIvaXgwNmxsRm5OVHZFZjF5NFVraGlj?=
 =?utf-8?B?b3hwT1ArVkNnVFZsUkhhWkc1Tmh4WndndllCYkFTb3RFbUxTRGl6SDJ5eUpY?=
 =?utf-8?B?SEcvVU5QUUs2SmFWMWE3SlRFVVdRbEdINWJ0cjZQUmRYRkVwa2dPNDhjWkN3?=
 =?utf-8?B?NGg1QnVOSDBNN2JyeFNBUXhPaWRNMklXanhTbEk5MWt6TklqaG05SzFGelZx?=
 =?utf-8?B?VUJFYmpvWFIzdDBwTjJxaDBPQ0xQb1dzL3ZFcmdwT0ZNbHk5SFBEWU9zb2dv?=
 =?utf-8?B?RHNmQzlKY1pkb2ZHQ1Yyei83cTNLdUpBQmdmbVpmcFBJc1hjdEp0Nk1rUDBp?=
 =?utf-8?B?SVE3cFplak9SRk5nbVQ0bjR1UTdEMStVN0FMd0RsV040L3g0Vk1tM2orN0Za?=
 =?utf-8?B?cVFuRTdvL2FtaUwxd3JwRG81OXR5bDZ4d2ZINm5XOEd6aTNwS1BGdmpqSEJr?=
 =?utf-8?B?Rko1S1FTRS9kTGF0d0FyRzUzQ1E3ckJ5UzMzYTFZTXNQUlNTQ0pnbGVvcnR0?=
 =?utf-8?B?Q2FyOHdxaHNVMjEyZFB5aDZMdXMwc3MxTzBzRE9zWWZXWmZ4WjJNdnhlTFJ6?=
 =?utf-8?B?R2NmQ1FYQlh1citHVEhHZ3FqUVZsYStzYmRydUVJeXEvYjFubWRGNXovdGt6?=
 =?utf-8?B?d3pQZ1MrTGRLY3FoVzZ5dXFxMk42eFp1Wlg5WmpwOWdpU3dzYzlkVWxFL1hl?=
 =?utf-8?B?OEVXcFdHaWROZVhrblR0VXlYWlZkdFFQZE5LYVoxRDdqV2hueDNOTlpTdE5R?=
 =?utf-8?B?Wk9uZHJ6ZTBWazJxbHJLYlNySkcySVZPWjQrNmRIcHlWdW5NNVBoQzZBc2Q5?=
 =?utf-8?B?ekxjOWJSVXFERWtXTHI0S0hDVk9sb3hoWlJETWlCc2wwSGgrSlNHTklKaEdh?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b9cc58-6413-43fd-5f8c-08dcfcc2d4df
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 11:21:30.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPAMHMqyComB9xcotIJ8579jZbZYXqe3Vm1nQnVMg79xEwgoNymBIaa3SxkKI2jgNdewapK1x3NeUGZj9KrLm5vFKIYwrspgB6RPDmkTY1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545

Hi Krzysztof,

Thank you for your review!

>> +
>> +    siul2: siul2@4009c000 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> e.g. pinctrl

I wasn't sure which name to pick since it's responsible for pinctrl, GPIO and, in the future,
nvmem cells. I guess I can choose pinctrl if you think it's ok.

I will address all of the other comments in v6.

Best regards,
Andrei

> 
>> +      compatible = "nxp,s32g2-siul2";
>> +      reg = <0x4009c000 0x179c>,
>> +            <0x44010000 0x17b0>;
>> +      reg-names = "siul20", "siul21";
> 
> Best regards,
> Krzysztof
> 


