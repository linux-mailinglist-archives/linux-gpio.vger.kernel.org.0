Return-Path: <linux-gpio+bounces-8216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52B931EB6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 04:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027642819F9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2024 02:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BA46FC1;
	Tue, 16 Jul 2024 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ruQz1qsv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2012.outbound.protection.outlook.com [40.92.20.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC8AD24;
	Tue, 16 Jul 2024 02:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721096222; cv=fail; b=Zg7B6NekjSRPzF0ki6aSeA+cMRM4q9oIjE8YSXRSO/iH2E/c5MoQvKo13LiddWDu+SI8I48YovMaFti1g8gVOUjln3ZtLVCSX0378edKSXMsFWVm3HHUrlm+hW9Sm6KYS6KkAw0s2MX+6eoTkzUfV6mVQapaAVOVx+GZcTDWuuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721096222; c=relaxed/simple;
	bh=zk7RRXnFF4DTEE599YlFYxiJBgrJy96N+Jlyz0i9mJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OPv+8JtrJN/Vo1xKB/dYrLIR1jKyoKyyz28uLCbQelgSxg7kMBx6WNZAN1dpS3xPPj9dZL/7+dx3L9+EIsDXYVeeYEEhphxUBg+0USJIOD6WlWSuPhpjHV+WH0ilWJckyAHoMq/op1adfa459Pa6M65V5fquT8oJQgh46Dhqw5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ruQz1qsv; arc=fail smtp.client-ip=40.92.20.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU83606YpqmL0Lzfj1p389E4EJVUE6db00yMD5XK3bwI803DWBgB9xGtT/Sm2Lu0rhC8BA+qI79rSejdo9Zohstm5Ce82dK4EntlXG02s1D5CwSPiUTWanutnNaroDvXD8Jn8PizkOEi0MVvU/hi7yy9XxwR4dayCUwz4kGNrtgvkCyABKdP0N0xrXnbX+5ZlieOTJGM8yatf1s7VUKRkYKxm1EbdRUgs+q/uYGPX0/l9qlDVP9RA4juUl8DtjUMjex/epq03e/Jh/ZCu9p5Cy+xdYxH3Hk/5ruynuwKOwj9YPh6eJ5vvpeWC48ALWiXS7qvPL7tuMZ93+TmH8DpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7lmMj7eWc2SezcTMgvW0xsBrU/KFU3BOtQtEUGWIis=;
 b=tgSiD94Va4LTRUYnQdt4PPQr3OKz93wPFqrLS+QxdCh2CRM9Jb1XqxHhaUdteDQh1RIcPFkrNW2D8uEI0ohVF262kNMCTSyYz3dyTqMX4mvx8GX3Kd5mpyFzvJQ2MvdDE/JtGL1v+b+4fKQmWx/jRKhsmo+YDJ/fEiTWgGDdUPQaz8KtYjhA4Z5SrbBI8CFc/RajgenLtjm/DIFom3npzNl6BH00vV+LgiS4A+t+QnUuK9mM4mlbQzOStiY4uNUfbf2Y696aDzP2ANO226Tfu/WjftL3ZolTiLVNFu63L/hIVD80mK+liZu5zZCeb7sdRL1o4PnXrx/qmyLpTE5z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7lmMj7eWc2SezcTMgvW0xsBrU/KFU3BOtQtEUGWIis=;
 b=ruQz1qsvhK8kxMJlWgSO+tt0tdwVjg8BcDlEOAh0TIeSCKtw/arI3F7UebZbIVk6kL28okxf7/b7yJ61jLexN2h+/5cPZr4naSupTDW9AAyayYF0YGRjnQIFlBmjdwRCjlQZNiaX9JGEMJ538ZiGN9YJZY0a2krUjIVw6np9HBQfBsWirQIHe/H6TEQENWek0mz6U7ReXZplhJwNptrtY11NIA4vgmIb+9L5tZMERiOBejq5OBrqY3pjl1Vq0D3qGHT4PC/GJQ3/5VFTh3IJ8gGDyLzb+VTajLuiXZhYfMgXe/nEGzl6F0A2UtyDTB2aH8b2v5hcKcjja2R9RDs3rA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5737.namprd20.prod.outlook.com (2603:10b6:930:84::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 02:16:57 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 02:16:57 +0000
Date: Tue, 16 Jul 2024 10:16:47 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
Message-ID:
 <IA1PR20MB4953747880CD84FCB5453608BBA22@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
 <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240715-strainer-creamlike-b1ff49b25c1f@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-strainer-creamlike-b1ff49b25c1f@spud>
X-TMN: [IZ9F28rhu5AN4WQT4+5GH6BfaFHS8Lgt4rnvAi5R8YA=]
X-ClientProxiedBy: PU1PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:803:16::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <lyr3jobkd24q3dzbr2u3lmqocfpk43faducvvw23rpruocwmj4@2dea57yogrzm>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f3e55a-dcef-4144-d7ea-08dca53d5e27
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	X6x+mqHkMVPqojaJvXLmeu4FluWHtYhg5itoGUUPfE6hmo9XU4HRwsNxHPqDwUeCF+nvgozbwSNAJvyBMXJ+BXpaFD3l2Y/vv7PyoB+odLws7mrQBUbRekU8MQjqeV4efuV07TwCkTh+0LmqESkvQp81+g9ME2Wurvgd4aiJRjY6K9SR+LRkORXJvyUh6vYn/1xmkrZtPzU1eC5oKEq9D49c1OC/udBUPYPB9HTa2/aGLxT+houX/Zol8ERf1jpmouRR4sWtVrxE3XvCnu41KxiCiXdo72Fggn3ZwK8EwSjxOVwZl1rXFXuTehdEyIkb4KuRibvHiyZbHRIJKVxiG9qPsjWgBh9PDAh4BcU7ZUCoGUNk7vwdVOj9VQunefzNb6jzniLzMneBcp4KCl4XuGpm0VmtoVUqP3sBjVkFM1nqKR4FF6XdDMTwQR7NLGE3lQsO2fGcgj2elYoXO4L3r1adgaf0QHmLuDXEjFcJMMRzyIXJeutWDAELBkvApxD1UHb0VCJjc3xTWTMczACmpRaYw+3eH/4DPWDpwqpxrt7/HqPbBsnhzeC7HLvg0Xg2qp/zrM8Mc/ursilJFcGqgVMJNSMcHb4SEuDOkE3OO+NhTeboDUnHoxOIUeU3q4NEQcE+7xysyE+a9nWa8hVTg2taCzWKW07y9QdSXnRnunO4PRCm2iesRqmUoTpxkOr7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ScDdAKWSHJBEtSAAeC1lCi+7HSxgG/BksEiIsSsCQx81aFmO4vvaTVEevjr6?=
 =?us-ascii?Q?Rm/U2ztOACHGeeXU1y+KTWv6A2D3trd8cEUWrkFnROpkh3rnkvrq7Eu+gw6J?=
 =?us-ascii?Q?Z/bSPb7lUJ/SNCKBJtyWHDBPWmpwy9NtCLCrxBg7joIZrg6gW+/dMPZhqODe?=
 =?us-ascii?Q?ZI2s0MEHMSXDxNeFquo39l4mEOK39oMUadbJ3N9El+Oheb3tN7FMOCTp/h6l?=
 =?us-ascii?Q?5vEyItbf6xxF7DzCn2h6tN+/IUXCgRFOBdmtda2wWcmeIUi/6Hy9M0/yDwIQ?=
 =?us-ascii?Q?Ic52lkQ0JKIkwsPyWKnWppaOl0TROf/Lt3TKI+OgBmy5LPHlWhUviIzTCrC0?=
 =?us-ascii?Q?LTJyA3AII4Khh7i+i65kjaIHrO8Ko7tb5gN8FYLKQzF64Qmj3VRhSS4UCkQz?=
 =?us-ascii?Q?YldkFjLh2eJ7a2Tg45PoabaIZVtSLCI9rtKMzNI8EmHa5xxBI0/dUp5WAqUF?=
 =?us-ascii?Q?0ILZzX3FrK8xTqY1yFtTKwGkzjkWpTYk/dXLafr6fj4w8nNDQ6JIMh8j85Sf?=
 =?us-ascii?Q?K40XqJkSxTk4ddGXRBrrmtOIPTvgeP8B1ApxupqlR1qQS2rWhLlVMp86UMBj?=
 =?us-ascii?Q?Mw1LIq+ZH5nnJMl0gT9Ie5r0vR6aIA3Rxt+UOLN0ldv54mIoGdDnaLHX/SvW?=
 =?us-ascii?Q?ZN3ACwlWzG/J19jiC/uiyKSHA2dxdFeGgyciOnPIgaojsCr1f+bgzDRcAdd9?=
 =?us-ascii?Q?+kVYbmycmqcOmrjx1/VGXTpVO7QmFKT0+gIUYlxCBMZ0Y87YFIHJv+eKmzUd?=
 =?us-ascii?Q?8V98avyJv16R/nB/Wz0/IqHreYM3eB+kwZfj6xIngxo2odJTOL8TI6Xrma4Z?=
 =?us-ascii?Q?U5kuPiwsM8BAymuSj8ORhHR2Hp6PRHdVdlwEmr1pWWtkMslJr4iwagZrY9UR?=
 =?us-ascii?Q?QuTXVYRQ3rXxsB6Mp3dU/B1t1gSnApqpKwBi1Eh/d6LC/C9VATnjCCNP4dOr?=
 =?us-ascii?Q?0FM1+siY5lb1R+xI1wAk+5mOmrTvG66m0YOFXpxW+c0vmZDFaiPGvJHwqPii?=
 =?us-ascii?Q?m2kdev7y3Yoae143fpomzY2/1JOpuezuoteFDjOJ4HxlIx5MNaYPAs/0j4yv?=
 =?us-ascii?Q?LMzk4/jz/V3nYCYgI6xMTeLmRAMbrX4+rPyy1ActT+bHJcIESImeOmZUipsM?=
 =?us-ascii?Q?wUIZuRl5CXfQFl/eBuL6j4PdtTy2XZAlYxfTOco+sRY2XCUW4ifLTo1qOpiK?=
 =?us-ascii?Q?l80BSSa4wocLgtS/2nWAOXwZyL8lelEK/cS1qRhFukY7hHkzjBiIbdv7Vssw?=
 =?us-ascii?Q?XBYwp5JOpVAOUAaf0Mi3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f3e55a-dcef-4144-d7ea-08dca53d5e27
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 02:16:57.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5737

On Mon, Jul 15, 2024 at 05:19:41PM GMT, Conor Dooley wrote:
> On Mon, Jul 15, 2024 at 05:55:28PM +0800, Inochi Amaoto wrote:
> > On Mon, Jul 15, 2024 at 11:21:25AM GMT, Krzysztof Kozlowski wrote:
> > > On 14/07/2024 13:28, Inochi Amaoto wrote:
> > > > On Sophgo CV18XX platform, threshold strength of schmitt trigger can
> > > > be configured. As this standard property is already supported by the
> > > > common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
> > > > so that other platforms requiring such feature can make use of this
> > > > property.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > > index d0af21a564b4..e838fcac7f2a 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > > @@ -88,6 +88,10 @@ properties:
> > > >      description: disable input on pin (no effect on output, such as
> > > >        disabling an input buffer)
> > > > 
> > > > +  input-schmitt:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: threshold strength for schmitt-trigger
> > > 
> > > Strength in which units? This should have proper property name suffix.
> > > 
> > 
> > I think it should be mV. Using voltage may leads to decimal.
> 
> The standard suffix for voltage is "-microvolts", so no issues with
> decimals :) And with a standard suffix, the $ref can be dropped.

Yeah, I have seen the "-microvolts", but I does not think add standard
suffix is a good idea, as "input-schmitt" is a standard pinconf attribute.

The only thing confused me is that the description of PIN_CONFIG_INPUT_SCHMITT 
in include/linux/pinctrl/pinconf-generic.h says it just uses an custom
format as argument. So I think it may keep something generic?


