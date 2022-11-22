Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0896B634450
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 20:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbiKVTIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 14:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234478AbiKVTIQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 14:08:16 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AE913DC2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 11:08:15 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a19so3065094uan.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 11:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3i0puDYuQfNg42mrqEO5a8y7CMQy6Tgfm5+1RaPhGaM=;
        b=B1vpTyk9mVifiOdom6HSphwjv6KC98MMhODUUNmjxEkIOQh9fIL0QkxlFfgQn1kRcr
         g3vINaAZUZcSgaxlP2Fq+jloeF2Z8c0JUodMMrmWrBKlfjK2CNNY8JMHJQbqSJmeAsIH
         roe1I48o8zaxqkIfWpYuhQIzXAdbepnaSScvVePSAFrIMt7zP6YldIx2vrDC1sW2xnTA
         Fakicjj2KavA3q+M5oa6d7Iot78JFANW/aK3cCioPLAKstZTtqbzH41LYoohQIMEg3We
         YHXje8TMsyDxnnzk7kTQKTTVYXg3vY3BaHkDCJ6YDZNBnZGeJSEB/GBAP5OBUCD0N2IC
         u6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3i0puDYuQfNg42mrqEO5a8y7CMQy6Tgfm5+1RaPhGaM=;
        b=K91RDy0OqAvxOatU8uUCZ3zWYEdSP58doq1mdlfKw/WqWTNKp/ThKAHMILrf1lwl2G
         k0L8Y+hc2xNI0T1ZPCTvzjNC5W9kv07OkW+wGeWcqucqsVc06TdRcFpv2O1fkl4N12Bc
         iF59Jayrw5E00CoVZLZi6hNJbCbzkiDbkflye0kP1BaIU2u7LbgRwso/U0lDFhij9nCo
         SCxmJus9e4QIA4eU/u3S5OLuqyRGKskHpYpyJIbSXPtHQWAHFNThKgVBthcSJeLKNBsE
         lNbbn5b/hgBJOLICMGGlz/oEABSGQMwko/F9u5gXBkyk7U7bZbqrAB/ctRtvgojKNEmZ
         DhMA==
X-Gm-Message-State: ANoB5pkafZt5kVTMQJumDIXiP2lumXChaRZEuuytna4ZHf2OKXZQkZPe
        zLv7ws5xNLwzJ1Igxj4TBwClmYQcngwuRuZoPtWv1q3MKxF2cQ==
X-Google-Smtp-Source: AA0mqf66OKaz+9v8vRUOUfBV4c0TLWP/Tr26f4Us6GPSEkoQa5VOgvfYiY7JcuIxCbuUcbl9jiAnHUEuRkzQLPLQTcU=
X-Received: by 2002:ab0:5a6e:0:b0:415:715c:1e70 with SMTP id
 m43-20020ab05a6e000000b00415715c1e70mr5871893uad.81.1669144094395; Tue, 22
 Nov 2022 11:08:14 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
In-Reply-To: <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Nov 2022 20:08:03 +0100
Message-ID: <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 5:55 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Nov 22, 2022 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > ---
> > The expression that defines the value of an enumeration constant shall
> > be an integer constant expression that has a value representable as an
> > int.
> > ---
> >
> > and virtually all compilers store enum variables as signed integers,
>
> I don't think this is true. Both GCC and Clang seem to pick an
> unsigned one if possible (for the enum, not the constants), e.g.
> https://godbolt.org/z/6zjzMdP3T. I assume bindgen is using the one
> decided by clang.
>
> Note that the quote of the standard is a constraint, i.e. the values
> of the constants need to fit in an `int` (and the compiler is required
> to issue a diagnostic if they don't, under `-Wpedantic` in GCC/Clang).
>
> > As enums are naturally signed integers in the C world - can we somehow
> > make bindgen default to c_int for all enum types?
>
> This would be https://github.com/rust-lang/rust-bindgen/issues/1966,
> where it has been suggested as an option (as well as the fact that the
> constants are not being generated as `c_int`).
>

IIUC this is not done yet.

Viresh' code makes the assumption that all Enums are unsigned
integers. This would be easy to just convert to signed ints but having
both types supported seems impossible. For instance there's the
InvalidEnumValue error that takes an u32. There are more instances
where the enum's type matters.

What should I do in this case to accommodate two types for enums? I'm
bad at rust so I don't even know. In C++ I'd probably use templates if
I had this problem. So generics?

Bart
