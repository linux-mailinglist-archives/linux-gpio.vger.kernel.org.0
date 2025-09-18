Return-Path: <linux-gpio+bounces-26324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBFB845B1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 13:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361E61BC53ED
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 11:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F23303A02;
	Thu, 18 Sep 2025 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YxcoanRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505630216D;
	Thu, 18 Sep 2025 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194942; cv=fail; b=GXyr0q052FKuJ2z0igeCyYprjSdK7L/uI4GtdLyR6zHTM5wqMdYkeK13XQtLO9CNlFzETC9LR8E4uSrEbMVRIHAUMI61eNUcoZt3co2XVrHQwrx1aok6gj5lINvl5Gh5a1MEqgYjADneAC5rJb9jOh/zHNMNTMTa+rXmnJWtqS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194942; c=relaxed/simple;
	bh=ruxZFRGsVddTy4SCP/GC9MpneVFeQIm6oS+bF7Tod7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fzik3wjjGAkvv47IeRFJh6qxjAHxpMuLNr5xzfzMaK95SnotkNuNHYTLqitvxaAUSj/Nq/vyb+kOwGmRJsFRBgDn15+xQl6DvGY6ZS1b8GnlCBHLvOMxuUZ2F8fHDVvkWe7zc69UvQniH/9TO4waq1qESVSr4R3NAMXw9aC36M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YxcoanRb; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad2NJy8UH3iIOTGZUgDL9z7uuB/Y93cYYHWQB8+xienUq+3Ft8EfbFcK8ST8isBMJ1L0OCe4IoWiYTq0o6wlo3WKHFw3lcGSPjBkzAVFrf7VXLbJFgFueT0D7uW5aNx3+hWTO+9E7HrWs3d64xodXtACH3WCtCVK3bWkd3BBfji7KvFBPPqkTQR7fS9IOMVnzEPnunBze1PxchmQv3g0USYbCR66Fl8zW/KyhsHzuxSpBTy2ac1ojIZonmWL0dXYehRu05KO/7FxpX0QD0eYmlOWPbdqGsRxz5wd2d8GjxwtVLlK3DXiNihCFj4Nt/fnhXTlmFVK3mzpuMiTecaiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QToxPgK7IAKxqVpO82OYQVUW2/Lx//YRwuHmz/b9Bj4=;
 b=Jo/TFwKy1pQjT7VDdKd+6eLXO+3e6b6Re/ciBJlVwGYV2o4L8mqrjkSvahCmEFv+m7W18GNPS7XCrXrchgPBcDcSvOXxjWHyFv5hGuKKXiSHpSrBc1fzy1pOVj3vBfMKxyTBeALdFC64y2Lx3JS9FG6B5HJvMFZ2afzsX0sp0KBf9Q23gAFIjL4H89yIfa+pvCzK+HBYsszCFFOQ8G/+gdnP/ThGulSe3LM6zHPMWOLXyXCoXv4atOHOy36OaohznzUPcP/gGQdYmS9Bt6hiWqOWvBvVcy/PP1gayi6eYILldLO3OQ9u3g8/2V5uAw050S3ODHnGgb4CM5fwHI7OqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QToxPgK7IAKxqVpO82OYQVUW2/Lx//YRwuHmz/b9Bj4=;
 b=YxcoanRbzjkE85TuLY14IajRIFj+nsP/xb//h/hojp1/o91M7JKKy0dy4J4TaD8EEk8735zfqWxMEekU2PaHHdBh7LNo8JVGH4hquoznuZMz3kkHH0Z91efq/Ogitld9OZnfM6wGYaXNv6lvy6dgQZsMTN7Au87zsZei2Qc7QcHsLn2w2ws99Qo4zLEdByIn8RbTUVx02UUEKk32ntwG2Z08zQjldWq4DyQJlpahtlIx1kzsj1/GpyihUZ+wAzomVBqN2MvG+6A11HO22SAIBiA9cf83tF7ZR3hITf445RB6Gk8EOcG+hhXA6feCMfQq/kzw/GYnrNKn9j+iCaWWNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU2PR04MB8568.eurprd04.prod.outlook.com (2603:10a6:10:2d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 11:28:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:28:56 +0000
