Return-Path: <linux-gpio+bounces-23276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBFB0509E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 07:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CC94A7B88
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 05:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7772D29D9;
	Tue, 15 Jul 2025 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lMELulrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B925F99B
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752556212; cv=none; b=nXN81kkt7oRlKgZp5qtHB7rIoFc0cPlontf4G9FXTAfD+vGtLVf2qqX8uuznkQeWPkIy4PXdSajz/NqJE35h9VBF/zgbn2oU0C2dx83qzHfsBl7kN5u8K1jVicMAS4vf1LxLHSsKNagpWI6yc4tJYV4v4ZmSrdGL6INdjdxlEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752556212; c=relaxed/simple;
	bh=JFRfmXdGaB0bcUaSYrdkTg/VWzKHFSzhdXGsdMjJnYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDAyFIWjPGT87rwXkfQZtoMe6Efex8Bh1zHMGax7eOKIhSgPgioVaK2MEnHiPy2sb/rAGZofIjvzKIdvZHmdeHUe/kAHn1I2VYuT0NScFxh1MuG39uIlTZpWCh9CAi5b61mDU5SfbZdjsFCb2vMHXU6P/ng6qFaAR/UHEqIWmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lMELulrD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b390d09e957so5336174a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 22:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752556209; x=1753161009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeGX4xJ5N5ByevcQku8kEm7rK27JtOgdg1gtNXvEUV0=;
        b=lMELulrDQbM6keuYaBl/NsvCk9cIj5lCgUBP9trchIJQ2N85CRfcVz419aAGZoYBZ6
         dg/HZsQEfiVmOy4J/yrIMfqMbWPiQKgoJK9im6mkwYTVKlybyCzd7ZF/RdYLQ9gC8MsN
         sRigalQAYrGZ+okrRbwqwm/CsNs1Tnd3IAFio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752556209; x=1753161009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeGX4xJ5N5ByevcQku8kEm7rK27JtOgdg1gtNXvEUV0=;
        b=Vf6ON2MVOQVo+0E8mSDUcaNZLztjBqcpdHgJYSGtplimGLHGNfDHx6tZ5W7O2VaehW
         O+SjvVlVMtN4FkFcn8IxwINtOFDi8CzdtfmilgeI+dS495Y6HWyyyW5ADkSCEcuH6u7/
         ky/ii3AN0dMebAIuOMg8P9sRfF/e/4ITvAwkICSvcQZIeriArO9flOmrAS2Ci7LKD5sv
         tqrZFnugGEI2Rw3Si7q8/G1r8ALYiKKOz09oXvjNlgob+xCzby4K1gmSBvTab31pQgej
         GV0osxQNRvG+KMha4K20s4rP4/xWnDzUuF5EVYa4e9lEbFh2iHonp4aWZp7bj410nLuV
         /eYg==
X-Forwarded-Encrypted: i=1; AJvYcCUshDvZBdTEpjCNO2nfD1IjXQdmUszcmyk8FuZKuJZ92/dyX503xlafss/lnDGjXmMYf7Nz32aJnirf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/XDPxuSIPoIZ822jBKbj6x5zjOdEGkbeTtcZFie1txM/MZyK
	dGXIfHPlLzkQxKBbkgO/5DIbEVWhBz4Olo7T4ksX3KxkfWRsBPQrCmHKJbju0aGBvWLIH/mQbt+
	mzNWSNBEF+ygUaka48jo3R6PWFCL9JovUTVyVD7+L
X-Gm-Gg: ASbGncsuZH8uYLT/O1k8jN1UIYtZRovP5glDPDiq/qZ5Tx5jEOFWQYapUKvYv2nhhWc
	2JMRHBlo+M2qlqF+c5PwqppJmkw101E7xPNRRcP4Bqa+QSo8n4lBTuA1kQ1ieBr4r+byJwZr46O
	w62/s+HsTlgfloF7c2+dwr+usmgqp78HW0UndEzJviiitsbJHfj7WIlcLm6/aDqEsrghAMmBw2p
	F5mNRBrskKvHl3vsxDj9B4up7CdzUqNpE0=
X-Google-Smtp-Source: AGHT+IGrIcOwDhM8zFLR2Fqez+cP69AimTGRX9UTuj46iIg3ngozIxMahvLMKAAbIAUfN79z9ia/qiM2tlmpcP9JdRs=
X-Received: by 2002:a17:90b:3942:b0:311:c1ec:7d12 with SMTP id
 98e67ed59e1d1-31c4f591c3amr21704790a91.23.1752556209442; Mon, 14 Jul 2025
 22:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-9-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 13:09:55 +0800
