Return-Path: <linux-gpio+bounces-18920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700CA8B3F2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 371BE7A6E9B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BC222FE05;
	Wed, 16 Apr 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VEq3UY+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3001FFC55
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792467; cv=none; b=pNH0EEMV/ckRbUYsV+nE3FiYB9ADhJ3Y2xhuyLuPkQen1zrMwhTtoytaniBZqLX+4Y9HF8H0X0HYlP/8RZATeqFFJP4jfGrNBcH5ZQhBldwc1VybG8+nfRvgfQ/8qZnEFXq3QG25jl7ve3KMI/VB033Jy7OvrlrXOPAZj4wUico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792467; c=relaxed/simple;
	bh=gpvqHVUgHGeryWO04DyLJakTN+KZfOzCrqXMUwAiuH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/qBfzA+ovmvLG2Ef7dHycJRJwCtQ4QUUEivLhaM7cLeQ6eN+mhhPk2lluNWDZ7Ct3NLUTwhxAMyefJ1XilzIVrX46qRmFacGckmE9JMGrSfl6GjLn8AI8qnuzOiKO79HvfnFhMJ+ox+zxzGSiE0GuJa1Jy5nJEZVv9XhwlaguE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VEq3UY+6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54993c68ba0so8005899e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744792463; x=1745397263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6QE2T0ZuBXB4WndsfLOAzxWrh7klQ+oX5dwA6vGb1g=;
        b=VEq3UY+62ndh/mok8tHmSLsEwlisPL7NBqgNB0ClRaSfYvMGlB/wmviHBQAjLxmlbK
         KQbz9DQHL9vFvL5etY0aqSbfg/N/28jFQ5aAI3w7Hq+04RXQfdTgHDYC93FJHfzJb48i
         6Pm2YVuGh4DAgZNSFsG2RsAD4Jd7sjP1MrDzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792463; x=1745397263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6QE2T0ZuBXB4WndsfLOAzxWrh7klQ+oX5dwA6vGb1g=;
        b=plZ68nCb+l3YPdP2Z6U6zDHTty7w80e0nL1teq1TAyoASkzRKdl6NFtvRcrKZnAKQD
         qVAa9LU8J7s+6RFb7EQuQe1IaKbKnFMHzpmltXfxy6PiCP9yrMrt7D5OXTWbySDDiCGZ
         HhI3rBcbA0+1IUnXARwETv+yfl77eAYrIHcn4GrbUCgn/sO3a4vB2ilKqWjCrjYJVjae
         X30TvsV9Vj788/H3yceVpXuX0IzobLcBM36ZBDdlt/EUez1IEmuihQEzgX88qZhcTSNc
         bVctkQBiCta9BA8S0G5XWYP/f6mj1LlLz2h07xPZWpDGwRT76VFoKNCpED83Ol7DoTcJ
         slfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwUi3+gUNhqajpiAJ4YyINLvwN13EvlhkBOY8ZBjeCw1W5tIhnaMwQq3a5CYT1zfBq3FMm/OFUZjDS@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4t/0+PTmXlUXsUn2PvmHlhPIeANlv8nVXXYb6i4duLJmkFpb
	E333yRh+j3Fimft2RnhA5WvtI8sWeeyoQO37Kxmb1HXyOdJ1r9iz8V+qNR+4L5woWiNHmoEPzBt
	gR+6oupYZLIotl0ll16woF2VtPN8HgbBoeCKT
X-Gm-Gg: ASbGncus/L0y0I6J7v8fqZCVMo4DG5cqIch74EYD3C5C7MKubJvmhcxa83LV/3VgyKT
	MG3kh8NxMUxFlHD4wGE4OWiA/7pzPVX+nauDf/gWWyf3WhWuktMvhnY1XgJtd7rATZYNwnkfAo7
	40bObceKs30dU2LZY57I138wsVe2uXOpPJpwFJ7tCRS/7k5cHudQ==
X-Google-Smtp-Source: AGHT+IGywv405x+hdQLo/98ClZzF7JmGK2W6nH8CVYn8/jZboSM3mheObcfLUo7gqxuVyOBok2c1x8Ehz9kkQzuTqRQ=
X-Received: by 2002:a05:6512:1094:b0:54d:6400:4bd0 with SMTP id
 2adb3069b0e04-54d64ae8212mr274900e87.37.1744792462920; Wed, 16 Apr 2025
 01:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120708.26495-1-darren.ye@mediatek.com> <20250407120708.26495-10-darren.ye@mediatek.com>
