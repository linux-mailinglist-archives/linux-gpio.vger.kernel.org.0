Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFFD357E1C7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 14:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbiGVM7g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 08:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiGVM7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 08:59:35 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A50E167CC
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 05:59:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id b11so8387451eju.10
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tvJj1tUkldyVjIP7ThgoGlAua0P9TBuVlSdTpGbTPPM=;
        b=nerPTAzhfdo8L1KKvewWcLPJGeM8UMLkOmXyq4EwAra/XYbpoKum7TbBPpw7wR8ojE
         jfNU91bsV4uBLCr3Zc+3c25Op1+GNLqEnC7aXwd0oKO4jPvtgwvixOD9vgFaEjhR2AwP
         ynh5L8thXIztmLzZ2V4nuaXBo4iXzOakPJnOScls0W9QQ1BgSkHQ+G/NG0f9ecE6Zmcv
         rCsRWkE8F/BeFJp0mzU99Pg3GvwXOkGw7pC1biTU8vp2L9yXqGl3ZfGpW4vMpf+y+CnO
         xalTlJzhb9N86eFSlMslLVd/roLswrA+/QuANuPV0QtoSYBzELBI9vh7NhV8e0T+yjH3
         EOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tvJj1tUkldyVjIP7ThgoGlAua0P9TBuVlSdTpGbTPPM=;
        b=wxIaIZgcue2nRnCAaJTDapmjsYsaUkZ3PM5PALlYly5cHyJTPdr6pC9leYENAQJRrO
         vkDAqjKhy3/k74pfjQhFBtP3COb8ZQw6z+j4dVfcKVMTZrOJSkk0cVt2n2Px3SkCBzJm
         YvfvHSlvVselr4CpRB8SEUCjpLNY0pLf5TQKl5TvIot4n5fkG6WQ3/dHuweNMXB4w1pm
         T6JWAEjdViTKEkeZw1tYr/sUvwiJv5G3dvwrFr+bQD8PCe1Lbxg51tsMBjwmfH5guSdS
         KMPVlKVipa3YVM1w1xPhgKRxZd7qsYoHv2FLdVz9ovoFnMTFJjhiIWPCc7c/PY4z+kud
         2TUg==
X-Gm-Message-State: AJIora+42fLvgSjlXpfFv1UwU/ulQpdV1VjuURP70Y0dIWXQ0Ww95M7w
        6Zz8a1Ug5kjNCgTBd7ppPFS3+uS3PR8MBbPk0BP57w==
X-Google-Smtp-Source: AGRyM1spfKGz5y/Zx0Vo96zul1pRdccCoAxkucCGhodRFgTbybKpqnp8oAn9aB3PL0Y9KtI/p/bH+zlgNrFqHWr4EAY=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr405223ejc.440.1658494772847; Fri, 22
 Jul 2022 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEBpM+ZPZNpJNJAU=2iji8+dCnLEcordRLwH3-mKhYqWS_zr6Q@mail.gmail.com>
 <CACRpkdbVRm7SdCPm-RP7pD2v7ce+i+kSh05wdFsmMmBbDk+1YA@mail.gmail.com> <CAEBpM+ZDiCD7Y5au9ng4iaptbQEHMXwUFLY370_uVBKCjsR+EA@mail.gmail.com>
In-Reply-To: <CAEBpM+ZDiCD7Y5au9ng4iaptbQEHMXwUFLY370_uVBKCjsR+EA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jul 2022 14:59:21 +0200
Message-ID: <CACRpkdZ139Dhonh82Zs_DGewb3KkocpU7yE5wuhukm=TfZBkOw@mail.gmail.com>
Subject: Re: To write Java binding for libgpiod - need help with looking for references
To:     Meena M <scientistartist@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 20, 2022 at 11:37 AM Meena M <scientistartist@gmail.com> wrote:

> If I get to know more about JNA will share it, but going by what I have found online,
> JNA is slower than JNI. I am very new to this too.

Good way to learn!

> At present I am going through JNI programmer's guide which was recommended in
> a resource(a youtube video) which by itself is old(2017), the programmer guide even older.

It's annoying. I would check the opensource Java git to check what is going on
over at Oracle.
https://github.com/openjdk/jdk/blob/master/src/java.base/share/native/include/jni.h

> I am getting a failure delivery message for linux-gpio@vger.kernel.org, how do
>  I get to mail everyone in the list?

The email address is correct.
Maybe it is because you're using HTML in your mailer?
The list servers will reject any HTML-formatted mail.
Make sure gmail is configured to use plaintext when sending mails.

Yours,
Linus Walleij
