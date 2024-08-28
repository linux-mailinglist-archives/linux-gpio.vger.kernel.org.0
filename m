Return-Path: <linux-gpio+bounces-9243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A6961B22
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 02:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5511C22691
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 00:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B3C14287;
	Wed, 28 Aug 2024 00:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="mOQi7tAQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C4914286;
	Wed, 28 Aug 2024 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724805833; cv=fail; b=j6fIW+SLHfD9E/vLOS5dHXxMm24t8Ncn+kbUAWQscoA/S1fPTjLqx3PwY4eieMAQ4/aT7l4We5goDgHNS+70N1RJDVdd/zO3GKEwIoqSPqXKRxOXQtslsjn48U4zkYeIqxyGN4NEHJy6jHm57S+foiuUVE/AFH1jrF1TzeO/5ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724805833; c=relaxed/simple;
	bh=uw3xP69tTGzjlNsMA4Lph098axt/38NkD6JZrptNZe8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=r+wwJwa/DwQh+ZAkiIeXtTplGDYyXisquNHxwsyejhVzy1Ns64c92xvHECLKLwxNXpAu9eRGqX/fkEoiAe4voqwuhd4JhXSVqJeo/rmzHGVTCd608oRyPqm6P0d7xd+nXDZzgh9G0dyDQrgD+nGsliDlatS8lGh1KHwl1RRdGmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=mOQi7tAQ; arc=fail smtp.client-ip=209.222.82.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42]) by mx-outbound21-206.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 28 Aug 2024 00:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZM6hFxljgqmCMG+Z9huuAXeIMtE+rzCpvQUGU3DvzyBZ5kg0XMuSgtuXMGcxXu+HVfYJI5oXg1IKgHOXA4pFWs7B39XXUVWV+kQzXtLx+o9CNHoVaDOuLEsHujhzlncP1VqwjINF38YTbSEGNppSOUJU6NOR+MImwlcg8iDUgpe0uQMOWal67TIdbmek6zPCQfuzHAabq2GLnxIxG2FQ1kM0B4sfTUFFxnOWvuM9WBDx64I2veUdup22VJ8QlpsC1s7YcG0rG9/pJa6R94CtHtOk4JoT3OM3pS4nQlcaI40RO3y5rFZ4zH2rLjZ8jIm5ozx0KqIs22fJfjPZu/KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxWnnSZYk7F1SU/cdDJAzEbOJ1X7cUf4tFavZUJuIKk=;
 b=Ak0P5W522qKuHkRuWmSB0L890thD/MO1YuU+Rob3M98r/Sf1grQ9M4Z0re9wdzYeuBhnp3MLdFlP18droKa2E+NUlVmmqrxYlVuT2l/mI/R9ArV6Xt7iZRV23Qz2hqlQGbaKkkicb8DK4Yy+wONyOs0Nzu/ZtVDZ8ZoAEDfWa0KJs1Zehiqc1iGOi9/f7o2jxD9X5CE6QsiSXpoDt2reQN8GvfRu6jYHmP206pCXX8QFq4YErHrWjXoasHwYz8o68f71r5YsxaRKeJvKpx9sf7TSWHcVNuo66qcNmgA6hjUeVr+S3NKev39iv9k05RbmyDSg0g46iSagqjrWCniAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxWnnSZYk7F1SU/cdDJAzEbOJ1X7cUf4tFavZUJuIKk=;
 b=mOQi7tAQnh4ZSws2LXR1V7LqXVErk+oRUWd9M66cbOnShFcClRUj8RfjP0DUKo+IpPsNB6fP819tRv4rhT2PwtzffCu4JqEmDAqnCR2h1uq9neDoluXdVSeQkevdnB1kkBFbTB0xhP8o20xuiy8Q4bewV+e1wIlTiSxq4607To/eLhpPjh0L1dx7w56oNI1suFJoB7Hh4NGmWnp8Pla/YUG3D/9eliNuuiUevHi6nIPbkji2L3iPauLHkCipVmj9yNQ1vis2VzRXPcEbkNxs/z+qxCVzY4BOvVAmre9h4vG85isKUGCE9loT73Y6MHWAlLlKid8T/dQaLH9/tIYBfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DM4PR10MB5968.namprd10.prod.outlook.com (2603:10b6:8:aa::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13; Wed, 28 Aug 2024 00:43:28 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 00:43:27 +0000
Date: Wed, 28 Aug 2024 10:43:15 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, 
    Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
    Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
In-Reply-To: <db12d221-d3b1-4df5-91e4-d31fb0acdb8b@kernel.org>
Message-ID: <6ddcd97d-7d60-8e4f-fede-42bf7f99e2b0@digi.com>
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com> <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz> <f682476b-f7af-0d66-7105-1d064f5f1739@digi.com> <db12d221-d3b1-4df5-91e4-d31fb0acdb8b@kernel.org>
Organization: Opengear Digi
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: SY5P300CA0057.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::7) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DM4PR10MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 057c754a-2113-41b6-d4df-08dcc6fa6e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8s+5dZ2HbHAI2Rdt9Tw4dmrRI6YocFvS84IzAdbJoFsARivfy7baGCXUhGNA?=
 =?us-ascii?Q?KgSgT2+2zcg+OPUxO4OqtOubV7QWc5n67H0lu9qOUqpsMt91QCENjbukkgOP?=
 =?us-ascii?Q?aphs72dcyXFk/ZtrdC1AFkhf4CO+PeJxv5TwFBf7yyQ+p24+32JZk2LBYH79?=
 =?us-ascii?Q?vF7iB3jyWsJ2X0H3pjr7rJPj/Inz6KOa5HIUbi+vOHuj3t/cuYCQT7Fwj5IM?=
 =?us-ascii?Q?6yYzew3TFElaY2fSvjXSDnLW9S4be+aWZQYChfnOJv+bbBm3lEq6B8iwykDR?=
 =?us-ascii?Q?sI9RWe/HIsAYXI99+S9Srjv0szypJNAA4YgEOV4cv4fIjy6H8ViIcPwwEh/b?=
 =?us-ascii?Q?2liDYZ/qy2dTvDdJVUHCbZRRpT8cEAwVb7CEvFduqMf7wFA1xA31Wdz4H/9x?=
 =?us-ascii?Q?L4noIH/F5xe10B5UIO65QsYx4p5ddgbdVVdTJShzKDX+0cX6HyO00FKdxcfO?=
 =?us-ascii?Q?0lAczd+aB7dUXEAW+1bWYBcw63CrKn0N/6rysuys5snH5YNqUqk2XXdFgFFm?=
 =?us-ascii?Q?dJgmy2OFXO/CBFbVxFDGLFyyg3uTdRKEMPuIDQezPrm8ze2p5DG5dxrcP9ay?=
 =?us-ascii?Q?KSNooja1BOaCiwkQbK8x9Pc9JSzIMvdw7008Uf9FTtja5EqnY4ynZKRTS76o?=
 =?us-ascii?Q?arcVpEWPzr0t6pIU+y53pvWvibXKP7Hp1pTsrnr1Y06zGGdtk5uNT/vLbHJ1?=
 =?us-ascii?Q?WSF4FlL4nhnjzA2sMw05ZMCDHbHd7YQsKXsCqbpKgalsTgnCkua3Ad9wiReX?=
 =?us-ascii?Q?WfkqlSgHsIEbdxJarGmBE0aAzWxdGH6UUvN6rq0hRVdpjJa+HI9kLBeiG0fB?=
 =?us-ascii?Q?vinX0ixm40SereKm1h+qtbV0AAJB9pCUs9C2h+R8LoKSijpu2ZcJDkmYoAvY?=
 =?us-ascii?Q?FHirO7f+uoIMQjLoNEDSo8xQvMa7NXydzkyS89CNcC4QNjlCpMIZVlNDt6/K?=
 =?us-ascii?Q?i94zy+brFHmZCGNRbJeYHeChlJebB5dT6Biqu479m5kNYAmnco5GbNvaVude?=
 =?us-ascii?Q?DjaQw+RfkwUkLYh17u0Kv4WcobYckZg/aJqqA13edhnWgC/SdW8dWQ0KqsrR?=
 =?us-ascii?Q?Bdi5mOwW+q95dbBID1yNp0NURKi9W6mS2TRjgdNmDViQEn66/O2rqeLJ7DoE?=
 =?us-ascii?Q?Mm/y2as9BdMiP4PUG1T4ksbZ7DDEox7J4dRqFnV38i5/TgqDitP733+x+nYv?=
 =?us-ascii?Q?E35ar5q+uB0iZFrwa+ZYhM3WIHzCp6F275AFuce4AJs09NGCfzvs6TWMHqJK?=
 =?us-ascii?Q?vGzscwjxz5dd/nI32tg8rkeRGg5wlc/L3qlZU3bhSkGIGeLolnp53Oac9/vL?=
 =?us-ascii?Q?7+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y+D7BCWZ6L+CKVj6RrNWh4axNUbP8EaPbcOt+/+Sni4Sl5d4ApWDs0PHXcgR?=
 =?us-ascii?Q?jrlmnS0j1C99ogyWIW9eiOYamD9c7MCtZgFI7h/fcBmSZMUHeKITvegOla0R?=
 =?us-ascii?Q?eS0lPmBnZAKsYy5jqTJOFtSxO33eo3NbL+8oVCtPeRR671FaWaDWq1GyvniE?=
 =?us-ascii?Q?4tglTjLjFhvawQjJf9aEXGvYEA7JexoPtuq4zbieUvgBEyGv4WIVgNTMlsbK?=
 =?us-ascii?Q?quvS5Kd5vXs6QDhFM6tpUZfDikC1tPySMkTI6SfnhhfkqxKlpksZVKz1U03t?=
 =?us-ascii?Q?usbgegmwoEk9DKHOi3hskL09w73M6CStaEiRJDKzUCX1cvi2ZtF6dbSckkIq?=
 =?us-ascii?Q?AFrQp3nUIXfMl3P87bq6sE64RSZp5mUI9Ja63mLGR0lXXU5HGCzH291ki2Ad?=
 =?us-ascii?Q?zZVwzupUkIM4Xn1RuMeKACB0CEKJuL4Bt1sw1gFvxN47ENDX7R4VI0OsMMTU?=
 =?us-ascii?Q?TZzDYzVcxHFyfExgXXvQMaBqwRNm5UPvOyypXIzjgyVE1uiZvKrEugdpcW/P?=
 =?us-ascii?Q?mTZJiW3bZQTFgBYjQxG0nPFSOXCHfyQ9PGILa9ee0b9LRM2dU9mvZt9/1Qoh?=
 =?us-ascii?Q?4Y7+hG1lzyz1ZMqjvQxnKvI0pmIFbMgQAD8dDKNTT5VNcM4eOwUceD4n7VcR?=
 =?us-ascii?Q?XCWQVhI0VQPrl7aBGIKPRANrNo4utmW3FFAcxz5JQ8y08fIbLhIPTf/MarqE?=
 =?us-ascii?Q?5Y6imTUNqzsVf4dqiWOn5OLgWWvGYxOft4HnbRkyfdWIqNkWl0x5gmU4VtFO?=
 =?us-ascii?Q?7Q+drcyj2tRyOncEIzTTWFgYmg00qFwR0rulWuyQl6E4wCfzBqoeNTsZA2E5?=
 =?us-ascii?Q?ggIk6M+yBMKRxkJwNHlvCqTIHjzFKZKPX1y+vMmjeapm7SPyz2XGy/lbFVT3?=
 =?us-ascii?Q?JlYCoTgHb6ig76gDj/MGNmRtXJdrQNupH898IrLshqPAhZh08ZLRoCENEoVw?=
 =?us-ascii?Q?Zxlp7J2cdNFRbEgfxa1/kd+LfTqTRNmfEKI16HfqiYnN3uo5y1i6VuM0bFl0?=
 =?us-ascii?Q?Wu36Je1H59HmzcSdGlyE7FpYpkmARKALyUX+c2ct5TJMO91W/LC5M8dys3Y6?=
 =?us-ascii?Q?hfLVsCPRcmy/JdNN5ooPt1YZ1ELzCx0BMLDAMaopwJKicbJXxRG23TcK6WJ8?=
 =?us-ascii?Q?UB4gcg1dCBY9cXJF52kztAe7/lbdyBp1aYdfZ0R+CRoTWkasMFGnMAxqWZ9G?=
 =?us-ascii?Q?MW0ndzgsUX/DknELSJNpPJk47nk+MK2eqMxUlOGZG7ZDG0SSQ7BjAjFLg3u4?=
 =?us-ascii?Q?q7TTPspmVorr5CeDAuYECLXc8OhkrzeYGFyOHQEQb2gH6ugkEEVQTom+nSIo?=
 =?us-ascii?Q?NsMaKoiKUasiZJ/exEG4UvcWf89vlki+QVM/vBaaduW3XoWdjDOEgHZAG4I1?=
 =?us-ascii?Q?p4sLeoPEivEwMOdcueZpByclnVAUv8NuIfWaCyQPWSlfE4UJdEZdFp/rD3Uf?=
 =?us-ascii?Q?g8d+NBUcMbcqxHmbc7Rnm0KI1PE+2URBmvrhU1EEyz+LLeBd3jrZIfkaE5H/?=
 =?us-ascii?Q?j3NJmMaRM/ZLQmBT4i5f/J1pl7wXVl8LRSVqjRk0Wd5UtOMei4XjqjLj71H/?=
 =?us-ascii?Q?zA2Pv10S9b0oa14gumcSOLcQvfgjSLoCr+7WfJantz2Tf85gBV0a5nsZ9Veo?=
 =?us-ascii?Q?tHcDx9s7Rc90XLURrDz2EIsjqUTqm5uJfJEnPt+mTA+D?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057c754a-2113-41b6-d4df-08dcc6fa6e71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 00:43:27.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shtiITGtj1SugMUsrMRmfa/x6fCJjdz07QI0PV/R1p0C9mnj3A+MBg8h0iRJh9NFXmYUUie/7KQGCJlFGkf44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5968
