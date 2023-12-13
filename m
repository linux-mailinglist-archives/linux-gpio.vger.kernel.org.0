Return-Path: <linux-gpio+bounces-1360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C28112F9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A5B71C20BAD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDF32D619;
	Wed, 13 Dec 2023 13:32:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC817107;
	Wed, 13 Dec 2023 05:31:57 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db538b07865so7148265276.2;
        Wed, 13 Dec 2023 05:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474316; x=1703079116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ByD+WhHBWOGKiqiMHh0fO3Oon6EHmqlUadQiQzx7t8=;
        b=KNjX9y7hM9XHp0ODBk7facblQo1ZXMIZ1MjvxE9g8UWTrk+LBjk7OFoXWrs3biuvRZ
         NeeT1+Ba5NkGpxhwmTlUzn9tiVS4hF0zc+zxsWC604/PrNcxaFMmuS9ymTms1RM9slbL
         CGw6vjT1FmTgzfYO+Mctys2WzUMIWkTJ4AqZ/bZjagRzTxqViCRmayopEA+Dxgz6/5Qv
         8OSzd+S6ALzcFqhOx+I62K8NyAjwIk3hS3VMb+Zp7wSADQDydKbkjNtX2lOeTkClBqwn
         H0m5BOANHux9o2kWHuomgpZxCTxAIRo6JpVRzbkjHkEifq8wAmTvplq4NRRJdsnYDePM
         1K0Q==
X-Gm-Message-State: AOJu0YxdEFK32NEc0+HLn8/0ApED/QlCQn9LfC6TbShXTv1bAHUhM73D
	P+E/yh5OpWv5aXqPhi7KhhsdG/Eb8Kkvmw==
X-Google-Smtp-Source: AGHT+IH5Wy8HCpG0Da2bbQB8VMzjHdvSLWPqfUL2GBw1r6l1/12fv9QkqbAt56i7cc313+R5GoVVbw==
X-Received: by 2002:a05:6902:150:b0:db7:dacf:ed8b with SMTP id p16-20020a056902015000b00db7dacfed8bmr5694588ybh.108.1702474316690;
        Wed, 13 Dec 2023 05:31:56 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id q3-20020a258203000000b00dbcd92f26d4sm174366ybk.20.2023.12.13.05.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:31:56 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbcd28d5004so516019276.1;
        Wed, 13 Dec 2023 05:31:56 -0800 (PST)
X-Received: by 2002:a25:bf85:0:b0:db7:dacf:ed6f with SMTP id
 l5-20020a25bf85000000b00db7dacfed6fmr4540307ybk.80.1702474315827; Wed, 13 Dec
 2023 05:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:31:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFsFbn94JdTFBaraUxLOQf5yJH0CUoJteOmYAb1WkCSA@mail.gmail.com>
Message-ID: <CAMuHMdVFsFbn94JdTFBaraUxLOQf5yJH0CUoJteOmYAb1WkCSA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] pinctrl: renesas: rzg2l: Move arg and index in
 the main function block
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
> Move arg and index in the main block of the function as they are used by
> more than one case block of switch-case (3 out of 4 for arg, 2 out of 4
> for index). In this way some lines of code are removed.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - adapted for index variable and updated patch title and description
>   accordingly

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.8.

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

