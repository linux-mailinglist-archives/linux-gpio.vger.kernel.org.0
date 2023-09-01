Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439AD78FD3C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 14:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbjIAM3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 08:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349435AbjIAM3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 08:29:42 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F28170D
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 05:29:31 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-48d0b70097fso724289e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693571370; x=1694176170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIF+BJX70BXX/vgywLDEAMh001J81bkBPvdNjVPAH9k=;
        b=NGvGzfexigUfoAMMYJOXotyL7WzGlXZx7G4+pDFCpaa0FudLt7ixYHORpG0snitJiJ
         Q5KeLehF5HJW1PvG+urF1YSBgnzdifmw6c7ZKIaYv/nYIUtk/lgEhyK9MnRR9z89oDA+
         1pQsbN+/9ZJchjUzHsbY/SagiYKe2o7do8fckDxhoHxtrBHq0zu4zzIiUlRCxhmTn+lq
         e6XKai4RVkFJoZKWX7O5AIqgCiVVLihIQoq9s/3AC8aQZFaKJhQNF9BNMHnBbCWKfHDK
         tI/eS7KADN7rdx/Tf5YLwb5VVDMqwIUQV07upCxGizsjRM6CwFHmt8bf+ofN3YPlyplT
         uuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693571370; x=1694176170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIF+BJX70BXX/vgywLDEAMh001J81bkBPvdNjVPAH9k=;
        b=ao5qEvqFOwGtaYMhUmof/xgMnRgjZvzjXw/bdWgeUKmr4VVn0UxRjofo8zzp3EVYKM
         njQqsHEv/CTmynfOiFMmgwLNzsfKXlCN60aqJobgdI+XhpwbC1D7cIDRHmU4pvVdyO3B
         tef5UhHuG0tBQyYtI+8iaNS0yHGMA1Gp3cdQz5PUl5YLDo84NhBmrXRiMpnLOFh0LjJO
         gBphy2aCCv2SfHfh9cR3NrYrz0AVLeg1wayU6Cl77XcZIZc9R50S9NzNBYxta56w1iJz
         EK5+ePItQd8uzPwVIo0NHYaPaBQyij8F8YuR9I/QIVfgsXM72UHLWkfv7jbqE3HqGx3A
         tMcA==
X-Gm-Message-State: AOJu0Yx+sBwjRhtrNsw/VRECLQ9SJcZ1KI0O99cECyJNBXUWF9JLKmdd
        wx+7w732L13KRn5ekhA9e67z+nBZNSNebT0VFFU0pA==
X-Google-Smtp-Source: AGHT+IEg9KYnIv9qRIHKnZB8G66H9r5yMxmoO+7Ha9bqKao7Y134298c3nNCpQPma3FFeZH7YsBr6mREcxJ8zl8Lfmg=
X-Received: by 2002:a67:e98f:0:b0:44e:8ef9:3370 with SMTP id
 b15-20020a67e98f000000b0044e8ef93370mr2069516vso.5.1693571370491; Fri, 01 Sep
 2023 05:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230901113520.13352-1-brgl@bgdev.pl> <ZPHVZQ3NmqWE1cYg@smile.fi.intel.com>
In-Reply-To: <ZPHVZQ3NmqWE1cYg@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Sep 2023 14:29:19 +0200
Message-ID: <CAMRc=Mfinj1rCoOR5_VkEyp9X+=NryyyQtGg3=H5mq_vPz4ZHA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove stray newline in gpio/driver.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 2:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 01, 2023 at 01:35:20PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Fix a double newline in the GPIO provider header.
>
> Separate patch for this?!
> I would just fold it in the extern removal and that's it.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

It's nowhere near the code I modified in the other one.

Just slap a reviewed-by on it and let's move on, more important
patches are coming up. :)

Bart
