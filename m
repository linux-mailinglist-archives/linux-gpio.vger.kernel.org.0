Return-Path: <linux-gpio+bounces-26280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D4B7DA29
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F641B2720F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D3E2F618A;
	Wed, 17 Sep 2025 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aieTGuxr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0712226D04;
	Wed, 17 Sep 2025 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094932; cv=fail; b=c8S7uZXyZg9Mx/wOSYEE8MEoL/JHWZQkrFd93umQzDlPWxuC8YLxXdjYZuRpbFZX0M6F7oUHB762B+0z2wSc/w+iWWprhv4FCw3n+arqpJXDx4N6L3JCNuouC14wf5hUsJ4JdQC35QnUjF1NNIsm+iJ3aiwonBZ4g4TKqKqy6mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094932; c=relaxed/simple;
	bh=/JqCVpoFOc//IPpPHLFrR8P0Nhh+JvmKBQYC4usMCxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tmulSZUheR90BECWi6xyhZif/FJuxysjfjm8wWbI44M6imF7xd8Q5jtKpiTvHKcgAx0Sb9lzv8B7tlebNOYT5/Aupfj2eFp/lcehplhZljNT1HRds6o0PAR/1y4wWFi3QzAkyhF+V3MsMPZoxAWZzDXxeSHII5+ufDU10iIzwkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aieTGuxr; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzP4SJiU8E3ytY2NnmCgd3wzjbRyP8hDLLJ0UYBjExuqxZAb5u21FzcsSdEjslB/1jx+LNIpwMmy7i+xd4yG29tZu/67PL9k2fkvRfU5YQ5zYl6kmyWQx2/UXfzemiDnmpBPF8jkkwTNwdQsNlznehs2HV/R3T1v4C7WwTiQpkkt4OyPlqOi5V/k1EnvG4Dp5bLhgsXyvLMPHb3W8TikN3Ms/qKsQ7u5kOO8kGUg98uftVT1iRsIhyWUT1AXTtFepxy9oQ1OiNVR1NKFCP8HWQju8c4OQ3apKRbSrrHZGRy4/NkTQnhySq16oP0Te/oGF5gRLjgD1AH5b1PHn5b9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiseNnHn5bvdqv4QnzJbu3gPCfz6zgkUqM7sZo4DpQg=;
 b=Hc1kyzSXQVyixFv2K5PHoagprEiXXc9/XsxQtyTsyv9XOq+f8PH9KdqTrGr7xnON4uuBbCLZWUww8fDpoYWEOtBw7kNB6qdlQmphh4NO1l+upFdKzrcfGNtY5e7xcNrRv9lhz3lzQA6hxcM3jZaTkTYLofnK4MVtp3B8mq0qWjPBJEuh4HZqf5q+keKQWHq+6iqK7l5AM0ic2kHWkLDf3WdqJb6sJMMfY0+tEJjtnAVetf044kKaFzzJwTZq4L5H6/MQV/HCaQl0f3OmbRfLXToax/SU5u4mSpVq4a73eQ8ieBC8Ncsq15sz9m6BCSBy3vbFHADSwan5biABCKQljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiseNnHn5bvdqv4QnzJbu3gPCfz6zgkUqM7sZo4DpQg=;
 b=aieTGuxrjpFWwZLu1afCwWIMCvq8HWPM7IZHPiRH2V4HgwZ0Jbsgz67Z8gB1Ho2nkApz5saCFAzWR3wDeocOPBNdBvMdDmFXrzCKhj1rYsbphVIplPCWRvzOSRVLC4k4CshnGV52Ce+5sfNoA54tm0Bek8O7CTi42uNPqZpdW5Pw5c7aZ0YAL/tt47R3woyDoTDCyO1oW7WGenulx2pxcvs8Z/4d9sogDrcgo+bilXYc/4/+CJKrsXJGot+FzgRqAHyO4T056sJUaQNkQieXr+31qzTTM5HkV5VnR9nwBtO3Yoxvc3/si5BWAEwuAL43BVZNEHvWo4SQHh+nRPKNEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:42:07 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:42:07 +0000
