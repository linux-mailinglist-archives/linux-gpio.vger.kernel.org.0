Return-Path: <linux-gpio+bounces-13661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAC9E96A9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10D8188D7C5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CA3222D47;
	Mon,  9 Dec 2024 13:15:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E1E1B0404;
	Mon,  9 Dec 2024 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750145; cv=none; b=Ad+5Y9IhyVOqNi+Oz8tHR6UjubObZto7AWjCCfImbj2SPbQSGZ5apdHJr4qpDepaD05lImhGpS6/jUeXDpasaLt1gr9INOhfuvBUMlYkP+oEG3XwwQxqFlySkhyxfmz0HzevR6GmUmHNUqbiJ+gjh/O9rt1sky8AfRQEQRNCQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750145; c=relaxed/simple;
	bh=lh/Nf8r8mXVMnZOUdv/stO7zBDdteR2rS6iLVzqqYwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7GSyzrsVFduYyZqerklGNn9rhWORwjp5riQDsil7LTXJgvLOYUjf/NE5ZF4JU282RMSWcAMgbQRZqRwg3w97dniqHEpMoiB23qNoEO/MvFsZASu4HqGcbLxwRYkAURzWdK64u1nyRdELGmLu9JtElYURbQP4B6g2Y3N4rkQAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d900c27af7so16703446d6.2;
        Mon, 09 Dec 2024 05:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750140; x=1734354940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIGy8FeFMEG5S1lHlLlnwF/0gV8yzkzOW8jZGh+/bqk=;
        b=P7742JeJ3EuVKWoQ8OFs9G0XjW4JDEnURVT6fEkhweuoesi4GaotWN0eGfKI1Y84bU
         Dqm4fP/1ahLdH8uqhfP3J64WPnMq7C+VhC4Lgq7u//8i117nY6TpGCvbbkq0UeAEPEPs
         GiRjuS4+JAYpsAmn0Zxf15vQ3OV+cAX8LhszqoAhtZB++avQ4R+d2v2QcRji0ggx9AyP
         SDRLvk+YHLNk4GghKIihN9cbCsCpDthh4tkOpFCcFFCFKhz4ETrqqgoDrg0VHh+uNTFX
         A2M3dx8SgwXEsJbXLWn5VMNzyrmValLenX9VklzdIIXs8R8nIFu/D3VrbZaw13isfYle
         Y1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU3XbUz9oWh3EcGNmhpI6rz127fSQJo0YcyoR4/vfLEg+fG/ZajMqK9a7WYJqWdxYUDyVC+cXbSk8N+iJhrFX/1P1k=@vger.kernel.org, AJvYcCUR4P6Is6cV92a/hWq3tB1FhG+nqYxFAOkl5QjFg/Bw+Dial1O5h8M3s5dQ8R9Ha+oPDMB92rnE@vger.kernel.org, AJvYcCUqmLTnuE0dTHGBINKjAoyyZtNeFc6mBkUw/SGJt6R88JqPLfSvp0qFN8Hg+8m+XpweSvIFIHZ7tSHU+Tg=@vger.kernel.org, AJvYcCUsWjqtp9MLPPEU1zIQZsa1ly/kKt6HjodA/AbJ1TCG8G2zUS9PG12t7TLrlAnVvdQ8ojcbW+37DjuX@vger.kernel.org, AJvYcCV438ofmlFsDfXSdMAHCmb32mYtMqW7JUz9CQRqkscmdA7anEkCxT04zwnMDPpz4+0Ikm9pkUtbsR9wLbqj@vger.kernel.org, AJvYcCVe6C570aLWJwJQv2tjwXGea1OfMgTOEAXHMb+yGOt/8leQrQwnXq+nG/0KMkkrLFHudd2VwDzEeOVY@vger.kernel.org, AJvYcCVy4OD+li3CeYLsb/pn9kDcMlf6kVpnvnEzo3mejxvD2eBY9KwzBFUMmKSYOx7c4tXFnczWdgjLiXdfsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGX/Y9HDimJVpwshvMTm5giVy+17qjg1dBXJOJ5Ya4de60glg
	sFjJCCmMgSYr0HZ2UQ9Ax9MjL9W79gtrEdmfYc/gUl3VlYhpvN7zLjWoNXmaJfY=
