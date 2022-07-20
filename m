Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4066D57B2D2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiGTIXz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 04:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiGTIXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 04:23:52 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6E06BC13
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 01:23:51 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fy29so30563208ejc.12
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=61+HAl57NNJ+AyqL4XDMzT2BRHMKxs4Gs/zawTCQKxc=;
        b=lClxztZ7ZDZHNqL66UZQSh0rQPxmxHyPuTvrZ9p9ueh306xQAJPEomTUD21Xlq7fAR
         c+VWXpeSsojmS/qvhSPzXgcqAG27RIvK8Xm41MFRMYHguLhJifTC+N+qNU0SQR9VBYdl
         jAXD3QkWO1vnEEXWdlq1tJ3QbDKYznKzny5KPdBvOQLZp0iR1AaNP3GXM4mducv2xpcc
         lnc6opDLCODV+Q6WhJ1St3DAiNMdwfn86xIg40jjlj8aBxY2vAc+Vbx6XnrD+AEgJRQu
         9jzYSRwI9+I+fC8xH7dITsLh0HuoGjMrt8Kqjko4aN/ZGRvgUSwig7duv5lZn9nk7GFF
         r/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=61+HAl57NNJ+AyqL4XDMzT2BRHMKxs4Gs/zawTCQKxc=;
        b=4rXJ6fRwweNYwfV2DSm7rn2HlDhTQ7leOv6JEnUuo5MdWsEQ2ZrXxSsAYqIoxHtqwx
         cSeTVmec9teXmTZrHXUdj2mYGBh70HvzCMb1H7qKNYBR+ANQbyfDlswUk8oMpM7dqb5Y
         GwcFBj1u6jxNgjScpsYVzi1qZabVTFX3Do0KJSQ9sdnfWi1SohXLDqV6lcy9Jdb873ub
         Qcqvb4ZcM3BMRpNCqLvdxbDIBfAWyc0boOF4lwe3xks+ZoGIyXkp0HMLOkRXaSg/s7N2
         XGF/UFIodkLjJ/oYVII4QnLSgdEPdJr4/aixvDs1t5dsXz3Nho6SSOxOQSVZaJ7ZHb31
         mlJw==
X-Gm-Message-State: AJIora/nTLd6y2fkVLZxFhKSOfeW80s8iFEV6gB0SQSzulCIFNoE2NbW
        J7hpWDiVvmB9ebCReg0hdZJF4Fpd3z1RrTCNox/DnA==
X-Google-Smtp-Source: AGRyM1tTDy52jt9ItIo7/jbORdsPH5RCWRhc3rH9kY7laCOYVlxoqkqZG8QZlw03PUSPPQPYwu7AosxcbmlGRk96CHc=
X-Received: by 2002:a17:907:1ddd:b0:72b:49ff:d39e with SMTP id
 og29-20020a1709071ddd00b0072b49ffd39emr34912343ejc.500.1658305430071; Wed, 20
 Jul 2022 01:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEBpM+ZPZNpJNJAU=2iji8+dCnLEcordRLwH3-mKhYqWS_zr6Q@mail.gmail.com>
In-Reply-To: <CAEBpM+ZPZNpJNJAU=2iji8+dCnLEcordRLwH3-mKhYqWS_zr6Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Jul 2022 10:23:38 +0200
Message-ID: <CACRpkdbVRm7SdCPm-RP7pD2v7ce+i+kSh05wdFsmMmBbDk+1YA@mail.gmail.com>
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

On Wed, Jul 20, 2022 at 9:04 AM Meena M <scientistartist@gmail.com> wrote:

> I need to write Java binding for GPIO library.

That's interesting!

I would use the libgpiod2 branch for this because that is where active
development
is happening right now, with active language bindings for C++, Python and also
Rust in the works, so clone and work on top of this branch:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/libgpiod-2.0

> Decided to go with JNI for the purpose.

That's pretty much standard, right?

> All of the references have examples with using standard C libraries with functions
> such as printf or, from scientific library with method such as multiply. The library
> for which I need to write Java binding has macros, structs, with types such as
> __u32 which I am unable to see mapped to Java.

It seems like you are trying to use
/usr/include/linux/gpio.h, <linux/gpio.h> (the kernel header file) directly.

Don't do that, use libgpiod2 inbetween instead and it will be much
simpler. It has this friendly header instead:
https://github.com/brgl/libgpiod/blob/master/include/gpiod.h

> Until now have watched some
> youtube videos, looking at JNI programmers's guide which was
> recommended(but it is very old) and looking at an ibm documentation
> on JNI https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/types.html
> has not been very helpful.
> https://github.com/java-native-access/jna/blob/master/www/Mappings.md has
> mappings but in the library there are types such as __u32 for which there is
> no corresponding Java type
> https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/types.html,
> even the official documentation has no mappingfor __u32 or unsigned 32/64 bit

The __u32 etc are Linux kernel-to-userspace types. You certainly
*can* use them directly if you absolutely want, but libgpiod is going
to be so much better to use for this so please consider using that
instead.

> Is there any tools that can help me?

Yeah use libgpiod2. Create bindings on top of that instead.

> Where can I find a good reference for this?
> Or am I approaching this completely wrong?

libgpiod top README:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/?h=next/libgpiod-2.0

Bartosz talking about libgpiod etc:
https://www.youtube.com/watch?v=0APvuY2eLkY

> Should I go for JNA or some other option?

Don't know much about Java since I haven't used it since I finished university
in 2004, so you tell me :D

Yours,
Linus Walleij
