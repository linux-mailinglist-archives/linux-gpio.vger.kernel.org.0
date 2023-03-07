Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1296ADAF6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 10:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjCGJwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 04:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjCGJwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 04:52:31 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B3C5FF3;
        Tue,  7 Mar 2023 01:52:22 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id z6so13762003qtv.0;
        Tue, 07 Mar 2023 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678182741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx1eI/3pX4qAVuxyfQQ+ql/WCt+8R1r3uPbQEluVNMU=;
        b=LcXLnMyfjXuWXgCSztsEr9XjcUEm6UlsvMh/v3kMcZKaUnBLQZWMw1AOVYMecjtVVc
         Kox7HT1URWy8LZV9by7gFztGHc4L748psfPp+x53xU4P4/0pkJT44yAC4D+KkHGqW18Y
         hHaxaBJTMELkfMJFPBkYOOReuIbE1nfS+GBQnr/2Uv4kRmWbttR2QN5Unh3jAp6GHJ5T
         VaCWxQt5f5+sC78QJjX9F+eoi41CVg9YB8J0OiC4YSieLtsyZlKDaPBYxcLCjzIL87Gx
         B/+M+P07+DtkfqMhanWfW/ndyLzk6gdK+blxNwGRGs1ixXR5Sa0t14CXojqsq5McPNaJ
         +rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx1eI/3pX4qAVuxyfQQ+ql/WCt+8R1r3uPbQEluVNMU=;
        b=BBfnxxJQmtTrB74buQB7dEOQ5G47Sec2HQu83ulRWhl7Q/w5SpHLXZZjqtCocMhTki
         TyWi3zrNgkEXk+cm+TRKXps2eUyOfemxpkwLJxxgw1AZ1Hw3RVAu7+IPmw7uCnn+hEWN
         WH/feUL3FLf5oRtqtA5RT69KpUqlY1SI8d0mwYiq6suajPKGu3HNByY4Qqh7oaPHa/AE
         8XnFuakcUwMvuWjzY4fdpnk0N91MeWpv+2MNGwHXhsRrG1MDwyHAXMxTufgkKqwqpbT5
         zJQrkVqozKgqQ/6Dod2GMjTl7Gb5kfN8MxzkbPdZcgRS9bk16jkYt9cEAgFnK+Uh1s1y
         7/wA==
X-Gm-Message-State: AO0yUKVu5HV83zdzdrpO5BtfTteFVSulJOiXpgNLmSMW5e8iKLZnwAh/
        NuXDBaktyKTsah7SmRq9SLqDVFzQGYy7ytUoqA8=
X-Google-Smtp-Source: AK7set9F4kwiaeVHQDGDxOFAkhdjsiZq9/Bx9HfAbAWklJLmlQxh8p4T+cFCFdTl++7+UX2zDShuAqOQEMNjpuAL8T8=
X-Received: by 2002:ac8:435a:0:b0:3bf:c418:d1f3 with SMTP id
 a26-20020ac8435a000000b003bfc418d1f3mr4203984qtn.1.1678182740557; Tue, 07 Mar
 2023 01:52:20 -0800 (PST)
MIME-Version: 1.0
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com> <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
 <ZAZqy+LFkZuj+T4P@surfacebook> <e4cdd1f9-fc79-4f91-a4df-ab5f5a94faa3@app.fastmail.com>
In-Reply-To: <e4cdd1f9-fc79-4f91-a4df-ab5f5a94faa3@app.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 7 Mar 2023 11:51:44 +0200
Message-ID: <CAHp75Vds2cLoTciFdQmEZsXsS0ND_HJmn1MNm6hsApFazkFAHg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 10:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Mon, Mar 6, 2023, at 23:35, andy.shevchenko@gmail.com wrote:
> > Mon, Mar 06, 2023 at 10:50:40PM +0100, Linus Walleij kirjoitti:
> >> On Mon, Mar 6, 2023 at 4:14=E2=80=AFPM Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> wrote:
> >>
> >> > Hi Linux GPIO maintainers et al.,
> >> >
> >> > Combined series to clean up headers in the GPIO library and drivers.
> >> > Along with it, drop a few unused legacy APIs.
> >> >
> >> > This tag is immutable, enjoy!
> >>
> >> Thanks for coordinating and getting this sorted and tested Andy, perfe=
ct
> >> job as always!
> >
> > You're welcome!
> >
> >> > intel-gpio for v6.3-1
> >>
> >> But I think you mean it for v6.4?
> >
> > Well, techically speaking it didn't make v6.3-rc1 due to cross-dependen=
cies.
> > Starting from it it may be applied to v6.3 or to v6.4.
> >
> > Up to you and Bart, but I prefer not to rebrand the tag, if it's an opt=
ion.
>
> I think it was clear that this would not make it into 6.3 after
> the decision to rebase on top of 6.3-rc1. However, the tag name
> and description both look like they make sense for 6.4 the way
> you wrote them.

Okay, I will rre-tag this.

--=20
With Best Regards,
Andy Shevchenko
