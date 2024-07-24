Return-Path: <linux-gpio+bounces-8368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5993AA26
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 02:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AE0CB22348
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 00:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5E74A00;
	Wed, 24 Jul 2024 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PLHaJHDL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2101.outbound.protection.outlook.com [40.92.21.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A523A9;
	Wed, 24 Jul 2024 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721780517; cv=fail; b=ckEgXggx7zZjDaIqE+iZWiX1gGeMoeDwQs/MWInecBvYEELfltR6euV7ZeFhmlOVe8+bzLjqkkqkSqJN+Ml81rY8sJpS64kFM+HHf68DlpUpkf/J/wjaqQVk/X6u3DYzitrP12AUxDzZfMBMZVT6flMV3ZZXU1Dd3CeOzOZjEqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721780517; c=relaxed/simple;
	bh=aYBWyeT7KDvFtG9AHFOTDJ1XY2eYuTEDp81ytMSdOQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nB2LDjIHGBzsaXSccXX7HRO2jLOgmZVjeZ/v2+WvDOWcxgYTkTDF5hwDkHgP0iHKVsBVfOv7C4DAbU0yOZUwDdw5z8ccF7TzEtPqiHUX9OUQeQxmXzI6lame3a5+16vbLCcZbBus4aRKfwR2qQpz5LV9qln5Y6UpHrtvk01jsDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PLHaJHDL; arc=fail smtp.client-ip=40.92.21.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybRGW/pDsuet5aXomwAEv/3wlAGJBeAtMupvqUdkJRbAMF9cqX79OeV5fg87FR7ZE4WyqXdAEnqzmWLTW1Mamrogd6PjX/fBbqUGtYbXs3ev06zGCvTR5k4A+PWoQI2KDfYoF/jHx5UbT+86CY4WYvF+w2f0tKKMhksLcb+kmf+td4VfqVhCRwO6vJ6RXR3JNyMCcgvDD0Ep1JRy2gJFcvqUgXlgTBfJgwxY+SZQMnHLfLFqkDM6i6uIOI7qtLNYalo48vvLOPCJQwMDC2Amd3Kyrc776bmCQuRTIjAT66YnNmeVSkQPhX+2odk0Ni39mjkAHHQJ6xyAfrcGNJ1Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc98vI4Ex4oRO1gqTWC6VsELfEf7AHeYtmSAEKjzagA=;
 b=HIXtoJ3rv/0gSg3iIVSk5UUAsakPLWDLPWNfJHkdHijkp3Al2vlgoHuRlh78FWTNw/t+S9Az3M6srDATXqQDjUKSYd6LjsyF7QGu4irAsBJnDgX+EzmBBe6fsXIL5abei7U67Q/2sp0geLoei8CPYrXSMGNAEBjHcRLeneKAzkIIiYLBQdtzAieN4nrJ+YPPMundPYqzcVvB1tFG/B2nce2K2LuGbFv3Dd4fICCzP8k0XD4nWiKOsHW1GHf5sfcbzv8jj2CKdP+viAYNJvfWrufHN/d3i1gxGgQV5SQh9n5wbOF2dCvINVmMTb+TBkU6LoRFpQuoafUgLzwvlVsHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc98vI4Ex4oRO1gqTWC6VsELfEf7AHeYtmSAEKjzagA=;
 b=PLHaJHDLVUbhsq60boq3vsgqfE01Hxof5YqAllbU352sSznfcinecAgt6hBbqU3BFFzVEiqDKKhND8h/lbM2Z4RXMkou1bsvHm+so+teTuJn9dh7qzUXCWHrmjoJmo57VpDfZ7dAe+R9VhXzMNMhQQC7e8Yyo/1b50YkwSF5uBDT8RdUJ8EAJfQBhgvTh2h0nWYVT7LmFzKOvEkkxldh1R5YhMPz8vQK97QgNmCd72A6URlUFMStds5NwNiFr0o8leVLT2CPLGqmABY5j7/uBhndmrKNaHGpC4JLY5fGtEMNvAVgjBQ8BuH2AJxF6Ie/fn4urIDhvPUd7UhHxZBVHw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA0PR20MB4559.namprd20.prod.outlook.com (2603:10b6:806:152::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 00:21:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 00:21:51 +0000
Date: Wed, 24 Jul 2024 08:21:30 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Drew Fustini <dfustini@baylibre.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID:
 <IA1PR20MB4953E295A428B4064B5C83E2BBAA2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240723193153.GA992922-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723193153.GA992922-robh@kernel.org>
X-TMN: [KQIzDK4BbAy2Ra9Mu6d4nNo3CExgFFxWTKSSzKCl3iE=]
X-ClientProxiedBy: PS2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <hp4nuzkiujbx44v7cgofy34l3j4ayrnmtb5uhqjtp3afkblup6@ou5la5et54nu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA0PR20MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: b4594898-d014-4ef0-1cb6-08dcab769d37
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	weZmQjX3eiXgl7uma+g1ATBwAoilYYGQXz+MxQgOM4eu51ixbRYO41JUpmY4x+VLy0NM2qIGSt9DB1ko1jkWbSnC4mn8IXv20DjnTjBWSvdVpsSHoockN1PraNoanHL9o1NbuwdBvqI8gKRKYlzNyh68/FyKTz/hUdmg8yS+CFdBr2YwYcdtopYvZPrYf1l8QaKcV6PNBYBdiAXj1kB7UCrJrlGq9gi7hoEuVS86VEu5+H1rtV+KZwfVn3Wce7Wn7HPPSE4IpzqGrHtZLWDxGACfFAaVzKabGcUBP5O6kZELUdkq4NrWIIHqnLZq/bnMBmuZURsbY3OZoVYYRKXXcUtoBtRZgAjxx45dJXbpVrwUirWRfxL4ESNTj+b3v1y//jwaqWKzzYaXxrFX8QkNypEcgYHnimGNWxagrBoa5lGGorvUXdt2hvVg6DbUpFL6LJKDNWn5ZIj/BKmRxtGYsN8LbYygPCtIiSvDSlqA+JJ4yT9tu9Dkv+ZPobcOrokHOD5VTmy9x//8MAJUAT5JNyHi+UeOkwMP/S9gio8WS2MvdevHcBwg00tG+0crqcdVPPoaDeczX7KbSoeqOdZFflYj2ldgaoH9JWWvk6b/bz/8gYu+5HxvoMcQ8X/s8n8vvVMGN1ye8uOMbGAj+FVLR2hRegexoMHKLPvzivXQLT8rD2zlEJGwj+70v1rBTftffD/96uEPF9j5d6r/vPpGjkCpiOq9eTaC3gddNU664ylNICd7aM6oMrIPxbM47czmbexy4uFRBlk2jViKs/YROHSs+sSoWp0CySWv+Tx7bC8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vOCbYuKUi3MOrAtpSabH+/C0OeuQOmIA54HjtBG1GL2BbjakAY7VJqq0lZm7?=
 =?us-ascii?Q?Djlf+qwnw6x4F6uwn2YGIV0VCARm+7+XLQZ9tPbNlAP0yCLsdn1u04wSXjuV?=
 =?us-ascii?Q?ZDobNCPOy+Wi/0fo+R9TINjaH+2kgoxNZecr7XqCBh+yzhYL+mC8p6U5n94J?=
 =?us-ascii?Q?hWFTFAldM57GP4S2zjIlKtczTfm5iDUb5MzkihWklNcVA8UHhuLcjQFxM1y3?=
 =?us-ascii?Q?41LNEJiC09LfEzfIOA5PjsQEqpqOsBKXbsfBsTt5lpZOJjZISl0/93O+JPZA?=
 =?us-ascii?Q?9SrIei/QzmXFOZVHXJZuNXp1bVPpiVIgG/WBhJY9t/SgCCsp/0Io2JhTzNJh?=
 =?us-ascii?Q?t8AQNNnpIikGx18IRcSAK97Enhohxp1oCOuR4Tc/10lnfabwD2Mu7D6+/Pvj?=
 =?us-ascii?Q?yNd7FrY439FEg/515eleBSNdWDigLzkSulx2SCt2gtmSYLJ+cPlB3DDjMjF7?=
 =?us-ascii?Q?Stu7agDewHHcQwd8rrs7qZejQH7lqw8Y0cMD/I8W19NHzUwxcUFZl6kQPmag?=
 =?us-ascii?Q?6osjxfHhJSiMJQT8CXWXs4AB+GelhfnEjXb3rPxqc7Xb2LnUL/LGQ9pNCVrY?=
 =?us-ascii?Q?CKH1Na9xaY18LpVYiZHM9OmTyT8IO4yHBBN0m34pzSku6jAFwM0JmvgHttYp?=
 =?us-ascii?Q?YjWFhxbInx7w4Z2mYexbW+B5PC459vcbHHM3jg3n20SloujsbkTGU1JEMgT1?=
 =?us-ascii?Q?unveEpa7wUmTczI1YKVVZO7KTEqLvO0E1rzGkQFByEqO9GCT+0jYJ1pfVPm0?=
 =?us-ascii?Q?Ou6AB9osfuyBycZubQSKFv5FNlY9gYusVUo+E7luUhLInY1Hm8ur1Mnm3ggD?=
 =?us-ascii?Q?zGxoW+HFp9BgJTV4zRwMTXe2An+nLgRAcLGJrgRXz4OMTqJXh+zzMOrTjE/E?=
 =?us-ascii?Q?guoZ5TDXui6wWuAqoDJJBDPu+IXdeEc1mcIGkeHeaz0is0HegXnwIzM5H5Cn?=
 =?us-ascii?Q?toGK259pbNPuwLbgHrjZ6KONXrvVZS8x/i7Qq97gjXH5EeU0gbjmukmFbe64?=
 =?us-ascii?Q?6v5N4vDnYc9K8IBnllY8i911fJakBoIz3T2A6G1AiAlkQd3Nx7vcKk8wqb9D?=
 =?us-ascii?Q?Dmq/EI/UQcjpZaGmQgQtH3VoVvIzF0UrsEP/n25wct4XVaOoUn2XG10VG0d/?=
 =?us-ascii?Q?vjpmvMDQmnitusbTpY7TWKFEdCwsBlkfuH6f/ZyTWp7YgGHGTzfqDeRdOJ5W?=
 =?us-ascii?Q?mDpRe60H0AvWZljFz7/owoNj4hkTWWviFE9q67N2tzMb7ACBbNazrQYMkx4h?=
 =?us-ascii?Q?1ykN3fPv9q6IjjdiLGTl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4594898-d014-4ef0-1cb6-08dcab769d37
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 00:21:51.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR20MB4559

On Tue, Jul 23, 2024 at 01:31:53PM GMT, Rob Herring wrote:
> On Mon, Jul 22, 2024 at 09:39:20AM +0800, Inochi Amaoto wrote:
> > Add pinctrl support for Sophgo CV1800 series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 129 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
> >  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
> >  6 files changed, 544 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..e6bd271ad22d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> > @@ -0,0 +1,129 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800 Pin Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,cv1800b-pinctrl
> > +      - sophgo,cv1812h-pinctrl
> > +      - sophgo,sg2000-pinctrl
> > +      - sophgo,sg2002-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: pinctrl for system domain
> > +      - description: pinctrl for rtc domain
> > +
> > +  reg-names:
> > +    items:
> > +      - const: sys
> > +      - const: rtc
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '-cfg$':
> > +    type: object
> > +    description: |
> 
> Don't need '|' if no formatting.
> 
> > +      A pinctrl node should contain at least one subnode representing the
> > +      pinctrl groups available on the machine.
> > +
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          Each subnode will list the pins it needs, and how they should
> > +          be configured, with regard to muxer configuration, bias, input
> > +          enable/disable, input schmitt trigger, slew-rate, drive strength
> > +          and bus hold state. In addition, all pins in the same subnode
> > +          should have the same power domain. For configuration detail,
> > +          refer to https://github.com/sophgo/sophgo-doc/.
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        properties:
> > +          pinmux:
> > +            description: |
> > +              The list of GPIOs and their mux settings that properties in the
> > +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> > +              macro.
> > +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> 
> You already referenced this above which is the right way. Drop this 
> $ref.
> 
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength:
> > +            description: typical current when output high level, but in mA.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +          drive-strength-microamp:
> > +            description: typical current when output high level.
> 
> New binding, why do you need both of these properties? Use the latter.
> 
> > +
> > +          input-schmitt-microvolt:
> > +            description: typical threshold for schmitt trigger.
> 
> No constraints?
> 

Since the value of the pin depends on the pin type and attribute
"power-source", it is too hard to give accurate constraint for
the binding. So I left the check in the driver. Although it is
possible to give a maximum to fit all the pins, but I think
it is kind of meaningless.

> > +
> > +          power-source:
> > +            description: power supplies at X mV.
> > +            enum: [ 1800, 3300 ]
> > +
> > +          slew-rate:
> > +            description: slew rate for output buffer (0 is fast, 1 is slow)
> > +            enum: [ 0, 1 ]
> > +
> > +          bias-bus-hold:
> > +            type: boolean
> > +
> > +        required:
> > +          - pinmux
> > +          - power-source
> > +
> > +        additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > +
> > +    soc {
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> 
> You can remove 'soc' node from the example. 1 cell is the default for 
> examples.
> 
> > +
> > +        pinctrl@3001000 {
> > +            compatible = "sophgo,cv1800b-pinctrl";
> > +            reg = <0x03001000 0x1000>,
> > +                  <0x05027000 0x1000>;
> > +            reg-names = "sys", "rtc";
> > +
> > +            uart0_cfg: uart0-cfg {
> > +                uart0-pins {
> > +                    pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> > +                             <PINMUX(PIN_UART0_RX, 0)>;
> > +                    bias-pull-up;
> > +                    drive-strength = <2>;
> > +                    power-source = <3300>;
> > +                    slew-rate = <0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...

