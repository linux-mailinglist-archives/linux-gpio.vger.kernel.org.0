Return-Path: <linux-gpio+bounces-12456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC49B90F7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E78C1F2118A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959B119D081;
	Fri,  1 Nov 2024 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DtlSnrNT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874719CC27;
	Fri,  1 Nov 2024 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463068; cv=fail; b=VSxCaqO+xhIz6AT6XuAyT79BiryfV66FEYffh8SEM3DGhoiSmloZkHPOowWrkMs0yjT7sDatfccZN67CtwPSAZzyF7RjX/0YJmeSl5AsY/4Qt3oBKUW8dbNQTRQw3sL5jlZ6iJzGiW1f50P7Iu+YmmyHRpx1JPB2LZDCFvlQJGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463068; c=relaxed/simple;
	bh=EYixRQxUGiOztdwrARTW+QQqXhzaspnNFg8jgsl1I5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iXt50l7DwZSTF6JeA95V3Q5uxjnn2mLUYjQbIzcdCDkoFRLEOIbVtPVUQ13gG7frSAxQ3VfgrkSj+Wnv6WP8MUMFTiVC7u88sc2r2MdZI8//rqajFvg8ov9Ygoz50g9TFqsWEAyj/Ik7LndTv7hrLo7NI83xPQ4Ek/Yhaga2zpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DtlSnrNT; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeCfZQDAV1AKY8nzb3ncS7HInO/zs2FWJO8SIVD+GaJjbiegN5ItxCDt3cPy795rgO/jQSqD+m+vJa/JNbub03XerZDj0DQjqmcjSKU3GkVIrBzmxFqZTLlh+LewQSPdN4MevtmN97uTnxOGnGVK1SYOEevopNtQxMgaTHeIfopC58vtvrH+N+ReMIcBazl1YxgeKNCusPb7o8GaJWch2s3grZTo2ZalNxseVy0BX24vmXK961umDiiVjdCGDr86TV95rxegLYx1AiDwghWEXBufNqVqTIcACk1uteVhaHrOU9GEBfhSqK1MftWZHi7UywC++i0WJma//5Tds1rXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+66/6y10LCAre22xBpVr/OzSzuhP5MFDiEeOezBd0s=;
 b=YW4rEaO1Cxxhj6qO8cuDaPBkiQzz93NpmgJ/fL26FtSPOY4qaTOUtqTcetR4G2RtON9QFuo73ntoxfHmiDrGXhdmI/rl7vVJdhA864wb5Y5mwX6+9ZD/jbsZzNI7FzvJlENL79sth+E+2rr5qN4f8CKjvqJI7mCNUxAcEb9VKgNEZxycGpfZmpiS2TGQS23uTAa7/eY4BY3VZV5lTjRNKL4MzbMA29M06bjKGS+CX0LyjxJ+IKahXTL5p3zTAbNsg2NmhzLsUuFjfwCq96zkhyGfIn4Bi8gLaFBwSyhEeilPF3DPNn564gvlOFAMQ24PLdydcy0bPZXl3Tht3EaN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+66/6y10LCAre22xBpVr/OzSzuhP5MFDiEeOezBd0s=;
 b=DtlSnrNT2v3McB5v7qEjV8NL46PSz+boY1guOyXecX8u40Gg+6Crs8tzD4gArVagvTqnmCHBcOneaLvggzP7ZWI/Lp4O9f9F4rsFlVb2EhDzfYnXqxKlIT4WxYAEgco0Hu9rL4vbDT06JjTCY9rVBREiEfULJMhM5Z/8bmJRr0eY1zDQPfDcvtBY92PdZ+VjIb7Rly2HFy/Eq/VvoS8BnZUFh0T7E3Td1V8hBTYc9cTZRYiP/AdzmkpmOnufelGXf4eGx+LA3r8wunioLaxbfUOoMHfVMFIInAG/m3/lDhp20K24IXl2Wd35/24tU7f/P54ZthZAj4UhYh8RJqa4dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 12:11:01 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 12:11:00 +0000
