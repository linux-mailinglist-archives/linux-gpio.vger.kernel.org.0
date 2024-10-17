Return-Path: <linux-gpio+bounces-11543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98F9A22EF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012221F239FF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A281DDA15;
	Thu, 17 Oct 2024 13:04:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142EF1DC19F;
	Thu, 17 Oct 2024 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170253; cv=none; b=n20VtoJJAifog5+YfSPfa5mYrg6Sgw5kOms/DzdqnjjW4aKxlrjuONkYhhDMxoCOieNqppOT1cM8k7MhUWUiW1sc4eSUr4sBqnwUgbrx4/9G+sLp0m/APtfp7LuG+npYT+piEzqHWbWbnU4jC6cgGqpYXq3kZi06bJgPY1t3Bhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170253; c=relaxed/simple;
	bh=0Vy07XqxZwA8jz43RlWbXoyGbs/i6kRd8p4PU4aIoYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DK1/YKK5yJ9De1aKHHAZFg/hUVExh9CPYyDnGA5XNklh5UF8taLlNoqB2hnu6xo6x+LPr314T2Shrp44vbPWtpqalHEWvw/7t1hIO+iA364JqIfNSWTT+0+FcWZW8XgS7XWTSMjnm/tQKNMKYAgMHYNkx4/zYzydpjAc7DwkhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so1678707b3.1;
        Thu, 17 Oct 2024 06:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729170248; x=1729775048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJSWhjMgWAN1qdb4AJ0P6tstXDPlc7bN1pXwB46z1c=;
        b=QMRLL6tMovq1u6OixBt4E+/MaKV18aAdUZbAqEMORBCRpFfqkuzMBgxl8B95viOeXk
         rHussI5GHNwARsrxneDblowAb4LmeLEEC1OFgaaHGy/HlbzaF6T6cS/hGNDeD+Zozm9Z
         nROZSUzgND+xIRcS/GtYk9pKvC0tvZlDtP9wVX1/K7e3pwKIPdRo2muGu3g7b0VIuqSV
         qy+xRytTkHNXQtAeSu1gsd1zqJasJtD/T+eQ48WRCrDiVPjw6pXcBe3qCtk5CebiHvgQ
         /l0yv21MpfRNxm/bg1YFeCla4BZZehBrTMKPN/fF0b9BZSpwNBlQ5wKWA+oXUjNbBGbj
         FsNg==
X-Forwarded-Encrypted: i=1; AJvYcCUIKhdN7n9sZEfyLxFMStJstRQ2p1J8l/XtUUt80BekllQZPzKK5TgWMeFrQI0RXTx/yg0Feseh26WX@vger.kernel.org, AJvYcCUNrRqtuPjWtxQztZxnlAqH8SiQ35awKTTmk3+WqTBjqcczUrlOC16DZ5T3h6gCv/OEnTxbUfzkm4P7HQbgLk7ihqI=@vger.kernel.org, AJvYcCUYX7rUZb7403QgOmLmQb72ToqB6tEvYqkQ0I0cMgbyDUMFIWzDByUltvBqlQGSDPwl/P1Hfi/EBcbfSDFf@vger.kernel.org, AJvYcCWPtllJbvxt8BuW2CeYxey/uB+MXsV3fpaR/anX1t+nlftzAbzxItcCE4pw+RXcb3tHS+hc+gUUb3qqPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdV2hqWGDp63+fa6CW/KzFl+ILGLMnbYg63xwRBJEhkhDy2vJi
	7ro6UQlyApXepkTmHvdoMS90bIqE6eAqLV2SpOiIKtDUw0zi8ZiIylYV04XS
X-Google-Smtp-Source: AGHT+IE4a99swM1WNg5tuqeomNtF1ItMrIi0tjhLwnXC9oBNtLxHgMZwoCeugqMj3emOTIiHwkAgUA==
X-Received: by 2002:a05:690c:82:b0:6e3:116c:ec0c with SMTP id 00721157ae682-6e3d41cf629mr73021757b3.30.1729170248281;
        Thu, 17 Oct 2024 06:04:08 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c5703c6dsm11191637b3.0.2024.10.17.06.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 06:04:08 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e38ebcc0abso11554037b3.2;
        Thu, 17 Oct 2024 06:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+WPqbm8z/j4SRq7H+soNxdg6nVYvL/PwdOTXKCNrQt+CNMqQ6uGNxU7eVW38nFARQS0AaO7usUcQQig==@vger.kernel.org, AJvYcCWlqoW305TeCiSGsD+48M63YrLJYemFHch+M2G6c3QXOL0ZEO5yY+MyJytTwq0Mk2WIIY/283wAdE46BHcJ@vger.kernel.org, AJvYcCWrpyN7isXJiXIE0eI1O1QjcSvF1mDT6BHHDGHn2F35+c19FsYv/NfX0JMuPXRmdnWo6dfNKU86IyWxdIpXv235ohg=@vger.kernel.org, AJvYcCXQwdNb5zXJqa8qvc6hVpomTgdvJ1NlOhwU59TZ+KV28n1q8pOK0fJ4ZBGOQCibFVi8z2DWKUd3Dv9c@vger.kernel.org
X-Received: by 2002:a05:690c:6f85:b0:6e3:3326:91e6 with SMTP id
 00721157ae682-6e3d41f4483mr78127517b3.44.1729170247821; Thu, 17 Oct 2024
 06:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241017113942.139712-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241017113942.139712-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Oct 2024 15:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBWTOzB4p-YAo_HDA4wmebUcQ7tvLFvgMXR+U9M5Zf-A@mail.gmail.com>
Message-ID: <CAMuHMdUBWTOzB4p-YAo_HDA4wmebUcQ7tvLFvgMXR+U9M5Zf-A@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell
 helper
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

"Because rzg2l_gpio_populate_parent_fwspec() and
 gpiochip_populate_parent_fwspec_twocell() are identical."

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

