Return-Path: <linux-gpio+bounces-7171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CB8FCE7F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34F691F294CD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956B1BE24B;
	Wed,  5 Jun 2024 12:24:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E119ADA1;
	Wed,  5 Jun 2024 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590290; cv=none; b=LgBY3L4xkkHXHXGDvZjkWdTP9IiRoBrJ1jq89wXPIyP6WwxglwBsJGI9MqgPICE2d5kz5HRh6ZPte6A+d/snSCZ+0Af89YHKIZYOcblF4a7Rp/jkEarqRnViki6P6KpgxTC9OTLXChmiWraxz02QqDW/Lb9KWNMV8g2nD0FLDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590290; c=relaxed/simple;
	bh=ZUBf0Qso++Uml2eEZlT+D+ZtGtQbCL6+ru7MeKUTeog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaExCOlKq7tMP+jTdHBAoTY61N/JLwdEfbadJP0ak0L57QcjfOiiZLWz03I0b2i5mb+LSb3JHpThuQ161664OZpbXRhbwpV5m/GnrumftgKNdVAd+JmM1jIownrjDCWRlPI5kYlNFaK9PZmjjy+l3kRGd5p+CnRRog2kw5eqg3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627ebbefd85so72875977b3.3;
        Wed, 05 Jun 2024 05:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590287; x=1718195087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTblLgC54KX1wQAlWGzOf+gGcZX6SGgOiFwTbhFSnj8=;
        b=X5VHONC1EONvIHKcWhto5bEECdVkZsXRH80teH+9I9kwD+4V/cAS1xJKh6K4AeND8u
         +09HvSj18GKKhavnU8MX2oAm1B6jk/hRliFRAyp1l6AvGck9FzDYf+Iyw9tvATSJyrlS
         RuhVBaIn6dbMqO1UCLcSRu8PHRgIhkzliFEYZ9h8gGvIz40y7V/un4gKiLORislygXw/
         M/C+z83GhYanCPJdP/KK6mDt5ldtgQfwN4mGcoTZBnNxu9T6dEMIOvKsY9yitr62erv+
         t0S6bHECIrBc/7oAN7ipYs7Llzbv7wNESYjSRROplAa78T41UFTY4zOqOaZZVMadHU+C
         ccQA==
X-Forwarded-Encrypted: i=1; AJvYcCUPNRU4R4XLR8dfLf1tniWDhgbw1O6ywYfrk/gItlRxIWEvMy4Wt9+0f3R2pZRlMU2dlz/aBg0xlVhldUw+oeD2ftIpUdJpFhdlM6gwwQS2m96dmM9o0LBeAZSacXZtpqxCxeK59ye2xPJhgXtz5WTiPM18d0C+/2FhICb//HNV3fkp8rbDtRZ8mFNkmpssCezFQFqtBaqBtuq1U+8rR1EFx4GGDNKw3Q==
X-Gm-Message-State: AOJu0YyWZNXsZiPiLEsuRLQdeH8n+4TS4ZMXl2TzIYERQQoeSQK4rO8H
	aem4prSmZXUfczEbIgsfn21vwF/0tTFfGUlIo+ArQjk/UalSJqruitmRWnQF
X-Google-Smtp-Source: AGHT+IHAV8MUdCA1ftWZNgpIenV8v4ZQPVQmg50cockJSx7Jz3FjawLcz5yKUBLxdCV93bPACzb2FA==
X-Received: by 2002:a81:ad5f:0:b0:61b:349c:811 with SMTP id 00721157ae682-62cbb4b1e64mr22294767b3.10.1717590286850;
        Wed, 05 Jun 2024 05:24:46 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765e6405sm22019167b3.44.2024.06.05.05.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:24:46 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso7331745276.2;
        Wed, 05 Jun 2024 05:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOqeB9TO6rY1K2/Im48nrTIglBiOEC/vdvO7RS46tTGUtiS92ELVb5cwjRLXjhCSghOj+dAsbqKxP16fj3i5a80hWdSmiGVyjHC/5kfuaKl9murelbKaSFldQYOxVw140MCPe+NSp+O5OaacDVzreNS8BMmEH3UsCCL2EqktwX+hE8G5H0a8c7M01vB2xA2PSm66YXbSQjhq7jGota1hEqKd6bClU+OA==
X-Received: by 2002:a25:dfc5:0:b0:dfa:c607:1b6a with SMTP id
 3f1490d57ef6-dfacac75c1amr2175013276.31.1717590286071; Wed, 05 Jun 2024
 05:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:24:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrD63j_6Wig+jUM3rxJNrxicWWKWvnyYQXQ-5QZCXCUg@mail.gmail.com>
Message-ID: <CAMuHMdWrD63j_6Wig+jUM3rxJNrxicWWKWvnyYQXQ-5QZCXCUg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] pinctrl: renesas: pinctrl-rzg2l: Add support for
 custom parameters
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In preparation for passing custom params for RZ/V2H(P) SoC assign the
> custom params that is being passed via struct rzg2l_pinctrl_data.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Added gaurd for custom_conf_items in struct rzg2l_pinctrl_data

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

