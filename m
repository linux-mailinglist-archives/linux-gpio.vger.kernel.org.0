Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE64D6008CE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJQIhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiJQIhX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:37:23 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FA82BC1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:37:22 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id u204so4983045vkb.13
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pj7Uc+fSGuW/+mV3e7UOaQy8Kb79Jdamd+/ilxCpkZw=;
        b=xiZlR3Pc5tBEzG91zAIHwuiZGKTyeUq9cEMI3/Xn2i3C7Iuf+pZglnH71uppem/8cK
         zwmHqSpGwhlQVxmTq2unMPgkYSWX1eD1A3YbTu2ZlQJzFQlZDxRxaylKJeHsmhlkVzwc
         EClQPPKQrh+gnwsYv+Ke3xGOwj78DuLWIgd9QVkQ4NqiCK/Zzfn/AGTdiqEmnecinhJg
         zJtplrZ+RqHiPspQoNIxjsPfzfz+TYLgQK9FFkLKnC9Q8kYTqYDH3cl5Reu4akdcixOg
         yDk7tDsvSyLHNgy+eUZCz1RapXamXRXPtBMYs8zIvZv17K9WSrccdhhEUg2P+rvZV3sp
         qazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pj7Uc+fSGuW/+mV3e7UOaQy8Kb79Jdamd+/ilxCpkZw=;
        b=5pJIVjKgC9DbzXWxscZN3wE2uTSt7mIOV8QEf+S4qCohyVPdYmd9iTfjOWN+iAT+Ig
         5edj4V3Kn8XS2U0gmnDxAkUBwsAebQIKnkVOOLirWRxiy0KFJhABcq2maDSJ80rPB9/s
         g1gnUppb5gL/mIZKI4vPxJ0wHYuSLwA1oCBlmEvCkSRVI3zDbWxDZCpGmzAkTw8O2h/J
         i7c9rldY82Q8ju8Hvdu+3gzInf+SmjDaUoFkeywHtNHfDxO/DrctkVispwKPnsYD7qF1
         QZAiSvjdL7b0G45/EShFJyYqXx143JSIUZ72r3qxkBHZJH4vDpBC6RhBzHbn/jB3hf0E
         Bolw==
X-Gm-Message-State: ACrzQf3GsmA10B7zbO/v60EbZD+dfNxSmxJ4I0TG1zgEosEFGSi3gIc8
        RtGOotMJw2KT1aYGjDl/f/Wn1S2Ga5S/UhGuOluIvg==
X-Google-Smtp-Source: AMsMyM5EZ2b9+Zx72MJSwKkYOy7MT/QARvjzpmiU3mdDvJS2ktuldu+FvRcODe0gy2jIi/6xnqW3k6EYXp/fkIQhiaA=
X-Received: by 2002:a1f:4843:0:b0:3ae:c4a3:d653 with SMTP id
 v64-20020a1f4843000000b003aec4a3d653mr3457835vka.1.1665995841549; Mon, 17 Oct
 2022 01:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221012142524.3920266-1-steve@sk2.org>
In-Reply-To: <20221012142524.3920266-1-steve@sk2.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 10:37:10 +0200
Message-ID: <CAMRc=MeVBJAcMx8pR5gY2j2LZcZqs6sP3XXnREXDd=5xKDbYkw@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpio: use simple i2c probe
To:     Stephen Kitt <steve@sk2.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 12, 2022 at 4:25 PM Stephen Kitt <steve@sk2.org> wrote:
>
> All these drivers have an i2c probe function which doesn't use the
> "struct i2c_device_id *id" parameter, so they can trivially be
> converted to the "probe_new" style of probe with a single argument.
>
> This is part of an ongoing transition to single-argument i2c probe
> functions. Old-style probe functions involve a call to i2c_match_id:
> in drivers/i2c/i2c-core-base.c,
>
>          /*
>           * When there are no more users of probe(),
>           * rename probe_new to probe.
>           */
>          if (driver->probe_new)
>                  status = driver->probe_new(client);
>          else if (driver->probe)
>                  status = driver->probe(client,
>                                         i2c_match_id(driver->id_table, client));
>          else
>                  status = -EINVAL;
>
> Drivers which don't need the second parameter can be declared using
> probe_new instead, avoiding the call to i2c_match_id. Drivers which do
> can still be converted to probe_new-style, calling i2c_match_id
> themselves (as is done currently for of_match_id).
>
> This change was done using the following Coccinelle script, and fixed
> up for whitespace changes:
>
> @ rule1 @
> identifier fn;
> identifier client, id;
> @@
>
> - static int fn(struct i2c_client *client, const struct i2c_device_id *id)
> + static int fn(struct i2c_client *client)
> {
> ...when != id
> }
>
> @ rule2 depends on rule1 @
> identifier rule1.fn;
> identifier driver;
> @@
>
> struct i2c_driver driver = {
> -       .probe
> +       .probe_new
>                 =
> (
>                    fn
> |
> -                  &fn
> +                  fn
> )
>                 ,
> };
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---

Applied, thanks!

Bart