Date: Thu, 18 Sep 2025 14:28:53 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 04/10] mfd: simple-mfd-i2c: add compatible string for
 LX2160ARDB
Message-ID: <24iulsc4gdozqzs2xrgr4voypltd5gk3bkwsxrlhuo7lymydpq@64t6rppgcfsu>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-5-ioana.ciornei@nxp.com>
 <20250917092006.GC3893363@google.com>
 <c66ntgflv2g22bylqac6hwztt6ljmjl4bgdwwcljs4vssvzr7g@4uwyzb7dw4bu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c66ntgflv2g22bylqac6hwztt6ljmjl4bgdwwcljs4vssvzr7g@4uwyzb7dw4bu>
X-ClientProxiedBy: AS4P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU2PR04MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 0122edd9-856a-4ffa-760c-08ddf6a68e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkgsHN0Z30AuqmtbY34U2JgQ9sCo6XiLwUSgpJa9+xodWPq/COE6uZhtZ9Hw?=
 =?us-ascii?Q?LQwY98jVlWywnDgKgmUbGG6kcn8WkINQp4Le9K3P4OSywn9EdOXlMvfVY9ab?=
 =?us-ascii?Q?jrm6hlZkXR0n0NIifcz5TnPpZCBHLc+csl9BpPEcRkovd5BUEBR52hw7YdPs?=
 =?us-ascii?Q?0MUSACsYSKnojpmDYe/URpADhToYBnkQ9/7UmOyHdioAtTjKtrezE++Go4s4?=
 =?us-ascii?Q?BKFVvl2Rsvg/F69GZTp6liqSAtt41Enh7cGCgAlVUWosIxwLQrW7iLwP3TU5?=
 =?us-ascii?Q?sSAodEPbumnFh5c4AtGPd+l6xDnf8XYuw/3scn0conik6Ig2gJF9pXIjlcKp?=
 =?us-ascii?Q?jwMVkPJ2uamiKE7NNwobehOmB05hGhP7DkzPk76BE+mksiWWth5REzXqWzjt?=
 =?us-ascii?Q?Y4Y5R/kIS58xwUyj8/J0OS7l2HN7rGwnou1KxG+yru7Swo9KzrtF8lUOgq97?=
 =?us-ascii?Q?Mfbou15IhnQImcptVR5aWiVgVcU9D7GNNzTOaylEwFbQHDqSBGHBz1wmeC9t?=
 =?us-ascii?Q?4IMZuAq4B+goKCQqzmd21xa8fdYSYrbwhNpGsXAKJr6EtMfVSuotm+ORPX4y?=
 =?us-ascii?Q?YGNVjDxPN/xP/KUl1ajAwyGjjJj1DWESQC3Ltbe5Dg7a1sRj+f5+orgy8bQ7?=
 =?us-ascii?Q?/otbHuZ6EUXmJWtTPOTbGLR1vYzS4a4yA0ZTVvbyecf8TTHWFXVJVpJGXhJm?=
 =?us-ascii?Q?MycKa4aFWzYaO/zXiTwIUc4MfBzYa5mLsOBoyA1LqRoj5h60nrDMlPchOl2T?=
 =?us-ascii?Q?axnX0NGvZY2+3NcraY75XtUpWGoWhYzUopFLTfgVU/8CIgijjdIZEqnYrJ26?=
 =?us-ascii?Q?K+D0uHjwZzCK8zY80vapzr2ZkRNHjEVyVn0azj00KTsYbfv3lkDu6KnuhxJE?=
 =?us-ascii?Q?jR3nHUq/UC4rEXCbULR1m9i7KaLOFO8NCBheaxE2DXSJpQ7LL/lq5uaYVySb?=
 =?us-ascii?Q?B3sOUFuOOY3xGCi5b6tMB6aFa4AbTI942jP/TpFLcuz9H3bS0165flM+CB/E?=
 =?us-ascii?Q?YWMzYxsiaiP/HRxTeu6BU2pFpUmamNw3Kq+VJeM6ou73cSqvtqCaYbfN548Q?=
 =?us-ascii?Q?4EJUzWD4/DqxVFadts8GNaeIN0gV+4Tyy5urCQZg8aldnprJ2pjWOXFFXlMW?=
 =?us-ascii?Q?VDwPbvXqDB9NNxB2oPdaNTlB2BeXMZQBlUK69wNjYmhC2jlUKNRlOtKYm1EY?=
 =?us-ascii?Q?JLcfUcawE/HA8DsYYDa1R4fccxQl7eORx9HcwyHVEskkB+Nij/e4RuFIURHe?=
 =?us-ascii?Q?znOmvqwiCfSDA7pMb56fKVO7P9nvHUJC1YvQAFiaFyyLcYJlbFXgVM+nYgZA?=
 =?us-ascii?Q?5psfCdcMJPhvC+qnmtwqZ3+ecFtxfxjgjb80rhqwqW5VFzeWzWEqpydla6iL?=
 =?us-ascii?Q?8CYzdFvwaYEWwIJVGda1bU0k+SWNwR+E8Rnaj3mNupHaHFR0jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0alRAXzNvvLruMdVKXvYAuBf8C8V53l6f3sWRvDDmug9JEKF5/Z4bpyteyB?=
 =?us-ascii?Q?vNRkLOraKh6xdlbeLGfuqm50jwVSmMX2A5bVOVH6pcRYmB6cCx7BQ+C0ZJ08?=
 =?us-ascii?Q?3BaSDYM+uih2wT3nH27udfzs53KEhPfqctyE5GhfxF70SjFmxYoEHliKz9sm?=
 =?us-ascii?Q?36QnrxKtpuEJ/SV1f4at/1DRu+7BgANjAQ+HZaUF6lgOrBbQSxCe70Aaw/Qh?=
 =?us-ascii?Q?uFAuSCA5S9snuhIBp+wRFTPASZ6NKu2dSqYuKK0RYszXDDESde5+MImlLhnH?=
 =?us-ascii?Q?6rVKkRBea1TFzxX2jasDkVpTDUX3Q0aSeDSGQUkMRsvPBGNjHUP8bFf7i9xV?=
 =?us-ascii?Q?Oc0Q5uVEDilobEJf0wy/N5fvZSjnVSYvsmg7qRXgN1u+9w3rNSewZL1Z313R?=
 =?us-ascii?Q?b6Twfw/Ssz8fbDcNNgCSw+8YBZa7UIz7BPwhyBFaKk2AZW5cqkAyaztaNjvN?=
 =?us-ascii?Q?jTPvwwsn+GimXigCU4861Qj+S9gxye55/yUNzTqUfJkHwhCWlHhK4eLv2r3M?=
 =?us-ascii?Q?rCpf5afA3XPShMvlu0Hm6Z3h98kNgiAptnvKNGtGXOp4AvOF+ZHhjk13DKQ2?=
 =?us-ascii?Q?a0sw8QrH6+kc1tO1Usk7U4RHjpMnBJtGc47umw1KilODHXWgx2pIDpatzFZ+?=
 =?us-ascii?Q?YlXpbNGSaN/4/mVOQGlAtIgGQLvCp6i5kdnT3jIQEBam9JVRMAC/sI9d5RTF?=
 =?us-ascii?Q?jSgnkzbdajEclYbXhE+uIelyffKAUEhook420IuHnzaoOjLFM4hDGWsmQviE?=
 =?us-ascii?Q?3brUIktR0lPiJfQbQO2A30M7zoSZotweNLJOpt4tP94xSwj7fwVtP9tmRLpl?=
 =?us-ascii?Q?SY6Isa8c+uC+SNpWI5qQBxkfuFrzIARX68zqqTLwFmd8dLH2xj63M0L03HBA?=
 =?us-ascii?Q?1IN3aln8JtVkpXbohFZ4tGJdkwY7AOti4yYmpb+x7tWGF3mxODUML4LpggSi?=
 =?us-ascii?Q?BmDvmmH8itCr5BL14r8DJzj/tRl2k9DzucH+uWkWY76O7XZalzUho8ZTwWLN?=
 =?us-ascii?Q?jh9uhZ/3NfYdvkUsihVOlv7MCXpm0XJc8dS82mAtRosvAtNQD4+zX1/mlKCR?=
 =?us-ascii?Q?yKfW8bCVnA8hD+kKnPbA5W7enL95POWzrwFQD4Fp2xQlq9LcmmWBfwUjc+lj?=
 =?us-ascii?Q?92etOZMkyYZQzjf/t5VqrRWg8AIKFUiM/WTViJp1hm1CMi8UIr9a9ozN7ywH?=
 =?us-ascii?Q?ZSVzNwASE7J+dd3sRBf7GGnUpZgcUmIbWUqo5bTIQsXmElQJGwCVv/v9d4L6?=
 =?us-ascii?Q?Vt6SEuXg2I+gApvCFvUr70Orm6C+lLNPwyiuBtp5ClA/FBDYSRya9PY/EwKo?=
 =?us-ascii?Q?+JLvsRrrdN3iSGoolelkMgKtm1i3pJRKeZekoP50/HA/D3jitdQx4vDd0ufz?=
 =?us-ascii?Q?k3+7+0tZCqnmZJ1UIFJ4RLlI91lTjjGwzwSSoga2MUAONZKU8XhvqiipzJhw?=
 =?us-ascii?Q?vn1CKnc32LY8xBBJCeLZJ5f9ljhx1nF22nNLXUCTDaX6AXay5953Qqe1JW9F?=
 =?us-ascii?Q?T8A9F2qM+gvr++/nXZ0ECOL1z6GFRA+oM7zDmtfmGWfUAqOI/DMnZEeNOOnh?=
 =?us-ascii?Q?TC2NOVRN643rBU6u+mNjwx556zDPxgNUlxZvjv6c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0122edd9-856a-4ffa-760c-08ddf6a68e01
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:28:56.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/fyueMXkY6cYXQPBpweB6jf15e8+Kuz/bSu6WtvvoKlJz0zHqAfdxVqA7Gp4bEMyHjmS01/jh6Jdc4vJ+BvcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8568

