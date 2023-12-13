Return-Path: <linux-gpio+bounces-1369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3681142D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C36171C210C8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A872E656;
	Wed, 13 Dec 2023 14:06:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB4310C;
	Wed, 13 Dec 2023 06:06:51 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbcb4747d84so2105998276.2;
        Wed, 13 Dec 2023 06:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476410; x=1703081210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHtA4+5hw0ZCgkf626DbpUSnNmhCHpzTn/EppkNnPGk=;
        b=STodZEAY1ZRbWScTqLUVmPUu6JqByrHbYPfhiL2r5O6ywVTrNKlkkmA9dhpLSG6rxz
         sZlb/PBEH+OwAd9leAa4OUTmWQQ2W7ZcYEkJXGZgk/GRLjeR8pJm2LKjGORdIp9d4bOQ
         c2JgvFj/rZeAY5JbhUlPki6L+HryTsT677mLZVQm0IBmY1Jxeg7HKQAz1/5IOd+0NQdi
         xcJtQC3xZTnZxONx8WEXel5U4MfFUo+BElNYn8x49TyLlUh4bc7HiqIdfIV0ikZiKuGi
         6kVMAY5kaeO+nUWfenMFhCiWJUe1O0thSCjgnzTb/xI0WS+rp7G1RhdYRJsK3u4UZlp/
         YNxg==
X-Gm-Message-State: AOJu0Ywa4vCQqN+nYsGyGEKxhigLW607yx30ZTdToRsO2wGy853C11sl
	lxhearvoCfGPkP7c5ylxZE+bmAdbd7oEEg==
X-Google-Smtp-Source: AGHT+IE/kSD4AerLImjJX51M2asFtS1RA6vUj5HhlglpmC7xw/mk9qcxuBMk48TxRahJipNvY1aulg==
X-Received: by 2002:a25:424e:0:b0:dbc:d05a:18a9 with SMTP id p75-20020a25424e000000b00dbcd05a18a9mr563828yba.55.1702476410177;
        Wed, 13 Dec 2023 06:06:50 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id p135-20020a25d88d000000b00dbccd3a2d02sm581815ybg.55.2023.12.13.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 06:06:50 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5cbcfdeaff3so69862747b3.0;
        Wed, 13 Dec 2023 06:06:49 -0800 (PST)
X-Received: by 2002:a0d:d3c6:0:b0:5d7:1940:f3f1 with SMTP id
 v189-20020a0dd3c6000000b005d71940f3f1mr7064945ywd.89.1702476409703; Wed, 13
 Dec 2023 06:06:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 15:06:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXD4WO-LR02wOgd3SsQ8Rfb+SUErUTcO7wPhAdyb-NF_A@mail.gmail.com>
Message-ID: <CAMuHMdXD4WO-LR02wOgd3SsQ8Rfb+SUErUTcO7wPhAdyb-NF_A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] arm64: renesas: rzg3s-smarc-som: Use switches'
 names to select on-board functionalities
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The intention of the SW_SD0_DEV_SEL and SW_SD2_EN macros was to reflect t=
he
> state of SW_CONFIG individual switches available on the RZ/G3S Smarc Modu=
le
> and at the same time to have a descriptive name for the switch itself.
> Each individual switch is associated with a signal name, which might be
> active-low or not on the board. Using signal names instead of SW_CONFIG
> switch names may be confusing for a user who just playes with switches to
> select individual functionalities, but also for the advanced user that
> looks over schematics. To avoid even further confusions, use the switches=
'
> names here and instantitate them with an ON/OFF state. This should be
> simpler, even though the name of the switch is not that intuitive. The
> switch names documentation reflects the switch's purpose.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this patch is new and aims to replace patch "arm64: renesas: rzg3s-smar=
c-som:
>   Invert the logic of the SW_SD2_EN macro" from v1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

