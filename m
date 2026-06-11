Return-Path: <linux-gpio+bounces-38321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hv6FLbOEKmpyrgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:49:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3B670910
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:49:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ohvexb5v;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38321-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38321-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9D6B3015C3F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4E3C5857;
	Thu, 11 Jun 2026 09:49:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BF43C4175
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 09:49:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171362; cv=none; b=aJFcMTb7lcBIQaiJz0p6VFQMgApQK2xNYQUd0ziFfpeJBVc+LJA9u84aw9YIfz08theUf6rgz8xXykqfbkJl/BpuDQG+IOP+AjdZfrsx2cktK7+YnNaK345HP4BEY6I3/N28C4OzYHNN63adEelHkxQN9QnhtllsSUrl5EJ7ZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171362; c=relaxed/simple;
	bh=S4BIUBRbEO29ocPxozqRrFP/C9o8xtnSUSH2KFmCpbg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppg2q3+dU06OUEp0TK13kNG22DaL0x5NSt0SFrF9niyAb1ckW96QiAvezASB4EsriFYBK1o7Nv/6+S8DoZEasWwjnwS893xkFFjuAlJIyV41QJhMb8pEmiGcQnSNup9E2Jaq4mcFOxYarr/ekUAoHWZIQ4R+Yp9Un0gul2JuWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohvexb5v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921C41F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171360;
	bh=wytX47iTOVlGsWaMnCOC5biW53KG+PvOIIBEsrB6UeQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ohvexb5vB0qvNCQ/waG2GHthFxasB5ZPE872j3CZA0Z4xB4Bu3tO97iYU0CgrWhAL
	 e9Rat1EeRxA6GL3tBTMFwN9296nu3fZ62Z5PlmyPWhoa/XaSUuh6da1x+gN/n1D8g8
	 xJ6vJwzhDoXjPA1JjwoesYe7BhlTH2R0A46mVDZaJp/8++OqIqYqD5qtS+ZCadmHUS
	 yIvKXqKdQhyNVdz1FwpzH1BjNEihhErQIUKstpLXqVJH/WlLpyqw7evmVDTAn7B6HY
	 dGkcC5TdGUW1ya97iuMQIQ/3umFqxkyjGpFMBETm9NYAHajzdv/PJ9KRbM7gerdOtH
	 anR0kBEaAXN/A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39677aed4d3so69863841fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 02:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gAa2gY37LVe/lNUPLqKhfZad41aODf42SjULi3lX4CqVd8Zv+H+U1rrS1ddIZ3GrvZFqnCKV+pbtZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++N/0D/jNR1svNpe54wi8JC7UjNGZ5f4uthn0rwI2RcLky3TM
	EuJo3AypWAytgx107+VQCTgaPEhc+llT4SqFWeyE2KPpAwechz6Mhy9MkgcAnnE14hoOsyh/WVU
	Mdh3P7iYYpnhWhJyiaPOt8TLDEeL2HfxTTDuhNZyE9A==
X-Received: by 2002:a2e:bc82:0:b0:396:77aa:1dff with SMTP id
 38308e7fff4ca-3991a1634fbmr5864991fa.23.1781171359200; Thu, 11 Jun 2026
 02:49:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 05:49:17 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 05:49:17 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com> <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 05:49:17 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
X-Gm-Features: AVVi8CcPpEoF540dxiZBx5o09HxzmMiojRBzSAzxkGBQgVXV1gCQVjyXXQDH2E4
Message-ID: <CAMRc=Mf2oujn6MstGqKg1JCu3hbPD5zHhCB-Zke_hu8LYCz-Xg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec driver
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38321-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54B3B670910

On Wed, 10 Jun 2026 17:57:08 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> Add an ASoC codec driver for the Qualcomm WSA885X smart speaker
> amplifier accessed over I2C.
>
> The driver provides the control-side support needed for playback
> bring-up, including register programming, serial interface setup, clock
> handling, mute and gain control, reset handling and interrupt support.
>
> Program the init table during codec initialization and reapply it only
> after an explicit device reset so the static device configuration is
> not rewritten on every playback start. Also program the TDM control
> slot-count field from the runtime slot configuration so the same codec
> path can be used with 2-slot, 4-slot, or 8-slot Audio IF backends.
>
> Keep the stream-time power-state sequencing in the DAI callbacks and
> use normal regmap access for the control path.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

