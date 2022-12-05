Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F67642A2D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 15:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiLEORy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 09:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbiLEORv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 09:17:51 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBD465BC
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 06:17:50 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id 6so3288824vkz.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=22pLMwBH1rtTFEZpepzYeNTw8Z740XqmLZskpCypPXg=;
        b=TKko72a/Gd1QQitFWsaTEF0WK2rNGMJIfCfRh/vXYteF40qVMqITx54mAKdhvOYoeU
         fxuchHjpMcoRS4j2xbtta9NXDeGwD/KHb6/tuoQIlmQyAAOLUm0eU4nPZ0fskSJaAJD9
         fPKsGVsqjZAoWVvX0H+fJEOMrfvQQLLXT10wPDvsruOVf35DURqugxt6bgZRoWsmpyHC
         nrZuv0kHV+18aOlwgHxKGg5CQaJpa7HhLdGOAhLQ1iCSTgdEcSmHWkAOA/Hw98sBHm+A
         c6CW/VKHspV/3CjhH85RUk+4zvRrO+6ok6KezAXxE3EoynrBd8gTFZDCl0YCcJ5tkbbV
         n55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22pLMwBH1rtTFEZpepzYeNTw8Z740XqmLZskpCypPXg=;
        b=mYimOxRzxEnCACPH6BattbJrMDGUAanSp6RKURuE90KwM1J3GS7f0grfqJyqRG7R9t
         6f82fdDsgv5Mto0U3r9+vNzWpVdw38A7qg3SepxpflZNmbkhdrlzXm6seXVxhVSglziV
         tUZ5AFMWL+V0bRBoK2jBQXK+c/JDfmEfJjqU6NDhJO8R/91ZQ2kfFSiFxrHAVC3qJyOK
         mRbtmHHPK2zjHYd9Zvdq1e71wvqtbjmH/iC6bi5dTJ06457X1rLEqj/bLCR/YdNp+LE8
         RxcOkxTmpSmCzbh3YaiRLtH/65K/uzKSTt7ZcSoh85U0upFw5MiKAf5WQUB7kC0HoJ03
         d8tQ==
X-Gm-Message-State: ANoB5pkTTyi3woipqGcrnD6t2lHYoI1/r4TZWH6Q2vSX/C3HxWuH3Ltd
        lj9rTKPjyywP9/aJ94ssuDhTbegkjOgrCk/hoxyW5g==
X-Google-Smtp-Source: AA0mqf4QctcEpsut3oeYCsHj7JhgIWgtc75R1J/t+emCjH4Yy8dtQlGwvDT48TFbBXjhnv0kGoRylYnxyZ+xIfD0YC4=
X-Received: by 2002:a1f:54c1:0:b0:3b7:65cc:8ebc with SMTP id
 i184-20020a1f54c1000000b003b765cc8ebcmr40476289vkb.5.1670249869756; Mon, 05
 Dec 2022 06:17:49 -0800 (PST)
MIME-Version: 1.0
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
 <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
 <6e539372-b898-4732-b924-15993e52b4d9@app.fastmail.com> <49112892-07e4-4c1a-8ee6-d112cc9fb65f@app.fastmail.com>
In-Reply-To: <49112892-07e4-4c1a-8ee6-d112cc9fb65f@app.fastmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Dec 2022 15:17:38 +0100
Message-ID: <CAMRc=McBhSi824Z3WT82SygLkfqP4jAbR7mzi131aQ5-A6GFQg@mail.gmail.com>
Subject: Re: [libgpiod]: Meson wrap for libgpiod
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 5, 2022 at 2:27 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Bartosz,
>
> On Fri, 25 Nov 2022, at 14:12, Andrew Jeffery wrote:
> > Hi!
> >
> > On Fri, 25 Nov 2022, at 06:54, Bartosz Golaszewski wrote:
> >> Hey Andrew!
> >>
> >> The libgpiod project has undergone significant changes recently. A new
> >> major release (v2) is getting closer and I'm thinking that it may be
> >> the right moment to rethink updating the build system. Would you be
> >> willing to take a look at the current master branch and see if you can
> >> swap our current autotools in favor of meson while keeping all the
> >> current switches in place (translated to meson of course)?
> >>
> >> I would be willing to accept meson into the master branch as the main
> >> and only build system for libgpiod.
> >
> > Awesome, let me look into it. I'll let you know whether I can get
> > something together quickly.
> >
>
> I've put together a WIP series (though perhaps RFC was a better
> description?):
>
> https://lore.kernel.org/all/20221205132207.94775-1-andrew@aj.id.au/
>
> Andrew

Thank you! I will take a look shortly. Just for the future: Cc me
directly on the patches you send (brgl@bgdev.pl), otherwise I may miss
them in my inbox.

Bart
