Return-Path: <linux-gpio+bounces-13679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7D9E9919
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D442281BFA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067A1B4255;
	Mon,  9 Dec 2024 14:36:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553751B4230;
	Mon,  9 Dec 2024 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733755004; cv=none; b=PoFzwBEvZtmJoM2jy2EqGtIlAX0u7tFzjLucpBUuLsGJvUBjcRkIHXiTVgWciKfpafXX3SmXFR0ejHSw7urA0cKlsN6sxgf/Pl9lU97BnaV7E4y1Ij1Py0QJEaftdRNwwNh8hn2Czlb+DUwGTpfsUvgw34D3WKYr9lAJHayy59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733755004; c=relaxed/simple;
	bh=Nd3H8p6H+rsIOUfjuB+bee+f98nbsvyxdUK30ssb0N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4gPLlgCAg6FNSDO3DNraJVHVkH3xaRbn5MBp1tIy9TqAvdiSvcgmFGvVf6pzDeIkIoLwMLdahVnqbxRnUleFuWSL0n6ocludL5nr+dyIISn4NYVVkno2W8OqjAlJagAVGForTjrXbLVwczSBD4kFd8khQSpxjNt8gzZffSGOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4676859b911so5649021cf.2;
        Mon, 09 Dec 2024 06:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754998; x=1734359798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cu7yqJcTi11GhnQJf4QGWZ6ZChKi43wkfq11i2dHuM=;
        b=tBswoW4KKnJRBVHyebStc06u0pQncXF+RxPvdth8BO2/+wTijJn8nOaiv7tMrPY51T
         tTWeFYwd2fHkeCqa4L1/ZKR2gKZY8CCievc0yrmyxWynT/5d8ph+jS81KUCnN0hmOk1L
         Xig1wT81m2OfrZ8D7kUpuVAaXW9EtiyCbFepE14sf8h5inJ+8gaNAmH4wI+WUrf6IsTc
         t9QQuDRIHnkO76dBR7dGm2HMpk/ySpLU1ze5U1157fEFW7rRbtSlJaMr6NT138X9lMLv
         //HE9uZz6Z7dNVCxx8UT+X6CT1p2PPJg5sxpe3DgluuRNQhLXBBaL0l3IwBn7B6x/mzh
         LAOw==
X-Forwarded-Encrypted: i=1; AJvYcCU+nmCb2wqpC3+nj9yW4H9fc5NIlBJ8UZ/LTcFSQkJJT97akh5uG4aCBtFpAhhZRZ2LjOQ4iu5yOR2q9xXc@vger.kernel.org, AJvYcCUNm90QY7qPKOYUgVml8NwyqFSvetuN4MGmWevDtq/64Rr40vHYWmoY6HVLc+EY9MBJraG+xQ1aDNqd6g==@vger.kernel.org, AJvYcCVcc8uTnpNQxVjB/983TXNEH6Sb6a/eTjFFuFQTU0sAR2QWpIJ8m5vRRAKreOpMvP8Uk/SLSp5Qo0euvyw=@vger.kernel.org, AJvYcCWHmJwywr1QUWMXPkj2M31+7hwzwhRwWblt9bf4mmN5/EPhFiuuTLn2PjI4TiIGLZYxAbnHNnuBib9N@vger.kernel.org, AJvYcCWs7Rylg2qXJsghB0HzJ+OGMG6cQbIIv0ZjimcEdHWMpNWumhVPHPhLDdbTRgcXTGP+NAVNzfYlaJlraZ0uPf1CXAw=@vger.kernel.org, AJvYcCX/4/CXGXMfrtqS/ooNkeDdQKtBXxIOV+ckhpRiKWtMv8750pP48AQRvvf2MyQndTbdG2hK0bgUe3Qu@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKqbbkI7VuzUD7AyFK18oFMV97J0NFgQzTFSgQUxxMcut/sOF
	/iTR6AgtZZlnjkCK8e7BJPDzMtMErWd8jYMnsB1UaqZeGrOfR/WRQX0MweeOAR4=
