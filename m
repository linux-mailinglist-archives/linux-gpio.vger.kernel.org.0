Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA939333F93
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 14:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhCJNrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 08:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbhCJNrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 08:47:22 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4E0C061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 05:47:22 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u4so33586122lfs.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++0Z3Sg/MSm5KHd5+AABmEZZ/1QQlMCCQcaKXINPhtc=;
        b=a/BQ4m2telEhkXuNSNMUhrqEqXEgP2BE9Fw+Oq+MFBR1YdUNxX9VYfeXdIZ8WxSmcA
         uUtR4oV3ia8Kw+yRGTqvdlWQ2MN4zNdOSr0lapBrs25Km40RrwNh3SZg83VJgD47asxh
         lwNHTrcaD6AtV0xbiVH5g3KlTIv/dwP7lSKpLG0y0KeXiX04p97neZMU/bzOMQzK35wT
         eiKNk0rHcrmS2efYicW4EgxaGNljmRbfUHVc1DE/s9Bu9d8Wtlkk1J38bT+hiu5qYYit
         fdpMIMwNr0Rr0RhWZjZXmV79+aUPKH2XlNI4D7mQs6zN9cgfscV+u1t+rT+5+m1CfLId
         cKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++0Z3Sg/MSm5KHd5+AABmEZZ/1QQlMCCQcaKXINPhtc=;
        b=kNKO5ruvxvlZelRbdmPcpfRg5wr8kyPZ3G6o2lO+LY6Cn1LbaZWrmhcmcLCG7QX4Te
         QvGlkIIgUEZJB7/2s3bhQ9IcJqBVfmrpEHsrnwdAh2pmccR3+SceZntLryU+dMGiUZ14
         zoAmK53R49Vqwlokx8x0oskS+L7EJ019UPWUBP1T9dbMh1EpidQN983UC9008wHgba3z
         WQLAl7VKPZo0NMCa224mLt1f+RF1VtKIO+5XFTA6MS0wOGn6UL7VdnqyfK+rN9UI1xIZ
         Yj8ui97yRurMCD1mzZjEW4NkKvRtHEyjqina9wieOpDoWTWSf467MtRf2O0I+4EROx4c
         Z/5A==
X-Gm-Message-State: AOAM530b+l7XApPrNdyDAQ3FXjJmWJjFcR+Sl/W1akgWkiDh+Qx8wQpB
        JmAg5oPOHiHqyCf38D5illMM3oajmzCU/vHV772Vq2+/lOyRzxpA
X-Google-Smtp-Source: ABdhPJzjz29zzemwkr7iPlRBsp3xEylhxToWxZp3DxOzmJezKVokzc7l+lwpoq4ivD1nkFV58Cp8XVDLTRflfih+3KE=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr2003988lfg.649.1615384041023;
 Wed, 10 Mar 2021 05:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20210223064211.120935-1-jay.xu@rock-chips.com>
 <CACRpkdbqkCEMuZdwgfPJAhnZBKW1KV0+1MnXqNvTjm300jaS9Q@mail.gmail.com>
 <CACRpkdYkBD0-AWz6gWrxK_5GjM6_mSoJ4wR64BijsJ8juzuFug@mail.gmail.com> <CAKUh=RxWDyW_cO2nKFLi=x0xDJwLHTb3+-OesTk2B5C=DpGEwg@mail.gmail.com>
In-Reply-To: <CAKUh=RxWDyW_cO2nKFLi=x0xDJwLHTb3+-OesTk2B5C=DpGEwg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Mar 2021 14:47:10 +0100
Message-ID: <CACRpkdb-NS5U3-nv6uRCsqo6iOg_CKq1tx8abNT4DuVpGPoqkw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcGluY3RybDogcm9ja2NoaXA6IG1ha2UgZHJpdmVyIGJlIHRyaXN0YQ==?=
        =?UTF-8?B?dGUgbW9kdWxl44CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcytrZXZl?=
        =?UTF-8?B?ci55YW5nPXJvY2stY2hpcHMuY29tQGxpc3RzLmluZnJhZGVhZC5vcmfku6Plj5HjgJE=?=
To:     Kever Yang <kever.yang@rock-chips.com>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 2:02 AM Kever Yang <kever.yang@rock-chips.com> wrote:

> Hi Linus,
>     Is there a place we can see the error report for "x86_64 allmodconfig"?
> Since we don't have a build environment for architectures other than arm,
> it would be best if we can get the error without have to setup the build environment.

It comes out from the kernel build robot when I apply the patch, hehe :D

But I think the kernel build robot people at Arm can pick any git branch
for builds, on request.

Yours,
Linus Walleij
