Return-Path: <linux-gpio+bounces-36091-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NstMR8F+Wm84QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36091-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:44:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638C4C3A0B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7420C3026C07
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 20:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059D2317147;
	Mon,  4 May 2026 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VwZh3gx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44BC1DF27D;
	Mon,  4 May 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926860; cv=fail; b=al32fWHgGgNERIM65MjAN8Ko+BH99D7QCXk5AG7SoK6ITQOngx18b6yZS5Htv7VOnY7oLSaIBVfx7ggjaA8N/1wXDt5+WeLsSR4+TkEyFOZ25vlJom11/1m/9ejMKRrMHl1Zy2H024Dqi0OZe8cZSa7X13kOhBeD+av4AWJDXMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926860; c=relaxed/simple;
	bh=7iX2LJgGNkPMC4qt3SgHQm7Y9NzdVFGzmLNKEkgCv+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KRHJwaW/QoxfI7467YEVnITTo+T8PNhNZjckMIv8niOL2Jcy4RwTnxCuUCkLIG7PBhQD68MAqvA28/jXENUp+gbFxIdHLamRD1TcunsmbEQEkQSzSLnAr1yzxYoXH2vwUwjt1yjUvsUFbQ317d+YI70VQxRXHuDPS3gbt4qlNyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VwZh3gx6; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3QRlJGNGjVgLKY7ECO7p0mypODz6WXTMU7rhsAVDDLQN2Gs1MswefCyyMMp/RElcVQE4P5RyYmRyOQpWo/YgLzwuyMAqTnjxEvu02pZXUMHSOtYxy0DbsjxxvWeQCe62DuV6Pb/gGj7xZL9HrYW0t7smyZgvJ88DbCT9ueiTLWIu454xb6dOF0GpA4qDvypNFtiqeqIRAsplwWnKmqDzF+W5I8eqfZMmo4p+2X5xLsRULC9UF+M5c6brmNORQfxNFnbdlZJrAaMHFyYf8rGYYY6dDNP/2S2Pg8gcC0oevFAUcuU4+L/0Spshm+MRmsPh/Xw4+84+rJZ+vM6KuUvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwoi2D25ckU7pxGmny9wvkf3ZAwFGVSrzbgFvRIaGVw=;
 b=Y5DlIAd4oHyrnS3XAKBt7d9uSHew5c8LIAuDEZ63ooh170gWIxxvtGCXMXuRjfgtgqPY9femCzvUUgzocsDQKyUpFTaayUNw+SkXmUHQCefeoKqomGiNAJcJE83d22fgWu5L2vXhq+1rdLR+EXA0+8FuBGXbioNSFJiMAug1fVC9VzD8EJC+pTTtbQAKOoEYRLFvHsR8aAqBDFJD3bDnHEK1TTRJl+lRXbeA1Wr8zzxXy1td2LX44hrhwOzmQINjXcSIGIWiyo5nvURXGA6hr+1oOf2uQUSqJEMczHsvuchKr2yo3E8LHlW+hzuPKh9UrvPa/+eX1aHj7wO/NYc4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwoi2D25ckU7pxGmny9wvkf3ZAwFGVSrzbgFvRIaGVw=;
 b=VwZh3gx68CI4RhoBV+4c1pAzv0sWxxUSve4sBacrn9D8LMyUZkvlXwKRqQVtW+LNF5ed5CXPINopkuF2cCJOrILva5BeAN7ItGT0oHeRJfDcJ+4fss5KIcgihaEJKG3bZodJ8dOZP0AdPG6+L/2ZGkVvKJnBQ25QVE0GZFEZTE/hp4bDLqgR8ch7joywnZMH2Bk9ZqfDemR+drZyvEf6gWRAAxcWAI4JciIo1nu4u9OZoQKFBVLjJw0vlH8S6zCpHWei5rFbDuFUNF4lmdslyslX9OlpoqQD6G97nsX5RkyCCjdY8wov34d++fuMAP/oYAdzeK0S+O8SqJPiXcsOQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9590.eurprd04.prod.outlook.com (2603:10a6:102:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 20:34:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 20:34:13 +0000
Date: Mon, 4 May 2026 16:34:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: zain_zhou@realsil.com.cn
Cc: linux-staging@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
Message-ID: <afkCvVaPb-NrLs2P@lizhi-Precision-Tower-5810>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: c5858a9e-2ddc-4ed7-245f-08deaa1c8129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|22082099003|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gasN9wAP9hrIZeqr+duRzJYbkhKcQGvk08e2IltktAMaLWNP4pDLr+BIxxUJhLFlUkTPqfrbSvqvxMI5IK5DH5XvZxmuEBEb37O7rJns82ZX9c7O0aubQm0+7y/oL9uB0achvBd96DgMbmBHYyc0YLDm59KPqEBgrAeAM0595WMgc1RA7KUpeGajzmJtV4YjkivnC9ao58bOR+a/y98J4fU75Zv1KaA6VN3QDebdbvTU48HC8+dLO0mPx/Uc5zRa6jhRwwEqHY+dBDaZ/ZAh1oajWhs0btr11unQEfSkzI+8i3YGmbjWnULcIODD/P8i0IKWvNwNfJ/bXwPzLZFj/sLDNFkWBqo9fYxA9CzjR40GN7Hr4mQpUJohlK8vOKpGvnIiIUqgZsXGGVqaPCkZzFUgPwcgmPmcbL/toG4qfZpHCh7CcUksxPf/UpBhf+sbORKl5PuLMcHpsRNWubSg8dtirjXumnbSYrRCCx+XElhjndWUQY0Xstq0iYjlg1fMk4wSUcosbL7YhfL9AYXNKuWgo/KZsZRQpPunroohxjY/AL7fq2wIIXc8oM0RNgzw5Pink14/sqmUrpf4rUu4T6vOnugClIuQ1zb0PEkyGGKWZ2y9yiPPFzv/Nk9j9f1M7vtPudmsNsDbSvVXU+5inHIQItKAx6Ws1OiRyf7gpxlNQcFALWI/k/8nob9dRtM/vY8PSyk2M8A7hYrdYHgLWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(22082099003)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fEXLSIE2j+VA9XQemRL6Wj12TQNOZAOr+VlGBNzlDwTXdY3GqZ9BGxbkyPSK?=
 =?us-ascii?Q?NVxFuGLncSzx228qgCmxiL7p1hsukPjkyb2h1E3FiRqtI1MO8H7c78uD662W?=
 =?us-ascii?Q?/GcwNYqNfXeNjz5g6Sg2XAmAItN7ntlnMG/azT7n6ZNJZGuvLzV1ecg+StKu?=
 =?us-ascii?Q?y6yEalrbxp5tA7XwNXD5tLNkn57cv+EbxgqexrSQ9s/7NLUN3YDTmM4aoUdc?=
 =?us-ascii?Q?IiLTr4hjvDdmjrx82QDD6f71nGQ3BCfA9gyKk/JEywYhO+47YzmGwGRjizDD?=
 =?us-ascii?Q?TSNxGYBOdQWKqU+Dpp2syqN365ovDyWie8F9FhPhfm/TkqBpoeoVgjTziTm3?=
 =?us-ascii?Q?/+pvHPa0QC1zVEiSGr9zsxgo+e25uMPtgIkJWDBno+E+mR5/pldAzTuKk+bT?=
 =?us-ascii?Q?Jif/LbNALaPOuwE2MQt06Ar9dtpBIJrvw4w6uUwJinhka8kP3Of/EQRWBtvS?=
 =?us-ascii?Q?ha8Pvg/d8/CCSgsDeD2MRyjF0gTqB+HlELA4sRpUhRisgu8BRAHSdy+xjupd?=
 =?us-ascii?Q?+a2K7K75fvL7G9ZwtIx6OPF+nJcqnMJXKP05MEET6mxu+U4wr1HOjesuJoDC?=
 =?us-ascii?Q?GY6sbj69dKBmsOfANYJRqTMb4YTd+XGh0fVGegW0DzCScvZkUX0nMCbOrmVX?=
 =?us-ascii?Q?hmIAw8b+ARYHKkKKlW6bf1U6a10HCHGN+Vu46kCGQ1STpdfR/Y5+aXecKQgw?=
 =?us-ascii?Q?R00z5R+KsJXvAPM5ELsiOGZQr/1kMnQsB+rlzoVeEX9vqElR0VM0szqggbfe?=
 =?us-ascii?Q?GWz7GwX6DK69V4tntjP7jS/W8Dp5BGaYPt18OlArjM95zhcKgvz0SVtmg50k?=
 =?us-ascii?Q?P1UJCXYhEqLFRtF1nRmEz5yJaG1OntQSlIfNViyUPynYpqH2YKMZMliDHeU0?=
 =?us-ascii?Q?6sUWZ9T6lHYOfaZ4ub0CfnxsrC3APKiSWu8kzDgCkmjx4pzyR5u6f9DkpKtK?=
 =?us-ascii?Q?OZnPNyUy+jjgn61T8DrX53jrh0aOrz00KMwHuEzY5PoenMvBuu5PFukLcsBE?=
 =?us-ascii?Q?UegI1du4PND8hjXP7OlGkgI/vFKDwg2CQ6/2CaM3Q1HLqRHqFbRE/z/dAkl8?=
 =?us-ascii?Q?LevyeW3URQopeqbibEzB6XPZ4nUKkeEQrKWdk1Y7ZsCq5D7OlBS2KPdsgmk6?=
 =?us-ascii?Q?RqO/H7UUpP9Y/soFh9/8fPOYGJ/ZEWz4+SEolksay5vwzLGn2kfCjJclXm3T?=
 =?us-ascii?Q?0uB8Uxj0xhi22UmeIJE+p/40MDve10zBIorNS8agn/IfBfmLjjEmBrn7UG6h?=
 =?us-ascii?Q?VZU6qy9/LjvEZBAqThyGucQVaA+/lni8FUzxefh2Z+YIrPeeKVcFx9O2DiuQ?=
 =?us-ascii?Q?SPLhGyerIm0vrCrWbTfSVX+rzvpKAC0rxuzGcieZFz6MWC1ZeWLUnAdJtU8i?=
 =?us-ascii?Q?aUfzgnMiFtzGMK6MNfbwBwT4fHApkhOUWitEdr/lQ4TSt9Rw8HHh34SmMQ4o?=
 =?us-ascii?Q?7XVUXo/7MnhgOc2Hu77FI87J9bGZVKdeyWI2tVv3zooMSTqDBhcQuMpbSjMn?=
 =?us-ascii?Q?RTqtvrA7zksL8mRlmQGZMS5uZVAXwimuIQ6G+YUtXjjCkGiNpVqvroZT3WUo?=
 =?us-ascii?Q?Y93spAS3JgZpqmZOTqPtVXnneJ48RHwXy6pKXihFQJwKk2LfogYJvP5zDpLj?=
 =?us-ascii?Q?6W+QplE+ruAH0RHWchP/d898OV0sOfHAQRXqAJqzaoqvrz0xhoJvdgqJ0IPK?=
 =?us-ascii?Q?ajJvjSiVjSCIXKCoyAM+F8ZaSLfIZjmJ593LTfvkG/vDqliRNGyRL0LsTYbG?=
 =?us-ascii?Q?hIS7NK6zMQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5858a9e-2ddc-4ed7-245f-08deaa1c8129
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 20:34:13.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1EMrTpCqsPsOuubo5IQJLqq8ZbXUwwqP58nLKyTWAWm5aVEKo86XCuqu5XXUI4l3kaszaIkC9N0YU71CaPYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9590
X-Rspamd-Queue-Id: 2638C4C3A0B
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36091-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	R_DKIM_ALLOW(0.00)[nxp.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	NEURAL_SPAM(0.00)[0.344];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Spam: Yes

On Thu, Apr 30, 2026 at 08:13:53PM +0800, zain_zhou@realsil.com.cn wrote:
> From: zain_zhou <zain_zhou@realsil.com.cn>
>
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.
>
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)

Please base on
https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#t

which almost done!

Frank

>
> Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> new file mode 100644
> index 000000000000..30295eefee89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> @@ -0,0 +1,410 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I3C HUB
> +
> +maintainers:
> +  - zain_zhou <zain_zhou@realsil.com.cn>
> +
> +description: |
> +  I3C HUB is smart device which provides multiple functionality:
> +  * enabling voltage compatibility across I3C Controller and Target devices,
> +  * bus capacitance isolation
> +  * address conflict isolation
> +  * I3C port expansion
> +  * two controllers in a single I3C bus
> +  * I3C and SMBus device compatibility
> +  * GPIO expansion
> +
> +  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB
> +  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,
> +  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
> +  DT.
> +
> +  All the DT properties for I3C HUB are located under dedicated (for I3C HUB) DT entry. I3C HUB DT
> +  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@0,0$"
> +
> +  cp0-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  cp1-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp0145-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp2367-ldo-en:
> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  cp0-ldo-volt:
> +    enum:
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
> +      property is optional.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  cp1-ldo-volt:
> +    enum:
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Controller Port 1 LDO setting to control the Controller Port 1 voltage level. This
> +      property is optional.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp0145-ldo-volt:
> +    enum:
> +      - disabled
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 LDO setting to control the Target Ports 0/1/4/5 voltage level.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp2367-ldo-volt:
> +    enum:
> +      - disabled
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 LDO setting to control the Target Ports 2/3/6/7 voltage level.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp0145-pullup:
> +    enum:
> +      - disabled
> +      - 250R
> +      - 500R
> +      - 1k
> +      - 2k
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 pull-up setting to control the Target Ports 0/1/4/5 pull-up
> +      resistance level.
> +
> +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> +
> +  tp2367-pullup:
> +    enum:
> +      - disabled
> +      - 250R
> +      - 500R
> +      - 1k
> +      - 2k
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 pull-up setting to control the Target Ports 2/3/6/7 pull-up
> +      resistance level.
> +
> +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> +
> +  cp0-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Controller Port 0 IO strength setting to control the Controller Port 0 output driver
> +      strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  cp1-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Controller Port 1 IO strength setting to control the Controller Port 1 output driver
> +      strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  tp0145-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 IO strength setting to control the Target Ports 0/1/4/5 output
> +      driver strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  tp2367-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 IO strength setting to control the Target Ports 2/3/6/7 output
> +      driver strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  id:
> +    enum:
> +      - 0
> +      - 1
> +      - 3
> +    description: |
> +      I3C HUB ID based on CSEL pin. There are three possible values:
> +      0 - CP0 is selected as primary Controller Port
> +      1 - Primary Controller Port is selected by software by writing the REG#56
> +      3 - CP1 is selected as primary Controller Port
> +
> +      I3C HUB driver reads CSEL pin status (REG#121[5:4]) and tries to find DT node with matching
> +      value in 'id' property.
> +
> +      This property is optional. If not provided, DT node can only be used by the I3C HUB driver if
> +      there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes with no
> +      'id' property - the first one will be chosen by I3C HUB driver. If there is a multiple DT
> +      nodes with matching 'id' property - the first one will be chosen by I3C HUB driver.
> +
> +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> +      read from I3C HUB.
> +
> +  id-cp1:
> +    enum:
> +      - 0
> +      - 1
> +      - 2
> +      - 3
> +    description: |
> +      I3C HUB ID based on CP1 SDA and SCL pins state probed during power on.
> +
> +      I3C HUB driver reads CP1 SDA and SCL pin status and tries to find DT node with matching value
> +      in 'id-cp1' property.
> +
> +      This property is optional. If not provided, DT node can only be used by the I3C HUB
> +      driver if there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes
> +      with no 'id-cp1' property - the first one will be chosen by I3C HUB driver. If there is a
> +      multiple DT nodes with matching 'id-cp1' property - the first one will be chosen by I3C HUB
> +      driver.
> +
> +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> +      read from I3C HUB.
> +
> +patternProperties:
> +  "@[0-9]$":
> +    type: object
> +    description: |
> +      I3C HUB Target Port child, should be named: target-port@<target-port-id>
> +
> +    properties:
> +      mode:
> +        enum:
> +          - disabled
> +          - i3c
> +          - smbus
> +          - gpio
> +        description: |
> +          I3C HUB Target Port mode setting to control Target Port functionality.
> +
> +          This property is optional. If not provided, Target Port mode configuration is not modified
> +          in I3C HUB.
> +
> +      pullup:
> +        enum:
> +          - disabled
> +          - enabled
> +        description: |
> +          I3C HUB Target Port pull-up setting to disable/enable Target Port pull-up.
> +
> +          This property is optional. If not provided, Target Port pull-up configuration is not
> +          modified in I3C HUB.
> +
> +      always-enable:
> +        type: boolean
> +        description: |
> +          I3C HUB Target Port settings to control the port enable/disable policy.
> +
> +          This property is optional. If not provided, Target Port is enabled only on accessing to
> +          the devices connected to it and the port is disabled automatically after the accessing
> +          is done. If provided, the Target Port is always enabled.
> +
> +      polling-interval-ms:
> +        type: uint32
> +        description: |
> +          I3C HUB Target Port SMBus polling interval in milliseconds.
> +
> +          This property is optional. If not provided or set to 0, polling is disabled and the driver
> +          uses IBI (In-Band Interrupts). If provided with a positive value, polling is enabled for
> +          this Target Port with the given period.Note: this positive value only affects the SMBus
> +          target agent polling. The SMBus controller agent polling interval is computed dynamically
> +          from clock and data length.
> +
> +      clock-frequency:
> +        type: uint32
> +        enum:
> +          - 100000
> +          - 200000
> +          - 400000
> +          - 1000000
> +        description: |
> +          I3C HUB Target Port SMBus clock frequency in Hz.
> +
> +          This property follows the standard I2C 'clock-frequency' semantics.
> +          Applies only when the Target Port mode is set to "smbus".
> +          Optional; if not provided, the driver uses 400000 Hz by default.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    i3c-master@d040000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hub@0,0 {
> +        cp0-ldo-en = "disabled";
> +        cp1-ldo-en = "enabled";
> +        cp0-ldo-volt = "1.0V";
> +        cp1-ldo-volt = "1.1V";
> +        tp0145-ldo-en = "enabled";
> +        tp2367-ldo-en = "disabled";
> +        tp0145-ldo-volt = "1.2V";
> +        tp2367-ldo-volt = "1.8V";
> +        tp0145-pullup = "2k";
> +        tp2367-pullup = "500R";
> +        tp0145-io-strength = "50Ohms";
> +        tp2367-io-strength = "30Ohms";
> +        cp0-io-strength = "20Ohms";
> +        cp1-io-strength = "40Ohms";
> +
> +        target-port@0 {
> +          mode = "i3c";
> +          pullup = "enabled";
> +          always_enable;
> +        };
> +        target-port@1 {
> +          mode = "smbus";
> +          pullup = "enabled";
> +          clock-frequency = <1000000>;
> +          polling-interval-ms = <10>;
> +          backend@10{
> +              compatible = "i2c-slave-mqueue";
> +              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +          };
> +        };
> +        target-port@2 {
> +          mode = "gpio";
> +          pullup = "disabled";
> +        };
> +        target-port@3 {
> +          mode = "disabled";
> +          pullup = "disabled";
> +        };
> +      };
> +    };
> +
> +  - |
> +    i3c-master@d040000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hub@70,3C000000100 {
> +        reg = <0x70 0x3C0 0x00000100>;
> +        assigned-address = <0x70>;
> +        dcr = <0xC2>;
> +
> +        cp0-ldo-en = "disabled";
> +        cp1-ldo-en = "enabled";
> +        cp0-ldo-volt = "1.0V";
> +        cp1-ldo-volt = "1.1V";
> +        tp0145-ldo-en = "enabled";
> +        tp2367-ldo-en = "disabled";
> +        tp0145-ldo-volt = "1.2V";
> +        tp2367-ldo-volt = "1.8V";
> +        tp0145-pullup = "2k";
> +        tp2367-pullup = "500R";
> +        tp0145-io-strength = "50Ohms";
> +        tp2367-io-strength = "30Ohms";
> +        cp0-io-strength = "20Ohms";
> +        cp1-io-strength = "40Ohms";
> +
> +        target-port@0 {
> +          mode = "i3c";
> +          pullup = "enabled";
> +          always-enable;
> +        };
> +        target-port@1 {
> +          mode = "smbus";
> +          pullup = "enabled";
> +          backend@12{
> +              compatible = "i2c-slave-mqueue";
> +              reg = <(0x12 | I2C_OWN_SLAVE_ADDRESS)>;
> +          };
> +        };
> +        target-port@2 {
> +          mode = "gpio";
> +          pullup = "disabled";
> +        };
> +        target-port@3 {
> +          mode = "disabled";
> +          pullup = "disabled";
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..71ee5071ac0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12214,6 +12214,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  F:	drivers/i3c/master/renesas-i3c.c
>
> +I3C HUB DRIVER FOR REALTEK RTS490X
> +M:	zain_zhou <zain_zhou@realsil.com.cn>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> +F:	drivers/staging/rts490x/
> +
>  I3C DRIVER FOR SYNOPSYS DESIGNWARE
>  S:	Orphan
>  F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> --
> 2.34.1
>

