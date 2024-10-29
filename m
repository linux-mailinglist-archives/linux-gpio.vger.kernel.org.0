Return-Path: <linux-gpio+bounces-12275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD259B4009
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 02:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E169AB21BA0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 01:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B43E7DA9C;
	Tue, 29 Oct 2024 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Meyfu93l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2046.outbound.protection.outlook.com [40.92.103.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61779F6;
	Tue, 29 Oct 2024 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167189; cv=fail; b=jlTk0DK3WYthWzqeP1YNncb11CrKmJ1JWv1PezEw5nsgPjImcDtcJnt5JT+Q6LvqzfpCmzBNmgqDQD07Ca34RfsQKCi03012TCG91jPZLlCJJgLoe7XfnEvgVqFQbjG/xlFbw1DEv1B7Zq1huBZN96nY4U75dNtgkoXJfNOTjiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167189; c=relaxed/simple;
	bh=zOwJZAhTGqXjTwi+fC2pmRpCuJs/9sQZNYN9qfE52cY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cAoNx802AqNeE4bab0j0fhSVc5CB/nDl/DwVp3XCxkB7emkhIOc6KvCo6k9vKDOCQvlj0YJ9+Uc9KERVidhOnK4lP7i03QHPBSU0hMDKwxrQuGq/Nb4D6gsh6XY1M0f1Jpa+GSkSNMWuZ8/S5eO/HZ4glPUhvbLEwstmJlnIzEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Meyfu93l; arc=fail smtp.client-ip=40.92.103.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhWhQ9JjnUD8cUlEIFSEdNXYePruw6ewddpDsD940T6h13zWYBu13aEBhgnzA1K+xCnLXebq985NGOf09myfROnY2FeTkFeDcEPQrXJatDec8hUQ6IinJbCItJmEa1nBW/w6A6cYIi9L1kQ7Ozj4Ip/BLcPpdOQMDv1Oi7g07uplejP4WNixd2e9piymEI8S/HmqO5TL/agBbsWmOJGN51D3efUoqLtLibkkevTazBhRJTa8krdZ7uGcDNJlVxmcL7VEtDudjXbYgRCRfNdseHxPIwJI3HnUB0urTcYWHMvoK5UIiWyBI0fYzC92Hg+hsN/fwXrl0vSy9BnqsnuVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0f018SJm00XhxPywQ0wAlNcHN8MWwjmgb1H+ZUFPmw=;
 b=HPlbAGduSAON4sLOxPhc0lK/cVIT+3hcE3IM/gPbbSxxTDbOl4JxUiQmmfDBhYgw5/u/HRVMOhwacSm81WruFEZktjIoYogPEsJRfIwomv/DdoQ5d868NM6Kp/eUDTRHUGzMKSNW81hp0ZwRbtePCd0gpozESpUAPofVmo0phTcyH7AqL2DB8QzQsReD8XTHN9tTQDM0mQV4Wc337iu2RN+TAExb1OqWpX59lour4eXVhuFLalHJZWj5cN51fdTXh4/BPmpA1PlXeVXIr2WUivgZJucDIRA0FWw+u7EJ/SJzQk9KOzFymKYvQ4ichuNVXTWNHto5/3m1s6CgLnWO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0f018SJm00XhxPywQ0wAlNcHN8MWwjmgb1H+ZUFPmw=;
 b=Meyfu93lTtOIe5tlMsiZ9NOGRTWYbE6LwfwfmPOninbEJFx4pgT/9DhXprNo9US22MTsm6SvZg0hWzSevE36fIvMThpnQhhqoiETnctIWC9c9644fyy0BUrxbzECafEj1qbStDX1CmVTuuPhlY/+Fr162vG7YjD03ithNj4lDFXP6rBipWumGyQeNOcN1FFcYBCmVn75p4Pe4VOuROHY/jNtEDcIWVl6rR4ZJJbpfTfnIN5+GBhXE9+aY3ymm1lE6/dw7aGJlaUaoxMmPvp6QR4/tm11m+XwMcQ8YXJ68eUMtdwcoLypQyviAh8llZKPaWzIQkzLvAGg6jxrUQOhJQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN1P287MB3807.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.31; Tue, 29 Oct
 2024 01:59:38 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 01:59:38 +0000
Message-ID:
 <MA0P287MB2822C6EF567040AAEB9F82A5FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 29 Oct 2024 09:59:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042
 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241024064356.865055-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <c54b37b2-0f74-439f-a616-bbef3b8fdef2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN1P287MB3807:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bf4e4c-4ace-4cde-f746-08dcf7bd5819
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|8060799006|5072599009|19110799003|7092599003|15080799006|3412199025|440099028|4302099013|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info:
	IDj93+TLQpsIj8tCZRN0uhyZIiV4CMz0R1lhZG4iJe0zJeejk+QNQby9JXv8dlaMCRMrN4s99YFIZthHJjQfhIM7Ls0iNo6uwgI5TDeIownArDeDie444w1bouRmsF5A+93D1u25sJXuHiCxNDXnoF01/4mlWKze6aqB5QH/jjm77ataxnsTmHU70MfTqyWjntrka2TwX3+hwZR6hryA8K9bSPBDrTi0UygNsvlhSg+WdQzD1i15esUXtR1NuG/YqBGFEd+8O68WrlUyoak/U2mTHlndJVD9ngcG37hcpHlZNP/2cCKCqf08T7EsYTEQSs0X2NdruQPbLFHQbar6CCbblGg8it0xZEarrfAXHA/LCgRrWvXCW42Rkl/00DxWbTADAh03o7EE7Pph3DDt39qSAGtt1sEkGbrwO86mM4lKhg+gsYZERfL1a+3AymPBNAM+PF6IFTqC/Dc3wE+FdU4jJ0XmGDvI3NHEMASAuV7d67Mbz04M4NaCv+xn3GDDb5QrXOywNciOEJNyoFJi6adhKWwgy57GXxI53klBhZHslZcH38SlrHCqNM4w6EJORfE2BSB4A2u/kbylM0+UcJQdxh9IE63DjBchdx/Z+hucpKJIvidIynS4o12pKLiXx49RPFQRrN876/fipNevyAoQSxScti+71OIKo6MK/GBolJflBspfaDgSGBXITRpEyxIfKXexbKSNdkCuTpZHktIxQsEzkdMX6+KwEFvqkDwWIon7kYtM3Jn/9vnSdDLIwLZ92G/myFfVrIHMu4GySU0ZnDaFuob6AkHOUDXFMdh4KwX7EtdTWOUuK0knu2whVGitoJkD0aAjxzkS8BiHKvom1eL4rWVEI1qrIQS3zr7ivJcp9S2644KR7c6f7R82EA8vFTanxweLnzeJEp9FCQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJYb2t6bUhwRWhpdTJMOXVpZDVwTEI5U2lPNXdsUFR4WTk0SlplZzlXVnBY?=
 =?utf-8?B?RytwczRSaDhUVFRZblZTWFNkK1NFMWZLTFIrL2czWm1LMkZsVXFmQTAzVy9n?=
 =?utf-8?B?eFpidkFOdGgzcjlBNmNWbDBMZ28zaS8xR3MzYXBLamg5QldtQkhxUVFndkNv?=
 =?utf-8?B?WnF0bVg0RHAzZ0x3RmZublBBK0Raa3JLcWV1TzJuS0Y0Qm92WXZkcWJUU2xk?=
 =?utf-8?B?N1M4cU9FNG5IU01wWkJ2MlNsTnRRV1h5QVRjR2JtczY4NXNaQ0J2bEo5RE9M?=
 =?utf-8?B?L1NGei9hTWZxSnJZWG92VmpEUzRsOFB2Rm03UzZmcjBROStaZ0taMFp4ZU9L?=
 =?utf-8?B?WG9uYzhGNFR6UkFqL0Z1QU5tMmEwNXBJeFA0MVJMYnZKTUhmaE1GZVpSMU9u?=
 =?utf-8?B?T0NuT21RQkY4QlF5OThjbUc5SC9SV0xON1M5YWZJOFdBa2JNR1Vhcll1cVNn?=
 =?utf-8?B?eDZoYmQ4RWx1TGtvU09xZVkvd2ZjMzBueXZmcXE4NjVuU2dmR0hvVXh0WWhs?=
 =?utf-8?B?ZUlNb0YzSyt6RUdJRXFadzNZV2ZXR0M4VVRKclB1WDA1QmsvNSswWHNoZ1hH?=
 =?utf-8?B?amgvVXFJSGtOOHdzY3FIbWtZTDVqNTViWnkva2wzeXlkRGFPTmRWYzZYeEpw?=
 =?utf-8?B?QS9DSmlNVHF1ZlhzcW5VRGxheWl1Rm1zaWxic2RGUHVqb2Z1bHhrdXJnNU80?=
 =?utf-8?B?Z2xnQTZsWVk4Y1B4Z0Z1dG12ajE5ajYvNUtCUnRNdDNxWXVlTTVQL21sZDQy?=
 =?utf-8?B?SHdZVXRRcUNkMkRSVTBaY0pxK1owM1ArNXUzZ0tDNG9iaTVSb2oySzZrWlRV?=
 =?utf-8?B?TjY2MnBha3N2MEZsUlI0MVNEWnJSMENFM2NtelJxeVliSjlkOGRsYWxEd25k?=
 =?utf-8?B?YTlsVGd3N0MrSnRBQ0g3ZzRzNlE2NzZyWWJGVDdyZXJCbXNZWjk0YXN0S3R5?=
 =?utf-8?B?V005cnhqaUJBZFNqUEdXQ1BLWDhjRHYyWFVLWHVVRTYzcnVBTloybzNmSXVZ?=
 =?utf-8?B?ZFI3WkJCZFNlQ3plbC9IRmxtaHh4T2liRUU4cG45KzBTb0lDWkgrNWUwZE9I?=
 =?utf-8?B?bDl5d0FtbzBJck92Y2s3blR5UUxHRUl2RkJIZkRDYVBFZ3BBTTJWNVVzMHM0?=
 =?utf-8?B?SEFoMDJZUTROdUQwUm55dXRKSllwbEF3eFpWd3J5SzZHRThOWmVmbU5MT3VZ?=
 =?utf-8?B?S3JuYWttQXd0bzBzSTlBL0xhc3VGRXBJS1BWZ0VmOWpQQm40M3MwRmRma3J1?=
 =?utf-8?B?NkJIb0JXNkw4WXZqbXB1dzV0K0xCbjhOa0srb2p3ZVZiMnE3QU9JZ0JVd3FT?=
 =?utf-8?B?RmZEemJQLys1M3BaY29HcUxqRmVPVWQ5bEQxTmlqWDQyTGRxOTZhYnR4OWxa?=
 =?utf-8?B?MUE4SGNVRURubi9tUXpOTDNjK0ovWHVrTm1kZHE0RG9jVUpzV2NqMjg0RnRG?=
 =?utf-8?B?UDdERXZCNndlYXMrRy9nRnhmSHNUM0dYeTVCUEJXVEV4VjZYclpyMUZQdlJj?=
 =?utf-8?B?d2Zqc1cyZjdUSWJSWDdNbzFnQUlZRTJveWVYdnd1S0dnRkVjdlZjNXhYaUcy?=
 =?utf-8?B?dWhUZWg4WTcwcmd5U1UxRTFac3BMR2tXSHhySzJZUktuYjlXZmxaQ09ETmFm?=
 =?utf-8?B?OVpqQzJpTmwyL2lXaE9JOXpuUkNoNXhDK0prR2FxUVZYZTUybk03R1R6WUxa?=
 =?utf-8?Q?Cy1MeW8azhpaF0jTpbTk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bf4e4c-4ace-4cde-f746-08dcf7bd5819
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 01:59:38.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3807

Hello ~

On 2024/10/24 14:43, Inochi Amaoto wrote:
> SG2042 introduces a simple pinctrl device for all configurable pins.
> The pinconf and pinmux are mixed in a 16 bits register for each pin.
Can we change this sentence to "For the SG2042 pinctl register file, 
each register (32 bits) is responsible for two pins, each occupying the 
upper 16 bits and lower 16 bits of the register."
> It supports setting pull up/down, drive strength and input schmitt
> trigger.
>
> Add support for SG2042 pinctrl device.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++++++++
>   include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++++
>   2 files changed, 292 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
>   create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
> new file mode 100644
> index 000000000000..5060deacd580
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sophgo,sg2042-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 Pin Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,sg2042-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description:
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
> +          be configured, with regard to muxer configuration, bias input
> +          enable/disable, input schmitt trigger enable, drive strength
> +          output enable/disable state. For configuration detail,
> +          refer to https://github.com/sophgo/sophgo-doc/.
More accurate: https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX
Not GPIOMUX, should be PINMUX.
> +              macro.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength-microamp:
> +            description: typical current when output high level.
> +            enum: [ 4300, 6400, 8500, 10600, 12800, 14900, 17000, 19100,
> +                    21200, 23300, 25500, 27600, 29700, 31800, 33900, 36000]
Where can I find these enum values in TRM? I just see the field "Driving 
Selector" occupies 4 bits for each pin.
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
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
> +    #include <dt-bindings/pinctrl/pinctrl-sg2042.h>
> +
> +    pinctrl@30011000 {
> +        compatible = "sophgo,sg2042-pinctrl";
> +        reg = <30011000 0x1000>;
> +
> +        uart0_cfg: uart0-cfg {
> +            uart0-pins {
> +                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +                         <PINMUX(PIN_UART0_RX, 0)>;
> +                bias-pull-up;
> +                drive-strength-microamp = <10600>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2042.h b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
> new file mode 100644
> index 000000000000..79d5bb8e04f8
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_SG2042_H
> +#define _DT_BINDINGS_PINCTRL_SG2042_H
> +
> +#define PINMUX(pin, mux) \
> +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> +
> +#define PIN_LPC_LCLK			0
> +#define PIN_LPC_LFRAME			1
> +#define PIN_LPC_LAD0			2
> +#define PIN_LPC_LAD1			3
> +#define PIN_LPC_LAD2			4
> +#define PIN_LPC_LAD3			5
> +#define PIN_LPC_LDRQ0			6
> +#define PIN_LPC_LDRQ1			7
> +#define PIN_LPC_SERIRQ			8
> +#define PIN_LPC_CLKRUN			9
> +#define PIN_LPC_LPME			10
> +#define PIN_LPC_LPCPD			11
> +#define PIN_LPC_LSMI			12
> +#define PIN_PCIE0_L0_RESET		13
> +#define PIN_PCIE0_L1_RESET		14
> +#define PIN_PCIE0_L0_WAKEUP		15
> +#define PIN_PCIE0_L1_WAKEUP		16
> +#define PIN_PCIE0_L0_CLKREQ_IN		17
> +#define PIN_PCIE0_L1_CLKREQ_IN		18
> +#define PIN_PCIE1_L0_RESET		19
> +#define PIN_PCIE1_L1_RESET		20
> +#define PIN_PCIE1_L0_WAKEUP		21
> +#define PIN_PCIE1_L1_WAKEUP		22
> +#define PIN_PCIE1_L0_CLKREQ_IN		23
> +#define PIN_PCIE1_L1_CLKREQ_IN		24
> +#define PIN_SPIF0_CLK_SEL1		25
> +#define PIN_SPIF0_CLK_SEL0		26
> +#define PIN_SPIF0_WP			27
> +#define PIN_SPIF0_HOLD			28
> +#define PIN_SPIF0_SDI			29
> +#define PIN_SPIF0_CS			30
> +#define PIN_SPIF0_SCK			31
> +#define PIN_SPIF0_SDO			32
> +#define PIN_SPIF1_CLK_SEL1		33
> +#define PIN_SPIF1_CLK_SEL0		34
> +#define PIN_SPIF1_WP			35
> +#define PIN_SPIF1_HOLD			36
> +#define PIN_SPIF1_SDI			37
> +#define PIN_SPIF1_CS			38
> +#define PIN_SPIF1_SCK			39
> +#define PIN_SPIF1_SDO			40
> +#define PIN_EMMC_WP			41
> +#define PIN_EMMC_CD			42
> +#define PIN_EMMC_RST			43
> +#define PIN_EMMC_PWR_EN			44
> +#define PIN_SDIO_CD			45
> +#define PIN_SDIO_WP			46
> +#define PIN_SDIO_RST			47
> +#define PIN_SDIO_PWR_EN			48
> +#define PIN_RGMII0_TXD0			49
> +#define PIN_RGMII0_TXD1			50
> +#define PIN_RGMII0_TXD2			51
> +#define PIN_RGMII0_TXD3			52
> +#define PIN_RGMII0_TXCTRL		53
> +#define PIN_RGMII0_RXD0			54
> +#define PIN_RGMII0_RXD1			55
> +#define PIN_RGMII0_RXD2			56
> +#define PIN_RGMII0_RXD3			57
> +#define PIN_RGMII0_RXCTRL		58
> +#define PIN_RGMII0_TXC			59
> +#define PIN_RGMII0_RXC			60
> +#define PIN_RGMII0_REFCLKO		61
> +#define PIN_RGMII0_IRQ			62
> +#define PIN_RGMII0_MDC			63
> +#define PIN_RGMII0_MDIO			64
> +#define PIN_PWM0			65
> +#define PIN_PWM1			66
> +#define PIN_PWM2			67
> +#define PIN_PWM3			68
> +#define PIN_FAN0			69
> +#define PIN_FAN1			70
> +#define PIN_FAN2			71
> +#define PIN_FAN3			72
> +#define PIN_IIC0_SDA			73
> +#define PIN_IIC0_SCL			74
> +#define PIN_IIC1_SDA			75
> +#define PIN_IIC1_SCL			76
> +#define PIN_IIC2_SDA			77
> +#define PIN_IIC2_SCL			78
> +#define PIN_IIC3_SDA			79
> +#define PIN_IIC3_SCL			80
> +#define PIN_UART0_TX			81
> +#define PIN_UART0_RX			82
> +#define PIN_UART0_RTS			83
> +#define PIN_UART0_CTS			84
> +#define PIN_UART1_TX			85
> +#define PIN_UART1_RX			86
> +#define PIN_UART1_RTS			87
> +#define PIN_UART1_CTS			88
> +#define PIN_UART2_TX			89
> +#define PIN_UART2_RX			90
> +#define PIN_UART2_RTS			91
> +#define PIN_UART2_CTS			92
> +#define PIN_UART3_TX			93
> +#define PIN_UART3_RX			94
> +#define PIN_UART3_RTS			95
> +#define PIN_UART3_CTS			96
> +#define PIN_SPI0_CS0			97
> +#define PIN_SPI0_CS1			98
> +#define PIN_SPI0_SDI			99
> +#define PIN_SPI0_SDO			100
> +#define PIN_SPI0_SCK			101
> +#define PIN_SPI1_CS0			102
> +#define PIN_SPI1_CS1			103
> +#define PIN_SPI1_SDI			104
> +#define PIN_SPI1_SDO			105
> +#define PIN_SPI1_SCK			106
> +#define PIN_JTAG0_TDO			107
> +#define PIN_JTAG0_TCK			108
> +#define PIN_JTAG0_TDI			109
> +#define PIN_JTAG0_TMS			110
> +#define PIN_JTAG0_TRST			111
> +#define PIN_JTAG0_SRST			112
> +#define PIN_JTAG1_TDO			113
> +#define PIN_JTAG1_TCK			114
> +#define PIN_JTAG1_TDI			115
> +#define PIN_JTAG1_TMS			116
> +#define PIN_JTAG1_TRST			117
> +#define PIN_JTAG1_SRST			118
> +#define PIN_JTAG2_TDO			119
> +#define PIN_JTAG2_TCK			120
> +#define PIN_JTAG2_TDI			121
> +#define PIN_JTAG2_TMS			122
> +#define PIN_JTAG2_TRST			123
> +#define PIN_JTAG2_SRST			124
> +#define PIN_GPIO0			125
> +#define PIN_GPIO1			126
> +#define PIN_GPIO2			127
> +#define PIN_GPIO3			128
> +#define PIN_GPIO4			129
> +#define PIN_GPIO5			130
> +#define PIN_GPIO6			131
> +#define PIN_GPIO7			132
> +#define PIN_GPIO8			133
> +#define PIN_GPIO9			134
> +#define PIN_GPIO10			135
> +#define PIN_GPIO11			136
> +#define PIN_GPIO12			137
> +#define PIN_GPIO13			138
> +#define PIN_GPIO14			139
> +#define PIN_GPIO15			140
> +#define PIN_GPIO16			141
> +#define PIN_GPIO17			142
> +#define PIN_GPIO18			143
> +#define PIN_GPIO19			144
> +#define PIN_GPIO20			145
> +#define PIN_GPIO21			146
> +#define PIN_GPIO22			147
> +#define PIN_GPIO23			148
> +#define PIN_GPIO24			149
> +#define PIN_GPIO25			150
> +#define PIN_GPIO26			151
> +#define PIN_GPIO27			152
> +#define PIN_GPIO28			153
> +#define PIN_GPIO29			154
> +#define PIN_GPIO30			155
> +#define PIN_GPIO31			156
> +#define PIN_MODE_SEL0			157
> +#define PIN_MODE_SEL1			158
> +#define PIN_MODE_SEL2			159
> +#define PIN_BOOT_SEL0			160
> +#define PIN_BOOT_SEL1			161
> +#define PIN_BOOT_SEL2			162
> +#define PIN_BOOT_SEL3			163
> +#define PIN_BOOT_SEL4			164
> +#define PIN_BOOT_SEL5			165
> +#define PIN_BOOT_SEL6			166
> +#define PIN_BOOT_SEL7			167
> +#define PIN_MULTI_SCKT			168
> +#define PIN_SCKT_ID0			169
> +#define PIN_SCKT_ID1			170
> +#define PIN_PLL_CLK_IN_MAIN		171
> +#define PIN_PLL_CLK_IN_DDR_L		172
> +#define PIN_PLL_CLK_IN_DDR_R		173
> +#define PIN_XTAL_32K			174
> +#define PIN_SYS_RST			175
> +#define PIN_PWR_BUTTON			176
> +#define PIN_TEST_EN			177
> +#define PIN_TEST_MODE_MBIST		178
> +#define PIN_TEST_MODE_SCAN		179
> +#define PIN_TEST_MODE_BSD		180
> +#define PIN_BISR_BYP			181
> +
> +#endif /* _DT_BINDINGS_PINCTRL_SG2042_H */

