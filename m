Return-Path: <linux-gpio+bounces-37377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MxlAkOgEGpuawYAu9opvQ
	(envelope-from <linux-gpio+bounces-37377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:28:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FA5B906B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D224302205B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 18:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82F137206F;
	Fri, 22 May 2026 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BOtTErkX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BBF371D1E;
	Fri, 22 May 2026 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779474082; cv=fail; b=r7AD4/XYW1mb/iHpF7yfBgVMmznM9DIa5jxsT4lDi/Qz3QRY2DVGo9r0eWAn+kVbBEh+qycBBWzKZiBINhAJuVmTyPmBe2TrfyX6ceKwQqs+maSMpWxQLqGnTpi3lb0vzJVS+UPiDi4YarqPrdBRb6RxDYmtmabzk65e5ogem3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779474082; c=relaxed/simple;
	bh=ncijV+ytGpSSbCdPpf7hdyRbPQwDBtAAZJnPmNcd2Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q/oDTRnXUXH2/1h/R+UxCflhOnoxBgzd301UTguKllRIvXC/VWaDL8v1DRhqwhrw9JYVz306sAzP5OU5wnLXGSJT5B6fA2sNXH2Yx7n2ZB3lWCojHppDGrjRkP3WcjaDS/GuV20pQB9Fk/J3TcnHZWFE/M6cC8PnARVISNLHaxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BOtTErkX; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abt8yWESjlf3U6AmXAKtt8Yl+ICrUGZcwKZXN5A8x2dbo4hTGH9bdPRhzYKPGWXhHpYqXykAiQnlmibeV1D6FQG3/qDJwgjYy8UWHDcfQ5lGqa+pj8DVyrVIShplOtnFb336X5QfQi/QgrMlIrdTYrLnFyaTQr6is0AG+5hB9/60OFWVkoVVa0VSsicjuOlODdUQ/UhnYs+OAZHMSNJykAItIizA1yZ2Y4mfrAYSt4WkYA2iTmJQRFrug79TZbJFUsH61Fjmia8EooCTt3a3NelDWEEHvKRDgpeqxG4DTd7yQmSuf3vxRKofeBTpi55HGHbkE1L1lL3lC7fUOEMfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzVOTKhM0F+gfjJRqo5IKBO5G1hN2EWFPvj2zuTueVE=;
 b=PUoorZqNJKkLkiK0tOxwnXW+n1K7csWb3L/c8EwBRhiVN4lmhLGyYnFZo2Us2L+okEZmnwOowOZVzwDaeY+kmf6veeOqZgptayqmh/gmTC8RPczZyPBeXhbIbUoMpkSem+n8d8ceYOsTThaJ8IkK/E3P6/chom8vXsRcjAgEEm7tOoZT541IsdWycIPfdBiUB10WsFsyHtBHBohYMhHnndt4J/OGq+8Wu3KkA1elfHmh9m4J4BUz8B1XdhuKsJZyxrwPFU/KLbQEOj6puSMEf1hpXDuyfpiw0DW5iaPLTSrm7DqkAGwofXrAW47kVDh+LwR3pbPWe76+FrvmXVKeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzVOTKhM0F+gfjJRqo5IKBO5G1hN2EWFPvj2zuTueVE=;
 b=BOtTErkXjH4H1NCCX4aAv8MLcK2CvcRQAfp76tAeXnHq1gaHVyszkK5qextQ6QFO/MymdvhYnPgGQUHzyRv/PkHjuHT0WFqLvNnKUShNhvZZAyCz7i7LBl8WSI2ZIwwEmLLQvoUbSjmVp63mRtGXB+wlqWMqXfMxKYIwCknZ4jb9rAl4tLOdiCxzdeDIGsADr+7iR1/H/W3dGpkZUlWdlHW6eThMP6o9yYQXE+SJ7Lith5MdPTYkw21wAWXnC2aGIiVcoXnFNPOCfNIDLyWh/gHzkyB1FxgXfIpMEKMqYD+8xNW/LAuiLTqzM8LhlkRMMS9J2IKDEGJYLqVpv2yfKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11546.eurprd04.prod.outlook.com (2603:10a6:800:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:21:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:21:17 +0000
Date: Fri, 22 May 2026 14:21:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: mxc: fix irq_high handling
Message-ID: <ahCelrB6NWBy9Chc@lizhi-Precision-Tower-5810>
References: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA0PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:806:6f::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11546:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f1b10c-df23-47e4-a0eb-08deb82eea1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	yR+cEr0DH2XMOQF0YX/qpWdC6gizE3iCTapNaD/jAjS8HFwqQ9TNFOPsZr3Fcq9+gDdmDgqG+mpFNXvfK2UhaujdE2odweTKp9e5yKWoOFmhyNn3g0yk+KfKDiV9Fr9WgKVpD2U/nd/YeM3VL7zV2BxtkJqosBew8heRIT0IamnMXHpSTHkpgHCHcTfR/Ldeeku3zGNf0MM98gKerPdde24qrKIVV0VSCgSCK8vzG0VdUTLEXu+g9aa2Fy3DU5SSfBY+SJwz0uxmM8Fhb5DuIxZgpEUIE/EL0LtewD9u6LAceA+IoIsspwLqvK2sKae4M8JZbcQG7eMivufSWpTKMg8EA/S8zVS7aEkqISZI2e8bRaHQA7RRhretY7dRmdPZrj2p1RUQyDPASqttOrUzDSr5KBrMcNQN3G1nfA4jBUh+QWu6sgEzMy0h6hN/wJhC75vpSxQe7YfYZ2IC2kmfIbUZ8xwBrO1cTX4cvbhR3Cnc+mch+1kOF+eXxaqEja5/YlM0S3ldYOWs+/yBt2eXV6yX774n3DC09djkZawNb1wRlXyJD59xwr6C24Sc5TpDgNzL08ursWylb3WDa+SkANrQSTrsOJBsxjtZrkaZQjMdRTvCH39RuDeJIKAwRfGanGqBFXoxMSNgPLSS/Kq7eJSJMs4lkGKIiN1s19uqzSQ3u0AuQHsPR1AwNuhCghMitgCZnd4PfiWNwNonouuSQ0XeAvqW3AZJyNgNQ+maiJieh6+Ylap0x8yn0C6gl0RX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nANqjGMRIqmvF8JiprvF2EaO4RRpXyb2rTBq4x8SeJ3fQuofbDdCfEEegjc9?=
 =?us-ascii?Q?Dwfq8EL8N8dqCkf/XFjUgqA594o7R2CXkWNiB9vlkZQE9z94+2BQ6TyZ9M92?=
 =?us-ascii?Q?1cN1B9cASrcee10XRZ3sxVoXP6xqo7aDTcXZjG01MwvXMNzQ8H2CToo64JgC?=
 =?us-ascii?Q?CE5Ugo9PaXkkPxvOmtsBbpQVQqK+NJHmWo2if2zI+qaOPGCCBEniak2Ji6fw?=
 =?us-ascii?Q?AguXNW9jikHQ7bcenDMdP0E07Oluro9e6vWPknw8NA2CWSS1pJRNoCV/UPgd?=
 =?us-ascii?Q?bB41qRyU9paBFq4q/1nca6mIh2hS3oqgTQs1b/0qCM39CyJsTYWH5HBgsDAt?=
 =?us-ascii?Q?FZd/Ft5px5L/iHjoKyQ9WkPCvg5jBgl+ISO8VOUGTPrOZnJ0YEPRuhGaKH0Z?=
 =?us-ascii?Q?QFXgguGKRLpCr21Mrbli19R5Kdf6I6gBoMO1NsgsQ5WFGijuK6lLme2KdtC/?=
 =?us-ascii?Q?1YX3pV+zkH8DqpIbnHnR5Y7ed31NQnDP08GybkrvQlM4/6NABQk4lpVVzlu4?=
 =?us-ascii?Q?KGfbGgc+RaItChk+ov0sOhANC0rIa0IbM8Iy7p4dM8cMc9zT3gLZzlZZ/fIN?=
 =?us-ascii?Q?gdCZZv1lw1PfgWQxZSRZJZUTmlWaussPl5UaBR/gV8QzdVr0M89OUA7odzYO?=
 =?us-ascii?Q?kfIzocYyj861RYXOVJg1vW8q0ZB2fKYjXPgz6Jux6NNrhLb17V98PpVAeYZ9?=
 =?us-ascii?Q?IbMjWN0hiayYjjPDi3fIrklhZ3F3QgV9Mit/zsVYBI1tuge64p1SB6ggRIVX?=
 =?us-ascii?Q?kJWuTeYOKHby0TwkvftR1XgPoTmq+xH/bHmQZlM7f0eC6zv7xkgOsMffvJNG?=
 =?us-ascii?Q?T/4j7y9BzyUxcJLQgBMFldo2m1I3ZkPAilEI1LeDUoydMgjnflX1OrOmN6ZF?=
 =?us-ascii?Q?RXdkp93vf7MAud/2jMrDOrQzQyBZc5RvkiWCG5djdE4sFG4QUkDAKRuWh7G8?=
 =?us-ascii?Q?mnIv69vWhHyd6VCIgJX+dk352uJmft6p5KR99SJWaGtqy2dLyCMmkttrHdBP?=
 =?us-ascii?Q?2MP3f1pO5PCcOJ1hQMRFQgXgh6HokB7cE1HmyVpVBIR4UiONuoSBGz6qyI0U?=
 =?us-ascii?Q?xI1+hZ0Nw7+vbDzjgyFqqfNlf+B01UtGmQkfY4B+pbJrNByp0Pb48xpqZZ1T?=
 =?us-ascii?Q?xkYtPLLENjPgYXSn3wjE01fZ2If4cV9j0DYfY3FYiwMYKbyd20QbYOWrlzKd?=
 =?us-ascii?Q?obKrF/Y1FVCoygsPy1oNRb5URbBUJifypfzCNvYj3Xrn7o/kafhr2qBm8MuU?=
 =?us-ascii?Q?M8U6nXir/5VDIBAn9NAmsi+gCmBTM9fRvsmAUeplfV7UEO4x0yR3M5lm4Mvn?=
 =?us-ascii?Q?eDQXvVLn9A6c041ovStabID32O2n5Dg52ClK79X5XZIC8gPVps3rsiPq1q6L?=
 =?us-ascii?Q?zhNef9T586V2p+IetAFTLEUkYXYJCLzlb5oSMLn84f8ZupfODh8CdT7jjRwQ?=
 =?us-ascii?Q?uMQKdJli+v9aHG8maY9pQUH+D/IyzL61Ct5GqE+qhTHxFrPQZ+zllr+2M3co?=
 =?us-ascii?Q?xxaW5sw/AIgL9gNjqOnybu0l7lOIjhZ66fneKw6eVjQGvCdE8rdjbT/cjV28?=
 =?us-ascii?Q?8gs5cQCy6u3O89oXuCj+FSGKiRTv0ZQEq1tgQNoNEscUrxA/M4zI9xGTnlP9?=
 =?us-ascii?Q?33vQ4THnGWl6qd6jkNrQezeEfVE4TXa5nm1FTGxGA7zJxca22qFvd3dxT6aJ?=
 =?us-ascii?Q?SnJwV0b3ib/PcNat3sJKbTlwRgPvN4PSnz8Z8z+P0uYjPJi3aDZUVcisPPcQ?=
 =?us-ascii?Q?linRnCUe4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f1b10c-df23-47e4-a0eb-08deb82eea1b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:21:17.1312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLrbDZPohuoLteDN0n+Bse62e6GlMLOBWvRBPmOuLzRN2B+6Bld3eURs9Ekfr/sjOL/AzGaihMEmEkkgPSce0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11546
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-37377-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,tq-group.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 465FA5B906B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 09:01:15AM +0200, Alexander Stein wrote:
> If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
> enable_irq_wake() is called with -1 which is wrong.
>
> Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I don't have hardware to test. I just noticed this by code review.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/gpio/gpio-mxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 647b6f4861b74..12f11a6c96653 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -469,7 +469,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		 * the handler is needed only once, but doing it for every port
>  		 * is more robust and easier.
>  		 */
> -		port->irq_high = -1;
> +		port->irq_high = 0;
>  		port->mx_irq_handler = mx2_gpio_irq_handler;
>  	} else
>  		port->mx_irq_handler = mx3_gpio_irq_handler;
> --
> 2.43.0
>

