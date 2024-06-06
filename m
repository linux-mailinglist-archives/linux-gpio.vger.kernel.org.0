Return-Path: <linux-gpio+bounces-7218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84F8FDF5A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 09:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 260F2B21C00
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 07:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0784713AD30;
	Thu,  6 Jun 2024 07:13:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9723EA72;
	Thu,  6 Jun 2024 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658027; cv=none; b=h9jjLWy9Sw54RZIphM2cPVv7+UXPDanxDuCoEl/Kz/hWnRumOJUa7PKg/VfiuvouifH2DwGH8eMD1Na1qeXyrYyTQwjNOMQzCPFYLPu7ZHAc4Qi6jfzhBvOS2eqyEpuc5vBh8O4ku0isu+92zATDDaw166XZqYt5zIDWTU6VN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658027; c=relaxed/simple;
	bh=zeU6ieindwFhx65owVU/4wu96d3miDMyrhgkBCEZg4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jin2gCa5gOQwMfByJ3/qaNCqJncB46Uibmnmb93Vsu0vKGJ+SPH7qOolMKRwwCH/pQcM9Vuc7pJ44SJUzTM8VOFfQVjYnDYO51IoM70CTm0MaR1uhmIjBeTuS3+L35seqpA2xjldqa7D3NFgXS5FVTSmG7JExQ7CLOmWMkSUFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a2424ec39so6499717b3.1;
        Thu, 06 Jun 2024 00:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658024; x=1718262824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC3aEUF0r/ho1aec7nweuE1jEwUeFO57mmlxnzfx9fs=;
        b=KQaxhf+wMHKnniTFwRX78b4iEgi+2oG+0YLtYYfeaDomOPVjHssBHyZWHkUBQhTV4a
         4/mJ37mniQSM5cqKhsSfW7rGjb/wMrH4eIBo4ur6fZSZW03Ve5jol6YVhC1lAMUjjFOS
         dcSh9BsTEps/8mlVznyIVAx+eiJOBUfhpjagA1K5paQHH20Gs+iLONFvdX8iskoB2ihU
         4F2OIl3k3S37bf9JrIV4b5stf7I0ZeAdZ5o7zAdoTVnOcmLjFDgv8YxYw9WGiFRWnX2m
         oh2ViR1BxcmAJ2wcTNuU86oDJTnWocamOofDlz8cWhyD74nFdXDjsgYzVPLxsJUoUNHG
         GPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0zl8Scdr+zFywUyDwvbGmmlfneF19W46kjufrShr/7yCxlSWHrfq6psoeffz8NmYUAqDEaw0AnT+Tlg3I7FbPlVDzsSvRIAN2iWK9QHerEOdQyPfhmdgPW1pgRNc7bARGhYhu/cpJJRqL3kycyN3pqN1Pn5VlUJ40c4Q4JsOwQesuASljOAF0NqVCkcULHdTYz0Y6vK3aST7xBzxUP6Srug2xtTsFwg==
X-Gm-Message-State: AOJu0Yxn97PJCOjZbUgGGzQhjYqijQdieF2S8yj8Dk5TpVBbqETZ/MNK
	rDjBmMiZ1Thn7Z+06kX5HB0eU/0po2IjNOzl6D6eR/M9dFoIURe6dFUAz1jQ
X-Google-Smtp-Source: AGHT+IGQjIITTAj0p/Vqy5EC4/7eZIl0JsD8xjUbEHKOw6AERoQj1Z4Xli5GNWEVijyh/EjEqB1ILw==
X-Received: by 2002:a05:690c:242:b0:615:1e68:9080 with SMTP id 00721157ae682-62cbb5050efmr45900877b3.26.1717658023013;
        Thu, 06 Jun 2024 00:13:43 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccacaddd1sm1655807b3.11.2024.06.06.00.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 00:13:42 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa584ea2ffso594077276.1;
        Thu, 06 Jun 2024 00:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdNO7uwjuOxUpKq0bOGiLjpFQ0D2Gi6lUFQlEXVEIqpwVwEn7S4vP+wdWjnlhOU/M4jsGlzhH2F3h1JdjLl7KgcES2FKYckr4k+EnRwhG48Yb0UPLCOzMV7nuzqfoTB7Lu63nqUVWJaG1MnfWgyd5daVNQP/+beZN476PGqmrsRpxcdFs1k1y3UtV+41a02gCCM+bGLwusPlR9F/8E9DHI6OBSUR77qw==
X-Received: by 2002:a25:c544:0:b0:df7:955f:9b99 with SMTP id
 3f1490d57ef6-dfacaced9aamr4723147276.47.1717658021842; Thu, 06 Jun 2024
 00:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240604153612.GA839371-robh@kernel.org> <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jun 2024 09:13:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com>
Message-ID: <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Jun 5, 2024 at 11:39=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> OK, I will fix the above and send a v6 series.

Please don't drag it out that long ;-)
As the rest of the series looks fine, a v4 should be sufficient.
Actually a v4 of just the first patch would be fine for me, too.

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

