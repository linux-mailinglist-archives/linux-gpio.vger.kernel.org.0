Return-Path: <linux-gpio+bounces-9135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D295E79B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 06:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20FC61C20DEA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 04:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8758F46450;
	Mon, 26 Aug 2024 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="D6annGJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2103.outbound.protection.outlook.com [40.92.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03E29D1C;
	Mon, 26 Aug 2024 04:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724646018; cv=fail; b=L3UGt3GiRNvMelEC0CN0tfI1TZstqM46tVP6afDgdAc4oRcdmkrk2weGf/4cbyHcPP5oDP9OiFj0+ePazp8YbbmCMhpHWlsooDxDI6SeZBXT+WoTGJho4/iviYlIaGjqSYzlUrpo0j/5uTHN7xxOydqNeCenaeUYRZR8Na4SON0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724646018; c=relaxed/simple;
	bh=4AacLi742qpBVqTABypB/sWRTOJcVTdfUnXZCbiDhto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LbsezirKnuwaYmIZvatkM+XeyYkxNTAK22kC8gEoIQFHEFv21hIlkv7xhdzNSV6Js1qvd5I34VcV6ygy+R6FISAlShIGq2usoHcGLOA2lxf9p/hxOeKZze1AVTUbEhpNboMm2lO8/o5Q6T+TxdTL/N9P1lX/5o0lBgUlOSnu4pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=D6annGJQ; arc=fail smtp.client-ip=40.92.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1s4ndr+W8w9TWJacnx6HREKEwZfIjtvOkFwHHmO5mxJsNo/tC3SIu7pUZ6TAFCbPru4zURl6XNpXeEmHHB25GeWZICBp7ssC2JM6H+Uq7W2Ii+AjoXdMUiPR2Fn9uZ/JJDZIaq5IVHvjsh5aC5tlb1QFsP5C0/iha8c6GnUNa7sUvpCsU0wrKZ0CzHNd1VSA6hflOYvYP1UWXv4A/RtH760HiTuBtHO9lco4UcwLypCCwVGLM2A4wXqp3hm45pKbxFpQ0veb+Bh0rgc0rRXK/HAD983Z5MgnERUotJQAHDUXgOGdk0aUPUR5CLLBkECyiZ91aqPBkCcsLyD1TZhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgv13swBROrvtt2K0/AmRRzN+36aQUlXboWJS2ADr/w=;
 b=yC1L5wD6SGoq172CTxxS3loVbwcO+WjfWUtEmHT7Nh/yhkhZ+h4mzlI3UDItPcaShEpgOTEe/yLyuwTARXyWDEIr8ow8G59AXr3Febj6S78AOcM0jI0oL99b867IxVJzqb35Bsvn6oZTH/Bc0bu5mZUj9M9qL9wY1UK8UPTjwogdklS3Kg+xjsdfGyp3rjlk1jy9RN4J/CkC7EiqWVSNOEabuJuge69IvDbLPwWuBI6VM6dkVqvXpJV8se599q2ORccYrF3OUCjjkrtaP3bxjlinr8/c+9Pim/DaFzwRW4UNHZWzipNAAyx1+Gz3IaoNlslCY/t0vFHl+yTKQTGJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgv13swBROrvtt2K0/AmRRzN+36aQUlXboWJS2ADr/w=;
 b=D6annGJQt+lfCAJPVQN0RWWaE18Mg1Pjqlnf/K9RKGaJ3V5VIz+vZS+LjQgjPUnOkRSO1EUtRBEvLOkBRFLS1Sw8GRQ6PIKxSGV9+oBdZ8e+XzVnWovWrDv0wqkFv6GB7AhLxJw5gKaztwtnp+ANg5m7a4YT4vUkxMexkSEEBgK0NsDjoSBvWtlqlTztSamgyP/Q4EbJKlTqiZLWx7gocovN6XBTZdb15szThYoTxLSUaZCpNDBDDRQ7shL6u4flPompDbfw296m5rwBQor7EFaUFXPi9Lhw/zs9f7PpcrYGLdUwHkY8/Tey/11oXTBPoPM364iF7czrsX5IUfv7bw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB5601.namprd20.prod.outlook.com (2603:10b6:610:153::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 04:20:14 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 04:20:14 +0000
Date: Mon, 26 Aug 2024 12:19:12 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID:
 <IA1PR20MB49536CC76EFDC406497844D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <d9a925da-2381-4203-a3b6-4cb892039d23@kernel.org>
 <20240826013230.GYA22924.dlan.gentoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826013230.GYA22924.dlan.gentoo>
X-TMN: [48Bz8OWHKZftLwFWRNw5Y31Cm+orL93KULuGo9xKN5I=]
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <tehvpxdjiujj4uv4lrnh3lqtallck6kwstvcgkdqf7snelofw3@ix3bmm7avc5c>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: da8649dc-f6a7-4c50-a708-08dcc58661d1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|5072599009|8060799006|1602099012|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	8hPmIElNXARasoSZyZ7QIXppIgsIK7O0CCbYBsdSUzIQvfBl3YMPxQubgeHRzi1xfzkCpGWcsK+i6QkMwHvKReDAG95XZkjL9hbJfCNy4qkpz8FW7eTlxertQrZT9MFSiNuOJ9spTc5CeIKfC6IKwHgVXghvHq9pbI3PX/FS6vHG+TxlmzJ0ZVV4FL186UTcnuhn83mg4cU8uqZVfFBjyAs5MOgTe+gGWeXNlUSmlSG0+mdERIaacw0bGW9+ITIyNxKWnYjmi1NoAJyDJAmCVGUW84+gypjf+NTV7R7f8qfvAsLWerwAuVkVLw1LvMljot3pf6G3AOXkBWDLPAJ1NdTEjjtapcYq7vOot8CafhFGKJCUfwBl1ftvUpV18kU1T7U64L9A2cJawb9v/aylcMaNDDg18Rmnztj1EO2xPft//6m9vwWAUTYLSQ/ivb5/1kHSf3Eq9rmMlIRegr5tGSKsg/bd9pODACuuuamIIGCizCWWqrD2y5hx9Y/P5R7uArpkpRHGxRgjX50JIszCpE5V3mnLX37r0GuOXNCxO1FppQJ3xoOzl8kIu0iohyh6jaM1yyIbR4xk67zf8u+NnJN9ohKv4oW7MqFZZHuf8WvI9UUkf6B0oneEgeuYbF1v/WCnAB6Hiqyu77YeTs99xc1I80kLomnDQ0K67jZgflRHUk0GooqZX6p7x1eOs/7gndUFDRReZQA5On5YKuAn1qIFkzssWoKWQ23LanuCdA1VeambiHbImnjE381srxhzAgDRFc/Hvw4ypSrQfhYrKlykWwvV0zPn0TYeBA5YzuzYIaR/5dGgSQP9BzEZFDqzjSxj85kLNIfK3DvzAki8HWpUtVJFsX6laCYeTg+4njE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TQ567y7kYYAtf3umW/oXdIHl4EvL6mmsfY/zZtkqHAk5graCStBfNKx8hofC?=
 =?us-ascii?Q?FUj+z8mCPsGAN9IrFPitctsDXd4usEIFp0AI6wT8p8A0/3lNfWCwBeytEswE?=
 =?us-ascii?Q?YLRCl5gyYAcHm7mnK92VU4kxLu0OBlNuLerlBlCy9wuZTVGaJKL5C2zmJBLl?=
 =?us-ascii?Q?F91/L3PFZAwsPLR28j7Ka3KePr5CbvyKrDigB/AJ5iOnepTV3naNw0OSRiqB?=
 =?us-ascii?Q?mbo2z1+Z85MAROEgdIL6hKEOjk9DHOqLYsC/Y21XOk4fvVS3pRuxMxkVhKY6?=
 =?us-ascii?Q?boSACaUznGjrbHCbdmjIyaZJtyeKQCK4ifULTkWeJcSOMZ88kzaKxQ9toMU8?=
 =?us-ascii?Q?3j2EgXx/u2LrO/fKO7/o3dmuS41vX2t73xOS3VH7TMUUi+7cCf6YedtxNmQ1?=
 =?us-ascii?Q?f7xosBBIZa8LW2IbAxGvtvB6WL8pcUU/idPvHVz03AICkq/KkaP4yVZSaJO2?=
 =?us-ascii?Q?FD4NVnuJvLdkVB2Qqws+PP+PACotNzIqh8G03BkLHecjK+7wNLzk6n8FfHHA?=
 =?us-ascii?Q?7HQuYdBBwZtTVNzcpmBLXVCnE/tkqPjTcpgCXdDakUaQDco0xWqgVYgwkUey?=
 =?us-ascii?Q?ysU9ZIDFSpc1prczeJBxVwsAlMmNxzew5EN5NFtdJDBfb913NqnLExxM7YfK?=
 =?us-ascii?Q?SuoMtIFivZ6hWlSJGepTICG808buouCm+FMhwagObJC2FeuLFjRBDwNGEKr6?=
 =?us-ascii?Q?bQudUMs5HX3Rb7bQKKEL/pQSFsA36XmGeJeuBX2i7ztY+CVEx6bFU4iqzDf2?=
 =?us-ascii?Q?7PVcmW/bytUuKQ0jW0++zRBYws/PKPj9kuu+Rc7B7hF0McJE7yZVzg+g3AhB?=
 =?us-ascii?Q?fIwSZnw0N9OrhRopnUSPA8bWsmo76JAMgiPyHMAU7y4Ppw9V5BhNr0vkmGFu?=
 =?us-ascii?Q?iEh/4YBSXLUoMozqeU9O8JZobVDYg2JHzLvh23iU2wNMFUUEIkLgb8HJYPv2?=
 =?us-ascii?Q?9Hp8LO4c1vjdhy2nI3DwemCO4YvxSqVm0Ozl5KZ+bD3r8HGd+rpSxRUoR9aQ?=
 =?us-ascii?Q?UW6TiFPE9yMJImHMlLEMcb4r/IZzM7/X2nDDueUd9We328IloyHRRPr+aFf9?=
 =?us-ascii?Q?VVciOyHrtSrB5ebamMY3gLSmoruU3C+IHiifSGUnllbavbLYhlZdUVtmxxCz?=
 =?us-ascii?Q?R33PE23Su63HjNm41MlqwneZOwWFWD6Olpn7fBF3WHHp6Dm22NMnkttPc7oE?=
 =?us-ascii?Q?XDvLTUY2CIA2LSgg8t2aG3n39pyV4aYJvmDRsJP5hxT2prxHoJbAcc8zPl7L?=
 =?us-ascii?Q?hCy7bFRT0FG7HeljX312?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8649dc-f6a7-4c50-a708-08dcc58661d1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 04:20:14.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB5601

On Mon, Aug 26, 2024 at 01:36:35AM GMT, Yixun Lan wrote:
> Hi Krzysztof: 
> 
> On 15:48 Sun 25 Aug     , Krzysztof Kozlowski wrote:
> > On 25/08/2024 15:10, Yixun Lan wrote:
> > > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> > 
> > 
> > Please use subject prefixes matching the subsystem. You can get them for
> > example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> > your patch is touching. For bindings, the preferred subjects are
> > explained here:
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> > 
> > It's "dt-bindings:"
> Ok, will fix in next version
> 
> > 
> > > 
> > > Two vendor specific properties are introduced here, As the pinctrl
> > > has dedicated slew rate enable control - bit[7], so we have
> > > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > > creating spacemit,strong-pull-up for the strong pull up control.
> > 
> > Huh, no, use generic properties. More on that below
> > 
> see my reply below
> 
> > 
> > 
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
> > >  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
> > >  2 files changed, 295 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > > new file mode 100644
> > > index 0000000000000..8adfc5ebbce37
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > > @@ -0,0 +1,134 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SpacemiT K1 SoC Pin Controller
> > > +
> > > +maintainers:
> > > +  - Yixun Lan <dlan@gentoo.org>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: spacemit,k1-pinctrl
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: pinctrl io memory base
> > > +
> > > +patternProperties:
> > > +  '-cfg$':
> > > +    type: object
> > > +    description: |
> > 
> > Do not need '|' unless you need to preserve formatting.
> > 
> Ok
> > > +      A pinctrl node should contain at least one subnode representing the
> > > +      pinctrl groups available on the machine.
> > > +
> > > +    additionalProperties: false
> > 
> > Keep it before description.
> Ok
> > 
> > > +
> > > +    patternProperties:
> > > +      '-pins$':
> > > +        type: object
> > > +        description: |
> > > +          Each subnode will list the pins it needs, and how they should
> > > +          be configured, with regard to muxer configuration, bias, input
> > > +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> > > +          slew-rate, drive strength, power source.
> > > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > > +
> > > +        allOf:
> > > +          - $ref: pincfg-node.yaml#
> > > +          - $ref: pinmux-node.yaml#
> > 
> > You are duplicating refs.
> ok, will fix it
> > 
> > > +
> > > +        properties:
> > > +          pinmux:
> > > +            description: |
> > > +              The list of GPIOs and their mux settings that properties in the
> > > +              node apply to. This should be set using the K1_PADCONF macro to
> > > +              construct the value.
> > > +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> > 
> > Hm why you need the ref?
> > 
> will drop it
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-up: true
> > > +
> > > +          bias-pull-down: true
> > > +
> > > +          drive-strength-microamp:
> > > +            description: |
> > > +              typical current when output high level, but in mA.
> > > +              1.8V output: 11, 21, 32, 42 (mA)
> > > +              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +          input-schmitt:
> > > +            description: |
> > > +              typical threshold for schmitt trigger.
> > > +              0: buffer mode
> > > +              1: trigger mode
> > > +              2, 3: trigger mode
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1, 2, 3]
> > > +
> > > +          power-source:
> > > +            description: external power supplies at 1.8v or 3.3v.
> > > +            enum: [ 1800, 3300 ]
> > > +
> > > +          slew-rate:
> > > +            description: |
> > > +              slew rate for output buffer
> > > +              0, 1: Slow speed
> > 
> > Hm? Surprising, 0 is slow speed?
> > 
> from docs, section 3.3.2.2 MFPR Register Description
> 0, 1 are same, both for slow speed
> https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned
> 

