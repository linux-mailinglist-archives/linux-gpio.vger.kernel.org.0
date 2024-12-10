Return-Path: <linux-gpio+bounces-13691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5369EAD70
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61F942871FF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAA678F47;
	Tue, 10 Dec 2024 10:02:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3D23DEA8;
	Tue, 10 Dec 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824920; cv=none; b=mZed0Tfi//vJQMWbvIN1EaMa3EBVAibmusifrSTbyiCLv2rWoux0akpHYmnm5wv0ZU+0x8b5B6XQs0X0Jq6AXf9zcg2mKzPRVrc7IfaaC9neV5GyklYJsr71O+NW2ZXGLMR4SpjP5D3PPUZc6HG7wEJxUd/Hft3W6hncHOBOaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824920; c=relaxed/simple;
	bh=MIvthA4Nl0uIya4VAI4zbquPEcUw0r+hPY8+Sk51arQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WccFUJrwFQyuCdYk89J7R71s9y9+cLt4qDbkRfyHK4U01kA85VnayIk53NUH7cf0DbcP8PFc9FiHrn3LfyPCl8kPYheAN1HkqpeoiM6pv1Hy/jVjRuLrfaaamrh7GjSf9eJ1juhLRyiNQ4N89DS7F+ugWJefgPEA8JlFDA33ZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso699238241.1;
        Tue, 10 Dec 2024 02:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824913; x=1734429713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU21a0wFb5B0tExmN7JfphqZemuXjOPWEnAeMmariLg=;
        b=wFPIMgITgcRb5gzRmyaLljITo9sWyBzcuIT9SsDDY5nuYu4/Xm6KtGKMP4JLEjSELO
         LlpNZpG+d/IfWM6TxFQHw3JRFGttErbWVXaUHBKjC4phWXTmSnhY2bMSx7jayVtQeMyB
         ivRYIdZhsrJbbFyTING173fREpJy6pjcb6qSeoZeSsIBnNDNwHdEfP8/+ezMlw5lq17+
         mwvMC87NQM1QYLGZf+qEmfrn/SkqUIYBNdobZ30rCcV/1nPsnsParG6rZ7wAPZD8Q50i
         4D3FBBYBtqLFjzwebTO9CuDnXjXO9EJOh2LcKnA2WS7ndhIoph8m8bPxOOJAhFEakK/E
         5Fmw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Da3G7PUS2Dv/c3CJL2IRdyHZbY9zVfC4AQuwNm2LSY8pPhH0bEccrb2dTq6ohtAbuN7Htxvo5y5PhgWjtBREWYM=@vger.kernel.org, AJvYcCV6nRchI8llXITmFM0ljTxORpGbebGuxsosWyvBe8Uj/BzvqL9/akAFkoE2ZflVTwYef2U8nxN5hqhj@vger.kernel.org, AJvYcCVH8EFS8f+n8yp7300J6kt9VpShioElidRiZcow4xOEPYmeAqYPzrLGokpOVx1MvlqSZ3DODQm/q1ejeA==@vger.kernel.org, AJvYcCVR4PoBYLTJZMd33LW9tCZg+zLxotMyolw0APTJezQPNhCWFERGYyWLBq2vnUieJThgMEtSfHP1S93f@vger.kernel.org, AJvYcCXABWJv2wwOWoWEIf5mcVx7ghZ8HYo5DQ2wo5is1XgSaHgPbjGcVjwT6Zf1Hs/azO8jelkAME6kw2kHLh4=@vger.kernel.org, AJvYcCXC1/cAIqFMQd18hlnWIYb8HB+Uszz2YYXocClK8Qn/JriEYAOyx+yJEKWAYklOwasRo+IW7REtu5FioNLp@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+0lCLKZY/DbRYeT9FJkTSZimqzB+kay3FTSSRPplOG2IjdAV
	i+TWw4oAlyCCtMpW6cEhj5b0UszYNoDJSz1YydyAZfIn7Vl+6hi3wLUrKL0Q
