Return-Path: <linux-gpio+bounces-4426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6387E7C2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 11:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4F2283784
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF2936B11;
	Mon, 18 Mar 2024 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0iepg0q7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B2364B1
	for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759270; cv=none; b=HtXAQ3FDvxB7dSIEXkJFP4om57p1gmzqyU+5OlkQ8qFi4uDotbUbXQ74Tq3n/aPYBfllXvGKN0tYADyV3ZrzUmvXaog5XKlVcJR1RKoUKlk49E9gFquZj7QJl33uD6b7EjjS02LqRa0+QW4unyjlsr6Vnsyv7PhSgj5+85BPUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759270; c=relaxed/simple;
	bh=THPMNC7oX3P8naBTe3HOYw1c02zhUSjjMPfCxyvXgQs=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=pAKvsDbsCV0IxPwbEFV5d3dtQuwG/Flzf5K/IRE6MtydP6OELe3HQ4mKourCvnAMpvGOxs0OcpQeDl7JmAvjq9Cg3BTZfnaFcxVLdGJ/WZANmHeYnzooNglclRT4WWkp/+iLiUgQ6DrZcNmC2fM81tYNeCgWdAzAoNjXCz8/H6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0iepg0q7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d23114b19dso49901911fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710759265; x=1711364065; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=av5gLzR7rkEYxoc/gdbN557ReTDhwcmck8nCSWc2+u4=;
        b=0iepg0q7iJ4LpHNTTyKRMakUvDkZAbpd+AYDQ1a7pSjdilGi17/NH6ziG5EyNdkUq2
         uzw/fKkKDW88vNWWZ/3TdFkwIqy68A6Pb+mxv541XqeSDga7GM1eyJy9U0rn5WIZtaPi
         s6aWFDCRs6saTaRSiU3OeZNqEJAQRgUM+r9veQDWk84W916lve4/F9FEdEoi1DA9+Lnj
         tFX4weQCopjw+F+DiHEihw/1zjxLEcBfvKi+KCZ+E82LrRMLTh4h2mQiOD2oYomOZDgw
         T/DDmGpV7QtBHDUoJLVYFRQmow1GcW1D1MWZ94VCLe93blWtY/EUWVcfZ+0Cz2r3Dhzh
         fADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759265; x=1711364065;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av5gLzR7rkEYxoc/gdbN557ReTDhwcmck8nCSWc2+u4=;
        b=cr5BftbLnesZeytHv8y91+TR4lOfErEVJ5KcP0fpOPoz8gGwNwoDvJLxIxosrisp0t
         JkaNkaJiU/FNVTeNwxJKPwYdXqoZvsudrm2q99ior/S64JLF4icUgFi8s6jSdLFvQ3MH
         iSerQfdKXAQwkX/WK2hjIt2W03eB5/Avf8ms9h61SNFWYywzkZVJ+b9deXF6jwCQ+lyx
         sJXyfcCXD7vm+jNWdCP0ST3PzIkyrZdMvcgpcwjr/E0GJ+0yCS+T3WHch0gNkv9Gez96
         igrUAUsX4o/951cugtFnhr0h5jHN7xjTvJwO1vtc2A/pO68qwhExNWupWdq0GIXDQjAe
         1YGg==
X-Forwarded-Encrypted: i=1; AJvYcCXnZnf0a3dnXjm5c9YkJM4HuYZBjzNq9x5jM1GghDhOWN5qCnp9SSj/Yn+v9+acRpTui1pOXOUgBcntTdG7eoZOjCxcUlhmjdJpjQ==
X-Gm-Message-State: AOJu0Yy24Sc3poaUlmC3JJnKlEBzh3zR74mju3uXf2BnDl5PJJsA9M9Y
	kBZly6ljdLkPy3GL3HeaTAvrkLKWghkc4EHecYTWf+xC5wP2kGhDUILWSn+4tNE=
