Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0D7582524
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 13:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiG0LGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 07:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiG0LGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 07:06:42 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9CAD116
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 04:06:41 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id n13so8679919ilk.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ABGb0WqW1DwsVuQ44Y8Y8HBVhISiF+0TkAChAae7ARU=;
        b=SFFc7ilQ6ECIVwuDOSYnL/7p/vBkj7hJtdlAWYotoauzEhyDKXIZh8WcCWlKYn15E+
         dJ2haQXt89x5TIRt+aUjrdkeH0qM57dNqmUWrfqCaA3OklUtjBFvScwF4zn1JzoNyGSW
         ZMgb4dQ8x1PGer/DAET4I9TDJXroHzSh31iijPBDmcv0eToJNuaOMqv+dN3SsvtUjWZN
         L7AhkD7NzfWcDyBvwvqVR5qFEFGQB6qMXevuWnycAWZXzCOzazLnY4iuXU//OzoLxw8I
         WFHDjtz9n1mDQD+qBy6TyR4E0FTGHaKbS7JYRC6pvYwi2zxArpdg/30CPUiqju5qQU2s
         7h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ABGb0WqW1DwsVuQ44Y8Y8HBVhISiF+0TkAChAae7ARU=;
        b=TfV7TWCtbUZbQnOmalYnm6NUiozM5iimsVir2o2FpkBXGOoOK68ErTmGC6NOSqaQgv
         QfTU8uM6gKBfaf4pncNWdQK3x465cPX2sbKamIee7yt+Cyn4EYkanz6mdwWqcPh+iWbG
         1lgm8FPBxe0qFpXyzO3zzw/4Jw/K95lFj5f89yc/N/8gw9O+thvpRstxH+fTmQpbkXd5
         +bBCb3ltx+63r+l5NDrWBCcTdEi9OHPafEiRFEYZwJXlohKrLfS4IPYAddC6cRUG5xOF
         H4T2mk4jpwP4Y5S4oP4cFfHEFhyPWUvSUUX3pOCadHvmLQisDW5s+75z2vNGl/a0visz
         mPWg==
X-Gm-Message-State: AJIora+9lsd7Dx5sz4MVIUA3ObqldBE/Q903XETp84vHjdKRbiN3kl4M
        bjSbhMmWBVRda9LST3EwT5Tw4YGTW55puyjRSQU=
X-Google-Smtp-Source: AGRyM1uRmi2mK7y0JU588kTHY8bef+e85WaPPFGjEzp8YgtJqS9cqUIHrivuAaA82NUF5SGwxj+cqKwKs/kKUuhRMkw=
X-Received: by 2002:a05:6e02:17c6:b0:2dd:d9dc:6387 with SMTP id
 z6-20020a056e0217c600b002ddd9dc6387mr208864ilu.321.1658920000023; Wed, 27 Jul
 2022 04:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol> <20220727090701.hfgv2thsd2w36wyg@vireshk-i7> <20220727100809.GB117252@sol>
In-Reply-To: <20220727100809.GB117252@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 27 Jul 2022 13:06:28 +0200
Message-ID: <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 12:08 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> It should never return NULL.  At the moment.
> I would prefer to have NULL checks for all cases, not assume anything
> about the C implementation, and to be consistent with other places
> where you do NULL checks.  As it stands when I see this I need to go check
> the C to see if this is a reasonable exception or not.  And I'm lazy.

Ideally the C side would document the guarantees explicitly instead,
and then the Rust side can rely on them.

In any case, if a given C API never returned an invalid pointer and
suddenly it starts doing so in some cases, I would consider that a
breaking change in practice, which would likely break C users too.

A potential compromise meanwhile is `debug_assert!` to at least test
those assumptions.

Cheers,
Miguel
