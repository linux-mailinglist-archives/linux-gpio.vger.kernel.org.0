Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEE58274F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 15:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbiG0NCY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 09:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbiG0NCX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 09:02:23 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EA522BCB
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:02:22 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id 1so8777166ill.11
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mt7SoM2qly7eYCz/tKUT1oowhKtCEgMbkbpP+gUBT+U=;
        b=YtMbnPEak3Ez0RAApBy1Tfe0NN3gXp1Iz7tQr5htwTnmEB/GJXqVK9gZj1k4TZKsHI
         x4qwHZQJ3QIHz697zm+g0PPloZFgnIGUtynCrj+1+y99B7FKA2faep6XSJnz5rFcCMlJ
         7o4oIhMw+BQcxclssl5z44DgJ5PnUKITN8vpdByWaMM6KRdKhfA8W3Mdt5wMfxqsaG59
         mNktyul4dwbDemdUqffiLuisvWefSg8anOiEZPnsrprhsBB3KM9qn2zEf0nr1Zp2ACK2
         p5TieBmNkstSsuUyjCscJD2zVqPyv50EC+Jr6vLv4wVvqe4LQRRThzXEE+QQrFs5pylB
         Hj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mt7SoM2qly7eYCz/tKUT1oowhKtCEgMbkbpP+gUBT+U=;
        b=DheGaaSmrJhk8D+JT3h2mkDXOXDspCgyfdcBgSwSQGdLYcv6uz1r9Mx8C8A7eHpqEJ
         H5CnqVDUeTGyhrS/BKXaWPMfwZDpZrbfs5p4WOymEuRgx7y+OwMCSlkuxt4or4oENVJO
         Fesrciz6ugb7VKLsF0xfE41copFspnrahFIL9RkTDjhsQ41ZzEwiKpUnZL719NlXtI2Y
         47bZqg645oe1p7oy2ExTOH3RglvicHWNmTRJt2vPpPZaZgNKo3in18RCp6xP8gdAck4W
         L0e68Jn0Y/KplsGzpExxln8+Aapd7WfRIdHZnUHPEfYSxU9xm3LKeKA4hZcZD3s9/Ir1
         oQpg==
X-Gm-Message-State: AJIora/+TvWt62IE4oJRETgX3uifpEIMOvywgqTuie6JVF3kO8v8Ar3g
        +vq4tW8DSkhKPApMInTSadMbZL+XANaRhQJ8gVs=
X-Google-Smtp-Source: AGRyM1vo7iH9C6KCI2V4QzYg3uKw+V23MEgrjuWuCHTq8/jQNuyWSmXRzvzUVEH//3hxTJANVq79tMKUUg9yBmg/Fw8=
X-Received: by 2002:a05:6e02:1687:b0:2dd:c6b9:eabe with SMTP id
 f7-20020a056e02168700b002ddc6b9eabemr1167564ila.72.1658926941768; Wed, 27 Jul
 2022 06:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol> <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol> <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
 <20220727124051.GA130052@sol>
In-Reply-To: <20220727124051.GA130052@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 27 Jul 2022 15:02:10 +0200
Message-ID: <CANiq72nGS492exNopKBZnbS72A4jaCYHAV_faSaMDuqE2P23=g@mail.gmail.com>
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

On Wed, Jul 27, 2022 at 2:40 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Unfortunately the C header doesn't currently provide any guarantee -
> except in the cases where it CAN return NULL.
> But we can fix that.

Yeah, fixing that is what I was suggesting, since it is a possibility
here, and would improve things for C users too.

> Not sure I'm onboard with that.  Unless the API has a contract not to
> return a NULL then it is free to at a later date. The user should
> always assume that NULL is a possibility, even if they have never seen
> one.
>
> But in practice you are probably right.

I definitely agree that a client should aim to avoid assuming anything.

However, if we are strict, given C pointers are unconstrained, all
pointers would be useless unless told otherwise, because checking for
NULL is not a guarantee of validity either.

Also, if an C API just says "returns the name", for instance, it is
reasonable to assume it is a valid name because it is not said
otherwise (e.g. it does not say "returns the name, if available" nor
"returns an optional name").

And, of course, eventually consumers will end up relying on your
particular implementation no matter what, and returning invalid
pointers where there weren't before is a very dangerous idea for a C
library.

> I'd be fine with that.
> I'd also be satisfied with a comment in the Rust that the C guarantees a
> non-NULL where that is the case.  That would at least demonstrate that the
> possibility has been duly considered.

I think the current `SAFETY` comment already intends to imply that,
but yeah, it could be clarified.

In any case, I would say it always returns a valid pointer, not
"non-NULL", since the latter does not really show it is a valid
pointer (it could point to a non-NULL, bad address).

Cheers,
Miguel
