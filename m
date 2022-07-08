Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F08C56B87E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbiGHL23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237928AbiGHL22 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:28:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328BB2DB
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:28:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id h23so37143482ejj.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XruMh8IfXThcYIkdijBsGMsL80sRdIUfK0W/u+c06Uo=;
        b=QDq+6hcPSCatsmFq7T6+ltMnbqeuHSPTxj4N91rBNp0yD4/x+X3c/SpdTUs4gO5zOf
         zC1tWNZCYmtInAa12X0toNceprn1BQb9lkGRLNWWRD7PxWh8UnZ/xtQ8K80wySVFuTyZ
         GMpE5cpaE5uHM9CWtLiAe8uIco6iODgPCLEJ/Ttid3b69PE8R7c9tES+u6SCYx+PIhXX
         2nR8C5eUinhC5fOIRMESHfYxCRwn19v/FWSqMTQ9KLRZJoDALFWSUlaMmDkFKiVjXxxB
         bUPVpRVW3jCR9IZuS3e0aC+WRkhDB8hzzDzscDUNxTR//09GacpyWV8GFMA67pCsYYra
         GxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XruMh8IfXThcYIkdijBsGMsL80sRdIUfK0W/u+c06Uo=;
        b=bZyE5kXVlSLsbSPB9SXybGhQKpmmCr2Z3IVwjLX06WlnUp3RXnBNEWVA6G3m00sFPB
         OsbWa6z+2Kzx02wngPS3NwR3EnYQPu4849/uTazBK756iwFRi3Ye3tU2RWEdKdF8lmEs
         KHwkvZxqonU3lhYUL8+ZlTELyVuNm8m2FEhuxpSO9Gcjk8ohtS3dVoI7cQZgffsru187
         NqCsLAWgBLT6pYoAqaeMqxUaCyEdfn+nw+mv9AKCKZtN6LFeI4AqYSCk+crJODzQQJBP
         R0BqHUD/OvdLVUtl9mPLAr9xMhQYqwZtlOUrGeEy+lIIHd+4VmeaZgLpObKrVYuust06
         Dxzw==
X-Gm-Message-State: AJIora8i0kF5ZHdHraSzev+rjeei4KkD2mZVaD5rAzE+5UEax33x5fBb
        RttZid0aK+sAzmQdDZKJeVuFQjVHA7JTgx6WTGyKGQ==
X-Google-Smtp-Source: AGRyM1uMLvytrFeEz4uI7rw5A/IGBcBcBHmXFx/vEUjph8SOLH3psmE6A5UaI4pdPsJTITjgyygDFipnphflIYwTBQY=
X-Received: by 2002:a17:907:2c61:b0:72b:172d:6413 with SMTP id
 ib1-20020a1709072c6100b0072b172d6413mr2992183ejc.492.1657279705635; Fri, 08
 Jul 2022 04:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol> <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol> <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
 <20220708013834.GA6484@sol> <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
 <20220708105634.GA84979@sol>
In-Reply-To: <20220708105634.GA84979@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 13:28:14 +0200
Message-ID: <CAMRc=McSN5MEOXW0husOaX62EQq+xZyahX1SuvmimuZHOT1RTw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 12:56 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> >
> > The limitation of the uAPI is what keeps us from making it true in
> > user-space (that each line can have its own config). As it is, only up
> > to 9-10 lines can have distinct configs and making the API look and
> > behave as if it wasn't the case is more confusing (E2BIG errors) than
> > simply admitting we have the concept of defaults and overrides (to
> > which the interface is greatly simplified in the high-level
> > libraries). The idea about making the most common config attributes
> > become the defaults is simply bad. It would require the user to
> > anticipate how the library will behave for every attribute and lead to
>
> It requires nothing from the user.  They are not even aware of the
> concept of "defaults" or "overrides".  They just set config on lines.
> If that is too complicated, which is quite unlikely, then they get
> E2BIG and they need to repartition their lines into multiple requests.
>
> Anyway, that horse is dead.
>

For a python user, this:

lc =3D gpiod.LineConfig()
lc.set_props(offsets=3D[2, 3], direction=3DDirection.OUTPUT)
req =3D gpiod.request_lines("/dev/gpiochip0", line_cfg=3Dlc)

is pretty much as simple as it gets. They still don't need to be aware
of the underlying split into defaults and overrides. I believe it's
GoodEnough=E2=84=A2.

I imagine in Rust bindings we'll be able to chain set_props() as is
customary and we'll get a one-liner out of that.

Bart
