Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF258B5D3
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Aug 2022 16:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiHFOEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Aug 2022 10:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiHFOEl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Aug 2022 10:04:41 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6881146F
        for <linux-gpio@vger.kernel.org>; Sat,  6 Aug 2022 07:04:40 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id w6so3694228qkf.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 Aug 2022 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Gq5HkIuJS9gQXW4Gtj38Sy71IHlszcvfH3MmH9I1EiU=;
        b=ATJAMBOl3hZgngcQbICIJjqTQm0oJywoxGEGnDZpuVRRui4bxo7jB1Qc5dk5YzXxXd
         ASsRfZl/eMOqjz6wERHekZf6kWvac/CmWk9X/4J0f1oJzY5TO2ixLdT4532dMQieYOZm
         bedMZMH0u5z9C7ffXv9i7wZsBrrf7sSmYevxitYLWJpNtS4TnpBhRdSA6RSC17B0Alh8
         ngFD8iTb5CI6u33xkwkZYmj1GKohqKwvOrov4x8Z+9OApmUxyAFLzzd259X/kDXU+n5T
         /CxkiJDHXBFlus8hheK7rUFJ6YQyKuNqrlmNMuvOhCW65DNl1MwzA43spREp+EyE9YfM
         xnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Gq5HkIuJS9gQXW4Gtj38Sy71IHlszcvfH3MmH9I1EiU=;
        b=4HR/U1HadsEL3I6ug5+ff5nnKOq4YFXRiQb+qnPsFXTZeDHBW9/8vbMoV47EHHomKp
         mVPD5a+HfLVl/ogsmZh2OlGPb6rLkXiaHBN32HiORg6NnXuADt9rhgMxP0sCxKr2st2L
         5Dt9AAHqpVnaaaH5E6nGrpeyZ3y88Y5LVzg40WvNEJWVeGwLupPCaCjGjhqz2QC+y/CP
         eYPtuoPTcoGZD/mnYWT+eZiTlv8O/ScXWRsb6M+tfOP5KwpIjTi+7zvvaG32c/RL9Kxn
         GYgfzwRJ+jWKoHx5eygxH8g2xX+iaipPbOjIgXcuffvOM5/akz2zS4fTgpdXmq9Y06Ut
         l5QA==
X-Gm-Message-State: ACgBeo13VxceSWvTgXXmmJlbEWheGhwqjcPdnAMcPcYqMBH7/AdSrzVH
        9z2DL23VcdpKAnAjCmDx47fZHMwF+DBeZr33mRo=
X-Google-Smtp-Source: AA6agR50UiPpSL2xiBehHi9Ah2TcNTKukt+FHnk+RvdTfXyoi/AqH0zr4OXUUn7TsRh1e169wvx6DaN2E+QNFq9i++U=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr8791840qkp.504.1659794679393; Sat, 06
 Aug 2022 07:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4BcJPg@mail.gmail.com>
 <CAHp75Vd2dh5QDxAY-9N0xu6D0ywBcYnRL6FF5ZoKdqnnkBtAyg@mail.gmail.com> <20220806134052.GA26217@sol>
In-Reply-To: <20220806134052.GA26217@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 6 Aug 2022 16:04:02 +0200
Message-ID: <CAHp75VcZ8UxNiGKEq=uU5UFx+XK-B8zOjfChNqM9P-+Tf=dJAQ@mail.gmail.com>
Subject: Re: [libgpiod] How can I use PWM
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Robert Baumgartner <rbaumgar@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 6, 2022 at 3:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Sat, Aug 06, 2022 at 12:12:31PM +0200, Andy Shevchenko wrote:
> > On Fri, Aug 5, 2022 at 1:17 PM Robert Baumgartner <rbaumgar@redhat.com> wrote:

...

> > No, you haven't missed anything except Unix ideology. That ideology is
> > telling us that one tool for one thing, and in very featurable mode.
> > That said, lingpiod is exclusively for GPIO ABI between kernel and
> > user space. For PWM you need to access the PWM ABI in a way how it's
> > represented by the Linux kernel. I believe there are plenty of
> > libraries more or less okayish for that purpose, but I never heard
> > about any official library and/or Python bindings for it.
>
> I'm assuming Robert is refering to software PWM.

I don't think so. The article he referenced clearly tells about two
(hardware!) PWMs.

> AFAIAA Rpi.GPIO doesn't
> support hardware PWM, and the referenced article also refers to software
> PWM for the Python case.
>
> libgpiod doesn't directly support software PWM, but it is fairly
> straight forward to implement yourself using libgpiod.

Hmm... I was under the impression that we have pwm-gpio in the
kernel... Can't find quickly if there is one.

-- 
With Best Regards,
Andy Shevchenko