Date: Wed, 17 Sep 2025 10:42:03 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] arm64: dts: lx2160a-rdb: fully describe the two
 SFP+ cages
Message-ID: <kvjrakmqdvfzsdj7klue3m7ishx6achmil4vekuuggqcmo5gye@ggnxhsaxsh24>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-9-ioana.ciornei@nxp.com>
 <aMmUYmIFOsue+rkK@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMmUYmIFOsue+rkK@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P191CA0037.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: daaddec5-431d-475b-d472-08ddf5bdb3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0DAsjj5mLWmqaThpPypVxXMuY6EV65QPU1NYWuvY84nUBslaPDy7Aurzmqq?=
 =?us-ascii?Q?OcLn4pXsvxEkFJweFgDUC54PyjN+jXwy8gPccru3RQfe7IT0GquD9p6sSseQ?=
 =?us-ascii?Q?MLedaI3ju6kTwPKvlWZr75SwPsLZEdKtiKuSREivTYvvO2cLO24Jph+k2cMZ?=
 =?us-ascii?Q?rFyESo1ClNKWl+aQQKso4aE3GQ8+gipfOO3o0Z0MjQIgbQmLCFpu6QP5mGZL?=
 =?us-ascii?Q?vrEo4xiqp7yPRudSdRpcSru8DoSvqzdbJJ8GYVEAU5RfP2B9QVnRxZULqM+O?=
 =?us-ascii?Q?VQE3aJRdR2RJiJtSn9lG4f12xsznKFEOWMsXrQD42uReEsOHHj8HoqblxtrG?=
 =?us-ascii?Q?+xOpYISVcUr23QqVvSRICtiMiJmPd2iKsRhlajW0bunWncTM75iaK0chAUIx?=
 =?us-ascii?Q?TiAoxm4eqX8qD6er/0haxWT4kpFqKuFPgACqlC0PqIAu98i//RbbJcd2cXH+?=
 =?us-ascii?Q?IOrc530ZpEmrGIPSdB5YO8LayT4jGYEufUA5Q08dPI6UGNNrEPA/MCghEljH?=
 =?us-ascii?Q?KaGukK5v3JXMclGwp2o7qcXAZzanONlOR4bYTKZkAmR6pZWFu2pQ1HQBu0+u?=
 =?us-ascii?Q?BvHXHDufO4WgZxAsd7sIWjLK9lJNhOx0sfYrj7jQlOumQLiGe7YNZMQlC3Na?=
 =?us-ascii?Q?JjTESqiiX0jzUAvHlh1ophzA5c5JaZeTZqL/qjutokxcZrMgPIuhCRqsQIOO?=
 =?us-ascii?Q?fOc1DY1S/YNHNFOmzjz01FjOyqRDt87Wsr5QB32AYKBhDh4QQNYUUcydCiKP?=
 =?us-ascii?Q?3DSV53B5vYtme3iu35uegRgvW/XtYF6yAbBm3ChULVAQuBkCzVvWaH03uZUi?=
 =?us-ascii?Q?irmyf4lVaNpGEXZXi0w9ODqWf3jNPVqCNBdnRdVLFvEZpIc+BeTEctP7csyC?=
 =?us-ascii?Q?JC5STmJDAiyW+KqcpImRkK7ObmAi1Kdg2n63LSXY3HBZm8S30Itz2MkDtraC?=
 =?us-ascii?Q?Of5QKULFdMHWdZ0KuvsGo3vNUEnuQVdqBUYUuLflbT9yxngFRZ6M38YMhbn0?=
 =?us-ascii?Q?eThPjU6wnWEDOpjHXkdDK/t2UAa+hmPyiJWbA2/25P9i6S47ZXjNNk88HwpV?=
 =?us-ascii?Q?o7CP6p0EeyAsuwTHHbOu2mjJF/TFuF5LpLxKHd8QgBL1CWamxMBu3etYv+He?=
 =?us-ascii?Q?sm0KUDyMliqFhOBFeXo3FUSBA6b7Sc92wVkNs6UabDW2CmYWZg9QmhMP69RB?=
 =?us-ascii?Q?fDRywpgtr05vnhtIF/rd39fRPLB9bPwBi0YHc8NpFzqDpHQSfi5Xhnik4Mdt?=
 =?us-ascii?Q?iljqoFmYynd/DEw+ILRYDeR3XLDKjUK7TyGMbDZF7E/VT0TJ3uWERpS5dPkQ?=
 =?us-ascii?Q?EIZDoQJhVyK1T4l2tHwCn07+XXrfuC6U+pcKEfi6WkkkOdFt7f0kbKZ8201B?=
 =?us-ascii?Q?9hsa6TlJt6n3V0UIJ6kOttzji3mhhil3bcfLqFbdIX9QOcTGekg+8JB/6woj?=
 =?us-ascii?Q?7a9JRL+2yWc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSBMKFA13jVD5/8BU3g1y2/nx+ID5xSV2+Av3gQMaDEiM2PzThe/FPTOodRF?=
 =?us-ascii?Q?vzYOH1KI9OXI0YK0in9vEFBUC9g6y0pgwEq9dB8ZCHuZgzH+PfI1Xb6owglF?=
 =?us-ascii?Q?7Ej99VC7BDQCg1xsabKxjpdasHtSS1Aqe2pM3hlNaxlRA8nVmvA/vyVa0Lcv?=
 =?us-ascii?Q?mryfXFzVXcrzcfHH7DpGa4n/sv7IFG6bCeJT4ABTqaqIiq01TNdz21+UuHzW?=
 =?us-ascii?Q?pR3msgaGtfb5Kao0Z3f04BMqptE1XXgLoG3WcYVuhIqDwul1wqrtTJfmRzgX?=
 =?us-ascii?Q?AxVW/7ePWSz1HNrQnA73l8KwhljxohLitx4n5hOVlTHAESS8s7PTGeNG9VtA?=
 =?us-ascii?Q?HLcYeesZvbxpy4csd+3hp8kLNmOvMCDgepYQvvGToufumnEhV91FXKCXnoWZ?=
 =?us-ascii?Q?O0C3/iQMNeHJ8/Xcq9xP2gUMPnsXQ53sWkmsWNimjszEp+aYabIT06Y4XMUg?=
 =?us-ascii?Q?RvOv1J884pTvVaroAuhjIW7rE+S3JVE08SDiqpSmDUiipGv5FMpUUzbw4OMt?=
 =?us-ascii?Q?fd9YdtZJVA1t+mMIGk11yx80Yag2WtLqzKEl9Zkq6JadmMO1ObsiJRNWXEFl?=
 =?us-ascii?Q?xraUhvgiVJbTjMerBf/zTYHkbthDqyhvRrEA+JB2/4tjmn6qoCBVTgQiD+xD?=
 =?us-ascii?Q?gSWslcotlPcMgVuzWaICExO3uOOIjeGo1LlYBCJ9xqbk+41CeDKU9DX6aUHk?=
 =?us-ascii?Q?/E62kF6UR/pRdStjLtacF0zeNc2/UVa49i/L8sO2PPKaMjFYH+DNBuDDPQSH?=
 =?us-ascii?Q?YpsIOQOjUDNlt/eT3cDX0C2ymA1h/3NCt5dmUfa38Abc9sfq366IXrO4wUv5?=
 =?us-ascii?Q?KbRvCz7qGEo2gbmvwnHhbyFKGg+foSlt/v7m/jnbJttyM2XhpXJRYUZT5i+b?=
 =?us-ascii?Q?n9XtpzVg2jq7ZAxcqBgG5xZK2SfH50dbBSXsU7kyvXsVjv0BS4vGSVozb0lg?=
 =?us-ascii?Q?PNYoLvwWt5/9tpU6UAwwNg3bmdskgXN8qHVVB1dJg9JbgZ7D7B5kWyLgV0s4?=
 =?us-ascii?Q?1ThzgI4JH8H+Kr9ma0H7NEgXsloW1mJF2/s89W4KHmk6MBkQ8KMaxBYGiHue?=
 =?us-ascii?Q?9qo/nKe1ShZ0+SBKjd1pHSgJj9Nolyx9KdrO/PuT4oV+xtzYf1WMafJRiUAv?=
 =?us-ascii?Q?KVtl0bXGmLZxlaaC2lcyrAWh+aIoaYTwOwoefdz998/+dMbzN1ivmn6GSEKe?=
 =?us-ascii?Q?BCgR8gX/0ybh4YClA5Tii++8scy61q7GAOScS31QKqH9q402l5bQp3ZiFlIp?=
 =?us-ascii?Q?MqakR/MnLHWN0Ya7Ly/oB5dko/RuKS/sBRWi/ZxCRlJMKOw7mEroK0Vi30oO?=
 =?us-ascii?Q?yDPc+kJAhCq8l4pmSvnDgTgXKkA21uJzuYXDbCyGx694DDIpxURmowMdhyZ9?=
 =?us-ascii?Q?mgHrFggFE+xxavD01cTg1vVEhjLZASX5rFBE8xnRtD5LWvbn08wqWSji/1rA?=
 =?us-ascii?Q?pB/Kv0xtG0/XZDrHlK0O1NpWOwajnatwF4vIZUBdcug0NJWFwpVNM8PxsOy9?=
 =?us-ascii?Q?QqC93msroorqlGZxvsKAMtKFgJumysPT2XldcDwPPfFe9VPNuevHhsixHlE6?=
 =?us-ascii?Q?n2QXndBS35FF9nSZWztBhyVAWkQwVSJx/gHbitjT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daaddec5-431d-475b-d472-08ddf5bdb3a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:42:07.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+/ExhEFealJCHO3s59O/sVbVzTuJrQaugPbRF9w9TCNfTzWtlbUa9avjHp5RT3It8a0CidI38A8gHxbgKHimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