X-BESS-ID: 1724805813-105582-4659-53355-1
X-BESS-VER: 2019.1_20240827.1824
X-BESS-Apparent-Source-IP: 104.47.66.42
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsYmRuZAVgZQ0CjRMjHV2DTR2M
	zCwtjCwDLZ3DDRyCgxMdnMIAUolaJUGwsArRZwxkEAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258642 [from 
	cloudscan23-218.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

On Tue, 27 Aug 2024, Krzysztof Kozlowski wrote:

> On 27/08/2024 18:51, David Leonard wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,ls1012a-pinctrl
>>>> +
>>>> +  reg:
>>>> +    description: Specifies the base address of the PMUXCR0 register.
>>>> +    maxItems: 2
>>>
>>> Instead list and describe the items.
>>
>> Changed to
>>
>>     reg:
>>       items:
>>         - description: Physical base address of the PMUXCR0 register.
>>         - description: Size of the PMUXCR0 register (4).
>>
>> Is this what you meant?
>
> Almost, second reg is not a size. You claim there are two IO address
> spaces. Each address space contains base address and size. Look at other
> bindings how they do it.

Previously, dt_binding_check was giving me a warning that 'maxItems' needed
to be supplied. Which confused me because I thought of reg as an opaque subspace
descriptor, but I was just trying to placate the checks. After tool upgrades,
that warning doesn't appear any more.

So the neatest documentation would be:

   reg:
     description: Specifies the address of the PMUXCR0 register.

>>>> +  big-endian:
>>>> +    description: If present, the PMUXCR0 register is implemented in big-endian.
>>>
>>> Why is this here? Either it is or it is not?
>>
>> You're right. Changed to
>>
>>     big-endian: true
>>
>> (This also lead to some code simplification)
>
> OK, but I still wonder why is it here. Without it the hardware will work
> in little-endian?

Well, it's here firstly because I was trying to follow a perceived convention in
dts/freescale/fsl,ls1012a.dtsi. That DT uses big-endian in child
nodes of /soc that match up with memory map tables from the datasheet.
(Not only do different and adjacent parts of the register map have
opposing endianess, some register layouts also seem to be reversed
bitwise, others bytewise.)

The second reason is practical/dodgy. The pinctrl driver should logically
be a child of the scfg node, but the syscon driver doesn't populate its
child nodes. To get the pinctrl driver to work meant making it a sibling
node with an unsatisfactory overlap with the scfg's address region
0x1570000+0x10000. (No driver binds to "fsl,ls1012a-scfg".)

         soc: soc {
                 compatible = "simple-bus";
                 #address-cells = <2>;
                 #size-cells = <2>;
 		...
                 scfg: scfg@1570000 {
                         compatible = "fsl,ls1012a-scfg", "syscon";
                         reg = <0x0 0x1570000 0x0 0x10000>;
                         big-endian;
 		};
 		pinmux: pinmux@157040c {
                         compatible = "fsl,ls1046a-pinctrl";
                         reg = <0 0x157040c 0 4>;
                         big-endian;
 			...
 		};
 	};

The better device tree would be:

         soc: soc {
                 compatible = "simple-bus";
 		...
                 scfg: scfg@1570000 {
                         compatible = "fsl,ls1046a-scfg", "syscon";
                         big-endian;
                         #address-cells = <1>;
                         #size-cells = <1>;
 			...
 			pinmux: pinmux@40c {
 				compatible = "fsl,ls1046a-pinctrl";
 				reg = <0x40c 4>;
 				...
 			};
 		};
 	};

And this would resolve the big-endian property issue.

There was a discussion of syscon populating its child nodes at
https://lore.kernel.org/lkml/1403513950.4136.34.camel@paszta.hi.pengutronix.de/T/

Cheers,

David

