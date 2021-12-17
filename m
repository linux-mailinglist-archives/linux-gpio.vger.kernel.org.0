Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AA14786CB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbhLQJMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhLQJMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:12:18 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6467C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:12:17 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z5so5337983edd.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGxu1cPtauwhcvy69+8aHUEhmZAIfYYDtaaz2aRZQ2Q=;
        b=HGY3ndlnRYsk8hhJfzCciR2F5hTDjOMsNKelKg2hpO2+ymZ935FPG1MOqB7//x5NyZ
         UJDzGE27FeKjAiLNBUNqXsjmSUvwlvZs42Jd9eaYPRQre97Fg7W2fZQvvFBhqqTnaVp0
         0iswNvXQUO836MAh3V0CuJQJffIJw78YsQA5CigvTqnW0Wz6PpRSzZVXgF462tEfQg6z
         LV9i2IfOO4Mc/dIDx3bVukUmTwHlgxZNkfrmH0xnrxQJgs9lreW2EOpcO3AHd2L7LHju
         zdCr86vHRd0dFqSWU9Z+byU5PnzZyekp+J2G6ahq4W91CNY3z7Wd+pWOsg5fVnB0PwgN
         1pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGxu1cPtauwhcvy69+8aHUEhmZAIfYYDtaaz2aRZQ2Q=;
        b=kmYtCEQFrAwS5Ra4+O8dJzbSvDReU+53MUx1y5jP9l2KwdFV3IvYqbNlu3vnIJ1Bfc
         StXgXI3oFro3KKQNqc2oJVSyBLt4qI/oLqIC9vE3lbems013K9rDfQVLO3J/Opq6kAL6
         WN8xYmLKwcqlGUymPAMuhWNDptWhze+waSQZb9W4CKormCnXXApI57j5ilXMSMm3tl7H
         SsdsjdSD8fyri/HrTgXaqfauF5jiqjgsmuusRbEiiyip53STCMH58hV3BZeLAosGIQEW
         aqnzpFS6uNlmPQV9WsHu0p9NOlij8eTx/SNGczhax1rvYXNofSFBH527r+gSEwHq7MGt
         m+Ig==
X-Gm-Message-State: AOAM532DPNVA7dfJHq24CuO2BX4OSlQ6qb41DEdVN30ejVrCnQMx69jt
        R65I1CzF0ZjAIop+wg1G9dqnfFGL+BYtyyo8NXeK1A==
X-Google-Smtp-Source: ABdhPJyykOp0SYLVxr1fYWi3jBljnOObx1gqR4BCNXj0bMp4V0XxYGRt14xAP0TxlvaCQJwUVO5UeCFkKO8cVBKLz8I=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr1818403ejb.492.1639732336198;
 Fri, 17 Dec 2021 01:12:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com> <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
In-Reply-To: <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 10:12:05 +0100
Message-ID: <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 6:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>

[snip]

>
> +impl Drop for GpiodEdgeEvent {
> +    /// Free the edge event object and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { bindings::gpiod_edge_event_free(self.event) }
> +    }
> +}
>
> While testing this I found a bug few days back and I wonder why
> gpiod_edge_event_free() even exists. The memory for "events" is allocated with
> the buffer and gpiod_edge_event_free() shouldn't try to free a part of that.
> This looks buggy.
>
> Yes I realize that the edge event shouldn't exist past the buffer itself, I will
> try to fix it in a Rusty way (maybe with Arc or something else).
>

No, it's a different story altogether. In C the buffer allocates
memory for events and when you "get" an event, you only have a pointer
to the memory space in the buffer that you must not free. But you can
"copy" an event with gpiod_edge_event_copy() which returns you a deep
copy of the event that will survive the parent and that must be freed
with gpiod_edge_event_free(). This is done so that by default we try
to limit the number of allocations (as there can be a lot of events)
unless the user decides to manually copy the event.

In C++ I used that mechanism together with the buffer's const
event_get() and event's copy assignment operator. "Getting" an event
returns a const reference to the event (still in buffer's memory) but
copying it triggers a deep copy. The memory management is of course
handled by the destructor.

This is not used in Python as speed is no longer a concern and we'd be
creating new python objects anyway. But in Rust, I think it makes
sense to reuse this mechanism.

Bart
