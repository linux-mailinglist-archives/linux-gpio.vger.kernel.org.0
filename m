Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5971042CF37
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhJMXh7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhJMXh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:37:59 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42266C061570
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:35:55 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g8so16846966edt.7
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+QVWEmqTwjvB4lKG2oT78utmP75huv6baJV8Y1UEyyM=;
        b=XGhEFyFE/kODzisBg+Dy3AWn53AkLeZdpDCkcVjpmgkQ5sBz/p59SBbPu5fEYROYNl
         3VZG3uLSjs6+TssumBQaLFlmPuC9hEMTTSOvtXtsBFw9OxqzEHMD1VxPUCaIUifMd/k0
         pWcd1MxVSJ6o9D1nP1dT9+KqMXkE9x8+fxYSmw0sNJ4u/yDOWhQq5P65VcHnSL5Xsyz0
         IYmTaT3V9edfHkDZO74JiRn2d3SLiqGGviUzePNz9HWEiOBqHi4lV++TlHX9no9nD8p0
         QqXDOlXbcgltsvk8a1CVTZZbJ+rBeq+d8jEVc5oae7gBFRfnfjJTU4QTwOXcQ0v4qm7h
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QVWEmqTwjvB4lKG2oT78utmP75huv6baJV8Y1UEyyM=;
        b=nBYeBpToVNUJfJsNUAu00FEMidVbMujSVNqKVEX1p0X3xCIBa6ybpk+f0Ww5MB+xYV
         fJ+QwL96vp5gBRx3Rjqbbk0Yd2Vyy345/TyeKzopS61/I+so8crhoXyC+g/l5w3wMsIl
         zrIagiAhPg04UnBBQG29Pl8A3ay0iecXI3TntIS7RZKV4yjpAMgb2/Iw4cyJ7NMBp6Gy
         Tyn5DUE7IQtktVXQ1naMn5aokPEbbcxbNtUXRe2nvC/y4A2DpIH9rHdfIpYqWkEIDvvp
         9d4Lyek5vFUOd9jJluIlxtXiYbQegnqFxxfLmJTrAFaDqyZIvcxy8VZ5TAiLDu3DeUDY
         BuAA==
X-Gm-Message-State: AOAM5338EldraushNmaZb2H85PVaKHrwEv/1UZ/lkYX4JM+0nqeEXnJF
        Rfc3ZS+kDLr4Q5+uLDLFLH+vfPFRqzXVC+c3TvYVjA==
X-Google-Smtp-Source: ABdhPJzudWwbadLJFz5Q8P5mUjjvq1YMm2nXg1AcHEp7PN3hUnfOyGsjcJO908OaBYfm4p57U+ZXDNmK5T53AbSmRP4=
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr3747697edv.286.1634168153873;
 Wed, 13 Oct 2021 16:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com> <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
 <YWWu+t487giK/FB2@google.com> <YWWvJKs8K9Z8WIGV@google.com>
In-Reply-To: <YWWvJKs8K9Z8WIGV@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:35:42 +0200
Message-ID: <CACRpkdYe+qJMqbFNyfSE=93ERg4XrmnxqxkT34Kv5n+ZtCyNLA@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-sunxi@lists.linux.dev,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 5:52 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 12 Oct 2021, Lee Jones wrote:
> > On Tue, 12 Oct 2021, Rob Herring wrote:

> > Ah, I missed Bartosz Ack up there.
> >
> > Happy to apply it.
>
> Linus, Bartosz, do you require a PR?

I'm a bit out of the loop so let Bartosz answer this but generally
not, as long as your tree builds clean we are happy!

Yours,
Linus Walleij
