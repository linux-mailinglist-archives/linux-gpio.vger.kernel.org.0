Return-Path: <linux-gpio+bounces-9136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E195E7A6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 06:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2084A1C2110D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 04:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447866F2E0;
	Mon, 26 Aug 2024 04:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tBzw7fBz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2022.outbound.protection.outlook.com [40.92.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D37407A;
	Mon, 26 Aug 2024 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724646256; cv=fail; b=gBsPvEqOroAYe4Qh7G5EROAtz/NpJsDXDzTD+nau9/uJUmv3XRRHPBcRyaL4vz0nPxrXM2zvYD2uuYpGI7WU89bZwscmCwiMmN23WTbAwIkAvX9hi2lVL40b9l7r5dlKR4fTUztLaipZ5yxxHOmK91LZDETjPSH3P7jwekpL2ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724646256; c=relaxed/simple;
	bh=Uj7yEIzbq0oTPR/KEflYBOjCVlqRThWsz8/Q9RDWdgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UKkLvZ5c0VFdHELW9ge56KVMGHPy3aFGZfij4gN7dIWzA0UUmzOWnLdjGS60yp8o8s8jaN1birZSU+8kjrq8A1W2kR4TByVTnQ8zIlHNKN4MNCw9wlsDQs46LnDqU2MkdBcBWvDURGBfIMkDRoflw2u24A7IElrw+f9OeTP6icE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tBzw7fBz; arc=fail smtp.client-ip=40.92.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFAPBG+DsteY+Xwc1i4gB6urUhAQ+/R9AIxu1/jUcK1gT+q8q48ykbSgHP/GeaxG86SJKjyGAzcv3OyWypMmhdkhGfXh/hJKzuwhAjCYM1TPRtEiD4g3cvR6zXrbGAlNWAzkJaqI08RtdfSzij8DLvvGUiFHWV9Tw1Mmeoi5obIBo9AHYvrUfQNyXfoWKcf6w13vd8daMiwrI24T3/+DqxBDcGBX9dheedi1ZjSac3+r8k+MgloKX0zDznrZ51+oDVahyYwLfoFzz5KnbCTWt6adwJLaxIHcfQSjwaCrr1SEHJhW8pqdkOdrSs4qe7vIISFNf/+/jH3YNc5Jdq4Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjD5juqYWaTIPbb2RyIyKaYUvEvvMLalp7qw11/ccCE=;
 b=QH5dFlXx3Qqz2ig3kVJXYFc292WtokW8IbJ3IiWnoO3+mjY3J8SjAGznX1EMAZwurKamkYFL8C2D/yXnQhCMXZDpVeGizjmO4y4Nzk+j5OgxigvZRdZIynUQNpQfeBS5A6cflbJolIAUd+qtRHsaMNlVtVNb+8ja3x2OUVfOt7z2g+OAjEyVQh7Y53iW6gutLkhmQyc/m562K095LU8thdlMI3NIxwQom8xQFKORm74Lu24E8w/J2qphdZTIJ9KkM2lz0vbnClJRLBkv6QQpUfm6C9WQQFVoXb3Coq8hpRbEm7CdiR+BJh1L64rWNuBu6O1WF6hfWkmftQjzZ3TkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjD5juqYWaTIPbb2RyIyKaYUvEvvMLalp7qw11/ccCE=;
 b=tBzw7fBzxs7x7zHc6mWKjMKSZxNK+8q03PALWHfvaKEUle1RphoWRNXugWTZ0X6T4hdTIsQX4xCyv1Z/e4bFvayTrs7eus7JUCyfqAfubI7UcgRT8iCFSCoxCcKzpkttbd+1muVSh2QxnJkk6hJwQ+/+X5XoW15MJHXVl/Pem9C2qeeQlsInMYZ8gCqEbhI4EUV0o+nIf+NNQTM20btdG4psMQujCksBuVQxHEDaX40PyO1udP7cHQKm1+9q2x1IrnUV2Qu/SHWYGCGAaIUHCR2M5fP0H0F6TAESaACtCotaLkST+byr3IkXNh/1WvhF2h7g5655snnmeyzy+BGa1g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB5601.namprd20.prod.outlook.com (2603:10b6:610:153::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 04:24:11 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 04:24:11 +0000
Date: Mon, 26 Aug 2024 12:23:11 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID:
 <IA1PR20MB49537B38B1A086B6FD1CE5A2BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
X-TMN: [tfe5MivPzHVBFdzJefpVzxfFigONNbbH/4XZDjbtCMs=]
X-ClientProxiedBy: OS7PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:604:256::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <bpohbsuxjrgorh5bw2kw7pjfgw4mwzbcdaenzv6o5d42sc24dg@odcapjotqzdm>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac00db-a1cc-4583-4d9f-08dcc586ef17
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|5072599009|8060799006|1602099012|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	caJd0tSE5LobYjsn1LOYfBVY4SbXyB2KRENFQ1xVH9GKs/AsQYzrMgYYBN5V69gI8I5BX9P+HyUaHaOocPnttcfVVLEUpjrZpxcqf/oACfJZ5TWvH8Za9QnDbnDlhObfxBAoJnfQtcUOad3V6Bke+QmZh3J6QFEke0/jFjW0qn69zkLD/mTLKlz8HRSWutvt5zlRCelrNRvbPuQw4xZV7BESJFRwKGkWlldIne6mlrom0CQHZSUltBsRHECtauThwsZzjl8i92bFh8ChQ3pKWXRyqIhOKFzxK3vOWmS91v/ai/AEIHtnjNE4ohnaGlEGo1IZse2lGxjs68kv7/LIXFOKaHwN5NQdqSZYI6pTwNW0R7wSGJJ2r175N4pCiIJk+pupk4ScHka9MsCM1mju1lH6XcVMNx27w+M2wTZmA9SHy2zwqE9IPkkPLzPnfi49ec6rUI7ND93iL7/KXutoYfmRBwZ0y1Eb5uXm0qm2JJJIx4yHaH981ZW5NcNa+Af+mZZsjcTkTZ7U04VOBvz5fKY8r6h/SGKdhb1iFm+NZCjLnDFD1ZC4L0LXr2K5jIYROu9bjGUcmVDLQGdQqX1NhRWf3QzXCGU69kjTk3niMu0bv7Fq4BfOtxKF6DHAHZkAaumkPbWIZaSDz+1KoFVFRjKR3oFPTQfiURr7Rx7KQX/iq68oK5nZlkMS+AS33jqYmM6DV286uatMklPUMW3yfd3PSimFrJPhZzRyWid/Q4jhDbLKmWe4xyivdYJmflQCTR0FZ4xAn5lnobfg/CmA2UMe/CYG+WwDRS6gyRUck7Al/A9pWvb/Mycq+C+60uu+jw24qK9chzx+P5WhD7wDESWO2oGDRa3bbmFDtiQLels=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KWC/RqpVWQDAsM0EbI9rG+r144YkGJx2N2NYqOxAUqCkEX+O5H8XlcnEk3yJ?=
 =?us-ascii?Q?2kCRmjheCTcXgUEVbdwr5St6F+MQzEIZw4fLQO/o0fhIKTSpOqk0Lrkqx8zy?=
 =?us-ascii?Q?bu6WkoJ122AppobzbTmyVYfC2p8zM781yrxpNi8mkDm0lLskzWImx5g0tBX/?=
 =?us-ascii?Q?6li5PQwxgmUyeQPXBqJ/Vn7Q5ZBxXW6EmLIZORqSIXWVx0/wXES+pD1OLq6D?=
 =?us-ascii?Q?Y8YsfHqUZBtHKSFuBFtWNLyCoCBONmwhjLBg6ZpBpIGM5u9tnhCvaHxRdReI?=
 =?us-ascii?Q?lCUWHhPcy22g6VV0maDP8LKNrcfNiegaKN3DoFqUGlwh/CgepJMzeRZ9+f5u?=
 =?us-ascii?Q?06SLwDufp3NwNWFRbBROmVdgiZQCZG5CXaCWJqQETsfpe7+yv+joXTX8ONNB?=
 =?us-ascii?Q?M0V2XvapEEpxxM/ms9v+94QF7MQ+YYveKUQbnt6ZG6AUk7OCiqygkFfUTlQx?=
 =?us-ascii?Q?LcvMdmQfnfPM9Jo1WhN6C7rvxvLPmQiVU5JVchq2t+kct3/x9k1/VvWJMl98?=
 =?us-ascii?Q?cVjD27qV0zvIIXFuQmpXhuUrhcaZwqLjASr/PKh57Ze9vGfyS5OBmB5+8muH?=
 =?us-ascii?Q?ZRhb4JIulfjd0UoT3tUbCLyWEfMD8qHQKhKoglDpYdr9oBl4G99XjxmfEV03?=
 =?us-ascii?Q?kXdFCkJZBf+2x0zb/vPO9SwI/owCm9E6Ik/wlImJHybs04yU6fvCjF4M2jgu?=
 =?us-ascii?Q?eB+m3cnZ27+RaXSEZ2J6fYnWP6iLEC9esAfMlKGPe7p8Le9eSZYIM4nrBzOr?=
 =?us-ascii?Q?ktlr2Ozailb7Aij3jt+TGMmuJ9y481GhKcOxk1aZ0D0nnVpOqo99uL7NV+E9?=
 =?us-ascii?Q?M+KdMeFEpPv0k8dmihbSojP6Jf9gU7T+hu4FgkXc+JINWUN2Lunpj9NWihNH?=
 =?us-ascii?Q?OWu2Htl2mSsa9SdMOUAQi1G6ew/6U12C4jQr5DlmtZ8sDum2ZS6wwc9y0sHI?=
 =?us-ascii?Q?hYQk11iVtGfOUYA/rI3Dma3Ony3nd0oOrbSbRzuQPdgbbMYFsPDTEE+vXRik?=
 =?us-ascii?Q?Pfckk5ewTUOBTutIEvJb0EPm+DU5FTzI6/Qeky8OEe3/JNrS4FgopdZTHzPd?=
 =?us-ascii?Q?jyjwijZRu5+Rbg8iKIPGmUbntie2WwqMHeFT/ZQzaSYdLOObBlOujr1QuDgx?=
 =?us-ascii?Q?TFtYVoKjvq3LWRsjAW732ucU/wGbe7V/4+PPdZWBBrZlJDG99Hlo3np18v0L?=
 =?us-ascii?Q?6KWpdM9ZNe33TiP/PIWT862K4eO6hqX94B2SwDS3fBntHGvkdIE4bw00gWIZ?=
 =?us-ascii?Q?Lze6jdwIGWgqm+O0Lw4E?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac00db-a1cc-4583-4d9f-08dcc586ef17
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 04:24:10.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB5601

On Sun, Aug 25, 2024 at 01:10:02PM GMT, Yixun Lan wrote:
> Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Two vendor specific properties are introduced here, As the pinctrl
> has dedicated slew rate enable control - bit[7], so we have
> spacemit,slew-rate-{enable,disable} for this. For the same reason,
> creating spacemit,strong-pull-up for the strong pull up control.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
>  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> new file mode 100644
> index 0000000000000..8adfc5ebbce37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SoC Pin Controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl io memory base
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> +          slew-rate, drive strength, power source.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the K1_PADCONF macro to
> +              construct the value.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength-microamp:
> +            description: |
> +              typical current when output high level, but in mA.
> +              1.8V output: 11, 21, 32, 42 (mA)
> +              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +

If there are no other runtime restrictions, you should add extra
check with the power-source, then you can always get vaild 
settings.

Regards,
Inochi

> +          input-schmitt:
> +            description: |
> +              typical threshold for schmitt trigger.
> +              0: buffer mode
> +              1: trigger mode
> +              2, 3: trigger mode
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          power-source:
> +            description: external power supplies at 1.8v or 3.3v.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: |
> +              slew rate for output buffer
> +              0, 1: Slow speed
> +              2: Medium speed
> +              3: Fast speed
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          spacemit,slew-rate-enable:
> +            description: enable slew rate.
> +            type: boolean
> +
> +          spacemit,slew-rate-disable:
> +            description: disable slew rate.
> +            type: boolean
> +
> +          spacemit,strong-pull-up:
> +            description: enable strong pull up.
> +            type: boolean
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pinctrl@d401e000 {
> +            compatible = "spacemit,k1-pinctrl";
> +            reg = <0x0 0xd401e000 0x0 0x400>;
> +            #pinctrl-cells = <2>;
> +            #gpio-range-cells = <3>;
> +
> +            uart0_2_cfg: uart0-2-cfg {
> +                uart0-2-pins {
> +                    pinmux = <K1_PADCONF(GPIO_68, 2)>,
> +                             <K1_PADCONF(GPIO_69, 2)>;
> +                    bias-pull-up;
> +                    drive-strength-microamp = <32>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> new file mode 100644
> index 0000000000000..13ef4aa6c53a3
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_K1_H
> +#define _DT_BINDINGS_PINCTRL_K1_H
> +
> +#define PINMUX(pin, mux) \
> +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> +
> +/* pin offset */
> +#define PINID(x)	((x) + 1)
> +
> +#define GPIO_INVAL  0
> +#define GPIO_00     PINID(0)
> +#define GPIO_01     PINID(1)
> +#define GPIO_02     PINID(2)
> +#define GPIO_03     PINID(3)
> +#define GPIO_04     PINID(4)
> +#define GPIO_05     PINID(5)
> +#define GPIO_06     PINID(6)
> +#define GPIO_07     PINID(7)
> +#define GPIO_08     PINID(8)
> +#define GPIO_09     PINID(9)
> +#define GPIO_10     PINID(10)
> +#define GPIO_11     PINID(11)
> +#define GPIO_12     PINID(12)
> +#define GPIO_13     PINID(13)
> +#define GPIO_14     PINID(14)
> +#define GPIO_15     PINID(15)
> +#define GPIO_16     PINID(16)
> +#define GPIO_17     PINID(17)
> +#define GPIO_18     PINID(18)
> +#define GPIO_19     PINID(19)
> +#define GPIO_20     PINID(20)
> +#define GPIO_21     PINID(21)
> +#define GPIO_22     PINID(22)
> +#define GPIO_23     PINID(23)
> +#define GPIO_24     PINID(24)
> +#define GPIO_25     PINID(25)
> +#define GPIO_26     PINID(26)
> +#define GPIO_27     PINID(27)
> +#define GPIO_28     PINID(28)
> +#define GPIO_29     PINID(29)
> +#define GPIO_30     PINID(30)
> +#define GPIO_31     PINID(31)
> +
> +#define GPIO_32     PINID(32)
> +#define GPIO_33     PINID(33)
> +#define GPIO_34     PINID(34)
> +#define GPIO_35     PINID(35)
> +#define GPIO_36     PINID(36)
> +#define GPIO_37     PINID(37)
> +#define GPIO_38     PINID(38)
> +#define GPIO_39     PINID(39)
> +#define GPIO_40     PINID(40)
> +#define GPIO_41     PINID(41)
> +#define GPIO_42     PINID(42)
> +#define GPIO_43     PINID(43)
> +#define GPIO_44     PINID(44)
> +#define GPIO_45     PINID(45)
> +#define GPIO_46     PINID(46)
> +#define GPIO_47     PINID(47)
> +#define GPIO_48     PINID(48)
> +#define GPIO_49     PINID(49)
> +#define GPIO_50     PINID(50)
> +#define GPIO_51     PINID(51)
> +#define GPIO_52     PINID(52)
> +#define GPIO_53     PINID(53)
> +#define GPIO_54     PINID(54)
> +#define GPIO_55     PINID(55)
> +#define GPIO_56     PINID(56)
> +#define GPIO_57     PINID(57)
> +#define GPIO_58     PINID(58)
> +#define GPIO_59     PINID(59)
> +#define GPIO_60     PINID(60)
> +#define GPIO_61     PINID(61)
> +#define GPIO_62     PINID(62)
> +#define GPIO_63     PINID(63)
> +
> +#define GPIO_64     PINID(64)
> +#define GPIO_65     PINID(65)
> +#define GPIO_66     PINID(66)
> +#define GPIO_67     PINID(67)
> +#define GPIO_68     PINID(68)
> +#define GPIO_69     PINID(69)
> +#define GPIO_70     PINID(70)
> +#define GPIO_71     PINID(71)
> +#define GPIO_72     PINID(72)
> +#define GPIO_73     PINID(73)
> +#define GPIO_74     PINID(74)
> +#define GPIO_75     PINID(75)
> +#define GPIO_76     PINID(76)
> +#define GPIO_77     PINID(77)
> +#define GPIO_78     PINID(78)
> +#define GPIO_79     PINID(79)
> +#define GPIO_80     PINID(80)
> +#define GPIO_81     PINID(81)
> +#define GPIO_82     PINID(82)
> +#define GPIO_83     PINID(83)
> +#define GPIO_84     PINID(84)
> +#define GPIO_85     PINID(85)
> +
> +#define GPIO_101    PINID(89)
> +#define GPIO_100    PINID(90)
> +#define GPIO_99     PINID(91)
> +#define GPIO_98     PINID(92)
> +#define GPIO_103    PINID(93)
> +#define GPIO_102    PINID(94)
> +
> +#define GPIO_104    PINID(109)
> +#define GPIO_105    PINID(110)
> +#define GPIO_106    PINID(111)
> +#define GPIO_107    PINID(112)
> +#define GPIO_108    PINID(113)
> +#define GPIO_109    PINID(114)
> +#define GPIO_110    PINID(115)
> +
> +#define GPIO_93     PINID(116)
> +#define GPIO_94     PINID(117)
> +#define GPIO_95     PINID(118)
> +#define GPIO_96     PINID(119)
> +#define GPIO_97     PINID(120)
> +
> +#define GPIO_86     PINID(122)
> +#define GPIO_87     PINID(123)
> +#define GPIO_88     PINID(124)
> +#define GPIO_89     PINID(125)
> +#define GPIO_90     PINID(126)
> +#define GPIO_91     PINID(127)
> +#define GPIO_92     PINID(128)
> +
> +#define GPIO_111    PINID(130)
> +#define GPIO_112    PINID(131)
> +#define GPIO_113    PINID(132)
> +#define GPIO_114    PINID(133)
> +#define GPIO_115    PINID(134)
> +#define GPIO_116    PINID(135)
> +#define GPIO_117    PINID(136)
> +#define GPIO_118    PINID(137)
> +#define GPIO_119    PINID(138)
> +#define GPIO_120    PINID(139)
> +#define GPIO_121    PINID(140)
> +#define GPIO_122    PINID(141)
> +#define GPIO_123    PINID(142)
> +#define GPIO_124    PINID(143)
> +#define GPIO_125    PINID(144)
> +#define GPIO_126    PINID(145)
> +#define GPIO_127    PINID(146)
> +
> +#define SLEW_RATE_SLOW0		0
> +#define SLEW_RATE_SLOW1		1
> +#define SLEW_RATE_MEDIUM	2
> +#define SLEW_RATE_FAST		3
> +
> +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> +
> +#endif /* _DT_BINDINGS_PINCTRL_K1_H */
> 
> -- 
> 2.45.2
> 