On Tue, Sep 16, 2025 at 12:46:26PM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 03:23:53PM +0300, Ioana Ciornei wrote:
> > Describe the two SFP+ cages found on the LX2160ARDB board with their
> > respective I2C buses and GPIO lines.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - none
> >
> >  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > index 4ede1295f29d..62329a93a67a 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > @@ -31,6 +31,28 @@ sb_3v3: regulator-sb3v3 {
> >  		regulator-boot-on;
> >  		regulator-always-on;
> >  	};
> > +
> > +	sfp2: sfp-2 {
> > +		compatible = "sff,sfp";
> > +		i2c-bus = <&sfp2_i2c>;
> > +		maximum-power-milliwatt = <2000>;
> > +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> > +		/* tx-disable-gpios = <&sfp2_csr 0 GPIO_ACTIVE_HIGH>; */
> > +		los-gpios = <&sfp2_csr 4 GPIO_ACTIVE_HIGH>;
> > +		tx-fault-gpios = <&sfp2_csr 5 GPIO_ACTIVE_HIGH>;
> > +		mod-def0-gpios = <&sfp2_csr 7 GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	sfp3: sfp-3 {
> > +		compatible = "sff,sfp";
> > +		i2c-bus = <&sfp3_i2c>;
> > +		maximum-power-milliwatt = <2000>;
> > +		/* Leave commented out if using DPMAC_LINK_TYPE_FIXED mode */
> > +		/* tx-disable-gpios = <&sfp3_csr 0 GPIO_ACTIVE_HIGH>; */
> > +		los-gpios = <&sfp3_csr 4 GPIO_ACTIVE_HIGH>;
> > +		tx-fault-gpios = <&sfp3_csr 5 GPIO_ACTIVE_HIGH>;
> > +		mod-def0-gpios = <&sfp3_csr 7 GPIO_ACTIVE_LOW>;
> > +	};
> >  };
> >
> >  &crypto {
> > @@ -236,6 +258,31 @@ temperature-sensor@4d {
> >  				vcc-supply = <&sb_3v3>;
> >  			};
> >  		};
> > +
> > +		i2c@7 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <0x7>;
> 
> reg should be first property.
> 

Ok. Will change all occurrences.

Ioana

