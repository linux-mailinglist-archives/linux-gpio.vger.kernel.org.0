Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DB85BAEE9
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 16:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiIPOF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 10:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiIPOFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 10:05:45 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014201D318
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 07:05:44 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r12so24570216ljg.10
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nPsSPucMBuKtAd8AfZmYJlLAtpXVu8go4ahtDG4VctY=;
        b=UmQ9IXGR6XcCNXRD2DdV5uYcKzvLhdmr2An44e3UEarwwC0ssykFVCSD9XSpivnMJS
         BTCNHB5aEiYWmpQ0B0Ha17T53z8CXBxGc6u0cf6KqNzgqalgKi69MrSZHYHD85ib0qVA
         D43sGYn6lNB3T7DBJ56h64qScbc/4GBc6bHr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nPsSPucMBuKtAd8AfZmYJlLAtpXVu8go4ahtDG4VctY=;
        b=IpTsXg90/5tEX+ZGblBCUTRCO9KmfjR1FPiaRdS3/1kS+aOr8fCnzYjDVXxBKfGtJp
         kj/+K6MzO5B31fT3sjH9S7XAqRM0esKUC/XVauW3cdVCb7j5az1n/VjGuuPol8QpPH24
         G6ik1ibM40oHN0fj/MEjrqsasx+AmFsJvz9XqcNtXF2gwfKSYxLPSOw5kvThi/OzcaCe
         M/KEc5VcallQVA2m36iI1680XGtauHBx+Os090+I3HrzSUi+Od0IVlX7+csq7xQkCsfV
         ttkHWr2Psth8gFlLxYYrdI24Ozl3G/d2dqD+K24zwC+Yxl7SQhfG3j8fxKEAYerkYskt
         T88A==
X-Gm-Message-State: ACrzQf3edHUMWAN1U9cnPiESN9vdTrnHwzzVug0DBZpG9o7jbNjQ5Wts
        rwmj+3RpvC07XWTXc++r6o6u815RlVWPwr3mEBU=
X-Google-Smtp-Source: AMsMyM7vVyQfA85TcgsHVTipE8zG8B0oKy+7vl+O1cHHLr1BozQqW5n6Lp/HHRgI2XAhzUhlkRf2gA==
X-Received: by 2002:a05:651c:1692:b0:26c:37bb:de2 with SMTP id bd18-20020a05651c169200b0026c37bb0de2mr1370431ljb.463.1663337142058;
        Fri, 16 Sep 2022 07:05:42 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id e19-20020a05651236d300b004994117b0fdsm3497697lfs.281.2022.09.16.07.05.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 07:05:41 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id z25so35805733lfr.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 07:05:41 -0700 (PDT)
X-Received: by 2002:a05:6512:31c1:b0:498:fe7:b46 with SMTP id
 j1-20020a05651231c100b004980fe70b46mr1699244lfe.549.1663337140735; Fri, 16
 Sep 2022 07:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220916074253.781428-1-brgl@bgdev.pl>
In-Reply-To: <20220916074253.781428-1-brgl@bgdev.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 16 Sep 2022 07:05:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh7XqYTJgDHGF5xYBNJEKtf1wQ7Gg3vjr+onevNN8uHvw@mail.gmail.com>
Message-ID: <CAHk-=wh7XqYTJgDHGF5xYBNJEKtf1wQ7Gg3vjr+onevNN8uHvw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.0-rc6
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 16, 2022 at 12:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.0-rc6

I think you forgot to push the tag, there's no such thing.

I see the branch ("gpio/for-current") that contains that top commit,
but no fixes tag by that name.

              Linus
