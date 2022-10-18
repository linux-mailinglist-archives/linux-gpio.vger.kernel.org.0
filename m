Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6F4602A6F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 13:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiJRLnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 07:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiJRLnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 07:43:11 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63C636417
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:42:52 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id p16so11459784iod.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8qPG73v0X7b3NNFxz6W7Uj8I8mazDfgdBcdwX8NdRw=;
        b=aIOKOlHlek/ztjhO1JQwEIeLI8uF0YrP75AtGsAq57cPpMukJssnLb5WVRxv5r5R02
         i4qGrLybf05x8Sw2QMquZqqQtrB4LgF9M25Q+SlxV5LL8khiedvKfzQoLSOdlcarCs7G
         n06sw6PObzO5qsAqDwM6KDeyTqSHvl9V1Vsn2wuUypoHdVbzZNz7W5uYW0q60vqinTH7
         25QmTE7UAaqjQSO7Z1V887vx1C0u6YnULApeAI9DC/Z4R4dc+A0LoJ+W19vW1rncljF/
         VYUuWsIi+IQxS71pEg/n2oHU8pMuEs4zk70Ya4Coq/6OMTtlH64z8MZDRDrVp29rnGMu
         5lRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8qPG73v0X7b3NNFxz6W7Uj8I8mazDfgdBcdwX8NdRw=;
        b=ADNXjZnyH5Mqj//ERE2R22GOr18mzgoT3G1bU7mojOCm22/RL8f5Rxys9YqHP2c6PS
         wp/g2GmbwOb0EY9y5yS04dyF/qJMdxyBEqIuJjUzwidJ3h5WudBQ6PbG8v7VdCi3WzUW
         xbC+eFhEyefhu7cXdGJTVAL58SxvX2mg5cV22zEy0MARd5f1GyCPOXvtO6QxRwFIIIEw
         ho0lmt9wZX5VSKHtTktHs8TDKA3/ZsLCmyLlgmNR6IpcO0tF29emhfZyf9vKvszyfaQA
         BPV9R1uN8dCQShgj8r5McGQmvzZYU/NZpMkaNiwbly7rcSQZ1zzNa5h33E5c+Cs5Wm+P
         PvPw==
X-Gm-Message-State: ACrzQf1RBzwVd6GkG+uOT1ygStz9nIe0SP9sHbZnkMZmQA0Voq9XZnHB
        5UVt78wqPjeXq1UwH2bHvtHPV3h73+yX3ss6kUA=
X-Google-Smtp-Source: AMsMyM62BEPAeFTPCv8iLuoq53gKPe7ehPBfv1lJiHAu1XpaNX5uVE/9vGQ3gcHqCOKKg4fAvZ6E7uP4fBZPpbp93Aw=
X-Received: by 2002:a05:6638:14cb:b0:363:ed95:ce4c with SMTP id
 l11-20020a05663814cb00b00363ed95ce4cmr1580500jak.308.1666093371919; Tue, 18
 Oct 2022 04:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol> <20221018112204.l36wnimrqvexnvat@vireshk-i7>
In-Reply-To: <20221018112204.l36wnimrqvexnvat@vireshk-i7>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 18 Oct 2022 13:42:40 +0200
Message-ID: <CANiq72=sf1-otwgYfEDRgfv8TMjAE7A5XYSjoGaxpxE6rCyGWA@mail.gmail.com>
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 1:22 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> +description = "A rust library for libgpiod public header bindings"

I think "A rust library for" is redundant (I would write it in
GitHub's description, but not in Cargo's). But double-check with a few
other well-known libraries out there to see what they do for their
Cargo descriptions.

> +repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/"

No need for the trailing slash, I think.

More importantly, you may want to add a "documentation", "categories"
and "rust-version" keys.

Cheers,
Miguel
