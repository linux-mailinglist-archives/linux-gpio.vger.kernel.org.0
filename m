Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A419287490
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 14:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbgJHMxF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 08:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730113AbgJHMxF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 08:53:05 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13737C061755
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 05:53:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a7so5247739lfk.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FxfUEUi6zktpxu/mlP33p6/3OJKcxiReX3Cme3ajLG0=;
        b=YeojNDCsQODyiJZ/R38+vxn5EJw4k/ERri6Mi8QyXr5m4Me+jTQIAhUUzsaAahWU+X
         LszzF8mWkioTVYMHddjpOouqAwORZjKguhbls8m0LPvph5zE8AIg86ggT8Ty1xAA8li/
         18acI8/qw2KPO2xPrPxxe6+D3UdNi4tGtr/kMWBJ0c2mrBwNSoaU1i8hYT6Sz0b1/QbV
         ZJpD+T/dy4jbFyXOEUtwtcVkw9iXORXjSzA9UqBpf2aIySgyKpvSL7EgImAtb9Kzf50M
         eE0FGwFohyGIC55kjvSnsDVuNAFxtcRaSrHtjaEfHfSQEziNufD6N8jd28C1D9Oarvlv
         On4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxfUEUi6zktpxu/mlP33p6/3OJKcxiReX3Cme3ajLG0=;
        b=rgcPneS+3lztLek4djq5xn/X8QltE7shjD5XECw4uoYu48vy0qLoXp68Ly+XxJjg3A
         kb2n5iS9ORuaGq3Hi6jtKB6Fek9LudzU+tojtM441D7QfuKKTYeP3hnmXWVsfTOdojPj
         E+pwEt8rOK9chJ08qlsS64oQe7DzPpQc6t6nsspbHzZJbyPMvrSEEMZJww8h2MJ9mp1G
         WmfGG7k5sRaAMfF4SIzof+bOtb2Wa9n3Tc+6wWL1ZsEQdjmHgUMp1Y/ONlath6ExgPyL
         dzG3I0YzSXTnLXZW+sfg47M0NqExIUAHbxnryA8c0H8HJRj/pKZG8lEBRW6nNQLie2hh
         uQew==
X-Gm-Message-State: AOAM5317/VTPpZr2xO2czIA42364bWyiOKi/HvsJAk9jv4sFEoE4g+dj
        GN5Vd03x3Qwgus0Nw5HHavg9to2W1rdWOALCdMhlQQ==
X-Google-Smtp-Source: ABdhPJxWSJs3kvo45P2YLqWbDVciugobKkAjYEoD9pfLA4jMPAe/NHoL9+PN3M50sfXIsT8DxeHkPtRiH5Tv6Jpo8p4=
X-Received: by 2002:ac2:483b:: with SMTP id 27mr2398747lft.441.1602161579900;
 Thu, 08 Oct 2020 05:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
 <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
 <20201006193235.GA2689027@bogus> <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.e0bfef86-33da-4b33-b856-e32dbc3f2992@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.6462df9b-cbe0-4101-9ae9-b09faa895eb1@emailsignatures365.codetwo.com>
 <CACRpkdZmYKn1JU8PeA+GAJDuVEtWQrH-3KijH4+df88Bt=iZtA@mail.gmail.com> <bbc77660-40b3-72b2-4829-4f1d53cbfd2b@topic.nl>
In-Reply-To: <bbc77660-40b3-72b2-4829-4f1d53cbfd2b@topic.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Oct 2020 14:52:48 +0200
Message-ID: <CACRpkdZ6W4=MHmsAzoyzDhKu4Btgg73PZjOrOb7UV64OSHWn=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 8, 2020 at 9:36 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 07-10-2020 11:58, Linus Walleij wrote:
> > On Tue, Oct 6, 2020 at 9:32 PM Rob Herring <robh@kernel.org> wrote:
> >> On Wed, Sep 30, 2020 at 11:50:38AM +0200, Linus Walleij wrote:
> >>> On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> >>>
> >>>> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> >>>> with 8 GPIOs, latched interrupts and some advanced configuration
> >>>> options. The "C" version only differs in I2C address.
> >>>>
> >>>> This adds the entry to the devicetree bindings.
> >>>>
> >>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >>>> ---
> >>>> v2: Split devicetree and code into separate patches
> >>>
> >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>
> >>> This patch 1/2 does not apply to my tree, I suppose Rob has
> >>> to apply it?
> >>
> >> Nope, no changes in my tree.
> >
> > Weird, OK Mike apply this wherever it should be applied or rebase
> > on my GPIO tree and resend if you want me to apply it.
> >
>
> Could you provide me a git URL + branch to rebase it on, i'll send you a new
> patch then.

It's this:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel

Yours,
Linus Walleij