...

> diff --git a/sound/soc/codecs/wsa885x-i2c.c b/sound/soc/codecs/wsa885x-i2c.c
> new file mode 100644
> index 000000000..a7d8f8d48
> --- /dev/null
> +++ b/sound/soc/codecs/wsa885x-i2c.c
> @@ -0,0 +1,1643 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/* WSA885X I2C codec driver */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +#include <linux/interrupt.h>

Can you keep the headers in alphabetical order?

...

> +
> +#define WSA885X_FU21_VOL_STEPS 124
> +#define WSA885X_USAGE_MODE_MAX 8
> +#define WSA885X_INIT_TABLE_MAX_ITEMS 256

Add newline.

...

> +
> +static int wsa885x_apply_init_table(struct wsa885x_i2c_priv *wsa885x)
> +{
> +	int i;
> +	int ret;

I'd put it on the same line (elsewhere too) but that's personal preference.

> +
> +	if (!wsa885x || !wsa885x->regmap)
> +		return -EINVAL;


You have a lot of these checks but this can't really happen, can it?

> +
> +	if (!wsa885x->init_table_size)
> +		return 0;
> +
> +	if (!wsa885x->init_table)
> +		return -EINVAL;
> +
> +	for (i = 0; i < wsa885x->init_table_size / 2; i++) {
> +		u32 reg = wsa885x->init_table[2 * i];
> +		u32 val = wsa885x->init_table[2 * i + 1];
> +
> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH1_CTRL11)
> +			continue;
> +
> +		if (wsa885x->batt_conf == WSA885X_BATT_2S && reg == WSA885X_SPK_TOP_LF_CH2_CTRL11)
> +			continue;
> +
> +		ret = regmap_write(wsa885x->regmap, reg, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wsa885x_hw_init(struct wsa885x_i2c_priv *wsa885x)
> +{
> +	static const struct reg_sequence regs[] = {
> +		{ WSA885X_DIG_CTRL1_SPMI_PAD_GPIO2_CTL, 0x2e },
> +		{ WSA885X_DIG_CTRL1_INTR_MODE, 0x01 },
> +		{ WSA885X_DIG_CTRL1_PIN_CT, 0x04 },
> +	};
> +	int ret;
> +
> +	if (!wsa885x || !wsa885x->regmap)
> +		return -EINVAL;
> +
> +	ret = wsa885x_apply_init_table(wsa885x);
> +	if (ret)
> +		return ret;
> +
> +	if (wsa885x->batt_conf == WSA885X_BATT_2S) {
> +		ret = wsa885x_2s_conf(wsa885x);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
> +}
> +
> +static int wsa885x_unmask_interrupts(struct wsa885x_i2c_priv *wsa885x)
> +{
> +	static const struct reg_sequence regs[] = {
> +		{ WSA885X_INTR_MASK0, 0x00 },
> +		{ WSA885X_INTR_MASK0 + 1, 0x00 },
> +		{ WSA885X_INTR_MASK0 + 2, 0xf8 },
> +	};
> +
> +	if (!wsa885x || !wsa885x->regmap)
> +		return -EINVAL;
> +
> +	return regmap_multi_reg_write(wsa885x->regmap, regs, ARRAY_SIZE(regs));
> +}
> +
> +static int wsa885x_wait_for_pde_state(struct wsa885x_i2c_priv *wsa885x, int ps)
> +{
> +	int act_ps = -1, cnt = 0, clock_valid = -1;
> +	int rc = 0;
> +
> +	if (!wsa885x || !wsa885x->regmap)
> +		return -EINVAL;
> +
> +	if (ps < 0 || ps > 3)
> +		return -EINVAL;
> +
> +	do {
> +		usleep_range(1000, 1500);
> +		rc = regmap_read(wsa885x->regmap,
> +				 WSA885X_SMP_AMP_CTRL_STEREO_PDE23_ACT_PS,
> +				 &act_ps);
> +		if (rc) {
> +			dev_err(wsa885x->dev, "PDE state read failed: %d\n", rc);
> +			return rc;
> +		}
> +		if (act_ps == ps)
> +			return 0;
> +	} while (++cnt < 5);

Newline.

> +	if (regmap_read(wsa885x->regmap,
> +			WSA885X_SMP_AMP_CTRL_STEREO_CS21_CLOCK_VALID,
> +			&clock_valid))
> +		dev_err(wsa885x->dev,
> +			"PDE power state %d request failed, actual_ps %d, clock_valid read failed\n",
> +			ps, act_ps);
> +	else
> +		dev_err(wsa885x->dev,
> +			"PDE power state %d request failed, actual_ps %d, clock_valid:%d\n",
> +			ps, act_ps, clock_valid);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int wsa885x_codec_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct wsa885x_i2c_priv *wsa885x;
> +	u8 pcm_rate, cs21_sample_rate_idx, cs24_sample_rate_idx;
> +
> +	(void)substream;

Do we warn about unused arguments in the kernel now?

...

> +
> +static int wsa885x_stereo_gain_offset_get(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x;
> +	int val;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x)
> +		return -EINVAL;
> +
> +	val = wsa885x->stereo_vol_db + 84;
> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS)
> +		return -ERANGE;
> +
> +	ucontrol->value.integer.value[0] = val;
> +	return 0;
> +}
> +
> +static int wsa885x_stereo_gain_offset_put(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x;
> +	long val;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x)
> +		return -EINVAL;
> +
> +	val = ucontrol->value.integer.value[0];
> +
> +	if (val < 0 || val > WSA885X_FU21_VOL_STEPS) {
> +		dev_err(component->dev, "%s: Invalid range, Val: %ld\n", __func__, val);
> +		return -EINVAL;
> +	}
> +	wsa885x->stereo_vol_db = (int)val - 84;
> +	return 0;
> +}
> +
> +static int wsa885x_i2c_usage_modes_get(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x_i2c;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x_i2c)
> +		return -EINVAL;
> +
> +	if (wsa885x_i2c->usage_mode > WSA885X_USAGE_MODE_MAX)
> +		return -ERANGE;
> +
> +	ucontrol->value.integer.value[0] = wsa885x_i2c->usage_mode;
> +
> +	return 0;
> +}
> +
> +static int wsa885x_i2c_usage_modes_put(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x_i2c;
> +	long val;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x_i2c)
> +		return -EINVAL;
> +

