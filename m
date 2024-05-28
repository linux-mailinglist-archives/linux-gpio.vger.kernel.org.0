Return-Path: <linux-gpio+bounces-6769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB28D255B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 22:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9ED1F23CB7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 20:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C117178389;
	Tue, 28 May 2024 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1aPV9Tb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C410A3E;
	Tue, 28 May 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926552; cv=none; b=G0u9INm0zeH02keMqvICpUZVGOB2iNJ0XkPhXfoTT3S5MzM7cudwbVRSjl8X+j+hyq+ewHtmjKZMuCRte51U37onUbvej+MyfHMn+ICPHAFdYDBDPI+bPpDTLXKFoy4XxpIQHX2+7T84c1w4HiycNcTiurAKkGwlHRvfQxb0Kr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926552; c=relaxed/simple;
	bh=a49CoFAv6vzZffrr9Ef3MZaI4nWMYkH+YQbgTnjVORc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSQbB8uJWxTLy28pzwSkoI1vvwNb9GlUNNQpRUn8wi+A2t70Nzl+8PaUP5lekmWhTcJapZgf6VO0X4P/sEin/qZgjarZZMy341Sf4On/JeeLY+kI7WOr1vXHdbO760Q5PAvn9uVQjMh805QnHxhH4DPl5qNMggCMsPfHySLKj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1aPV9Tb; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4e160984c30so109486e0c.0;
        Tue, 28 May 2024 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716926549; x=1717531349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTx/ooqRdBunSGEYWchVYownJq/zl+8o/e9GCfSovAU=;
        b=Y1aPV9Tb5+TNTF+yuFAzWd6LOrtEPH5tPHDdvLYqgYx9dQkqIy3FnuSSqePiIsqrac
         tJdZmULW/OsjFRk54nvN0KqKIsU1ZM2ThDnJa1tWEhc3VzFEQt/zvFAtNP14ZXRVGyzn
         JgzF5F6Kr4j9ZjdRjucn3qqgvjdZ2cFleDqBlFFtrSx07kijKySTopkku54eJVQur5c3
         hVwn5XGHrf1ZAyev7XQUntvZ7Ya3paX8u1CY9wHhR6vasHzLzyh6nTE3JN28gpWNzvNI
         uyZ51J9vgDmIF4fgo9Y421h2ZQjStQ5l9fz5wTFetHkTMz1o/I38/kvvo4yFC0goal2+
         GHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716926549; x=1717531349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTx/ooqRdBunSGEYWchVYownJq/zl+8o/e9GCfSovAU=;
        b=DeRSxfs5ynBT/aYG/n/EtxQa9QqgTlZTtJNGCv0Qu6csEHDrq1z4TTCKqoBvHSTbEX
         M6ALrRcEnYxGsDIvPMI7e6KHyiPa/p7AyKXNegitevXZJ85ELWyuxGSmAKouFA9Cd3s9
         qbIQh0fYxVWoCDja5uvLJc5t9GJIyo4VaAz/rR927bdj2qci3o8BAY8n34IE96DUBZF6
         BKhgEWMAl5y8FO6aWQAvwT31EqzkaUupOLgr8ymaiVh8vLDfzCeaM2V4J6FZEmocCPht
         ebJAWgcE9JTo6RSshIr2q4ILw+9RiTmu3DJKjaXclXVGyXJRQJkLZu6QUgz1KWhpBoee
         SRSg==
X-Forwarded-Encrypted: i=1; AJvYcCVRkogBPczrI8F7WmI+PIqwVHikn+a7zygP06teN9PG9YxRfZWIsftwm79TOAHGfGb7aSAx7kBNIlTHJ/POSFewQ33MjX2Q0+Qa49ceOp7886d9zPJcGMJnrxHB+Rd/QCP5siw1fhon5HNW4VR9u2HUUwXpKNK+6aUnAJZnCqVPeQqpOa61qmHu9JD8EZ0qgfqbutq1h9yE1AWTsV2qXQ7wH7ZQSpfiFA==
X-Gm-Message-State: AOJu0YxnCIRMzA3Wl7t2Fw11oEcLJa4HQrEHQrWqmPmdAISOoD9kx/hs
	7NO4naLaH9EryPedhcNTl40IKCt0yaE0Ht0gvA0AAV0+MECvvTEopwd6e67Er1883e///Q6QZGl
	yYRz7tt1McGbJx+MXmBHKGzq50VE=
X-Google-Smtp-Source: AGHT+IG0kuovQE4k0hCff8p1vnZ05vyu6YmcAALQ008OEkY/0nTugK3OZGuWEhT5ca1TVfMEmIgGhy58tAQXP+xShIY=
X-Received: by 2002:a05:6122:1da9:b0:4d5:f28b:2c2c with SMTP id
 71dfb90a1353d-4e97ba164e9mr90580e0c.3.1716926549096; Tue, 28 May 2024
 13:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWwfRvLv9QG2L0orVEFjo88UY45nPFMTs3wEav1TVuWww@mail.gmail.com>
In-Reply-To: <CAMuHMdWwfRvLv9QG2L0orVEFjo88UY45nPFMTs3wEav1TVuWww@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 May 2024 21:01:18 +0100
Message-ID: <CA+V-a8sVhMSuCn3F988kwDw3DFbR0otzXCiLB7btjaFmaOeeCQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, May 22, 2024 at 2:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support to configure bias-disable, bias-pull-up and bias-pull-down
> > properties of the pin.
> >
> > Two new function pointers get_bias_param() and get_bias_val() are
> > introduced as the values in PUPD register differ when compared to
> > RZ/G2L family and RZ/V2H(P) SoC,
> >
> > Value | RZ/G2L        | RZ/V2H
> > ---------------------------------
> > 00b:  | Bias Disabled | Pull up/down disabled
> > 01b:  | Pull-up       | Pull up/down disabled
> > 10b:  | Pull-down     | Pull-down
> > 11b:  | Prohibited    | Pull-up
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - New patch
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -1139,6 +1175,25 @@ static int rzg2l_pinctrl_pinconf_get(struct pinc=
trl_dev *pctldev,
> >                 arg =3D rzg2l_read_pin_config(pctrl, SR(off), bit, SR_M=
ASK);
> >                 break;
> >
> > +       case PIN_CONFIG_BIAS_DISABLE:
> > +       case PIN_CONFIG_BIAS_PULL_UP:
> > +       case PIN_CONFIG_BIAS_PULL_DOWN: {
> > +               if (!(cfg & PIN_CFG_PUPD))
> > +                       return -EINVAL;
> > +
> > +               ret =3D pctrl->data->get_bias_param(rzg2l_read_pin_conf=
ig(pctrl,
> > +                                                                      =
 PUPD(off),
> > +                                                                      =
 bit, PUPD_MASK));
>
> This is rather long, so please split it in two parts, like is done in
> other cases in this function:
>
>     arg =3D rzg2l_read_pin_config(pctrl, PUPD(off), bit, PUPD_MASK);
>     ret =3D pctrl->data->get_bias_param(arg);
>
Agreed, I'll update it as per your suggestion.

Cheers,
Prabhakar

