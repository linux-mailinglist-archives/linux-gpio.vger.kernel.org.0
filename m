Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C697507BD4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357957AbiDSVVq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355918AbiDSVVp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:21:45 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF81F41321
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:19:00 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2edbd522c21so186507277b3.13
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JTBRAk2t8PEn0HtzBt41SQgoxOHmXIHgpH6lQZY1Q/k=;
        b=N2ltOCHYQunALsL7Akx+n7Htbd/J/0oAyhU21Tqkvk2userzJ54VDTkoJFkRdgw729
         G9Wge8qHV0ck3krV2nz485ztB0+lemqa1W1oLVkeuIN2ZwRf3UJ4gILsliIXUKY5LHSB
         6ZMkM+F2pSDMFdEYYVcEefdBHort87t+KmN3xs2vWdVDKU1jocFJhICTc500q3Et5yo2
         GLwsTcu04B1eSt/M25GIQLamVfA0KuD15cplch2eVQSOYsDovfxjF4JImwNjTD35itRa
         lBQVuMYBIVkuKQw+C6lEDLvifzpq2AxMKxWiaFgsuwHvryroBJJrv9yJvX5wu0TFKHsR
         TlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JTBRAk2t8PEn0HtzBt41SQgoxOHmXIHgpH6lQZY1Q/k=;
        b=FZVAfRrOz4fk0ZlTNcIlyruDYvX4tOylmAFgb8k27c9h7R228xNHZRoFw5KssdlBLt
         +wlMYCf7NkjSRhMy0P/4/4dbbQ5pDVvwq9EYPhjoy9RN1+r+Gs2Tj9hDkFDyDBx5Q6vi
         1V0b9mQzULC3/LppmTdrU1otUYeX37DDk1Ux1hEYPjZ6D/Eu+4O9YgeDLtOFghcZc8C/
         P8m0zEnHjLxNSmd6HylkwIu06XM2JWF+ThLSjiqbm1hKCIgO/BBatnqG4ETACEckxVW2
         8FqH9E6urBIt/W+PPrF6WGkHvISqq7aZ8EeOSstQyN98HPt+6lIq7K6y0Tz/muy+IZM6
         x8uQ==
X-Gm-Message-State: AOAM532yPHZt/CjCi8yy/37EtF6P9uKE/HPJVenTRRG/uCgrX0K771lj
        hglxlaHjkfe3xGajos4wAMPVpxDbqgpUw96T0sBYZA==
X-Google-Smtp-Source: ABdhPJyvzA0ucPhfVuKj32ZOlB9M9RIKJlXu/Jp9YqtwmgA7/zQNOPVdCKLQJxb27wXF/7oMWVE6C6vsk7SE808uT4o=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr15715169ywd.448.1650403140112; Tue, 19
 Apr 2022 14:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220409095129.45786-1-stefan.wahren@i2se.com>
In-Reply-To: <20220409095129.45786-1-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:18:48 +0200
Message-ID: <CACRpkdb4dPkFrKsfQmvyLO0RHCJsZYwULncDqbX5zkJqvmbPTw@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpiolib: of: Introduce hook for missing gpio-ranges
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 9, 2022 at 11:52 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> This patch series tries to provide backward compatibility for DTB which
> lacks the gpio-ranges property.
>
> The commit ("pinctrl: msm: fix gpio-hog related boot issues") by Christian
> Lamparter already contains a fallback in case the gpio-ranges property
> is missing. But this approach doesn't work on BCM2835 with a gpio-hog
> defined for the SoC GPIOs.
>
> Based Christian's on explanation i conclude that the fallback must happen
> during the gpiochip_add() call and not afterwards. So the approach is to
> call an optional hook, which can be implemented in the platform driver.
>
> This series has been tested on Raspberry Pi 3 B Plus.
>
> Changes since RFC:
> - just add all collected Fixes, Reviewed-by, Tested-by and Acked-by

Patches applied!

Sorry for being a bit slow on this :/

Yours,
Linus Walleij
