Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B090A7AA157
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 23:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjIUVBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 17:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjIUVAf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 17:00:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834DB84600;
        Thu, 21 Sep 2023 10:37:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F1AC32779;
        Thu, 21 Sep 2023 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695287983;
        bh=tRdODTYdCa3qwizncqDlOn0z0rZz4zzat0BX1MymMGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qDNnUbEbN16PrijkO7YnenFiE+E80OdN+7S3pX7hNhhVrips+T+oSwT6lJJKKPALm
         news/Q8wmMCsH0XTnRNw7UzP6gl61utdby173cC+WyZsO+wI8Jg0pha5Dvk9gBmF7H
         8n96w6sWpHx1KZflnWtL6eCHf13PX10GDaALNZEL9WACvv9AT1cIx2ILBqcVXf83xX
         7z8UueVsTnQH35Qg847AUOcZThopRppTmMj8rm80qepaMr63gtitPjEtBn1DNyu4wA
         tbqi/cJ0EjAoir5RDKiZ28QUda7t6+o3STpdTNxy4ti7Z1w9hM7sd0VkX+ZEShFcbA
         yG6W1P4zcww7w==
Date:   Thu, 21 Sep 2023 10:19:37 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        brgl@bgdev.pl, andy@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/3] dt-bindings: pinctrl: Add compatibles for Amlogic
 T7 SoCs
Message-ID: <20230921-fa16f2f1f118091489708226@fedora>
References: <20230921083407.1167510-2-huqiang.qin@amlogic.com>
 <20230921083407.1167510-3-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EF4bGMNfXkk0lW1z"
Content-Disposition: inline
In-Reply-To: <20230921083407.1167510-3-huqiang.qin@amlogic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--EF4bGMNfXkk0lW1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 04:34:06PM +0800, Huqiang Qin wrote:
> Add a new compatible name for Amlogic T7 pin controller, and add
> a new dt-binding header file which document the detail pin names.
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

I'd argue that "Add support for" would be a better $subject for the
changes here though given that there is only one compatible and you've
added a bunch of new definitions.

Thanks,
Conor.

