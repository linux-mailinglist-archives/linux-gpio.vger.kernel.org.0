Return-Path: <linux-gpio+bounces-7501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C3990ADC3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 14:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353D91C2325F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 12:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E421940A5;
	Mon, 17 Jun 2024 12:15:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181BD2F32;
	Mon, 17 Jun 2024 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626545; cv=none; b=MzuJTAKCJC6Plvs2SIzX2vM/WcI0L+uwtUm27Zg1pSynduOxOONpB0E8hml61kXTgDfHs54Elxz9WwWYpf/LfdFT3/GIzNN2hpsPvVehnUyAvyvv4wTN7XFn9IllgBjZ5M6J9Btxa/KUGE88SVHteu6Eh9RvhGZUd70O/8ZSlQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626545; c=relaxed/simple;
	bh=AWQ35KpayndOCVI1ag4/S3eM6Bocg203IdjyV7oVxGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkRf7F93Zb/De9dNzA6UNKdrNtOUUlAXL8ZwdZ1NlyFgJKst4rw7YzawXwd16NGY4qpFeC7pTEHVtDG3TPHtwxLvX8FwAlT4GQLnn9Z5M9eHuUCvPZVc8bi0mzAyHugYpQ6mkMPVUUi8AgIwwopSs7BWnFqDZ94Nt6PPOus2YZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6326f1647f6so26308087b3.0;
        Mon, 17 Jun 2024 05:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718626542; x=1719231342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g4X1nRnxWYP7yqfEl8cswCfU85i+/AuoKwcpOm05Ts=;
        b=Nh+PtMpHyfOQ6nychHSadmTtkbuox8IS9q8i1Fp7Gd4obTwgC1OINTa3InU8AIyjem
         lVaKxQxI1TTLjPlh5l5L+OsQeE4FqQrw9iz6ebr+oKsaWgYKJ4fEZjU+gFp80RRkKzdF
         YbHRzfw1lS3sCvwk+mVmxqgbCN7ksKrs2y1GJ3o4jh9POFP3e6+Pcd9hSh75z4/81M6s
         +5CTX5BcssV8Sa2qrNIAsOpbZgJNlUhppJi0/N/Gn/Lk9iUhB3EcM8ZtAkWm4dfsAgm7
         xHtaSrSrPG7B1KoG/hTUNTPNBEtpldU1eCEcZvigxo9NOkK9TdHRbRBV19epKGRWts1R
         /iQw==
X-Forwarded-Encrypted: i=1; AJvYcCXqVAnKU8A+TwpyR00+FQbkPMpG7QqPX6GgfhUKotOX9T5jaFwwyXUMKQ7KtUjMVlu2/4+t0jK0TBVl2sq4XfsNdRFqW17f2yaWlm9yf9xrvmyboGY4/H67+vHOXCovDlrWrxhMm0gwHUinqdHe7OB7mqpnPRAOi7YhYT2Vnd53zoX74H4QvnfBiFqSSwg6J/25IAVf/ja8n26s8BdnX7hsrJ1Tz0BW/A==
X-Gm-Message-State: AOJu0YzCp5nLlYbpsFQ6O8hFzphRhQ/vknIL7v6sQ9sTVUjNGQyHDR3+
	sh6Q/W+/DbWoLsNI7Qgn0qLHamMjmfY4Q6QsZ5oc+o3QhewcNCqZFAfkzxb/
X-Google-Smtp-Source: AGHT+IGqOFkkms6qXLd1nnBoJfN9n8yXsvei6L9uqb4/bf9DEAoVIl22ZjE0s0N8kH1Tb8vYoNDM+A==
X-Received: by 2002:a81:a849:0:b0:627:d23a:4505 with SMTP id 00721157ae682-632225565c4mr87103277b3.3.1718626541908;
        Mon, 17 Jun 2024 05:15:41 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631188b312bsm14043877b3.34.2024.06.17.05.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:15:41 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63186c222eeso37883557b3.2;
        Mon, 17 Jun 2024 05:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2eExOPfkLMTuAzl89h8YYWHqZX3el+xUsobuBMZDaABbhBWRKouuSo8KYP9RRUIE3WJnwBc3ArM9t7QsKaUNzIhJmJmgTAUdgA5rZAa4tpHwOyB7NqrSLJ6sKYgQiSYf9b43AGNx4M7uGXz5AYlbmH6nl2Ka7pty8sPjoRhbraaW1AjjW6TrTDLnngHcGUD/CYBSuInXS70vKsZ6oSm1mHQI27MytQw==
X-Received: by 2002:a81:b2c2:0:b0:627:7e65:979 with SMTP id
 00721157ae682-632230507f4mr90233747b3.24.1718626541245; Mon, 17 Jun 2024
 05:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com> <20240611113204.3004-4-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240611113204.3004-4-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:15:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgbnFoHWsB8NPu+Whn+FBkQ_EogS3yH+g-1wGTxensgQ@mail.gmail.com>
Message-ID: <CAMuHMdUgbnFoHWsB8NPu+Whn+FBkQ_EogS3yH+g-1wGTxensgQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Jun 11, 2024 at 1:33=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> On the RZ/G2L SoC family, the direction of the Ethernet TXC/TX_CLK
> signal is selectable to support an Ethernet PHY operating in either MII
> or RGMII mode. By default, the signal is configured as an input and MII
> mode is supported. The ETH_MODE register can be modified to configure
> this signal as an output to support RGMII mode.
>
> As this signal is by default an input, and can optionally be switched to
> an output, it maps neatly onto an `output-enable` property in the device
> tree.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
> Changes v1->v2:
>   * Use oen_read and oen_write function pointers to be compatible with
>     recent patches adding RZ/V2H support.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -994,6 +994,61 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinct=
rl *pctrl, u32 caps,
>         return false;
>  }
>
> +static int rzg2l_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 cap=
s,
> +                               u32 port, u8 pin)
> +{
> +       if (!(caps & PIN_CFG_OEN) || pin > hwcfg->oen_max_pin)
> +               return -EINVAL;
> +
> +       /*
> +        * We can determine which Ethernet interface we're dealing with f=
rom
> +        * the caps.
> +        */
> +       if (caps & PIN_CFG_IO_VMC_ETH0)
> +               return 0;
> +       if (caps & PIN_CFG_IO_VMC_ETH1)
> +               return 1;
> +
> +       return -EINVAL;
> +}
> +
> +static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsigne=
d int _pin)

rzg2l_oen_read()

> +{
> +       u32 port =3D RZG2L_PIN_ID_TO_PORT(_pin);
> +       u8 pin =3D RZG2L_PIN_ID_TO_PIN(_pin);
> +       int bit;
> +
> +       bit =3D rzg2l_pin_to_oen_bit(pctrl->data->hwcfg, caps, port, pin)=
;
> +       if (bit < 0)
> +               return 0;
> +
> +       return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
> +}
> +
> +static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsign=
ed int _pin, u8 oen)

rzg2l_oen_write()

With these fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

