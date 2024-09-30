Return-Path: <linux-gpio+bounces-10584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A370E98A895
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 17:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D607A1C225EF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E00A192D60;
	Mon, 30 Sep 2024 15:30:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD31A1922E6;
	Mon, 30 Sep 2024 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727710227; cv=none; b=Wdb6rkYllr0t04zEnDAdAQViclROE/X2yzE8R2SutFrzzh/h/ctT5wUP8KpgRu4JMmpOqsl4yG4gidmcTil4zF9NV9h8Z7SP9KVysKzIcgpduTv4hSQTc1xY2rsAb7Ig8W4+LTZ717XgFhUttwqeyBI+787wa+rwsQkdGAqbIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727710227; c=relaxed/simple;
	bh=PYIZjdpD62DjCgg5av5QNpV446iFC/bzdwtY9n1VG9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggZners6Aitg+ASKBCvgPPmFzWKpI241WShpRM5gPQUba8MTOfszDp0FQQVOETwKNV5qt0DsKjYpL/jQtgMoSfMX+i3UUZ2l2QsPs+aDe901b2E9HwActIEF5GJCpCfSPuM/TPrCxPzCiEIBf0G2IbQKs5aZPW/Wrc4ygYSiw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e260754066cso2566286276.1;
        Mon, 30 Sep 2024 08:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710224; x=1728315024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4YA9DJY5hrVnnk/i+Fsy/WzY6pmSHUb6GqzZbRLi/A=;
        b=HBg53UOU1NLrztVPEapKy1KrmOWMNRd+jFyFn25RUY+/sQ9BY2ukq8PYT+WGwXKGDo
         p0u9Jsd50VkaKaTFGGp2lLu/PHOhFNA6OZVMupHr69SObil5pBUVfbt1s9UEu+mN3KBW
         QOTmhhQbw0nksi9OHEstd17BD7DkayO5Y5W42nJI6qdLW+ixNmukvlm0KtPrG/NgJzJS
         83BLI97eOmQNbOBtXmbfgVD1SFNj+ZS8WJ/iHqjmqpSgnK46neASaKWd88MdBoSNXUbi
         dEU7MWdBh1VEebi+BxU3k8n4URBq5Axp0iJ2CDtY6BGwiU6ObcR9DRo5p6mrlxkn40ev
         SpEw==
X-Forwarded-Encrypted: i=1; AJvYcCWEnrdyETJ7u09ICBkrVbAKw/Z9Nnw3s7waTcthbtjDcKG8Hw9kk/0XiBvGMsYxZRPceJenYSeotLXC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRKF3D0HRa1BLvrXRj51RoW3cTZYA4wsbmQS+Tjs4kL39ZMwYq
	ZGYz/DUmRRCZZ+JTwUdlK58RrGGZFxHxmvNHiitKgb52fiSMxgHrkwsS1amr
X-Google-Smtp-Source: AGHT+IHW2let2ol4DAVR8XFQSKURz+Wv9NpqjPgXOv7zxIFC/mISOu2KoZsNgjyBhgqWiklMAoGlow==
X-Received: by 2002:a05:690c:6612:b0:6e2:1467:17c0 with SMTP id 00721157ae682-6e26944ebb9mr36775927b3.8.1727710223888;
        Mon, 30 Sep 2024 08:30:23 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24538aff0sm14103267b3.126.2024.09.30.08.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 08:30:23 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e22f10cc11so35373007b3.1;
        Mon, 30 Sep 2024 08:30:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl8tw2dx8f7UtgxGsEHhOL+lERwyie6Y7ZOeH2qNsKp/L28kBj5o7CpqYHhSoYs5awKs7ZCrQUDwJo@vger.kernel.org
X-Received: by 2002:a05:690c:f92:b0:6dd:f81a:8120 with SMTP id
 00721157ae682-6e247519733mr105361637b3.4.1727710223075; Mon, 30 Sep 2024
 08:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926100653.15015-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926100653.15015-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 17:30:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEsLQiQqJbD9BNg7FyastVToP6VS2sFf8EeuyqzQW3dg@mail.gmail.com>
Message-ID: <CAMuHMdUEsLQiQqJbD9BNg7FyastVToP6VS2sFf8EeuyqzQW3dg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: mark GPIOs as used
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 26, 2024 at 12:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> GPIOs showed up as unclaimed, so they could be muxed to something else
> even though they were in use. Mark GPIOs as claimed to avoid that.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch, which reminds me to fix the same issue on RZ/A2 ;-)

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -19,6 +19,7 @@
>  #include <linux/ioport.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> @@ -750,6 +751,11 @@ static int rza1_pin_mux_single(struct rza1_pinctrl *=
rza1_pctl,
>  static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
>  {
>         struct rza1_port *port =3D gpiochip_get_data(chip);
> +       int ret;
> +
> +       ret =3D pinctrl_gpio_request(chip, gpio);
> +       if (ret)
> +               return ret;
>
>         rza1_pin_reset(port, gpio);

rza1_gpio_free() needs a balancing call to pinctrl_gpio_free().

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

