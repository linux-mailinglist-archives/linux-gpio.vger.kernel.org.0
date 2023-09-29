Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8721A7B32C0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjI2Mpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2Mpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:45:33 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F8C1A4
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:45:32 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49a99c43624so1742047e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695991531; x=1696596331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3mcGFrO1zlVzfQz9WJ52S8Jf1SXe31YDDJj6RL5kCk=;
        b=XYLVREyPoOakrrbwsHMkcTMMVhOMBesEYMLE2CYHE7n90U+jt2ePyemvkT54CXbymG
         Q/Q9VWHSrjUFTTR+3FSXHe8VvbIoMiebsKKEGyIP3mquCdiZLjNyjY/OgLZyowpw8H/O
         7c1shtPXOctZtXtdFwwvxxuIUzjk9EgPLpU2/CXuiXDC+Mh2xAxnVHHVOxZiSHzry8QA
         czAODZ8kxFwTHysnBZWAbJS/NL5/J3kmlZDo06kMx2RjHH1shhSvmzvFNL5bzcDp12OD
         BDy3n6bwpA4CS9J+ZvEgTCGIEf6/WI82VeOV19+qOicBA3fiZE3e2PE9yHP+zP+xJVzc
         QS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991531; x=1696596331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3mcGFrO1zlVzfQz9WJ52S8Jf1SXe31YDDJj6RL5kCk=;
        b=gYpVdHXjgSOKzez4Agj1vlqxRo8vxuXP8e4t3CNRKbEJYnN1AIZMXik02RcJVIfp4y
         vO16BtFGwnvcTcztYvV6wNePlRGOADtDKGVq8BkQGHPxhcb0ReS4zcZlFMsPKkMjVZHR
         Qz6QyWSyOl8pw4syY9sD8Ze56MD13s2BiGJ5y1LN8TT97qD/ExiAZphsA9KbHWNZzp8R
         /Z9WXOfLOj040+8xsxj4RhW/6SE7js8hXqZcyltYJBisK8Lg4ZVMEudtV+cPhgjVwEqh
         SI/qdQet8qSsbOH8Et0K154lhzbZ8OMLR0xdWw610/MUVH53Y4Q4gGA1c9QZy+pqidkD
         L0gg==
X-Gm-Message-State: AOJu0YwEjPGFRMHH5sj3G2yVzuhu7gaWwnH0s1oqCaXjEVZS7vbZDpte
        nRn9YZnu4b2H2wecXQRe6B9B9CpN2apgo363t8hFFg==
X-Google-Smtp-Source: AGHT+IEeR3Z2aWP8YRvHjd1zCkdQYDOBmedG/wkW4aSAiW/Zespd/e8MxEwQm240iV5sHj0vB4E/58kZSz2Fu3N24WI=
X-Received: by 2002:a1f:ea84:0:b0:49a:b6c7:ddfc with SMTP id
 i126-20020a1fea84000000b0049ab6c7ddfcmr4073172vkh.1.1695991531121; Fri, 29
 Sep 2023 05:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
 <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org> <20230929105829.vm7ed3unydb5rrh4@vireshk-i7>
In-Reply-To: <20230929105829.vm7ed3unydb5rrh4@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Sep 2023 14:45:20 +0200
Message-ID: <CAMRc=MeU+yS7L_HguALjoYiw8NHqTWQ1=X5s4OmqnNiqAZmOOQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: mark all owning types as `Send`
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Erik Schilling <erik.schilling@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 12:58=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 28-09-23, 16:37, Erik Schilling wrote:
> > The thread-safety rules of libgpiod allow individual object instances t=
o
> > be used from different threads. So far, this was not actually possible
> > with the Rust bindings. Not being `Send` disallowed the user to transfe=
r
> > the ownership to different threads.
> >
> > Rust also has a `Sync` marker. That one would even allow sending
> > references of objects to other threads. Since we wrap a lot of C
> > functions with `fn foo(&self)` signatures, that would not be safe.
> > libgpiod does not allow concurrent API calls to the same object instanc=
e
> > - which Rust would allow for read-only references. Thus, we do not
> > define that one.
> >
> > Chip was already modeled correctly.
> >
> > line::Info is not marked as Send since it may either be owning or non-
> > owning. That problem is fixed as part of a separate pull request [1].
> >
> > [1] https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-99=
0dce6f18ab@linaro.org
> >
> > Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> >  bindings/rust/libgpiod/src/edge_event.rs     | 4 ++++
> >  bindings/rust/libgpiod/src/event_buffer.rs   | 8 ++++++++
> >  bindings/rust/libgpiod/src/info_event.rs     | 4 ++++
> >  bindings/rust/libgpiod/src/line_config.rs    | 4 ++++
> >  bindings/rust/libgpiod/src/line_request.rs   | 4 ++++
> >  bindings/rust/libgpiod/src/line_settings.rs  | 4 ++++
> >  bindings/rust/libgpiod/src/request_config.rs | 4 ++++
> >  7 files changed, 32 insertions(+)
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>

Thanks, do you have any comments about the other patches in this series?

Bart
