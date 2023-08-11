Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3342A778E75
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 13:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbjHKL7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 07:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbjHKL7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 07:59:23 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9AF11F
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:59:22 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-447684c4283so751695137.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691755162; x=1692359962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oGMlHTUgjH+xggxT1qijFrU6WZyh/QvNvCP4XO/nKM=;
        b=cx9frQPqStrt/thwpAphkjd3EmYVpZAt5s/JGz52z3/klncOwJBRoZA6nG8OKEpvzx
         EbLPYsMAaSBpMU0GT+ZPIDvhFkaZFy1kyFbpN0Gq9YUtGAP7veAZ2db907rbTDU0vMno
         MLnjHpbUmMa1cMfsFgLwJowdRHu7P7dd57LJC88EybZxpXxOncELhjmIoZjRZwFldYPj
         rcfI2h4mLjHEsFD7oPK1l+5FAsWc258MwA/6Wobvp3NBhRMZe0T0qI4uzBqNBaSxn5Oy
         P9d4YFYo9jVZzUJZiCz6t1ydGyYWt7UI4fn8tgXoDmlym7esb+uKz/z//+wDbppjkeqm
         Gk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691755162; x=1692359962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oGMlHTUgjH+xggxT1qijFrU6WZyh/QvNvCP4XO/nKM=;
        b=LW2NQunbWpLpcGbNsluXz8segvBo4LLHaUGkvzxhz9wCMGgdvuiLfB5WuQO6DJEsbU
         Yu9QyTFmtLBwTbxL5jW9tGgiWOvkUgG9ZNmlaSGXC7h1dgKr6VGEtNwVPflUtxwBzK5K
         ShjzN1Mf5lhI8+c3iz2lsyQNPMeR1dEkJ+BrPBPHGl2aUsZnZi3trOM0/j7bRlH84Z+9
         o/B62SzA8h5OPXDT9zgTH+bnZs9Pv5LD8wdoP6240qKEO1WgvVcA3aiyhU4dhRW9Ascq
         ddu3txJpd0hAZgPpNQeFm2IkTO8YCg9GlwEPFI+gZvo3ikOAwU1XCFXayxjRnhzqhWC3
         vIPg==
X-Gm-Message-State: AOJu0YztHM/TCqHBOoGgs+AQPJz2b9Bwt2j4e5ZhAFe6tY6iot/Pwzkh
        pgRAWhypigje0EJkDQ9KtJIXgHVGbVNxBV5eQcHQ+g==
X-Google-Smtp-Source: AGHT+IHwP3ZU+ItnzX6UaQGIAfOWzhLSGnYNcLL4IdB/7n1JYlMTUn54ure6PmSRFhSNR1fcOX2LPZGVOTuCljnHFjs=
X-Received: by 2002:a05:6102:3d4:b0:447:4b52:5c8 with SMTP id
 n20-20020a05610203d400b004474b5205c8mr1296064vsq.26.1691755162016; Fri, 11
 Aug 2023 04:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230809131442.25524-1-brgl@bgdev.pl>
In-Reply-To: <20230809131442.25524-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 13:59:11 +0200
Message-ID: <CAMRc=MfE5TYgKL1pPkbMt4dP9PwdEo9nsy4aH3nvrNAdniG2Ag@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sim: use sysfs_streq() and avoid an strdup()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 9, 2023 at 3:14=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> When comparing strings passed to us from configfs, we can pass the page
> argument directly to sysfs_streq() and avoid manual string trimming.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I applied this one, I'll send a v2 for other one.

Bart
