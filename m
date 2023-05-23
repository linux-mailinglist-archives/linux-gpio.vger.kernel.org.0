Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7564C70D819
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjEWI7K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjEWI7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:59:09 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA591139
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:58:52 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7841f18f9f7so1485372241.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684832331; x=1687424331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFLTcRy2N0UvPET3C/xFrBjQWyA15WWYRqkz704pwVo=;
        b=r4bLLBv6otuBtne6V2AsArlOGSjVvhWXOMmTmrcRYC1lwQmUfGiROR71cwQGBcgqU3
         SNdBGLHhsDtLGMUMXuKyGgR2aU9JVcu/3CRqNFeHF1qq89tOHHJCdRK0AyBLVTIgLVMe
         Pw9t8r1PukhJwBnaHAnn9KkZIcQpHiwqh4rEsjO00eHTF5XMPhBefi5u/9OR1x+c6Fcr
         Z4+9seGiwZqbPkZHX00pm63cbYRQvDyPo2iw2DpJCF63/qU51xrR35HTjy0wBlXQEbzP
         fewfhPwjq6xEIuVUzFFMPrg9RBP5mkBx42aZejzNzKKWsc45rRr6qG8Crqjjis8j5NkX
         DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684832331; x=1687424331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFLTcRy2N0UvPET3C/xFrBjQWyA15WWYRqkz704pwVo=;
        b=ALyyS1ozbb8wNoyePyJ7P7ubb0W2F8bc2U/cAStSX2zd8nb0KZpV8eXAAzLzsSR14F
         nvD1SKrbpGvLQUEhhBAC7s5car/W5QAwDdvhcJk124dB4FM6KTPEpx72AIBPjx6fw5ya
         sftIRIsBQeYLgdSwKn8hzL8M0koinynXK+1OTJkdtCq+FxQgFdfpgGz2oYiDvHnIvMjt
         GaiceqTCRnSwP3Ija5PmYcHv+zI4BMAw7uOErf0UzuHOGkYmVRGcpo2BoQ6WqCxrXJmr
         dPtkKqZC8KiqZ9JHXBRY8HmdqEnVPdTDrOc6Em7P3ZrpusgKRCdauLtJAjPUYVqmnay6
         3lQg==
X-Gm-Message-State: AC+VfDxo0Y1IsVD/me/NZDyOtXGqnbGJUpZktGHYbOb3FA4DuYx+FtWp
        e6fRtT7Cev4vs+ep9JPub6mX7m9Fy/kJmQ5XF9uHfg==
X-Google-Smtp-Source: ACHHUZ4vQgFkWMCHTAv3Gnr0CA7cUJGBS970F6Wx4LxzSKTElNhFu4JuagpwyJaLb4ptGhkvThXj0y0NI0QA+A4rJXY=
X-Received: by 2002:a67:f949:0:b0:439:4048:8534 with SMTP id
 u9-20020a67f949000000b0043940488534mr2205256vsq.25.1684832331587; Tue, 23 May
 2023 01:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <2a4dd7e50f7be9d515059f1ac4709eb2fdc7d36d.1684828674.git.viresh.kumar@linaro.org>
In-Reply-To: <2a4dd7e50f7be9d515059f1ac4709eb2fdc7d36d.1684828674.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:58:40 +0200
Message-ID: <CAMRc=McVzorp4QUgrDCxxLs-TMc08vwnW9-MqnZ+W+TPJiVxRA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: Fix typo "SPDX-FileCopyrightTest"
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 9:59=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> It should be SPDX-FileCopyrightText instead. Fix it.
>
> Reported-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Ha! That's interesting. :)

Applied, thanks!

Bartosz
