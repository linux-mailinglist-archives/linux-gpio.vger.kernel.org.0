Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05456739158
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 23:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjFUVON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 17:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjFUVOM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 17:14:12 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D8C1713
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 14:14:11 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bd729434fa0so6505510276.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687382051; x=1689974051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bv40WjMJFEMtznzq78UMFO9y49ufx9trCDNXLggABmI=;
        b=tnVsttSKMSrYc+OKpC7gaXroWGhiuKd+0RKOMfCJgnJ/eLXAFvDS0mkwLZx0/yE4Ia
         /qbPoWEshL0s7X/VQaPcX4ax8BuEkqjk5J5wSJ4lmGQ9DQP1sOUZ3p2ZrkYwJc48ZwjN
         0p8AqTw7Xi9ZTe6J3UZBUNOuvpU4m5gqIzLiSDfKUjBITSjBT8xneT2VGVumeyooxWLn
         uKq9aB7DJ3BDPt0x4sqsTtk/XgqwEZD9cT8C2cFsAi8goUVuQv+dbqB3vHZ1FRLC5ZAy
         GhyZm0UI6SvwBtViya1Lk0NrYjg0ov3yS67J7eX+kAO4qg3d05sD7dXpnSp/6/Xd5rrQ
         qn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687382051; x=1689974051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bv40WjMJFEMtznzq78UMFO9y49ufx9trCDNXLggABmI=;
        b=ltBbpSljO6RGvDZJsm8j2bJb2PpTYKa371GrKZrMR1v7sW8qLObmAPdlpQb5fIfSaI
         NDJ5xRhDQdqyc8A6pGG49wbpwlk845wIRS1yp8/x6r/B6qfA8fbqPYki5yWaMxQfubsF
         g9wvWae5v6rG8bGMMWmU5a6Vg7JPa/92MVwdljlM3IkkPq5+j4gnkqQk9m9PA3k07vyH
         Q1LbtiGWZ2bSxXq/GS4wnI/BAHl53u8dzxh+sZ5Gl+cM5E8JmYHKQCbZ/nNH2N4MK1vi
         /ciCsucKbYQQoW76zUvJYo5PpVxUHj0Br2bfbcXEOQDMD5SCWnqFMeA0qxtku9Uc/sWj
         28Wg==
X-Gm-Message-State: AC+VfDxHqgwEdUoZzyCL1ThcjW8xNBWuHOEvb93uhAz3OIgiPh9rdsDN
        OQw8E4aL8kzqc+sj+s/rR50ZJY6cTA8N/TwMYXUNs3JzBqlCdNYM
X-Google-Smtp-Source: ACHHUZ7v7GEbN9l379LftQ9O+XcPu59vISUTT+eUp6pAvO4C4HcuyEhYdfWPUi0w96VAJiQkOhbuu05hBJROkb/qds4=
X-Received: by 2002:a25:938e:0:b0:ba7:5639:9996 with SMTP id
 a14-20020a25938e000000b00ba756399996mr14976493ybm.9.1687382051067; Wed, 21
 Jun 2023 14:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <ZJGtpU3049d0bnfU@black.fi.intel.com> <CACRpkdZec9rukp0VvfP1Tq9vTEzhx1MdWECRB+TFN_wOVOLwjQ@mail.gmail.com>
 <ZJL4aTQxfgtg21uh@smile.fi.intel.com>
In-Reply-To: <ZJL4aTQxfgtg21uh@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Jun 2023 23:14:00 +0200
Message-ID: <CACRpkdZ7xik4uuVRFM78V2ZQzeo6zwbV-muXoDi-pC-A-nm0Lw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.5-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 3:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Jun 21, 2023 at 09:38:46AM +0200, Linus Walleij wrote:
> > On Tue, Jun 20, 2023 at 3:46=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Traditional PR for Intel pin control drivers for v6.5-rc1. This time =
not so
> > > big with the most important part that fixes use of OPEN DRAIN pin mod=
e in
> > > a few drivers. That was in Linux Next for several weeks. Please pull.
> >
> > Pulled in for v6.5, excellent work as always!
>
> Thank you, as usual!
>
> Side note: Do you know that you may use --signed-off for `git merge`?

No! But now that you told me I will try to start using it :D

Yours,
Linus Walleij
