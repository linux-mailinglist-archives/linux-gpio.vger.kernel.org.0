Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0E0677652
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 09:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjAWIbw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 03:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjAWIbs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 03:31:48 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E4E1DBB7
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 00:31:43 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id b18so2679877uan.11
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GfkSbRQ/gYxloxycPwl7gTixyfkrvddl3OpyLvd4/oI=;
        b=Na3ODXLEpaKhTv2xy4UVn3vABqCzMfhIwoA+kXOSEPAoH8fFfwOcIY8TW+VbgrX0A3
         zGsVnAPaKPOcimckIXR7Wj9jZ53D2HyaHyV987iq0/FISaMVcEk+0gBaI0tuhHKQvcse
         CPgjegZf9XsAcXvl5MIXreeM8SwSQybjfugohzNjD/Finds1/4ZOkYQdnSN1E/0I1QIV
         7LYHi3svqIoF7zeR/jtnp9JgePF/Hp7r/V9lDp+GE8XgmP9Dl5ZTyxiMgR1AoU3Vwu2Y
         5ejg+EV8p1N/xL+FbVpw13oWqyzlWJ5FPZ9S9y/RJCOxnhgROXiXM8B8kdJE0TKDu8ao
         INGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfkSbRQ/gYxloxycPwl7gTixyfkrvddl3OpyLvd4/oI=;
        b=x7HwC7GztD3EW86+LDKmme9PM8IX3Kw2IyL+U59s4ZIViN2DX9GfxfPyOK5UNhsS7M
         voLEek3beOedeieJFeVHuOf7u9QBbb4PJbrTBrUxc6QlMwzX8JetV1bqTlqOs/rhV90x
         fnoVJDcemKEkMpMK0jvbgXl1gfJO1yUHTHnw6qQLVA12zqOgMLuaxicWPdwicTchBep/
         Dqgyqvu/GvlL9kMDTfD27k3M89ITBZM5RSR6L8EnW9yHVPggaywEy1aO92s+KNc8HnA9
         Dq4eUMUk+ybiOHYdKGBBNxa+iJNWXrn62x01j1ec3+KTGehqAm/pSGgIE2OWjEgARkxD
         RsnQ==
X-Gm-Message-State: AFqh2koHqfNbR8UHi79A68onbCeIFGRVLd6JC17twJWPpTKXz82URO+p
        bklmyf2tUnje/9O82+MafTRBtW9XRqm7oa1/WM+Mm/L4sGMX6w==
X-Google-Smtp-Source: AMrXdXsWm+5/TdfgyTNg/BRZI19wddbI7PY7aety1cSuz/qjh3Q3NZMMQd+p32ffkXR0mqGH1hGeEq8RitkoPT58wzY=
X-Received: by 2002:ab0:7341:0:b0:536:2116:fbeb with SMTP id
 k1-20020ab07341000000b005362116fbebmr2380263uap.56.1674462702288; Mon, 23 Jan
 2023 00:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7> <20230123082443.xoexegmii3bnco6t@vireshk-i7>
In-Reply-To: <20230123082443.xoexegmii3bnco6t@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 09:31:31 +0100
Message-ID: <CAMRc=McOPhd8qZ6WhpN421SAob4qsP1+qxDTcUA1zn1X2y=imA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify gpiod_line_config/request_get_offsets()
 functions
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2023 at 9:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Bartosz,
>
> I gave few comments here, and it looks like you missed them ?
>
> On 16-01-23, 11:22, Viresh Kumar wrote:
> > For Rust changes, please run these as well to find any formatting
> > issues, warnings:
> >
> > cargo fmt --all -- --check
> > cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks
> >
> > On 13-01-23, 22:51, Bartosz Golaszewski wrote:
>
> > Just like ValueMap, maybe we can add following in lib.rs for this:
> >
> > pub type line::SettingsMap = IntMap<line::Settings>;
> >
> > > +        let mut map: HashMap<Offset, Settings> = HashMap::new();
> > > +        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
> >
> > This needs a SAFETY comment. Should we check if this returned 0 ?
> >
> --
> viresh

It seems like I did... :(

I will resend this patch separately for less noise after addressing them.

Bart
