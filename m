Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1678F2654FD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 00:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgIJWWv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 18:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJWWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 18:22:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B8DC061573;
        Thu, 10 Sep 2020 15:22:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so9091810wrn.6;
        Thu, 10 Sep 2020 15:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QJdryBOClKOA56RF0lno73w+2jIzy3qa74iAnOwAYJM=;
        b=Ojaen4RDlczPCynflQ2X+Woxi0hEuMMYDJ68edSPXfpPvF+u0vKCVW4FCO2vw1K7VV
         kXvV0Z/jsR6035H1U+auwdtoW07iSD+BUF8c4uQSmHrycBsPxQdUqxWBlWBywXApxT3h
         k239KmY1XHQo3ddTeDrWbl1rzFIpQDdMIBEzFl1g3IfIE+kHQBJu45Y3chtYK/roJoZJ
         Q4cQzN22p3gSjfkrxtS5xjfdXLrnEbCcf5Aw7Sez8H47t1Y2z90YYG+HfBUpIhJMrtaS
         4F1yYEcA5wA5YvZROcJkH/glNVkStXIZlDG4f+SklpgJ6emzPwNoFKU3q2bd2/pEgjC/
         XZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QJdryBOClKOA56RF0lno73w+2jIzy3qa74iAnOwAYJM=;
        b=bMktxDt4QcdY4YqBBkpVnVbQzOtFE8Z4RYPPJ/thhkR79Ukg+5txYffrs3UdvcaxJP
         aeGcOcXOmNscnc+vIXRWcwVEJgzHCmm+bQmh6GcaqSGUheFg/LqHMjIXNok32xE9nMte
         0nbQ01wofOMPo7sP575EY4kYI9seUHNaroNU0/MIenJmdtMlwoiaCj5zN8feG3t55PJ3
         /vSD0LSanb8xMp/7EYpunoHtjSn6646K+nqMt2jj+tXy5lu3TN+lunylVDPbAWmGg7dp
         l2N+pDgYRrvkONaklDV4sEodyepb4pON+skmYJJ3xRd2Hy/AsZSkuLUMsJz/8G7jdT4i
         mAwA==
X-Gm-Message-State: AOAM532Ra3lesVnKHzTRtGOh+8R9pip0Rq3fPeCpVDAUvlppUQcfJeog
        dLGPQ/Mv97dxfiRAhicvUWE02GRBTM8O+GkTv3Y=
X-Google-Smtp-Source: ABdhPJw1y+dDHeLHjy/0iRFHZOUDlGfXVKBifM7P89aTJ9bB6XIMhdV8RFZwEBJY8C362hS+59YnVjan715cn1kHtd0=
X-Received: by 2002:adf:f984:: with SMTP id f4mr11205365wrr.102.1599776565758;
 Thu, 10 Sep 2020 15:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <f32130bf-cfd4-b1bf-538c-dbc9ee2d947a@eaxlabs.cz> <CACRpkdaHNuuS-2zMwWf-2--8FFV_4aQuAjYx8pLu66h4adQcwQ@mail.gmail.com>
In-Reply-To: <CACRpkdaHNuuS-2zMwWf-2--8FFV_4aQuAjYx8pLu66h4adQcwQ@mail.gmail.com>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Thu, 10 Sep 2020 15:22:34 -0700
Message-ID: <CAHQ1cqGF3PsaWc0b0_1Mk8=4f36tO+WKwK0D6tRRxbFYtkTcpQ@mail.gmail.com>
Subject: Re: pinctrl: sx150x bug
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Martin DEVERA <devik@eaxlabs.cz>, Peter Rosin <peda@axentia.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 6, 2020 at 2:41 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Martin,
>
> thanks for your report, let's check with Peter, Neil and Andrey who also
> use this expander if they also see this problem (CC).
>

Looks reasonable. I haven't used that HW in a while, so I added Chris
Healy to this thread, since he might be in a better position to
comment on this and maybe even provide a Tested-by

> On Wed, Aug 5, 2020 at 11:28 AM Martin DEVERA <devik@eaxlabs.cz> wrote:
>
> > I encountered bug in SX1502 expander driver in 5.7.7. Here is relevant
> > DTS part:
> >
> > compatible = "semtech,sx1502q";
> > gpio4_cfg_pins: gpio2-cfg {
> >                          pins = "gpio5";
> >                          output-high;
> >      };
> >
> > And part of OOPS:
> >
> > [    0.673996] [<c023cfa6>] (gpiochip_get_data) from [<c023b235>]
> > (sx150x_gpio_direction_output+0xd)
> > [    0.683259] [<c023b235>] (sx150x_gpio_direction_output) from
> > [<c023b363>] (sx150x_pinconf_set+0x)
> > [    0.692796] [<c023b363>] (sx150x_pinconf_set) from [<c0238fef>]
> > (pinconf_apply_setting+0x39/0x7e)
> > [    0.701635] [<c0238fef>] (pinconf_apply_setting) from [<c0236c77>]
> > (pinctrl_commit_state+0xa5/0x)
> > [    0.710648] [<c0236c77>] (pinctrl_commit_state) from [<c0237e03>]
> > (pinctrl_enable+0xff/0x1d4)
> > [    0.719139] [<c0237e03>] (pinctrl_enable) from [<c023b791>]
> > (sx150x_probe+0x1a3/0x358)
> > [    0.727027] [<c023b791>] (sx150x_probe) from [<c02c38bf>]
> > (i2c_device_probe+0x1bb/0x1dc)
> >
> > The problem is that sx150x_pinconf_set uses sx150x_gpio_direction_output
> > but gpio is not
> > setup yet. Patch below fixes it but I'm not sure whether is it correct:
> >
> > diff --git a/drivers/pinctrl/pinctrl-sx150x.c
> > b/drivers/pinctrl/pinctrl-sx150x.c
> > index 6e74bd87d959..3f5651edd336 100644
> > --- a/drivers/pinctrl/pinctrl-sx150x.c
> > +++ b/drivers/pinctrl/pinctrl-sx150x.c
> > @@ -1154,12 +1154,6 @@ static int sx150x_probe(struct i2c_client *client,
> >                  return ret;
> >          }
> >
> > -       ret = pinctrl_enable(pctl->pctldev);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to enable pinctrl device\n");
> > -               return ret;
> > -       }
> > -
> >          /* Register GPIO controller */
> >          pctl->gpio.base = -1;
> >          pctl->gpio.ngpio = pctl->data->npins;
> > @@ -1191,6 +1185,12 @@ static int sx150x_probe(struct i2c_client *client,
> >          if (ret)
> >                  return ret;
> >
> > +       ret = pinctrl_enable(pctl->pctldev);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to enable pinctrl device\n");
> > +               return ret;
> > +       }
> > +
> >          ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
> >                                       0, 0, pctl->data->npins);
> >          if (ret)
>
> I don't see any problem with the patch, can you send a proper patch
> with git-send-email so we can test it and apply it if it works for the
> other users? Include the mentioned people on CC.
>
> Yours,
> Linus Walleij
