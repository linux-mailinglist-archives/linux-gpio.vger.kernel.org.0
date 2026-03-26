Return-Path: <linux-gpio+bounces-34226-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FAOJPyNxWlG/QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34226-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:50:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048833B22C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB39300EA8D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481B349B1F;
	Thu, 26 Mar 2026 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mszQzplg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B925F99B;
	Thu, 26 Mar 2026 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774554440; cv=fail; b=fTQBEwNh4VAfgtRXPW6p3sGWO17XI95yU3Me09T9UPwkQI/08KDGHy5Pxpb0p7RzL3QHKRuRDGRVx+OLyBjRu/ZGEZypMg0JSgoFUnjxLACbeu9JyMiQ5ThWoKaL62CdjWMk5XKqi0hZRJ3MKiqmfa0nQ7zs/vgO+/dy5wkfhM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774554440; c=relaxed/simple;
	bh=WK5fxPAdvnIaqYgv6Q3s47YQLY3S6YdjmtgozSCpJjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZRwSzmvO2JBDpuOr2EsVnkru9/l8aDup9+1i7IG8Wa1w5Ke0CBhGXLUrrOjtHCF14XI7yrFxutrKC3lVnqLAI3PczTrLlVLMIiAOYJECnryHZxO1qRt2cT6y0dPoFJm1Bm02rf8XEHOEpLUrJSE9mwmC0nnw1rb9TzAZ+RgC3xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mszQzplg; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKBCLcMqDSwhLLBB5uxOZxxwJgFjiFRwIvhajliswt4Dui9fFmLy35bsEUqA9/F7jd/gOP/zuX+8g3FQ7/Ay883R4fpdO+sriEt8fdTh1yCH9ldyTQDTi/9eH0cWTUumdnrhU9YGUg2goZNyKisCL4FD3ot/+XI1YlrmHk61UaOpyAkcPzqxipPqh71ntqag//Qz/CTVpyq1DgWmn87A/ite1Xl/4tCHj5ycwWEY/hzeHb0MI7be5CQv9j9WmuSD8VAZgHgvVxvhImZIHa1w8NqETFiTYCcgmBPRkuolDWbj/pHJAVOhKQhA2kGyjPJy5gGsHxjLNbj8EnBQ4r9S0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLIzwB5kEFGI/DvTT0q7RQouEwYDVjXCy7eU0mMpxo0=;
 b=m2ZOjZNW1aHiv04rIuSdzgSgeIJUNniem4hlT8X5pguuByu7+ZyV5uKLX7zBjx+HTlBANSSTUJv2WOXz95s57WhWMD9H+zkve8NMmmiZ5m/z+VL49Mb6lfA/VPzeeTdNtADCxVWpDiPTrK+IYO51HfAcdXR8mhz9c3UunGr6NP4752skKNz8tX0Zyde0HtakNmUbqr3rC1nwGlAdenmRMrLFJtN5KT7sAm2D4bOQbGuAMvLOHCZDsFeW0iQEd7AjDjADsHaL8bRhbvW3CqnZLX+AzFcyJF8bFAD9KEdW3A5izy27EK4jjsWqSgJ+nOtuNeYACU6IR/kmZjUhCeQvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLIzwB5kEFGI/DvTT0q7RQouEwYDVjXCy7eU0mMpxo0=;
 b=mszQzplgjx1CfbQLOYqCM+8uhUQNo8bVjzKIQqfSztao0TJr5pzd6c4l6rWCCHPy4AyJrxA/U6nLzNQ2dwGC+xsBnT9h7YexTtN2ODfXi1T46Ivt6AkXPoi7Cw4im7slh/yhgxgfF9XJcDyxGeRxDKLgVEzTkGbUBtu3mdjcz73/MYs9lft7et3f5QAiTSFyMppZDoK2tP4VYmf/a/B5OlI5ZQ60vjJZbqm9GFTbQQQuSJMkepvbcEZUUA5bODFWUXgc6R+PGgFuOwTfAw9YsSGDlgl7kUsm7EwUm9yw2WXKA4AVZ9uf5grLy9Y9oa2XoJ93J6r0DXD/pBijgNQO6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by OSKPR04MB11368.eurprd04.prod.outlook.com (2603:10a6:e10:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 19:47:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 19:47:14 +0000
Date: Thu, 26 Mar 2026 15:47:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <acWNOhnBvA5l9NW3@lizhi-Precision-Tower-5810>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
 <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
 <20260326-concur-eel-3e0b3d91e00a@spud>
 <20260326-poncho-expanse-d30a9eded8e2@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-poncho-expanse-d30a9eded8e2@spud>
X-ClientProxiedBy: PH7PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:510:23d::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|OSKPR04MB11368:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbd8a41-5df6-4896-e576-08de8b707a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|52116014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	L140J1Mu5+6B/johF89xk3yauB3eM2KlqHeylYEUPcvDyDABB3ZrUrZVwLPOSkNIkUdCeGUJJDvasLCZJT5h3nypg1yuZjYSAT8K/EBPCY78GCl/6sfoLxZrx98KxXqD8a1yOvpBSWRaAVvma3sKSTK4HbkH3w40iFKE6X5FNDRbkUeGrQGO/3Weldz48z00DXrKomGfmmJtLr32lYGpXPKB7zE/3sSgGzYF9TYtHPgS3VoduForIQERUY70f3zE2BuEfnkpzwKn6vfjnCCYq+u+AvocZPH+ZfpvTApbSPKPjfrvvHQRaoAENT+07YrkJC4YaVo5G18NBYGJq+J9td0KYvbEWm/QLx7HehUNAQ6iI+tUS0dbBCtDjtXO/0qefatxPX7+9fZgFyGXlDZLEvuiRtc1Msy5+NCPb/AqVp8DdXvhNGUWFfTSBLSxDTJj6FnKKWp3EtKqOyDzMqYYs6wN2c8YUwmlQLZsX8KzoQnm4ivs0V+6D/3/UeHyoAXSZm55b6Xw3zf9XSe4+GcJMbqKmQub4CTvUUR7aMd6BP64TUCaIT0w13sKfemtJmYxhDg0ZoZCW/GUYvsC+E79lDqMjniRZ6SBN+f/WVMCWf/XBBv2wZhlVoZSX5fARl/ESEn5wLatx0hMLNcl3RMmY/W0b6x/2xnH6ribS0rH///k7qlO3tLjzxm3mfPmzSjFULtiHaRXTBYxVt8TMuik+VAWzWWX1asqnPqbcMoebhZ2KFy57csuagPXAVD+aAv1OkvRuolJ4aut3suF5nsXgBFGDXvaP2NOqtUn2pzk2NU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(52116014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1OT0MV72s1Gou/+mw/lx/b2fMONEjCrC+XziZZ2C34NOOfsNvsT72TeaL1z?=
 =?us-ascii?Q?wUdyqGd1zWy9vCHhgQ/9/vA4mGtCTxSg2NkgA0lJCjLXIi+kfxFWsx471XgN?=
 =?us-ascii?Q?yl216SETG5DcoffrYpPW2x0h+7RFuAw9sFaLHKV9MyryVMOexgOUI6ov+xUE?=
 =?us-ascii?Q?ipNHj98QbigQVc0nlZQG+4or0sXNgB1m1oDPe1RW/wikg9D5Lf9qOablVdgt?=
 =?us-ascii?Q?wbve0jtrrXc6g7iRj5TEQ/x7RHbaDOLfXXjroQFIZH/dPmHNaBQaXaHvNJeB?=
 =?us-ascii?Q?wx1cTXM/dn9xKak7GX635jJxRHLyuk9h7DwB5z7TINUWbYoCKiPFJdsQynqX?=
 =?us-ascii?Q?FeIIbpjxylBbcGLLs46EKzv9LRzDwuF9r2FTy+A8DQ1vl+LnOhjyudVR/0Gw?=
 =?us-ascii?Q?EL50hea+MiYafzmn8u5qRKXBh2SmrZl1ldyNQAZrApOrU3Y1yvo7t7+sQS9t?=
 =?us-ascii?Q?UE9rI065D9YSFjQHE70ylbzaDUiLEEz7ZS5+2VwgFgiUqRJScW2YcsmkvsMt?=
 =?us-ascii?Q?4qA+ji7yAlSl280YO3JngobXaFvWz+bmd/g90rwfGrWsjMxSlXDqMwQiypb5?=
 =?us-ascii?Q?KWwFoYY9h/iUx7mRhTIRm7sOtdfrcIgTDfQtllhABGSN1IBPjw0fmEKhCREy?=
 =?us-ascii?Q?p5ZcOs9/oXmbQyY1AkfxqTXzHH/8IVk2PdYePHC8gCmJAevKQ4lLWGCk+SqU?=
 =?us-ascii?Q?bUxV2hx1/mzJpsCKK+FAnq3vBGqNco2ssNfPnOxdGSMI1H/S+ZeHX2ZnaxJb?=
 =?us-ascii?Q?Q8bo/k2mreTy9UyBUVtK8LdDhMiGsDvpyfmmjNo22on4kFFuGITtu/iTzQ7G?=
 =?us-ascii?Q?GH/YpHm2s2Uw9zpfhQgcJoXRKIq5KbTHEp6+GnP463+e1oWHma3962nJtXi/?=
 =?us-ascii?Q?j5g6pY7DJU0ZD/AGPhtt36A413eTISwhz0z0AP/T39To+VGh/gOi6nsIUSkw?=
 =?us-ascii?Q?kW24h41F0qXiM+FytosMmoG9wLvR66/XxSgXcFbBPsafoygNdG8kBjDm7Lz2?=
 =?us-ascii?Q?TUKjO4MAeLRuS0vXhdqcfft0ozj5cpcGpdXH2at/W1rnTD3gUGWjVA0yZNtS?=
 =?us-ascii?Q?VdV71dwjrqcnIqS/CI2K9OPMLo4VO2uVwLf95StxAt0MGPoWLZq3IlyrdNQn?=
 =?us-ascii?Q?OecjJsI+EYZDwBI+Wor5jhsR0xuAvENtVIcBo4nCT0ybIAwJfc84HE8dXp9N?=
 =?us-ascii?Q?7Qn/5AsLNLyR5oo8KtzjorU0INEsAYSkHBqBbcg+Cyb1xjzWaMJMKTxZ1jUE?=
 =?us-ascii?Q?Kmqzny4rwXF6xCuoG+lfinNP46E4tzCQLT7f+/WKgUu8SG1viZLYvinYxaDK?=
 =?us-ascii?Q?gBPf6Ozqf9pf3IYT8xZycgQ+ZA7f86SqoYD1YT2FaeJ3RD1Bpe5FU3rp7YF4?=
 =?us-ascii?Q?gqn+cW98XEKpIimMHYKO2hWAHnlJvmK9CRxmqSYmYu9VVWDEDgpn69/cl96d?=
 =?us-ascii?Q?cdH8ZU6QZN17qPiA/YBeWb6yqh/i7p30oPgiuoj7pvuDG9RTVe6f/I2Ffpav?=
 =?us-ascii?Q?xy6jZuI3QzOMnocRIP+Y0XfkQkBBYqPz0mdNNRooF5IfrmXvRWq1mVaIP4Iz?=
 =?us-ascii?Q?8her54qchJr3qvrsxw82uAymrzGzqqaDKKbL+RYrv+a8pOHKAXnpKbNautlV?=
 =?us-ascii?Q?Mkt5rGpvelNFZDL15OepAlw9890N4h1luIKvsWZ13nWTsO4OlN9dDcUpDRDg?=
 =?us-ascii?Q?gziJsSqEditwRv9WxC9qIQ30HmHNVohzCkpsalQTt5fIFrgI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbd8a41-5df6-4896-e576-08de8b707a81
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:47:14.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEMmM+ZWr2YSSg5nJulsEvj4h49OEiajs+X/vTQUlTyx2SX6F2B0aJ8ugt+101IBWI7CMGhHXYb5oZ/Jm3fEWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11368
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34226-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Queue-Id: 1048833B22C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:55:01PM +0000, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 06:52:12PM +0000, Conor Dooley wrote:
> > On Wed, Mar 25, 2026 at 07:04:12PM -0400, Frank Li wrote:
> >
> > > diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
> > > index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfcd0b57103c6ca950 100644
> > > --- a/drivers/pinctrl/pinctrl-generic.c
> > > +++ b/drivers/pinctrl/pinctrl-generic.c
> > > @@ -17,29 +17,18 @@
> > >  #include "pinctrl-utils.h"
> > >  #include "pinmux.h"
> > >
> > > -static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> >
> > > +int
> > > +pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
> >
> > Can you drop this stylistic change please? The
>
> Whoops, cut myself off. To be clear, what I am asking for is to keep the
> "int" etc on the same line as the function name. This function is new,
> but you did it for the existing function too and the comparison is here.
>
> >
> > > +		       struct device_node *np, struct pinctrl_map **maps,
> > > +		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> > > +		       const char **group_names, unsigned int ngroups,
> > > +		       const char **functions, unsigned int *pins)
> > >  {
> > >  	struct device *dev = pctldev->dev;
> > > -	const char **functions;
> > > +	int npins, ret, reserve = 1;
> > > +	unsigned int num_configs;
> > >  	const char *group_name;
> > >  	unsigned long *configs;
> > > -	unsigned int num_configs, pin, *pins;
> > > -	int npins, ret, reserve = 1;
> > > -
> > > -	npins = of_property_count_u32_elems(np, "pins");
> > > -
> > > -	if (npins < 1) {
> > > -		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > -			parent, np, npins);
> > > -		return npins;
> > > -	}
> > >
> > >  	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
> > >  	if (!group_name)
> > > @@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
> > >  	if (!pins)
> > >  		return -ENOMEM;
> >
> > This looks suspect. You've left the pins allocation behind:
> > 	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > 	if (!pins)
> > 		return -ENOMEM;
> > but pinctrl_generic_pins_function_dt_subnode_to_map() has already
> > populated this array before calling the function.

