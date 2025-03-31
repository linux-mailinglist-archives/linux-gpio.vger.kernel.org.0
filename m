Return-Path: <linux-gpio+bounces-18120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93AA7647B
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 12:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41053AAB34
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 10:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29A51E0B62;
	Mon, 31 Mar 2025 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qp2rUwFB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A701DF987;
	Mon, 31 Mar 2025 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418005; cv=fail; b=kRN7Q3pcy0pNCv4oo4lUdb6gzuySNJ6xK0SU6dBpjj+AE1/USazTs57H86nSVIzA4Er6F8iGxpCoGK0NXIQUQXZDD+piSfWsknxoW82DriTKCJZ3JFdiLd/KqeNBdhHGyIc7dN23NJjmYVU7zEON1rQstzsRSXuZQ6thNPzqV+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418005; c=relaxed/simple;
	bh=tXISFNBLdvBfEcio+8TuwcCZRAPTFRpjiCS2drtArqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n4DVR9OhiFgOcRvJEDEdIWx0mJly+PMrnOxOUBbZLpvVG5ShJcheQA6xyeDlYkI4aVqIxMisenPUI+IuPFRvhqp/e+T04hpNlFxQL1W5eaCzsDWy9trYGynL3k4ijGSAN4Szf147yYV7E1CeSr2qjO109xHfIICthjyE1dSKkQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qp2rUwFB; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j96KeTXZM6U3QDcPCBtlfWd/tgSxlCjLGjaDARBEANgYhf6OPeg+qjOaIElU3djcbmjveQ9IOc3f8PzfGDzDYG8LTyJjaYWWry3hMhP3UiKgxawgfjgJFC4Xzk/dF5YBWXj1fEgbwdYTd1GNeGZkRgk2HUuBK4n+rGNaWGAJOV1cIR58vpbu5JZX2i1Gj/JuKY7GesChOX1dIbZzmwC+tfYW3164z8YlqqZRnfTSffdm9KPbOXcnttsJ5iAVb8vEeVVLQeog3FVxzlt9L1pzaZkT42ZuvPvTT3l8gsh90W/q8RvH3ZSq0nHHCJPrxopNLsPzfS3+9BJqPmfELTzsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ub2Hp04fubP0aPoUg3hcGZIJs+xjp0m8oU7iHcL61o=;
 b=AvaF+c/OIGWYc6W7v9wFsheNWEdo34yGv/I/Qew5E3r4ljntD0yKWPBAziKX4Ac4kbLEJ3osPJGI4kupNSnkbOTnWZqaN+j8jdOX4N81kFfcxLGLgLTdMRFStwK0U3Bwdm8oehAkXykp1fv//G1+DL+hRh0M7H+DM36ulGUnVkAQJoaXR+OFtSrCTF4OcxLno84VW2IXoskruqZhCPwTPP0HdhybSxj5rYpbEADYskd8UWxaTZOXOOwAcQKPPb54J9xImTOBHdUdfHn4nMB6bcjJXAtdJC5/h/aQ0Fp7o2d191j+4lHxvc1jJt9Yvnwh7iTtmolESXKJoh50mqxjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ub2Hp04fubP0aPoUg3hcGZIJs+xjp0m8oU7iHcL61o=;
 b=qp2rUwFBrOFpFtLCN40fkv37ox7bcFgNBc8ejww4AXfjBYlmxY+gI8omlmWGffF6BhOmH86305KISRjIY6iJgdEWbWwOi+OsalrOzhiYlJF0JQydmHxcWKq8UDY3TixjGLHFljAsmBcUpXDqJ5DfabBT5HlFqF1mGVGXA/E+CBOTxUX4aysE//jlpwMw2uU8HJczMN8CA+S+A4t81MISnnUBiTEa+YkW3VN+xN4yOUAnosTI3Z+xlC+jWf0B8v78nGJ1pHEYoW2D65EHjR74gzJCWVxFxjmTS9HXKOZnOb9cYZ6GVxE/U1o0zxeXQIzbYZSwFQPZoMmbkH5r6U4wJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 10:46:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 10:46:39 +0000
