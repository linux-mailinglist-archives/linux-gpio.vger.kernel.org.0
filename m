Return-Path: <linux-gpio+bounces-26278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F0B7CC24
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053E71C05236
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C934A2F747B;
	Wed, 17 Sep 2025 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PGtrRBZ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B92F5A3F;
	Wed, 17 Sep 2025 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093711; cv=fail; b=Q98K3COZy2zRIAhgX9z4NH276zDkqmQb3LWma641tSbaMRegEajPW+SGAzSkSpyAKeg9wxbjeb6yVh6jih1GQatty9mAOl+l1nIECGUma3JTJWiFn8pzamwxkBklJ3jDcYuyQzKg1NOKit5hEFn8CbVYrvVf+hQBqRHmw5Yzxjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093711; c=relaxed/simple;
	bh=5Kibr+5tlT5k6rKolq6LiglgwSAUcWgxKQMm0fUqg04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Aifue8VTwm0JSy3tU0YMVWKpR1hnJqd+3apKVaXIfR+rcXTvKzjmdZ7d8CxVbrwviO92ZyZUIUcszyGiIbXyEhoqn8hRbWl3AIdHdDxmiDWJq/jAfQxfHdTqz0zVheA5hJMVJDQqpEjaiD6tb54LJjiU1hXXE1/bigI++aq9EBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PGtrRBZ/; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueDLf0Qc7nu7JOlm20/aseSgHE64hw1bsOD1jw3BZwKm8zyga5kqE64K6FDchveuOOjwWKkPJCrc60kfwQfFEb536Wu/DEwpoU5MESFV4zk7nl+15x1NsxK7GEDkPWuaFG7//ljizojNvRGaUzJQamzinU6zk5Rka6e0WLU2tis3iCZDkqYc1p0o7I5T3uN0jldx06bvvSLyTTXFbKW73K0hytjK4E9wBhZVDOn/7WBPyDJ1RGn1KNX/5/NFFengdxSofA42xLkBoM4XjERcza14uywmOsYF5yCqO9WcOhdVJUyZ6qGrysavPmoZebK0q3sPw8gILu40K8WlORW7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmzrycRiDHymGntWr7dOsvbcwyI73CyBFcrCSUcocX4=;
 b=YhiMEoPSFZn5ooHCT4pSSpw+vY3HTG+nh5zgr8expQSrFPYtn02bfxzqzCMzweD1yQF+dKsa7bK+aZacktjpoacNVfYSMgSS74HicocG0hoc4By8rshLc2G5lSIRqAgyGt9Bi+rRM1YJ0p2+m4eWZVg91eLirkVjRbgttKLcl7eufA9hkoOnvRUiAvnywVtvJwP+PxhEHTxGFl1SEukG6otkBpt0cFR2NpcNUmcSCmfKyrBSQ3U+teoGQ+YKm5Jez2pOKWIoaGqJex46T5sfjxgidJyNZu0Yat6WVH+/aC9+NYYyxtpsbC58z/J1V+9KJ7G6/rykLlcG5r6FQP2wRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmzrycRiDHymGntWr7dOsvbcwyI73CyBFcrCSUcocX4=;
 b=PGtrRBZ/jUkHad/xoJWDZO7KtO3fqU2tC9Z+Kyzv0fiyalEqVrPLQacBcgsBYo9oBl7whcLlOh+g/u7OwkP7SfB2bMdzalE/yRG3Jt3MbxIgNKnQ2LvVAbYg81qowIh8CjknSxMnfY95+AkpaPnY/4kmBku3FHSXE6g+tdyotktHsyOG0IOGB7vYt6DmrpMAQ+mZBEq6h89ijTS6qQsip0SxCLOOdbH48uPRLpMxLHWaWJJZOwWRBLTAvJ0uKbifz7uF1QxGWFdXpY6V6TB9TejkWvuIup7FW3ejdCbUeuD6o2bS4sZ2uk/hn+k5V29D/ztvCu9i0wWwzpN2URtnZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB9835.eurprd04.prod.outlook.com (2603:10a6:800:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:21:44 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:21:44 +0000
Date: Wed, 17 Sep 2025 10:21:41 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] mfd: simple-mfd-i2c: add compatible string for
 LX2160ARDB
Message-ID: <p2sy5l7us7tviqd6f3r2llqsowm4tywp6xymihprcafbb2ab5z@xihsv5fsvq53>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-4-ioana.ciornei@nxp.com>
 <aMmOSM6tOi9RX6ZD@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMmOSM6tOi9RX6ZD@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM0P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::18) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB9835:EE_
