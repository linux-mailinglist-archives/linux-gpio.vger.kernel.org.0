Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8AD51D4F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 23:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732418AbfFXVqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 17:46:50 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44353 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbfFXVqt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 17:46:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so14086964ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TvObU7IWK148mugv+8YLoxj2pHtdD8wDjralc1eZ820=;
        b=eVyKqSIuQKAaekM0EmHtxuljE+XvuFuqrCH3w4eVu4uH4gQY/lL63E07pCzcpneENN
         MbU7ILZsJsAXJiCJYoAs7tGqmLGU+8VLAMvnvuEpJ/D7kVhU1B2PhW45XdvQNJ6AAgDs
         Ak9PEfhkgZLi/pyETtdR+k2eoGG39VnWmVa5QOym+EeDfOeJ0Q1XYD4HQjpTrEM775ex
         4VntPKQXC+tb08A/XRAWmjdtqSWgnZ8TRZQiPr/bjy20qZ74XZWLMKuCTtG2CAmoUEst
         ttb9VJ70e1q9U+6ClJyRpuzdE3MGR00uJCUtWLaOKlAMSUZ//E4eQUYflW1tmSCrQwCo
         4TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TvObU7IWK148mugv+8YLoxj2pHtdD8wDjralc1eZ820=;
        b=Z3J4HNiFdck8dkFankSX4KphmDO1kGo31aqkjYHhqudw2ailkerjTrQMO9W0UymVI+
         +t+wwaj4yZPxoyJfyXM2BboQQaW9elu1PhqcKp/yXbOfbVoklXl0m879YOwXYz7mpBtn
         tgT4SX8XF6PcYrhRJCPgBhuPDe6YI05XCWEYBcKmGhcLQ32dX0tmI4jKqM806hALJCbU
         Eze4sjjWc/r49Fh5I+4wvse6aP652dikzWkROuCycxzxEjo9iBiz58WBsV+/nahqja1b
         Ia3wmlibgkUIKEtwgMxy6QnixCcUV2SE1Citma1+IL51eeGAOA114MtsmSY0Fqdp06hu
         Fo0Q==
X-Gm-Message-State: APjAAAWoxwphwpA99Hp1qDRApa7UfNQh961fuNwKmLhriePvLVXRSd/s
        O1WvDaq/pI+jrQfjfW8AheFzX6kNGQ4/2e8UgxqdeCgJmfw=
X-Google-Smtp-Source: APXvYqyB9J5h/adP0i/pNpLqsTGYXEE2AV7J1lLS89yxmzcik9O406p6N6fHizeTKD6/qXhj5wF/FzTcYlAojDcxqWw=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr59397998ljg.62.1561412807863;
 Mon, 24 Jun 2019 14:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
 <e6ca74e2-fc51-3f24-c5e9-18c22d6f87ef@metux.net> <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
In-Reply-To: <e344f5a35e314ebcea110ba082b74659de5b0e5e.camel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Jun 2019 23:46:35 +0200
Message-ID: <CACRpkdaLEDmJ49m_fpuuA1e33hTtyB-LsyZeOmpRybbULgmHDA@mail.gmail.com>
Subject: Re: [RFC] Addition of kernel
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 19, 2019 at 1:54 PM Martyn Welch <martyn.welch@collabora.com> wrote:

> You're right, the lines we wish to use this with aren't generic gpios,
> they are primarily control lines for specific peripherals on the
> device. I believe you are right, in an ideal world we could write
> drivers for some of the functionality currently being exposed to user
> space. But I'm fairly sure some of the lines don't have a sensible
> driver model in which to fit them, specifically I can think of the
> reset, boot mode control and interrupt lines for the GPS unit embedded
> in the device I'm working on.

A GPS unit should be handled using the GNSS subsystem in
drivers/gnss:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gnss

The device tree bindings actually mention some of what you
already line up (timepulse-gpios for example):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gnss

> We are also not in the position to make major changes to how
> functionality on this device has already been implemented and whilst we
> are hoping to move to using proper drivers in some places, this is not
> going to be tenable in all cases and we would ideally like to avoid
> utilising a home grown (and certainly unlikely to be upstreamable)
> solution for exposing these GPIOs.

While we do encourage to use the right subsystems for this kind
of stuff there are certain cases we do defer to be handled in userspace,
but not many. These include one-off things like prototypes and
factory lines with a myriad of relays (some PLC usecases),
door openers (we don't want drivers/dooropener) or fire
alarm button (but definately any elaborate IIO sensors
goes into drivers/iio) so it is a bit on case-by-case intuition
here.

Yours,
Linus Walleij
