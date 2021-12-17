Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE59A478910
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 11:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhLQKig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 05:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbhLQKig (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 05:38:36 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D2FC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:38:36 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id x6so2177889iol.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1NX/z1yIBmJGPFjey8JIOWaLcMKRl6k7AS9cDOmNB+I=;
        b=oWhT587UbEaa4Qh0rD9kz7S3vhUesiNS/RqKp/44Jz37X83GW8Sl7ig5aLP7gLhKR8
         vxBaYz6cUZ7Abi7X1AQkgemuKsfo9FwGbiWSRUpWzUBDJeLTHF8eUvz2kt/k1YKq3o48
         mGtrwDR8/5vxzpxnGQQSMVotVebl0tt7Qinazi1N6mfyKnwBn+wB7SXhKv8F837ThUZ5
         CvcFHwzSq/VNFmqRapz3ASZUIUixI9Q63IOKLrNWfNg7TfHyikSRRc/l5XIinqmx7ggs
         rMFzux6Y4/WAV85NO6uFnLGPT5uoBHV/pppdEZsV4CF8rI8NrlUF6OJF8ALiFRPp73nN
         LCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1NX/z1yIBmJGPFjey8JIOWaLcMKRl6k7AS9cDOmNB+I=;
        b=7oRb8Bh0miMQZpL+c+w2GkeWMqY7asVAbHADGqh0MY+SLiph6nMc4srJ4JMHd4iBLC
         rlGgtuNvI/+6kJJ0b0/9JtIazTaKuv7VV4suQED+lqL1WAsknkTc3BfHTUmnp9hsOi95
         a1kUTY524yd91/Fp2uM94tc+O8ixaxTAOYotOqk2lwcGF/UVUTYPIjGjFYGiu6lsoev3
         c21Z7vo+mMaENXHC5ggXUdmDQaVq48IUdE0mlr+Orr0SYvskMbNDgvgh/3LPuv7CY6/w
         ovzLAn1wH56Utxe0H84PhyzfxDCJRRSNBbFnnm9ao5ts7P6fHDSGUriN8Mk7xjy+HHY0
         OibQ==
X-Gm-Message-State: AOAM531RbJyLA9KJE5PBfug4BgXjkqhVZjCtR4WBqnOVZZS/jY/qcU5A
        qQNLc3juVkJvk0gUwj+RUdacaihvR9X23vOGTdQ=
X-Google-Smtp-Source: ABdhPJzljBYOKdmb6eXIGFq8yZ29GGLgW4+bL2WnToTpGLBi4Ya3UyHmQk9Hp9LbcfcDDyDNsUNomrrmUVh59SdALxU=
X-Received: by 2002:a05:6638:1920:: with SMTP id p32mr1326759jal.199.1639737515602;
 Fri, 17 Dec 2021 02:38:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
 <20211217055001.535wscahbxfkrxn5@vireshk-i7>
In-Reply-To: <20211217055001.535wscahbxfkrxn5@vireshk-i7>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 Dec 2021 11:38:24 +0100
Message-ID: <CANiq72nimetRmi+aHF1h+hqvSjFJxVXsBYKQHUEnTQ50Lp5eqw@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Gerard Ryan <g.m0n3y.2503@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 6:50 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> I don't have a strong preference either way, whatever works best.
>
> Miguel, any suggestions ?

Having optional pre-generated bindings may be good for some users,
e.g. libsqlite3-sys does it. I guess the main question is whether you
are willing to support/maintain it. Also consider cross-compilation.

But I wouldn't only provide pre-generated ones if you are using
`bindgen` anyway.

In any case, I am not a Rust expert, so please take that with a grain of salt :)

Cheers,
Miguel
