Return-Path: <linux-gpio+bounces-23279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DDB0536B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 09:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 251437B21BE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 07:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C850C26CE26;
	Tue, 15 Jul 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAujl5YG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77677DF76
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564867; cv=none; b=HraBBYIg0ODQuVlmjTfgTwpv5cK8r1g/rp22Ku4Jj5QxHgxqzMndeQNYC23aOt9aIBhjV3nOHahH8H05XcfJ9c91N/WMyfJL/k9BoIDKvm6Oz0TtnN4u4K0CExKILT0TSyYlZcGG5UJ0R8Qhlxkf+XaXvzE65OUPJw0ZqYuD+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564867; c=relaxed/simple;
	bh=t6pg1iBfMU4PcTQly5LrIIzuwKQX0Al2mtxNiFpYb20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO8p020e966kJV0qf7KuMnBoAHCqeCbgw1pQhRtPbQPm1pD89VnusF/JPbCxa/e34y22Al1zExKc6alZw+WB4Ke1UDNhH7c/qmwbnRMsrlrlLZXm5aUIyxG6nyFEiadtngarpb9rEO1Ht81vVm6Jpr6FBoGMRj2v4YTEkq1REOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kAujl5YG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b584ac96so5113045e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752564864; x=1753169664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDP9Js2kzVuyXlUZIv8xGDhpQxOjQoCz2hrw5ui3thc=;
        b=kAujl5YGTnoKx7OzkQCx6Pa05+lmvZdKns507Bk6GKOfEwF899MIGtuD95QKZAG5qm
         5mmxwDtmqF1ZphZf4HedQMwgvv7H4eZtM8zhC6DqfC/LEiP9UHAVCfk8rQtFNcG54hlv
         21RBe+POu6rMpuoxKPSWX9fC4HBF4hhhsotuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564864; x=1753169664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDP9Js2kzVuyXlUZIv8xGDhpQxOjQoCz2hrw5ui3thc=;
        b=S1GatjMx54UZ39T3vo+QlbTRt0db+t/miEh8tkpHXs+Sr4PEICYB9rdrlj8eZU1zN4
         dQFKRk0qXcHrw4AegT3iY2px0W8cSG0mnOnxUrROU+w0RDtdU552BrDcEGad/OewcCRH
         Z0VbpjRrIwop8VTzRQFcTBEGTky63UU0ESfassp6WKOE7ID5BzD1kUHuTRPjJjE+k8Eb
         suDZ+/DQbmou8qtaSuBzJWKvYQCpw+0J57oSGRFbqfUI1xbMhwzSvpk5ssdmHTLH7ZtP
         5QNpb8n9dAOwZl5V9YfgIdAmqD9c3tG4MT/cLvG10CYthCiRKwdmvuIM2q73nDXODFdN
         n37Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5PATtst/4ogXN7ge6KEohoScSgTil1Y69q/Hg1NuRQdyGSkpuCriZ9ryUkUdeN3SnFjTtLJZI4K0l@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5BPZ4nePGVL7yxHpQfJC6rQaofVf6vuPnbjKQ0kfERkqjQ7i
	XzGwxSDogXZmU6hHtxvsqYH9+Vql+KqVWGhLcO8LlPRz6wZ5ruEPcxOn9yrl6A8ulXB7a89mLda
	5o3K8aItv13kK5siKOQWJ9CEEVegE+wIJ4tGc+GTQ
X-Gm-Gg: ASbGnct54p6DnJzXNVDUsr+e3ZCPPIu7bFXA6rzqzx4knKjT/fH6oUHD5WX4SQYjUpv
	fdipNSDSGfN1qjlTQTyHU4tgBQiTw9iBNBnXRq6EfD6f1qAdc6GIOnydoScfIQydaHZMe93TpHw
	0rnD77PitEONugGvZ4o+HgPqHu8SG+38Ngp9Ixwl2evhBsmDZ7itZGpRCYk5TBWCVoFKIisQJcT
	eKFC55vXTFudQP47/9y+1fxWxyqUoZAJGY=
X-Google-Smtp-Source: AGHT+IGyLQwS9wKi4gblzvO5qXko8LClZQ/7pERQ/cNbp9sboWxoQuuZ+SKFuMvHo+wECT4yBGDlAwSuCXvvVMsXsy8=
X-Received: by 2002:a05:6512:1041:b0:553:a456:a0c1 with SMTP id
 2adb3069b0e04-55a058a4cd2mr4180549e87.43.1752564863458; Tue, 15 Jul 2025
 00:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-9-darren.ye@mediatek.com>
 <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
In-Reply-To: <CAGXv+5EufDuxLMnwMaCqtWFZpVMNMxi-5OwCyO4a+KD2T+2NYA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 15:34:12 +0800
X-Gm-Features: Ac12FXwLri21evCxtuWTPMRxjTUULLUjQETvR-4GzmqmkL7Am8Zi1o5cvxLE7BY
Message-ID: <CAGXv+5EMjfrdLX49M9514uwzaTzc2G3kpQNw8BdJaZ4AaexBKg@mail.gmail.com>
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

On Tue, Jul 15, 2025 at 1:09=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi,
>
> On Tue, Jul 8, 2025 at 7:35=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com>=
 wrote:
