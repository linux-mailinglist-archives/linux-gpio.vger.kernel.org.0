Return-Path: <linux-gpio+bounces-37408-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WETjG5W7EWo5pQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37408-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 16:37:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF95BF6BF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 16:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E42301BA5E
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 14:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4680A2DC32E;
	Sat, 23 May 2026 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BoxgABP0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC72BEC4E;
	Sat, 23 May 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546894; cv=fail; b=ahnOjtrBLh0voMVoNTO7amhmlvkrC/sBUMdRX8R7rd7RGg0/ZGVOG7VzkYqZ04LjkYYCtydIMBsKiw4vSsVG436oXhVIZyuTuAraEsf1Kmh7LXm15UJ4UiIC3g2x/RsGI0WrT3TI5L4YGCRqy1IUJp9n1sD619dVQoW8twmgNGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546894; c=relaxed/simple;
	bh=JC3Kn0NPfxoPIZ6BqPAFnHbhAgFn94B1db4YK3/LgGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LtZusEUNz+jwCcRp+xupw10zNgQTmL7N7yhITKVYkQfH/jsxIkIKGc9Fe28aiaXbmtuXDdCjEaBFD/kjo37FMrEBDeKWbzVgv67Z+QKKuVVctHhUDfNEt78ioOwV/RQwH2/aiZv2cyN6DkBWUQjsHsk8FKprhx8/oV/3NdT7UnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BoxgABP0; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wpk+oY+K3FrPkMvWkrXWmrCZkFbwMCcVfANSK5fuYYIV9tyHB3WKUVaiTYDoKCAS1yPTRE4qXrCV0V2p3DVeNbzMTPuy7FK8WzIlSBwEhOajOZCjr/hmIdH9QS4D2lNFM1n8FRhukwTOoZOhFvXz3po+8Wlcb2QU6bqUSgDN4ApJrd1YCh3icE1g92ssFPeT98AHtCPwQTcMnEzHjwZS2SRGZ/eYtyDTYcV9yE3DnEo3viwzlqPTX9W+apMG4f2xZWqa3oVDwjLfh3FVkeIzklLC90vU+RYMwzxyn+Ne1szaVf/c0X5oKwqPsu/oEzGQa6OqGDEGTeqEkOjHVhEtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuws2lye+QoaHmTyUcSigKwJbfvfBtQqsXXOG6/gviY=;
 b=uD7JZng3gM+JE70OVP6q/EMHnoDg2WljY0yyqSpJ4swTVWhR0q2kyENn64icfovhXmhXy6XPKUFQAk9bBF3av9/2KnX2rHFp2UCj6qDLuEnnFr2YJpyE4JrAFzLSQEgiU1TthH3ktRPBA4lDewcuQz1iHl25GI5UCBSdR/MfnDGuL027t7m2c8Wdwg9xYobVjrDsGLXFcz6Y8/YTLaTeQSwTDp36ncUQqaU+ZAvJEl8Rb7YJ75cPW4s6QBqlo87CR8goK/pPBPRDorJWgZRXdmx/y1xJ7OFAZheIxF6hrPqzA5P5zO860Cl2mEN6Qilc5Ag8lIx4Ox6onMfUhCBoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuws2lye+QoaHmTyUcSigKwJbfvfBtQqsXXOG6/gviY=;
 b=BoxgABP0edbEfggivq3q0Y9A+EwuSsqIYG3D5Fk8CJYcCvds+E/uIy9tsPy7O+AEMeZLnjv1DzgASxmRh/Ur7YIhlsKavcHXx8Y69PnjN2iKyoLwopCa4WieagA8N+OEWTFFyo20clEEFhadpL+aob0syU/qtXXxLZhnOlha7nd5Dko7AGYvSFpT33f9pjZKEvpXWh7smaeZDMccaFlJNBZW3OActHLIFbZPwADyDx8EwD6FkKvS0GAcs8NlzXGfNb6g+nf5CumXX7tRHw/6IRBbdRPlyAJWxdiBFePKhb3J+8voY++XosPaBKZcsz20eBx9ZhnuGx8xomrGmn4zmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GVXPR04MB12039.eurprd04.prod.outlook.com (2603:10a6:150:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sat, 23 May
 2026 14:34:47 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 14:34:46 +0000
Date: Sat, 23 May 2026 10:34:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
Message-ID: <ahG6_Y12af3FB7-V@lizhi-Precision-Tower-5810>
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GVXPR04MB12039:EE_
X-MS-Office365-Filtering-Correlation-Id: 7152039a-ebdf-4c60-ec79-08deb8d87010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|56012099003|38350700014|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	FbcwWjTI/aLFsL08pU1GAbJy5yYKL1bcojrJ5MgQsbWLw7b2Y+3b1EayO7Bgc5r/cuOoYWvh73EBPHaFBLRZLuXnitL8655L7E1g58/LuW9EQqRLUiRUDHYsSAHrOSl6oCfLnrw6lncB+FbzYgc5aqg6OBoxg/ZPXgQjYnQVobNVU26w+NlvLFPqwlbfiihN1Eq78pvbuDAfJP08KM/eiTOJwgtHk2+fD5dTZAs8hYBjNemYGJ/W+uBoOPuZrso9K+ZnF5Coy6xC32n+Vv73ou0/L5qA0BO3T0vRfax0hwj8goa19WEm3kNunZWyrin6AdyzBvwQYWUnp6xUhyDassY0E+EwilKT64LITMpEj5LCCHv9arVPs0POqO95QnuwNDgx61ZeA+oqL20C/oVhAqRggr9xoJ+I0eh8JwKjCwAm6kQJ7tg/wHde2Zvvz7qz/DhqXuvzp4WGdltKlJCmu2PSwQPtFqLsWcXbxqhXGSzSDQXB9GbKyzUjdu6cRdBOSncIWPsP//81kaaFswrn6Wruwsw0cNPRtF2Rno2cjLEgxMdSuJpxcYiMpkZGaOSe65qukKPFgx/U/a/VeZHe509R3xyjOJxIpVCdXxfqe8CrN7Xy5AZPUNN6II5I8BMxOKbhH37EsFGcVP/+JScfv8BuIlpw8I4vZHqR0qevlRvZwhgbmhYJmpKYuwVKyoa9KD4cGeZGmpVroDQ+mwfiqcU1JhFytafxFDo8FpP73YmN3QZeCP75VTWemQThOvJl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(56012099003)(38350700014)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oe+sQ+F+z5WvlFNcB/QnPfMZwYx4cnpcMKsm+ZGUx/wrHYO0RF/NPU+bWMuC?=
 =?us-ascii?Q?e/2DRb9K6Hht8DbMNhVmIWLEDc3VUyFgV4KyjAerKrFJVO4+JhRAqwneyrIB?=
 =?us-ascii?Q?HTPTIgHDcjOC1ul8ccCoEn72nVWYGY0ZQaOsdll8HIUPHx7N8szEXmru5j80?=
 =?us-ascii?Q?m0iVGp7KdCT9+wixzDZt9HziYKaGpFtw/tZQfM7M6DIakKEjkfr8D3ikVbqK?=
 =?us-ascii?Q?gRhqk22PdUH21CHMgr1ELj+C3m8WsGmh2VxdA5v+8wRA/Cai0uP7XiXIvG0F?=
 =?us-ascii?Q?ncKk7Aq/lNovFEHRH5ZBuNWjL1aJf8SWfssYNF2gDk71dY6BdokUq5mT+WdG?=
 =?us-ascii?Q?QHL1Z/bxkIMx5KBDJgLknMeeAS8I7FE9/YbRDg4/vN2iC3MRrKTVBN0IIPm1?=
 =?us-ascii?Q?+Y8HCUHVq49hOMaPlvQiOe3uMYCMmMysL0tGOoWesE2ZGn1fwJC4zkBxJ8il?=
 =?us-ascii?Q?O1vUX8ejS0CbKUdPeltudAybbmKYF7AqqpJZ8Q2bpSjmCQySIu0zKfbj0K2P?=
 =?us-ascii?Q?KI966sHjIV+sn/lEo2fTDg/lGT9YIUMQzwwaNXupVrvVN8rtixsWY0p8BAH5?=
 =?us-ascii?Q?6IfccHf4vgv7FHg6NfyWgdlS/3aBn7OqcaPGurmjMAqvqIQP00JAONppynyd?=
 =?us-ascii?Q?S3ZFAktR+2/zirV9vdXNz63nTn7MH3nhUQJtydiowktkHhXQRaPUYcRHASww?=
 =?us-ascii?Q?BLsYh3piQv3B/M/8dGCm6q6GKkBOvClwHhQmag+qeTtcPWhmyNnPwLf0EVlF?=
 =?us-ascii?Q?qSrXCilka54oMX3g+yIvGacZLZNs9e6Odyh+l0nHRKBHdqgnFb8o4SS7FyJW?=
 =?us-ascii?Q?mbvN3vv3TyfPfrfnaeN8IZjmtpCOtZppVOrS2ZklwnyA0FkHuMYBLMLsayQU?=
 =?us-ascii?Q?lWu8DB8sxy+8sIW8yKUzmO/h5s3dN/SZwTVqr10UQ0Rg/LGd/DeOLN5xIcDL?=
 =?us-ascii?Q?/aPQAlHSfzJaaGLNLZbK+8rWqyNqiEXfG1Ps/zzj9oGPBrKCRa9uhKLyeOGh?=
 =?us-ascii?Q?rAL0i8tE7CNehG1LKgtW2sKtS7klSycRziEeMmvVA0SdQLdpShlwn/VCFRui?=
 =?us-ascii?Q?NuTk1ZdmpOA4uQ5o/vkW6GBoMetMvyzB7aYbSSeG6u5TDix+SBoqOeWEtSvH?=
 =?us-ascii?Q?yQEsAnCe+fyaNQQKd7LyxcDfb7zvoN6q7mtfgBnR8mu+EB+pTfK5P/ICA6v+?=
 =?us-ascii?Q?zBGJI8RkanD7xJK73rlgdVkAcV1Fso9qfZ6BNNuh5oZX/scmhZkDZ9EJi8f2?=
 =?us-ascii?Q?mODZtukvBOh2jDRliHdwROJ/kt67TiNmNDRPXYfFh81i0a6QQKXN9bbmQ+lm?=
 =?us-ascii?Q?qBImC883q4ylqhU79L2Aeh+ueSM9vf5h6qhY63dMxDpF+2JZKfNUZFS6BxLl?=
 =?us-ascii?Q?wnW5og/qWfp6H8GkRrmn9PfcfTH7l6zdODqo1m8VPc0cJbA42VF2ZEZ8UfvD?=
 =?us-ascii?Q?vX9keX5E3YihtKbqoMoaXzKDkZp/+pulwqucyC1N5rL65pY3BhHRo448nEmE?=
 =?us-ascii?Q?Fdy/fh+sY/0gYLlbilvoOj0yLmkMoi+LMOtUaltVfOamK3RMo+nrVssHw5Y3?=
 =?us-ascii?Q?0U1dOtbHFkr4heJv3xlvB4K2ODUmKQZ1rr4UBg3qG4N7lpTq/RP97lr5relB?=
 =?us-ascii?Q?rHf71ecENpWEvadAbhn/8UZCfYb12D9if4XLcZvBMD0FqYLbzqYi/r/cljLs?=
 =?us-ascii?Q?a52KQz2Ii+H4sFxTwCpmM6awdr/qvm9v/ASZXzcNb2cmciDfRLmbt7nMW4A1?=
 =?us-ascii?Q?xk0NRgCYRg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7152039a-ebdf-4c60-ec79-08deb8d87010
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 14:34:46.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEkBzEf91WuQK+uDXcI0g6+KziQCS+LY+H5RGukeuZPmu97nSV/mALD+lv1d6N8ZJR4bbjXJuE+zszz9KeUipg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12039
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37408-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C9CF95BF6BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 06:27:05PM +0800, Felix Gu wrote:
> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Thank you for fix it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b7bd4ef9c0db..4a6bdaefa42f 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
>   */
>  static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
>  {
> -	struct device_node *function_np;
> -	struct device_node *pinctrl_np;
> -
> -	for_each_child_of_node(np, function_np) {
> +	for_each_child_of_node_scoped(np, function_np) {
>  		if (of_property_present(function_np, "fsl,pins"))
>  			return true;
>
> -		for_each_child_of_node(function_np, pinctrl_np) {
> +		for_each_child_of_node_scoped(function_np, pinctrl_np) {
>  			if (of_property_present(pinctrl_np, "fsl,pins"))
>  				return false;
>  		}
>
> ---
> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
> change-id: 20260523-pinctrl-imx-b198f8391abf
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

