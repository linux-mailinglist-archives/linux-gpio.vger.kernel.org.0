Return-Path: <linux-gpio+bounces-13675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 862409E9875
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B912E18846ED
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99EA1B0407;
	Mon,  9 Dec 2024 14:09:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066235968;
	Mon,  9 Dec 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753359; cv=none; b=id5NF7OujjeJCFmDbxWat7YAgM4rVzzndhD1l7CjcgjABMmcW5WMgrE6r+EPiPWr4gw239URfGGNmcBTQ3q1vbIl1DDndkzwc2NjNfyJwdcNh49Ux9vzG5xACq5JSr8/Dp1vL8AsPWjLlF4SMXEC4AnGdA8ETNTKEhWowyufTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753359; c=relaxed/simple;
	bh=s9Ldmug26kxAmuSbYyoIvZf07MyJobSWL4Un9vG+tFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKgwBAkoLc9xGjqYBQL91qG38McnM5ysSmiT8Z5HXrRF0tNcHoCUVY5UAdH3cKu49EDJOSWfdTd8BuBuMQauH03T3UNHNAff7G9Ld0YHhDJF7CgIpbIL45Lx4yri9jngq/oBRtxaMT4ZE7V7Ww71ZMONHpTqnvdwf/WQbPNSBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467631f3ae3so6131411cf.0;
        Mon, 09 Dec 2024 06:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753355; x=1734358155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7vHMlMX/1emap3oJbzw6fcX2VkuumLPk5gGBhXT388=;
        b=ji6cpONsxOnW3JXNWlvK/nmVVnmFyREgPl5hZiNDgQDWcUnFtCY+m8lMgLLOoIKm2z
         rcP/TwqQKDai2kghPHFDMl8AQzZXJ5gW3B0A6O1+OH/btbT49WTeBoRsvKAZc/EyE3O7
         jaG4MNKkJ7hfXRUyz4KTTIuH6GTdDtsICHOPUEiWBp2o2PnT6BA8sXF2vdmxmiw790Fw
         664R+ok0voKj8wfKTHYG5oEmFxRLUqSOcop8owTY8n3yStSAhUWATZLb83ypxCjEtTKF
         utHX74CtHP6HBKh4Wwl7pNFdkv5PycEM09FF9r92mKWjlS70FG8B1QEoVPqn4or9GBaV
         VVDw==
X-Forwarded-Encrypted: i=1; AJvYcCU63VniDVeKJ6sPY7nZZ+GNC3WlKJ1aQISB4Kx7oEhxqB0k9u/m7oHSZl488kNNbzCb/aQovwFJo18O@vger.kernel.org, AJvYcCU6Cz3Hu3gy8H9RA4ZOJUZkSxm6i9aYbJuwY6RPnDtLBNmpIs/VIiqoGelKmwUyQ0af/GPVTrmiA3w6@vger.kernel.org, AJvYcCVuu40KSvjLc/V8eqzgBDcVXi3wcBIWqp/eJvNs0+DFhQcKKxO2a0e1vVcrM1G5JHznrVgFzVVQ71lhkQ==@vger.kernel.org, AJvYcCW9Wklj1FszkjOXeRZdbpfnX49zOqiGufQyliG4RkfqxdVJtKqirCvJZYSNL344QIQYmr0DuO23/r7XGB8lJamP7do=@vger.kernel.org, AJvYcCWHqNSsuPaObw0o9RRCPTD3whFTOsZmHm1FR+T/nGefmmSruutZVltNOeXxHUBIeBfnwCjXxNR1W6c8UDQ=@vger.kernel.org, AJvYcCWeI59JpovYmVXjpZgImLcEX2DgGDAQ4vvRrjp/DeitBDPkPl8IugUtCJ/BrtJ0xv7YrG3RFy5SGVhVDhvK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LRM2+FKIxkI8j3teLxy/n0vsVt/maYN1GI0cffKWCUQJuTBC
	0J4lojVbusBzbZkiTBsdN4VTIRNe6cNFs7P4c3ol3UIaXJC8BMZjygkiMUOhwCI=
X-Gm-Gg: ASbGnctkIXmoQChIFaX31PepjtiLvP+6wkuH9D4Ne3//xUoXJQUc1aNlneEvopgDYF8
	Kv5U7sD9cwigC8UL+K6SiASYLdXkisl2+DWw5FISigrtoAaFR3+jeViI5yuVgC59BY2XeXyw2eP
	KNbAdIJ5Edi5SvrrpArOPDo/04jAlSKAq69eUyTxp68DbMrg2552Wisvf2In12roJCvUso5URFq
	DvmmehMt3AZbzKn1I/zY2A42pWZsuVyfpKVshYeo1XHhTtickO1s6kIQjgS3nfGGZerSNFGJgLv
	LUtTLWp9mtu3YAub
