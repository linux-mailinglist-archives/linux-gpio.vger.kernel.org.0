Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E2F4FAAD1
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Apr 2022 22:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbiDIUl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Apr 2022 16:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiDIUl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2022 16:41:56 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB7156217
        for <linux-gpio@vger.kernel.org>; Sat,  9 Apr 2022 13:39:47 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r13so23619637ejd.5
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2022 13:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rj6n+xEBXXPl5+jHyLqq4olpc++X7yvL2JIU4TtB+nY=;
        b=WGlSXBkiCGwBRi6oaQQk96LJaoisI66TOj4CjjqBzpVNtscsSTO6WppODq5eMAwad0
         66qvCigJ/DmAEU9EMGTxgszKDdLNhqbZ20Vq24FKZXWdBQ73jN2DQjttysi9IVFFCIxD
         r5E4lnNpmirBbLb6U4UlN7gZ5OKTUUe/4OzBJ5/NFbjnP3WRTTzSZbII010pShsOPjSh
         2sxPkIwY0/DjCz8bY2ElZLTa/EMFXPr/nKKr+snpNBqiE7kJspRCxDkuYqIhTLRBAG7R
         fc85v0kpZrYGdXMdNEods4LE9MWfGrR8RhIxYJday2V/BblHVwZ9okBLD+l4y+6HItzb
         g7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rj6n+xEBXXPl5+jHyLqq4olpc++X7yvL2JIU4TtB+nY=;
        b=X4Rc85JYLbgnpcNbqLeqcI1SiHm5iKR8DdbOEGJe1k+xph3iHkVRt4tskN9YuZJz0/
         iEGSxUkjyx64Ok4HXWYcpGvPLj5XURiCtGFxouzjtKo6yjBmeN9egPJmUhgFQrCmeKW4
         9xC9jYD/o+KaOuh+Ejr+U4ta1Ihb3hHhkM4tzJKc27AngPPzVFra8HlpgsICxEk7vkbU
         Jgzxahf+U+Gfzre83xyUqfUS9HNxy1SZxBAqNCzoUu1HdKntVTGEdjMY8fKKYIaIa/mM
         ZS/W38p6i2pO51AoS0o4vUbTIIWylx2yu8/geA1+YYkrQNp36RMqKjL6D2Iq3b7eJxM4
         ozEw==
X-Gm-Message-State: AOAM533bK61iC5EPQPS9S69js/u6r3aPs5R4HpFq8QGt2hsBN/ArbnXC
        VvrFvslnL8Gn2t6FZgd91/sj4zJ9qDi3iYmkC4jWag==
X-Google-Smtp-Source: ABdhPJzOTqsPsxztXtBKlpkCDcCm/R+awcp/VH6kw13YLxyZDQ/VhgVfkvsP4n2fs823IPxIWHS4fkQIOe6C5aKYkSw=
X-Received: by 2002:a17:906:5d05:b0:6e8:40cc:1a99 with SMTP id
 g5-20020a1709065d0500b006e840cc1a99mr12126682ejt.734.1649536786243; Sat, 09
 Apr 2022 13:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220408181854.73528-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220408181854.73528-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 9 Apr 2022 22:39:35 +0200
Message-ID: <CAMRc=Mek7kGFHh3Rgp=KY6Tu+giiAFXgBqaW2zBJv7vYw7CSfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpiolib: Embed iterator variable into for_each_gpio_desc_with_flag()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 8, 2022 at 8:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The iterator loop is used exclusively to get a descriptor, which in its
> turn is what is being used by the caller. Embed the iterator variable
> into the loop in the for_each_gpio_desc_with_flag() macro helper.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, this entire series, thanks!

Bart
