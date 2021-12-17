Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D7747820A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 02:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhLQB3d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 20:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbhLQB3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 20:29:33 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F81C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 17:29:32 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so1007623otv.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oKqQzUoWpwgi23nYLmY2FxvZYlWLxzhxcF9pQmbeY+w=;
        b=btw0eaOelUjDh2YS0idJoElixeMd36Xm+9jTp8fVQmi1BRY2cYnfbgY8EAPSwQkkd9
         OPUrJPdR6yOCpjJA9GvD2IANwAvR76O7KZXK9kWPO7crEIxsAEXtHMn8mD6BCjDvxkCx
         QeBf9E/lOKP0ZdCkDA17KnEgsh9iyiPJVvy5dsRj8/ILRuDe+XFemFa/4OAcB+MBd3Z6
         zmFq6vlDfr7iIAcOrNLOjyEcRZwNueHmN+jeXQ9vJqZ0OrbbKw28HvnEaX3kCsd67Dgf
         bclo44IoanzVnf19m+xZzbeH2ThnENT9MVpAqIFTLi0a0+H2IWLWnmDptCAV6t/Acixq
         45Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oKqQzUoWpwgi23nYLmY2FxvZYlWLxzhxcF9pQmbeY+w=;
        b=NRj6al3keTe6zbLe+rCPXr4JqPMpinlx6AZ4HzFo+EuF0VtLNU2ml4mbWUkF1SKW5f
         MG7xv2mOHzetJQ3HA2mdE4sM9iUwaW1CftKbKBC0Z/uyrPiTvy31GCoDbsTwkhNJngQY
         YECw+FFftjoAdk3R58i93zDNPknYWQZtAORXvqthYyxdPtNirDsMi5lcEPlb1EZCgP/f
         y2yM/8TVV4BrlhNidK+bHbYXMsJ8Gs2rgtWWJq/qwainrnjYXDEDk/MKZbkusbf+orXF
         7VwQwJRkAjALSlTUmM0nCbbL7I2Mbal9VodcGnIUOMCTnN0MYScfvripJRUWx3uHvMY8
         lDrA==
X-Gm-Message-State: AOAM530sFEikNfqBFDwiCJRs6t4/Y6WLDLNpL59iSfhmhLOkL52fIPU8
        WjF77uLyugT2sAcBLz3XajOPw3ARHv51qOouKheJCyyyn+Tv+w==
X-Google-Smtp-Source: ABdhPJz/beVCHiNrhNHfm6eytBaIl98mhALUl0BGOAe3vlaZ6loPhhNWNdbzTlOosDayEpSVZAICbWJu4TLEn1c1Zr0=
X-Received: by 2002:a05:6830:2693:: with SMTP id l19mr625707otu.338.1639704571785;
 Thu, 16 Dec 2021 17:29:31 -0800 (PST)
MIME-Version: 1.0
From:   Gerard Ryan <g.m0n3y.2503@gmail.com>
Date:   Fri, 17 Dec 2021 11:29:21 +1000
Message-ID: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
To:     viresh.kumar@linaro.org
Cc:     alex.bennee@linaro.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
        stratos-dev@op-lists.linaro.org, vincent.guittot@linaro.org,
        warthog618@gmail.com, wedsonaf@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I submitted https://lore.kernel.org/all/CAKycSdDMxfto6oTqt06TbJxXY=S7p_gtEXWDQv8mz0d9zt3Gvw@mail.gmail.com/
and my attention was drawn here and have a few comments.

Firstly, I was wondering why you didn't create a separate *-sys crate
for these bindings?
see https://doc.rust-lang.org/cargo/reference/build-scripts.html#-sys-packages
for more information.

Secondly, I noticed when developing my aforementioned, patch that
`bindgen` adds quite a few dependencies that probably aren't needed by
the average consumer of this crate.
So I was wondering what are your thoughts about generating and
committing a bindings.rs then optionally using these dependencies via
a feature flag?

Lastly, With your `make` integration, it looks like we could also
remove the `cc` dependency by allowing `make` to build libgpiod
instead and just linking with that, instead of compiling libgpiod
twice.

Kind regards,

Gerard.
