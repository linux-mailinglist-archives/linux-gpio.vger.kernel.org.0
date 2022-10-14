Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD145FEB82
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 11:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiJNJ1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 05:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbiJNJ1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 05:27:10 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE2B1BBEC2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:27:09 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id u204so1963969vkb.13
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LLgktRizxyiSlwLKUxpQrKAYFD0bpIdLB68C0J0ci5Q=;
        b=SOH9kLRJs09NOGGSf1tXxzGQfwSN+h5ohkSyeeMIWFv0toX7xszn6IguWhPHsvZSgF
         5J3nKvRA/xGz64vOzukVoVG5ZiWfdBDbmzbAz+ovNxfJpMSfdPkEYQIgbOOJ0MZ1eTlg
         DlNnSG8698LwLXwIG7zpnhshTuHS7LeiUoIQboN3yfWfu0AKucsktS2P2kMiBykz7mph
         YnY1ehXE9BMkONDUH9RigTii0NDDiCh14Jy/DXvrVdTU2MzXyuOn2WbS1hTGMI7WVuij
         tJ152ND9Er9fOQioSk6vmJ07o8lrKS32E2qLjaslpJLn8mTdxK2osJTu3aL4m3ePDy/c
         LBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLgktRizxyiSlwLKUxpQrKAYFD0bpIdLB68C0J0ci5Q=;
        b=MTwp/G9ft9PjRfC7ZEQPkWLihA56JNmphrbMs7WnxwzBeQxtXx2t0z2Ly8DTFsP8Oe
         EUDz0vFul1CHJyGFVXLpLho8wsuhCi3EJWDSWguz/o9ChzJuOtX8UnaIjdSVDlbh5qki
         R5s9oNhrgveMY8TfhzSCOuhfRsv68Vblnlsb9NuSYYhx1HnnHRb0HmLZJfmFh3ZjmME1
         H/WOZewB27CYaERr8yOlAZISdoY66O7q0BNjxFZcmeMW8mtjGnBKIQGfBioSPcAhxd4y
         U8PbmXdebtztw0fDc5ZoYgGg8/FtwiBmsinguKzIrlNs7Q2LMJy4AH4vo1L4YvV45sQY
         3Xig==
X-Gm-Message-State: ACrzQf3dHqpaR1OGUOlR1QiR3j10jj9EGSfk/XDOmMZltndC2w/DdYtz
        PM3TRJWEQQwA0pVlg7Cn7ZzrTBCyhdbVJaXg0xecbg==
X-Google-Smtp-Source: AMsMyM4pd7ei8k7Iee4vxwNY7YzxX4DvVMIzjklo8h8WqSBzwNC+7Mw/jT7qdxsx6E9wPShJqgRTRnHU7iFar8UNzYs=
X-Received: by 2002:a1f:e944:0:b0:3ab:334d:2896 with SMTP id
 g65-20020a1fe944000000b003ab334d2896mr2056953vkh.5.1665739628732; Fri, 14 Oct
 2022 02:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221013001842.1893243-1-sashal@kernel.org> <20221013001842.1893243-23-sashal@kernel.org>
In-Reply-To: <20221013001842.1893243-23-sashal@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 14 Oct 2022 11:26:57 +0200
Message-ID: <CAMRc=McRO9p5y9SGoE=z-_d_AkdNijxL_xoSczXN1JBo=b9_-A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.19 23/63] gpiolib: rework quirk handling in of_find_gpio()
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 13, 2022 at 2:19 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> [ Upstream commit a2b5e207cade33b4d2dfd920f783f13b1f173e78 ]
>
> Instead of having a string of "if" statements let's put all quirks into
> an array and iterate over them.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Sasha,

This is not a fix, it's code refactoring. Definitely not stable material.

Bartosz