X-Google-Smtp-Source: AGHT+IEfWa2sARX5iVa1uwuhVCGh6TdVM/VP1QniC2h7z2co2l7YutX7ZqvHVM7a5OfA0ZKHXEuzOQ==
X-Received: by 2002:a2e:98d7:0:b0:2d4:1f8f:69b8 with SMTP id s23-20020a2e98d7000000b002d41f8f69b8mr7715102ljj.19.1710759264530;
        Mon, 18 Mar 2024 03:54:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id p10-20020a2e804a000000b002d0bf097af1sm1426988ljg.123.2024.03.18.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:54:24 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Date: Mon, 18 Mar 2024 11:46:58 +0100
In-reply-to: <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
Message-ID: <1j5xxjhktd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> A1's internal codec is very close to t9015. The main difference, that it
> has ADC. This commit introduces support for capturing from it.

This is mis-leading.

It does not look like the change is A1 specific but rather a extension
of the support for t9015. It also mixes several different topics like line
configuration, capture support, etc ...

Again, the t9015 changes should be a separated series from the rest, and
there should be one patch per topic.

As Mark, if something is meant to be configured based on the HW layout,
then there a good change a kcontrol is not appropriate, and this should
rather be part of the platform description, like DT.

It was also suggested here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/meson/t9015.c?h=v6.8#n298

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  sound/soc/meson/t9015.c | 259 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 259 insertions(+)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 48f6767bd858..365955bfeb78 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -19,16 +19,33 @@
>  #define  LOLP_EN	3
>  #define  DACR_EN	4
>  #define  DACL_EN	5
> +#define  ADCR_EN	6
> +#define  ADCL_EN	7
> +#define  PGAR_ZCD_EN	8
> +#define  PGAL_ZCD_EN	9
> +#define  PGAR_EN	10
> +#define  PGAL_EN	11
> +#define  ADCR_INV	16
> +#define  ADCL_INV	17
> +#define  ADCR_SRC	18
> +#define  ADCL_SRC	19
>  #define  DACR_INV	20
>  #define  DACL_INV	21
>  #define  DACR_SRC	22
>  #define  DACL_SRC	23
> +#define  ADC_DEM_EN	26
> +#define  ADC_FILTER_MODE 28
> +#define  ADC_FILTER_EN	29
>  #define  REFP_BUF_EN	BIT(12)
>  #define  BIAS_CURRENT_EN BIT(13)
>  #define  VMID_GEN_FAST	BIT(14)
>  #define  VMID_GEN_EN	BIT(15)
>  #define  I2S_MODE	BIT(30)
>  #define VOL_CTRL0	0x04
> +#define  PGAR_VC	0
> +#define  PGAL_VC	8
> +#define  ADCR_VC	16
> +#define  ADCL_VC	24
>  #define  GAIN_H		31
>  #define  GAIN_L		23
>  #define VOL_CTRL1	0x08
> @@ -46,6 +63,28 @@
>  #define  LOLN_POL	8
>  #define  LOLP_POL	12
>  #define POWER_CFG	0x10
> +#define LINEIN_CFG	0x14
> +#define  MICBIAS_LEVEL	0
> +#define  MICBIAS_EN	3
> +#define  PGAR_CTVMN	8
> +#define  PGAR_CTVMP	9
> +#define  PGAL_CTVMN	10
> +#define  PGAL_CTVMP	11
> +#define  PGAR_CTVIN	12
> +#define  PGAR_CTVIP	13
> +#define  PGAL_CTVIN	14
> +#define  PGAL_CTVIP	15
> +
> +#define PGAR_MASK	(BIT(PGAR_CTVMP) | BIT(PGAR_CTVMN) | \
> +			 BIT(PGAR_CTVIP) | BIT(PGAR_CTVIN))
> +#define PGAR_DIFF	(BIT(PGAR_CTVIP) | BIT(PGAR_CTVIN))
> +#define PGAR_POSITIVE	(BIT(PGAR_CTVIP) | BIT(PGAR_CTVMN))
> +#define PGAR_NEGATIVE	(BIT(PGAR_CTVIN) | BIT(PGAR_CTVMP))
> +#define PGAL_MASK	(BIT(PGAL_CTVMP) | BIT(PGAL_CTVMN) | \
> +			 BIT(PGAL_CTVIP) | BIT(PGAL_CTVIN))
> +#define PGAL_DIFF	(BIT(PGAL_CTVIP) | BIT(PGAL_CTVIN))
> +#define PGAL_POSITIVE	(BIT(PGAL_CTVIP) | BIT(PGAL_CTVMN))
> +#define PGAL_NEGATIVE	(BIT(PGAL_CTVIN) | BIT(PGAL_CTVMP))
>  
>  struct t9015 {
>  	struct regulator *avdd;
> @@ -103,6 +142,31 @@ static struct snd_soc_dai_driver t9015_dai = {
>  	.ops = &t9015_dai_ops,
>  };
>  
> +static struct snd_soc_dai_driver a1_t9015_dai = {
> +	.name = "t9015-hifi",
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.formats = (SNDRV_PCM_FMTBIT_S8 |
> +			    SNDRV_PCM_FMTBIT_S16_LE |
> +			    SNDRV_PCM_FMTBIT_S20_LE |
> +			    SNDRV_PCM_FMTBIT_S24_LE),
> +	},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.formats = (SNDRV_PCM_FMTBIT_S8 |
> +			    SNDRV_PCM_FMTBIT_S16_LE |
> +			    SNDRV_PCM_FMTBIT_S20_LE |
> +			    SNDRV_PCM_FMTBIT_S24_LE),
> +	},
> +	.ops = &t9015_dai_ops,
> +};
> +
>  static const DECLARE_TLV_DB_MINMAX_MUTE(dac_vol_tlv, -9525, 0);
>  
>  static const char * const ramp_rate_txt[] = { "Fast", "Slow" };
> @@ -179,6 +243,166 @@ static const struct snd_soc_dapm_route t9015_dapm_routes[] = {
>  	{ "LOLP", NULL, "Left+ Driver",  },
>  };
>  
> +static const char * const a1_right_driver_txt[] = { "None", "Right DAC",
> +	"Left DAC Inverted" };
> +static const unsigned int a1_right_driver_values[] = { 0, 2, 4 };
> +
> +static const char * const a1_left_driver_txt[] = { "None", "Left DAC",
> +	"Right DAC Inverted" };
> +static const unsigned int a1_left_driver_values[] = { 0, 2, 4 };
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(a1_right_driver, LINEOUT_CFG, 12, 0x7,
> +				  a1_right_driver_txt, a1_right_driver_values);
> +static SOC_VALUE_ENUM_SINGLE_DECL(a1_left_driver, LINEOUT_CFG, 4, 0x7,
> +				  a1_left_driver_txt, a1_left_driver_values);
> +
> +static const struct snd_kcontrol_new a1_right_driver_mux =
> +	SOC_DAPM_ENUM("Right Driver+ Source", a1_right_driver);
> +static const struct snd_kcontrol_new a1_left_driver_mux =
> +	SOC_DAPM_ENUM("Left Driver+ Source", a1_left_driver);
> +
> +static const DECLARE_TLV_DB_MINMAX_MUTE(a1_adc_vol_tlv, -29625, 0);
> +static const DECLARE_TLV_DB_MINMAX_MUTE(a1_adc_pga_vol_tlv, -1200, 0);
> +
> +static const char * const a1_adc_right_txt[] = { "Right", "Left" };
> +static SOC_ENUM_SINGLE_DECL(a1_adc_right, BLOCK_EN, ADCR_SRC, a1_adc_right_txt);
> +
> +static const char * const a1_adc_left_txt[] = { "Left", "Right" };
> +static SOC_ENUM_SINGLE_DECL(a1_adc_left, BLOCK_EN, ADCL_SRC, a1_adc_left_txt);
> +
> +static const struct snd_kcontrol_new a1_adc_right_mux =
> +	SOC_DAPM_ENUM("ADC Right Source", a1_adc_right);
> +static const struct snd_kcontrol_new a1_adc_left_mux =
> +	SOC_DAPM_ENUM("ADC Left Source", a1_adc_left);
> +
> +static const char * const a1_adc_filter_mode_txt[] = { "Voice", "HiFi"};
> +static SOC_ENUM_SINGLE_DECL(a1_adc_filter_mode, BLOCK_EN, ADC_FILTER_MODE,
> +			    a1_adc_filter_mode_txt);
> +
> +static const char * const a1_adc_mic_bias_level_txt[] = { "2.0V", "2.1V",
> +	"2.3V", "2.5V", "2.8V" };
> +static const unsigned int a1_adc_mic_bias_level_values[] = { 0, 1, 2, 3, 7 };
> +static SOC_VALUE_ENUM_SINGLE_DECL(a1_adc_mic_bias_level,
> +				  LINEIN_CFG, MICBIAS_LEVEL, 0x7,
> +				  a1_adc_mic_bias_level_txt,
> +				  a1_adc_mic_bias_level_values);
> +
> +static const char * const a1_adc_pga_txt[] = { "None", "Differential",
> +	"Positive", "Negative" };
> +static const unsigned int a1_adc_pga_right_values[] = { 0, PGAR_DIFF,
> +	PGAR_POSITIVE, PGAR_NEGATIVE };
> +static const unsigned int a1_adc_pga_left_values[] = { 0, PGAL_DIFF,
> +	PGAL_POSITIVE, PGAL_NEGATIVE };
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(a1_adc_pga_right, LINEIN_CFG, 0, PGAR_MASK,
> +				  a1_adc_pga_txt, a1_adc_pga_right_values);
> +static SOC_VALUE_ENUM_SINGLE_DECL(a1_adc_pga_left, LINEIN_CFG, 0, PGAL_MASK,
> +				  a1_adc_pga_txt, a1_adc_pga_left_values);
> +
> +static const struct snd_kcontrol_new a1_adc_pga_right_mux =
> +	SOC_DAPM_ENUM("ADC PGA Right Source", a1_adc_pga_right);
> +static const struct snd_kcontrol_new a1_adc_pga_left_mux =
> +	SOC_DAPM_ENUM("ADC PGA Left Source", a1_adc_pga_left);
> +
> +static const struct snd_kcontrol_new a1_t9015_snd_controls[] = {
> +	/* Volume Controls */
> +	SOC_ENUM("Playback Channel Mode", mono_enum),
> +	SOC_SINGLE("Playback Switch", VOL_CTRL1, DAC_SOFT_MUTE, 1, 1),
> +	SOC_DOUBLE_TLV("Playback Volume", VOL_CTRL1, DACL_VC, DACR_VC,
> +		       0xff, 0, dac_vol_tlv),
> +
> +	/* Ramp Controls */
> +	SOC_ENUM("Ramp Rate", ramp_rate_enum),
> +	SOC_SINGLE("Volume Ramp Switch", VOL_CTRL1, VC_RAMP_MODE, 1, 0),
> +	SOC_SINGLE("Mute Ramp Switch", VOL_CTRL1, MUTE_MODE, 1, 0),
> +	SOC_SINGLE("Unmute Ramp Switch", VOL_CTRL1, UNMUTE_MODE, 1, 0),
> +
> +	/* ADC Controls */
> +	SOC_DOUBLE_TLV("ADC Volume", VOL_CTRL0, ADCL_VC, ADCR_VC,
> +		       0x7f, 0, a1_adc_vol_tlv),
> +	SOC_SINGLE("ADC Filter Switch", BLOCK_EN, ADC_FILTER_EN, 1, 0),
> +	SOC_ENUM("ADC Filter Mode", a1_adc_filter_mode),
> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),
> +	SOC_SINGLE("ADC DEM Switch", BLOCK_EN, ADC_DEM_EN, 1, 0),
> +	SOC_DOUBLE_TLV("ADC PGA Volume", VOL_CTRL0, PGAR_VC, PGAL_VC,
> +		       0x1f, 0, a1_adc_pga_vol_tlv),
> +	SOC_DOUBLE("ADC PGA Zero Cross-detection Switch", BLOCK_EN,
> +		   PGAL_ZCD_EN, PGAR_ZCD_EN, 1, 0),
> +};
> +
> +static const struct snd_soc_dapm_widget a1_t9015_dapm_widgets[] = {
> +	SND_SOC_DAPM_AIF_IN("Right IN", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("Left IN", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_MUX("Right DAC Sel", SND_SOC_NOPM, 0, 0,
> +			 &t9015_right_dac_mux),
> +	SND_SOC_DAPM_MUX("Left DAC Sel", SND_SOC_NOPM, 0, 0,
> +			 &t9015_left_dac_mux),
> +	SND_SOC_DAPM_DAC("Right DAC", NULL, BLOCK_EN, DACR_EN, 0),
> +	SND_SOC_DAPM_DAC("Left DAC",  NULL, BLOCK_EN, DACL_EN, 0),
> +	SND_SOC_DAPM_MUX("Right+ Driver Sel", SND_SOC_NOPM, 0, 0,
> +			 &a1_right_driver_mux),
> +	SND_SOC_DAPM_MUX("Left+ Driver Sel", SND_SOC_NOPM, 0, 0,
> +			 &a1_left_driver_mux),
> +	SND_SOC_DAPM_OUT_DRV("Right+ Driver", BLOCK_EN, LORP_EN, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Left+ Driver",  BLOCK_EN, LOLP_EN, 0, NULL, 0),
> +	SND_SOC_DAPM_OUTPUT("LORP"),
> +	SND_SOC_DAPM_OUTPUT("LOLP"),
> +
> +	SND_SOC_DAPM_INPUT("ADC IN Right"),
> +	SND_SOC_DAPM_INPUT("ADC IN Left"),
> +	SND_SOC_DAPM_MUX("ADC PGA Right Sel", SND_SOC_NOPM, 0, 0,
> +			 &a1_adc_pga_right_mux),
> +	SND_SOC_DAPM_MUX("ADC PGA Left Sel", SND_SOC_NOPM, 0, 0,
> +			 &a1_adc_pga_left_mux),
> +	SND_SOC_DAPM_PGA("ADC PGA Right", BLOCK_EN, PGAR_EN, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA("ADC PGA Left", BLOCK_EN, PGAL_EN, 0, NULL, 0),
> +	SND_SOC_DAPM_ADC("ADC Right", NULL, BLOCK_EN, ADCR_EN, 0),
> +	SND_SOC_DAPM_ADC("ADC Left", NULL, BLOCK_EN, ADCL_EN, 0),
> +	SND_SOC_DAPM_MUX("ADC Right Sel", SND_SOC_NOPM, 0, 0, &a1_adc_right_mux),
> +	SND_SOC_DAPM_MUX("ADC Left Sel", SND_SOC_NOPM, 0, 0, &a1_adc_left_mux),
> +	SND_SOC_DAPM_AIF_OUT("ADC OUT Right", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("ADC OUT Left", NULL, 0, SND_SOC_NOPM, 0, 0),
> +};
> +
> +static const struct snd_soc_dapm_route a1_t9015_dapm_routes[] = {
> +	{ "Right IN", NULL, "Playback" },
> +	{ "Left IN", NULL, "Playback" },
> +	{ "Right DAC Sel", "Right", "Right IN" },
> +	{ "Right DAC Sel", "Left", "Left IN" },
> +	{ "Left DAC Sel", "Right", "Right IN" },
> +	{ "Left DAC Sel", "Left", "Left IN" },
> +	{ "Right DAC", NULL, "Right DAC Sel" },
> +	{ "Left DAC", NULL, "Left DAC Sel" },
> +	{ "Right+ Driver Sel", "Right DAC", "Right DAC" },
> +	{ "Right+ Driver Sel", "Left DAC Inverted", "Right DAC" },
> +	{ "Left+ Driver Sel", "Left DAC", "Left DAC" },
> +	{ "Left+ Driver Sel", "Right DAC Inverted", "Left DAC" },
> +	{ "Right+ Driver", NULL, "Right+ Driver Sel" },
> +	{ "Left+ Driver", NULL, "Left+ Driver Sel" },
> +	{ "LORP", NULL, "Right+ Driver", },
> +	{ "LOLP", NULL, "Left+ Driver", },
> +
> +	{ "ADC PGA Right Sel", "Differential", "ADC IN Right" },
> +	{ "ADC PGA Right Sel", "Positive", "ADC IN Right" },
> +	{ "ADC PGA Right Sel", "Negative", "ADC IN Right" },
> +	{ "ADC PGA Left Sel", "Differential", "ADC IN Left" },
> +	{ "ADC PGA Left Sel", "Positive", "ADC IN Left" },
> +	{ "ADC PGA Left Sel", "Negative", "ADC IN Left" },
> +	{ "ADC PGA Right", NULL, "ADC PGA Right Sel" },
> +	{ "ADC PGA Left", NULL, "ADC PGA Left Sel" },
> +	{ "ADC Right", NULL, "ADC PGA Right" },
> +	{ "ADC Left", NULL, "ADC PGA Left" },
> +	{ "ADC Right Sel", "Right", "ADC Right" },
> +	{ "ADC Right Sel", "Left", "ADC Left" },
> +	{ "ADC Left Sel", "Right", "ADC Right" },
> +	{ "ADC Left Sel", "Left", "ADC Left" },
> +	{ "ADC OUT Right", NULL, "ADC Right Sel" },
> +	{ "ADC OUT Left", NULL, "ADC Left Sel" },
> +	{ "Capture", NULL, "ADC OUT Right" },
> +	{ "Capture", NULL, "ADC OUT Left" },
> +};
> +
>  static int t9015_set_bias_level(struct snd_soc_component *component,
>  				enum snd_soc_bias_level level)
>  {
> @@ -241,6 +465,18 @@ static int t9015_component_probe(struct snd_soc_component *component)
>  	return 0;
>  }
>  
> +static int a1_t9015_component_probe(struct snd_soc_component *component)
> +{
> +	/*
> +	 * This configuration was stealed from original Amlogic's driver to
> +	 * reproduce the behavior of the driver more accurately. However, it is
> +	 * not known for certain what it actually affects.
> +	 */
> +	snd_soc_component_write(component, POWER_CFG, 0x00010000);
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_component_driver t9015_codec_driver = {
>  	.probe			= t9015_component_probe,
>  	.set_bias_level		= t9015_set_bias_level,
> @@ -254,6 +490,19 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver a1_t9015_codec_driver = {
> +	.probe			= a1_t9015_component_probe,
> +	.set_bias_level		= t9015_set_bias_level,
> +	.controls		= a1_t9015_snd_controls,
> +	.num_controls		= ARRAY_SIZE(a1_t9015_snd_controls),
> +	.dapm_widgets		= a1_t9015_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(a1_t9015_dapm_widgets),
> +	.dapm_routes		= a1_t9015_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(a1_t9015_dapm_routes),
> +	.suspend_bias_off	= 1,
> +	.endianness		= 1,
> +};
> +
>  static int t9015_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -315,11 +564,21 @@ static const struct t9015_match_data t9015_match_data = {
>  	.max_register = POWER_CFG,
>  };
>  
> +static const struct t9015_match_data a1_t9015_match_data = {
> +	.component_drv = &a1_t9015_codec_driver,
> +	.dai_drv = &a1_t9015_dai,
> +	.max_register = LINEIN_CFG,
> +};
> +
>  static const struct of_device_id t9015_ids[] __maybe_unused = {
>  	{
>  		.compatible = "amlogic,t9015",
>  		.data = &t9015_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,t9015-a1",
> +		.data = &a1_t9015_match_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, t9015_ids);


-- 
Jerome