what's means?

pinctrl_generic_pins_function_dt_subnode_to_map()
{
	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
	...
	pinctrl_generic_to_map();
}

pinctrl_generic_pins_function_dt_subnode_to_map() have not use this array.

Frank
> >
> > Also, this should probably be
> > Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Cheers,
> > Conor.
> >
> > >
> > > -	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> > > -	if (!functions)
> > > -		return -ENOMEM;
> > > -
> > > -	for (int i = 0; i < npins; i++) {
> > > -		ret = of_property_read_u32_index(np, "pins", i, &pin);
> > > -		if (ret)
> > > -			return ret;
> > > -
> > > -		pins[i] = pin;
> > > -
> > > -		ret = of_property_read_string(np, "function", &functions[i]);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > -
> > >  	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
> > >  	return 0;
> > >  };
> > >
> > > +static int
> > > +pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> > > +						struct device_node *parent,
> > > +						struct device_node *np,
> > > +						struct pinctrl_map **maps,
> > > +						unsigned int *num_maps,
> > > +						unsigned int *num_reserved_maps,
> > > +						const char **group_names,
> > > +						unsigned int ngroups)
> > > +{
> > > +	struct device *dev = pctldev->dev;
> > > +	unsigned int pin, *pins;
> > > +	const char **functions;
> > > +	int npins, ret;
> > > +
> > > +	npins = of_property_count_u32_elems(np, "pins");
> > > +
> > > +	if (npins < 1) {
> > > +		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
> > > +			parent, np, npins);
> > > +		return npins;
> > > +	}
> > > +
> > > +	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > +	if (!pins)
> > > +		return -ENOMEM;
> > > +
> > > +	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
> > > +	if (!functions)
> > > +		return -ENOMEM;
> > > +
> > > +	for (int i = 0; i < npins; i++) {
> > > +		ret = of_property_read_u32_index(np, "pins", i, &pin);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		pins[i] = pin;
> > > +
> > > +		ret = of_property_read_string(np, "function", &functions[i]);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
> > > +				      num_reserved_maps, group_names, ngroups,
> > > +				      functions, pins);
> > > +}
> > > +
> > >  /*
> > >   * For platforms that do not define groups or functions in the driver, but
> > >   * instead use the devicetree to describe them. This function will, unlike
> > >
> > > --
> > > 2.43.0
> > >
>
>



