Return-Path: <linux-gpio+bounces-12792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3B9C3567
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 01:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0EAF1F20EFE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 00:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1DAD23;
	Mon, 11 Nov 2024 00:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pokUsHUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9733C3C;
	Mon, 11 Nov 2024 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731285928; cv=fail; b=kzyvEAnHxl9aB1WCm9CPQv29WZ5p7EfUJk0oWjTTYHsbexFKjSLuFIuXKhSU2ar3kWvuHLDaemafjjL0pjlPjdXaT3V/9XtmYgnbR6mzvFTFxFa+fFVPgI3WqeqOvDmyQEe5fhU/XiBZ6rgjPj1J+gRAXcz05F4vF4MzJ/mjyeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731285928; c=relaxed/simple;
	bh=cytEW5X7p8suQdQsaLELUd2Vsq5gVa4v6BbGP3stHX8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R+q7IewADn67xVU1AjLbUqrw0cTzynQo/Okjdc2HmehZzBXTHeeJMQdOF3hkKX8VgMecDqBLXc3Cl21QSzhO6ZIPIYMPMhpAfR+ojHTo+HA+p0wkb/cf33b4Gh1x2bm70OomWJDPzXNcYtFvufGWdSoXb6evQhzcyBFXLrUQpbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pokUsHUz; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayL5SM1Q7/dmDuKdyi3i0cQHQySj2juAxB+3hc4RxGhjVctUbAdp5dugARVE5BjCrInI74nRU+bdkP6WUQn7pqJvxlcSE6Menzoa0e4ltGLk7wQ9BuJFqrNxazj1yG1b0nPiwQbipwkMyw3gEC48YmuF9AdqFwSBlEjewgAiyZaO2F/Ksw0dXRV92DHCx1dmi4hzdTQkpuw2M20eNpYJr0Os2NGmXCNv/jBPxCk+uQZGp6WCGj312j2T0623zX3MGrxLdHiMMOVsRbJydTEhEmm7Ob6rrMFdQ6d4rtVxeBXnS4lMhxVhJh/mNS6M/fXDR5fKpI7zQ25AC1MSL/TG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iR7sY77vQXFybYrv14UQDzA0jJ1/lzVWtYd5ZuB5AE=;
 b=YYpEosCd7YaRLDDczAYUn8lpJXnEDbO4mwmkumLKthb4CheI5YxN26BmwUBFeKiKeaA+xC8kzBw89eZjeBxf99DfIKgmzT5LsatWdg7wrOcqdpVy1jDyitBegUC4XTf1ryKE4BXVheY4/Yi60GBLw3bsSyfISDEb+WiqL8pqNEbc7m5ONKokf9E0W9BItHJUgoQB9FV0gePTrlwi4k1I9M54OBGyNlSiP3DndheIBKAw0uFhK+E4/Acoqg1WHLhL+6zd3HWes6LQUg/KgwCAA1FmqKHlO5FdRWZ66CW5Hgq7qS+OjWb7hj915LEHMVwas4jSNP/p6wfJZeUvizDTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iR7sY77vQXFybYrv14UQDzA0jJ1/lzVWtYd5ZuB5AE=;
 b=pokUsHUzIPR2bglkD2rjlgE5xPtAxtww85NXuW/cOVXoqjW9XfQDaxm7ccnjPH2JLCreyMQ5AJHIdqry5k1LFfHAzWN69SgvftxLijncT9c5A+GNGaiCzSUmG9e1oMm89WrJI4+jPFVaAU/uFW9G9ru+Qnp17S5BTTa2ujU+NIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB13148.jpnprd01.prod.outlook.com
 (2603:1096:604:30f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 00:45:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 00:45:20 +0000
Message-ID: <87ldxqmwdc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA transactions
In-Reply-To: <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
	<20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Nov 2024 00:45:20 +0000
X-ClientProxiedBy: TYCP301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 397bb311-0d97-4bd3-3d38-08dd01ea1e94
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6a7IGhtZ6naqXP076TUfeNvF48jHOLO9Lh1xEZjG7tHWtu+UTwopC1/m8Ve0?=
 =?us-ascii?Q?b7+z1OssbGy3cQUPrq1V7PeeIPSccTTgR96GU5wPKYU61Z8t5GQIz8YQNlb/?=
 =?us-ascii?Q?OuEW3Hf0YeZwGjlgR9ZIf9ERuCnsXWB3z2DZ8+P8UmKKfdvAv3ou+Cjmn6n+?=
 =?us-ascii?Q?7gPuglXryvuUuY6ERlmauV3DlvxWvju84YoShb7kbKVgNqXkzo2vcYqIP2sp?=
 =?us-ascii?Q?1JxHz/lhSJTP4zvxut5jInqyM09AlDhUMqDhtMLS+wxbE6TLjiVJVk9Q6Xfu?=
 =?us-ascii?Q?aQ2NHJGyQlwX+nJdNrQKkaIDoiyFKrOGT+lsoqOpVIdckFyD1MPZIGebe/Kv?=
 =?us-ascii?Q?qE8S9qUQ5HmCdQx5cP/cSmpH9Nl/EZwAwU1qgHNtgOT39lbyKlqj0tc/vxQl?=
 =?us-ascii?Q?52eceOPn3oRuzU5+q3l/V39rWwTV+9T5a4ck1n1JMRh17VGY0KIAhwcJMrYA?=
 =?us-ascii?Q?BdDDwMIc8hwiAG547ytMsCCn4v58RFtf3AO7JvE84/lWh75znKrgQi5EPa7j?=
 =?us-ascii?Q?z4rDj7RnQWUoOHTqV47ziEVZHjzNgjNjIoYio756AHTgTT5O+KXNk5EfUNio?=
 =?us-ascii?Q?u0k+uH1gL/+NaupbNUTIWVK6UQ/+1pkY+hc5ndaboRQwSh92Q+PHv+t69FYp?=
 =?us-ascii?Q?e15t67P21HV10vmcvm30n8DWw1SJ7N1z8MZww4yFk4Sht1opR5O59L2pgDXd?=
 =?us-ascii?Q?wejsshbpOA/TRThbspDc9WYaWcpSeCtX0Oi1ngikRBwYrhUW/7JSM2LKfdPf?=
 =?us-ascii?Q?4u69O2qJohmnuTVx3gLjcXOVpx4Z/D7tr1x2bk60urqe9gTChiG3238TLnOS?=
 =?us-ascii?Q?r+Og1MbIyPex5Mi/hQB+2t/JzeRHKBHIghSVsW2nrJrGayMdlNTowidFgl9g?=
 =?us-ascii?Q?OHi5Fhk82XZk7/Yn77jT20pIFvGd6hrbPYdZs+se9540j1fujv9fygrpYI3d?=
 =?us-ascii?Q?26oWsAFE03FdLJsFlENsaob2y5lWJpXJJxdN/cTPVDFOtXa4f2Slwr47Qr8K?=
 =?us-ascii?Q?bkCJzi+pM+nqoHUC0ZLmq/oWeBF2j1ocDFl14ZbVe2/mDuPnMMhu1IA40S2i?=
 =?us-ascii?Q?miWSIg4t9ggXh73z38qQVYITyvNLGHjY1D+bogeqmw/uE8IYsLi/BZwflo0E?=
 =?us-ascii?Q?qEuwIKmQy+k1tMIi/vyjRF4XX5b2YwVt6k7sqonQLspx6FGorYp3K1Pl2seq?=
 =?us-ascii?Q?4YqI+b2XVDWyPUc/KtCeccnim6UOWaywZDGreQxYczyb09P/ZxC6zKExmXN4?=
 =?us-ascii?Q?pXUAaiQPVDeKm7prQtHo9ORuNbgwOzU4cugysoa8eUp/yDHBrkplugQs+SjH?=
 =?us-ascii?Q?TF3cC7CUDpybghTFGP4VdDq5AlZD+jJIyNDmdWcHaAFXVjM8mNljxh3ad01M?=
 =?us-ascii?Q?RJfB1JA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v9je/Ck3mxaXLWg12jpYW1hiZiGxEEP+LcG4hU4XPzQyIFUGicP4SDYa2UZE?=
 =?us-ascii?Q?a73ecW5wHV8iknEug2KOqigIQRmiiap8M8AS4c2j03jLJ4Xme6JTzBoUwz0l?=
 =?us-ascii?Q?Stvnoc7HBqpRDcUm5pHvXxO3mtpOaXJzdyKp6eo2Ee47qBqKg75gnRuU2nHI?=
 =?us-ascii?Q?ftduyJ4NGb/Rm1HmeJmf04qrkUrirIL0y8f85XKAIbbSMxTcxDjuYxwmk8+O?=
 =?us-ascii?Q?0lGisirt0VHxN/WDhSLqcumPixFydkXLe/mieAcSOc8Y2Ci2z4bRYEX9i9Af?=
 =?us-ascii?Q?E4N5ktdTBGQUmY/nTIHzKtTLDj/WNnMgcgOoYCJbbcEN2kskNls35+b1cAUo?=
 =?us-ascii?Q?+U+NhLVaYL5vISTQ1adhxJ0cw/1EuQkqFpn8FyERD7aLMd651zUlSxtD1rq4?=
 =?us-ascii?Q?CzgccdLG5pt/Idml/F2BtS83CN63Iz54KqWUMqgQIW2k6Gma1XFbCKpQhpZh?=
 =?us-ascii?Q?ARZW5VsI9LlM3AGM10BYo4xBCsvrC4qf8XW/bfQoy0gXYaRqTlWp9NNd90lg?=
 =?us-ascii?Q?0jZOSlbGLXzZPLUScuSVWftxpCuo0ACt10e3mYN9BGHXZQYkOQ/STkNQN1dK?=
 =?us-ascii?Q?vN9APDiiiJdoee1Y2VR3npOch+VcfDd517V3QMayWDyJBQcODZxz13VdH5XQ?=
 =?us-ascii?Q?uxy1K+TCkxFKVxxk2kssDPT3E91emRhkpbdzJ9RUDZrrZBs2B7IB3x6J0aUn?=
 =?us-ascii?Q?o1421Ec9vGGM5CdcSMJrrclh6GGdwLFLzEa9ymG8nR5Wi12CM/Fuk+9w/oIj?=
 =?us-ascii?Q?yeLY0E9kFL2jGxZV2l1Mn55Yz1QSm5/1Ue+mrJUxx9nh77Jvx8vPAVPyVMpy?=
 =?us-ascii?Q?kbzdz3GAAZkzGDXJNO5zCdytt/80ifWJnQ2matASPox0pR0qYOgTeIeJFdcC?=
 =?us-ascii?Q?d/D30BfNer4ZUJpvU3VEP/o4/5vf1PT5GuixvMGgdE10ZIr+bTVlNAvWOiA5?=
 =?us-ascii?Q?wpMt9tV0Cp6NGnSd816VH/qr6LbIiXpSz56gGaz5XClg2tpczo4Sf+z/j9bU?=
 =?us-ascii?Q?kfhen4DwftQ101e2riYUm6/LtB4ns9WnctxjTfuksjT4K11HbiI4XZ5ZIoeW?=
 =?us-ascii?Q?JHkq17EwLlauyP5cgTpJLkAbmSxhkkvqiU2viqi6UJSdUa7j8eQj397vJ6mg?=
 =?us-ascii?Q?4kOPhId4JJxDYShzYNjN6OuH3jemsjJHW7HfxSLVl24QuBtV8mMcksvlfCsz?=
 =?us-ascii?Q?w4B612KLKSsfvM3xASJZb2X2MXFDawhG6tMTBGk8Xa4QW6K5MBsmUBOW/y2X?=
 =?us-ascii?Q?QpJwPFdFn7vMIz1UaLJXjvbBBCVisth+5g6JnLrJLuaMijopN6AGpNDR9BQd?=
 =?us-ascii?Q?5xMZSDnOQBzy5+8bdZTIVnbVcpfx8AOmck7sSEFmv01CP0UqNlDFBwZu7FyU?=
 =?us-ascii?Q?5tfhX0+aagh56rwVAgmdhee1T5PXBC6LtgAaHmDOETK3DdCniS2TIQgj9nK7?=
 =?us-ascii?Q?p7anzaJUp9V3Bhb7odIfWNSbSmfNg57fG49InTjE2tSnGA2wj8AfxPDHcJjx?=
 =?us-ascii?Q?I15tNpBgeHl4Nzicee6SkAdebQIWNJrpljXLU/7FIATRi7xC0VUTAeTNMZDL?=
 =?us-ascii?Q?BogXQ8Uj5vbL9KOBnhMD4hp68Ij3abYITIegMjwozOQuld7CcborlfwN9unK?=
 =?us-ascii?Q?7tqpWCLSziBteCg3IUzA9j4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397bb311-0d97-4bd3-3d38-08dd01ea1e94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 00:45:20.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXphKXnu4KfVnJUMxFW0+kmZB+M1e9xEugwQRGo008KhQdW+1N6lM3P8CNqs03E/OGJ9ahwrh233Kk0G2DpHhRwZTXPkXV0VD8Zhr2zezfWmi/AjnelZZ0F6gcP/nCPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148


Hi Claudiu

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> In case of full duplex the 1st closed stream doesn't benefit from the
> dmaengine_terminate_async(). Call it after the companion stream is
> closed.
> 
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
(snip)
>  sound/soc/renesas/rz-ssi.c | 8 ++++++--

We are now using "renesas" dir, so, you want to use "ASoC: renesas:"
instead of "ASoC: sh:" in Subject ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto

