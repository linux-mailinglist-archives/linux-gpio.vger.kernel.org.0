Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D552679450C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Sep 2023 23:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbjIFVW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 17:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238252AbjIFVW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 17:22:56 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3AD10F9
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 14:22:52 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso336578276.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Sep 2023 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694035372; x=1694640172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uziGe4B2DjwHP/aKWUqt9/G61qnXQ3dsygdd3tltV8=;
        b=lfTjwylgm6P26/TZrKCj7LQO/EdAl5gZJR/0XySFWhrjHoIB3L2nmSngfIDdjkWHHf
         3ykXpk6lmU+SH3Y29vhdb1MT+satQh/ICS1tFp2ZuIu1k5ejTOB2ZBhqSmEiSjch9gsF
         uiXi7FLjfcBQhhTM7X/AnMlywFac7gl9DltJFPYYznmB1rWPzmxTjnQmzkFiD26UqUoJ
         2r1zxV0hq5ZiWf8n6ZtOUm7zLqfA+J6IhqUNgLyKxV+uCvrUfGX039HkpYi4x+EVYnGZ
         PhirVRwjJeBbGfoRb8MxJjZ9Db80ZjrxQ+xSshCnVNSQqnOyyrnxwUSl2dGzW5c1kL3h
         HuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694035372; x=1694640172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uziGe4B2DjwHP/aKWUqt9/G61qnXQ3dsygdd3tltV8=;
        b=XpHacAGTCPKGjv6+cAeRiwP5i05EDbiLOgx07iDgnjhfq+XJOpk+5eNCOIJJ/+PGaH
         k+VlqaY7tT/4APmolHfBMXmPsFCPTgqdSbQN+US24KXv0GTLyiS6lOEV+97IezJRd/cd
         2c31X86xAJVFuFrqm1JqBY9NDG4sGf8lLvsdvXfW9qothg86/VB0RlnanIbnkZQ8p6gq
         1LGPAnJ7hHGY6bHB2WF6HxsNZxFRVYn9EuMYJpIhQaLxBvFzmRRJIn0ojJr3zPWV583f
         OmdNqsluwszC7ZCm596q/0cYou3BuuF7bW3wW/3HwsVeFb6qVHI9sXkqQdaYZIlHc91B
         lUKg==
X-Gm-Message-State: AOJu0YxHCCuEJn2uScKmHRCWSCZxDPDmbPUalMkRL4p/7oXLZODV6bdj
        3Wq0ywZVQvlbH1CRMtqM3JMjoPdauxM7y2LUdsjkwvxdVZ71/VfH
X-Google-Smtp-Source: AGHT+IGjO1QCJ0gJb+KTyS7feLh70JSLzbWigS6P2Lnl8yFypB81P8q6GlreiPJTbPdprGKIbr/jjCySSLO79y/Y/dc=
X-Received: by 2002:a25:e0c7:0:b0:d7b:9b9b:2fc3 with SMTP id
 x190-20020a25e0c7000000b00d7b9b9b2fc3mr957513ybg.3.1694035372132; Wed, 06 Sep
 2023 14:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230906145045.139657-1-brgl@bgdev.pl>
In-Reply-To: <20230906145045.139657-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Sep 2023 23:22:40 +0200
Message-ID: <CACRpkdYUOY8QzZgN9uEvrPTXuCt-FtT83PxRK07mwKL+fznh8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: don't include gpiolib.h
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Wed, Sep 6, 2023 at 4:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The gpiolib.h is unnecessarily included in the driver. None of its
> symbols are used so drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