In-Reply-To: <20250407120708.26495-10-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Apr 2025 16:34:11 +0800
X-Gm-Features: ATxdqUFmHiMrf2rAgHSOIbvBvct2V2zm34cTt1IQ6bUMVwKlX1lwi3om1Cu8IgA
Message-ID: <CAGXv+5F0Ys63hcO8u7p3zSnnOT4gYc2Z0BhQW=dOXAvBc_nmvg@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] ASoC: dt-bindings: mediatek,mt8196-afe: add
 audio AFE document
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:39=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 audio AFE document.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 233 ++++++++++++++++++
>  1 file changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt81=
96-afe.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.=
yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> new file mode 100644
> index 000000000000..44f8847b13a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> @@ -0,0 +1,233 @@
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
> +    const: mediatek,mt8196-afe-pcm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Shared memory region for AFE memif.  A "shared-dma-pool".
> +      See dtschema reserved-memory/shared-dma-pool.yaml for details.
> +  mediatek,cksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek clk systemd controller
> +
> +  mediatek,vlpcksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek vlpcksys controller
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: audio hopping clock gate
> +      - description: audio f26m clock gate
> +      - description: audio apll1 clock gate
> +      - description: audio apll2 clock gate
> +      - description: audio apll1 tuner gate
> +      - description: audio apll2 tuner gate
> +      - description: mux for audio vlp int
> +      - description: mux for audio vlp engen1
> +      - description: mux for audio vlp engen2
> +      - description: mux for audio h
> +      - description: vlp clock 26m
> +      - description: audio mainpll divide 4
> +      - description: mux for audio apll1
> +      - description: audio apll1
> +      - description: mux for audio apll2
> +      - description: audio apll2
> +      - description: audio apll1 divide 4
> +      - description: audio apll2 divide 4
> +      - description: mux for i2sin0 mck
> +      - description: mux for i2sin1 mck
> +      - description: mux for fmi2s mck
> +      - description: mux for tdmout mck
> +      - description: auido apll12 divide for i2sin0
> +      - description: auido apll12 divide for i2sin1
> +      - description: auido apll12 divide for fmi2s
> +      - description: auido apll12 divide for tdmout mck
> +      - description: auido apll12 divide for tdmout bck

There's a bunch of typos for "audio".

> +      - description: audio adsp clk
> +      - description: 26m clock

Can we look into trimming down the list of clocks? Ideally this should
only list the actual clock inputs of the hardware, which are normally
the leaf clocks from the clock controller. You should not have to list
all the intermediate dividers and muxes.

On the Linux implementation side, it should be a matter of calling
clk_set_rate() on the clock input corresponding to the interface in
use. If the clock is not resolving the correct clock rate / parenting,
the clock driver should be fixed.

