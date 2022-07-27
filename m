Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE9582079
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiG0GwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiG0Gvt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:51:49 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9AEED
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:51:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id z3so15384061plb.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/EgnMikIi8uo+fM/OCN12yQZ+z1jGKZ3qzmfrw526BA=;
        b=ZWytrUaTcrZN4f1kZ/0baKFwx3LhYBb8xfz+2Zu5Cdap4bPbZVqDfje9AirWWbxbbP
         Ft2SEI4XDldeSChkFumZHfw9tt4KBlfjIqAhkz0CrTPnE5lyUV6sbKUMoFNz7UiRY2zR
         hsDJ/HpVOwfgHIRomN3W0VeEhwyCgqunwMi+Mkv4WougCdLsYvx15agu5nTnREOC3ynS
         QcZ+HYd4NEfwtov1gShBYI8KJ+Fet0hs5lgFvP8i67qqQ66l/bq+ZO9pLEtsE8aD9tox
         0J6E58dQDZNXF+sS6t02SMCktwyWAAlLz9yjvzt+NQtqPcJijnJaWP52jI9cfX1kVSB1
         rvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/EgnMikIi8uo+fM/OCN12yQZ+z1jGKZ3qzmfrw526BA=;
        b=JunYoG4INMu1gut+kcnoJTQdaRZt2Oe8E9khajWbvOp6oVOrMtj/SvBdCszTsP2FAR
         IavLBYCVqpF2d6DXcXOYnrXwi0scCxx8gpo4N8BaY+Zgu0dGHjht2EJEyVb+fWErYq+3
         dMwv85XldMSEjgcjhDzhYeu80Q3X/yBQ4QoRIulyW1QgPsk/29lsO6S4RK38rDUW7GVs
         mDJAIa6inaYHN3ct8R6JVrYIBsMKQqribAbl+RUn0KZKLyxE25MDx8p0sPQ1STXcOexJ
         cYNNH7Fq7P3XoSA+QYgZlnIarJngGBfMZghNdZUt6aplE0VQSthYH16yd8GLcks3bchm
         ynMw==
X-Gm-Message-State: AJIora9qEqyQZBfmlPvmn0wZPAA2SM+lSk5/xpGUHExrGGezG9qzpsUm
        +NYRWoamWohj/x4BgZDrv4/MtQ==
X-Google-Smtp-Source: AGRyM1tpkrwIwFym+8AuK00HgUs6m7Wuns1c8dwDS6Ul/pin/Q2Kumg8RrYXJZz7ak9Aldnm1CH9Mw==
X-Received: by 2002:a17:90b:702:b0:1f2:3573:9b45 with SMTP id s2-20020a17090b070200b001f235739b45mr2864848pjz.59.1658904692034;
        Tue, 26 Jul 2022 23:51:32 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id q64-20020a17090a1b4600b001ef9479373fsm807339pjq.4.2022.07.26.23.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:51:31 -0700 (PDT)
Date:   Wed, 27 Jul 2022 12:21:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727065129.jazficfr54nn7f7d@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
 <20220727025903.GH88787@sol>
 <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
 <20220727062557.GA111905@sol>
 <20220727063527.xspojxe3w2tpg7k5@vireshk-i7>
 <20220727064503.GA112390@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727064503.GA112390@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 14:45, Kent Gibson wrote:
> On Wed, Jul 27, 2022 at 12:05:27PM +0530, Viresh Kumar wrote:
> > On 27-07-22, 14:25, Kent Gibson wrote:
> > > So you can't run tests on those platforms where bindgen is problematic?
> > 
> > Specifically for my case, that environment (rust-vmm-container) never runs
> > libgpiod tests, but just vhost-device/gpio tests. So it works.
> > 
> 
> That may work for you, but in general it would be better if the tests
> can be run even if the bindings can't be regenerated, so the two should
> be independent.

Hmm, then we can take the same approach as for gpiod.h bindings. Use
pre-compiled ones unless "generate" feature is enabled.

Will do.

-- 
viresh
