Return-Path: <linux-gpio+bounces-37936-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MPX8LpVHIWrNCQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37936-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:38:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 683FA63E9C1
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 11:38:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37936-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37936-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E89B306EB02
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 09:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2756375AB8;
	Thu,  4 Jun 2026 09:32:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F0235C01
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 09:32:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565579; cv=none; b=U/9geDdz67TtPbur4sCmTxrJs32i5ANpw4OwS/Shp94ccys4EDovhtbFJRgY69aZGpnYBW/0Byol6+M+1ZHkgsSTHnXQCQ1jAjEZcNjCGtuoLya77dzxFZedcjVnTBoY/flhn5/bWj+wvr0rFfu6AyEBtubbaKnHsN9wxWrUf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565579; c=relaxed/simple;
	bh=KJ5n2X+HxbFCWStcy95M8JjrsB781ZTR3XYKhqt06LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lii88NQ4TbASa+jL932aBSp/mKtIg1Cvwy7qGvnn1YVFbhyWKco6F37tz8VnXKTP7Df0Xt7ifmlMoK1hQnHCo3xZ2YtLOaHcSIiq46CPqsvlcfiO5Fpd7UkJeUw6agP/tku58v7T5Ay6slieCIsEDKg/owgHul3SEA0cGAoEjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec423a5265so73848066b.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565576; x=1781170376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CrJLOv2ASyu5V/KRm/C17ili3nS6XZLgzwNWr5zUA8=;
        b=gWN71Hq4aWvBQadi0Osg5GeycUBnbdnn79Zit+m2hzC52HDYScvgB8HyjV0ZfBQxC5
         Q+m1Uq2sDebJb7mSensCgaXrIM1m1fJV2QR+b0gwYoC+GvSHBiXwuGK6H9BAv957JbTc
         6KkuPRgeTKrGr8QUyLhL5XgKF0JQVXEhkIZd9rupdmNQUL/dLVp/J0/xjQ37tIJNSIKm
         RZzGEvzoXhLPpniaylMRLRgTdaUDwVK9fMhcPWn3Y829a0X8kXfFk4+bl6AWbJXho//T
         hGjwUYUNFLu2k3kle84nB2NNvVLGwP+OS1NnMs9MjNQ2iwNH2aaxlv2uxNXhlexfw7Wh
         bzFg==
X-Forwarded-Encrypted: i=1; AFNElJ+JynSOmPy0kIiSb2039vcgAWrC6wxuLhK+oDaq1WHLxp29vJx78BlyQ/QxrQ+UsAHBFTjVG98+cNXC@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWe4o/aFI9CsuvlUfVKtezZt9wbCyEJ+57UepqI8F9nqgMn+c
	bdnrVUhE4Sv/n6rqOlSzDUEVj5+FFPn1PWM5xidaTzMFCnNns8Kt/I3Oh9IiqR/pQrk=
X-Gm-Gg: Acq92OGxJGPseUA8Cp+dsyoa0gpFITqCQPsEUXBwtejc0AWhmjuND3QlBoWj9Bf8935
	9oAHapfnvr8Ow/OqruC7kiQLgfhXx+igt9E2FWWlKE1TYuaWGz3FQ8rji0knongRNlKhaIix8x0
	WK7Gn4mTmsC7ySriCKdiLBeaCb1C9MZvxDy3J0nm55vLk5IXbWa7sejWGM6eQzE//5m9Wum7o34
	zNbPJjWclUzzswQZSkbkMG0RmHAdFPO4DW8xgrL45a1aCPUu1bgDeSQxdjLJqTTcD3aIgchbDRJ
	UaF/f0d8atMvcBVKZZKofqmuO0SfXrCVApX2hV7l0ZW6hAzNK7xmQSmZ4y08ZFAEUjNKPj5puBN
	pAEdHZ5oTnHFYEStLk3IGWOsh2gXyk6Sg6Qor8Zaje3ukxexHJsEa8RXVttGm4HSISX2bVzHzK+
	/jAXmLKYW5MdC7duZQl+UFQUWBYNXo5sC9QkAZKX53ndwcPPcoHXYr4ar7mcaC0s4ocnbv1SA=
X-Received: by 2002:a17:907:9709:b0:bed:4938:94dd with SMTP id a640c23a62f3a-bf0aac18887mr368546266b.41.1780565573834;
        Thu, 04 Jun 2026 02:32:53 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f97sm294500466b.60.2026.06.04.02.32.51
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:32:51 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso895551a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KrzjnO3fsTPRYUhGUVVtXea7By3JupmrXu9HstX8Sf1AjU6MF5nTYKSqmFY5zOEyV90UnDBaOTty2@vger.kernel.org
X-Received: by 2002:a05:6402:3810:b0:683:1cc8:84a0 with SMTP id
 4fb4d7f45d1cf-68e7254901amr3620541a12.21.1780565570624; Thu, 04 Jun 2026
 02:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com> <20260603065731.93243-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:32:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
X-Gm-Features: AVHnY4Ij0I_LMXozFfIh9nNkmZ9i3aBEVnp4kYiGh_kZH1-i92wg1ef0LzESGUE
Message-ID: <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
Subject: Re: [PATCH v17 03/17] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37936-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:linusw@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 683FA63E9C1

Hi Biju,

On Wed, 3 Jun 2026 at 08:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
> SoC (r9a08g046).
>
> Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
> register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
> SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.
>
> Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
> port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
> SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
> respectively.
>
> Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0=E2=80=93=
DAT7)
> with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
> correctly for those pins.
>
> Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
> save and restore the SD_CH2_POC register across suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only *=
/
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only *=
/
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only *=
/
> +#define PIN_CFG_IO_VMC_SD2             BIT(22) /* known on RZ/G3L only *=
/
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin =
*/
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg f=
or port pins */
> @@ -258,6 +259,7 @@ static const struct pin_config_item renesas_rzv2h_con=
f_items[] =3D {
>   * @oen: OEN register offset
>   * @qspi: QSPI register offset
>   * @other_poc: OTHER_POC register offset
> + * @sd_ch2: SD_CH2_POC register offset
>   */
>  struct rzg2l_register_offsets {
>         u16 pwpr;
> @@ -266,6 +268,7 @@ struct rzg2l_register_offsets {
>         u16 oen;
>         u16 qspi;
>         u16 other_poc;
> +       u16 sd_ch2;

Nit: your series would cause less conflicts with Claudiu's
"[PATCH v3 0/6] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C"
if you would add sd_ch2 after the existing sd_ch.

>  };
>
>  /**

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