> ---
>=20
> V1 -> V2: Rename amlogic-t7-gpio.h to amlogic,t7-periphs-pinctrl.h
>=20
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |   1 +
>  .../gpio/amlogic,t7-periphs-pinctrl.h         | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinc=
trl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinct=
rl-a1.yaml
> index 4e7a456ea4cc..c7df4cd34197 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> @@ -16,6 +16,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,c3-periphs-pinctrl
> +      - amlogic,t7-periphs-pinctrl
>        - amlogic,meson-a1-periphs-pinctrl
>        - amlogic,meson-s4-periphs-pinctrl
> =20
> diff --git a/include/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h b/incl=
ude/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h
> new file mode 100644
> index 000000000000..4e16d31a71c9
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
> + * Author: Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_T7_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_T7_GPIO_H
> +
> +#define GPIOB_0		0
> +#define GPIOB_1		1
> +#define GPIOB_2		2
> +#define GPIOB_3		3
> +#define GPIOB_4		4
> +#define GPIOB_5		5
> +#define GPIOB_6		6
> +#define GPIOB_7		7
> +#define GPIOB_8		8
> +#define GPIOB_9		9
> +#define GPIOB_10	10
> +#define GPIOB_11	11
> +#define GPIOB_12	12
> +
> +#define GPIOC_0		13
> +#define GPIOC_1		14
> +#define GPIOC_2		15
> +#define GPIOC_3		16
> +#define GPIOC_4		17
> +#define GPIOC_5		18
> +#define GPIOC_6		19
> +
> +#define GPIOX_0		20
> +#define GPIOX_1		21
> +#define GPIOX_2		22
> +#define GPIOX_3		23
> +#define GPIOX_4		24
> +#define GPIOX_5		25
> +#define GPIOX_6		26
> +#define GPIOX_7		27
> +#define GPIOX_8		28
> +#define GPIOX_9		29
> +#define GPIOX_10	30
> +#define GPIOX_11	31
> +#define GPIOX_12	32
> +#define GPIOX_13	33
> +#define GPIOX_14	34
> +#define GPIOX_15	35
> +#define GPIOX_16	36
> +#define GPIOX_17	37
> +#define GPIOX_18	38
> +#define GPIOX_19	39
> +
> +#define GPIOW_0		40
> +#define GPIOW_1		41
> +#define GPIOW_2		42
> +#define GPIOW_3		43
> +#define GPIOW_4		44
> +#define GPIOW_5		45
> +#define GPIOW_6		46
> +#define GPIOW_7		47
> +#define GPIOW_8		48
> +#define GPIOW_9		49
> +#define GPIOW_10	50
> +#define GPIOW_11	51
> +#define GPIOW_12	52
> +#define GPIOW_13	53
> +#define GPIOW_14	54
> +#define GPIOW_15	55
> +#define GPIOW_16	56
> +
> +#define GPIOD_0		57
> +#define GPIOD_1		58
> +#define GPIOD_2		59
> +#define GPIOD_3		60
> +#define GPIOD_4		61
> +#define GPIOD_5		62
> +#define GPIOD_6		63
> +#define GPIOD_7		64
> +#define GPIOD_8		65
> +#define GPIOD_9		66
> +#define GPIOD_10	67
> +#define GPIOD_11	68
> +#define GPIOD_12	69
> +
> +#define GPIOE_0		70
> +#define GPIOE_1		71
> +#define GPIOE_2		72
> +#define GPIOE_3		73
> +#define GPIOE_4		74
> +#define GPIOE_5		75
> +#define GPIOE_6		76
> +
> +#define GPIOZ_0		77
> +#define GPIOZ_1		78
> +#define GPIOZ_2		79
> +#define GPIOZ_3		80
> +#define GPIOZ_4		81
> +#define GPIOZ_5		82
> +#define GPIOZ_6		83
> +#define GPIOZ_7		84
> +#define GPIOZ_8		85
> +#define GPIOZ_9		86
> +#define GPIOZ_10	87
> +#define GPIOZ_11	88
> +#define GPIOZ_12	89
> +#define GPIOZ_13	90
> +
> +#define GPIOT_0		91
> +#define GPIOT_1		92
> +#define GPIOT_2		93
> +#define GPIOT_3		94
> +#define GPIOT_4		95
> +#define GPIOT_5		96
> +#define GPIOT_6		97
> +#define GPIOT_7		98
> +#define GPIOT_8		99
> +#define GPIOT_9		100
> +#define GPIOT_10	101
> +#define GPIOT_11	102
> +#define GPIOT_12	103
> +#define GPIOT_13	104
> +#define GPIOT_14	105
> +#define GPIOT_15	106
> +#define GPIOT_16	107
> +#define GPIOT_17	108
> +#define GPIOT_18	109
> +#define GPIOT_19	110
> +#define GPIOT_20	111
> +#define GPIOT_21	112
> +#define GPIOT_22	113
> +#define GPIOT_23	114
> +
> +#define GPIOM_0		115
> +#define GPIOM_1		116
> +#define GPIOM_2		117
> +#define GPIOM_3		118
> +#define GPIOM_4		119
> +#define GPIOM_5		120
> +#define GPIOM_6		121
> +#define GPIOM_7		122
> +#define GPIOM_8		123
> +#define GPIOM_9		124
> +#define GPIOM_10	125
> +#define GPIOM_11	126
> +#define GPIOM_12	127
> +#define GPIOM_13	128
> +
> +#define GPIOY_0		129
> +#define GPIOY_1		130
> +#define GPIOY_2		131
> +#define GPIOY_3		132
> +#define GPIOY_4		133
> +#define GPIOY_5		134
> +#define GPIOY_6		135
> +#define GPIOY_7		136
> +#define GPIOY_8		137
> +#define GPIOY_9		138
> +#define GPIOY_10	139
> +#define GPIOY_11	140
> +#define GPIOY_12	141
> +#define GPIOY_13	142
> +#define GPIOY_14	143
> +#define GPIOY_15	144
> +#define GPIOY_16	145
> +#define GPIOY_17	146
> +#define GPIOY_18	147
> +
> +#define GPIOH_0		148
> +#define GPIOH_1		149
> +#define GPIOH_2		150
> +#define GPIOH_3		151
> +#define GPIOH_4		152
> +#define GPIOH_5		153
> +#define GPIOH_6		154
> +#define GPIOH_7		155
> +
> +#define GPIO_TEST_N	156
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_T7_GPIO_H */
> --=20
> 2.42.0
>=20

--EF4bGMNfXkk0lW1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQwKpgAKCRB4tDGHoIJi
0tUgAQC67+DeMiB7hDUnCGZxPcUXqM4TeI7a4KwUj8RjY4AmFwEAoDPWtsRmTaJe
CmgEfijQJLEPKjx4nbqlOh8wqFyvbAM=
=Wae3
-----END PGP SIGNATURE-----

--EF4bGMNfXkk0lW1z--
