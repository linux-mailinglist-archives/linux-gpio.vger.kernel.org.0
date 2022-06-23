Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA654558A7E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 23:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiFWVL7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 17:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiFWVL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 17:11:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B640E67
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:11:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ej4so721504edb.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l0J6IiGI1k6+PKzNz3MxBPmr66ULqKxr953kjlT1DdA=;
        b=2vObZs6ee++txMbVX6KQLGz/cQlHDX/7cWyz+Q6a0SSpYKjF3xbL7Rkznuhb2hwycu
         xyJJf8HfV2EKeTjdzXxuP4DCjJZH5czJi84n7Y5fXr1TvYfJ+n9DAU9sQ9BVo/lHPzli
         fFDOnNceeLwKFDbjhznCYOL46AzY7Lin0ZEMPVCK5bH8kwBAs61+DVdtua+26o7FyBYM
         K2MV4Kolbo23tpcJt6MYt74JnXv59Br5+9dVHTta60sQKFnlurvDC32tarz7KwXXcvFW
         tth96fbcJyqQDrhPZJM/5geznpbUfx+5uiTmUbyqveRFfQyCevHgipNbthPqqCZ9hI1A
         wpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l0J6IiGI1k6+PKzNz3MxBPmr66ULqKxr953kjlT1DdA=;
        b=LpXXrKfWp7LK+jiMgDVwWQmEhqbi1XlQ3VWCqenX7Tnet7oHu5kE6W1uENFJdnP/bP
         aEnX1WY/KuW9Omr/K+KKhavz9OHIfkyix+09zaGnTPY5hybFns62K6zQ7YBeH42Vp0wR
         N3RgZv9oQw5C57DRAn2mM6csyaZapWPzs88nQGMsoSQ8U0QpxkLxIUDldyOd3HwyGkAx
         c7AzPL1Cdp+yFTD4aMhQk+r6iqV/HXYbWv3ibaTnX9MzONec7KWIdL5YaEESQEJ4BfGz
         a/ngpqB8qOPM4s2Iiza+IWjKk93Vf8jgV2Un+CZj2+M5Fs7gZTBAl3ytEvuU1lROKDzZ
         zUVg==
X-Gm-Message-State: AJIora9cOP8ZbDe7mt6GF/jDn5o3K6+xz4ek0uLOFKzpnzYv0FohCRxv
        x9ei+RQYg6Dx9mjH5ibSQgbQxIccCjo2MU0LT/KKZQ==
X-Google-Smtp-Source: AGRyM1vJ0ZqBLfJMv1pLbipxy5Eg2QxvE1oEG9mhjFyJjwEsUDKVhTw50it4+SfZQ1DminWugfgr7b4uZ/vla+XnYzM=
X-Received: by 2002:a05:6402:1774:b0:435:7fea:8c02 with SMTP id
 da20-20020a056402177400b004357fea8c02mr13025727edb.213.1656018716590; Thu, 23
 Jun 2022 14:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de> <20220614152339.252958-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220614152339.252958-2-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 23:11:46 +0200
Message-ID: <CAMRc=Md=-_kFDD9JvzTCyRB51=7=XG9qarjnbOvnsT=sTgQHpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: twl4030: Don't return an error after WARN in .remove
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 14, 2022 at 5:23 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Returning a non-zero value in a platform driver's remove callback only
> results in an error message ("remove callback returned a non-zero value.
> This will be ignored.", see platform_remove()), and then the device is
> removed anyhow.
>
> As there was just a WARN_ON triggered, return 0 to drop the follow up
> warning. The latter output is hardly relevant after the big WARN splat.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bart
