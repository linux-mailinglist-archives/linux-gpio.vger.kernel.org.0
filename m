Return-Path: <linux-gpio+bounces-23004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC28AFEC0D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A11189142F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204E02E542E;
	Wed,  9 Jul 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KDXN8jcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012000.outbound.protection.outlook.com [52.101.71.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468D2E3AFC;
	Wed,  9 Jul 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071520; cv=fail; b=A0U+f5WwbD72gBrZYKIiPRII8uhyzjzoiAiJyv6T7DbOkHyzYn6MCJ6ofzc/bewlqxLBoy5B63/Q4Zw8QVT0EBxexip7luI+JjEVua/HFJIEPVaO9/FzIHFJKwPlGq/jr0pECTCl4iFY/HAp5SLtFYDnOlNR6A+cUaddQh21Q5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071520; c=relaxed/simple;
	bh=xfZOx1Wp2TSRdzyLsXun/wIq/MjDYT3/O7xYqAKF+eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Twe2K4dPSF9zUcdBt5rFh23pudtVzIft0jvFGkBTS38mpw/Gt+9HrGtsvHUEMbFuGN0+MnTpjePWRSRRb/RUOJrtng32LCRLmxuq4poAA2erzFhEdIgZlB7wodtY67qAkGc4UdmAXQKIgXI4F4wxb4siHMUzYt1mrmJ/+AIgH1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KDXN8jcT; arc=fail smtp.client-ip=52.101.71.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMmgYYaafHJscSwAWJLfY6qrionfvyMsGP3Ujs2Tdhv1PyunKlIRcVRz2GMfcSbmlTiOq1vyLN9uYPfF5h27tQ2Qly96S0H84ThpgP4qJbHYuTimU5AK13en7Shh8B1iK8GlMq8f0Q/upZ92Ed9H8yayn7x2tob4OOGNCFys+snwighbPisiE2Y8EikHvKq+qVrsnzpOYCXitObDY3QxX5lf0DhXPukvnPyc9lumcHOUZ6lwk/8izfJxm7HS5QTQWUlk5P1sqYoWAB7oK4TddFdvHdme0b/kCylWTi1jSGLjfiuBLa2I4SchmUw1QWe/3X6sFE8vfJ7r5ji7Mw+6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXgJS1jxWxWoxeeFVTathsZ5NI1B2aC42I25gi0Y0qI=;
 b=N1A7i4PWDizQf3qTqKGgIRFIuGkLTp8sTYPQIqUJWmzSTtajk0m4oD4AzaFVuizMrgIUsUHS3bxN8OuI+ew2SKQRHKjN14ReprTHUya4TMUYyOL0RzCpnUHR5Y8Y8Syaw+s4g+VNUXJwXTL44FEY1x5/Olfqf2UpcMaCRbr/6no+Hns8b66NAhOZCj6hYQhYXkyKPFSJevO/YyqHLsOAJjTazs5KgJN8aeoGRz4TzQpEazXOEENejCeiuZnyrG84xUCg5mtW3F4NHCrUthEho2fvwBpbvdIJo1pzWQ24zb+l5A9UHwBjtqsVXBsv5VKy1zmrfwklzW2dKTP6uSI+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXgJS1jxWxWoxeeFVTathsZ5NI1B2aC42I25gi0Y0qI=;
 b=KDXN8jcT1r1DuOWFi6bdomvq9fRdqBLpUYvWOmIXF+EPmLcp4U9FIrObUwDexVPl8Jr2+T9gMLlYZsCf7Pifco6XgYqBomVJ80m+YCk8q++CXxo9AmL0xn8sKwRv8VEex+Y9eCKgy+XE9VPgUU7D1rSiwa+UGCV4AsjrXH5Lzsi5/EeUsCOm2uuJN38YTUZXIPZfQUlT23Sdn31G3hsBjTwaT52TTOVFve3cDm+gxLFiXWvgYqZkt+oT3duCNUv/1P0rkIxbqxsayo5HeqPjgIJ9KmEfJEvWLK4crIOgS6YMmsuG8D9/7RvaxKO+Cv6LvXQea9CHmx6RRZ5f2aSIhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB11488.eurprd04.prod.outlook.com (2603:10a6:150:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 14:31:55 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 14:31:55 +0000
Date: Wed, 9 Jul 2025 17:31:51 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to
 also cover the LX2160ARDB FPGA
Message-ID: <6qeqx64uwhkooe3f6g2eid567rg4ubh6djdtybwlg3oc4xdyaf@sllekrl7wzea>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-3-ioana.ciornei@nxp.com>
 <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB11488:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb0bde8-626a-4bdc-6431-08ddbef55a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sIvNfzQRh22gSxva4Rl4ugbhEMUHn588R5xHfmrmgjrjN/TAPfKiTHHnXSK8?=
 =?us-ascii?Q?rjhNasghIuXvN4DyaZSe0e4wEMCjmxtbmbNmiX/mFT+5jLosJjG3jgmdsu5G?=
 =?us-ascii?Q?mYlXrSVi9PIMyhQ/vhQ5wCNZCVvvME1D1PZq0ckhS5vP5/B3B7OloVHKRsUJ?=
 =?us-ascii?Q?XBAq7fm5hEimZbkygrnt8hoMuoNserJpwcpYP9Wh11d89GaDJxlmj9Nch2x7?=
 =?us-ascii?Q?TgtbqlH/JL95oFPgY/vRvwmUxLLi9acNLXysAf0+KKbAz7pwBEngOSsrWsVG?=
 =?us-ascii?Q?nw29JHd5FhPNHY7mvhjfPmu8HqAKNDSfDjj4yDmtgAd18bqO2VelJgi5/o76?=
 =?us-ascii?Q?BZe77lz8OSnCI6sIRfxbZbRE3XMKCST1uQzMUYIdU8Iw3Td8zNXW0jKq0HhX?=
 =?us-ascii?Q?eeq1rD4y/XSuvL7Tw2X6fUXycpW5AhRkmFRzP8qpec0SCHKye0nWMSsLetHG?=
 =?us-ascii?Q?ozVPvzEp/PU7T4O/guc9kTbp+nm161W7bGEBIccy9vTU+j5Op3Lk8jsaAvEC?=
 =?us-ascii?Q?ir3xta49MiHudk+2NtHpwcFJaLo/i2itpVYVvISW5UkGdTejkNC8rBuQDjPc?=
 =?us-ascii?Q?3Kpugj6d0bpMbBb+tIIjT8/Enw1Nt0Pa+XoWoVn4pPX5pwaU1zK9yASZKPKU?=
 =?us-ascii?Q?jkellEim9h7HvR2UEHVG5Of9lapmB3Jscp/2NwM/v3Zug7lMGkx3iK55OTv8?=
 =?us-ascii?Q?xxoL58EfXJsn6n2U3HKMEj6Q/M4Tz9ZRTqYsiDSSlzz0m1E7Ejqps1nIkB4w?=
 =?us-ascii?Q?dxWtYiZxZbEqx4yPLd/BAn5oQsvgXrkJUXsjQCR1Hwv2k9qX60XchDIOhXGc?=
 =?us-ascii?Q?6/U98hfRu7bR/U6p9B3dZoFLZNiTlpcCbPqt6VFUYRmGFV+Oi6ULiXgYGew7?=
 =?us-ascii?Q?xREko5efh0WqvfbVWl01poTBveWZ4f6NPX8gHx42bJD4jjcm3CNLXsypqrB5?=
 =?us-ascii?Q?VZchEQorw0JWHjGgiMteItvzoKsogiwKBrrWaLfhlWgp9ssv/gfYg7jJmcUg?=
 =?us-ascii?Q?gAYhZ49MkxKV/lZagZ0KRE0X7A8Q0+yW0b1Xw/Z9qUTuSf/H3RN1lRgk5vkA?=
 =?us-ascii?Q?3Nk+hjaMo0fDVOAjW9l5bSYGNgILy/e95oGKrZ/2bL4e2i/NKENFcUR/gDSk?=
 =?us-ascii?Q?gVAcR3KMbFYIIE7M0knohsBsR6F8P93PbD/cuVpUSKA0FdGjkA/P1HRARUC9?=
 =?us-ascii?Q?btdlNgHHzUwLbabEcHiM60UKX50DfO1/3t4RWW2InPQw59gJQf3qHjYB+Psq?=
 =?us-ascii?Q?fHOxjF/FYxKXSDNYaJZDKzc2dbbWj48kJ/VZFm2VFFabZwKtOPlrYrBBZNJ+?=
 =?us-ascii?Q?SYyO3YLi8nP+Fu0hmqHyAlFFuAax0PZwCSBBLK9I+MVnODA7ArF/jOehZsVM?=
 =?us-ascii?Q?6PVEmDxJbuDJdOqAv4dhQ0FyfgGGsC0vi0T3Y8osXnib7MOLgSn6kG1WeAXj?=
 =?us-ascii?Q?mWCTIK7On1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OYrQ1fruYI95ygMRpSbNA4JFtkBkVJWcJ1Veh9dvs7mJAmFpcUUybeI5Qep7?=
 =?us-ascii?Q?G9iR0j76o3DT9H85Z2TqRMaUoHDf5tG8h6310np2qPuSSf25K0fX+U9O1uIM?=
 =?us-ascii?Q?+mH1YJFS9moGQ1KRSaekk5GibViWpizGESrUGeylkPy9pi0OH6Wo3kht9vJg?=
 =?us-ascii?Q?ACVcfs4cCfpnvnrQeAkSndn2YFUr155iBs9fVjzggDXONbTjQ8OnIX4vKyNC?=
 =?us-ascii?Q?7upbBY64jRQ208ms6W1zcs+TrKv5uSsPyGcHlLXQmK+3T4du7yqIS76jR+u/?=
 =?us-ascii?Q?oIdVx5Y3Doy4l8iIsotx14ngEdPiGF2PU4KYnB1bf5dLT/vFLwcCcheTL5CE?=
 =?us-ascii?Q?xBP1mOS82POVnK+fBjJbpGGiVrch+9r7pJoNman5DTD/ih4utaIKLS6YepHA?=
 =?us-ascii?Q?+Bntvt40mIhnlgevKYh8NbQ914BskedMxQjdp00d4KxwVtu5JRu6ZwQ4eWDM?=
 =?us-ascii?Q?PireW6fZfGpeRX7KevNjL7mBUOp0QVV+MZ9EultTsYEVajki9R6OiXitm2rG?=
 =?us-ascii?Q?9bPLENpaPHSLRTVb9muB66oTgmTmlpb/UfWFLukt68xAYEXKc9ljbE/daL8E?=
 =?us-ascii?Q?FF85yJ3ge57TgqYM1comct+yiVHkN24qI+UUCfLL1MS5kO8p2V60XRh2u2C+?=
 =?us-ascii?Q?eJ0je920hVzAVJxgUl9M7b+/CJLnoU6B2UKf1KFchEA0Bs2xi0zOGUcPNWJp?=
 =?us-ascii?Q?HRnN5V01X1WExfqjCIyB5S/HlCnBRKf8WjO3n9NZVsaOMlx9YIfKlrlHBvrE?=
 =?us-ascii?Q?WwN0VcL/wLiMVo22/F4YPdFK/hComqQsVavzRJ9ve86GPhd5HP6Rlb2rtWcU?=
 =?us-ascii?Q?bN+j2XChdql4HAC2EqPDFhrgrHvSVKXuLypXC3+LiedCqGUNAAJV/zufZ8yY?=
 =?us-ascii?Q?72935KsihkWeCqvZNNSOh8RKuQgtlicpUNft2ASEotxdnfV2q/STOEoPJuJC?=
 =?us-ascii?Q?byvevYgupRf10bIrxICQ59iqO1kr/4TG/+YJAbvxh0wgNe2BieoWY4oCbMxb?=
 =?us-ascii?Q?jJBHiVrpVhm7A21ZR+FOtstLKH+JgzBeyJX6HEdofJNrlAt0OpvD90CRW0u3?=
 =?us-ascii?Q?560psRv1Q0/n2blgBz8omby4mIgkboAFz6hdiZNnflAF7RUf+ZdEL4xmGMUD?=
 =?us-ascii?Q?Uoc4XJVrd419hCmvhRoAgCQDoH3YiLU0g2n9IeIh8Zkd6dgAPJyzALU28ZFq?=
 =?us-ascii?Q?y+KXlGRaVu+RH5QjgzW20cex7V1crs40YODAi2iZCr+NwmELzimDWUOa+1pd?=
 =?us-ascii?Q?nHylXwHj5GFGqw3tQe1WyIy9KdhzXBTwx2Dr0Dhz8fUIc3xF33G17fzYSN1S?=
 =?us-ascii?Q?zgEXdJDv4WDdl3Aq1aWEDQa8JQASVrMvup1qK7V7oWegN0AZNywUBg0Z3y5Z?=
 =?us-ascii?Q?ILXx9SURjTzI2Tfr1thZIZvsdqO0y/tE0X0Klw5T9JAJ0q9gpRif/yP+IITW?=
 =?us-ascii?Q?B733by/wpw8V6NCOCMxhztEoi6jFQN0IWSDPWWGpwfQJ2T87nfWsiRAoNRnx?=
 =?us-ascii?Q?OOlsIRPkoSTqIS9SoEMdirt1Q7r4dJX95IVmj6vD/GS3/HtrL/hQ9RLX4aW7?=
 =?us-ascii?Q?k0oe7hkWcVLGkLYWFsDQwjSzIuGWdteuJv2hxbKi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb0bde8-626a-4bdc-6431-08ddbef55a8b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 14:31:55.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hNhnm6rNYJo2HxoI5fzU45JG2vdJ1Qee7vX1ZxmpBR/aKAEptlOGwp64d2kr5mutuTVNE5CGsMx1O083neYrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11488

On Wed, Jul 09, 2025 at 02:17:27PM +0200, Krzysztof Kozlowski wrote:
> On 09/07/2025 13:26, Ioana Ciornei wrote:
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> > 
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property. At the
> > same time, add the #address-cells and #size-cells properties as valid
> > ones.
> > 
> > This is needed because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 35 +++++++++++++++++++
> 
> So here is the board? Why FPGA is in the board...

I think because its usage and integration is very much dependant on the
board? I am really not sure why it was added there in the first place as
a .txt file.

> 
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > index 28b37772fb65..e8981f974210 100644
> > --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > @@ -22,6 +22,13 @@ properties:
> >                - fsl,lx2160aqds-fpga
> >            - const: fsl,fpga-qixis-i2c
> >            - const: simple-mfd
> > +      - const: fsl,lx2160ardb-fpga
> 
> Weird, your first patch added three compatibles, this adds only one.

The first patch added 3 compatibles for the registers exposed by this
FPGA that act as a GPIO controller. There are 3 compatibles and not just
one because the registers backing them have different layouts, each
exposing different control/status bits.
As you have pointed out in your last reply on patch 1/9, two of those
compatibles can be merged into a single one.

In this patch I am adding a new compatible for the QIXIS FPGA found on
the LX2160ARDB board so that the simple-mfd-i2c driver has something to
probe on and expose its regmap to the child devices - the gpio
controllers.

> 
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> >  
> >    interrupts:
> >      maxItems: 1
> > @@ -32,6 +39,10 @@ properties:
> >    mux-controller:
> >      $ref: /schemas/mux/reg-mux.yaml
> >  
> > +patternProperties:
> > +  "^gpio(@[0-9a-f]+)?$":
> 
> Why unit address is optional? Anyway, this is wrong. You do not have
> ranges here and earlier you already said children do not have any
> addressing. Look at mux.

Agree on the '?' not being needed here since my plan is to enforce that
if the dts has a GPIO controller defined as a child device then it needs
a unit address.

The unit address is there to convey to the driver what is the address of
the register backing the GPIO controller. I am not sure how else could I
cleanly do that.

My current plan is to:
 - Not change how the board DT files which already define their QIXIS FPGAs
   look like, meaning that they will keep their FPGA child nodes without
   addressing. Very much like the mux is used currently in the
   fsl-lx2160a-qds.dts.
 - For any new boards that need a GPIO driver to be probed on one of the
   FPGA's registers, impose the use of the unit address.

I acknowledge the fact that this a bit confusing, I am open to
suggestions, but I currently do not know another way forward which
cleanly does what I need.

> 
> > +    $ref: /schemas/gpio/fsl,fpga-gpio.yaml
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -68,3 +79,27 @@ examples:
> >          };
> >      };
> >  
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        board-control@66 {
> > +            compatible = "fsl,lx2160ardb-fpga";
> > +            reg = <0x66>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            gpio@19 {
> 
> And what is the meaning of @19?

The register found at address 0x19 is the one backing this GPIO
controller.