Date: Mon, 31 Mar 2025 19:54:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	krzk@kernel.org
Subject: Re: [PATCH]  ASoC: codec: ak5386: Convert to GPIO descriptors
Message-ID: <20250331115451.GB6762@nxa18884-linux>
References: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
 <Z-alF-gK5TpGliCj@smile.fi.intel.com>
 <20250331060359.GA6762@nxa18884-linux>
 <Z-pB8IQTWKXze6jd@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-pB8IQTWKXze6jd@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 918a1d67-d518-4a64-eb38-08dd70415091
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jq13EV1m8M+UEYkPiOIdWUrDARJlRg52sNvgDoi3fAcAdPFS+OY/+cbNRUXn?=
 =?us-ascii?Q?BeEGVDzo8f2c788QMDUu+ds1K79HqFxeZk03k2K/d4N5MlJ5YONXF229N4ZW?=
 =?us-ascii?Q?7wjtWY/+gLHp9eJTZDq40jBVTRVBsP+qer7ljQFWpWoYDT8eMooqyMqq/Ovi?=
 =?us-ascii?Q?ZJ5k9Hu508p4rsBtDeVY2h2jI5c7iF2it7QW87CWialKR+ie0AheJFVhwsQx?=
 =?us-ascii?Q?O/NjHa84ids+0idYjwTXmuusaLvBZ6iKd8wEgcblfztxqwtEahUnBBi7St/7?=
 =?us-ascii?Q?G5MSRV3VRSA9adQt652L1+8Bru0bYQKFGYbO8Lhi9VMzntap0ohNnUoKYe0o?=
 =?us-ascii?Q?VK+F4pQQPRV3MLiTr5TAZKzqQxaSJzAN3niOnZa2HE1BpNN5IrkfkI592MVV?=
 =?us-ascii?Q?91OVp9IrddQXjtHFRBr5IJCyn5ikGFoUNG5G/XLtRL4Qo7Pvp5Q7VQmFUXzN?=
 =?us-ascii?Q?amkEyjOaondK2dQbFFrFAfp1QMPEzwC9eVVR8JOYtFRz/eAI6XvLY+F/lhKK?=
 =?us-ascii?Q?KAh7gBvjCO8bqNsk8UkUKN/7rE7YTSi5F7whnZPci/FEjMpumGPtHwMnbbkq?=
 =?us-ascii?Q?MzSG/No4Bf94E0G2tpWjLvvrHMMzjSVW0gRYJEloHT5/v11+o1HyTf7qoKPe?=
 =?us-ascii?Q?V46sclTHdl6FRNx7h3VUpzfv4SKMKY2wYj6Kx/30EJKVjaekIa/oiQpPxSd5?=
 =?us-ascii?Q?BPuScljUtWD8XQ6cgtzRryUDdX1doMAE0PqmzIMa+pXCzWu6NIygKbAEURLs?=
 =?us-ascii?Q?OpomY9o9b+RZPNr4+kb2SCSzw7nMdyy9BOJWsFBUyGiZxoQmMQQlyxz9S3w+?=
 =?us-ascii?Q?92/Y2w6CA/wzZyFv0tU6tfUh0h2htqjQPUgUPgURA7t53bGqXWz7NNmJR74/?=
 =?us-ascii?Q?2vUmhEEc8nDyvc6pQm4kRwxee5TxQlYj9yq0Jofg/4JYf7XofKw/sQOFWyTW?=
 =?us-ascii?Q?OXbKY+NusZeZyZoTVaa+dJBGgNkhgLLUlG541V/3oupCPgP5dJVckHrfAQjE?=
 =?us-ascii?Q?12ylqHSt7oc3dcZUdkMPo+7xnx7rgJaJABeHo/oWN8L7D5dxro4whlLgqrwH?=
 =?us-ascii?Q?2I00OfvB/WTGtN1/JIC4Mi1MFjjh5afnhd5bl0zWPknV8fWi4yBwWqnpnZe1?=
 =?us-ascii?Q?iMy5tIFRLhkph+gLztksWxFB0lbE0edD/ox9WU7kOwtMzLXDyFaUXKHEf5lb?=
 =?us-ascii?Q?jkgZVRLJqLlK+Um8CPQgVn9A4Iw3vP+BQovHG1uqJVqDdFPJwJ4k36BpVWC+?=
 =?us-ascii?Q?aiVU1QfStQW09BE1R7xQgRMfN5nLt+1k0yRgnCpcRN+RxaPv+DD83iYlJw66?=
 =?us-ascii?Q?LhylmKwwR1ctb9Rx7m2T0OIvZQo0Wxlqr76GKoPnzsv6NanJegqL3Hy5+4aT?=
 =?us-ascii?Q?xVrcIW/MkuwYDXlOYahz5vf0Astk66KQi+Nnb5d8yu6BcyVzoo+MsaHHIYYa?=
 =?us-ascii?Q?TBv+EOeg6b99QyCyNTZvohUeNqSsnUoY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hm4J60HlnKHyMZn7Ju3uMhyGLr8Lx+PDp3eHWJ2cuo2VzjlpSf56gju8fG1D?=
 =?us-ascii?Q?atjDE1HAjDX56MlDqJO96BIFHfiaqdUyS9siTDsu2l2Jaj06W6wJIUiRYyAK?=
 =?us-ascii?Q?xJFVBJUxck54qPWoM8gkVsJ3VLmP641mcpocCgk3m2UxrUtDDN2EiWOI1Cd6?=
 =?us-ascii?Q?+zu+xZtF1h5VpBTFwjnQ4D4OIsIDOLbMZ2uyPBWe9C8wnbhlarHgLdatcnnM?=
 =?us-ascii?Q?7Aw3nuiM/xNVrwjWF7liRYLR5qwsUDDdK9i1vm7Yp+8OQDq4eoIWlTjfmvIv?=
 =?us-ascii?Q?h0/OKa/iJwzSeuBhb/zoBnE7DxCKCtuNMvYoQ6wiLPftUf9zm9b79UGNSno9?=
 =?us-ascii?Q?llBdl9tQJMsvumuOzOXDA8CL9PFPyfAuST+n8lVKa2ZidnGNWtkx8T1/eTwe?=
 =?us-ascii?Q?+1VPTfbQ8sSXELHGQFyIvvta/7LwXc7ILMbsvmfOMJxH43TznsCqQAk9DVOk?=
 =?us-ascii?Q?6HqqqJ6F3Pf5fPF1EXBZ/XVP1NnbXUbKmXZ6ihCWiRkSBwDU3nTMaymEZlWN?=
 =?us-ascii?Q?tkPWD3moJHugVJSLg43WRhf/p/5QqHZqhf1dnQ6D6j3BNnV1RHU2V28s1u5o?=
 =?us-ascii?Q?xbpWXbtvJ9Ag3f/naaJ6dFyuUBDALXqwPNOsBrDPVwUudHOjl8p1/5AXjjRG?=
 =?us-ascii?Q?jm2gA6D98K6lXAKUn4QOp5vZDKAguvEMWeyBiWjXwa7656buQmKnfyRovux4?=
 =?us-ascii?Q?HbXW8ebQ3S2nTmTd6d0ONRYzyhOl0sf2gfJ8L531+2NmcoQzFb0tZH1viU3i?=
 =?us-ascii?Q?wWWG7xQu9c8yzeWhf8kN01hk0UiKjhq6SqJ7SelhB4j8lZ0HgDA8Ic2yoIzI?=
 =?us-ascii?Q?Gz7mCwoeemsOU4xomCWYnu6HiwUX88z3r0PY/S6+SrAX/QH48wij381nHBUI?=
 =?us-ascii?Q?xSMh9Sa/Xok8/r3ifsyQJ+WhC9T1eg2up0UwQ0YuUHnAdNcvOefM2c3/E4Hx?=
 =?us-ascii?Q?5h96kbXXuP/TdntcfT6TouTts9TDWBPiJOYFBC+nhNOpE6Kw7HOFN9oS9YQ5?=
 =?us-ascii?Q?BVIOo1hb3C7ILL8CH6gMwvXUWQq/2CDwQfNNj2I/MQA2YaMM/seOPLdsYSMx?=
 =?us-ascii?Q?hvQMC5y07FovM2fAV0ZeZhUxPNqUyqsi5zErhTvyC4utBDBr9u8yIPl+eWD5?=
 =?us-ascii?Q?gLF6jxSEXYDGLTkk9AZqLCnZzD20xHaqch4K8MJcm1Pid5GYAYADkh/Sfhi8?=
 =?us-ascii?Q?JiQ1+dXo1xP/MGzNE/n11/AnkCYEe45hqGwP679g6GwJlcztfAMqRJtYribR?=
 =?us-ascii?Q?ikb7tFNs0HfYUe5Z5Rc6/0UgppvfdOy24bEJkth1BBfIsHkuoa1Gkn8ZEpjf?=
 =?us-ascii?Q?vYG0gWeL/HlC0rQV04eSfPs/SXVnHPtccJKZ00r9XMx+RmtLoDgwdWD3zy1W?=
 =?us-ascii?Q?VEhx31rae6fdPgoj+rxsgxk1pfbQy3OLC+9jeXriH02itq9YYgP0yk6qYVIH?=
 =?us-ascii?Q?Z8CoC2orZpo7/3trcpToiZCnnv90tPICD32Ng4BM4iu8BvwZawsQ+MHDA8k0?=
 =?us-ascii?Q?eLBQM+2cB9VdSLV/Yl3nxSGDhIcf0AZvKhiRtGmXDhXWapq4VAK9Oj6V40xt?=
 =?us-ascii?Q?eUsggo78wqkn6Q0jNf5k1sT0VhOrsExED6brl374?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918a1d67-d518-4a64-eb38-08dd70415091
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:46:38.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW1gM0bCeedtxNEX22kgVCIFZRr9DT1HZlHppaBRZk/2KFsT+ke2FeTSQE8snYZVoi88l+uNbWQlY3ISCKelrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