You seem to be repeating the same sequence in multiple functions just to get
the address of wsa885x_i2c. Can you factor it out into a separate helper and
save some lines?

> +	val = ucontrol->value.integer.value[0];
> +
> +	if (val < 0 || val > WSA885X_USAGE_MODE_MAX)
> +		return -EINVAL;
> +
> +	wsa885x_i2c->usage_mode = val;
> +
> +	return 0;
> +}
> +
> +static int wsa885x_i2c_rx_slot_mask_get(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x_i2c;
> +	u32 mask;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x_i2c)
> +		return -EINVAL;
> +
> +	mask = wsa885x_i2c->rx_slot_mask;
> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
> +		return -ERANGE;
> +
> +	ucontrol->value.integer.value[0] = mask;
> +
> +	return 0;
> +}
> +
> +static int wsa885x_i2c_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component;
> +	struct wsa885x_i2c_priv *wsa885x_i2c;
> +	long mask;
> +
> +	if (!kcontrol || !ucontrol)
> +		return -EINVAL;
> +
> +	component = snd_kcontrol_chip(kcontrol);
> +	if (!component)
> +		return -EINVAL;
> +
> +	wsa885x_i2c = snd_soc_component_get_drvdata(component);
> +	if (!wsa885x_i2c)
> +		return -EINVAL;
> +
> +	mask = ucontrol->value.integer.value[0];
> +
> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
> +		return -EINVAL;
> +
> +	wsa885x_i2c->rx_slot_mask = mask;
> +
> +	return 0;
> +}
> +

...

> +				/* INTR_CLEAR registers are write-only; use regmap_write
> +				 * instead of regmap_update_bits to avoid the read-modify-write
> +				 * that regmap_update_bits performs on non-readable registers.
> +				 */

/*
 */

style comments please

...

> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
> +
> +	i2c_set_clientdata(client, wsa885x);

I don't see a corresponding i2c_get_clientdata(). Do you really need it?

...

Bart

