Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2765265CB90
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 02:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjADBhl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 20:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239013AbjADBh2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 20:37:28 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AD11789D
        for <linux-gpio@vger.kernel.org>; Tue,  3 Jan 2023 17:37:26 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id e141so35091093ybh.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Jan 2023 17:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+6CzOy0CAP0ecsYxKWZ90I9ape91rJYpbkSwqevcg8=;
        b=N6YHgWrsP9L3QB2IT95p8DJprk2mLCA7HuiNeqDr97A9qDEymEKWo73KguQM93wTCX
         2aOuVlAO4ZIUXQWHyGZ5p5WvA3im/McxYtWRPbSSZKO5oYbc0YwP8ct3wTHzpHsnO7lc
         TXskQkYzp++vcFX+bGEwOz4jpBN6Yjn7r5IgvqxGBzCPFdP9k41pzncXQaAFgUyGKOW+
         uuDlMkI64pFkP7PjcoLnLgooVTUg/NI3X+JZH67mwu88hbgYntocLMgH2RKyN9B9F4KM
         9MuMjJE/xCDGEx8rmNL2iOazXVc3c9rR+Jo+jkODdVsExDRUUSTU6zRlJCFv4kI0o8w6
         X/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+6CzOy0CAP0ecsYxKWZ90I9ape91rJYpbkSwqevcg8=;
        b=VU5WqCzhQRHuuseK/6vej7HD6aKP6tK0W4CgAB9Y+EUEAtkVDglh+7w0JLzeIExaMS
         Qp+NtBg4gq+qkoVD5h+U6RdDOVFeljcXZ3hkJyr/PIVW74eOX9zqmhfuNz7hq0AEnQ+e
         7dLSP+lpqplWe5q+MYdYVdzBx+adqkJExS4MLOn4osOPHkUWfSuKwGM1Uut3KtEaDWsf
         gIQZCBY+S8CU0e1kvwJG70Or6rxA9SQ0ZEt7+kjo90mTCZQGXcX4th10vIrNyGwC17q/
         FKEpOuQ8j3rLJ8ixDq77U4TDGhx37o3S6Ra/xZ+C8irpcR6VAjlD08IMBIkp/5hli+Su
         ARYA==
X-Gm-Message-State: AFqh2kqdw0EZLA7lj5EvlVgN9aOyL+zC98VR9wEXA0uFV+lSeUOTbJNT
        WTB+Tty/CYCtnwFCNalt7IWaWQkWjUdJviumIHNHvA==
X-Google-Smtp-Source: AMrXdXv3VLQSwRtgRUrr1lfCnGaSVr+RhK0rBcgaiEy8h0FqNpr8BCTTGDyCU8D3j/XK5+BHD2k5/vUuaJCsESsZyUU=
X-Received: by 2002:a25:6d02:0:b0:6f9:d605:92d1 with SMTP id
 i2-20020a256d02000000b006f9d60592d1mr4726402ybc.341.1672796245815; Tue, 03
 Jan 2023 17:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20221229100746.35047-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221229100746.35047-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Jan 2023 02:37:14 +0100
Message-ID: <CACRpkdZGx+Sdsx_=cuQMsLJZMWixVf7QFPzEfkTrJLEUOfg1zQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: nomadik: Add missing header(s)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 29, 2022 at 11:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.
>
> Fixes: e5530adc17a7 ("pinctrl: Clean up headers")
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> v2: removed double inclusion (Randy)

Patch applied for fixes!

Yours,
Linus Walleij
