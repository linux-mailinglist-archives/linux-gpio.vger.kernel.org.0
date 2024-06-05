Return-Path: <linux-gpio+bounces-7164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3358FCAD2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B621C231CC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07C914D447;
	Wed,  5 Jun 2024 11:46:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72927459;
	Wed,  5 Jun 2024 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587983; cv=none; b=lozTq28MRfdBc6QtneKRG4EBYEFEPMplESBA+NzxIEeiy2XpS1FuulwydgMpHvDKGgvrUHYSe67sgXI96X/j39cw5qGh0NTX1PHJHI6R3+7P08hV5mUbFepA9gZthIQOMXRQL1CeUVLwJjuhFB4P3D0CrHc/tFB0rQouemCzybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587983; c=relaxed/simple;
	bh=rqLg5RaiRQRriS7RlpwWSoVkaauxWorsHwTN7/EzTko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGXR4LszbOe2JT26SJMhcSrOpPLioWk1Ly5BTQaWJaj5Tc9MVQ8Yomt7kFfjwo9Uqp9Zw8NFw95EnfoIZubHIwC0qb6oyGeFeK1FS0A02NdgAWUFGphjO5B/lZDs3Fd+iAMSZOOth63vb2ZwhebBD7KrVd4/L/hM0Lh660pJqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a2424ed01so68143207b3.1;
        Wed, 05 Jun 2024 04:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587980; x=1718192780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwecOu9vtXqV2gh+Y1pKrMBUvS5GfA9ZcPMnO18xSuo=;
        b=wLwlkdbTLxlp95Vk4lsCP5FUGShUVoEqTe9Qw04mLc4xj3vhgWiyCkPDZOEf3MsTfM
         9/rlhTBwWrbc2OH6KRKpsxm2xgpMkSYWo0gPkh7HBkguy4cEaIAKvCzJ+N3YOIXvFpFk
         5GdAjxE6wycW88oZBegyaD+o/NPxfW3uVM5I58WnGygI3SqE+IUtVYo+1o3wTkykl6O4
         41qOyLFW7knkV9EULeblBsL7q/HbqU42rQ6Kujph+nYvEZrD2VYDSpQ5WxtHiyQ/nmfi
         j2e3Tm1L9Q8CtdzB4Sxgs9zGgJ8ajBf5VcqOhY7tS0FBvZEICbY1QaGaN7Cg771EWm2E
         PDyw==
X-Forwarded-Encrypted: i=1; AJvYcCUwkK0OVnlxGllKnNTJfvnvYBfp48lA5JCSlBaIE43e7G5D/kiXTy+QQmU5GboOdOBX3KDQHSFCnqpeRzSctBPNJB5KcEg2Ic/vplx8ckKxzjw+0eOArFnyd6W+kAUollQLYKfOHjq7S6idqdB69xDYj78Krmjp+MBJGNWT/iXY780vVjN5Kd/vDUxrHrmuxXQNtJj+wdOc2Eu/H7wXFaFi7QtbOcso0A==
X-Gm-Message-State: AOJu0Yy07peoFrujzbP2f04FH5F5Ae27lgSUNXaglevIeHMn4X594xbi
	HHRhJZ0Zw5SNYY2i3bZe0SQQAUNTfgPLqpunz5PAVo6QT8LP7GWqOcp8EAXJ
X-Google-Smtp-Source: AGHT+IGDWzmNe1dlsAFOY/D96kHIVkluky9u9NWH+E/thr39DbXbh5LmMmoJSZIIwoHRaWtyELACRw==
X-Received: by 2002:a81:4c49:0:b0:617:cbc7:26fe with SMTP id 00721157ae682-62cbb4c3c1fmr22784867b3.16.1717587980084;
        Wed, 05 Jun 2024 04:46:20 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766af160sm21713547b3.121.2024.06.05.04.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:46:19 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so6084527276.2;
        Wed, 05 Jun 2024 04:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZu1QJ29fXJ54NnNVVu4WI7Uk70yzRSjy5qaJiYcO8ytb1R8cVkSgu19h94mRnLpveZrnIhTHLaM98bZsqiiAhz55ZLAGvmJE8KJy6cNE3HfKtUmORKIMsv88LNbFcdEp3vwDg80bt+0kmpyjNjnHGUC+fYmju59rDin21JHEheVOjvv10H5Kpv65LS1ewaInYAmOjPRFFSyMBKI+TJeMYpU8Oy+/ruA==
X-Received: by 2002:a25:26cb:0:b0:dfa:4680:21eb with SMTP id
 3f1490d57ef6-dfacacfea2emr2185646276.43.1717587979616; Wed, 05 Jun 2024
 04:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 13:46:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLPEBLWOKChkXVGovLsUZ1XkGs=RRVeNv9UBrAqfKAEg@mail.gmail.com>
Message-ID: <CAMuHMdVLPEBLWOKChkXVGovLsUZ1XkGs=RRVeNv9UBrAqfKAEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] pinctrl: renesas: pinctrl-rzg2l: Drop struct rzg2l_variable_pin_cfg
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
> Drop the rzg2l_variable_pin_cfg struct and instead use the
> RZG2L_VARIABLE_PIN_CFG_PACK() macro for the variable pin configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - New patch

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

