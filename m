Return-Path: <linux-gpio+bounces-22310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEDAEAA2A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 01:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CD94A6B12
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 23:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DD02236F8;
	Thu, 26 Jun 2025 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pbxg1Nc5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D118871F;
	Thu, 26 Jun 2025 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979174; cv=fail; b=TVRZDE262Scnphh3ZFTU4SUPzjCiOLafm93rFZVGUgg7XBe8Vfhxmpe7POhFaVg8RE3Qe2El7kAY0xPSOSRyiftdbjc3M7Yhgf4og/LeU6SsjtaIHmhkxjqZkxGmYuFsPTQvM8CW7oPJ6dK9soV0fIjqeHCk2XsFoL5elPGp/+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979174; c=relaxed/simple;
	bh=uARGc66XmY8MN11UnvPn6Gx1le4Z7aXsOsTE+H0IGjE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mA2jymvFMzM8YtsupVbOWfXnwXEssJRNud9a2CR1OmsiROYrtF+mggxBFwGlDpGRpCtCQ8I1ldu34+gWV9H7QVumRdDMmp1u4/InxForgP3dDNOQxii6pOSmeTo95r4btQbwkVoPhR1SReMQkl1rlsa6sLsLTIkukSaTPA46JFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pbxg1Nc5; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9+yeqiA8j97OhZadf+zKi9OS1NeBH+8aBbgfhljU6WEyyKAQCPtfhJsW3CmdFyw2aUGirXaevJ/kOpvqeuLfNjnJFpkb8pKxrcqYl3LDS6ZyR6QpoCoF5Y69HWTxoCo0ve3aDcVtkRpGUS4KL0foD6iWX0YZlxs1URs+jxoKF7+asHqTA4fkeq8DNHny8DuDozox8MnwXFcOYzZ5v4ou1UyfQrHcbBzSszln8uc4x9mGE67wwcOK5wRFxIQWRWELz0HMwImYfSW8BznlR6hdXu5QbJiHCZ+SjIFnEmH/fC7dEsp6hmhhlEJMPp/q+9e1Yov44cWDfijyiwANiUyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voHul8xpD1tP8uUIHwGg7y6jP2b1TGCCTzTtUT5xpb8=;
 b=abtub0/ef8beQYsqP3NefTVDyzGRe1yRkJcpRAhkZniABoHFDmXCOyFn6sETFvb4dRo8+qR2EYmMXFieWdKr9DkRn2qd+uO/4BmajTFtEkavaDc/3rjfXqa8tVy86O4F+XsH+cxoAXzhUBogJuok9klR+9IhMoS9c0ECkSZUgEvG2VSw9+6srZmdXGgBaZ96JIbPG67fG8RcRPi16m/QezrOopJ3o2RSO4fWyes6GBPPPXKM4F8PL2FQwSufxdCOxxaUQtvfj5JuOcchi/TzcRZ1B4L9abfXQCjFbI5tz2swlULHet6po47Ki08LGK9lCEcLUrnGX/20syPxEu/mMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voHul8xpD1tP8uUIHwGg7y6jP2b1TGCCTzTtUT5xpb8=;
 b=pbxg1Nc5aUMkj5XkJFaMLGOLVlI55B061tN7qGBxucMzTvDJcr8uzv83x+JJPn+ld4jmPGU9SYs02cZUBp/g4bYo3/CkO2Emphq+s8cITpvEGwjpMKgiLjh4DiW/g0Fo3Py4LmF3aoRdA6vvV2rYDc0O/aBtz1Q3J+DAy0k3lR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7697.jpnprd01.prod.outlook.com
 (2603:1096:604:1b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 23:06:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 23:06:03 +0000
Message-ID: <87ecv6gl2h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: renesas: tidyup Kconfig
In-Reply-To: <CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
	<875xgk4j9l.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWst5fhcUgWbTqzG_DQmuL8tWtUuCpg4BoeqhnCfo_MVw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 23:06:02 +0000
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: c7357ec0-160b-47e5-1e15-08ddb50605dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DrqF+XLaS/6KlQBoh0H3bQfQ0b1maDUQwif/w8T1EHa44zmgyocSSfl42WJ2?=
 =?us-ascii?Q?gf9ipEUvpRe53h4UbRvoCJNSNBMvdH0h2TyJEoj5HFm2fakSZMqI8kjxtvJ7?=
 =?us-ascii?Q?JWkMuATqCbkdHOFsNts/eUZPsXEt2+yRWb1Y4ij42EElZadXTej9Gq3VaDk4?=
 =?us-ascii?Q?COVw1Oh2KmjdNhzpTHPz+Dl8ZFD4vVBF6swOei2buDMaZNj3B5v1XTNeSFte?=
 =?us-ascii?Q?rpK6bsIvHrWahUYQsLrP+IJms3+krEsGDq17Q8sOXPw5rZS3PX8oLZy2SIFs?=
 =?us-ascii?Q?FgRcMHxS6VvU331BfGCTi+8l7LMQYc+bz9N07a8YDQPdUDRPBZoFBwNU+Zvj?=
 =?us-ascii?Q?Khg+waJ2CDnGCYyI1bJIIbZGS+thIkKpb+EX5rg0BsrE6Azm6NFM2HkyoxU5?=
 =?us-ascii?Q?47OILhszdvGEaLwKTgCoohGTIqhgH/8Kb4vxylpyOPCxsYmQV+Iah5A+VdaZ?=
 =?us-ascii?Q?HHswNza/9Qy/4MB43bZ8Ckn4I5GUK9v6wfiRpXZ+/XQ/MSStlA/ihtBzfIcz?=
 =?us-ascii?Q?9+1htwbuZA/eoWmEdjwiJ8k+pSWo2lGVQ3IFF08/05jQeEdjwOuzbxKXRXOG?=
 =?us-ascii?Q?q4YxtTko8rBvt6w3mEOj8UGqdgBC747KrJmdQEhEnDqAZY3Uv22yoQUNOce7?=
 =?us-ascii?Q?5h0O7UorQ9ACdR/C3J7vcMZbCQYSHbgBc04aqtQ5nrpwhFo8D5Tb2ZJCqPhN?=
 =?us-ascii?Q?r3x5MiN2Y8gs4K1RkxcB1l3hCEXXH8fAAzZTdy/KYvXDHkCn00ZW9o5B4QV6?=
 =?us-ascii?Q?/krAogSwgE/Veb3ZvcEDvTY1IrGK2Xd3MIInxj3f/K2Q8TmjyBi3YqnNRT4z?=
 =?us-ascii?Q?7F8GYcoFcgStRHwPlKsGyvfmDAfZpeNTJ3FZ1bIaQalud/HbDRdRoU/VgBvq?=
 =?us-ascii?Q?g7ozLRn+3KLKRnjGVY1BhTuZcgLb9eAST/vlWLKyfb5MuAGO4KEDNhF8poQ2?=
 =?us-ascii?Q?ngqK6ksTza19kojBxykOtMvslS3nLRat0q+Pdo9HAriFXLNK+LAw3uta4GsX?=
 =?us-ascii?Q?sYsyu4JlC0C/rHko90iuWnIFSxazM/rFmJNCAgaGRyEaD9BzMMFtangqzLpp?=
 =?us-ascii?Q?SO6G2Fvwjtt4zHKsO78DvoCAEV9/WP7ftZb5GuCTlrjaY52NiLFL1hCcA8az?=
 =?us-ascii?Q?rEyk6580L59YGt1O5IVVRpZi9NOwJXrNfsDcLX2/OdlbhBo1uVzDBvxugp7S?=
 =?us-ascii?Q?52xytRqJGTZNqQBXDOH7XD6Fn+GuBy1bG0HJWu9UKbUlYQZB4XdyGjoEgNQe?=
 =?us-ascii?Q?+Ye82Hh3qd9NS5AwldMXQSRNN1Y/L8suwp40mYkDT3A1rqxAOt7VAqziPb2K?=
 =?us-ascii?Q?WutDPbHgZ66J/X0WMA3sH4PK1rLolahS6zeSSeLInLU9YJfAtf/RghFLk9v4?=
 =?us-ascii?Q?hNErcCRqVDboHciy9PTbfBx1e/O0xTg9CEO+YKQNvXU0BRLSnl+gSc4Y3hGU?=
 =?us-ascii?Q?ONxYhJlab+3YHn8K08wzhBMsHyRA0Vkm0cVB9agVDGhWg5d5e58p+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?11mJOsMmL1yXDu0duVRcaSozOzztJgsig7dcemcjU5+9ziJcsnDRa224jp9o?=
 =?us-ascii?Q?Ar+5phr66AUIWU2SiVuo037G8MEXyvBNj6Zyhgh2HGn/YmE0U8ZCMiXhJG9U?=
 =?us-ascii?Q?SwKgLvG/lE4eU6qmKFfJTdUSvSV4sE506FohGcR2w2Z+5SgVlq2yP5nfKnUD?=
 =?us-ascii?Q?OeUJCPU5mtiFsEk1RaffIHiA2xXQlv/pl7G/8GSvNl15mfXisC8H9zvoBodT?=
 =?us-ascii?Q?Aou3GgOh3HXxmna43sDmIVetBa2Et8pQp5V/+a1n14YbUoQqANOseTqGpOBt?=
 =?us-ascii?Q?C230eXsGKtvh/PBB8cHTKdNNupZM57Vq60gS561u8ZMLExv69wcVE64FGJPX?=
 =?us-ascii?Q?eBxwN0UpgOjVtYC1Eu/4zgGJFQsswTnQ1fpTKJsBFoPEvwYq20/7+IICXwnW?=
 =?us-ascii?Q?98dtjl5FK7OmohWoKDzvydP5aOCHoHmnM1I7MgqH4dELrgsYWtgF+hhaDpiZ?=
 =?us-ascii?Q?VaV/cvyos3vLNOq87N4PieWtcYE3B9dtMOeSIqEIxWO6jD3m0TBiw0fAW78F?=
 =?us-ascii?Q?W1Aav80SyINVgyanv2S1Ew970bYM81SNANJx2oz6sW6Lb6Z2wO8nOh83gIQV?=
 =?us-ascii?Q?C8y9XhdojYNgAlKGiB9xWyZWI9fEl9Pz2M2D0RybiwEoKHDTuVIWFJzodXmV?=
 =?us-ascii?Q?eFWpH5aUuRtXUMjMAijcGFjQK3ISFbp9+wS1xxTkJEGeRVn6uxI4w9o8zA+3?=
 =?us-ascii?Q?WfOdvdIyHwvVnxZRCbMqqg5ONFyyQXu3OV/uPRK/8npQ3kUs/qfrMnf25YZY?=
 =?us-ascii?Q?o7v0Md2wQpR7MgQnVSp/W0SLH/tAP/LUxuwXb35N0fEQ2AocuzYeYYD6EY/5?=
 =?us-ascii?Q?kYG9ZAyoiyhxHxZ0B1IbNvmvUsv6tj+wBBIxM1yFYtkLaB/E8dFbd0cihMH1?=
 =?us-ascii?Q?C3xaf8wBrHRpeKQe3WNpz8Izpqo/kRf9P+zJycaC+T+uGH1ezJSmiH7yBTqW?=
 =?us-ascii?Q?ctVi1EF1CE7aQGH9L9+JsSmwSisRUMUzmyIq4FIl7yVU5wJ9JpKA2wKvcvPf?=
 =?us-ascii?Q?TOs7y+/xQdL3+PhS5kL9Q2OvgLFwdnUB7hfqC2EofI8dnbASrvb4xc2aS37P?=
 =?us-ascii?Q?dUWS/3WOknjTPdAE9XgVPDJNT9wsBRliafgB87FAZ7+TqB9bizBSzlBqx5RW?=
 =?us-ascii?Q?JEf3x5KWQtwZoggMyrTmQiIWNHppHomrLCD2I6RRv2NwQMHl5Ic0DHXFcrOU?=
 =?us-ascii?Q?sbomfNdBZgjYyNjyMW8cZrmt6/WIdiNXsrVzVD823v3x25ypRfKOU+e8FeNd?=
 =?us-ascii?Q?sCieBCto/bcI799PyvWDh98YaJFIyOrdPSKCFz0Cqxkp/RoRm9o5lkFNxFjM?=
 =?us-ascii?Q?xMS1NnMlUfBcr/46GqnMr+keeQKYtVeDTqxt3h+ILa8x9h25BoB+Y7Uz+kbE?=
 =?us-ascii?Q?4KIWnTs7ZUlYEMEyBlnH4aRBA1xsAIXfYK3lIjrzNvud6hp9GpUQHIClSK2V?=
 =?us-ascii?Q?QEqJ8PiN6gaaJE95qJcSMBwouoNexC/QdZBR38UVAUe3ZpzrgBk0HxczPAxW?=
 =?us-ascii?Q?QBo06tsZkoNjpaPtHFpgP8Sf0OkQpt7C28lAzCAlQ6Jha2/Dho2KODOC5Jyn?=
 =?us-ascii?Q?tq/8Dlg1DQ+EJbMu94u8us5ikdQWCnpraM3mtYfPnxVy2d++E+SzzKbwUvcm?=
 =?us-ascii?Q?qdr5QogH/c7GGgjkGa0Lqpc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7357ec0-160b-47e5-1e15-08ddb50605dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 23:06:03.0631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BYUX9EQFLVKc64WLTlAvZMttwuX041R3v3UK01m4xxFWYL3g0KIBuZJZeMAjP84C5/fBdY0Iry7aApTXMshAmF/vo3nM40IxYHOFIsGVUkjIjXtnfqSl6ar48eDr3bj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7697


Hi Geert

> > Ah... this is menu alphabetical order, instead of SYMBOL...
> 
> Courtesy of your commit d89a08f52b0dd30d ("pinctrl: sh-pfc: Tidy up
> driver description title") in v5.10...
(snip)
> Actually I prefer the sorting by Kconfig symbol/part number, and
> somewhat regret applying the aforementioned commit.

Yeah, actually, I agree...

One excuse from my side is that, from "menuconfig user" side point of view,
"description alphabetical order" is easy to find driver, because it
indicates "SoC Name" instead of "SoC Serial Number".

But from "developer point of view", indeed SYMBOL number order is better,
but it makes "menuconfig user" confuse, because description doesn't indicate
SoC Serial Number.

> I am happy to take this series!

This patch ([1/2]) sorts it by "SYMBOL number" (= developer happy), and also
indicate "SoC Chip Name" (= user happy) ([2/2]).

> Then we're just left with fixing drivers/pmdomain/renesas/Kconfig
> and drivers/soc/renesas/Kconfig ;-)

I'm happy to help it if you want to me.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

