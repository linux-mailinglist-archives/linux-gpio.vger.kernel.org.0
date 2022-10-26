Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B9660DCF9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 10:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJZIWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 04:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbiJZIWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 04:22:43 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B22C3573
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:22:40 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ud5so15688749ejc.4
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C2fNgfK9QPZpMfAspXaOe8HD4bbKc2oxtDjn7EBlThM=;
        b=bd4AJmbokpehkjDHWElZ6ytKQrcHydEV8mTwQiXmanDzPQjCC5VzXFfzpqI6BIa8nW
         GvwPqgo+c6yeLMuy1nq0WqwAOosnDP7VBOfRujXhntOR+FLvCqIH3bJ+L7vAutF01smJ
         b4UR4vay1gV8O+FWvuwpIvVSFPhBLqQwwjKW/x3MLIuR7NHLKk3lLPobqBMyJU2WVvBO
         unbriAF/MtkvNNqdJzAxv7wi43KVsVH9bsw8Oc2TjllkBRXn9+J2muq6KWaooX4Zf2Cl
         DOY3VMxCC9WKbJNty481QhYI1LoyTMeO7Bh0UzsEc36EHXw8uG6e7vdKc0PSH9Nkp4qq
         jAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2fNgfK9QPZpMfAspXaOe8HD4bbKc2oxtDjn7EBlThM=;
        b=Ax0oQtcqRc46AMBoZiLloaVPceKKZa3U+ZVaR7IpCUgGJGdl7HtxEq48B0D9eSgHP7
         9JzhRK45tHzEcESYC/vuQRb3WDJKll0BjZsOB16Jza8ahPuruvDNvRK2oA3PdhTvdFhe
         6FYEwJEbZldxXo5Cne4OIvci7gR5DZscFrdgDktwOWc6TGlzrhtIV7wuEJqLqxHWQKrT
         3cpRX7ppV7yleI3czvpw8hna/qhy1tuFioV7kZ+y+td0KCKIc30TiJCTXe5wCGp9jUpH
         qIYVEQzL2eqi60PqDraGXpmwXFGGM3b4mQvXX23rWMtKQz+J/NJ4GJpNB+v9YdpQmRO+
         fQ+w==
X-Gm-Message-State: ACrzQf0B42NZn0pj5lW3vQdx9zdoHaKWMs2a2DJIzOHiLjJ+mlccZPVn
        tLprKx/hAmqPnU/GYLIohgRFfysELKxEKXtHPh4gc6QldK+WAA==
X-Google-Smtp-Source: AMsMyM7fMMRKy7xD8qYXa6vQyiW50PX/F9cvTUKlPX42BrSM8NMgLv6LjMzeDOr/SKwDH31LwXmz7y6LXgRrLimTktk=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr36402448ejc.203.1666772559334; Wed, 26
 Oct 2022 01:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221024080828.3840438-1-jk@codeconstruct.com.au>
 <CACRpkdYEVHR0LCnxn4q=6Ccvu+vWOzR5XwAoaEtPURkubz71wA@mail.gmail.com> <4407163c91f21fa56f88d069a40b738ed307a812.camel@codeconstruct.com.au>
In-Reply-To: <4407163c91f21fa56f88d069a40b738ed307a812.camel@codeconstruct.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Oct 2022 10:22:28 +0200
Message-ID: <CACRpkdZM5i74AkP4HcPcswGTF5B09=FxsrtbXPMZq4dvzPhPng@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: use device name for gpiochip name & label
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Matt Johnston <matt@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 24, 2022 at 2:45 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote:

> > Out of curiosity: what device/SoC are you using this driver with?
>
> Thanks for the review.
>
> We're using the ftgpio driver for GPIO peripherals on the microwatt CPU
> implementation; the driver uses a simple & sensible register layout, so
> we've based the gateware on that:
>
>  https://github.com/CodeConstruct/microwatt/commit/03293903
>
> That's a fairly arbitrary choice, but it works well as-is.

Haha that was a clever choice, adjust the reality after the map :D

I could have done it myself!

Yours,
Linus Walleij
