Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCD4505E9E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 21:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346848AbiDRTmN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 15:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbiDRTmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 15:42:13 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506DB22B18
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 12:39:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so28679046ejd.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 12:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/zDMwia6t12aSvNrfhvQf5hInNkEPR6icKxdL+34ZfE=;
        b=3S9qV5GMKWzNRf3RL+4AwaRD9bHvCecyfie3iQOsJF7g3U/cp8VLZCDzogvK1Gy+b/
         xbMk0fugwk33KF6Pfr5R9ifs7gIvqVB9DfFAOYTxMOfvfgGtdbX1emqEzmqMv71wjNTs
         utAZKMxiZ7ZGielnU2zd895HzJs2GsEu9WVktMrTjIjw3FWEbr5ahIzH/Nua06/JUkfi
         U6di2eNBzS1S2gc3Fu/KI0YiAEtQ82BpMhElyer73Foa3G7anwaRqBLytnnOnt52JOJr
         21TC3/7D34qBDGmN/r+Ijqd0+eFT4fmETIkDC9l4oWvpVGQGSyUsQEcQjwp6+51QxVUN
         apng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zDMwia6t12aSvNrfhvQf5hInNkEPR6icKxdL+34ZfE=;
        b=2hAqw11EJVH0TayF47oF34wQqYRLQ4knxOMhqzFxApY58DQGYceP+lypyp/xwptS/h
         S6pUx+b+h6Xg9klN19VPNKU2Az0J7y1R9iB0JKD7tPpX7nxZSltnr72lZaQ2LGPCHxNz
         2WjrsHoF7eZZoyyvSucoAZ46VawGvwz5f3+ZK0gfMJGZI4xq88HXif1zZPZ7AOlZUZcf
         Ugc5PkOIs8HzSFmi/7f+3JS3lg2UMk7sXiUJzWbm4GkjRysAI8t+TOGsKK0J80YhjTcP
         NzKDuWZqblj8Qvw3CyOWnZj2JpMrYDVHGMFplCje6ty52yegakUYMLNI1j2fbjKfGPru
         XROw==
X-Gm-Message-State: AOAM533AN4CJ5DIUtSGdjyFKxqbxjCdH5aWLi75L9hyrfDYIf/59xKLz
        W7wkLVzOPAQOw/aEZ3ERbioIrzM2s2oTM65PMR5c0w==
X-Google-Smtp-Source: ABdhPJzdq3yfAIFv1TYfCrdjS91XNvKLw6bAh0Ndec9P+VszR1fQmiYTqS/pvVgf9w7GqyuGEOC41aYMvS2EYokFupE=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr10477168ejc.636.1650310771875; Mon, 18
 Apr 2022 12:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220406205327.2332687-1-linus.walleij@linaro.org>
In-Reply-To: <20220406205327.2332687-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Apr 2022 21:39:21 +0200
Message-ID: <CAMRc=MeG+SdvHwVBsy5mrT=3ow2xkGpu-rWeSYLZKMjZUhQ9cQ@mail.gmail.com>
Subject: Re: [PATCH] irq/gpio: ixp4xx: Drop boardfile probe path
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 6, 2022 at 10:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The boardfiles for IXP4xx have been deleted. Delete all the
> quirks and code dealing with that boot path and rely solely on
> device tree boot.
>
> Fix some missing static keywords that the kernel test robot
> was complaining about while we're at it.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Hey Linus, this doesn't apply to my for-next branch, would you mind
checking it and possibly rebasing?

Bart