Message-ID: <7223a31a-bbda-4923-bc5c-8277a8745b17@oss.nxp.com>
Date: Fri, 1 Nov 2024 14:10:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] gpio: siul2-s32g2: add initial GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
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
 <CACRpkdbFQ6f6xg906ZREOgDifSWwfFWdxCqDxcLALZdYg6PWWQ@mail.gmail.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <CACRpkdbFQ6f6xg906ZREOgDifSWwfFWdxCqDxcLALZdYg6PWWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:208:be::28) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: fc95098b-5a45-4f21-ac50-08dcfa6e3ff5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzF6UEc2NW1XcjE4NHVnc3p3UFhNTnJnS01TZXFFUXVrUXRzNHpUVjBhNC9i?=
 =?utf-8?B?STB0UFVOMVBnOEh3Q2tYTUVOWjJIeGtwWFlSVkU0b0NnZi9KMXg5OFczWUMy?=
 =?utf-8?B?clZQRVd5SVlvUXE3aVlaRURscVNKcnBxbUNzNlBzdUl6dzNWU2lZYjg4N1ZB?=
 =?utf-8?B?dnlSVjdBYytlT1VMR0ZCdng4dEJXNHNmZnhFaGxLcDkza1B2M094dCs3Ni9Q?=
 =?utf-8?B?R1pvQVJadlF4Rll3YkdmUFQvSnB1WDUycUV4OSt1NmNrSTZTYWFZa3d2dlRK?=
 =?utf-8?B?ZjRoRllvUGdHUFZKNTY2Z3dON0Z3ZHpFK2lEU2ZYRlVDdjVKZmNsVlMraGox?=
 =?utf-8?B?Z2xTWXZjTlVWWEh6aGRCbC9mZjF4ZC9hYXY1Mko2cjFOKzJaTVBjRURSa1V3?=
 =?utf-8?B?d29jQ2Q1UnhaTnJpMnpaSWZ1SmllZk43Y3o3TmFvNHhzTmtLN0MxNkpOL28w?=
 =?utf-8?B?NjZPOFBhYTFON3ZobDFZQTZxaCtZRlhlbjZLQVpUSjk2WEgrSEFWZDYxbmdr?=
 =?utf-8?B?TkY2U1lYWmNzeWswZmQ5TDNTSGcxZklROGVkZ1FiYjJkeWtwNHh6eE9XOWs2?=
 =?utf-8?B?OE5Td1Z3R2VCNUxxdk1zK0IyT0VDRHEvUFdlZzN4ZTlPT0U0c0lUcTFoeUZU?=
 =?utf-8?B?aDJmVEtWTUM0bzRTQWc1T3lnWmYxejRHNHhmRVJtZlFGQUpBZ0VDeHBwdGtN?=
 =?utf-8?B?NTR4QUIrWUw5dFpPQ3lJOFVOdXNNaWNCalFYVTZGYytVZnRML0xySzZIM0Jl?=
 =?utf-8?B?YzhlK3dDTzF1SDIwaVZDcktSQUZNUnJoZDJablM0VmlvVkEyWWFLOW5yQm5l?=
 =?utf-8?B?Tk9SMHpUdzVjcEFPL0NManE2OXVRWXJSajZvS0R4RTRQRGdTa1o1akw2SjBZ?=
 =?utf-8?B?TGxqampFWEJiSUh1WnA5OGxDa1R5SUVJckNNcWRBODRWOU5XdGpJMlJUV1Yz?=
 =?utf-8?B?WmJOcjFhdzA4SVFWTWNZb3AzZE92UmpCeCtHUVZRT1hRMnBnM3VpcXVDVFlr?=
 =?utf-8?B?ZFJxOXp4c3dnOHVTd0tGcVZJeUJ4QUNWZnFORzZZaFNqM0dzNzFlZ1ppVGw0?=
 =?utf-8?B?VkcrbnhHRFE2YnVVdi9UcHIzZ01razN4LzNoTTJadm5vc3hneHhrRGVlWjFw?=
 =?utf-8?B?VmU3ZWFnTlcvSFpKWFl6d3Vvem1HdldzaS9sK2s1NUREa2lqQklvbk1JVEJR?=
 =?utf-8?B?TzZiV1ViZ0xtU29vOWdEMDZUeUlMclhMa1pnNVBZUm9wZFcwM04yQUJRM2Iz?=
 =?utf-8?B?ZjlKL1RxZ2t4SUpaYksxUlA2QVJtTmhxYWVrMVAwUnp2cGpGY3RrUHpHR1ZE?=
 =?utf-8?B?aU5WQnI0cVpZcDhEeTdESG1vMG1oN25kWXNoYVI0cERrbS9ub3c1eGU2NU41?=
 =?utf-8?B?SUhqRERXUlpSeU0vbzR6bitWMlYxMDRGeVYrekRHdDRpLzR2NmRmb3JtMXpn?=
 =?utf-8?B?K2dvWGhmdVdnZTlKU09VY0IwZmQzQi9KeGlRNFBlMlNmbkNKN0I2ZGUwK0tF?=
 =?utf-8?B?ZmFGNE5SS3JJQzhJdm4xVXJOaTA2SVdKeGdjUjg5KzVjSVVxY2JZbmUwZFBi?=
 =?utf-8?B?a2NLams2VHY5MnNzMjIzNC81NkxwMmpRYk9iRTRTajlaclJQQ0FVQUJWZng2?=
 =?utf-8?B?amxRU3MvbklySS9TU3FteVpvZmVLYURSM0FPV1JuclA0YVlzL0lWQ1FpemEz?=
 =?utf-8?B?dkhuSEdDaFI4bnhkTXdpTnVRRFZadTBHZi9GOGRCamgrMzZqcjNBR2lwdlBn?=
 =?utf-8?Q?OM4wDmhemHKuLrnF9F/IQ26Z6OaJ21bFuwWWHSP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnlxcGpaTFJqOElmYmF2aWEwY3ZNNTFmb2w0cWRzc0xKUGtiMVB4S2FPRnZM?=
 =?utf-8?B?cXZkMEt5Nmp6MyswYVFQMEc4Yk4xTWtOMXNyQWtVN2hrZ3JRNTU3UWFLNk5i?=
 =?utf-8?B?UzdjeTltRS9rN0tUeUFLQlA3U0lXM1ZIbnIrYzVDb3NGbnFkQ1JkVlZUL2N4?=
 =?utf-8?B?ekF1Q3NGdExyK0NXb2xjZ3NsNDUzd0oxYXVWNXlqdGZOMGpaVGZ0TnZyd0Rt?=
 =?utf-8?B?cU95ZXZLNEx6bm5TRGlGM2Nuby9ISEJobHRnK0hvWEhwRkJEcnFRa0kvcFYv?=
 =?utf-8?B?WnpuRVE5NncvcVhYZlJmVC9sYUFmK0lQYjZ5UEJRV3Q4WFcxU05EeWhJeDFM?=
 =?utf-8?B?elVRSVBjUjJtNTZiZzIxY3VYblk0bzBKZlp3Q3lJeklhKy9YVDFJQ1NGOVM5?=
 =?utf-8?B?REdFc0VQajZQVHhjSFJERG1pNXZYZUNNbEpxbUJsbGc4RUxDWFJ0NGRrOHZp?=
 =?utf-8?B?enFiTktwOTdwZjdnMlVxdHlNakpqa0tXYkxublMwZEtYS2VFa1NTTVB1SnFU?=
 =?utf-8?B?aUp6VVYyTW1kb2hMWGlkNjIySnl5QTRDUGdsNUx5L0hrUHZ0c2o4aGNDRmJ1?=
 =?utf-8?B?L0lOMzVEanBhOHozb0h3bTM2a2ZLQk92Y0tSNWE3L004N3VsVStCdDh1VVRh?=
 =?utf-8?B?dXlxcEMvWWF0QWw5cWJnNVFuandmTGx3b2V4QUZibzZnUjQvc1FMMjJXTElv?=
 =?utf-8?B?N2M2U2VwVDJCODVXZFdUUzNzWmRPZmhCNGxMZkVCWVh3L1l0VkIwUWdVV2ZU?=
 =?utf-8?B?UTdLZ3Zzc281TEdlVDlMSytpbHRMb3RVR3MvUkhOZXg4N2RjdVh2RUJhcXV3?=
 =?utf-8?B?K0YrVUYzMzg3MzJpQ3FwN3JYVlBlVDcvSTR2Zkc4d2pjUkRaM3ZyWlhKMUJR?=
 =?utf-8?B?blRzM1VxWVJYanhZSEhtelUvTnpCN2hZN0c1cTJ3WUxxejcwKzlGQ3Nvdldh?=
 =?utf-8?B?Vm8wdTNFZFV5VDJvVzZSWGdPUVR0bDZjUE5JU3ZWWXA2MHZYemJPRE9oZHM1?=
 =?utf-8?B?eE43WFVUVmZnN2pISHRVMm41MitkSzIrTWlNN2RqaEt5V21oaS9RVUxGOTNH?=
 =?utf-8?B?U3o1dzRBVkNyWjhqTTVNVktBNXNQcWJPWUFHWXFmWTQ2dkR1S0wwbUtZeGly?=
 =?utf-8?B?NHZESmNkUnU4aDQyR0E1dk9xenA5bXZWdXYzTXlWUjJ2R3Irbm9aTmFseEhz?=
 =?utf-8?B?SjgwOUh6UVlUK2oxWXE5T2gyR1NWanRzS1dOTFdMdnJGKzY3OTQvMGhSdjEz?=
 =?utf-8?B?UlA0MTVjQnpVaXkreG1wN1hSZVZueGlBTnlXUG5UWHl3aDRiMGprbTdtbXVF?=
 =?utf-8?B?Y2xMWWVyY0V2UXgrN1MzSmtORndaU1lJUnN3RlFKV3VkNVJnaUNCUWtEMjdz?=
 =?utf-8?B?MHFJM0pQMC9JVnUxbWpldm43RmZSWVcxaDJWcFpaNWtHbk40Y2RBdDBkTXVs?=
 =?utf-8?B?UERNTUlDNUZHSFpETGhwUHpjV2FOK1BQS2hPMDVNOUtGQStST1l1dC9zeWZp?=
 =?utf-8?B?U3RUOGNXVmFuOWxHWll5Mk1jS1RxMm9QaFlyS3VjVzNSNDRQSy9CQzJzZ1dO?=
 =?utf-8?B?bnBGTFBUcFcxaHNxcVZ2SW01M1FBZ1hXdUhhQVNTM0JaWVFxWGR4bTRheDJI?=
 =?utf-8?B?eGoxNkJRbzVVc2E5R0VNTVhYN21DTWltcG8vdFZ6SE5nWmNQUm9URUhZTVhq?=
 =?utf-8?B?V2NuTFcrcHhWNjBxQ0VBaFdWUkdPNDhEaFpXQURhaXdmbGNPRlR1Q2dQdDBq?=
 =?utf-8?B?QkZscGdqRm5TZ0I2T0dPVzVWTGV6elE2bTR3bDQ5aDRURnlhbXlsWlR4elBP?=
 =?utf-8?B?ay9HdEF5cFJrdmUyRWtwbjVOeTZ1Si9VWGc1cEdCK1lCUWQwakErVC9FUDRy?=
 =?utf-8?B?aUtLc2ZrT2hnV3B1anc1SC9TUERMQituaFlQSGgvME1qU0dWMWRycE1xT2xO?=
 =?utf-8?B?TDFVa3dIeThpTXhFaDBWY3BGN05sN3JydmJwSlBxenMwRkhmTCs3ZnpwSG5W?=
 =?utf-8?B?clZkdzVHdzJLdVlPanZwQU5XblJTZGk0dW5YSFNnNlpKRG1FRkIxdGdNVkdU?=
 =?utf-8?B?N2g4RytHQWpvREh6NG5KVzcwWjdua3Awc3I1NlN4NXY2SkVCeDZZV2tyR05j?=
 =?utf-8?B?RE96LzlaNUtKSzlHRnhiOHJOYWRLdjFMVkJaeHloL0FLUC9peXlRWUtOU1Br?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc95098b-5a45-4f21-ac50-08dcfa6e3ff5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:11:00.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3m3wDlMXGX2iPOQyXUWP60/rfiUc9XMqt6nfmDNylRo6XUrB1TPsS8G0FSt7bI68e0G+IaA+6TWcoQwRl+wPIE3KULKe2GiZnoLRxom0Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

Hi Linus,

On 01/11/2024 13:56, Linus Walleij wrote:
> On Fri, Nov 1, 2024 at 9:06 AM Andrei Stefanescu
> <andrei.stefanescu@oss.nxp.com> wrote:
> 
>> Andrei Stefanescu (7):
>>   dt-bindings: mfd: add support for the NXP SIUL2 module
>>   mfd: nxp-siul2: add support for NXP SIUL2
>>   arm64: dts: s32g: make pinctrl part of mfd node
>>   pinctrl: s32: convert the driver into an mfd cell
>>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>>   pinctrl: s32cc: add driver for GPIO functionality
>>   MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
> 
> How do you want to merge this?
> 
> Can the MFD and pinctrl parts be merged separately, or shall
> it all go into MFD or all into pinctrl?
> 
> I can certainly merge it if Lee ACKs the MFD patch.

Thank you very much for the quick review! I am not sure which
tree to merge into. If possible, it would be great to have all
of them merged together.

I plan to send further patches to the GPIO driver so it would
be easier to have them all in one place.

Best regards,
Andrei

> 
> Yours,
> Linus Walleij


