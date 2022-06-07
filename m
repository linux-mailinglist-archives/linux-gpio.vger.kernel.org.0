Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29AF853FBB3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 12:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238639AbiFGKob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 06:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241396AbiFGKoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 06:44:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31F2983D
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jun 2022 03:44:10 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id n10so34358664ejk.5
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jun 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3byxb1CzUTj5QU1x3INzOXGHXvRaMAU3vicCeu44cJ0=;
        b=F+lcqmhYEPUW5P4s8xBV283NYgFCNYcPoCR2yP9gyh/tZHJ210Qk7nbepEwKhgr1IU
         BR4EMHV0UfMv8OSj9gwGS6HNtviEe9YbNLuAyRZL2UVfgT31LV2qnciHntZ2U3irCfN3
         KXPYLg0Ah4UH7p8V/lTprSITzxn2vgcXYSZQBxaB0KXn8lm1Urcr9Am+5lL6nhOJ6+qj
         VTSVZDnH+zOEoh2guBNh6tKBQ80+MIGATULn6uWHvtPgRqIYKkxj87tGIpjQUr8wqMgD
         aXRi8kCBb2Iv5OYw2ufNEQKwBy5C3DCxDcH82k1zXuTe6yNb+i3hhEtHge2e9y+G3Aic
         F65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3byxb1CzUTj5QU1x3INzOXGHXvRaMAU3vicCeu44cJ0=;
        b=2dr9nZBdgI7bHoPR5n59Z2beucPj8CYtB6WBrIAi39u+4UZv+N4wPJDayONnsGtsp4
         wm7vwmuFqDs+8VNcQ2jmxCN59Z6S1ddgeZlMM2sYTk+i/zydTe4eCdK94liOaVe09LAz
         bxygnVxZn+ZjpAFuff60qhhlZz8LVXBUwO26bHjtux9QVOxD7dFtT+dR+Yf2Wb3x7Oc9
         enPxRnBt5gNP+l5PxzYfHNx37G07ziG21/QhUkUAycwdMyeWyUkIPXM2wB9keAAfGmSF
         EIsIlpGafRt+R+uRaw26NEynoh667JgYyibwP454O8dsU1ajAS3XeHWUX63euoajytYH
         CvYg==
X-Gm-Message-State: AOAM532F9CpKklu3tuzU8pluM99XBitDpNjVaOV5iU0KEiMZwrCQmjSz
        FlgUeGRrUVM9h7Fx66zV0MIU2FU5FjLoSCZXXX4=
X-Google-Smtp-Source: ABdhPJzm3Ivvt7Y3HN7cHMba/gN8+nFp91hMPr7OF6R7SfmR68fdljP+UOmPygJIHmKeDJ5qhzdUlLkJxRygPsio0yc=
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr20495940eja.44.1654598649167; Tue, 07
 Jun 2022 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220525140704.94983-1-brgl@bgdev.pl> <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol> <20220604024131.GB13574@sol> <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol>
In-Reply-To: <20220607015220.GA9430@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 7 Jun 2022 12:43:32 +0200
Message-ID: <CAHp75VduYPzVzpiGpVHrwuRm2nVasJs6QyUTf=CbFcWDTeKJ7g@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Tue, Jun 7, 2022 at 5:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Jun 06, 2022 at 01:14:48PM +0300, Andy Shevchenko wrote:
> > On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:

...

> > From Python programmer perspective it's a good idea, but from GPIO (ABI)
> > perspective, it may be confusing. Line name is not unique (globally) and
> > basically not a part of ABI.
>
> "basically not a part of the ABI"???
> Damn - we should've removed it from the line info for uAPI v2 ;-).

Yep, names are just aliases for the line numbers, but _not_ unique in
the system. You may have many lines with the same name alias, but
number. I remember that we made it stricter in the kernel, but as far
as I understand there is nothing prevents some drivers to behave
badly.

https://elixir.bootlin.com/linux/v5.19-rc1/source/drivers/gpio/gpiolib.c#L331

Also note, we don't validate names given by properties. Any DT may
contain same names for several lines on the same chip.

...

> Line names should be unique in well configured systems, even if the
> kernel itself does not guarantee it.

It's not about kernel, but like you said "well configured systems". If
we push the strict rules, we might be punished by users who want
actually to have ambiguous names.

...

> But if the purpose of the Python binding is purely to minimally wrap the
> C ABI, warts and all, then my suggestion should most certainly be ignored.

As i said, it's very good suggestion, but pity we don't strict line
naming in the kernel.

-- 
With Best Regards,
Andy Shevchenko
