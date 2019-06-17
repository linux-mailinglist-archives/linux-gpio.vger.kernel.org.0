Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBC24810D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 13:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQLle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 07:41:34 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44343 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQLld (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 07:41:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so8913947ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2019 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na1Ed2T2dhPFnaWUviqpm3OYjuC6SMG2eBpQPT7cawQ=;
        b=X0wqe+gtpZKtAS9Wd51aF/SSv67I7fYv7D60ceoTbrf5gtHIrziFMUgJAEhI0YPSXg
         lh1dTIAyioANUzsgB0x5G0atY1Ir8eSPPhIv9/IgntZiX6qJRbQ05TwqFi3FJpWMTygR
         Uni7B5Uipa8ienRg4iGlykeD4N/4+h4vI9UTnWrPowy3hsh3E15or/2+50AdKMoHn7ve
         n0FiauCMJu5DPXZt3onBf610Ja37Fj3tI6zn9+t+WjN/+eFxn8NfCOBBxu2PQv0wfeZD
         CXq/aJT55vDj44UEt0XscXU+AolMDgnxEFnZ7TeE0371irOaUJ59Nq8oPVx+DgaHlIp1
         wUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na1Ed2T2dhPFnaWUviqpm3OYjuC6SMG2eBpQPT7cawQ=;
        b=hC8yTyiABfjme6CkZpSOM/ao+i1v7ukOL/BOskxPjnYnK6rE6wEEfdlJjOo1++XCYL
         NaW8o378GzC4CiIk3wm6N6k+pkzs9R4578x5N9lM6aFC/yjG9/8rV01aE3uwboeao9Tr
         OHrL7/EKksLG9N//idgRELu0YOwkGbmjLbqA+81/OoAWXbSpNZjLyImw3y8rn8FHDh5o
         urWT1YX6mdsvVly++XYi8lpa296mKUY9em2Kwtox5dyA32NxEND+X1ewCV9IszA2S4Fc
         HXh2HiOMn6dcXwF0P6ViiIj6ORyOCcD/6SK7ZDclqHRbTJojJ/ZGyDtBkYSeB8c1cCaS
         oksg==
X-Gm-Message-State: APjAAAW9d+xdRdiPAfj1oWDTQjVzs3WhotMUEWt0ueVzqCR3jg8kn6ud
        aSEEQJ6ylugOw4MOof0iTSjZZTeuG4E0UTZx9JAUXg==
X-Google-Smtp-Source: APXvYqw3+blfIZqFKLSDzh1bVLhL77sXrVM8GAhtKj3HwtztrmVzjQlHWGVrbBJlGgiQkCbGUX3SnpczfhcOaQTuSZs=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr28861683ljj.108.1560771691741;
 Mon, 17 Jun 2019 04:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
In-Reply-To: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Jun 2019 13:41:20 +0200
Message-ID: <CACRpkdZj=MnmtPD6v14A8dBmN6kmsjyNihHQjr88E146B9hmNw@mail.gmail.com>
Subject: Re: [RFC] Addition of kernel
To:     Martyn Welch <martyn.welch@collabora.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Martyn,

On Mon, Jun 17, 2019 at 10:29 AM Martyn Welch
<martyn.welch@collabora.com> wrote:

> We are currently in the position that we would like to pre-configure
> some GPIOs at boot time and be able to later affect the state of GPIOs
> configured as outputs or read the state of GPIOs previously configured
> as inputs.

I have discussed this several times in the past, I soon have to
make a collection of links to the old discussions so we don't have
to repeat ourselves :)

Here are some:

Discussion with Rob Herring:
https://marc.info/?l=linux-gpio&m=145749645728713&w=2

https://marc.info/?l=linux-gpio&m=153440711326259&w=2
In response to:
https://marc.info/?l=linux-kernel&m=153436471811875&w=2

> Initially we are thinking of providing a device-tree node containing a
> "gpio-default" property and would contain a lot of the same properties
> as "gpio-hog".
>
> Code wise, it would seem to need to follow roughly the same flow as
> gpio-hog, but avoid running "gpiod_request_commit()" so that the GPIO
> line could later be requested by user space.
>
> I suspect there's a whole load of details that I'm missing at this
> stage and I've not fully thought through the implications for later
> removal.
>
> Does something like this seem viable upstream?

I am all for it, the trick is to come up with a syntax that passes the
review of the device tree people. They did not like the idea to extend
the hogs, and dislike the way hogs were made in the first place.

I would suspect that something more similar to gpio-line-names
sits better with them, like gpio-initial-states = in -, out 1, out 0, in -. ...
however that would work.

There are some custom bindings for this already that should
ideally be phased over to the generic bindings as part of the
patch set.

Yours,
Linus Walleij
