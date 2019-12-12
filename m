Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2833D11D1E3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbfLLQIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:08:50 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43201 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbfLLQIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 11:08:50 -0500
Received: by mail-qt1-f194.google.com with SMTP id b3so2683114qti.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6xL5oHx6JhfySW6vNlCWxSH0U7ZkAzHSyw1I4MBhOBU=;
        b=bX0qcXCfrctzXDS/zTTqs6TEaaJAU5p5CsU4r/5/bKGYfQYofP2Ae0gBQel5/wwdh0
         iJ2cx1hOBcJw2uT6qMHTzMHRo5U9ndec/mh1nW0E/oy3kDUHngJDaI5a6Mt6QDB7Zh3O
         dyjAz+ug5qnFQxQ4IZoRP5rMghfhGc8NldSweIlVJQmGdoxJpU7aUh0qRmlziBJnQ/fk
         u4pmrr77wEOXvqc2gbXJ3o/0AbdNr9l2Y6k4PNoxH0z8nDQuxY9GR6ta87xJ75rBJUzs
         umrKZYrpChkC2N72J/mQTVKQbOj0TPfkwPb9o2seXvtOtZkLELyaLh/6USr4/sHNARPF
         WpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6xL5oHx6JhfySW6vNlCWxSH0U7ZkAzHSyw1I4MBhOBU=;
        b=SZbWh3Ch11lEF1DpX02DmjlIN6EZN5hf062j8RFG/IYKOeaO2/TBpMj+Weu3UrmTCz
         fhETrWZqVavEnMoH3bmmpXS6FYAHBdWxis/dcgLhtH6QCZMvSOh1FBLb9d9tv5jg5mq7
         9f9qcTDTGEx/7PVaFoAgbUxSJOQQGA5+AgJOpcBBcTfGZ0nUq+6tHulrHPnloWvQljB9
         wgxSrA6i2asQaRt688Do8NP7wuC9ne2AndYmIXZxYS0Z8p5BZgXFvm0WzlHSJwR6P3zG
         I543e0QzMZWpX1+4QzrHn9O2/x8+Pizg/krMcYYBbMug24PSWz2Xv+K/kumJmK1rvmc2
         aqug==
X-Gm-Message-State: APjAAAWAASDSOa2Ze6+Av0mLpQJuBQpg7O668xoWRqXW1uFDmz4i8cot
        HxlRdKMsu0Df80I7YLIY++ltGjK211lz+ofAN74cyA==
X-Google-Smtp-Source: APXvYqyHX+4gkmFrb0PetZfIRJsKK01/Htm4j9k5//KWMeGY8spRtLpR1itsFlTDdkQHvk5JZswQdyreZWZAfH/iR44=
X-Received: by 2002:ac8:6784:: with SMTP id b4mr7837731qtp.27.1576166929494;
 Thu, 12 Dec 2019 08:08:49 -0800 (PST)
MIME-Version: 1.0
References: <1575352925-17271-1-git-send-email-peng.fan@nxp.com>
 <CACRpkdaTLVNXd+-j_gkOfKnTk02XaZiMA_XxUeM0_4zZ_F-=ug@mail.gmail.com> <CACRpkdYjCnx46kOuWXMZFme3emm1TugqjQPDctakOppAeCZvZg@mail.gmail.com>
In-Reply-To: <CACRpkdYjCnx46kOuWXMZFme3emm1TugqjQPDctakOppAeCZvZg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Dec 2019 17:08:38 +0100
Message-ID: <CAMpxmJX73eufsaXzFjkb2S9Adztv7PqDEhBSDHfmbB_+VGrXEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mvebu: use platform_irq_count
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 gru 2019 o 16:31 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Thu, Dec 12, 2019 at 4:29 PM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >
> > On Tue, Dec 3, 2019 at 7:04 AM Peng Fan <peng.fan@nxp.com> wrote:
> >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use platform_irq_count to replace of_irq_count
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >
> > > V1:
> > >  Code inspection, not tested
> >
> > Patch applied.
>
> Oops dropped again now that I see there are comments on
> 2/2 that warrants a v2 of this as well.
>
> Yours,
> Linus Walleij

Linus,

FYI I picked up v3 of this series into my tree.

Bart
