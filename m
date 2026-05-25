Return-Path: <linux-gpio+bounces-37443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGs9NxoXFGo4JgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:32:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86E5C8A26
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C454C3041A3D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D2F3E639F;
	Mon, 25 May 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxaGw4mo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AABC3E51F6
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701353; cv=none; b=E4OVn97yIto72Vkn0rMy3X5XBGTSl3nfi7MPXKNNaNtAa7rTwD2LqAPwNaSxfazhTdn4kJiQ/H6p4HqNDcSmDRXI4lb4Nw5UruJNMwk6QrVwoc3Lt/7oQ5oqodJIy+pbEX5LBTDPrJebiTKrpSFuUXzyPrM3ebAkkbBH6+mLuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701353; c=relaxed/simple;
	bh=TGRZCBD7iuyFbkhAVGL00hW9/TM9IDmOwyOvMQlKGQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDGbjCwGllcwS4K3fDU1JaINaEkqK4xXNLYXtIZ4o1wp2RratAidGLGvXXJRFbCR2Q9byRXgLFmdvSOc1XWfsz5xH7dqDCJIhAgtWUMtMbJUAmVRUBil2tm4wUnFs8vKU3wdO4XbFuQpMf5+UKelEPa+TJzU4GNWEikCWTH0lZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxaGw4mo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC92A1F00ACF
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701344;
	bh=Q8SY8TH6SQ1E0PGo117ZsQRk+yPGIg2/ZOb5kgafIpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bxaGw4mo+B7pdpcyMGGuiRvyLpvX6yF2qHWETADmDDRVdxlCciutGYSDLY/jJlGnV
	 UsYHEIRqsy1SBMpFeizua5B/HXEdtBBs8oU77itpn3LUV4x5nZzbrnkX+qhYd7KGYR
	 StN6Elkz+mK6n0aMdydSqCtpnWC1T082DuUt97cJUjg5SbMYv0RPaqjr8QIj9esVpm
	 ifX+pN3v+jPUxyGyp0Wz9aA2AxhkV3EOF2u9PUO03EcpGaWoG/832BtKwon+JYnZwL
	 o4SoGR8cZaY/K3PbJJTQ2UVENosx8OQaDDXCEQ1l+WMGpjkEvtsfAGnOtW4ohVICMr
	 ijKPvtL0tGG6g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8f9841616so7573715e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 02:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n+jHvZWcHhnuo87OwGpIvCSoH34FFVS9fW6iA8mOdWZ/TzNT3EEl6J+9Exj53qHNLlZYRKyuxNZT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7B0dEIdqZZuA3yMLq+guuPNlwnwQCGlTTqj1mjCRNERNfz4v
	RFxskN4g8DlOP7mAMfvbR4w9klj3RwP+MAmkm9hB76nwe0w/fuF0YqrLTSX3KmuVCglJLRDJug/
	sKIKYtOYi4MU8aK2ZvnXcxN6GzGaLCgI=
X-Received: by 2002:a05:6512:3404:b0:5a8:99fe:59eb with SMTP id
 2adb3069b0e04-5aa323bffbemr3540548e87.41.1779701343399; Mon, 25 May 2026
 02:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:28:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
X-Gm-Features: AVHnY4JttAtjIvgHSdcMJb9NJ7l-9I7y04Sk14HfxnxLQyKX2p__ILu25C6cl_Q
Message-ID: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37443-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6B86E5C8A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jia,

thanks for your patch!

On Fri, May 15, 2026 at 3:18=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> From: Jia Wang <wangjia@ultrarisc.com>
>
> Add pinctrl driver for UltraRISC DP1000 pinctrl controller.
>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Please write an elaborate commit message with some details about
the hardware and it's history etc.

(...)

> +struct ur_legacy_prop_data {
> +       struct ur_pin_val *pin_vals;
> +       unsigned int *group_pins;
> +       unsigned int num_pins;
> +};

> +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> +                               struct device_node *np,
> +                               const char *propname,
> +                               struct ur_legacy_prop_data *prop)
> +static const char *ur_legacy_get_function_name(const struct ur_pinctrl_m=
atch_data *match_data,
> +                                              u32 mode)
> +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 co=
nf,
> +                                    unsigned long **configs,
> +                                    unsigned int *num_configs)
> +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> +                                     struct pinctrl_map **map,
> +                                     unsigned int *reserved_maps,
> +                                     unsigned int *num_maps,
> +                                     const struct ur_legacy_prop_data *p=
rop)
> +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                   struct device_node *np,
> +                                   struct pinctrl_map **map,
> +                                   unsigned int *num_maps)

What's up with all this legacy stuff?

What is this a legacy of?

I thought this was a *new* driver so how can it be "legacy"?

> +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                    struct device_node *np_config,
> +                                    struct pinctrl_map **map,
> +                                    unsigned int *num_maps)
> +{
> +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, nu=
m_maps,
> +                                             PIN_MAP_TYPE_INVALID);
> +}

Hm I think Conor has new helpers for this so you don't need to wrap
it like this.

> +static void ur_dt_free_map(struct pinctrl_dev *pctldev,
> +                          struct pinctrl_map *map,
> +                          unsigned int num_maps)
> +{
> +       pinctrl_utils_free_map(pctldev, map, num_maps);
> +}

Can't you just assign pinctrl_utils_free_map directly to ur_pinctrl_ops?

Yours,
Linus Walleij