X-Gm-Gg: ASbGnctl4j16MrhKux2IRmN9d35ovyPJZ8nTTQfzyVrOWA6DcRpqED0dUxIiMmk3trv
	6AfS4KO0D3n1efd6gd2QkYYzAql3y9AFjnPfSfXrg8ppWLKEJemMZzngHAhXW6ZGajF1Urusxsr
	wcVGdjCd2ADF8N03izWfe0QVFvBk3HwbOYfWUHUjMqKCRE3c6x+Xgi7ssriQdPbe00CwdWDiGig
	80A6bKVq8x6Av3jTWXIkZohY6eXuM9e+DozVWgqHyGjCjYB3PXHorc4s3jtpsx4OnHuVL230xQa
	qHM3maUYILFPv8c7
X-Google-Smtp-Source: AGHT+IHrqWZIuvIEmy43fVOVGVVSkwU8XBB5DoBQnnvQtgovpWb4fbtF1e8jZLXcDYXLGg2YT4k8vQ==
X-Received: by 2002:a05:6214:d88:b0:6d8:880b:665d with SMTP id 6a1803df08f44-6d8e73e8b96mr191295966d6.41.1733750140461;
        Mon, 09 Dec 2024 05:15:40 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f79157f6sm27242336d6.54.2024.12.09.05.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:15:39 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6cade6e1fso123588185a.2;
        Mon, 09 Dec 2024 05:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV89GsC/RqBPcYvZEKGXnzQWWaYE0e29YWk6MsHpyUAMtqEn2vKw//txHgiduJ+RKEzmMBOyTMYtSoj5w==@vger.kernel.org, AJvYcCVddHqW4hnsjGsHVekLUp4RxyD8xjH85snkyNgABVrQefF+Yv97RVANRFtOPW0Cqb5XAY4/K14h@vger.kernel.org, AJvYcCVg7vdjiGu39T5LQxNEdt4nrPBU6azZRBz4tBa74wB+h/iT+z3CZxDf5RUNhBR9I6T/oUDlORzbDe/7QJed@vger.kernel.org, AJvYcCWAYgxHvD6m3tQd4UB4jJUDKkeu3sxFsuFIbnrUYXVWewkvF6+J1XzdNWM5nX2MEGrIDqRdaK0HMtpRHFY=@vger.kernel.org, AJvYcCWC4xZWpq9oaLKEjHL4964U3hBnOaJJn6cb7HYPGWp0hewO5UglaRqaCErp3mzW4Lnleg9ul/MCX9F9@vger.kernel.org, AJvYcCWFleGVAFG9hZSPXS5GRjF/BBlXCRW4TtL5ooVEAjiFaimWmQzPvbC5g6BeBez4dW1NM8/GQhpEecEPCUHl29l+2Y8=@vger.kernel.org, AJvYcCWp2a6atfaLVfvbIPWTjF24Qe6OgSTJNf/dO+xoJLg5pU7m6XM7wrJI53PJX6NkIm/oKKTBVx3Rr03H@vger.kernel.org
X-Received: by 2002:a05:620a:2912:b0:7b6:d4df:28a7 with SMTP id
 af79cd13be357-7b6d4df2b49mr526820785a.38.1733750138520; Mon, 09 Dec 2024
 05:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:15:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUa9GnzOMOBhpQcX88Yy2qvgKmKMdeEwEVo-OXgr-3SMg@mail.gmail.com>
Message-ID: <CAMuHMdUa9GnzOMOBhpQcX88Yy2qvgKmKMdeEwEVo-OXgr-3SMg@mail.gmail.com>
Subject: Re: [PATCH v3 06/25] ASoC: renesas: rz-ssi: Terminate all the DMA transactions
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> In case of full duplex the 1st closed stream doesn't benefit from the
> dmaengine_terminate_async(). Call it after the companion stream is
> closed.
>
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> Changes in v3:
> - collected tags
> - use proper fixes commit SHA1 and description

I am not sure which one is the correct one: the above, or commit
26ac471c5354583c ("ASoC: sh: rz-ssi: Add SSI DMAC support")...

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, stru=
ct rz_ssi_stream *strm)
>         rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
>
>         /* Cancel all remaining DMA transactions */
> -       if (rz_ssi_is_dma_enabled(ssi))
> -               dmaengine_terminate_async(strm->dma_ch);
> +       if (rz_ssi_is_dma_enabled(ssi)) {
> +               if (ssi->playback.dma_ch)
> +                       dmaengine_terminate_async(ssi->playback.dma_ch);
> +               if (ssi->capture.dma_ch)
> +                       dmaengine_terminate_async(ssi->capture.dma_ch);
> +       }

rz_ssi_stop() is called twice: once for capture, and a second time for
playback. How come that doesn't stop both?
Perhaps the checks at the top of rz_ssi_stop() are not correct?
Disclaimer: I am no sound expert, so I may be missing something...

>
>         rz_ssi_set_idle(ssi);

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

