Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2933662D4D9
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 09:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbiKQIMT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 03:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239514AbiKQIMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 03:12:18 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8069A716F6
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:12:17 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id gv23so3190634ejb.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FiU7Eq6jXT/m239rEGnfO/ZiRCRlj6sZWaRINJ254OU=;
        b=Oe689WgjI7H9R5QocGVV3gt7I0HFgsFuQgqM4K4JoXGsaKZzTPK3sYi3un27nx/c5U
         /mmoEYHq4c5L4gop3ZoAiCcfcYdJ7Gx0YyNiHgCrbJ9VaagbE9+ulZe9aux6y4acc6Zc
         zXEOUj7X3M3HAONXXFNpvuQMunF1Dv0fzu5/2h1s/MGu8yfXyyTPRfAeyykbwOt0B1TA
         5XbK1pFVWQxXiB+BVtUEgLXmy/Fx8NNSZpKVdCnCoFFJHRohQcX0liKbuTKBeDL5QDN5
         dxWLh1MKNw9TcIFHiaPFdJovNt5tqbOvZSNo7YSyllTa2J4DHE4ZYHCW0XrWSQu2YWTd
         bsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiU7Eq6jXT/m239rEGnfO/ZiRCRlj6sZWaRINJ254OU=;
        b=ooU6jK2sV5z+y7QjkUwOl241AeUDEvz6Jfr8WMYiOJCDZ5SLV6hdNhAbhTSkpl+DOe
         VWZ/+KZw/5Eqxj/HqZlujOJuV+XSRghbQb2uXM4TKqSxgFSHFCtvqe99CthtcJVxza9H
         tXgK/hEbQMQK6WRHNcoQpNr/2tSSdUMVE+eJ4u3H3Nabsmb14G2CJ4XiGCnH8qbBgqPI
         E6uig8/Znw/OwldqsBkst2v873GpSMtUoVVGAQ5QHEU5jQJF8puZtuaBBGj3VJOmJMni
         1heCvZM3q/LH5jdGZ1VptYTsfkGkVdi2CO6g3ve0RTKhmMEBLEx+nVOjsQIj2y1cGr2Q
         8fsw==
X-Gm-Message-State: ANoB5pkELMBTTaT5X5A5yD2BsVczhW+2cJN19ApiZ30tNkLC59XRIbhZ
        Kct6gxNlsp5mRyvFz/UemMSDOtFRWGpIi7R1srhZYg==
X-Google-Smtp-Source: AA0mqf4KRZpdHu4S/37aYands8arYQ8n8paFtH0vi10/OyNAYTwpV2wKVNO5nvoV+8L6Vi6kLksV1bSxsumHrEEtL3E=
X-Received: by 2002:a17:906:ce35:b0:7ae:215:2dd5 with SMTP id
 sd21-20020a170906ce3500b007ae02152dd5mr1244640ejb.208.1668672736082; Thu, 17
 Nov 2022 00:12:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
In-Reply-To: <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Nov 2022 09:12:04 +0100
Message-ID: <CACRpkdbD0M6WXKR6tmYfkxdTzYB5jFCFf-hqUG8_mm+HgC0=5A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 11:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> One other thing is the license of the rust bindings themselves - I'm
> not a lawyer but it seems to me that if you link against LGPL code
> statically, your code must be licensed under an LGPL-compatible
> license.

Nope. The LGPL was created exactly for clarifying and avoiding that
situation.

https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License

It is a common misunderstanding that GPL overall has anything to do
with whether you link things this or that way, the legal term used is
"derivative work" and the meaning of that can only be determined in
court. The meaning can depend on the intent of the author and misc
legal ramifications.

In many ways LGPL is unnecessary, but it was created exactly to make
non-legal people less weary about situations relating to linking of
libraries.

It is fine to link an LGPL statically into whatever software, but one needs
to provide header files and linkable static objects (.a files) of the library
to the user.

Yours,
Linus Walleij
