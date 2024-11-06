Return-Path: <linux-gpio+bounces-12643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C873E9BF0E4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 15:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815211F23107
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ED72022C1;
	Wed,  6 Nov 2024 14:57:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8009185B54;
	Wed,  6 Nov 2024 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905026; cv=none; b=pLBkbEgKVYRfz/1sh2tADQ19YBcj5IjuadqBuA3lULQVZ4EU3oD6N+7MUMdcHSahfDqL/QT/ZMLKfaz5w+u1DMPFiZugAc2Bz0leCtKAVGE7uNXGLz1xMfGPKa9zQrOTKsZYsewwUpTT1NDy842Pl4bqAcWR2RDDOGB3eNofAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905026; c=relaxed/simple;
	bh=jpohf7BcyhQkTMNu3yh6QMrbC/g8TqQoMKpzGsMPnZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kv0Pcy1cKY2NptDM/CgTHFk5a2h/cbzKuSlkizdhFGqkTLY/y16soXqSTzDzLPS1WPwlLQalKQhluVkc6RnZGEbT1JJ53nUG32s+oJ1mUJCoTkFJGfsnrGxnlxc5zFSv1aQoDbFhZ2L+E4S4bPIVEl5YHX/4/GU00C6pv3/wxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so5597124276.2;
        Wed, 06 Nov 2024 06:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905022; x=1731509822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbfgXHF/M5lJdXsELqbeNc9f4r5op8eDODQ6Its35/4=;
        b=nc6tBtCmtFdY80gWVTvnxHqAWRAur52UuA1XYhw+Mr7cvbnoD4O2azs6jDU95y4xSq
         Fq+pwDVqvyI7oHygGuvgbZsYzynIIHL0k/8VKu7sJtnoYozwhxyOS890E1egWkwXcVlm
         sB35rXFke/Txc7KPcVgb5AK2YvlGQdeJfVK6pMp/21iESm8bX+NImHv1ts/qy2ukRHQD
         YSe5MeMCwyZOo4mZP9Ub2LpDOsP+Bmytm93ZG8MluIKeWGRKba7TqhW052p+yRoj0xCO
         KxHU8m/+6+dLXXsxRjtE0nu+2sSgBOMG/65+gaGHThrNyTJW2/5iIeNghZUiby5aqekX
         AW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMCUxtLpk8lMTQi3W4WZFCixzX8ymyu+tw+yqAqpyDJ7FH6CX4f70fMsg7/K3tmXIjqQGQcB4cQX9BnA==@vger.kernel.org, AJvYcCUR+R2BvJa3KRptyCM5zP+nFY1PqaZY3rF+H+B9zv6ERAQEJWScFfYaOS05on5rKu4WS/wxAIKdwFzg@vger.kernel.org, AJvYcCUscHPF86xmEGzx29JekecdOjm4iyjk1I+YJlpnxlPUpi4kRW0MGmQoBYeU4+FKDJMI3jPLMS2pA93+qMM=@vger.kernel.org, AJvYcCV3bu5uAp4mFDNgVwYWQ8kbqBu3no1vCQ35+ldSP2jdYCwVQN27rwha2vb0aw2Shk9/U6Z0/aF6vBDZBk8W@vger.kernel.org, AJvYcCVOJOqEkdhMwrpJA8/2oTAtZ163IRSVu9jEFcVh4AtxzX+6bFe2EJoNc2n9OC0ZI+zk3zjGWTy1BWeI@vger.kernel.org, AJvYcCWZTKpxCDCA9HvMX2jaDYGk10WliZahv3+qTaH4jfoOvkPt8GPBoi9LounX4sZDsq3Tb1rEOSRQ+4pee4++VKQRPLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvNNHw91jR3R4mquYedlmnZCmMHzpAszLj2nNtEqFgSkguA/c
	LZm/vQqBzEHYkRi+aK4WaeszvFpSGsqWsJzb5VY8w0GGmGpxbvE6j6Ni+Ab+
X-Google-Smtp-Source: AGHT+IFa9X65WVkG10BvTZIN0NPNUf1oKbpKTVIZn+kMfdO5PvL4sKS4dKqx4MkLJA1WHNNiHZ6unQ==
X-Received: by 2002:a05:6902:168a:b0:e2b:ba9d:64c5 with SMTP id 3f1490d57ef6-e330269611dmr17580457276.48.1730905022522;
        Wed, 06 Nov 2024 06:57:02 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e82c77e2sm2915046276.0.2024.11.06.06.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 06:57:01 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea053b5929so56635607b3.0;
        Wed, 06 Nov 2024 06:57:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+2FxwH9Gay6jxa662tJV769KupZz0v2BA3Rq+jAhd4q/YX7ygqwQFZdFbjTJFvxUE059imn3YndVkrLF7@vger.kernel.org, AJvYcCUmahFCH9Ho+bUMq0sapbIBL+qT0jXzPfNgfGspj8yAz328whKkYnGudNg7iLSHPI3ctH2sDYX5qlD6sB/2oZkOiTI=@vger.kernel.org, AJvYcCUtT9arbAqdNKimzkKzZ7d2q5q+hUNZYiipYA5cpTltCaJJRunJjeAQMuy3FztiFXLAeuZBmfU9XXEt@vger.kernel.org, AJvYcCV1HswiEbSGNh5eA3Qg3Lxp8hzS3SCoqei2hk/iB4f0M1mE/tsrJ1jJFCLuGlI1xTqB/VavRYvjJMbrOw==@vger.kernel.org, AJvYcCVh2FD+eS52BXoiG7kLUKESZoReh6SJ0sJy55JqrIy3BnoEwQZyFwVWyxadxm1GxpPfiO9W6DAkduLE@vger.kernel.org, AJvYcCWvBriImaRRglrN+1IYsL/3j+/Mt110Mk4SYssjeJG2OebDwcXqGTVKuxenkemcilSTWdJ7uyaJWlXmA04=@vger.kernel.org
X-Received: by 2002:a05:690c:338d:b0:6e7:e2e9:6940 with SMTP id
 00721157ae682-6ea64aebcb5mr193177307b3.10.1730905020721; Wed, 06 Nov 2024
 06:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com> <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 15:56:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
Message-ID: <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
Subject: Re: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear bits
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 6, 2024 at 9:19=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> While it is still correct to pass zero as the bit-clear mask it may be
> confusing. For this, use a proper bitmask for clear bits.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
>                 dev_info(ssi->dev, "timeout waiting for SSI idle\n");
>
>         /* Hold FIFOs in reset */
> -       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RS=
T);

But you're not clearing SSIFCR_FIFO_RST, you're setting it?

>  }
>
>  static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *s=
trm)

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