I suspect this should not be set separately, but with the 
drive-strength. The document shows that the DS field sets
both drive strength and slew rate. This at least tell the
value 0 and 1 may be different.

> > > +              2: Medium speed
> > > +              3: Fast speed
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1, 2, 3]
> > > +
> > > +          spacemit,slew-rate-enable:
> > > +            description: enable slew rate.
> > 
> > The presence of slew-rate enables it, doesn't it?
> > 
> yes, this should work, I will take this approach, thanks
> 
> > > +            type: boolean
> > > +
> > > +          spacemit,slew-rate-disable:
> > > +            description: disable slew rate.
> > > +            type: boolean
> > 
> > Just use slew-rate, 0 disable, some value to match real slew-rate.
> > 
> sounds good to me, since 0, 1 indicate same meaning, can re-use 0 for
> disabling slew rate.
> 
> > > +
> > > +          spacemit,strong-pull-up:
> > > +            description: enable strong pull up.
> > 
> > Do not duplicate the property name in description. You did not say
> > anything useful here. What is "strong"? bias-pull-up takes also an argument.
> > 
> there is a dedicated strong pull bit[3] for I2C, SD card kinds of pad
> I don't know how 'strong' it is if in ohms, will see if can get
> more info on this (may expand the description)
> 
> I think using 'bias-pull-up' property with argument should also work,
> but it occur to me it's more intuitive to introduce a property here, which
> reflect the underlying hardware functionality. this is similar to starfive's jh7100
> bindings/pinctrl/starfive,jh7100-pinctrl.yaml:154
> (refer to exist code doesn't mean always correct, so I need advice here)
> 
> I will keep this property unless there is objection, please let me know
> 
> > > +            type: boolean
> > > +
> > > +        required:
> > > +          - pinmux
> > > +
> > > +        additionalProperties: false
> > 
> > This goes up, before description.
> > 
> Ok
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        pinctrl@d401e000 {
> > > +            compatible = "spacemit,k1-pinctrl";
> > > +            reg = <0x0 0xd401e000 0x0 0x400>;
> > > +            #pinctrl-cells = <2>;
> > > +            #gpio-range-cells = <3>;
> > 
> > This wasn't ever tested... :(
> > ...
> will drop it
> > 
> > > diff --git a/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> > > new file mode 100644
> > > index 0000000000000..13ef4aa6c53a3
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> > > @@ -0,0 +1,161 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > +/*
> > > + * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
> > > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > > + *
> > > + */
> > > +
> > > +#ifndef _DT_BINDINGS_PINCTRL_K1_H
> > > +#define _DT_BINDINGS_PINCTRL_K1_H
> > > +
> > > +#define PINMUX(pin, mux) \
> > > +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> > > +
> > > +/* pin offset */
> > > +#define PINID(x)	((x) + 1)
> > > +
> > > +#define GPIO_INVAL  0
> > > +#define GPIO_00     PINID(0)
> > 
> > Not really, pin numbers are not bindings. Drop entire header.
> > 
> Ok, I will move them to dts folder, which should be file
> arch/riscv/boot/dts/spacemit/k1-pinctrl.h
> 
> > ...
> > 
> > > +
> > > +#define SLEW_RATE_SLOW0		0
> > > +#define SLEW_RATE_SLOW1		1
> > > +#define SLEW_RATE_MEDIUM	2
> > > +#define SLEW_RATE_FAST		3
> > 
> > Not a binding, either. No usage in the driver.
> Ok, will drop it
> 
> > 
> > > +
> > > +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> > 
> > Not a binding.
> > 
> same, move to dts
> 
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

