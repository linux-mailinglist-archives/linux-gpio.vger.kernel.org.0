Return-Path: <linux-gpio+bounces-8195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5892F318
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 02:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230A11C220D4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 00:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766E11C2E;
	Fri, 12 Jul 2024 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FARNnlFW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2101.outbound.protection.outlook.com [40.92.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889204C96;
	Fri, 12 Jul 2024 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720744623; cv=fail; b=oIKmMM4HUboDjKeYMpuWeMuM9gQ6eGKWG2yumsrgTLQTENerkGPiVO0FF4iAuuOZQ05K4eHI3Nke8MY8kKNej2qdoj84O7G4LusXzzzVMOF7JZCPz1lcFGnCpZxiZjuCVIsngOrIy36BSHjEHfqIWFYz1Rh1TyEfAp+r99wwTR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720744623; c=relaxed/simple;
	bh=X5nXYnrunX+t5cG4W73Zh/0tRGoC0noEEeiAnX9eIuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B3jDc8ZxI/cScUqduCQjAwdnQJ6OTHP4Wf+ZfNzpi/+w/HZx7h10rp32v1mHA2mD/kwo5HcUVkPo35Q9qJc0QCNkjyFzDrjsT+FrFgI/qJ9tZHboGxE6mkx95SATZCcU6dB5j8sQ3bwpTiTf2lVGDMmzcMTVVFpAkAtLEnh7HaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FARNnlFW; arc=fail smtp.client-ip=40.92.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTtgir4TMpQJ5XV1q6JxFLf2iChxYqlXhOQFGdAxF0YGThIPha8c6iUJBbSIoyRGjpVKIB7eIfXqeT1LV3KX8a86TSThVeZhbKikFfFpJa/koGftmnbj4kHY1vjuSr8KEZEuS2xlR8S/FgNKWgBw/Pp65gt+g4UPrbhc9HBpiFaAIO7K9G45S762S5fncwSfGvHnsKVZ8MP3NNpFnbyd9Xcx1nIwZY8otfxRu24y+72wk3WbeNNYHqQsRVUL/w6VXXUWjdqYpDaacxY2vP92xjdB/37bV9viQLhtaLr7T52+W5NcviH6ZzVMIwuDp004CGMXn2nGfKGO1DqyLBQ9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nzou6e7i5zAW1zg3ezCDrgjkIaNj0GNGPtZrR7QKKM=;
 b=bfOyZHhppD7HZFKtzWJHZsOpfR7kofStM/3TOzEivSmpD+LpXFOXYzTZDxmyDAp4BwPUG594LzipEe8lKPOaM1IKnTiBrvm3Vcpic8H/GJ2S5P2d8uVVOTsyGFRkL1CUPNcp1VPznI4s305ZQkUGNR5G2rGICkO7WBQ8l2CiJCd1FABb5temIRjvfgjYEX4gb/dB/+6aKTaI2qPNw+IrnzcXZFi4RB96OaoX+9bVKESU2L9qdrmpIrSFzk0AEPebfq58a/whVDzDTJ0wyxO6iXv0kDUjP6ZFnxmmDgvB7DSUBZuPJ7J/y+HDc0ZbeOIhdWKQuW/WX5BrNKbZisuLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nzou6e7i5zAW1zg3ezCDrgjkIaNj0GNGPtZrR7QKKM=;
 b=FARNnlFW5y6naEucvwYkNJvJ4udT0oS7dIFykCOcuqkWyHwVtKna47ZX86rllU2MVLWGHUqo5RfX+QIlp2H7CANlAhJ1jTp+NFhz4dAy3IpI8Wxg2RPNyNQfZGoPBDqFwXMxdrZrAZo3C/jB19iXuNBlGx1Up2rx6vuVd0K+mZj5HTJnhW2bUqb0IqhmY8pHmtRccI6zngtzuULPBvf0Ra4ODvnogAZJFsPk2dTf97ht6ImIrpHsPESYLxWdb7SGcZGjCVYGPkEIhZifJilEeG653HvF/pm3o2xdbHR610mB7FDXaJMYFi3hjHDnxYnAbvNgabWN/C3589VenG83qw==
Received: from PH7PR20MB4962.namprd20.prod.outlook.com (2603:10b6:510:1fa::6)
 by MW4PR20MB4453.namprd20.prod.outlook.com (2603:10b6:303:18a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 00:36:56 +0000
Received: from PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c]) by PH7PR20MB4962.namprd20.prod.outlook.com
 ([fe80::b5de:b82:43d9:4e8c%5]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 00:36:55 +0000
Date: Fri, 12 Jul 2024 08:36:14 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
Message-ID:
 <PH7PR20MB496255DD1E7F37B5C9027800BBA62@PH7PR20MB4962.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240708162948.GA3356671-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708162948.GA3356671-robh@kernel.org>
X-TMN: [yJ1jY/erFCKWq/LRC2gbQiLF4fW6Co3kGH2YvgmP9pM=]
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To PH7PR20MB4962.namprd20.prod.outlook.com
 (2603:10b6:510:1fa::6)
X-Microsoft-Original-Message-ID:
 <kbgaoftbspqleqlaeltae52kofabymf3w257pg62sennrxhkdq@u6b2ggj7mebx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR20MB4962:EE_|MW4PR20MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: ce83d388-071d-4cc3-1422-08dca20abafa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|440099028|3412199025|4302099013|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	5lbc+7ILKO3Kf0HejZAO/Lx2lWWMb0X9YHQXq4YxH7MBXjGfnvY7CohuQmTqqvCsMGAI5Ni84qb/adWWwHeLrpncls8pAxzFe33odQxOGcElIFYY7gGkeJ/yAIZaDv/4AxkZ2JHqUf8WlhjbC5M7qRAS0D28KNEdRkD4UJtT8JdDTttbX0+xL1KwBsvmthwJR7VS6iXSUbv+gJ94uVFuFE2IB1IuZGg/r388lxtNzgk1d2jtb/HX8eswmkQXro03eoCbXY8wdLCJbYhBeR48h7AUFH7H/6rtQpeug5Wcn0huGdyZcwGhLtAnwJUGlkONHDI6Mn98NUGm1DN+pxRoLEhdxwcn8GGKueckR5rOAWKZOescv4Uzzixa8ctGz+CXISv0UilFMfM1qNATdqXxnW6AGN48nUPCxe9AJjfT0DWRmhRZzrO+NTvJ7nGMJN8LiwZumA+nJ1VaqbyZCl512g6kFR5gVpI5UUfmabK9UTjSw5pqOEY/eGk59FbNYZrW+t2EJ6rhUsdQUsrO6/EwI6eOj6Jo58fUh7AnH3Pe3+rQdwDm7OlfIWxsxNLd84b0ulI/ABfqNebG2/ydEf35nW6uqSswWscuqHMBfsxVUold0TVkqKQUbOOYapbzbvHk8BnrpbxoinXhQ8gPqtoa8kbNuASE/w5/ZK3wsuCrC580M7uKUwtJGu/ng7agtxtb0ZC9eIZn1KVngFiChsvGBDLFkSMgl+W932suctZw9gmQx1T6cFzCgkExLyEGHOVhkhB23yeT8eYRmp7QLRyiFcsM5D1D5NJ1XcOg68vTlZo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUi5ibZYH3slvrsBLIF8Tv5e6T6Cvc3FiQShll2P9YcMhbqaPy1Pf6tM5uC0?=
 =?us-ascii?Q?L4CPBbPhk2eN5pjFk+/HsbNpvvgTssN4kA9zBVFZiqxjdlTy+nNDUDdPkw2+?=
 =?us-ascii?Q?aYnY5YVQ9uQZmxCLLfBBgKQQiX2sHbrwkj0ZxedaACpmJElYcmVsHe5J1D3D?=
 =?us-ascii?Q?g4+FWIMmjbhPSkTkzMs7fF5YTv6B2SUD0BAOiDz+8wb/vaD+kg6HfZeUJw1y?=
 =?us-ascii?Q?rl8pEKA3/g2NwKF03hGTE3JrMQYgc49wHA5/T4JcKXA/s+3pue+t9dMgH190?=
 =?us-ascii?Q?Pmfl3uiPYIR4fjjM/9V1+Ak96a5DRGaeOp/il3nD9W4K+v+l+N/Y78pkTIkZ?=
 =?us-ascii?Q?NdiMIbUiczDWDSR/lmFlcEERk09NNdXX9SB6oTUafrdzZuqByPCuRGwyvkDM?=
 =?us-ascii?Q?+AhzEFptmdG9spdYWiTgMM2HYAYW3xM/wM5LHhvbuWu/amFHunfRSatrdcBr?=
 =?us-ascii?Q?YIcRSFZkNSpFUYFYf0saWRHVSGMUkNR/3G67tC1HmchV9og+VryKDweyyWu5?=
 =?us-ascii?Q?H03mxOJgFGAivPqt0QPf2ndQ2bx1T5Kotf6JIoPq0s4+7fjMrGDj3qJIAS5v?=
 =?us-ascii?Q?xirwIgUYbZoG0U/KHlXEfz8DQYJvV4WiQIvLZIfLh0otAhKkfyVuDAxPc2wF?=
 =?us-ascii?Q?mcYTybueyYW4octKbPfguHe2TV/6GM7gREhgyZUIrhjld2cMZLDVvLl+XuKS?=
 =?us-ascii?Q?gtWrI4bRp8C6MCRPYQHeKO8okuZGW60SapzseSKdOyeZyDoc/81KIiPyEFwJ?=
 =?us-ascii?Q?H0qRsVtCIO0gT753SDe22hzybjWjk0C/ycBQXsc0iG4XafzumZzIzhMUohl/?=
 =?us-ascii?Q?iQtc+mAkJtmqJ52DCx4p+gK+b8/AVe8f1Qbu6/6DSNworIdah6owst3GawLd?=
 =?us-ascii?Q?qGwtUerRDWM0CWsE9B0hubvzze/SE23v88ROvVQBNEi7iCoFaYG+Kr+i/I4H?=
 =?us-ascii?Q?OE0q6tGUo7GjJrCdNcgAg3ORnu2RkZEboCZsN20/iRBB1zdx1km51jV/iGVt?=
 =?us-ascii?Q?F4erHAedJLl1j21H/mc00TxLtMEXDYuyiz1OWmL69RYlTFfdaQlUOP4Zmwj+?=
 =?us-ascii?Q?4hiQZJmsIUSoGOuhKBhXZleHQLZ3FC/0+ayQL8J006CKkn2CDhLfHJrHu1TQ?=
 =?us-ascii?Q?z2PtWDaoteYxy+jh/2VwjsX4gqFst512kog1uB+RSMgW4k7DLCYDdOJ5ezY8?=
 =?us-ascii?Q?l/E3bAla4RFAU7X9yXZOXVlCotoqnM1OUj9gbaPGLYwkulA9AwD70hxkdlE8?=
 =?us-ascii?Q?h3eX6M7/ObY0ENkdkHQ4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce83d388-071d-4cc3-1422-08dca20abafa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR20MB4962.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 00:36:55.4884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4453

On Mon, Jul 08, 2024 at 10:29:48AM GMT, Rob Herring wrote:
> On Thu, Jul 04, 2024 at 01:46:37PM +0800, Inochi Amaoto wrote:
> > Add pinctrl support for Sophgo CV1800 series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
> >  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
> >  6 files changed, 535 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..b7e4084b78d6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> > @@ -0,0 +1,120 @@
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
> 
> Based on the example's addresses, this isn't 1 block, but 2 blocks. Is 
> this really 1 block, 2 instances of the same block, or 2 different 
> blocks?
> 

It is 2 blocks. According to its document, the pin configuration 
is cross referenced.

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
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode representing the
> 
> It's the '-cfg' node that 'should contain at least one subnode', not 
> this node.
> 

Thanks, I will update the description.

> > +          pinctrl groups available on the machine. Each subnode will list the
> > +          pins it needs, and how they should be configured, with regard to
> > +          muxer configuration, bias, input enable/disable, input schmitt
> > +          trigger enable/disable, slew-rate and drive strength.
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        properties:
> > +          pinmux:
> > +            description: |
> > +              The list of GPIOs and their mux settings that properties in the
> > +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> > +              macro.
> > +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 7
> > +
> > +          input-schmitt:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 7
> > +
> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> > +
> > +          sophgo,bus-holder:
> > +            description: enable bus holder
> > +            type: boolean
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> 
> In the indented cases, put these before properties or patternProperties.
> 
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
> > +                    slew-rate = <0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        uart0 {
> > +            pinctrl-0 = <&uart0_cfg>;
> > +            pinctrl-names = "default";
> 
> Not a complete node. Plus the examples for a provider don't show the 
> consumer side and vice-versa. So drop the node.
> 
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1800b.h b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> > new file mode 100644
> > index 000000000000..0593fc33d470
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> > @@ -0,0 +1,63 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + *
> > + * This file is generated from vendor pinout definition.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_CV1800B_H
> > +#define _DT_BINDINGS_PINCTRL_CV1800B_H
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> > +
> > +#define PIN_AUD_AOUTR			1
> > +#define PIN_SD0_CLK			3
> > +#define PIN_SD0_CMD			4
> > +#define PIN_SD0_D0			5
> > +#define PIN_SD0_D1			7
> > +#define PIN_SD0_D2			8
> > +#define PIN_SD0_D3			9
> > +#define PIN_SD0_CD			11
> > +#define PIN_SD0_PWR_EN			12
> > +#define PIN_SPK_EN			14
> > +#define PIN_UART0_TX			15
> > +#define PIN_UART0_RX			16
> > +#define PIN_SPINOR_HOLD_X		17
> > +#define PIN_SPINOR_SCK			18
> > +#define PIN_SPINOR_MOSI			19
> > +#define PIN_SPINOR_WP_X			20
> > +#define PIN_SPINOR_MISO			21
> > +#define PIN_SPINOR_CS_X			22
> > +#define PIN_IIC0_SCL			23
> > +#define PIN_IIC0_SDA			24
> > +#define PIN_AUX0			25
> > +#define PIN_PWR_VBAT_DET		30
> > +#define PIN_PWR_SEQ2			31
> > +#define PIN_XTAL_XIN			33
> > +#define PIN_SD1_GPIO0			35
> > +#define PIN_SD1_GPIO1			36
> > +#define PIN_SD1_D3			38
> > +#define PIN_SD1_D2			39
> > +#define PIN_SD1_D1			40
> > +#define PIN_SD1_D0			41
> > +#define PIN_SD1_CMD			42
> > +#define PIN_SD1_CLK			43
> > +#define PIN_ADC1			44
> > +#define PIN_USB_VBUS_DET		45
> > +#define PIN_ETH_TXP			47
> > +#define PIN_ETH_TXM			48
> > +#define PIN_ETH_RXP			49
> > +#define PIN_ETH_RXM			50
> > +#define PIN_MIPIRX4N			56
> > +#define PIN_MIPIRX4P			57
> > +#define PIN_MIPIRX3N			58
> > +#define PIN_MIPIRX3P			59
> > +#define PIN_MIPIRX2N			60
> > +#define PIN_MIPIRX2P			61
> > +#define PIN_MIPIRX1N			62
> > +#define PIN_MIPIRX1P			63
> > +#define PIN_MIPIRX0N			64
> > +#define PIN_MIPIRX0P			65
> > +#define PIN_AUD_AINL_MIC		67
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_CV1800B_H */
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1812h.h b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> > new file mode 100644
> > index 000000000000..2908de347919
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> > @@ -0,0 +1,127 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + *
> > + * This file is generated from vendor pinout definition.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_CV1812H_H
> > +#define _DT_BINDINGS_PINCTRL_CV1812H_H
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> > +
> > +#define PINPOS(row, col)			\
> > +	((((row) - 'A' + 1) << 8) + ((col) - 1))
> > +
> > +#define PIN_MIPI_TXM4			PINPOS('A', 2)
> > +#define PIN_MIPIRX0N			PINPOS('A', 4)
> > +#define PIN_MIPIRX3P			PINPOS('A', 6)
> > +#define PIN_MIPIRX4P			PINPOS('A', 7)
> > +#define PIN_VIVO_D2			PINPOS('A', 9)
> > +#define PIN_VIVO_D3			PINPOS('A', 10)
> > +#define PIN_VIVO_D10			PINPOS('A', 12)
> > +#define PIN_USB_VBUS_DET		PINPOS('A', 13)
> > +#define PIN_MIPI_TXP3			PINPOS('B', 1)
> > +#define PIN_MIPI_TXM3			PINPOS('B', 2)
> > +#define PIN_MIPI_TXP4			PINPOS('B', 3)
> > +#define PIN_MIPIRX0P			PINPOS('B', 4)
> > +#define PIN_MIPIRX1N			PINPOS('B', 5)
> > +#define PIN_MIPIRX2N			PINPOS('B', 6)
> > +#define PIN_MIPIRX4N			PINPOS('B', 7)
> > +#define PIN_MIPIRX5N			PINPOS('B', 8)
> > +#define PIN_VIVO_D1			PINPOS('B', 9)
> > +#define PIN_VIVO_D5			PINPOS('B', 10)
> > +#define PIN_VIVO_D7			PINPOS('B', 11)
> > +#define PIN_VIVO_D9			PINPOS('B', 12)
> > +#define PIN_USB_ID			PINPOS('B', 13)
> > +#define PIN_ETH_RXM			PINPOS('B', 15)
> > +#define PIN_MIPI_TXP2			PINPOS('C', 1)
> > +#define PIN_MIPI_TXM2			PINPOS('C', 2)
> > +#define PIN_CAM_PD0			PINPOS('C', 3)
> > +#define PIN_CAM_MCLK0			PINPOS('C', 4)
> > +#define PIN_MIPIRX1P			PINPOS('C', 5)
> > +#define PIN_MIPIRX2P			PINPOS('C', 6)
> > +#define PIN_MIPIRX3N			PINPOS('C', 7)
> > +#define PIN_MIPIRX5P			PINPOS('C', 8)
> > +#define PIN_VIVO_CLK			PINPOS('C', 9)
> > +#define PIN_VIVO_D6			PINPOS('C', 10)
> > +#define PIN_VIVO_D8			PINPOS('C', 11)
> > +#define PIN_USB_VBUS_EN			PINPOS('C', 12)
> > +#define PIN_ETH_RXP			PINPOS('C', 14)
> > +#define PIN_GPIO_RTX			PINPOS('C', 15)
> > +#define PIN_MIPI_TXP1			PINPOS('D', 1)
> > +#define PIN_MIPI_TXM1			PINPOS('D', 2)
> > +#define PIN_CAM_MCLK1			PINPOS('D', 3)
> > +#define PIN_IIC3_SCL			PINPOS('D', 4)
> > +#define PIN_VIVO_D4			PINPOS('D', 10)
> > +#define PIN_ETH_TXM			PINPOS('D', 14)
> > +#define PIN_ETH_TXP			PINPOS('D', 15)
> > +#define PIN_MIPI_TXP0			PINPOS('E', 1)
> > +#define PIN_MIPI_TXM0			PINPOS('E', 2)
> > +#define PIN_CAM_PD1			PINPOS('E', 4)
> > +#define PIN_CAM_RST0			PINPOS('E', 5)
> > +#define PIN_VIVO_D0			PINPOS('E', 10)
> > +#define PIN_ADC1			PINPOS('E', 13)
> > +#define PIN_ADC2			PINPOS('E', 14)
> > +#define PIN_ADC3			PINPOS('E', 15)
> > +#define PIN_AUD_AOUTL			PINPOS('F', 2)
> > +#define PIN_IIC3_SDA			PINPOS('F', 4)
> > +#define PIN_SD1_D2			PINPOS('F', 14)
> > +#define PIN_AUD_AOUTR			PINPOS('G', 2)
> > +#define PIN_SD1_D3			PINPOS('G', 13)
> > +#define PIN_SD1_CLK			PINPOS('G', 14)
> > +#define PIN_SD1_CMD			PINPOS('G', 15)
> > +#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
> > +#define PIN_RSTN			PINPOS('H', 12)
> > +#define PIN_PWM0_BUCK			PINPOS('H', 13)
> > +#define PIN_SD1_D1			PINPOS('H', 14)
> > +#define PIN_SD1_D0			PINPOS('H', 15)
> > +#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
> > +#define PIN_IIC2_SCL			PINPOS('J', 13)
> > +#define PIN_IIC2_SDA			PINPOS('J', 14)
> > +#define PIN_SD0_CD			PINPOS('K', 2)
> > +#define PIN_SD0_D1			PINPOS('K', 3)
> > +#define PIN_UART2_RX			PINPOS('K', 13)
> > +#define PIN_UART2_CTS			PINPOS('K', 14)
> > +#define PIN_UART2_TX			PINPOS('K', 15)
> > +#define PIN_SD0_CLK			PINPOS('L', 1)
> > +#define PIN_SD0_D0			PINPOS('L', 2)
> > +#define PIN_SD0_CMD			PINPOS('L', 3)
> > +#define PIN_CLK32K			PINPOS('L', 14)
> > +#define PIN_UART2_RTS			PINPOS('L', 15)
> > +#define PIN_SD0_D3			PINPOS('M', 1)
> > +#define PIN_SD0_D2			PINPOS('M', 2)
> > +#define PIN_UART0_RX			PINPOS('M', 4)
> > +#define PIN_UART0_TX			PINPOS('M', 5)
> > +#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
> > +#define PIN_PWR_ON			PINPOS('M', 11)
> > +#define PIN_PWR_GPIO2			PINPOS('M', 12)
> > +#define PIN_PWR_GPIO0			PINPOS('M', 13)
> > +#define PIN_CLK25M			PINPOS('M', 14)
> > +#define PIN_SD0_PWR_EN			PINPOS('N', 1)
> > +#define PIN_SPK_EN			PINPOS('N', 3)
> > +#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
> > +#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
> > +#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
> > +#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
> > +#define PIN_PWR_GPIO1			PINPOS('N', 13)
> > +#define PIN_EMMC_DAT3			PINPOS('P', 1)
> > +#define PIN_EMMC_DAT0			PINPOS('P', 2)
> > +#define PIN_EMMC_DAT2			PINPOS('P', 3)
> > +#define PIN_EMMC_RSTN			PINPOS('P', 4)
> > +#define PIN_AUX0			PINPOS('P', 5)
> > +#define PIN_IIC0_SDA			PINPOS('P', 6)
> > +#define PIN_PWR_SEQ3			PINPOS('P', 10)
> > +#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
> > +#define PIN_PWR_SEQ1			PINPOS('P', 12)
> > +#define PIN_PWR_BUTTON1			PINPOS('P', 13)
> > +#define PIN_EMMC_DAT1			PINPOS('R', 2)
> > +#define PIN_EMMC_CMD			PINPOS('R', 3)
> > +#define PIN_EMMC_CLK			PINPOS('R', 4)
> > +#define PIN_IIC0_SCL			PINPOS('R', 6)
> > +#define PIN_GPIO_ZQ			PINPOS('R', 10)
> > +#define PIN_PWR_RSTN			PINPOS('R', 11)
> > +#define PIN_PWR_SEQ2			PINPOS('R', 12)
> > +#define PIN_XTAL_XIN			PINPOS('R', 13)
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_CV1812H_H */
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-cv18xx.h b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> > new file mode 100644
> > index 000000000000..bc92ad1067ec
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2023 Sophgo Ltd.
> > + *
> > + * Author: Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_CV18XX_H
> > +#define _DT_BINDINGS_PINCTRL_CV18XX_H
> > +
> > +#define PIN_MUX_INVALD				0xff
> > +
> > +#define PINMUX2(pin, mux, mux2)	\
> > +	(((pin) & 0xffff) | (((mux) & 0xff) << 16) | (((mux2) & 0xff) << 24))
> > +
> > +#define PINMUX(pin, mux) \
> > +	PINMUX2(pin, mux, PIN_MUX_INVALD)
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_CV18XX_H */
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2000.h b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
> > new file mode 100644
> > index 000000000000..4871f9a7c6c1
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
> > @@ -0,0 +1,127 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + *
> > + * This file is generated from vendor pinout definition.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_SG2000_H
> > +#define _DT_BINDINGS_PINCTRL_SG2000_H
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> > +
> > +#define PINPOS(row, col)			\
> > +	((((row) - 'A' + 1) << 8) + ((col) - 1))
> > +
> > +#define PIN_MIPI_TXM4			PINPOS('A', 2)
> > +#define PIN_MIPIRX0N			PINPOS('A', 4)
> > +#define PIN_MIPIRX3P			PINPOS('A', 6)
> > +#define PIN_MIPIRX4P			PINPOS('A', 7)
> > +#define PIN_VIVO_D2			PINPOS('A', 9)
> > +#define PIN_VIVO_D3			PINPOS('A', 10)
> > +#define PIN_VIVO_D10			PINPOS('A', 12)
> > +#define PIN_USB_VBUS_DET		PINPOS('A', 13)
> > +#define PIN_MIPI_TXP3			PINPOS('B', 1)
> > +#define PIN_MIPI_TXM3			PINPOS('B', 2)
> > +#define PIN_MIPI_TXP4			PINPOS('B', 3)
> > +#define PIN_MIPIRX0P			PINPOS('B', 4)
> > +#define PIN_MIPIRX1N			PINPOS('B', 5)
> > +#define PIN_MIPIRX2N			PINPOS('B', 6)
> > +#define PIN_MIPIRX4N			PINPOS('B', 7)
> > +#define PIN_MIPIRX5N			PINPOS('B', 8)
> > +#define PIN_VIVO_D1			PINPOS('B', 9)
> > +#define PIN_VIVO_D5			PINPOS('B', 10)
> > +#define PIN_VIVO_D7			PINPOS('B', 11)
> > +#define PIN_VIVO_D9			PINPOS('B', 12)
> > +#define PIN_USB_ID			PINPOS('B', 13)
> > +#define PIN_ETH_RXM			PINPOS('B', 15)
> > +#define PIN_MIPI_TXP2			PINPOS('C', 1)
> > +#define PIN_MIPI_TXM2			PINPOS('C', 2)
> > +#define PIN_CAM_PD0			PINPOS('C', 3)
> > +#define PIN_CAM_MCLK0			PINPOS('C', 4)
> > +#define PIN_MIPIRX1P			PINPOS('C', 5)
> > +#define PIN_MIPIRX2P			PINPOS('C', 6)
> > +#define PIN_MIPIRX3N			PINPOS('C', 7)
> > +#define PIN_MIPIRX5P			PINPOS('C', 8)
> > +#define PIN_VIVO_CLK			PINPOS('C', 9)
> > +#define PIN_VIVO_D6			PINPOS('C', 10)
> > +#define PIN_VIVO_D8			PINPOS('C', 11)
> > +#define PIN_USB_VBUS_EN			PINPOS('C', 12)
> > +#define PIN_ETH_RXP			PINPOS('C', 14)
> > +#define PIN_GPIO_RTX			PINPOS('C', 15)
> > +#define PIN_MIPI_TXP1			PINPOS('D', 1)
> > +#define PIN_MIPI_TXM1			PINPOS('D', 2)
> > +#define PIN_CAM_MCLK1			PINPOS('D', 3)
> > +#define PIN_IIC3_SCL			PINPOS('D', 4)
> > +#define PIN_VIVO_D4			PINPOS('D', 10)
> > +#define PIN_ETH_TXM			PINPOS('D', 14)
> > +#define PIN_ETH_TXP			PINPOS('D', 15)
> > +#define PIN_MIPI_TXP0			PINPOS('E', 1)
> > +#define PIN_MIPI_TXM0			PINPOS('E', 2)
> > +#define PIN_CAM_PD1			PINPOS('E', 4)
> > +#define PIN_CAM_RST0			PINPOS('E', 5)
> > +#define PIN_VIVO_D0			PINPOS('E', 10)
> > +#define PIN_ADC1			PINPOS('E', 13)
> > +#define PIN_ADC2			PINPOS('E', 14)
> > +#define PIN_ADC3			PINPOS('E', 15)
> > +#define PIN_AUD_AOUTL			PINPOS('F', 2)
> > +#define PIN_IIC3_SDA			PINPOS('F', 4)
> > +#define PIN_SD1_D2			PINPOS('F', 14)
> > +#define PIN_AUD_AOUTR			PINPOS('G', 2)
> > +#define PIN_SD1_D3			PINPOS('G', 13)
> > +#define PIN_SD1_CLK			PINPOS('G', 14)
> > +#define PIN_SD1_CMD			PINPOS('G', 15)
> > +#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
> > +#define PIN_RSTN			PINPOS('H', 12)
> > +#define PIN_PWM0_BUCK			PINPOS('H', 13)
> > +#define PIN_SD1_D1			PINPOS('H', 14)
> > +#define PIN_SD1_D0			PINPOS('H', 15)
> > +#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
> > +#define PIN_IIC2_SCL			PINPOS('J', 13)
> > +#define PIN_IIC2_SDA			PINPOS('J', 14)
> > +#define PIN_SD0_CD			PINPOS('K', 2)
> > +#define PIN_SD0_D1			PINPOS('K', 3)
> > +#define PIN_UART2_RX			PINPOS('K', 13)
> > +#define PIN_UART2_CTS			PINPOS('K', 14)
> > +#define PIN_UART2_TX			PINPOS('K', 15)
> > +#define PIN_SD0_CLK			PINPOS('L', 1)
> > +#define PIN_SD0_D0			PINPOS('L', 2)
> > +#define PIN_SD0_CMD			PINPOS('L', 3)
> > +#define PIN_CLK32K			PINPOS('L', 14)
> > +#define PIN_UART2_RTS			PINPOS('L', 15)
> > +#define PIN_SD0_D3			PINPOS('M', 1)
> > +#define PIN_SD0_D2			PINPOS('M', 2)
> > +#define PIN_UART0_RX			PINPOS('M', 4)
> > +#define PIN_UART0_TX			PINPOS('M', 5)
> > +#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
> > +#define PIN_PWR_ON			PINPOS('M', 11)
> > +#define PIN_PWR_GPIO2			PINPOS('M', 12)
> > +#define PIN_PWR_GPIO0			PINPOS('M', 13)
> > +#define PIN_CLK25M			PINPOS('M', 14)
> > +#define PIN_SD0_PWR_EN			PINPOS('N', 1)
> > +#define PIN_SPK_EN			PINPOS('N', 3)
> > +#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
> > +#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
> > +#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
> > +#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
> > +#define PIN_PWR_GPIO1			PINPOS('N', 13)
> > +#define PIN_EMMC_DAT3			PINPOS('P', 1)
> > +#define PIN_EMMC_DAT0			PINPOS('P', 2)
> > +#define PIN_EMMC_DAT2			PINPOS('P', 3)
> > +#define PIN_EMMC_RSTN			PINPOS('P', 4)
> > +#define PIN_AUX0			PINPOS('P', 5)
> > +#define PIN_IIC0_SDA			PINPOS('P', 6)
> > +#define PIN_PWR_SEQ3			PINPOS('P', 10)
> > +#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
> > +#define PIN_PWR_SEQ1			PINPOS('P', 12)
> > +#define PIN_PWR_BUTTON1			PINPOS('P', 13)
> > +#define PIN_EMMC_DAT1			PINPOS('R', 2)
> > +#define PIN_EMMC_CMD			PINPOS('R', 3)
> > +#define PIN_EMMC_CLK			PINPOS('R', 4)
> > +#define PIN_IIC0_SCL			PINPOS('R', 6)
> > +#define PIN_GPIO_ZQ			PINPOS('R', 10)
> > +#define PIN_PWR_RSTN			PINPOS('R', 11)
> > +#define PIN_PWR_SEQ2			PINPOS('R', 12)
> > +#define PIN_XTAL_XIN			PINPOS('R', 13)
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_SG2000_H */
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2002.h b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
> > new file mode 100644
> > index 000000000000..3c36cfa0a550
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
> > @@ -0,0 +1,79 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + *
> > + * This file is generated from vendor pinout definition.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_SG2002_H
> > +#define _DT_BINDINGS_PINCTRL_SG2002_H
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> > +
> > +#define PIN_AUD_AINL_MIC		2
> > +#define PIN_AUD_AOUTR			4
> > +#define PIN_SD0_CLK			6
> > +#define PIN_SD0_CMD			7
> > +#define PIN_SD0_D0			8
> > +#define PIN_SD0_D1			10
> > +#define PIN_SD0_D2			11
> > +#define PIN_SD0_D3			12
> > +#define PIN_SD0_CD			14
> > +#define PIN_SD0_PWR_EN			15
> > +#define PIN_SPK_EN			17
> > +#define PIN_UART0_TX			18
> > +#define PIN_UART0_RX			19
> > +#define PIN_EMMC_DAT2			20
> > +#define PIN_EMMC_CLK			21
> > +#define PIN_EMMC_DAT0			22
> > +#define PIN_EMMC_DAT3			23
> > +#define PIN_EMMC_CMD			24
> > +#define PIN_EMMC_DAT1			25
> > +#define PIN_JTAG_CPU_TMS		26
> > +#define PIN_JTAG_CPU_TCK		27
> > +#define PIN_IIC0_SCL			28
> > +#define PIN_IIC0_SDA			29
> > +#define PIN_AUX0			30
> > +#define PIN_GPIO_ZQ			35
> > +#define PIN_PWR_VBAT_DET		38
> > +#define PIN_PWR_RSTN			39
> > +#define PIN_PWR_SEQ1			40
> > +#define PIN_PWR_SEQ2			41
> > +#define PIN_PWR_WAKEUP0			43
> > +#define PIN_PWR_BUTTON1			44
> > +#define PIN_XTAL_XIN			45
> > +#define PIN_PWR_GPIO0			47
> > +#define PIN_PWR_GPIO1			48
> > +#define PIN_PWR_GPIO2			49
> > +#define PIN_SD1_D3			51
> > +#define PIN_SD1_D2			52
> > +#define PIN_SD1_D1			53
> > +#define PIN_SD1_D0			54
> > +#define PIN_SD1_CMD			55
> > +#define PIN_SD1_CLK			56
> > +#define PIN_PWM0_BUCK			58
> > +#define PIN_ADC1			59
> > +#define PIN_USB_VBUS_DET		60
> > +#define PIN_ETH_TXP			62
> > +#define PIN_ETH_TXM			63
> > +#define PIN_ETH_RXP			64
> > +#define PIN_ETH_RXM			65
> > +#define PIN_GPIO_RTX			67
> > +#define PIN_MIPIRX4N			72
> > +#define PIN_MIPIRX4P			73
> > +#define PIN_MIPIRX3N			74
> > +#define PIN_MIPIRX3P			75
> > +#define PIN_MIPIRX2N			76
> > +#define PIN_MIPIRX2P			77
> > +#define PIN_MIPIRX1N			78
> > +#define PIN_MIPIRX1P			79
> > +#define PIN_MIPIRX0N			80
> > +#define PIN_MIPIRX0P			81
> > +#define PIN_MIPI_TXM2			83
> > +#define PIN_MIPI_TXP2			84
> > +#define PIN_MIPI_TXM1			85
> > +#define PIN_MIPI_TXP1			86
> > +#define PIN_MIPI_TXM0			87
> > +#define PIN_MIPI_TXP0			88
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_SG2002_H */
> > --
> > 2.45.2
> > 