> >
> > From: Darren Ye <darren.ye@mediatek.com>
> >
> > Add mt8196 audio AFE.
> >
> > Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/sound/mediatek,mt8196-afe.yaml   | 157 ++++++++++++++++++
> >  1 file changed, 157 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt=
8196-afe.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-af=
e.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > new file mode 100644
> > index 000000000000..fe147eddf5e7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> > @@ -0,0 +1,157 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Audio Front End PCM controller for MT8196
> > +
> > +maintainers:
> > +  - Darren Ye <darren.ye@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8196-afe
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  mediatek,vlpcksys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: To set up the apll12 tuner
>
> Looking at the implementation, the configuration is just a fixed value.
> Can this be moved to the VLP clock driver instead?
>
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: mux for audio intbus
> > +      - description: mux for audio engen1
> > +      - description: mux for audio engen2
> > +      - description: mux for audio h
> > +      - description: vlp 26m clock
> > +      - description: audio apll1 clock
> > +      - description: audio apll2 clock
> > +      - description: audio apll1 divide4
> > +      - description: audio apll2 divide4
> > +      - description: audio apll12 divide for i2sin0
> > +      - description: audio apll12 divide for i2sin1
> > +      - description: audio apll12 divide for fmi2s
> > +      - description: audio apll12 divide for tdmout mck
> > +      - description: audio apll12 divide for tdmout bck
> > +      - description: mux for audio apll1
> > +      - description: mux for audio apll2
> > +      - description: mux for i2sin0 mck
> > +      - description: mux for i2sin1 mck
> > +      - description: mux for fmi2s mck
> > +      - description: mux for tdmout mck
> > +      - description: mux for adsp clock
> > +      - description: 26m clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: top_aud_intbus
> > +      - const: top_aud_eng1
> > +      - const: top_aud_eng2
> > +      - const: top_aud_h
> > +      - const: vlp_clk26m
>
> > +      - const: apll1
> > +      - const: apll2
> > +      - const: apll1_d4
> > +      - const: apll2_d4
>
> These are parents of the top_apll[12]. They do not feed into the
> hardware directly, so you should not be including them here.
>
> > +      - const: apll12_div_i2sin0
> > +      - const: apll12_div_i2sin1
> > +      - const: apll12_div_fmi2s
> > +      - const: apll12_div_tdmout_m
> > +      - const: apll12_div_tdmout_b
>
> In the clock bindings sent by Collabora, these dividers are no longer
> separately modeled; they have been combined with their respective
> top_* clocks.
>
> > +      - const: top_apll1
> > +      - const: top_apll2
>
> These two are parents to apll12_div_*, do not feed into the hardware
> directly, so you should not be including them here.

Slight correction: looking at the submitted AFE clk driver, these two
feed into some clock gate in the AFE block, so these two are probably
needed.

ChenYu

> The clock tree for each audio interface clock looks like the following:
>
>     apll1 -> apll1_d4 -> top_apll1 --
>                      /               \
>               clk26m                  --> top_fmi2s -> apll12_div_fmi2s
>                      \               /
>     apll2 -> apll2_d4 -> top_apll2 --
>
> Only the final "apll12_div_fmi2s" should be referenced.
>
> On the implementation side, it should simply be a matter of setting the
> required rate (24.576 MHz or 22.5792 MHz, or some multiple) on this leaf
> clock, and let the clock framework figure out the PLL and dividers to
> use. Same thing for enabling the clock.
>
> > +      - const: top_i2sin0
> > +      - const: top_i2sin1
> > +      - const: top_fmi2s
> > +      - const: top_tdmout
> > +      - const: top_adsp
>
> > +      - const: clk26m
>
> Is this one directly needed? It is similar to vlp_clk26m, and I suspect
> only that one is needed.
>
>
> ChenYu
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - memory-region
> > +  - mediatek,vlpcksys
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        afe@1a110000 {
> > +            compatible =3D "mediatek,mt8196-afe";
> > +            reg =3D <0 0x1a110000 0 0x9000>;
> > +            interrupts =3D <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            memory-region =3D <&afe_dma_mem_reserved>;
> > +            mediatek,vlpcksys =3D <&vlp_cksys_clk>;
> > +            power-domains =3D <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDI=
O
> > +            clocks =3D <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SE=
L
> > +                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
> > +                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
> > +                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
> > +                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
> > +                     <&cksys_clk 129>, //CLK_CK_APLL1
> > +                     <&cksys_clk 132>, //CLK_CK_APLL2
> > +                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
> > +                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
> > +                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
> > +                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
> > +                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
> > +                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
> > +                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
> > +                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
> > +                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
> > +                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
> > +                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
> > +                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
> > +                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
> > +                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
> > +                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
> > +            clock-names =3D "top_aud_intbus",
> > +                          "top_aud_eng1",
> > +                          "top_aud_eng2",
> > +                          "top_aud_h",
> > +                          "vlp_clk26m",
> > +                          "apll1",
> > +                          "apll2",
> > +                          "apll1_d4",
> > +                          "apll2_d4",
> > +                          "apll12_div_i2sin0",
> > +                          "apll12_div_i2sin1",
> > +                          "apll12_div_fmi2s",
> > +                          "apll12_div_tdmout_m",
> > +                          "apll12_div_tdmout_b",
> > +                          "top_apll1",
> > +                          "top_apll2",
> > +                          "top_i2sin0",
> > +                          "top_i2sin1",
> > +                          "top_fmi2s",
> > +                          "top_tdmout",
> > +                          "top_adsp",
> > +                          "clk26m";
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.45.2
> >
> >

