Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0584666BE7B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 14:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjAPNAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 08:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjAPM7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 07:59:39 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FAD23C42
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:57:39 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id d66so16490079vsd.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HfQlrchdaw4hB32UASu7GzqotGo/ixr0sQa4tvv5958=;
        b=QaYWwuoqZntFCWX5/8YUDbh4rEs/jNBe4ELzoskaOqMEP62q6VdopnLDrTTAVgTve0
         AT1UGq97oFapPH6NADUKdKPKaI4Ld+K4Vl+9jLhRRZStWRvcgiwHDPwl6DGv+e0x2l/q
         FSv2GFBpfVn0cSFpo9oEI1zBzoTr6x08frzJeh1WVjCn+YH5cRSR7tCCID0YyGIIPGzR
         YLL4KFSHb/mEzIOz+VOMnY6rbMCz6alHw2b0NqDWvQZs6qUHInNpB6KdAysZaPff7cqo
         ZHjaB8Yqk6YsLMGUWtCZ1dbbR63qURPXZ/bVDF9rzmT8HqaPsk+sWh0AJqth7xFE+7l9
         QTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfQlrchdaw4hB32UASu7GzqotGo/ixr0sQa4tvv5958=;
        b=lIsPbhm75qLa1XUinKP9E1KyqM/HQLg72VGlcRyWwkNMcWl4UvkXj3Ja3+e06A4RcL
         S3PyoqnADmXRa52W+EVI+U8FqOWkE4latN/tVvRaC1sLiF4TZghNkfea3CiOcL+uY+Q6
         Dgc61cSQKEz9OhY5GBlvgO7mM8h1YsIVffyC9w6dNAAv71WaTGrjxNGDrjM5ahkNX6Wk
         myPcSR1tuO5Bfk6pNwvq/zz5hB2zBf0hg573hkIbhhPsPGdsfcmVHCLJR/dmHp2Val/v
         48TqfzxpGGqnK3/d0XBq7caIoJ9c0xz4slqxjxscAkLWo/Bn/UIg8a6Isqa9wY0cltCF
         LBPQ==
X-Gm-Message-State: AFqh2kqRX1J+P3fDdbBGNyYuAnHfWNgsPzt6DtJWSWPwm+nfIiuFqaUB
        9g9CghJMVcMAY1EybUuXvHPytDmkl6FzCpkiGAqqHQ==
X-Google-Smtp-Source: AMrXdXsHicgRBEo8K3HMOd0g98RCA5hX/Qqu8EOVoHzEsEwBQtE4Z2M2GtFw+AHeMZXjS+8MbA+8WFJ0VwI9Ybw5eI8=
X-Received: by 2002:a05:6102:1141:b0:3d2:3577:2d05 with SMTP id
 j1-20020a056102114100b003d235772d05mr896966vsg.9.1673873858946; Mon, 16 Jan
 2023 04:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20230113215210.616812-1-brgl@bgdev.pl> <20230113215210.616812-16-brgl@bgdev.pl>
 <20230116060250.c6i6ouu2ojutubcd@vireshk-i7> <CAMRc=MdX+SbN65m2jkZqJOYKobGgi=H0jCVyqcHCPo56152fMA@mail.gmail.com>
 <20230116094058.7m3d4pdy7llnk7my@vireshk-i7>
In-Reply-To: <20230116094058.7m3d4pdy7llnk7my@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 13:57:28 +0100
Message-ID: <CAMRc=MerVcJW=yBpSGbWhk9cWENtLZE-OVx4NT=xm9fBtZgpBQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 15/16] bindings: rust: make mutators return &mut self
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

On Mon, Jan 16, 2023 at 10:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 16-01-23, 09:42, Bartosz Golaszewski wrote:
> > On Mon, Jan 16, 2023 at 7:02 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> > > > diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> > > > index c3fc37b..561f4e8 100644
> > > > --- a/bindings/rust/libgpiod/tests/line_request.rs
> > > > +++ b/bindings/rust/libgpiod/tests/line_request.rs
> > > > @@ -97,13 +97,11 @@ mod line_request {
> > > >              config.lconfig_add_settings(&offsets);
> > > >              config.request_lines().unwrap();
> > > >
> > > > -            let request = config.request();
> > > > -
> > >
> > > Why remove this ? And open-code it ?
> > >
> >
> > Because I'm a Rust noob and couldn't figure out how to deal with the
> > mutable/non-mutable borrow vomit that ensued when I kept the local
> > variable. If you could improve upon this one, it would be great!
>
> From what I can understand, config.request() returns a mutable
> reference and you don't need a mutable variable to keep it, since the
> variable doesn't need to store another reference later. Just moving
> back to original code should work here.
>

Seems like I went overboard with converting all of those cases but in
same places this still fails:

error[E0502]: cannot borrow `config` as immutable because it is also
borrowed as mutable
   --> libgpiod/tests/line_request.rs:449:24
    |
441 |             let request = config.request();
    |                           ---------------- mutable borrow occurs here
...
449 |             let info = config.chip().line_info(0).unwrap();
    |                        ^^^^^^^^^^^^^ immutable borrow occurs here
...
456 |             request.reconfigure_lines(&lconfig).unwrap();
    |             ----------------------------------- mutable borrow
later used here

If I make config.chip() return &mut Chip then it fails like that:

error[E0499]: cannot borrow `config` as mutable more than once at a time
   --> libgpiod/tests/line_request.rs:449:24
    |
441 |             let request = config.request();
    |                           ---------------- first mutable borrow
occurs here
...
449 |             let info = config.chip().line_info(0).unwrap();
    |                        ^^^^^^^^^^^^^ second mutable borrow occurs here
...
456 |             request.reconfigure_lines(&lconfig).unwrap();
    |             ----------------------------------- first borrow
later used here

Not sure how to go about this.

Bart
