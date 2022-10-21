Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9833E607D99
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 19:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJURfJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 13:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiJURfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 13:35:08 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5AA8E71C
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 10:35:04 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id h24so2083733qta.7
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqmXpbUlQQXekXEtSk3XTlvTBFnAf0ZtFknzInIV8QI=;
        b=aPQqjt3f5TuRi1y4l8mLxIM4Ubx+0PgtU08JXVlinQn41r6nBNo5qyeqniEN9WhEv5
         rLgSFxeMwHFONZcpTm/4BDxWrdGgNQaaWGpEhIH9vmlS1C6k4MsZCWTg5OI3r37Cb+GG
         SwuaNJF1EQUtYAD0w4MKV4M9ZCqe+TGNRbq/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqmXpbUlQQXekXEtSk3XTlvTBFnAf0ZtFknzInIV8QI=;
        b=eYtUAyFVpV5syPBAbe+dDOilZAKUfby2AU5FJrRetHL5tc/VoJpxuhXnPA9Cih/q8G
         Jes89sHE/232EACDcazPPEP16HUJRsBlqjcXo1scZD5nEkbpJl6RnOi/RONLP4hHWiLw
         u5wdp+dBvw7vtz2yWEcK12oYO2aD7kKWMegCA/l23LWmWt9m11OZtA/3LfBlGDRB6FtS
         fe+WUn4rSsNmUmS4tqj6oXT5+f08n2sqiaHKcPgrKlmw/ZKtQUc+OpXZJH187HSRzrbl
         AM/eEJcmgP/7e0Mlbq907G9y6pyCAkTj5qz3OGz8jJ75a+lWycJ9cXeSetzR5/4sQ6CJ
         n0Ig==
X-Gm-Message-State: ACrzQf1M0UhKO0k1BwLWmPL7CFmb5uud3vdoStkYJxqQut9KQSc++Ct0
        OueH8wG92OiG3mOZgyS4RVvyqmsb+yJ0ZQ==
X-Google-Smtp-Source: AMsMyM5AwMMrjmdqrMg8XS5/XBsX3FrDcGEmABDw6H3y4HtXp+CjgUFadZzm9pxg9X9F55MtMXYbZg==
X-Received: by 2002:a05:622a:342:b0:39c:f1a5:7333 with SMTP id r2-20020a05622a034200b0039cf1a57333mr16744534qtw.505.1666373703130;
        Fri, 21 Oct 2022 10:35:03 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id v11-20020a05620a0f0b00b006ecfb2c86d3sm10151507qkl.130.2022.10.21.10.35.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 10:35:02 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-345528ceb87so30033947b3.11
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 10:35:02 -0700 (PDT)
X-Received: by 2002:a81:8304:0:b0:369:f5aa:46e9 with SMTP id
 t4-20020a818304000000b00369f5aa46e9mr3671073ywf.340.1666373701975; Fri, 21
 Oct 2022 10:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdbqRy5pXiy2r5CBiBXd8j7VbXKq40pmx_eXtFMynyAMug@mail.gmail.com>
In-Reply-To: <CACRpkdbqRy5pXiy2r5CBiBXd8j7VbXKq40pmx_eXtFMynyAMug@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Oct 2022 10:34:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=win6D4mgA04-D+S96n4aTNU-hx94e2ftF7rQjHb46O0Kw@mail.gmail.com>
Message-ID: <CAHk-=win6D4mgA04-D+S96n4aTNU-hx94e2ftF7rQjHb46O0Kw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for the v6.1 series
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2022 at 1:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> for you to fetch changes up to 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

Well, I have *no* idea what you did here, but the pull request claims
that I should fetch that Linux 6.1-rc1 commit, which I obviously
already have in my tree.

That's also why the pull request then doesn't have any diffstat
(because there's no diff), and why pr-tracket-bot immediately replied
with "it's already been merged".

And indeed, when I fetch that 'pinctrl-v6.1-2' tag, it does have your
signed tag, but it just points to my -rc1 commit.

In other words - can you please try that pull request again after
re-tagging properly - because it's all kinds of messed up right now.

                Linus
