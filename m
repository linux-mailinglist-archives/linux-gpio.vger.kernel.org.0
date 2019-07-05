Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D9B60D44
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 23:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbfGEVqQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 17:46:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40702 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfGEVqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 17:46:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id m8so995991lji.7
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1v61oqHX7c1CBf8OKtP/1BsjhM0sQc4mZ5MbznJNlJ0=;
        b=SXwjy3zb+x7sxSUBJA93el1BrCvxzsbXimpX7BfJP2R9hBZour6fXhPCbzX2YdN4Xq
         DJwQmh92LJQ7dlAk8HHwI7Y/DO2z88DU2ocLtKZBRRMdAPx8MkWi536/unIM153tG4W9
         uxQW9irsTf0ZLiTEN4IFlVhWEuPbtzKfAUWf/4L6fL9IMymXJIR1U89+33VBZNnUdsOZ
         n9koVQKlBn8xSKAvUkk8YTMHXzlJWHYng02RtIA2q55duzaZi/zvNFzBnvw3PyB/xYJr
         cZuJifd1DtiUu80zWejM3NgQPtEp7K/6U87VbCAbmeFjna5DQ/wFRN/XstuS8Lz9wCUN
         MAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1v61oqHX7c1CBf8OKtP/1BsjhM0sQc4mZ5MbznJNlJ0=;
        b=Pjf3gHF+unbEIqEUMM4nqckuheekkhKWKFcXOo6V8T6u6KyxcQNVM4tUbhwLfcs5s0
         aNFwSNuzGtvf5Vfu8xYuLVua7ONq+txV+uXAE/qyk5MCcqj/aajserfiPmET3RvyvhB8
         I109vsuKE6RZDSHM6FXdxKV8GgmoKdTpNL+CWuk9P4MYpz6mqyP4M8QEi/Mz9Rg234lo
         YwGs2xoMI8pit7aNRWoz3jsIlojbHzWvxmImWNpRuKXTPs9gnJOHAfaP5tIx+U09jnqG
         7l7QYvaZdm9zTo+CMNM6fS8dtocqeXStq2FJ4g1FQdOtRFCZUT+N63dPWt0bTxNLG7bm
         kNfg==
X-Gm-Message-State: APjAAAX5m4DVw5oQ/qTS8d6ZiNT5j1t6peNq8OFWowf47bCyMF/WJHFD
        JJ7Mygo4UaQvPNsjCQRrbkOwbopjA5x8RQqRPyuJFQ==
X-Google-Smtp-Source: APXvYqy0jVBhDi9Azmj3ALArw1NOW+akz5NAjVXoXrCyDmop7IqnpAqGcqKicSCXLw284lqovEhIGFR9WEBP47tW2+4=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr3271162ljg.37.1562363174296;
 Fri, 05 Jul 2019 14:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190705093031.18182-1-michael.wu@vatics.com> <CAMpxmJUzaEREeUxCu2BCV12Huv7K=yeUSKntA5RGMfOQbnxaFg@mail.gmail.com>
 <5DB475451BAA174CB158B5E897FC1525920E9FD0@MBS-6F-DAG.vivotek.tw>
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525920E9FD0@MBS-6F-DAG.vivotek.tw>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Jul 2019 23:46:02 +0200
Message-ID: <CACRpkda5QuuEJhMwSjJb-pqkKQsn6YpCysDLTx17__meZC52XQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low lineevent
To:     Michael.Wu@vatics.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        mvp.kutali@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 5, 2019 at 12:35 PM <Michael.Wu@vatics.com> wrote:

> For example, there is a button which drives level to be low when it is pushed, and drivers level to be high when it is released.
> We want to catch the event when the button is pushed.
>
> In user space we configure a line event with the following code:
>
> req.handleflags = GPIOHANDLE_REQUEST_INPUT;
> req.eventflags = GPIOEVENT_REQUEST_FALLING_EDGE;

But *THIS* is the case that should have
GPIOHANDLE_REQUEST_ACTIVE_LOW, because you push
the button to activate it (it is inactive when not pushed).

Also this should have GPIOEVENT_REQUEST_RISING_EDGE.

> Run the same logic on another board which the polarity of the button is inverted. The button drives level to be high when it is pushed.
> For the inverted level case, we have to add flag GPIOHANDLE_REQUEST_ACTIVE_LOW:
>
> req.handleflags = GPIOHANDLE_REQUEST_INPUT | GPIOHANDLE_REQUEST_ACTIVE_LOW;
> req.eventflags = GPIOEVENT_REQUEST_FALLING_EDGE;

This one should not be active low.

And also have GPIOEVENT_REQUEST_RISING_EDGE.

However I agree that the semantic should change as in the
patch, it makes most logical sense.

The reason it looks as it does is because GPIO line values
and interrupts are two separate subsystems inside the kernel
with their own flags (as you've seen).

But you are right, userspace has no idea about that and should
not have to care.

Yours,
Linus Walleij
