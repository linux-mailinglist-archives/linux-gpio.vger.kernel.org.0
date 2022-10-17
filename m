Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9035600B9C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJQJyd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiJQJyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:54:32 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931F3BE14
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:54:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id sc25so23582422ejc.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j7VZBmDgo9tDAmWCTFI4K5jowac2yHy5VPYWOI1fIJk=;
        b=AjGwItTIK1GE1Vn7lsicfvWQDp04n2RMfXWhWBj2j3SsVmCXmyb+9rMlRl6aOix6Cu
         8IzhXWm4cAsgK/ZBfmN/pifPkWQp/fc5rPbgoTTAHZvwfrGIKyzffXzC+7T88O1d+4PC
         teXPzuPBKSMs0ep2C0pbN6elY6hkVjVyKwwiygu4y6uVZZFVBSVXUsIYz+/uUO3Xk2Su
         ft6opU0s8fh/q1NbmXrWPwfScGpZQx37wnMJl6BGVb5mR3JjdWLH0Qy+tobxnEY3zHuv
         HLVFzBKmHCOWSZZpNM3faQTdcegbgDB0XiAOEwJLuAvLVAxDXRTQBr6jQ71P5sq5ujaj
         F8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7VZBmDgo9tDAmWCTFI4K5jowac2yHy5VPYWOI1fIJk=;
        b=HH35ZDQ0SEs4Xcqq+mc+qLv3+4ZnE+0X3FYvHJoc1Vt9oi459m3ovnao62A36aahvl
         1Qa+ou5VYBcS8Er7e9q/G/lKoGIq2EFbg0z1UD6XOmaqUO/LL30K6Pjob7iCgGQ8xRKk
         NAXfg5gIReOgyziM2UsJZEbFFtfhafEit+QEh+u6mL+JHfCu8llf7vp0pV5BvReLam0z
         nsM/Uecs27i995oQAspanNbE2Tf5U4dDyC+qZI0lmq8qAAduADhPc62ET+5l8P8NgBBx
         hNUfSDKTZAhHin3USTcZa9c//NY1VhNV7TKt5DFXrk5AZUl2RPz5sDT3kU5b9Hy3EwCB
         tZbw==
X-Gm-Message-State: ACrzQf0tKZIlG0siwT71VubAXme+mzvd6MJcbpUZofmfUYqBtjB3KlVW
        A3q/LUdMy5DKNSzKjCFmS3w3ZLF1wAz+OQRsTjY0qKfZkFA=
X-Google-Smtp-Source: AMsMyM4YunzBd2xFg5/dNKo1Ih3lzHKVWJu6jxsRx3nzc8UyU0/ow4XdO3xDx0rWD3E/P0qZ1FNs8tmFWvKyrQ44EfA=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7547230ejc.690.1666000468556; Mon, 17
 Oct 2022 02:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221010125221.28275-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010125221.28275-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:54:17 +0200
Message-ID: <CACRpkdae=+z1zYeW=ogP0eOSZBNxDmCXXV2CaCyp1dTNDJe3XA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: cy8c95x0: Extract cy8c95x0_set_mode() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 10, 2022 at 2:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The code in newly introduced cy8c95x0_set_mode() helper may be
> used later on by another function.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
