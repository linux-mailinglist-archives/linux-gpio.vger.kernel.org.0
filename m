Return-Path: <linux-gpio+bounces-26325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C828BB8464D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 13:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F09A7A7FDD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C1D303C9F;
	Thu, 18 Sep 2025 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lduv8bEz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2162FFF86;
	Thu, 18 Sep 2025 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758195858; cv=fail; b=HQdgK6XyYZPKeRnqa31lr1BT4Ga8/kR4y3kqLThkHWtrcBR758pdciUuG+DQf+rPoaPUVkhS3UTguZv2MFfADhrME7g1b54nDh5LkP7DMIybZf8I5/TRv5m8HzrgC60UBVmw8MCj4UvHYskvBl+/2RIUJ1JekksJzhejKUbl5w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758195858; c=relaxed/simple;
	bh=O/lPxPXfb26MzqiZXdLQsEmEKHE+6+dA3PdVTSuKgUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U1hOzKTUYc/S8NpBF+tCa6nTMmsM464F6f4r68LDfKJEYjp0600Sw2Vt/qI1437pp9yQ4C2GdafAnD/MUMFJ44GMPVpkWV+PCRL9m+vDMllYYF1BZrvFjqpKzJSS219JCHLy+KyprpWRXtTFxPbvBBRVMUdeKSC0vV7PfrS2SZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lduv8bEz; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcvu+dcbL6Ke8WddUmsUuVYYPm35SrPt3jqYt2O32Fw0LHnea8KM+FqjVFCp/6yaDFBlBeturv3nh3lJ2mRuDSSE9+smLuyAE0cPnWtuOLx8HlDWO0X5V1xh1ywuH6dXIpO4rOg+uNVV+zvUlzYG1t1GA0HkCCYtOH6M2cBP+ALPGq2y+iKGF+sSAvGHud+VDd47YPtjnZjdLw6oIFYo5evdTFmFlpYQ9i6J6fASyQc5g/UdGQdaDJvpckM4VuLSuxl2WQRt14xlNinxkfNNqp2NqCw/tbDVi+hpbiD8OW68AbjaFTljNeGnwDLQMcS68UoMfIt3kczUnDcA9hB8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NFEG7EM8OmdzG5pQTZvIv8OIXFsk3arVwHg8tT4N9I=;
 b=yxb7Y/X/+F9v0OE7iQzdyzs1ExLbsfTh5QtUTlU6WRfuGvwTJr0RrMenicY6RcJ5E73lf+CztpRMiCjdOL0qX71k5Q80NpnkC4/a+6jomSFjCaoys3kLuPtflxIkAdzyIRnP0xvCwovq1ssDZRuSBruu8zvOP4/aQ6RV3XwKyzpdICVv7Fc149bjTHlWkI57nK0PDMQSODrXbn1BYVMJ/quBhaDpWZu4YRFYrFHXcQHvm8fPz4tFxZAw/sj3zOyqoD/rAxgku/W7QDgWR+MZVb5JYcxp+IVbkKHcbnDwsW92GcP16vZOPloyoVv9mVnqjq/kPSo1w38SrtXqzZ4pCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NFEG7EM8OmdzG5pQTZvIv8OIXFsk3arVwHg8tT4N9I=;
 b=lduv8bEzJYzfWdEvQRun0IwJEPvyFov7R9oZYZ34Mr6lBZ9nzvz014rN2MwaI5tNI2jt1E1rmzypQz03BrQ5mjWjZTFpjzRFMbc5cGfY73Am4ardk+7XAuu7wfUiE6fdlznyQLKZqiybu9CK4B37Oth9iO6agYnkWdndi1EZuRbD39z6GQBgBAkda4dHvZEv0jSyXSYa17eKDI5jLT8oIJWwEkVflyARQMhA5+nSq/k18dwyCg5V0aoQeZLykjOk088PenOFezbc2ChoUcKjRU4LF/FWEGteCvZHJ8gjZpHJH2auU+EuPFlj/akm+qVMxjkenTZeATP1DrdpoHX5Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU4PR04MB10790.eurprd04.prod.outlook.com (2603:10a6:10:590::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:44:10 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:44:10 +0000
Date: Thu, 18 Sep 2025 14:44:06 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: fsl,fpga-qixis-i2c: add support
 for LX2160ARDB FPGA
Message-ID: <hp5cothkqfs7hbviesjz3mxr76tjxolnccweuqpfwxs5m7aiqo@uer253tr67z2>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-3-ioana.ciornei@nxp.com>
 <20250917-document-enhance-4a6cb6053882@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-document-enhance-4a6cb6053882@spud>
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU4PR04MB10790:EE_
X-MS-Office365-Filtering-Correlation-Id: c8663a16-8b41-4750-087a-08ddf6a8ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JzP5sPZopux6tbJeSSTOB8ihd20ablDTEq3Kzo27oafrhIkh3RHl/dfqqHyW?=
 =?us-ascii?Q?roL34Av+gWdDge4LT76IOCgzK6imV16wWu3+32JQx/Dvy38HhD3UDdJSORGa?=
 =?us-ascii?Q?nafxVC7C2RYm+q4OoMMu4who1zq+rey/CYefUlg9sS3XvJlMQgC6Wex8gWWD?=
 =?us-ascii?Q?Z0tNCBhApe/cE+Vt6G6AUIqOpHjuWVB4GJcNIVjesVJFWitdtniWAlrhsQkY?=
 =?us-ascii?Q?UpYcRv2NjBLXwciHMkjBIlaGJyXQ2b4w/BnKxutostmgIsJk1bsHWWGdIGdW?=
 =?us-ascii?Q?sKBFooIYl0xyMSBb3G5o/UG5xw/FPTjtODinzVNH3dyzJYQh/faxriypGG87?=
 =?us-ascii?Q?rX25eiEYAFyu8jkrJ/C6I/uK+izPZuo3FW2iu07zoq9RxvBqoe+tFUeg03pX?=
 =?us-ascii?Q?s5/OtiwiTnhEweZfG+iaCu4DOAJqJWg8lAJIL278CpS/fEdaBijI6MlWnDYu?=
 =?us-ascii?Q?izzXaRa7eGP267qQSw/qsk2Po84TxQAOrtAydhzs3HghCJhEn9hVSL7k+0Ub?=
 =?us-ascii?Q?msXviWsywucFjHsTUpuSAHebC9u2NUdp6QKwgK6PPvFJU9e9uFBJPLrPZ9Fm?=
 =?us-ascii?Q?f/tmBzJ6yGmGA9+pnhZjKjioxE9F4VDAVf4F/J6kPoJu24PzOYwgXQvTRHab?=
 =?us-ascii?Q?dpWnTe1Io6gWg21S4Hu6RJtXsELKczwGZcO9bo/TmLAOkDaaBDPRPCs59k9X?=
 =?us-ascii?Q?UiQ++SXd4qv1w0fG5AVRr46QHJ7YEhksgqwSNRxV6Dj33+E50LHcoYXwj6jo?=
 =?us-ascii?Q?+qxyu5+KyHQS93uKEAx0HgAvgH1ciZuo9/8LimfHAVFWoVVumcBuSzpafla0?=
 =?us-ascii?Q?HYONWpjzuUzV6Y0IBR0zBL1Q+PUB9eIKBmaKWV16aaxgFYjlqPL2MbVCbHjc?=
 =?us-ascii?Q?UpwOLlhFumySIQcWHWyq/hrfjgSnoU6+cdbLzzeh7jKG+jVrP/lIjZScl7iz?=
 =?us-ascii?Q?wRNYgtR0ER5LXpEnsZTFrbtqH57kpz8yFsyp/mslXYk5Osd/O+MM0HBcCzii?=
 =?us-ascii?Q?hSKAZ/NhwPFujMW67jp+z+pBOGnPCSKmz4c94E81GL0uKTqAN9b6Pq4TvfHJ?=
 =?us-ascii?Q?zkTjC9hboDhR/7wqbiRMZ0E/tM+5O+/Sxnc2Ly/jkkzQI/rBrVhcJUC1r3QK?=
 =?us-ascii?Q?aXeTJeNrem0Aic1yCfuk4P4xDox4hp9iebwjUvkMnSKiaXGyMeiQYy+c/9hV?=
 =?us-ascii?Q?PMyqKy3fe1cft01QjwCrvNIWCIGzG1dmFofR5FR5cj8WS4lQMk7c5utoH5Du?=
 =?us-ascii?Q?FzPv+kJmcZK0iAGepEQ1Qxw58IXcCmNkTGZtpsWvx18dPEOFjfJwq/qqYeWL?=
 =?us-ascii?Q?vv2rH74I4q83s6Zi1LSBi+GUNsCeZO4RAmKP/SnxZZG5ri9bZYO5ebKWZjE1?=
 =?us-ascii?Q?XJAbURkGQ/CaelFRoaBjf0z3F6Oj8qx1cFECyXxrZBgMafuSFiPtM5V5aswn?=
 =?us-ascii?Q?F7vCa+8HkUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sudvabhdv9Dj7KFOiXkwWcOwA3+nbnrzXtV9w+FJyPK6gAZYbescragHZsVa?=
 =?us-ascii?Q?cI2DO9DUwiG/JsL6xFYm/UKrLVlyIJtruU0awgiBPBwKagJffGf4tAXNFwgf?=
 =?us-ascii?Q?gpFDmoP+/qQA1qMgaznhg2F0xX1UuiI7kFjkqpfmA7g4S+XNe5PR/LtP6o6U?=
 =?us-ascii?Q?pRKJLmGoGBaoi2etTvL3HYvo+J+qPWmevYR9bpFwoFZW0eFB/hj3tMuWbOH4?=
 =?us-ascii?Q?WMAbdgejQNXt78+Tx5x7Gi6UyDim+/pohyvzy/3o88/2iBvrz12AKIHASiFg?=
 =?us-ascii?Q?/BjSnePofaErJMxPpXi3NoGxUNkkOmGLX1FY7jKsZvkS2CAgMYvjU4emZJ2L?=
 =?us-ascii?Q?m3bbDCUZ2zrMeTO7zOoOxsB3oNYVA9VM9UQ5Lt3TG6A6ZAgVhbJ/T1xKCgjl?=
 =?us-ascii?Q?6D2y5sP7bLsFZqOKtDI/BUwAeS6n+2IN3YNzqVmdoKNnM2ANU2J37HY5g1tF?=
 =?us-ascii?Q?GnB5GnHcA0vE3OcV8tebFaEafPqVYN4jH3f6nZ1PpTHCOf2/VPnGWTCCn6jk?=
 =?us-ascii?Q?daup0qC0jHjT13quwTIfyQb2YtJa4JUl3ndqbLsRfakUKxrT3GVALVtycj6f?=
 =?us-ascii?Q?S0EmmHK9KR/Wkky3ayxvmHZBMyr7kXv+3RdKTHClQD7AWFi69zyhdtBsOmIf?=
 =?us-ascii?Q?ULSdZgLGJD5OTUlxll16pknZOx82ojaC++RWKBNpsyjSX+SCcPnjwIw9Wv8L?=
 =?us-ascii?Q?xCDtAn+pXCOKzd3iBFx81Xu64zXmLaQd31yWbRv6qPzb21VWLcSsTDhEMhLt?=
 =?us-ascii?Q?G2emKJGZ6V31WXP5OAW11FMpEegAaV13DPXvyKIMg4kaWxAsurjBtqy4iVBZ?=
 =?us-ascii?Q?TLX6JN5P3v0OWXEMC+qtiPSnO5hKmD30D+xumlW74a7IaKsxFKDR0SqepM36?=
 =?us-ascii?Q?DJU0TV2j8ZgpejYZcfg96KTIeGgy53gAaJ2KLisRTdlUDopIJkvRl8IVr21g?=
 =?us-ascii?Q?5vlwl/JeX6AqkfSIgbdQHEOhRZ2N4jgqRb5JcTKM51799jrJac8IcbHMG8HP?=
 =?us-ascii?Q?8fr/JA2i2u7vXDrxR4u78kauG9dAIRqXsVUS61pta44hFUu8AdNquCdcmWV/?=
 =?us-ascii?Q?J9Zyna7lXaBF0C9BXl8hW3EH7KALHYU1bk92HBGVLAqTtrDtbe9Pg/TrUsWu?=
 =?us-ascii?Q?OwyV/lpU+dXAcCuKAk6P15iIIauN0cSKN+kHd484D6GbawEt6hk/C6whqZn9?=
 =?us-ascii?Q?PWI1Kt6HyRWtgn3IDvXm6eKXAwp2WPJpaNroDbM1ZYVjuNpNDpKDzeP2QlUr?=
 =?us-ascii?Q?xRxYsvu+zSvtBzaXDSmc1dcKmMxTzDxZJ4XBDzt+k52s00zUfLkM3Zo3CZFk?=
 =?us-ascii?Q?A6R/1HBVWhFoMlDmbkNLhixrn5jdQkmwCUhAjhF6uzTaOB5oLfALrU7Qoa7d?=
 =?us-ascii?Q?VAKTqGv1VPF+kPL+mhqLg2PCaQYg7YNUPaKLXCbwodLgMqCtFYn8S2VzSumX?=
 =?us-ascii?Q?97GyUbu0lMk97y8lu2GNUjQ8GOSk19C3JpzpAQSGGUKtBfyma7H8DWnvpkrz?=
 =?us-ascii?Q?Kt20X2Ht7UODt1hwWQOaoi5SH0nMUxk12Q8kfQuGI68Rl1TO59e/y0VwCfiP?=
 =?us-ascii?Q?6Xj3L1/Zsk1dgIcKUbOsYxj0LoDDxaCS7Qq3kOsG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8663a16-8b41-4750-087a-08ddf6a8ae6e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:44:10.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tqv1HLSKL3JXC3D4JdxJzbIyEqq9inSeVQWIrh3AlWIvNDfiAeIaMCUFNhPn2wQW/sW/xY5Vbur6dGdRC4USxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10790

On Wed, Sep 17, 2025 at 08:19:42PM +0100, Conor Dooley wrote:
> On Wed, Sep 17, 2025 at 12:04:14PM +0300, Ioana Ciornei wrote:
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> > 
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property.
> > At the same time, add the #address-cells and #size-cells properties as
> > valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> > addressable.
> > 
> > This is necessary because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location in the parent
> > I2C device address space.
> > 
> > Impose this restriction for the new compatible through an if-statement.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Enforce a unit address on the child gpios nodes (remove the ?)
> > - Enforce the use of unit addresses by having #address-size and
> >   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> > Changes in v3:
> > - Replace the trivial-gpio reference with an explicit mention of the
> >   accepted child gpio compatible.
> > - Reword the commit message.
> > - Add the 'else' case to the if statement.
> > 
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > index 28b37772fb65..e889dac052e7 100644
> > --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > @@ -22,6 +22,13 @@ properties:
> >                - fsl,lx2160aqds-fpga
> >            - const: fsl,fpga-qixis-i2c
> >            - const: simple-mfd
> > +      - const: fsl,lx2160ardb-fpga
> 
> How come this is not compatible with fsl,fpga-qixis-i2c ? Seems like
> that device has a feature subset of that one, given your changes here.

The feature set exposed by the devices is highly dependent on the board
type, meaning that even though the FPGA found on the LX2160AQDS board
(fsl,lx2160aqds-fpga) works in the same way in terms of access over I2C
as the one found on the LX2160ARDB (fsl,lx2160ardb-fpga added here), the
register map inside the device space its different since there are
different on-board devices to be controlled.

I didn't add the fsl,fpga-qixis-i2c as a fallback because there is no
driver probing it and it seemed to not make sense / be necessary.

Ioana

