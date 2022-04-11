Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943DB4FB691
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 10:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbiDKI7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 04:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343993AbiDKI7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 04:59:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2143ED08
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 01:57:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ks6so4784753ejb.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3KQ5ya3EPilOhzylWj37gJPlUQ59zC3NsmUDjC1cXCE=;
        b=cwkw6sCrtegJQ8Ptu9e9l+Bld9ygDFFXYlooGqYkxkD+5eiCirX5SY/ClQeJPleXpw
         Qo0DhYHLwVvHLsaGu7LzVd6SyLO5URydUiNTR8ZUsEhN65vH8AjCJXPsOYksCIAWFsl2
         QQ5sIiLdWptVyOKGJK4YUe3frd63bRJ6wvYcazdv2EgCSobfC+LLhY4wDIlgog4j2zR8
         YmWmgPbRxlJd1HHspbGdSu3HRIRvDjCypOZXQFjYvQ11eXDGM6kyvM0bKUbr8lb//hJV
         q++jUQ2dNrUYOn6PVwfaPEF1TBQoq8HvGyVm2aC8lNR7iHuegOxqrKHMA+1B0i5fNr5x
         lfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3KQ5ya3EPilOhzylWj37gJPlUQ59zC3NsmUDjC1cXCE=;
        b=fbFubxHk4Xh7AottRWknhodTXmgzZJLCtLfFDs31BmtwOTgSL8zsYjEeNnCLyzXLKw
         psi6ynz0fgdTIZknXj11N18PP2wjyJRxybkmMJfj0Hx8ZYakBXg5JsKXl/b2nhd5g7F5
         9MWkkIOA9sfVdM8DFrIqWkqUvfpD+dDwGjnDplV+4zUlsXT9Tkzaumi183vBtDt5b2jP
         j9u5yTgzFBO0rXtPTz7E+z9i03srwi5Wc7JhMncwi0SBLzZS5Qy+7EfLhFqbhe1gPwWf
         qtlQIxuIMBvxQHiwXUDATosCSE/JybPewIdhqN978+VQk4xUXLjcVeeBhsSou7b24KqD
         uXsg==
X-Gm-Message-State: AOAM530p1ft4TB5jV89VE7tTPM4Gi2QTfJ5yEJ8AQwdIkWddjQ8GMNQo
        6whGs6TzNe6VwKbWvAARrIF/98L5j9r/0PuH22e7SA==
X-Google-Smtp-Source: ABdhPJxvlrytqGFk1MovwBdEeMpndeev4iJhooaPyEIB6iXrR88kdjVrNjv/NK8V/e4/JCA69wWfGQt181VTJyRDx1c=
X-Received: by 2002:a17:906:5d05:b0:6e8:40cc:1a99 with SMTP id
 g5-20020a1709065d0500b006e840cc1a99mr17434265ejt.734.1649667445571; Mon, 11
 Apr 2022 01:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <20220411033348.khqukcu7xczytd6y@vireshk-i7>
In-Reply-To: <20220411033348.khqukcu7xczytd6y@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Apr 2022 10:57:14 +0200
Message-ID: <CAMRc=MdZiVwOGeUsFOpjJt+e3zPVE+oshoaRJ1a2gwo6zik9PA@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 11, 2022 at 5:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 02-12-21, 16:52, Viresh Kumar wrote:
> > Hi Bartosz,
> >
> > This patch adds rust bindings for libgpiod v2.0, this is already partially
> > tested with the virtio rust backend I am developing, which uses these to talk to
> > the host kernel.
> >
> > This is based of the next/post-libgpiod-2.0 branch.
> >
> > I will be adding testing infrastructure later on, once other bindings are
> > converted to use gpiosim.
>
> Hi Bartosz,
>
> I can see a lots of patches related to V2 version making there way
> into libgpiod, but it is a bit hard for me to follow them currently.
>
> Just wanted to request you, if you can ping me once the API is stable
> enough and most of the V2 changes you planned are merged, so I can
> rebase my stuff over those and send for review.
>
> Thanks.
>
> --
> viresh

Hi Viresh!

Yes, I will! Just to give you a summary: the C API is mostly ready but
I can't guarantee it won't change more. The C++ API needs another
revision that should be posted today or tomorrow. The Python bindings
are still WIP but will be ready soon. Once those three are agreed
upon, we'll merge them into master as one (for bisectability), drop
the next branch and work from there on new features (including Rust
bindings). That's my plan at least.

Bart
