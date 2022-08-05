Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2902058AC60
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 16:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240789AbiHEOZs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 10:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238458AbiHEOZr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 10:25:47 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CCC22515
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 07:25:45 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id c24so5288865ejd.11
        for <linux-gpio@vger.kernel.org>; Fri, 05 Aug 2022 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=J302C22miSb/flHFaA3Gv4eDJce+0jMPvIas9aeRRYk=;
        b=bz+8R0b1BqOaBvNOoNzmP2L3lFCxzGRNHvfh7US5jCZA6zjAZescSDYgrJNoBb/WMJ
         eMpuYq/fpIpwj0Q4+ZnXk/WPKuvcXHX/CFa3byzy7S4S2KMeouZn4Dz6PFyJoKNftILN
         kebYiedaLacVoGtnQ7F2SPt3g3PDXxTwWmeEKpldYvtYsxuYxeRsZpudLFIicPRzhIjM
         3QfCPqx8oQPQzxsScaUbpTtidkh0EZK3mNpjUMbH2oQ17Wt0UqW4AVUVHygsj0pWDQG/
         fd/a4wn2bGyRUD4WyOYrutrLYaKiXlzitUUHthFJm3lXlv1wHmNq75Axv1ma36Xi8U0u
         YyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=J302C22miSb/flHFaA3Gv4eDJce+0jMPvIas9aeRRYk=;
        b=gvyMvuOuKVcJD966j0FV478JOGlWwvqfhoWfSntnQN2YcValLjqKptvK3jtM7m61SK
         +TrqqnMeBGdmtJpl5Db9KVw86TIShvOOXr698jbghifqJTflSCe6cOfe4u2NZDOESZKw
         eNg8qoRo7/R/aWr2EH1FCb009Sij+JflbdTeYlwroadLUagiWhy1sJDV2ytbQlHm1s35
         AvQBSR/KgefM7Ms64Ebj4cabj+eqOVJlfu67dsIhCxmH5RJPFYYRsR1GsYBpTtUVM/qx
         gG7YMwI2IxYgZ0eYqp8J4aSfR4ONnrjNH5ZRwh8Idy4R1if3Anr1CK7VVwBSjHv7fK8o
         +35Q==
X-Gm-Message-State: ACgBeo17QQ2kdFY5oDNYIHSGnaXbvRoDwtv4fNs8J7zziGeO+KG6E75e
        0VEoYpEu3NZfGaBRIWvL/U1xBgBPPykayPmNluxPpA==
X-Google-Smtp-Source: AA6agR4YzfA7E9pclpVdxQEjUzCSmyH2akWqbVVhNapIRX9ZdmpMJwq1AB6nH/26Fpk11t2BPYJ3j1CPHNd7PQiSuXw=
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr5372277ejc.734.1659709544517; Fri, 05
 Aug 2022 07:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659442066.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1659442066.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 5 Aug 2022 16:25:33 +0200
Message-ID: <CAMRc=McD8ouds=t0GtOOUY6_F9ecqEKg=7XvU31=aZDL3+3u4g@mail.gmail.com>
Subject: Re: [PATCH V5 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 2, 2022 at 2:18 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> Here is another version of rust bindings for libgpiod v2.0, based of the
> next/libgpiod-2.0.
>
> Pushed here:
>
> https://github.com/vireshk/libgpiod master
>
> Kent, I hope I haven't missed any of your comments, there were too many of them.
> Thanks for your review.
>

Hey Viresh et al.

Thank you for your hard work on that, we'll get it merged eventually. :)

I'm just letting you know that I am following the discussion. I sadly
don't know Rust well enough to be able to review the patches in detail
but from looking at the code, I can tell that you followed the C++
bindings in how line-config works. Looking at how line configuration
works in C++ and Rust bindings and how I struggle to translate it well
to Python, I decided to take one step back and revisit the line config
in core C API.

My goal is to tweak the data model in a way that - while making the C
API slightly more complex - will allow high-level bindings to expose
more elegant interfaces using mutator chaining (like what is customary
in Rust and what is also possible and often used in C++ and Python)
while reducing the usage of quasi dynamic typing using std::any in
C++.

I wanted to post my work this week but didn't manage to finish it and
now I'm leaving for vacation. If you want to take a look, the C part
is done and available here:
https://github.com/brgl/libgpiod-private/tree/topic/rebuild-line-config.
C++ part is in progress.

I hope you won't mind some more reworks to the Rust API but I'm sure
it will be much better in the end and more like what Rust libraries
typically look like.

Bart
