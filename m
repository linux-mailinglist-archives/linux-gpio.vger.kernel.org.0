Return-Path: <linux-gpio+bounces-24815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFCB31C78
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18B4B646103
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE09307AF9;
	Fri, 22 Aug 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQP9xZ/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B453054EB;
	Fri, 22 Aug 2025 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873587; cv=none; b=f9Kjrfv/ahtyRlCMyNWz6pP3yblk8Crx5nUhWRMEWGvrd+pztikewtwdAS3h/uuQM5WsP9rTQD2GW2yMFzd4olIGJo/U2P5n9K74pZLdqCeTzdp49hZZyVIHKluDAG1PrUj+lZnoXO9lHeYrPIGlvAimpPGUyrtZt6qnbS3lz0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873587; c=relaxed/simple;
	bh=MQpTXSG/z9wgXCqnHJLGZddIUiDznuwl5RLSvgOuvXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJOsT5Oj1nlzBG72lPZEag+o/RDM+BWK7IciYRXjNC1D8mN/AQJzBDWjOQFmW2+nmGV6NUCKIYHdoMsmzUaFy21YwjAKQElTl9Fog1dzkCppGejDORwy3iwCUowIIMb5bCxUMFdUz5fhJBSjp1YCFxkxrq2dd1yJ6OiEZKgNyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQP9xZ/s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0FAC4CEED;
	Fri, 22 Aug 2025 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873586;
	bh=MQpTXSG/z9wgXCqnHJLGZddIUiDznuwl5RLSvgOuvXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQP9xZ/s3HAazOp75U4TuPEapU2a39p4qFkiPYIQluE9pzYgrWJa51B3d7Os+uHLk
	 07QHvilTh/0IAMVvP8UtJwPSIc0eJAf5rObM7N29vjvflf6VZGJn0JfN8HKFj7BsYm
	 9sZgVOXvhX9hE/PeH+yQcevUbLRCskzs5ZFVxFbzilJROE5DFOdSSB/y7jUi5jCEY3
	 pZa0NNYw/yYl6y4JmKEJG2R1ZlqIP8Nx9urx8QMT0C+9SQZ9XxvbDPU64Ct0zCldhS
	 nvniOoHUDaRUvwH7j9veUxRB9j9fiSCDgnWPu02PsUE+WsrymcmcHcoABbS0buo7Gl
	 4I4fTPlTHXjIg==
Date: Fri, 22 Aug 2025 09:39:45 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: dt-binding: Convert mt8183-afe-pcm binding
 to YAML
Message-ID: <20250822143945.GA3709669-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-2-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-2-cf4721e58f4e@collabora.com>

On Wed, Aug 20, 2025 at 03:44:53PM +0200, Julien Massot wrote:
> Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> .txt format to YAML schema format to improve validation.
> 
> While converting, also document all clock inputs and memory-region
> used by the AFE block.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/sound/mediatek,mt8183-audio.yaml      | 228 +++++++++++++++++++++
>  .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
>  2 files changed, 228 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..93517565f0f3a692c824be0897bc88dfd59bd723
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
> @@ -0,0 +1,228 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8183-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8183
> +
> +maintainers:
> +  - Julien Massot <jmassot@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8183-audio
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AFE clock
> +      - description: ADDA DAC clock
> +      - description: ADDA DAC pre-distortion clock
> +      - description: ADDA ADC clock
> +      - description: ADDA6 ADC clock
> +      - description: Audio low-jitter 22.5792m clock
> +      - description: Audio low-jitter 24.576m clock
> +      - description: Audio PLL1 tuner clock
> +      - description: Audio PLL2 tuner clock
> +      - description: I2S1 bit clock
> +      - description: I2S2 bit clock
> +      - description: I2S3 bit clock
> +      - description: I2S4 bit clock
> +      - description: Audio Time-Division Multiplexing interface clock
> +      - description: Powerdown Audio test model clock
> +      - description: Audio infra sys clock
> +      - description: Audio infra 26M clock
> +      - description: Mux for audio clock
> +      - description: Mux for audio internal bus clock
> +      - description: Mux main divider by 4
> +      - description: Primary audio mux
> +      - description: Primary audio PLL
> +      - description: Secondary audio mux
> +      - description: Secondary audio PLL
> +      - description: Primary audio en-generator clock
> +      - description: Primary PLL divider by 4 for IEC
> +      - description: Secondary audio en-generator clock
> +      - description: Secondary PLL divider by 8 for IEC
> +      - description: Mux selector for I2S port 0
> +      - description: Mux selector for I2S port 1
> +      - description: Mux selector for I2S port 2
> +      - description: Mux selector for I2S port 3
> +      - description: Mux selector for I2S port 4
> +      - description: Mux selector for I2S port 5
> +      - description: APLL1 and APLL2 divider for I2S port 0
> +      - description: APLL1 and APLL2 divider for I2S port 1
> +      - description: APLL1 and APLL2 divider for I2S port 2
> +      - description: APLL1 and APLL2 divider for I2S port 3
> +      - description: APLL1 and APLL2 divider for I2S port 4
> +      - description: APLL1 and APLL2 divider for IEC
> +      - description: 26MHz clock for audio subsystem
> +
> +  clock-names:
> +    items:
> +      - const: aud_afe_clk
> +      - const: aud_dac_clk
> +      - const: aud_dac_predis_clk
> +      - const: aud_adc_clk
> +      - const: aud_adc_adda6_clk
> +      - const: aud_apll22m_clk
> +      - const: aud_apll24m_clk
> +      - const: aud_apll1_tuner_clk
> +      - const: aud_apll2_tuner_clk
> +      - const: aud_i2s1_bclk_sw
> +      - const: aud_i2s2_bclk_sw
> +      - const: aud_i2s3_bclk_sw
> +      - const: aud_i2s4_bclk_sw
> +      - const: aud_tdm_clk
> +      - const: aud_tml_clk
> +      - const: aud_infra_clk
> +      - const: mtkaif_26m_clk
> +      - const: top_mux_audio
> +      - const: top_mux_aud_intbus
> +      - const: top_syspll_d2_d4
> +      - const: top_mux_aud_1
> +      - const: top_apll1_ck
> +      - const: top_mux_aud_2
> +      - const: top_apll2_ck
> +      - const: top_mux_aud_eng1
> +      - const: top_apll1_d8
> +      - const: top_mux_aud_eng2
> +      - const: top_apll2_d8
> +      - const: top_i2s0_m_sel
> +      - const: top_i2s1_m_sel
> +      - const: top_i2s2_m_sel
> +      - const: top_i2s3_m_sel
> +      - const: top_i2s4_m_sel
> +      - const: top_i2s5_m_sel
> +      - const: top_apll12_div0
> +      - const: top_apll12_div1
> +      - const: top_apll12_div2
> +      - const: top_apll12_div3
> +      - const: top_apll12_div4
> +      - const: top_apll12_divb
> +      - const: top_clk26m_clk
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +    #include <dt-bindings/reset/mt8183-resets.h>
> +
> +    afe: mt8183-afe-pcm {

audio-controller {

like you changed the .dts.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

