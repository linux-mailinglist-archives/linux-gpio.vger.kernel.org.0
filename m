Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6909A4DE104
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238890AbiCRS04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233877AbiCRS04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:26:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70296EE4D9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:25:37 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id o23so5593093pgk.13
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wq1GZ9FmJNaOPsHCf7hIAuuWdRpL9RI2sxkF+hIIcow=;
        b=L6TJQ4ALkQFTio02kfOl/LvKH8xLaqIUeb5E7TuK0gBuAaxiI14x3yadHrpHm30Nf7
         Sd+wu1HgsWmgESGl6zn6CseGywI9L5PvMdlkCn/w/VAZqL9gXFpnGAhmjt6YswLqk2iF
         kBTCYVHwX2ogRTPke3lRoXhCAlqVbULdL0uNPxwj06gcpqxpxAE+ee84OVp3TWU3ej22
         jIaBPC1sZjYRoSLAVd+8JMKeN1FcPYF0MNVdc+3FNF8tvcvkn/FG8S2dJPsIy7rkBHQ+
         YWi3SYTsu4wZyPCAsFmyRgtr2XpjNG0oVtEvwF5JeCobnl6RA25lGolPMhzeMfaC9Iyg
         1NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wq1GZ9FmJNaOPsHCf7hIAuuWdRpL9RI2sxkF+hIIcow=;
        b=Jn7nqzXO13iDhWf6+ogRn15DPKFRXvl9S4BJpo89h/S82WUooDf49uWgDT8vM4kG0m
         yScutm0tsz465zsuf7jnPc5+NuIT/A9rPf9Ej3ik2gMzQFVlgiy3aTIvgU2DLlOhVt4O
         yNGoo6iKa5wErA03S7G4eIsYATc3QJ67EXxI0lEkCDU+6uIhE88zYBY+x4KKCqqQbFjR
         lmDPF/CSs0HeGfT0h6IE7O5N0hnL9eT7U10T6HuOEcfu51xoWXzdYcxT9rlytvWt3N83
         tX16UAEXtDlItZTEH5OR/AdnTSyGdPLwkGRprdDM42F+3nVHFs8hTdRhQTBc6yd6qLW/
         mpug==
X-Gm-Message-State: AOAM533RFA6658iegdXfv5eaOMwRI8nZMUTBKHGl3rGXrhYn4L8x1vnP
        4q3eesbmJARrG4t/cHst6Za9RmNHBQJJnIIAnqp8
X-Google-Smtp-Source: ABdhPJwG95UQYNFuKuFWCvotjqKdxzonqApUV1Y52hrewvuFjuIzo30iBq30MbUPl6pncjAPxlbjjuM5VtbhSokgbnU=
X-Received: by 2002:a63:17:0:b0:37f:f283:24b with SMTP id 23-20020a630017000000b0037ff283024bmr8823934pga.407.1647627936741;
 Fri, 18 Mar 2022 11:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
In-Reply-To: <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Fri, 18 Mar 2022 11:25:25 -0700
Message-ID: <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
        Joe Perches <joe@perches.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > > unnecessary %h[xudi] and %hh[xudi]")
> >
> > Not that I agree on that commit for %h[h]x
> >
> >         signed char ch = -1;
> >         printf("%x\n", ch);
> >         printf("%hhx\n", ch);
>
> Will print:
> ffffffff
> ff
>
I noticed this. My first thought was to do something akin to:

  printf("%x\n", (u8)ch);

but went the route of removing the "h" qualifiers to be more in line
with previous fixes. I will be happy to change this patch if that's
what you would prefer.

-bw