X-Google-Smtp-Source: AGHT+IFmYBf6Lgem1LIc/g0v9i2I6fJ81QKT0JVmvMw49IDJlRz6FCpd2JjuQH7p2i3vtR8e8++dZw==
X-Received: by 2002:a05:6214:1d0b:b0:6d8:a486:e87c with SMTP id 6a1803df08f44-6d8e70d5e49mr188233176d6.4.1733753355181;
        Mon, 09 Dec 2024 06:09:15 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da695ca3sm49339036d6.32.2024.12.09.06.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:09:14 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6882c33acso272830485a.2;
        Mon, 09 Dec 2024 06:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9XqkDNMEJgCfajsMhk5PpHOZ4HGRMXiTLOUu4V6j39a12y2v3ISUC3oo67ySQ8SRriNdwbG0RDDAHguUg@vger.kernel.org, AJvYcCUPRk4KnqKl2mUHfU/pTOx87+lcqNyyilF8yDSLiYg6KIyOkpQKwIrJTc2t0jAZCgDcnGrl+XS3oKz6@vger.kernel.org, AJvYcCVPcgtn4FeduTNVMfVjHDIWL70A2E1H0vy8FKZFio9DLa1fUbDs0DIbM7jzhdOudcYcIodmG3KCjP7a@vger.kernel.org, AJvYcCW32Agq1UNv45icop672gD9gJchpoR4IAwyOFFPUmQr4etsmjv+2YhWeDxXL9R1MBsfBE9J5wdYA36zdg==@vger.kernel.org, AJvYcCWAezZx/W/+kIsIaBZdQ7uRl/qclD36CHYhjqInRBFC+Wskn7y1eMLc3CefepEwGa/llD/lf9lyDAva62A=@vger.kernel.org, AJvYcCX+B8+4WqAToKdk6bY3MWzAnhESynP/trlvNFyR8GxmRqtGnF73u5Zl2IoOlb3aYF+jF5RCKwCZ3VBUqvB2VaW2tq0=@vger.kernel.org
X-Received: by 2002:a05:620a:2619:b0:7b6:d754:207f with SMTP id
 af79cd13be357-7b6d75422bbmr410771985a.50.1733753354661; Mon, 09 Dec 2024
 06:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-19-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-19-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 15:09:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhWJfuMFoXdbubg3MuJXsFPAoEMCifLOiP-wJanmg1kQ@mail.gmail.com>
Message-ID: <CAMuHMdWhWJfuMFoXdbubg3MuJXsFPAoEMCifLOiP-wJanmg1kQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/25] ASoC: renesas: rz-ssi: Issue software reset in
 hw_params API
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The code initially issued software reset on SNDRV_PCM_TRIGGER_START
> action only before starting the first stream. This can be easily moved to
> hw_params() as the action is similar to setting the clocks. Moreover,
> according to the hardware manual (Table 35.7 Bits Initialized by Software
> Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on th=
e
> clock dividers bits. Due to this issue the software reset in hw_params()
> before configuring the clock dividers. This also simplifies the code in
> trigger API.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, str=
uct rz_ssi_stream *strm)
>         return 0;
>  }
>
> +static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
> +{
> +       u32 tmp;
> +
> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, SSIFCR_SSIRST);

Nit: no need to clear SSIFCR_SSIRST first:

    rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);

cfr. what the original code did below.

> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> +       return readl_poll_timeout_atomic(ssi->base + SSIFCR, tmp, !(tmp &=
 SSIFCR_SSIRST), 1, 5);
> +}
> +
>  static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *st=
rm)
>  {
>         strm->running =3D 0;
> @@ -782,14 +791,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
>
>         switch (cmd) {
>         case SNDRV_PCM_TRIGGER_START:
> -               /* Soft Reset */
> -               if (!rz_ssi_is_stream_running(&ssi->playback) &&
> -                   !rz_ssi_is_stream_running(&ssi->capture)) {
> -                       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRS=
T);
> -                       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, =
0);
> -                       udelay(5);
> -               }
> -
>                 rz_ssi_stream_init(strm, substream);
>
>                 if (ssi->dma_rt) {

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

