Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDEC4B1A02
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 01:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345998AbiBKAEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 19:04:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345996AbiBKAEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 19:04:04 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C13B111C
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:04:05 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 192so20126531ybd.10
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxZ/V+H872P7cIbZPTWHk4GElDzkUtLHSf5zRWZjvqI=;
        b=x0+T4TevD7/yKF2ml9tnb82WO34Do3cFD3Vlff3bEgyWuIovxHQjVvK3YZeO58gBwF
         +h8uCbIrTRK3ATcQsfj7LAXp7qttkYe8HP8RJNqnqezFSH76IMeoppsajNRYyb6F8QgD
         NpzRL1tx129SLnGeBR+zFwYUL8kKAugapx4ykGUa9c5Yb9b1gNba2JpRNqdiJs2xLhS6
         kJJthlGLJSlo0UwHRg94OP0MKogSZQc3O1yqAtllYg6U+ipuCgIoaJ8+uOCx63v7exMb
         Uu/ryyY9TnfMfbt+FA5W+21SEkoWbis5lgxg89ZVJ0I2zKukvifgjNDW2yvloCD/1Ccw
         KYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxZ/V+H872P7cIbZPTWHk4GElDzkUtLHSf5zRWZjvqI=;
        b=vATv0mcMwTLXlGrtjyCo7U56l7P1QKSyapEwGjEeADyMN45rn/OiYqAT8xzUDoY7Aq
         RqSkpBqNGrDjFy5q2/XaBLPuFi5u2G2ZOkiK324D64FQI3qkri7yNNVRB/5qWkKpSiKs
         dUsMQdrHmq4oZ683+HTNA+h4mT12/sivn2HO6Mvi4LJ8kwAjlVx56JPhI1BRE/xScbvr
         zk41Xhqn5tSe+xyCNJnLlBi+E0g3Qpduhm3hvJaKZa2emao5CLC6VF/0LBSqd3bwiltW
         7XPuBFjKwQKV2ZiwuENt0VgoLZ7h52NTXVB5Bn/d3sQ5ZIHJRB2zKopX73Bvl2DVO0Jm
         Wrzw==
X-Gm-Message-State: AOAM531zH2yIiB1fdGwoEwW+YUOI8flDkZx3Ez9v0Qy5kGSFIpbLLXQR
        7MhVuxFPpZ+RnG5FHpqESttGuYculJwGcgkZHrtCu20jGRVJEg==
X-Google-Smtp-Source: ABdhPJyUAi1MqzkDCHFKwHKP7jqFKpT6zWX93wBbypx1IsX9zNbmKeoqBtInZJgtGmQmdlbez0Xkmzbe9diutN3Zf2Y=
X-Received: by 2002:a81:4402:: with SMTP id r2mr10049924ywa.126.1644537844281;
 Thu, 10 Feb 2022 16:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20220208104831.308722-1-brgl@bgdev.pl>
In-Reply-To: <20220208104831.308722-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:03:53 +0100
Message-ID: <CACRpkdaBaTuJDY_8_eJzaZUBOnd-OTN+sANqaUVsk5FjC70MOg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: make struct comments into real kernel docs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 8, 2022 at 11:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We have several comments that start with '/**' but don't conform to the
> kernel doc standard. Add proper detailed descriptions for the affected
> definitions and move the docs from the forward declarations to the
> struct definitions where applicable.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for fixing my mistakes!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
