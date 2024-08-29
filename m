Return-Path: <linux-gpio+bounces-9367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5B9645D6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 15:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92575283DBD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 13:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F071A3BCE;
	Thu, 29 Aug 2024 13:09:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819B446D1;
	Thu, 29 Aug 2024 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936988; cv=none; b=JttLhQNCTzG051P07bNHivLIaed+BgpVcdYvfMUruNaqi5wEqFuDMgAur4AdWfGLjbXGZRNb1+mTZqn/AhDrppX+meHNJYBnrczICjaEWfBLgYte60aJPDWQHRwbzR1lLTVgm2KdZYHRtrwQQCs5qLRn2Cd9both4iHcP+83TWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936988; c=relaxed/simple;
	bh=txHBaIr/umD1HwUz5m1du7i9/LqWw7leQCsHXtL/9Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/VgkcffdFXoCKyawd0s2SYIuRzDC4O81wwCzmQXs2SA2nRrWbPEm/UvWvlVZEeszgefdCuljByHcQzIKXcfxfbYEMxse8MMt0Ace6+vh+Q4l2ezNnyU/zHzGj04odlokOhjEmfxwBlw3vF195Z7ERTVsijk/hKFf/V3ZpqjlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c1ed19b25fso5956757b3.2;
        Thu, 29 Aug 2024 06:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724936985; x=1725541785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qvqa0cXkstoBgirkQOfefdgYYuuDi0dJfHzpUKpVE68=;
        b=stLcV+kwHOxP4lFsJXQp+Y/XLNllp8DdasgH0ZU909YK818nivmP7mEH2a9rtxfWL4
         LMbR5Ta0WV6orJBY30VXBaGOCbtsYFNe/vfdZ+N6Y8H0/UGuT6GpnOZtsr0p8UgHaP02
         CPX/KN0Zpo+WLVLUKV5CG1Wnf5qO1VmNp66+ksBY6j4obnSKqju4CkLvpiNGQa3Knr/Q
         Q6GCcH4RF6Emf+IDtlCWJAM+6flCxfhNUBX1K6GTaa9B7Yddc7RfFUdx9FZ9yROPyg2p
         onhJY1pEcCQdIlhXpLSgt1qG5mJqj52b1CUhEtXhCI2kz3tw+qvhSuf1hImiEueqXjYG
         uHYg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6bkG1NrKrPy4iRSaR9/QbwrQCWk6MrQQzOoFcCKTQM3Lt4ioJqKXDO1exoPUwezUZhd3uyu3DB3VdKAH@vger.kernel.org, AJvYcCXMHh0RKQZO/NQ75+X3sFKdur7FranoyrEugN5lh9cHjsRE8EN5lDte5RqmVGaCkQ8WcvrzPlNB+oNcoGPQIHrmE7k=@vger.kernel.org, AJvYcCXr5jO1JcPPLMOITMGDTcE9q6tFQglMxO47dkdnJfl7AOitX9/5n7YUSmLKyoWkgXmuI4tdgHQS6C8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4nTYWHpxdZ8Ix07C97JeDWJFYSX+602fMnEay4mME7NDULa0
	xbnkHcF6aLhjPfpQiCku70RzjINKmjzplQj8qOU6I/Ol5EX0B6TXoRusRFXr
X-Google-Smtp-Source: AGHT+IE8lamDYHvoPg7A6e/Y+e4ffqovBO5BL4dPNSGK8RyzJJXDe9pTms6AYnXblLpl0AGaqArwiw==
X-Received: by 2002:a05:690c:d93:b0:664:db79:b275 with SMTP id 00721157ae682-6d2728ff11fmr33205917b3.0.1724936984888;
        Thu, 29 Aug 2024 06:09:44 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d57dedb5sm2326957b3.95.2024.08.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:09:44 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e164caa76e4so629119276.1;
        Thu, 29 Aug 2024 06:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWB4R5Tzfui9LKY4k4yI4621jLliIz1wXqCmmOPx9u6Mo8FGGNLoY8yPui6SExfFU+CeCF2dWZHsNj/oye1Lp3ULmk=@vger.kernel.org, AJvYcCWudMGASONKqe1jtCah46LI8W2zs+h6J3aQ8bU+Zq6coUIELRbtJeiOAlRSmLTWCyO79N7nRhiB3Ibyj5Nc@vger.kernel.org, AJvYcCXxP+Nv7uklzE5W2qOoVP/JJIjvXCx7SaqVohB7cgKrg1aoHTrYEjnkDL29ZQIHfYCcZcbgnvJJODTN@vger.kernel.org
X-Received: by 2002:a05:6902:218a:b0:e11:6ebe:ce8f with SMTP id
 3f1490d57ef6-e1a5ab57421mr2743647276.7.1724936984336; Thu, 29 Aug 2024
 06:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240827131722.89359-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240827131722.89359-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 15:09:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU739fyGhF4WGo-REEus82h0VVz+jQtgXk5qUaTqvu6hg@mail.gmail.com>
Message-ID: <CAMuHMdU739fyGhF4WGo-REEus82h0VVz+jQtgXk5qUaTqvu6hg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzg2l: Introduce single macro for
 digital noise filter configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, Aug 27, 2024 at 3:17=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> When enabling the digital noise filter for the pins, it is necessary to
> configure both the noise filter stages (via the FILNUM register) and the
> sampling interval (via the FILCLKSEL register). To simplify this process,
> we introduce a single macro for configuring the digital noise filter.

Currently the pin control tables just declare which pins support
digital noise filter configuration, but the driver does not support
configuring the digital noise filters yet, right?

So I'd reword the paragraph above to something like:

    Support for enabling the digital noise filter, and support for
    configuring the noise filter stages (via the FILNUM register) and the
    sampling interval (via the FILCLKSEL register) are related: a pin
    supports either all or none of them.  Hence simplify declaring digital
    noise filter support for a pin by using a single feature flag instead o=
f
    three separate flags.

> This patch removes the PIN_CFG_FILNUM and PIN_CFG_FILCLKSEL configuration
> macros and renames PIN_CFG_FILONOFF to PIN_CFG_NF.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the actual patch contents:
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