X-Gm-Gg: ASbGncsvC29LuHHnx0D9mBaFI+gNDx/2aooT3jcYXMui9V22TyYYsD96tKZGxCM5wa4
	Hem70m6S0gdreDOe7J9/HQUKHomDwZ6RtG84siZGwfhQmMnvJDjQDYq1n0THDW/wxgfr7QRUihw
	3CWElilPmu0DAZu1CbJNFwHnBwTaiYJpB0Bha+LS22wIzllqKED0hqZZ7ohDfide/o/7NKbrP8/
	az/++PjHPQs63npJxwdLC6tKAG9Bg61/4ODhijp+uRTIVZjNRrKCnW84rM2zyoEUR9Jm7eg3+IX
	4iKv9sO2gaGx7rgN
X-Google-Smtp-Source: AGHT+IH0/ZnsmiUgr0hIwRMBYH0jxsVpdyVZKKGlnX0pnS/xTeatm+CszvDLZG2fn2Qj8iiAd3CeAQ==
X-Received: by 2002:ac8:5f87:0:b0:466:ac8d:7341 with SMTP id d75a77b69052e-46734f70394mr188339731cf.35.1733754997806;
        Mon, 09 Dec 2024 06:36:37 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46764d04355sm11682981cf.54.2024.12.09.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:36:36 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b15d7b7a32so290501485a.1;
        Mon, 09 Dec 2024 06:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGryO4Lrb+2kY5StLpLZwz4rtUS46xRWUWhV/NzluFQ1/owBjIDLyMgZlz1O8O9nmH6ZnJg1Usu+sB@vger.kernel.org, AJvYcCVW00rYqNZSi8hc+0InQhXjRqv6TZyDhO+LErlIHbQHZcN46VDs9FbGTlyYvwWXFDK6HQDvVr81hIQ8EDg=@vger.kernel.org, AJvYcCVcISAhRiA+c8sHhyiylvoPS3+QjGNILpFpKtyKFcWhOyCUUA0nNVRDzZqiuIeff9nzqPxJqkJD2sMtCA==@vger.kernel.org, AJvYcCWK4Pt8fnitP1Er1r97p8RPe1Rq7A5bqOxbmRg076zYr4fS5th1QksB80+97w3bFbx4lm+gs92q+6QW@vger.kernel.org, AJvYcCWx3bJPULlAOa2VwPAJSkOskad8NCC+uIjfDeDdmroIwItsFnaw83+TXDmFDynTFaUNZ+K/IncbWR+YfStya/pqBd0=@vger.kernel.org, AJvYcCXMocXL9RoWrCKh53fOzXl9jrF5sIOj3+sRoKeXOdYTabMolavCqcqhC8TdXAshRZzCJUgJjGJpB6VuwbPI@vger.kernel.org
X-Received: by 2002:a05:620a:1a87:b0:7b6:66d0:5abf with SMTP id
 af79cd13be357-7b6bcbb328emr1528679585a.59.1733754996319; Mon, 09 Dec 2024
 06:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-21-claudiu.beznea.uj@bp.renesas.com> <CAMuHMdW_2hMfT3tGNEANyWkUqVW3wAEsSttyqfR=L4mn9VxStA@mail.gmail.com>
In-Reply-To: <CAMuHMdW_2hMfT3tGNEANyWkUqVW3wAEsSttyqfR=L4mn9VxStA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 15:36:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa-CJ1T40B+Dg=p44gHWhGB3tyiGW7F-Ygi7B0SJ2ePQ@mail.gmail.com>
Message-ID: <CAMuHMdVa-CJ1T40B+Dg=p44gHWhGB3tyiGW7F-Ygi7B0SJ2ePQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/25] ASoC: dt-bindings: renesas,rz-ssi: Document the
 Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 3:24=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev=
> wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
> > one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
> > it.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > @@ -19,6 +19,7 @@ properties:
> >            - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
> >            - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
> >            - renesas,r9a07g054-ssi  # RZ/V2L
> > +          - renesas,r9a08g045-ssi  # RZ/G3S
> >        - const: renesas,rz-ssi
>
> This part is fine.
>
> The section about the dmas properties also needs an update, as the
> documented MID/RID values do not apply to RZ/G3S.  I recommend just
> dropping the list of values.  People should look them up in the
> hardware documentation.

Actually the whole dma description can be dropped, as its format
is duplicated from, and dictated by .../dma/renesas,rz-dmac.yaml.

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

