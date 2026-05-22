Return-Path: <linux-gpio+bounces-37376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKAxKM+bEGpuawYAu9opvQ
	(envelope-from <linux-gpio+bounces-37376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:09:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29E5B8D51
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 980723001D63
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 18:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E438936A37B;
	Fri, 22 May 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gZXfJXRJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038A368958;
	Fri, 22 May 2026 18:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473354; cv=fail; b=Gv0cQq+EQCgcjbCuva1CLPwqLe7x04TIn95j0SGfx/qmturBlmvsp7iUbtK1lW4vzNUtOMrhto+lc0frI9ah8/UGP9for5t6CmRtM9zC+5SPpinjUoHlWVkHx7mCHi2EKECUdXM0afBwIvTVULpVb4Qscoe0vRwqoivtVYvisfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473354; c=relaxed/simple;
	bh=g1LinEcvnNOGzJ33TgMXjgNzJIIyY02t+ZraxwtrKIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=knvIsJUP9hXGIIsPY2ZT5899/PDnXiXv3HBkOYDRlHypNzygNVk8G1sSq5QerOa4P6Uhh/E0x8es4S5C+ER8wAkqzjTrD+ZHpAypv0UjwpvigyKK4d1nqX5M6FfVGTGCkIv30Rb9lQxkSVIQ54CBn4mWlN02YvLc92qfYSHula8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gZXfJXRJ; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyzpuA34KZuevObd5/uWF2EK0uq8T7qxqxXJ7b4SO/XL+rVHPqmSLVMU7qdPuFJ3MZPMVO2nV8p1lxANMhoRZRbljIDmaH25m7ZvixSz+wHYq/c+W4mJ6XOMo397x4xC4bdUKqA5kpphiCTZcsqYKOqiDuIjWwcGSGOsqyP4659S7ADVN69NUX/M34pdC6qKYxzAsg3QPxvGm6VrWnL71Vw5EBI4hyZx+LkzMfH4RIXsCNxcJe0AEIo+nWDpmDW6EfZrDx1e9hoFdYNUXhUe3e2X02LFz0ZvPrB9H5aYXtVcJywA5GMV3FxJ9w93yldmXApLntrX6yakpH143bT61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UoqHGR4Pet3zSPCBcugehs3kVrNiC7dgogaMeOuTn0=;
 b=gqHAZHPTOPpiSGEdqyLekVi4D/Ia2lvvpQEmYffJRu6CNabREZMvDKGNbnzndmSU5IN2xwzGbv05sIUec1IpbN3RCQcmOlrbYdFitdOXMdqokkU8IG/TXDfSvm473emtn/8lUKtKCl0xLniiifiqUEljhsYHl61D8ZBKC8nFgPpOfIFbVIb6Mv4crRPsXKcW0CC50ddyk10vIkN1mLeHBmFZfF1XSW+seMYSBdmTcjmpqth7x7h20Dr6XWKYSJfdT68SqF8ivg86nsMMPtbsRbdXGyQMbz6IKzQr6X5vc6VMLUGpltxWq39bHX52U8KVK8ljQNMdMQ948JC8KVstrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UoqHGR4Pet3zSPCBcugehs3kVrNiC7dgogaMeOuTn0=;
 b=gZXfJXRJElZKFZGNRoPWg6/sV6IUiea5+AZnZpOEy/ZdvUfzyxeqvCd41ai8OHAYV1sXqU+iduqZ4djKwJCvjDte0DkWJGXVEjbofIX0dM7WoKw0b0MxhLTU5RH/wri+oR4bnjsuhXEUEOtWD/02e3K7hKIkxJGNR6cJNwLBfzoeUDNcNPmDpBy3Qf7GufM6AdKKj6lYrkCjDgmqq9pTdUmKjohN9NiGhO3J+6/98w6Tqrb/1qiw8zupa5aqw6+uxZCUatj1/si5SbMnd7t/lL/x4DSfsq6Otk78b/clRe3OiOphOQDpRS/s5mo8+Eim2wuYe6V7/PyWqbxGJ8pvQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11423.eurprd04.prod.outlook.com (2603:10a6:150:2a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:09:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:09:05 +0000
Date: Fri, 22 May 2026 14:09:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: mxc: use BIT() macro
Message-ID: <ahCbvGuFGLdoDKXa@lizhi-Precision-Tower-5810>
References: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
 <20260522070118.800671-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522070118.800671-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA0PR11CA0126.namprd11.prod.outlook.com
 (2603:10b6:806:131::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9505ea18-e991-4bde-41c3-08deb82d3645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|4143699003|11063799006|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LQvLTOUbCqp7UEofU8wkF5Ds8ItKI9kCCnPj30l75+5ELiSBenMS85tqpDQrghKdcowGwT4GGtXiQz1StWlvHtq1EKrdj47BTG4/rHywA+ZtmLPTpPYYy9yzGFAXrQXyX+hYsfg6XF052VFYeUU2PGtDPpRkqlEXee/spqP/egko667BugfDEpk9JpKnQmYbRSt2wnnoJ+ohaE1saGr+GBnvHz1Y8qy+YQqaKLQSr+HtBzdLUNSG6+yO+0Ad+tYoH0xoAIUaK7CuQDFMJJFKmRcymFzB+lXID7fmwDvDCtH+pkhYgX0d3I3dtSk4GxpNJ0Rcx0elJYnWrPWf3a+xhPZwzQyxuizYAh4JxHuebkeyRS/Mi1fhAKY4y/R+lgp+VXXUCPrgf0EdFMMqwZG02thG6flLa8iCUb13IDjcjoav6Kh5YM21mDRGaoWb/z2D33ZJ+/yoymsGnahoKLw/uAGq+kqcZUIltoV75BbXVVQe1Z+5QsfQ1mJfQwSU7V7kx0TIfRv8qMR2oPTt2RoCWXq7rUgVkBy8/JOzsnwNBB3+KlPRtlxisPIFtwyy3Xg9fk6yCFM7zgbQu9QwRiTu4PDiXWfsMUWOp24mF5Uei8f7fVjXYg0+sEzyoJW/4U/QaM+i4Fq71yJEQPdj63mHWQ9fJGxDljrXcgUJQmZasEsRRokQLVN2B2X8YqCFhX1M/emovFfnqmoFLMZsLezshXqGm496o0WmrWyIxHGUdkAKVOHOC8IEp5YXeL3vDw7Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hA0mqzJtFtnhj+CIgXPGTTATv7gRpXzq1Sy05M4Y/d1VFT5GhjwgA/dRhmK?=
 =?us-ascii?Q?Ek7RHPEEyyxAMzifQvscE/WJaRhrrOFLt+FTjhht7jZjk2r1kd7MXALCgklO?=
 =?us-ascii?Q?7UmHcjpQysVWDa5o0KtUDFYcucf0zd1ojoIer0+MrWKqDQZiRD6KtGVEZ/RH?=
 =?us-ascii?Q?NNQzWa0WJBrCdDuQIquM+zhGlWbH/Q7Qv7jwo3TLQo+WsacfHxd3cHh9FmmZ?=
 =?us-ascii?Q?xm7TBktMwdPmuaweMNfGOVlSbyfccIm0VbN/ZYaCCSm1BceGncwuGhYpSwT+?=
 =?us-ascii?Q?Pw9gq2PGiD3pB0w9O5m5DSKToIL8bI3CtlfyTTevEiSngBIl9BRG+ctS3V7r?=
 =?us-ascii?Q?ZNnRlRZ4+ZWB9Smv6Uw7UYPH9oqv0ASUgq2hqxumvUzG300qJbx76Q7y3mLM?=
 =?us-ascii?Q?6/TTc4DHIYbVBLDUHs9/GTZfxz173gwjurPD5Z86QGWqkyANFo5qrs3m8fj9?=
 =?us-ascii?Q?16IpgJM7ENcmbL6AbivqFz7lF8nFWlZKIXryLaL6+NSJrPiVGORS3jb3SsBr?=
 =?us-ascii?Q?OHWs3aaCSDAfH4J8hxq7qr16ZsWT988dQu2V2akDjBkyOb+dWkRjOo0adUAk?=
 =?us-ascii?Q?DOUXLTR8c0reSv8UQF4w6X2v0m7MLtg4T/NW6jwIXYjy1PHyAvJiOKvS35Os?=
 =?us-ascii?Q?mjTkySckxp5mfroPrLjlN/YIyX31E2IhyNKmTrzGeboQIdUjpH3IN8uEtUey?=
 =?us-ascii?Q?7otMDP12NUxziYvUT4I3ChS0qAtnn6qxi3A2OivA3hA8SOv482ZwS5jC30CD?=
 =?us-ascii?Q?/apKvUW9QDt5ALLkT+vpqC1bm8ZQl1sBWaI7woULT5vzyDAyG/sZMGnKxD/a?=
 =?us-ascii?Q?/q+QKcoI9lahMwI0SuMuH/cgegFeLOG3N/++sIB0Fztz8rhTSPCAeFXeT24u?=
 =?us-ascii?Q?65nUmvhYvMmWPhW2dHfE510jHjbgnHjruIFI0HmUzDFDAvSmlHSpUXb8DZqN?=
 =?us-ascii?Q?xbc8TaCe6gmAA5/qBNiLC9xijypx4oq8XPNl9lb+pDae7i1brGL5/O6RnQFs?=
 =?us-ascii?Q?Gtx0eVhyd46jc9ZFvhyxeLhBxsHMStIEejxcYmrTtcHwAVfukvvH0qxv2wHD?=
 =?us-ascii?Q?oNhN8tvVn6nrfuIciSH4lL2PYAbabMje1Cskcn0tCY488dP5PShpqAXQY9rp?=
 =?us-ascii?Q?bJ6XwXBxfHNo+YfpAavLBDjCvZ4Zj0T2dEYMVTe4DRZAnOWJJvWloGKBNbEh?=
 =?us-ascii?Q?0KE1221td3gcJEHTcaTnfAIFAdioRT9vf3SKdOW5mNyl9Jfr5HZbzRUV7hzY?=
 =?us-ascii?Q?1hH1AOE62lJ5KGN4MIa03MpCTVbQuUOqN4wpbrieTBcESVqr32SffsVwL3zk?=
 =?us-ascii?Q?PvrTdqTeFHlVhypw4QAvidMojWmzaH2I7OLxlL/cW3EMHwkwhzBgf/RCUb0Y?=
 =?us-ascii?Q?43VSqhC4B/OKox7qOiV9+0aXD+05+XMS9h0+7i7HUU0kLpq4OsEQmh+SRel6?=
 =?us-ascii?Q?9Jnfj5/9TvvMXu2mKA0Ttgfmz/O2hbS0lYtSJFx4MY7VOu+wowYDo8uoLCyu?=
 =?us-ascii?Q?vFNaFVtsSewRi2x0ie6MjJs1PtX9zFPg2ZyeE3TzaYJNF+YGdMDPm6cYgRud?=
 =?us-ascii?Q?4/hscJbzlumst3WH8g/ZaHMkjf9yB7D9T8nwU5JTj9IBJ3+soIER5c+W/jms?=
 =?us-ascii?Q?fsSSaCf83uygESPWKmsqGFTFLdSED4Uh6wc+v1uKIhkXTRBFg26uA4Rvzz6k?=
 =?us-ascii?Q?dKbN509MKXplaJIFIGzzzQiHMepUGx50JHgmTPgLVfMVb5bx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9505ea18-e991-4bde-41c3-08deb82d3645
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:09:05.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHOBwn2GR1jurOj9n9PRaGqLSIWg8kEkc0NT537hwEd5lWQe3TdL7rHTt1GY9Iy24STLxkWEOac47mDpJZ+STQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11423
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-37376-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim,tq-group.com:email]
X-Rspamd-Queue-Id: 3D29E5B8D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 09:01:16AM +0200, Alexander Stein wrote:
> Do not open-code the BIT() macro.

Nit: Replace the open-code with the BIT() macro.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpio/gpio-mxc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 12f11a6c96653..7e2690d92df6f 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -330,13 +330,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
>  			ret = enable_irq_wake(port->irq_high);
>  		else
>  			ret = enable_irq_wake(port->irq);
> -		port->wakeup_pads |= (1 << gpio_idx);
> +		port->wakeup_pads |= BIT(gpio_idx);
>  	} else {
>  		if (port->irq_high && (gpio_idx >= 16))
>  			ret = disable_irq_wake(port->irq_high);
>  		else
>  			ret = disable_irq_wake(port->irq);
> -		port->wakeup_pads &= ~(1 << gpio_idx);
> +		port->wakeup_pads &= ~BIT(gpio_idx);
>  	}
>
>  	return ret;
> --
> 2.43.0
>