> +
> +  clock-names:
> +    items:
> +      - const: aud_hopping_clk
> +      - const: aud_f26m_clk
> +      - const: aud_apll1_clk
> +      - const: aud_apll2_clk
> +      - const: aud_apll_tuner1_clk
> +      - const: aud_apll_tuner2_clk
> +      - const: vlp_mux_audio_int
> +      - const: vlp_mux_aud_eng1
> +      - const: vlp_mux_aud_eng2
> +      - const: vlp_mux_audio_h
> +      - const: vlp_clk26m_clk
> +      - const: ck_mainpll_d4_d4
> +      - const: ck_mux_aud_1
> +      - const: ck_apll1_ck
> +      - const: ck_mux_aud_2
> +      - const: ck_apll2_ck
> +      - const: ck_apll1_d4
> +      - const: ck_apll2_d4
> +      - const: ck_i2sin0_m_sel
> +      - const: ck_i2sin1_m_sel
> +      - const: ck_fmi2s_m_sel
> +      - const: ck_tdmout_m_sel
> +      - const: ck_apll12_div_i2sin0
> +      - const: ck_apll12_div_i2sin1
> +      - const: ck_apll12_div_fmi2s
> +      - const: ck_apll12_div_tdmout_m
> +      - const: ck_apll12_div_tdmout_b
> +      - const: ck_adsp_sel
> +      - const: ck_clk26m_clk
> +
> +  mediatek,etdm4-out-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of ETDM4 output channels.
> +    minimum: 1
> +    maximum: 8
> +
> +  mediatek,etdm4-in-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of ETDM4 input channels.
> +    minimum: 1
> +    maximum: 8
> +
> +  mediatek,etdm4-out-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      ETDM4 output and input enable synchronization.
> +    enum:
> +      - 0 # Enable controlled by itself
> +      - 1 # Enable synchronization with ETDM4 input.
> +
> +  mediatek,etdm4-in-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      ETDM4 input and outpuot enable synchronization.
> +    enum:
> +      - 0 # Enable controlled by itself
> +      - 1 # Enable synchronization with ETDM4 output.
> +
> +
> +
> +  mediatek,etdm4-ip-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ETDM IP mode.
> +    enum:
> +      - 0 # One ip multi-ch mode
> +      - 1 # Multi-ip 2ch mode
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mediatek,cksys
> +  - mediatek,vlpcksys
> +  - power-domains
> +  - memory-region
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
> +        afe: mt8196-afe-pcm@1a110000 {
> +            compatible =3D "mediatek,mt8196-afe-pcm";
> +            reg =3D <0 0x1a110000 0 0x9000>;
> +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> +            memory-region =3D <&afe_dma_mem_reserved>;
> +            mediatek,cksys =3D <&cksys_clk>;
> +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
> +            mediatek,etdm4-out-ch =3D <2>;
> +            mediatek,etdm4-in-ch =3D <2>;
> +            mediatek,etdm4-out-sync =3D <0>;
> +            mediatek,etdm4-in-sync =3D <1>;
> +            mediatek,etdm4-ip-mode =3D <0>;
> +            clocks =3D <&afe_clk 109>, //CLK_AFE_AUDIO_HOPPING_AFE
> +                     <&afe_clk 111>, //CLK_AFE_AUDIO_F26M_AFE
> +                     <&afe_clk 113>, //CLK_AFE_APLL1_AFE
> +                     <&afe_clk 115>, //CLK_AFE_APLL2_AFE
> +                     <&afe_clk 121>, //CLK_AFE_APLL_TUNER1_AFE
> +                     <&afe_clk 119>, //CLK_AFE_APLL_TUNER2_AFE

<&afe_clk> has the same register range as <&afe>, i.e they are the
same hardware block. Please find a way to internalize them in the
driver implementation and drop them from the bindings / DT.

> +                     <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
> +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> +                     <&cksys_clk 98>, //CLK_CK_MAINPLL_D4_D4

This is not actually used in the implementation.

> +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL

Intermediate clock feeding into the I2S / TDM clocks. Does this
really feed into the audio block?

> +                     <&cksys_clk 129>, //CLK_CK_APLL1

PLL source clock.

> +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL

Intermediate clock feeding into the I2S / TDM clocks. Does this
really feed into the audio block?

> +                     <&cksys_clk 132>, //CLK_CK_APLL2

PLL source clock.

> +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4

Divider after PLL.

> +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4

Divider after PLL.

> +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL

These four feed into the next four.

Please take a good look at the hardware and determine which ones are
actually directly used by the hardware.


ChenYu

> +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> +            clock-names =3D "aud_hopping_clk",
> +                          "aud_f26m_clk",
> +                          "aud_apll1_clk",
> +                          "aud_apll2_clk",
> +                          "aud_apll_tuner1_clk",
> +                          "aud_apll_tuner2_clk",
> +                          "vlp_mux_audio_int",
> +                          "vlp_mux_aud_eng1",
> +                          "vlp_mux_aud_eng2",
> +                          "vlp_mux_audio_h",
> +                          "vlp_clk26m_clk",
> +                          "ck_mainpll_d4_d4",
> +                          "ck_mux_aud_1",
> +                          "ck_apll1_ck",
> +                          "ck_mux_aud_2",
> +                          "ck_apll2_ck",
> +                          "ck_apll1_d4",
> +                          "ck_apll2_d4",
> +                          "ck_i2sin0_m_sel",
> +                          "ck_i2sin1_m_sel",
> +                          "ck_fmi2s_m_sel",
> +                          "ck_tdmout_m_sel",
> +                          "ck_apll12_div_i2sin0",
> +                          "ck_apll12_div_i2sin1",
> +                          "ck_apll12_div_fmi2s",
> +                          "ck_apll12_div_tdmout_m",
> +                          "ck_apll12_div_tdmout_b",
> +                          "ck_adsp_sel",
> +                          "ck_clk26m_clk";
> +        };
> +    };
> --
> 2.45.2
>
>

