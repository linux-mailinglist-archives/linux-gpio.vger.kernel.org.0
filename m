Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F06379123F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Sep 2023 09:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbjIDHdD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Sep 2023 03:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352408AbjIDHdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 03:33:01 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086DBCDB
        for <linux-gpio@vger.kernel.org>; Mon,  4 Sep 2023 00:32:44 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7bbaa8efa7so1001710276.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Sep 2023 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693812763; x=1694417563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvNYnMU1q/NYMgMZD1mpM6fkhhhL4YTdzrZptcyKkqs=;
        b=rBcdvLa34KoAj+iux5ckznlnABsHhckr7tXpBvEDc4yAMjQAKIvvJwskEUO4Yqt+Qx
         f3zToSQOtnK5mZcvtVeXE1diiGJIZwePpJJzE8CxbQ0NbthvDmtE3+61Dcab9W3sXfnU
         1zi4krxIv7T6Gn/52/YwPhR1dIJ5OotgVQG9MqMGb3wDnbji8zO9E9k3xj/tw80fcnjG
         mSPtfhBbawu30OjlPjGt6GD0R3DMrgfiVUopry3tqF5qvSK7kQf3iQ3rdaNj9gqWKr2v
         c37AKN0X2GsgkfVFe7th6KWYwSimw3PMV6OYjVfzZY6n1OgXZjv0wcF24wCeD8iOaZ9R
         amMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812763; x=1694417563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvNYnMU1q/NYMgMZD1mpM6fkhhhL4YTdzrZptcyKkqs=;
        b=MmONbuPEc7Ia584DxLQX9QzUfUlsvSeL7UxXwVOmO9AegGdc0nKOEQdNJiNoFcI7mX
         p2xtEI+rrEjR4hoffUo/z3MPpEXtaNNscgT8eTgIH4jW52ibBT6vnULkH2iRHRRUDKBm
         MJK4S4y4eN8B90hO7hX4MRSkkraDQRwqYPfjwRpi9GwBeU4uOLb/QZg5BS8JyRvSjrF7
         /kYwJ3LnA5B9Q4zNAtMBPFCLV8vqEOFL5UdJyRkrzRy4G7RT8Gr1KcRuTg8I2RKAqwun
         Wq+3on4lYRuy2vHa4MAmMXghIZV5L4EMG7x99bLTkD2UK0MpU0I5eXqQiMDvJGd2S/lI
         yy/Q==
X-Gm-Message-State: AOJu0Yyv14KXPuhvlyCvaNPntBzHpsUb8Q3G7XFRuC6SdJ6Vsnj5p5Oe
        0n+2Jx5brKRdpbNXWFzkML20sbTB0PdU9V7vkhmE/Q==
X-Google-Smtp-Source: AGHT+IFubKUbIyBl/neDJNGHZm9GGu1Eyn9gRKMgeycHQQEJToscP2A2gpx8TIYyMbgsPuv3Xq+YlnwOrSRvTvQS6HM=
X-Received: by 2002:a25:83cb:0:b0:d7f:466a:ea75 with SMTP id
 v11-20020a2583cb000000b00d7f466aea75mr498077ybm.4.1693812763251; Mon, 04 Sep
 2023 00:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230903190657.12393-1-brgl@bgdev.pl>
In-Reply-To: <20230903190657.12393-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Sep 2023 09:32:32 +0200
Message-ID: <CACRpkdZjkQOh807XeeJ7MKmz5p-5wvRhaQ6LzzBta87akHHFYg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: unexport gpiod_set_transitory()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 3, 2023 at 9:07=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no and never have been any users of gpiod_set_transitory()
> outside the core GPIOLIB code. Make it private.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Well spotted!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
