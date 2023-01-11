Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556DD665872
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 11:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjAKKCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 05:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjAKKBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 05:01:41 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE5A1B9FB
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 01:58:20 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id k4so15133981vsc.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CXCnmrq9mAq1CeLllBKfe0dodyJx+QDVdDJzSqEw9RI=;
        b=vQoLvI8EbkOdQI71+YSzUvlPFoxNCZrL5BW4dG19iYlNtkPBQqV2gz6pPB1ufOHXT9
         hJCqAF8dzHrABdgTNPSmZO9W43x09GK59wISZEgL1EwgkB6wRHs2rvTjfouWyJln0Qtz
         H13gnuyoF2I1t3i/5QzsZqlKUIRcacM1oEB380n0sbMJJDasiedwL/H0xeAwJv9u5TSY
         CWJTmR8yBAt8WLgDqXFXUuCKfkf3shouHY4sAUL8JRtox6oMT25MsxMkK3CXAV72CqO0
         VSES6aYOmgQBLCwt3SQVhU+FyMIwAp180nL44R9TsiQPQMHR/qHbBULvr69GYlpNt+zV
         5AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXCnmrq9mAq1CeLllBKfe0dodyJx+QDVdDJzSqEw9RI=;
        b=gXRCurJpwcdXhNtpE/9X1zLE+COns60txgmF1YtfvtEr8T0V4VxK4NY1EfqMc67i9f
         tS/Rl7PJY11OzjZ9LgD5bzyCL6Reaw8gsUlHxjBZFQpJScwUxMvb6NW+UUatRUC9gGw3
         y0UYt4vEJB6GNKDTQIEOzi+NLE/e7Y7yu9qtCeOqjGO6vGfD0SBW+7Gr5Edu5fsqWDlU
         nZ2pBHcMXHaJCdDlqoYI9wwNi/LIRIGUI+hZ/4CNCdY5Z16X40cErLM4MeYGulN/LDE8
         BaWSybo302PYXDpgl8ce/KS7i/3f7JoauhK4zapbaB4YY7UhHgzEpQp/IB0ypnQosF26
         /tXA==
X-Gm-Message-State: AFqh2krc0w2tVlbPFOwb6NOeQA82RQmq1hPWXwcJfs+DvIhLpIcOhr4d
        rv2YKxiIY5L2cATj8+MsXErghGEGDRAT7LmAAvFybw==
X-Google-Smtp-Source: AMrXdXs6Mbyi56zP4+TCsUx90yN9DYaOM7F3ZTnBxvtdhVHlywC1cVAEhSi20DCGo2F9rHxSFHE6Cm0s9dLOIDMeIKM=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr8486862vsv.9.1673431099495; Wed, 11 Jan
 2023 01:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20230106160419.1020733-1-radu.rendec@gmail.com>
In-Reply-To: <20230106160419.1020733-1-radu.rendec@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Jan 2023 10:58:08 +0100
Message-ID: <CAMRc=Md7Y6yKerX-3JJ4YGrGp5w5XRqS66s14aCL4h2AS4YPLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: pcf857x: Implement get_multiple/set_multiple methods
To:     Radu Rendec <radu.rendec@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 6, 2023 at 5:05 PM Radu Rendec <radu.rendec@gmail.com> wrote:
>
> The first two patches are just cosmetic changes. The actual changes are
> in the third patch. They are all bundled together in a patch series just
> because the third patch doesn't apply cleanly without the other two.
>
> Change description from the third patch:
>
>   This change allows the GPIO core to read/change multiple pins in a
>   single driver call and subsequent I2C transfer. It helps a lot with
>   PCF857x devices, since their I2C protocol always reads/changes all
>   existing pins anyway. Therefore, when the GPIO client code does a bulk
>   operation on multiple pins, the driver makes a single I2C transfer.
>
> Radu Rendec (3):
>   gpio: pcf857x: Replace 'unsigned' with 'unsigned int'
>   gpio: pcf857x: Fix indentation of variable declarations
>   gpio: pcf857x: Implement get_multiple/set_multiple methods
>
>  drivers/gpio/gpio-pcf857x.c | 79 +++++++++++++++++++++++++------------
>  1 file changed, 54 insertions(+), 25 deletions(-)
>
> --
> 2.39.0
>

Applied, thanks!

Bart
