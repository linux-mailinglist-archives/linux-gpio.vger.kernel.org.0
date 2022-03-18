Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9203D4DE119
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240159AbiCRSdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbiCRSdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:33:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D342121504
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:32:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id l20so15365907lfg.12
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBLfX2LSEiNhJ8oDOcJh1B00fiK59ApOZekhfSkPFtY=;
        b=VgZXaPqAaC3YW4N9oST8PmjWXw0TSZNWDVRh8fM9EjToU+Zs/ed98dGuNHb/i54YHp
         AYZS5QAWDzP3m1ZAGhm9kZ/lei9v44xXn7DxGd1XRyak5cRbMtaIBXH9w8ldrNz+3B83
         rir2bjRH/je3U8IBwnnIN+TvsEsyS5i2lN6a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBLfX2LSEiNhJ8oDOcJh1B00fiK59ApOZekhfSkPFtY=;
        b=OhtcQCLowfkc2+dW15KRKI4z01flo7J3PhrxPVDif1J6yt0pWfy+96OGzBprw+r6QQ
         SUIQE+LuRpLzSAkX+iM4ldVLb7zgjNgWPMam7+N5REf0jsI3zmqi2GCVKypwDYdg7zeN
         bK2pDD92SgBKyr1c8HBWXL+NmyL8scDEo4/27BId7qpndkVuqhVGeVra3EWVABEO6JF/
         KZbruTmKmXClI7gLoyNJz25F+y0dGBPI37RbVCpODlbqLY8ZFJeISSPX4GNTDLCIZKZ7
         DeIdcRW4bbvmKQBQsPBySSpITvGZwAsc3JninrRYwHx9dXaHl3d+hLtQfuv0g/eNhEwO
         IKzA==
X-Gm-Message-State: AOAM532xI/GtFUEHG5yNkjo9p43eggUpgLQ6Q0wlVUZL/PosvjL023Nm
        md/iVR9YAILLRX/oBTjADWPfrLE/2S1AjMvnP5U=
X-Google-Smtp-Source: ABdhPJzar60+uBKWN38b0KaSZtfGQ+BidOZHcFFDB9m7qCuQ3M8iC5jf1RGvSVpePss+x3hvTyJl2Q==
X-Received: by 2002:a19:7612:0:b0:448:307a:4bca with SMTP id c18-20020a197612000000b00448307a4bcamr6812140lff.361.1647628334152;
        Fri, 18 Mar 2022 11:32:14 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id z9-20020a2e8e89000000b00237fb5d60desm1104065ljk.122.2022.03.18.11.32.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:32:11 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id s25so12378942lji.5
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:32:11 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr6818296lji.291.1647628330932; Fri, 18
 Mar 2022 11:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
In-Reply-To: <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 18 Mar 2022 11:31:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjKiemDQXKCGztokhw_A-8SnE+7Q9Queb-rXUTbHPNedA@mail.gmail.com>
Message-ID: <CAHk-=wjKiemDQXKCGztokhw_A-8SnE+7Q9Queb-rXUTbHPNedA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bill Wendling <morbo@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Maybe we should reconsider our recommendations for signed types?

For 'hhx' is probably does make sense in some cases.

That said, for kernel work, if you work on byte values, I would
seriously suggest not using 'char' at all, which has badly defined
sign.

And 'signed char' makes no sense either.

So while 'hhx' makes sense in the general case, for kernel work I'd
much rather see "don't use stupid types".

So why not just use 'unsigned char' (or 'u8' if you think typing is boring).

                 Linus
