Return-Path: <linux-gpio+bounces-8218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC879320BE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 08:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC491C218F3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 06:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4951CD32;
	Tue, 16 Jul 2024 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="h1g8+XKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2081.outbound.protection.outlook.com [40.92.18.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488581CA8A;
	Tue, 16 Jul 2024 06:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721112669; cv=fail; b=D0UmbWPcJJR8K5hoOAroA5/Pw9Jxi1Fk5DH3H/EighqcgTI2hfY2ql0SyWn9GgkiyrZev1+sSvO0oZI/sxQMNQRASGv0UpW0vmKNa8EyJCwf4DI5v3K0xxeTfgyw+fOfeHFF1AJiITQvdL27cDcqfBuuYw8uPYuc1AkMu6S7VOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721112669; c=relaxed/simple;
	bh=ivL0CHyGLGAf2qjWNVb6hq3JwdDgmvKVEpuf+gEjwLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=obnhXUoz1whB2+EpUyndcXzECYS10cCIpq9PPCV0Kp33JwSfKu8gj7V6Hr9MU9lIa2Jw8KByZ8ahZnVj42VIZ5Z0PS5qSZjUbNm799idLjVaV7lucKdMkaGjWKxZnQkmhMhfOY0JUo4RqcmrGJC64j0DjMaAlJVD4EclardouE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=h1g8+XKp; arc=fail smtp.client-ip=40.92.18.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACt60F659367iHgJblrQXWQ3WitOT3JHp7hzzJ+RAJzSi1E91ZhSARQy7WO6Llh0bWIysZRtK49R9iMH1EVTxRimd+r/IQF/ip/4GvX5kECofwVKXqzbMHFp6BnJAdjUiWLJXkfmWYpRuqJXaCKFUxF3v5q2lE5HOzFtN/FN3+a5Ylpc6aJnn/0ip3OhoLi/FV4lY32qeXKq73mZGave+MQwNKb08vMd0fivH+eE5o5Lk/8KTOgVrjc7prINurSAp2xX1PDCtqN9wh5rG0mgMjFwqcemHs9pQsXYzI0CSqy69tyxTUBqoRi4Rp1NmhZsAFQA6JPg7mOoBn7zyCf/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9kQkyQUCaath7qw3OQxkNNIOMEbs1k4BzX+4wZeDW4=;
 b=e8e5OZK7kV+uAB1+GPsFNObLB+6RMWCZqE4xXUSflV+XnJ597WeP1hyEYisG0L73InzW7tQE6tO80idggg3y8TgdbmvBMsJQXaKxxnPJtVWqTlGSjtu9/BhyRM6DOpB9Ki+6kxW7iA2y6Sg0Fu4qlQpBFsvDhfmjh3b5XFXp/gQ+TzOltiY7w40vN4OrFDqrYK3VFyM5GHRMvFTxiPN1eouKn0UnUYtm4z5APkDUdAcDx7pKdhLwt1V+NX3kBH8bLlY3p7p7OwqIyKKfnJLiArZJRVa71sAreaAyPLbKz09vc/1TkJmJFX4BZe8vPEjC00ilOx6BUoegSZR7nUoqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9kQkyQUCaath7qw3OQxkNNIOMEbs1k4BzX+4wZeDW4=;
 b=h1g8+XKpXdZ6Oavngqmv/2ldrEdt3Xx0PMG0zuI7XW+GO9q1gIBXNgZqpkUZjrpLcCRwdY6c11ES8i6j7b9oGFTcRofb1WxcKH0DDt4dMP/CpMIkrkQ5VG8zw6EXt0hAknMOlHaGd4gk/3/eH2cf5Njh4pQn4ucosDNFHsqOAY6tkonV594yZek6ZTuzB1zAwbuYkfze1A+iGZyMa3tAoZ6eSG/Yjz9n7MCC2xNTsSmEUc8UOOxP63oaIrJMnLNHgrC+ipVSTsB8JZDzaEAchQZNed4NPuyASj61p7aJxqEBYmfyRRXmV0G6w0dwKfx9L5bOYxmfaOBFdVVrXfDelw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4964.namprd20.prod.outlook.com (2603:10b6:510:1f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 06:51:04 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 06:51:04 +0000
Date: Tue, 16 Jul 2024 14:50:54 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
Message-ID:
 <IA1PR20MB495307B0AA8CD7E6D48DEF0FBBA22@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
 <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240715-strainer-creamlike-b1ff49b25c1f@spud>
 <IA1PR20MB4953747880CD84FCB5453608BBA22@IA1PR20MB4953.namprd20.prod.outlook.com>
 <ac3473c4-633f-41c4-b604-cc027eb7e016@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac3473c4-633f-41c4-b604-cc027eb7e016@kernel.org>
X-TMN: [aFArs7zNxd4wmFS5Vdt5JJU2fQeggsdBgkugd++oOlI=]
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <um3d7i765h3qcfmhg7nu4frs3tvuxeemwgqyv7iyrfszjhuzpq@7ypoe4f7gjzh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: beec42cb-7129-4e7f-558c-08dca563a993
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	qdZvtThqhLEZq4wayOD9bkGswRKP75XO7t/+VkzMHFD4bAPC94cEdgHlA95zvkCEC1x+0vFbapZ969GZlQDnSBcVN6FTJf01RDX3wO7WOyVbtW79WTXeW8vjTU4Y3eXhatRlWmYc2XlDdaa/GGqlKQMgK3XlTaQtZdacNOFHP63aaxXCEsR4KCvFPzZtc860BgeZjs2BGVTOqikcNPL/HmkOU/FDdhGcYjPpSEzJ0zYhGIxBEC86357TtVCEqji2skWfR3DpHwRKaf63v5hvrajJVqsDyCSjDobr+uFt6Z/pUjCGOmJMWtU23krJbOw7C6BIZfp7H+gdrSQc9vROTgjzy1hwMP0+qtJH/IZSF0SsxqMyYINuxINF1+7/W915f/IfuAg5gCucgp62GYixnuFNbz/26IMjNKwM/ix13J+FoDM1vJQiOdBK62c2bzEhlG4WtJfk8dz9hQAUCAS4c+ERjKfnk+7173ZQ8InUtX9KX8ElD7MOJnY/CSikE3cjA5BEGjZKDZkCbq/L2J2LBbo/yeRNjxsL5MPZfuC7NTtHnESKQ4mLTmLKVj+v4Rz0fWmqQzkIoHge7Qd/5EFU3TF2SfJwnCf3ec1XkWh6ruEPuOj85oE8wF2V1f6c+xJaeirr5g/ZuasEHvaaCwCOfOrsdvrV+TzIebLgC5recRWB/xXV/s57bsxurq/r0qJg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hc1HQFD7FKVXEL0YQvjvWW1bN58CEZTdKWFmyIs1i12WB9Hh+Q7+yyZKrRN?=
 =?us-ascii?Q?/liG8PzuXzWyEvVSHYIBNeN+W1hS2TdDd8XXg9YnpS58d4bp2aEt9rPHhbDJ?=
 =?us-ascii?Q?Ee5qbjGuxV7PKCfBmiFlLFN3jH4O3hmPz2ur9Pn8V2S/igyrAw28TEDQ6bi6?=
 =?us-ascii?Q?SkmC5xfhBGA+bi5+ANePvZjxW8D2kpD01UcodyRFH/45I9EP98dshZF+u/RZ?=
 =?us-ascii?Q?OGKRNUhM7icMawDKoZzhiA1JeqJQytci/lDy6bCmRSEyb0qLBo1n3JILGbIg?=
 =?us-ascii?Q?S++1UAeM1Uz0NIyUvLBZ58MGwMIJHeHY5gNtveUVOloYhVS0FfzjTpqItSEC?=
 =?us-ascii?Q?rKvzkHPXbgielOaLxyNEf/xjFeYE1TXjjZWnfH6j2jm6GDlVjbH/lFqHrqw4?=
 =?us-ascii?Q?FVPcufQbIZttJ1BMEZz3n8RhHIjFs6JpXau3KxPFZf890c4RIZV15Zhd33Pm?=
 =?us-ascii?Q?O4I9aGwytE3BiFPPyigPL7ITJF7b5gPCDhvgB29AYDVkutkjmvXPLb3tIVdM?=
 =?us-ascii?Q?d347ExZuEyGq4UQ4eTr9tGKzeFc0Lw55JaL2VvHATRLiVXOenId/erbWHZGF?=
 =?us-ascii?Q?Hq2uxftB2Bf9zf8qbG+if/R+dMqwbl7J44g7O6XkGpEF/ytok+XgnbVXWSlV?=
 =?us-ascii?Q?ziCFpmpqwrf4EgboScMr6UDsQmT278cWEYvx1tU1UdHpv0BzumfX6GUZW2oN?=
 =?us-ascii?Q?F6ewiOF5Z1VDI1CXoft7zAFKMLXjfJnvjots1FAlTGJ6k6NDcpuiffS7E9yX?=
 =?us-ascii?Q?/kIbPv3fu2b2Lv22Hab9oyJrxcIUd0VbWHs30p6nkuq6O6sbZ7/QX2HHiqfa?=
 =?us-ascii?Q?Hjh7kuzPDtSPajo5S1ALq1Yasf9gVExsemzGLqr3vufxMY/8MpgWrs2y9Iso?=
 =?us-ascii?Q?vQhnGzy+yPqahFcIfW/17ed073wURsxHAcC/TBzymuSJ6s8WrNjqa0d7VLsY?=
 =?us-ascii?Q?xow2c9N3HmFDTfwnm1muS32BlvqWvqWBUGmCrmiHh4BRduUGgG33EcK90z3K?=
 =?us-ascii?Q?Arx2gr5noUZ8vZGM02lhZnA4Q78gQNB20GGPtvj9Xt3IgiG2h1ToYbnvSEbK?=
 =?us-ascii?Q?1AQjL6Gol/nBs18EG/RHMAjm5K9L8aHQiNY2oWtG99IyB0xJyOvWD0t/WDfr?=
 =?us-ascii?Q?hGhfY5jS6vxM92wmGhPoKW8I0Z/TZM2fhVL8kuw3XlE9h9p0V+6vtMK+CWyZ?=
 =?us-ascii?Q?LK3SIKOmOfFH+Vx8RxHK2C5qpPusTF6Kz6Ou93eejV31e8lt1FHZXN9fDZo4?=
 =?us-ascii?Q?EQ0e3cW+1kDyEtdpbjH+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beec42cb-7129-4e7f-558c-08dca563a993
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 06:51:04.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4964

On Tue, Jul 16, 2024 at 08:16:59AM GMT, Krzysztof Kozlowski wrote:
> On 16/07/2024 04:16, Inochi Amaoto wrote:
> > On Mon, Jul 15, 2024 at 05:19:41PM GMT, Conor Dooley wrote:
> >> On Mon, Jul 15, 2024 at 05:55:28PM +0800, Inochi Amaoto wrote:
> >>> On Mon, Jul 15, 2024 at 11:21:25AM GMT, Krzysztof Kozlowski wrote:
> >>>> On 14/07/2024 13:28, Inochi Amaoto wrote:
> >>>>> On Sophgo CV18XX platform, threshold strength of schmitt trigger can
> >>>>> be configured. As this standard property is already supported by the
> >>>>> common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
> >>>>> so that other platforms requiring such feature can make use of this
> >>>>> property.
> >>>>>
> >>>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
> >>>>>  1 file changed, 4 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> >>>>> index d0af21a564b4..e838fcac7f2a 100644
> >>>>> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> >>>>> @@ -88,6 +88,10 @@ properties:
> >>>>>      description: disable input on pin (no effect on output, such as
> >>>>>        disabling an input buffer)
> >>>>>
> >>>>> +  input-schmitt:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +    description: threshold strength for schmitt-trigger
> >>>>
> >>>> Strength in which units? This should have proper property name suffix.
> >>>>
> >>>
> >>> I think it should be mV. Using voltage may leads to decimal.
> >>
> >> The standard suffix for voltage is "-microvolts", so no issues with
> >> decimals :) And with a standard suffix, the $ref can be dropped.
> > 
> > Yeah, I have seen the "-microvolts", but I does not think add standard
> > suffix is a good idea, as "input-schmitt" is a standard pinconf attribute.
> > 
> > The only thing confused me is that the description of PIN_CONFIG_INPUT_SCHMITT 
> > in include/linux/pinctrl/pinconf-generic.h says it just uses an custom
> 
> You cannot add binding based on argument "I don't want to change kernel
> code", so sorry, but it does not really matter whatever pinctrl has
> undocumented.
> 

Yes, that is true. Even if not considering the kernel code,
I think adding something generic like "input-schmit-xxx" is 
useful as input schmitt trigger has threshold strength. And
if we want to configure it, it should have a value.

As the original "input-schmitt" seems to be meaningless, I
will take Conor's advice and add "input-schmitt-micorvolts"
attribute to handle this.

Regards,
Inochi