On Thu, Sep 18, 2025 at 02:15:13PM +0300, Ioana Ciornei wrote:
> On Wed, Sep 17, 2025 at 10:20:06AM +0100, Lee Jones wrote:
> > On Wed, 17 Sep 2025, Ioana Ciornei wrote:
> > 
> > > Extend the list of supported devices with the QIXIS FPGA found on the
> > > LX2160ARDB board.
> > > 
> > > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > > ---
> > > Changes in v2:
> > > - none
> > > Changes in v3:
> > > - none
> > > 
> > >  drivers/mfd/simple-mfd-i2c.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > index 63ac26388860..6fbe85437d8d 100644
> > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > @@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
> > >  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
> > >  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
> > >  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> > > +	{ .compatible = "fsl,lx2160ardb-fpga" },
> > >  	{ .compatible = "fsl,lx2160aqds-fpga" },
> > >  	{ .compatible = "fsl,ls1028aqds-fpga" },
> > >  	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
> > 
> > Please keep alphabetical.
> 
> Ok, sure.
> 
> Even without this patch, the fsl compatible strings are not in
> alphabetical order. Are you ok with adding another patch that fixes the
> initial issue or do you want me to just do the changes in a single
> patch?
> 

I just realized that they are not in alphabetical order even when
looking at the other compatible strings other than the fsl ones. I will
add another patch to fix all of them since.