On Mon, Mar 31, 2025 at 10:19:12AM +0300, Andy Shevchenko wrote:
>On Mon, Mar 31, 2025 at 02:03:59PM +0800, Peng Fan wrote:
>> On Fri, Mar 28, 2025 at 03:33:11PM +0200, Andy Shevchenko wrote:
>> >On Fri, Mar 28, 2025 at 07:39:17PM +0800, Peng Fan (OSS) wrote:
>
>...
>
>> >>  The Documentation/devicetree/bindings/sound/ak5386.txt not specify
>> >>  polarity(this seems bug), so per code and datasheet, I think it
>> >>  should be active-high. I could add a quirk in gpiolib-of to force
>> >>  active-high or acitive-low if you think needed.
>> >
>> >I don't think we need a quirk as long as the default is the same,
>> >I mean if the DTS is written without setting polarity, would it be
>> >active-high or active-low?
>> 
>> Per current gpio driver, of_gpio_n_cells should at least be 2,
>> Not find any driver using 1 in current linux tree.
>
>Yes...
>
>> Without polarity, I think of_xlate will not work as expected.
>
>...and yes, but how is it related to my comment? The default should be sane
>to make it work, since there is no in-kernel user with wrong polarity there
>is nothing to fix.

I see, nothing to fix. Thanks for help reviewing.

Thanks,
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
>

