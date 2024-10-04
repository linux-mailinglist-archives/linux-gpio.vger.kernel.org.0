Return-Path: <linux-gpio+bounces-10845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEEB990375
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 15:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7294D1C2085F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5947920FAA8;
	Fri,  4 Oct 2024 13:05:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA779F3;
	Fri,  4 Oct 2024 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728047147; cv=none; b=V54FyoKHP3yfeHlZL5ofGz/ymS7WTVn7qrKA6I2/VHQHg/jBN7gqVOFaqtDqbZAdhyltfopc5gVXkyETvSV7S/iGECEek3wS/mkgfVZBvN5d2H3VdQuIWx2P85+BhuT6uTNZAxixedZO95UeW27PwoHYcZNNILX5LMsixlD9ytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728047147; c=relaxed/simple;
	bh=DtJD5sYpoPkvVKJdz4GaBHd6TXfvUeXFUHD/vxKzpfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPLlDHKSlDpbxXboSVh6ni9LrKaSYsptgQRsNWB2ukktmWbhkiJLU2Y3H2xQbOQGn0PasAFx9VM7A46R3jky5W2OSleIx2hXmCv7nkg5+MbOejzD1JY9/VCzslHcfUWgNhhfI0AezShIRZYXEAKUnBqDNVtCaPZJ6HvZ69PiLbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1727289276.1;
        Fri, 04 Oct 2024 06:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047143; x=1728651943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJHq5PUb1sPl1d+7FMbsRfhkofsTSryyoA//q7mzXKw=;
        b=UtxTrLZzpHMqG+gvW2uy3wTuuUBM4NLgGdUGbKhcpLabfeGLEj7O1sNp/t6vh8ej1t
         u92oVi+wdqz+uL+f9k69DEsW6Z2r+tMh3CnXiYQygGmnYpHSLnt29wC2MkYHMGLXIUPw
         yhSC7AFb+hSe2UD6tOubFQCxlIBt0jNiG2g47/rAoBhA/EuKRInoLn0uaWk7NNRhFbcJ
         3O30zobqj7DLJ+JRZLDllIwgn1nKuu9sSuZgfm8fYIWgxVcGCP81TykuofRvjxGlQQfk
         f6HMOzCK9DBJFjn2rQTozxMSWxqDK8Qg7KL6EjVr09smYOSHsfRidUX939NLF7d7Elz7
         s5bg==
X-Forwarded-Encrypted: i=1; AJvYcCV++7hWt25hfnygvB4WrDYGGVCcgwGqMHUVBOzuKuDBhO9sKlnb58bfYU1Savex37oGNKnBgleKekIw@vger.kernel.org, AJvYcCWXufdbB8QpVdVZu49yc5eMBnwKcxf6Lkpe4plTWMHcLTxEljVQqnvOZH/dnBvvyILuQjBgCqQRZSu44g==@vger.kernel.org, AJvYcCWvOkT/6JxHPXrkxgSsXSQqykZEZKuIuVixvS8ZmKMAqdDFuDe7SHVFAI8VPX9box6fdqVt7KSGfPeHgIz6@vger.kernel.org, AJvYcCX9LjWbwbp2HluySg4R50opbYRjS2Wd/tOAaP0vE3VLG4PUKhOYa7uGAivdYbXx9iLqyS//lhCEGZK1penPwI+7VF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwuJLHiA2nIl3Fpij6E3b2FYMc0XVY91Cy7F1IXcyN0fCa2QD
	bcTP8F7kRkXaLCy3/fXxpyxR+/08sppKTKKdOC7a5lsNNN5TpQlruI5g+Bnr
X-Google-Smtp-Source: AGHT+IG7t42MLy4BlbKsw1lsdbx2iLwHjyZYrd1UQ/x6J4xZtgz+7qsD34rVHm6Zv37Il+hnE9ERsg==
X-Received: by 2002:a05:6902:2002:b0:e25:cfe3:9b50 with SMTP id 3f1490d57ef6-e2893939e11mr1633549276.37.1728047142734;
        Fri, 04 Oct 2024 06:05:42 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d2baa6sm547890276.18.2024.10.04.06.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:05:41 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e25d57072dcso1913126276.0;
        Fri, 04 Oct 2024 06:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURzFXIeESvGHbLxGiFK0rBEMPaFvGZq5jOrEH7Ck7mv5xXBIby01eDemFQCGFZRoNAxSO+35j7dUnwmg6m@vger.kernel.org, AJvYcCV55zYRgq2sALftgRZSdgkL5S00H8A4st4w1l0QpJ9p9SYJ+yNFhza3aSvdyjtwNtG/EYoDpJGuBioF@vger.kernel.org, AJvYcCWEfVHx+iGVTQdz+wTE+a61OxMVzAwmSWWIQ6xU0SKRbgQ5txBfjuEVLI1sQUnotAfvEdehIkw8rljD6yztc3ZJT3o=@vger.kernel.org, AJvYcCXTtgc8nia9D8JCOQp4BTz13PcrkQVB7sqQ+TtNs33xzu4jKIO1fMXkUmjiS4OmIyMhHthaeqEl972lnA==@vger.kernel.org
X-Received: by 2002:a05:690c:6e02:b0:6b1:8834:1588 with SMTP id
 00721157ae682-6e2c72967acmr25860097b3.35.1728047141422; Fri, 04 Oct 2024
 06:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241004123658.764557-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241004123658.764557-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:05:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBO12nqtRfaYUfFB0xxpebQy6BmPAeEzDWgyJVZBuCag@mail.gmail.com>
Message-ID: <CAMuHMdXBO12nqtRfaYUfFB0xxpebQy6BmPAeEzDWgyJVZBuCag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Add support for
 enabling/disabling open-drain outputs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for enabling and disabling open-drain outputs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Implemented PIN_CONFIG_DRIVE_OPEN_DRAIN to disable open drain

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.13.

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