X-Gm-Gg: ASbGnctXvSMDRp7ZUBy4pALvSIez3kvMp2XY9WFTiF/W7UyKQYXj8aXACqXFTyGBzU6
	i64H9ppolW5fPbzA4/gXOvubFLJ00WBpatAQD5GQbM1fmbee5mqbz++Mbk3TJs1TYnGmwyK5kCN
	W6ynkMeFtPRD+aJH0pbeF2c66S3Kl9oxwG/MXGNEA8EskaJ+ZoKV9qRcPajbuxk7NjUGT/0jkX3
	/YSrI9ELr2W/dCvqRK/F5da9K4t6VnztJeA7OuvUMdBdZ4VMHgH3tRlswMm42zf+9niGaABCPow
	14jZk/le6TGmCLiY
X-Google-Smtp-Source: AGHT+IE2glzDbFQ8/qA586D6GHtukx1rNvayEpcjtXdeyGqmrc8YCt3NYo6N4RmpUILzbkpad1Uckw==
X-Received: by 2002:a05:6122:a04:b0:517:167a:5cc6 with SMTP id 71dfb90a1353d-517167a7947mr6532784e0c.6.1733824913077;
        Tue, 10 Dec 2024 02:01:53 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51886b8c3dasm175951e0c.30.2024.12.10.02.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 02:01:51 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afdd15db60so971174137.1;
        Tue, 10 Dec 2024 02:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIG9w9g45XGa068q/dp9pxwsteGkeZ2exItFUpf5CglM3ShM5r2kCTad9ZJ+Ttp9b8hNl80SS6uy1Odwu3@vger.kernel.org, AJvYcCV+2R42JPFPY+Dehwjze5xEyYM4qNb5TA8EzMHHkYx4crWn7UYyE+Wi1on8AI2y+xj+gvLG52AUbHqxKCX1uwG8JFA=@vger.kernel.org, AJvYcCWP6k7ChKg7gsGcefJuG/yBn9xa+0dzexZAH4Mg1xVDLx8gkvejv+4SbApkLICw3Hkb8k0LxG0dwR6u@vger.kernel.org, AJvYcCWSj3CRb7IDn/AByrb+4e5L7SRfxVmoqkRqHKZKGmI8gz8vh8Nw00JdkRcjvmiGrHM/XtbT7ibBSOIf@vger.kernel.org, AJvYcCWiQT8FkXpNUuJY3J4sQdtXI17FjEOVeCkc9bRibNxsRzOBJJHi0A9vv+ao8il1/N/cuuiC2n5PetQxHw==@vger.kernel.org, AJvYcCXOxsheMAYI7/tl3zyhD+yP3p8eSk/sgQG2FMUE3d/8zvNYVBC5eXYo8xsL3Y3Ici5uLlhOQou1f8FQZIA=@vger.kernel.org
X-Received: by 2002:a05:6102:3583:b0:4af:aaa4:dd9a with SMTP id
 ada2fe7eead31-4afcaa18834mr13656547137.10.1733824911603; Tue, 10 Dec 2024
 02:01:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-15-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com> <ed0f6c49-8e39-4cc6-ba93-35a9372bb532@tuxon.dev>
In-Reply-To: <ed0f6c49-8e39-4cc6-ba93-35a9372bb532@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 11:01:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgakz=bBrqaUgniLJdOMULBG++zcOJ=U-fizToVv5b6w@mail.gmail.com>
Message-ID: <CAMuHMdXgakz=bBrqaUgniLJdOMULBG++zcOJ=U-fizToVv5b6w@mail.gmail.com>
Subject: Re: [PATCH v3 14/25] ASoC: renesas: rz-ssi: Use goto label names that
 specify their actions
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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

Hi Claudiu,

On Tue, Dec 10, 2024 at 10:56=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 09.12.2024 15:51, Geert Uytterhoeven wrote:
> > Inside this block there are several return statements.
> > As we know DMA is not available when we get here, these do not
> > need to call rz_ssi_release_dma_channels() hence do not use
> > "goto err_release_dma_chs".
> > However, this may be missed when making future changes.
> > So perhaps it may be prudent to make this safer, by moving this inside
> > the failure branch of the rz_ssi_dma_request() check above?
>
> I agree! As this series is already big enough I would prefer to handle it
> after it is integrated. Keeping it like this doesn't impact the RZ/G3S su=
pport.
>
> Are you OK with this approach?

Fine for me!

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

