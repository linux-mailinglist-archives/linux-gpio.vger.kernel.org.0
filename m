Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC4A576D2B
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 11:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiGPJnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 05:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiGPJnW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 05:43:22 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A755218E
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 02:43:18 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id n138so4337160iod.4
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=teF0yKuKH+aTEKWziJBN6Uk4uQ+VT+Ov4XQmliQLJ7Y=;
        b=SmjQNEGg8DrWjdK/I4L14pWE2JWWKB7b7TJLctQ/ULV+DiiCrPnZ+hpea0h9lT7WpK
         Zctm+bOJgid/biqdyvNHcADQn+SBQ+xXJQH/UOiF+vvh6CXkNezG+FP25ZI+qTBEGPrd
         C9/A5Y8AlXDt4Xd34e8EIKRAsnvMZawp1+Ds/rt3Lg8zXcDbA03VBexaSTdNjbs30fre
         hyPe7xaR5H8Zf/MuhVy0zmTNiGI06y1LRtEHvmSB87dA4lqDpymuQ+b1VyNBrRbjaLWj
         4X/4i7D/IHCjJVx8jj2EeHYyoEBx+jX1SiKYbKTOJKE+ayPYLBGIZ+zJXqJjzx4ONRrU
         XV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=teF0yKuKH+aTEKWziJBN6Uk4uQ+VT+Ov4XQmliQLJ7Y=;
        b=14o4ayeLRILi70WK3SCp53QeP8MEiQWJRGSJ1oOVOnjsD9mEYEGNXGiciR0KlmVNVR
         f43TK1MXI7FKqx4gbL3M9ZFBjysGHvAYDVpBy7njt0uFviuaBBDPq7YEWtBFamHOX+5v
         aP0CYf8bwHex9AyuQz0rsk2cxw5plJ1Z3aafNGhSM2wGbo/74oxqTkdxuUBvmHrRVgeP
         Xpznpd6mqbDOgLBV+IF74rNi3QT24fu++FDG89QMiSuqicMoPQgHqbOy8z81YnmwRxdf
         mKXQ8+FHi4Ozw4utttSIlYWlGjtu3KhZ5QNIR/P2tHmt4/+b3sX9neyilmS9DoAGtkN7
         EI6Q==
X-Gm-Message-State: AJIora9jSrynI95RM7Fp2K1uGbIF+cxnu/8C3Z8MFBWbLRRH3sS3t4+j
        ThAvbHapCyD9QRUOscANeGPVF9/FHiIxb6INU28=
X-Google-Smtp-Source: AGRyM1ufbCrUGd9sdOhLbkY9hMndpBkYhdAZmz0NMgns1ePzqNmr2/dh9ZjPDPOHRHDbx4n9lQZG8ca01TLOtRHkxLY=
X-Received: by 2002:a05:6638:dd1:b0:341:5666:dd0a with SMTP id
 m17-20020a0566380dd100b003415666dd0amr1985309jaj.199.1657964598154; Sat, 16
 Jul 2022 02:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
 <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com> <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com>
In-Reply-To: <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 16 Jul 2022 11:43:07 +0200
Message-ID: <CANiq72=9ARaKRdszvbfC4fr3BkYQz8r6tjTYzkOr9EsN5xma-A@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Jul 15, 2022 at 9:27 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> something like `cargo --no-run` as a normal user).

Sorry, that was intended to be `cargo test --no-run` (and the test
binary will be in `target/debug/deps`). Also note that is only for the
unit tests, though, not doctests. It can get more involved for those
if you want to avoid to run Cargo/rustdoc as root.

Hope that helps!

Cheers,
Miguel