X-Gm-Features: Ac12FXywxlo-FwGCNxuHlfnNYdXpmdX-6gC7L6-g8yB4I0r8fcMqx-Ix866UZAU
Message-ID: <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 audio AFE.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt81=
96-afe.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.=
yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> new file mode 100644
> index 000000000000..fe147eddf5e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Audio Front End PCM controller for MT8196
> +
> +maintainers:
> +  - Darren Ye <darren.ye@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  mediatek,vlpcksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: To set up the apll12 tuner

Looking at the implementation, the configuration is just a fixed value.
Can this be moved to the VLP clock driver instead?

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: mux for audio intbus
> +      - description: mux for audio engen1
> +      - description: mux for audio engen2
> +      - description: mux for audio h
> +      - description: vlp 26m clock
> +      - description: audio apll1 clock
> +      - description: audio apll2 clock
> +      - description: audio apll1 divide4
> +      - description: audio apll2 divide4
> +      - description: audio apll12 divide for i2sin0
> +      - description: audio apll12 divide for i2sin1
> +      - description: audio apll12 divide for fmi2s
> +      - description: audio apll12 divide for tdmout mck
> +      - description: audio apll12 divide for tdmout bck
> +      - description: mux for audio apll1
> +      - description: mux for audio apll2
> +      - description: mux for i2sin0 mck
> +      - description: mux for i2sin1 mck
> +      - description: mux for fmi2s mck
> +      - description: mux for tdmout mck
> +      - description: mux for adsp clock
> +      - description: 26m clock
> +
> +  clock-names:
> +    items:
> +      - const: top_aud_intbus
> +      - const: top_aud_eng1
> +      - const: top_aud_eng2
> +      - const: top_aud_h
> +      - const: vlp_clk26m

> +      - const: apll1
> +      - const: apll2
> +      - const: apll1_d4
> +      - const: apll2_d4

These are parents of the top_apll[12]. They do not feed into the
hardware directly, so you should not be including them here.

> +      - const: apll12_div_i2sin0
> +      - const: apll12_div_i2sin1
> +      - const: apll12_div_fmi2s
> +      - const: apll12_div_tdmout_m
> +      - const: apll12_div_tdmout_b

In the clock bindings sent by Collabora, these dividers are no longer
separately modeled; they have been combined with their respective
top_* clocks.

> +      - const: top_apll1
> +      - const: top_apll2

These two are parents to apll12_div_*, do not feed into the hardware
directly, so you should not be including them here.

The clock tree for each audio interface clock looks like the following:

    apll1 -> apll1_d4 -> top_apll1 --
                     /               \
              clk26m                  --> top_fmi2s -> apll12_div_fmi2s
                     \               /
    apll2 -> apll2_d4 -> top_apll2 --

Only the final "apll12_div_fmi2s" should be referenced.

On the implementation side, it should simply be a matter of setting the
required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this leaf
clock, and let the clock framework figure out the PLL and dividers to
use. Same thing for enabling the clock.

> +      - const: top_i2sin0
> +      - const: top_i2sin1
> +      - const: top_fmi2s
> +      - const: top_tdmout
> +      - const: top_adsp

> +      - const: clk26m

Is this one directly needed? It is similar to vlp_clk26m, and I suspect
only that one is needed.


ChenYu

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - memory-region
> +  - mediatek,vlpcksys
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        afe@1a110000 {
> +            compatible =3D "mediatek,mt8196-afe";
> +            reg =3D <0 0x1a110000 0 0x9000>;
> +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> +            memory-region =3D <&afe_dma_mem_reserved>;
> +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
> +            clocks =3D <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
> +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> +                     <&cksys_clk 129>, //CLK_CK_APLL1
> +                     <&cksys_clk 132>, //CLK_CK_APLL2
> +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> +            clock-names =3D "top_aud_intbus",
> +                          "top_aud_eng1",
> +                          "top_aud_eng2",
> +                          "top_aud_h",
> +                          "vlp_clk26m",
> +                          "apll1",
> +                          "apll2",
> +                          "apll1_d4",
> +                          "apll2_d4",
> +                          "apll12_div_i2sin0",
> +                          "apll12_div_i2sin1",
> +                          "apll12_div_fmi2s",
> +                          "apll12_div_tdmout_m",
> +                          "apll12_div_tdmout_b",
> +                          "top_apll1",
> +                          "top_apll2",
> +                          "top_i2sin0",
> +                          "top_i2sin1",
> +                          "top_fmi2s",
> +                          "top_tdmout",
> +                          "top_adsp",
> +                          "clk26m";
> +        };
> +    };
> +
> +...
> --
> 2.45.2
>
>

