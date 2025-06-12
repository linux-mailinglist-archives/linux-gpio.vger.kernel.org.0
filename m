Return-Path: <linux-gpio+bounces-21430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B63AD6F8D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56581BC4E09
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 11:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D887222A4DB;
	Thu, 12 Jun 2025 11:53:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36E223714;
	Thu, 12 Jun 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729190; cv=none; b=P3ce2zamQseWRCxHkKXZAFmdCterHSX4bPeQ1DAHpyZsXz10UVqGDfZv8cvJfwVHrQtL8IwGhcgehGrfqvSB3j8oUhWeFd2/zm2gYs6E5fxL4B7NUhcpORMgjW6MMf/yRh/4baV8jOBMHKiO51r1VhHjCLAil23o5yBelDa5r2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729190; c=relaxed/simple;
	bh=0kfKlgvUsAZgSqo7xmBv1o0xetRmC38w/qWeXk5OQPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jA0FMpywMNtwpT1MuDZkAZDkfwx29iJ6TxlMj7ojiuzVKtLCC29NHr400z9XkRxa7D906yJi1hjeKKdUboUp1Ld0qDPdv8U2gWRdEgsJKNeW1Xvz+xRW34tYMRGtq1WkJ3m1ymQm7R70alJdDTyPVc0S5inmErJMQzE8QIlIC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ec9a4c86cso272767241.1;
        Thu, 12 Jun 2025 04:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729187; x=1750333987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5+f4CN+jVU3txnndL4whXnDARaGczHhcy3QpZ8lwrA=;
        b=eNC+rHSj+yJOau1Ovf3eWxxWeA3oJmTl6eoM0vNIcs0WXY8PQ9+hTauZcH92iIV52z
         K5l7eJ21wYP0VaZ3kaOplZjsF69wO4XVy+DbySzPKbiaMmFkNJIsu6btxtDe//Vjogk3
         O7lG5b041ZVB4RORezGwSXCHutK3GnyUl9J8Pvr/sfssR9jdoHbbmtUh34ZPBbNEJqj1
         sMpg7IIoshEKO2OvaMccYhtYbYR0m8cw4ZU733nbhVEBTmBIGakHhHRewhRii2Qtajq+
         BpSrs9q98nlbCK67XX6FTV3X3IVoH9pcEjIBqi+6ZDeVAkb0Ge0XXZrhBb+1zpOGUeEL
         TGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi01t1UGhXHbXGrhGjngfuBRelCUwTaDG5qyBjtayGRI+7E3MbEM04LpoP5KAocOk1fk2RyDd+HW8u@vger.kernel.org, AJvYcCXKqLTh+8BvFBDjJkklMwNgFknHCSd2Ns+ziO2H7x+y/Rht6gfRyBbSiW6E27QpthaOVnD41/aw1UQIUrVc@vger.kernel.org, AJvYcCXa4fECxont+JLEmHtPK0i1CAt00eFXElXJiW0CD81dL34GVl8ttGOjcqYHO808qZj5FjzrLuOamF8ovrmYcjEsVwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnbP6WBfcpsLV3JEz3PTC61pCKijmH1pqkpUg76w3OJwJ93nZ
	PgPoaWyVTFH/U4mHUoNkq8wLOguTSLDkp+8/OJkCmvd+HVpQ2XH/yuNgybLcyImg
X-Gm-Gg: ASbGnctA5fUj2MZ06sxMohrNGtqjuz+Wqqj0iKqe+nwcjM0z9Iuo5RJ/uVFT76eOraT
	Dbkz7Kq3PUDUuypnrtRuKumYfYEDtqhXDMc9F5VaxyCkIRZUQFHKm9IBhuAIzUvJDJk9ArVfiyN
	MSej3vpuk7df+wWGHTZn1DH0fz8ioh8wdZh1Dq6hCgniQ033wCT8sWUf0DdkraP3leI7Jcydrd5
	mw8QE3B1PpIHqTXEPRahVbmnPeZ6LD2yD+RVOg0W+q0kQ+stfQr4lckaeq3t9/rn8fCXnvmQ28z
	q3HlfrzMRTpskfT2zAIxxSGQ7HfC9zxIXb0EGbeaA0wAxqBViFthk3/xrn5kRScnh0odkUesnA4
	am1xPSW3fjV+uW4YgjQyTD7yD
X-Google-Smtp-Source: AGHT+IG+xO+Qsqi0oEowhGM8ywgOudIo1KC4cbkn0lyjp6j+CR98tc7oeOw6qm7QQiZnsOezAlJLnQ==
X-Received: by 2002:a05:6102:b09:b0:4e6:f8b0:28da with SMTP id ada2fe7eead31-4e7baf1057amr6678639137.11.1749729186524;
        Thu, 12 Jun 2025 04:53:06 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f01350348sm256879241.22.2025.06.12.04.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:53:06 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87f0ac304f0so18342241.3;
        Thu, 12 Jun 2025 04:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUatpkqM6IDKYdImtpuGEJiNkfDxVCDXiLO6MCHnOzJOWtGdvisLIh+bXBoNhAk+XUoGZSEeTBNczE6@vger.kernel.org, AJvYcCV24HpPX15DFyZyxExV24Yp1Y7r+A730OSRTMRf2KloNPDoqGT3cJc9T+Aa3KnKDVMrD2t85tmYXVj2OaCyzHIuPY4=@vger.kernel.org, AJvYcCW7VDa6SKzTD3QFfLs1/DUOB5YqnmqVAOZab8mUhNe0Jc6L2E/nOz/EOCaxhG37SoH5BBYqEKmtE/ZrBjd7@vger.kernel.org
X-Received: by 2002:a05:6102:504f:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4e7baed2177mr6031205137.7.1749729185967; Thu, 12 Jun 2025
 04:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 13:52:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgNKgybzACevUkfuapayFZzYv4RNsARQD-RpFESc2hKQ@mail.gmail.com>
X-Gm-Features: AX0GCFv5JDfZdCfj7ZSL6wZHfiPE35IHlz9ZS_abguFuvQn86KnzHH_gp-Y062o
Message-ID: <CAMuHMdVgNKgybzACevUkfuapayFZzYv4RNsARQD-RpFESc2hKQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: renesas: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 10:44, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in renesas pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       pinctrl: renesas: use new GPIO line value setter callbacks
>       pinctrl: rzg2l: use new GPIO line value setter callbacks
>       pinctrl: rza1: use new GPIO line value setter callbacks
>       pinctrl: rzv2m: use new GPIO line value setter callbacks
>       pinctrl: rza2: use new GPIO line value setter callbacks
>
>  drivers/pinctrl/renesas/gpio.c          | 6 ++++--
>  drivers/pinctrl/renesas/pinctrl-rza1.c  | 8 +++++---
>  drivers/pinctrl/renesas/pinctrl-rza2.c  | 8 +++++---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 +++++---
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 +++++---
>  5 files changed, 24 insertions(+), 14 deletions(-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

