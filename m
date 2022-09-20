Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6937D5BE860
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 16:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbiITOPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 10:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbiITOP3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 10:15:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F348647EF
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 07:12:56 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e18so4071285edj.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YIyItbkLkmxKD8CgXR4y1ddTk7bebY2IrRZURLFT87A=;
        b=Dl8xcKgapKaVTJXbeunOwUi9DZDVSRhXVHUqh1JDr6YQoLDaVyUoXlhEwy0/cRZQcf
         APvdJ+30RzO7Us9ytVxWjFVKH5n4VLNmimPXR76zGoUn0HF/r7gh2XHUCfN14OZ4AkSD
         C5Nam52w63cuiPfOTjH7Ga8VXWU/jMDvGkBxgz1fhqLwU5SJ/275J5HOrs91InM3pyld
         OX89sSInNsBeln1y/aFN0QDCjh+IwpOuADx3vDb7ypMxbaqEtcQUf28CK+LznZ2lVwKv
         r/AcPLRylqCeaoFGF6rxc4dx7XPkglIdQuAcCVn9HpF/bCojGnWzC12KT3FI6OJuO/UC
         7GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YIyItbkLkmxKD8CgXR4y1ddTk7bebY2IrRZURLFT87A=;
        b=uwn7an9mq3Nylh5G2l7NQXzTB/RVHYcaEuGb6QcFa7RUl9iJV+Xm+1tScfst8B4mQ+
         xrxdiKwqf3XtoAxm+Bcxqjv7B3f9pA+zkTYssMP1PI7GYdzPX+1U8kwrn4WkkvKaMmwE
         NLT5jzOP1hhZFM1siaVj50Ku5/ZntTdj9WepXaef68umHl542qzBpnqVNQiZT9f18mls
         SvdC1/0DSQS/lkXRooA039hp4K1aCqaL54g3P4MeknGpirR/eQqC6ZWHqZirex3zGWwW
         fgGMdWA6oziZOLP5Dx0ivjalYX6iqfVEJPTeVEkM9dMrqZUqP5pl8k9xdhsfoNCMOmnm
         Eeqw==
X-Gm-Message-State: ACrzQf2Kz7z5xOEM96i9bLsjqykvKIHaEwl3KPESvQXCvWLiYs6zW5Js
        y9ZfgXQL/x0YFLeu7/zHPyu1Wucf2egUAWVL0Ig/g6ELsGbtICV7
X-Google-Smtp-Source: AMsMyM7J15wWxbTFlzZSgYfiiylPIv3+kBMYGJvCWVtWORchIHq6UZNILh4zaaXvYH94/P8QnguHe1vwOXxMwe2FOkQ=
X-Received: by 2002:a05:6402:3549:b0:454:414e:a7fd with SMTP id
 f9-20020a056402354900b00454414ea7fdmr6801591edd.69.1663683174580; Tue, 20 Sep
 2022 07:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915203254.48357-1-linus.walleij@linaro.org>
In-Reply-To: <20220915203254.48357-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Sep 2022 16:12:43 +0200
Message-ID: <CAMRc=MdZnSj4o+c5kqOkEZTp-RKQOVw+GAsYg2R3dTTh1OjJYg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: Make irqchip immutable
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 10:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This turns the FTGPIO010 irqchip immutable.
>
> Tested on the D-Link DIR-685.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Queued for fixes, thanks!

Bart