X-MS-Office365-Filtering-Correlation-Id: e164bc4c-2352-4c85-578b-08ddf5badb2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9hCOK489JziDFg2mIXTLOyioc1yWqDoieK+bBV24JjJJdvecokZsph4E7AZo?=
 =?us-ascii?Q?ksUgeBkJn32szEPYIyw6eHNPjbQQYrsboiLZfddD8KV4sstbRtmUDfnskz6p?=
 =?us-ascii?Q?uk0XmRS66PygpJiiAIkE7ijwHKa4427oD0p9o6yIVNZ7keW+c6pjOEnL9zcm?=
 =?us-ascii?Q?xm2+tkPip1sdCF6w8OySJoMP4oYhi/Zcpy49OnrwJt4nd/yk9BzWeuU5idT0?=
 =?us-ascii?Q?PuALssSiQjiApPvwuaJg5gMjQmCLjtXPnAVRNlL2vvFwOB5jaL2AUl0+GBKf?=
 =?us-ascii?Q?Jc7wOm9NEMazQ8Y6ALyByGcOyQZ+D+RpppvvtgQrHwE5//S50cwQabYvAwFl?=
 =?us-ascii?Q?Wvlfct2YvLq/x8DeGdun5ldACxWRXkQYSAr4PzAfimIAGxrpAW0lAK30hBhu?=
 =?us-ascii?Q?yXGmwR7hd4YsBH2gU4KBs9map+/DYgWl9d+dq70edRdSnrO2DlaT9zSOOKQK?=
 =?us-ascii?Q?Mi4Of5VHP5BEr015SlZkGbT/YrM+w4qh4N1pjNLd6bRRLCcVe1Pg1Dz3jJjZ?=
 =?us-ascii?Q?PEQsPfsnFpcOMTgSTY4oEB3JIZTKOsH3DKjBX7A1/tC2AgXnmLelCi/oPhrK?=
 =?us-ascii?Q?7ExULB+/+DEMO8pzWhs0fYjvrsEbfLeyNESo+bP7Np8Q4VpyEZVV4pixosh9?=
 =?us-ascii?Q?ZGdNpxX+mSWqOH0VzRe75GTxRfI3G+S4DgJiV586e24kkM6wrAC70CSJKJCh?=
 =?us-ascii?Q?L49z4XuS32Kdp4jGuLNcgfP4F82AbHETyCZC1B+gueY1aDjFCVEqvWcnCp4A?=
 =?us-ascii?Q?0baY+OghmX6egwaEQxktuzjtNqfM5lMTTr6/zJ0+FRFRq3tgoZ4rD/zJexRH?=
 =?us-ascii?Q?aBeEeQr1qf5nYc223nHWAusBhzMX/Pz62cPkwY4ks9WO7A0jxN7L7zz9wYgz?=
 =?us-ascii?Q?q4/KwZCweVAnhm29hwWYMISIHP9saihCQ3JF+KzJNYh/pYyTYMx3xSph9bUK?=
 =?us-ascii?Q?HYC83KCyx3nKOLk9MuFOE8Y+n1B4en30elpgazA9N3zrifSxLdJYuo1MqGzF?=
 =?us-ascii?Q?LYMSKyQQPz+IqrsiWIsIMcYW/tfMpD2c63GY9zYclpSyALAr5AlrjPNRvqjF?=
 =?us-ascii?Q?j6LFvb0ciURKUVFQ/6osXK1blrzfAFVHs3zgPxH+B+jNeGEyaQGgRq8DeqZs?=
 =?us-ascii?Q?chm16I96V5Zh8Gvv8G3i21xCzBaSQI7r59q6LyV3VrxrrVSAEtWz5hZEhm+c?=
 =?us-ascii?Q?wKw8nbqhyKqm7z/Lx8KiWzY9yKnoCamACxawYtFdMy2O6e7/jGHYJLAqQgRZ?=
 =?us-ascii?Q?V7gthJg7mqilH2p1VA5ygj2GdV+2Jqs5J1VDLhBZ5THUeAhBf8UoTrykHNg7?=
 =?us-ascii?Q?Gc6+l3bCE9St2EGhotnHzb1jdiHaaV8NtJGVBWDg86DPjMUUvvVfUkJKazN3?=
 =?us-ascii?Q?/4h9Krk9pNYXZAR1+Q0MxePieCgA/R9D+0HSvrvRlicFvltnOWSMyfOnMpBD?=
 =?us-ascii?Q?eNVUSdxRyCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q9/4YwvixNZWOPfmvM662oiS677ZrLyWSASeOkd3WtWvbRUICCldWhTw3b1s?=
 =?us-ascii?Q?JafXwq239rqsDv+sxE5ExT/x5tEjz4CecAEwbI60d5d3QUKm2sSu23c8xib3?=
 =?us-ascii?Q?bck24PRK0Hkm4RGVVeKrSCa64VzxD8ECKb6D2hCgyof8RjtPrPlXt7ftzSki?=
 =?us-ascii?Q?pECTWw2iKgxX+zriJGT8JuB1JWSLcZOsG8c6DIXDbqQGtX6s/AGoUWBFzpYD?=
 =?us-ascii?Q?LugqkiDOTkaQOj60e96qGh1uRXybiPea7zItrwu2re85yvaXOXxxB7n6+kPS?=
 =?us-ascii?Q?03Tyb4T8ELrGJ0NXJSWHmJIDjfjDvKJ0jq9I5STetVlkZ1681IybqfwetpT5?=
 =?us-ascii?Q?R/JjdgULa3FzN4EENjKq6SQYIVhHlt/aZ0npV/8V/GB7YAhacI4bJ/ImIxdM?=
 =?us-ascii?Q?OeEA6/7i7OlyJ5LOR0DLMnLhoOvENaJABZVaS0kTMfxyFxttbI/jFiCorQdX?=
 =?us-ascii?Q?pZmTOLRyeow7Lyc5yoDkrHKEYanxuEAGfJ3vDjlox+UWHCyJbZdq5+MQgu7a?=
 =?us-ascii?Q?a4sUTqm75GonRrS7xH5Dt6DN5e4nGaPB50peEX5UbcUIbOBGcv54MQYe4DIC?=
 =?us-ascii?Q?hqWCY2ccs2awFB9zpLUeMy7syOAb4hjXbN5F0VsKfA3dntzVlo6/tBVP4Fo9?=
 =?us-ascii?Q?8uxtcBMofhafgOYO0wfd/hTf1IptZVv9/z9YHN2Wgi9FjyKdICaJM46brVmo?=
 =?us-ascii?Q?cqBVzwBvxW9gPj4uEAtdwHlXC+xM4KztXSsV7TDeEvgS1/NgV2M7qs4BlCvl?=
 =?us-ascii?Q?S96G4vt9XB0FTLQ+eGrBDIgaG+ZDMxtkxovYCNTPCX+feEsWCXZ5ArfTX8US?=
 =?us-ascii?Q?tfdaNUs3ev+rHk06/apONACrRvbGoJfecn06Nq5wsOKmo0OPs76sJS4D+cha?=
 =?us-ascii?Q?yOqhwOv5BOjtMZzdeiQ/2EHGr5SY6PdzkMh+dLgTSGG1EzUIAYCIA8ZddEFF?=
 =?us-ascii?Q?Ze+xctHFq2FmLx0lMLIB9NV/KNwRFVN8VhyztF2jHv5Z97wzv4F3x602S9Vh?=
 =?us-ascii?Q?5nUwzRwGnGBVFtGQa521egjI42KoeI09objcqiAjCHYhZuH6EX3aee6sk1YQ?=
 =?us-ascii?Q?Q1CQcbvfomvIdxDqCpMT6KKnLZU2UBKZ+0aBkJcG/ysP7rQuTreufu/jxCAX?=
 =?us-ascii?Q?4Qh4hAJ/RZS5X1kkrd0qSjbWm/Ut1BevNQxNYtZ4Hcb+d08VcNDUuDcs8bc6?=
 =?us-ascii?Q?9UR/h7/gsiYNaVR/Zmc37CiJFsMTSrb+gzYZNCroLowrXmjmD2Be2DjxLKd6?=
 =?us-ascii?Q?/AbO1MR0J4kLFrnXk6s0cJKjRKo/kRPLdaLh09I5Q3QaA2hkz+vQ9YWMHmpP?=
 =?us-ascii?Q?TsAH/LDeZilMsw7L/SBXErvy4Y5AtinVt6swdoVYnE2VR1kazW5Y5+x/S7Oi?=
 =?us-ascii?Q?OJkBowliKufvTrM2UJpDgJSIrTGOv6UBrkmXXXEdF04KAjVkHLGrw42vF1dL?=
 =?us-ascii?Q?pDW4Q0swN9W/LceoZOZwpKpuwlx9scHp/ln6R9+4pi4v01K9MaRcPprwnfSQ?=
 =?us-ascii?Q?D4T6c+NqCyNh4FrR9hhQz9Fnv0xgjHpMHaWzcy1FbfvSFZDj3jk1DietUXqL?=
 =?us-ascii?Q?vLIfQsT0lbPy5uqUmaqbq9ZGBisz0RYGZJM20eyq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e164bc4c-2352-4c85-578b-08ddf5badb2e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:21:44.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izI+lVUMnhw7si76J60rXQzDw6qIndamkBk34rzJvXiwzpY1nH2B9TK+Rvu8YW9x6GjH6Gg+ac1hQuvJ6rvkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9835

On Tue, Sep 16, 2025 at 12:20:24PM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 03:23:48PM +0300, Ioana Ciornei wrote:
> > Extend the list of supported devices with the QIXIS FPGA found on the
> > LX2160ARDB board.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - none
> >
> >  drivers/mfd/simple-mfd-i2c.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > index 63ac26388860..6fbe85437d8d 100644
> > --- a/drivers/mfd/simple-mfd-i2c.c
> > +++ b/drivers/mfd/simple-mfd-i2c.c
> > @@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
> >  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
> >  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
> >  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> > +	{ .compatible = "fsl,lx2160ardb-fpga" },
> 
> driver data is the same as fsl,lx2160aqds-fpga.
> 
> why not fallback to fsl,lx2160aqds-fpga in dts file ?
> 

The register layout of the FPGA is different between the RDB and QDS
boards. Even though there is no difference in terms of the
simple-mfd-i2c driver, I still want to have the ability to differentiate
between them. Also, the if/then added in patch 2/9 would not be
possible.


