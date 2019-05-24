Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431C929263
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 10:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389041AbfEXIF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 04:05:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36259 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388959AbfEXIF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 04:05:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id z1so2361737ljb.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 01:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kTIFl4GMIiXH0vxqtCK4GKNpMGX0QT3Ab9A3OKbOrCU=;
        b=LROFLUekxpHcknT8abvfvv3sQbNajASa/zrxfW8OIBGCfMMB1zTFSAAYYYCOfL5nYU
         Pl/j9uojxFkBpZViv5Q6r1VKnXMXs9VdqYofevOYKtiajEdbIIBPS8FrrSJhQUPKzmmy
         bmW6/Ed9zmIUkHdY63CZ4ClFslgVtdinq8G4eDaJS6ked09DrUZ7OBez8puSfMdaiR7L
         5NCBOgM6cZKapllgcoe+JQjV4QweUrFGTOBXncz1gkGPTC7w5vGJu2LqtjoEz2h0WCbP
         rYkwTXpDDVVLlP8C0ofSP8+ijfqCjqA77jbw64fYpoJDYW35ieCP+daT+9hwEgf54z/D
         4PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kTIFl4GMIiXH0vxqtCK4GKNpMGX0QT3Ab9A3OKbOrCU=;
        b=oD+dRLZGSH1/k3jWs10Mn0uFX2xl4j7k4rV2zQW5h0Z9RpKV4zjBR0rcRhtioOlndu
         uKOGLbdx8G86wvg32GdMncHatiZ6MG6punSOytVKEXnzT/0z26TycaPpdtfUQ9wYxhsY
         3bnojG3Wsfl+sWEOAHmaokMK7AymHl0VUR7I3CIysmhKZWYhoUTqHw6sfWBn99z8RoOS
         xxqqmcCvG70RCFAvnc7/M/EN4pSrlYO5Pyt7xdke5lry0xg8Su8NKUkmDxaXedSS8AnA
         MR93+6jCc2U8ooMUQA6KJy+GuondQs2pcq9hWJXQHqdxGGwXp8eHmG2g2tit8sxXQBIc
         oUng==
X-Gm-Message-State: APjAAAUuFV4JvzH7BIglo5lj6EhwpwS8LUr6Q/ltCy3IVW/WjunBgsUb
        DFLlnk8QgL5bm5BlkAQ6LfOKbQWc6/fw0CqYQxlDPeQX964=
X-Google-Smtp-Source: APXvYqwiUbsXZnqBKpi+ra/ZWEQ4YC2OnrdQMAQ5nWrgMW6wFyfDLiUw3dyUfrWxRmRtmrGteKo3UpBciZroHOMkzXQ=
X-Received: by 2002:a2e:9192:: with SMTP id f18mr38823598ljg.112.1558685155158;
 Fri, 24 May 2019 01:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190523080654.19155-1-linus.walleij@linaro.org>
 <5ce6dddf.1c69fb81.8efac.03cf@mx.google.com> <CACRpkdZ95Np43+mbGAmWBTN1b=sE0Tos9h3_xNhEM5yZ_EMJgA@mail.gmail.com>
 <5ce729cf.1c69fb81.83da5.1b6e@mx.google.com>
In-Reply-To: <5ce729cf.1c69fb81.83da5.1b6e@mx.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 10:05:43 +0200
Message-ID: <CACRpkdZ-ZH+HuBM5rsfH6jUZjhwr+NZejEeD_11gNvP+riDE6Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Enable device links to consumers
To:     Stephen Boyd <swboyd@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 1:16 AM Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Linus Walleij (2019-05-23 12:26:20)
> > On Thu, May 23, 2019 at 7:52 PM Stephen Boyd <swboyd@chromium.org> wrote:

> > AFAIK it does not, the device links however can do this so that
> > the probe order does not have to use deferral at all.
>
> I'm not too worried about using device links for probe ordering. I'm
> saying that this probe defer logic in drivers/base/dd.c already takes
> care of reordering the list so suspend/resume will be correct.
>
>                 /*
>                  * Force the device to the end of the dpm_list since
>                  * the PM code assumes that the order we add things to
>                  * the list is a good order for suspend but deferred
>                  * probe makes that very unsafe.
>                  */
>                 device_pm_move_to_tail(dev);
>
> Basically all providers will come before consumers and then suspend will
> run through the list in reverse and suspend consumers first before
> providers.

Okay! News2me. :) and very good and intuitive in a way.

> > But the
> > links can also be added later at runtime (like when pin control
> > states are requested by drivers) and that is what this patch
> > does.
>
> Ok, great! So if some consumer is only informing the provider of the
> driver dependency after probe succeeds then this will help by fixing the
> list order. This is what I'm looking for. It's unfortunate that devices
> aren't getting all resources in probe so this could be avoided.

Yeah :/

I'm still figuring out the details because device links are new
to me: not many callers in the kernel, but the regulators are
using it so it seems like the way to go. I will probably have to
add something similar for GPIO descriptors as for pin control
handles so the GPIO providers get a strict suspend/resume
order too.

> > >I can understand that runtime suspend may be important because
> > > order of suspend isn't fixed, but system suspend should be unaffected,
> > > right?
> >
> > AFAIK both runtime PM and system suspend use the device
> > links, this was implemented especially for system suspend/resume
> > and tested with the STMFX driver on STM32.
>
> Yes that's my understanding too.

I'm unsure if it's actually the reuse of runtime PM runtime
suspend/resume path for the main suspend/resume path that is
causing this behaviour. It's good if they both do it the same way.

The flag DL_FLAG_PM_RUNTIME should maybe be renamed
DL_FLAG_PM but Rafael and Ulf knows these semantics better.

Yours,
Linus Walleij
