Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44924563254
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbiGALMG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236974AbiGALMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:12:05 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF6804B5
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:12:03 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id x184so3396277ybg.12
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2TszTaDtpfmjFyKVHhbbJ4khGE/+OdgwQYFW//utCHk=;
        b=dtGL3l8fJuFMTVv17tEday82VBfeOMW26szuy2jVB93th7Ipnk94ZecfTwCtWFU/R6
         Rbz43ONlvgPJ/+qCUpCNY1Q4Pxr2hNsFBGfOQCz4+u0B52WWSLBH3HsdQimASRoNpCsm
         SeSap9bH5DJguaFcCa5papoZKn6om3/WuiJVcxSBPSwj2REEbniPT70Vh6ndNFaYDlJ6
         T0meXsJQWvR0pR+5N15GqXjod4PXyB6pvA1zNFuumGBYiROyRETYE/g5LFpXr22FJ3EF
         N9I7UH1BTsSp1UPLcCldIEdyaOfJF916vm/7DF2zc6SCHY859lXyksMxU+LErnF9+Pqo
         5nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TszTaDtpfmjFyKVHhbbJ4khGE/+OdgwQYFW//utCHk=;
        b=gBUvs2e7vKyZ/ojQemyrDXwv6IXd2Ptqr0wZ5m146VNM3y2LCjEvBRivVuQ8kmHZcG
         eioA76z8tjw4Bm4i2pM23QH3OjsY1GiKAp9WuBwRmcFTCEVfbYHoxQP+C4FzcB6+UY2P
         1yTUAg7AfvAqbdua0HAiKjLOfNkEnahb7fASj/zyVQYcF/+8ob8AM72onvGP61HMK+Ia
         1cs15xTGrWerZt1XqFpF51jvfoXlpM//02BP4uiznM6YuJ1eYG0Alr2c5CL2qlAyKYPy
         Dlh8Vcwr1mNKcX4fYlP3FJx30II8GMF7tnlkkH2pthUaUig5LDSvTZcyGAXi5idmhQ1B
         E2ZQ==
X-Gm-Message-State: AJIora9roX73PN1laQOlpP5qPqjEqur4i2xxl0vefgD6aC513fH4OldO
        cqIOz07lYW99B8QuBsUEflgc2UnNzn5gdCERt9Q=
X-Google-Smtp-Source: AGRyM1txxPRJ7tu0YRWTqQljuU7YqYT0nWNh+ZY4c2ce4SQYFjlRF4XefIUbPTGGLmJ5s1Ym7gJbACsxXIlCX17bve0=
X-Received: by 2002:a05:6902:10c9:b0:668:e27c:8f7 with SMTP id
 w9-20020a05690210c900b00668e27c08f7mr14645478ybu.128.1656673922257; Fri, 01
 Jul 2022 04:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110056.58502-1-brgl@bgdev.pl>
In-Reply-To: <20220701110056.58502-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jul 2022 13:11:25 +0200
Message-ID: <CAHp75Vfx8JsvwnCMro9S6LY5Pq-OH8y5p3b7szQezA-F9GOHLA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] misc: make gpiod_is_gpiochip_device() not
 set errno
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This function should just report whether the file indicated by path is
> a GPIO chip or not. Let's rework it to not set errno. Failure to open a
> chip should still report errro numbers like before.

errrrrrrr!

-- 
With Best Regards,
Andy Shevchenko
