Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0BA7C6F12
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 15:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378597AbjJLNYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 09:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378679AbjJLNX5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 09:23:57 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A6FC0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 06:23:55 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7ab9f1efecfso358162241.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697117034; x=1697721834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evNrH5Tgf4e9CaaWME74cEBjwTst9b6vGfiNIB8lJCE=;
        b=gUyNLnFexrtRhFOdxsREBG/wrSYW1sdzUeFO1xu/8XvVT8kjffjD40SE4cyu4fO8kh
         kUE6rkeuXwlgfoOO3RZNgnmzdnnCGitg+9iU31Q7M4q1tdOxcE5qhL0yTWcXXPPeuneW
         0Gfj3TaeNqN6x5HnPJBK4yy+KP0W91+uc/ObCdQdcVBvj1YDwTWXwaEDf7kaW3PFnjQE
         1aBr/Rz9VrNh34sE4CxXbGCjbzOWF9oYNBLZG2zUyEsJ73MQxh5uYBzSL12CjiIqF7ri
         vlRbnStypQ/9i15ifnoqXS2wxQMRK2kAyk/TpxankwF5n+2TK//2tp+2dqy6EqCW0L0o
         jD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117034; x=1697721834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evNrH5Tgf4e9CaaWME74cEBjwTst9b6vGfiNIB8lJCE=;
        b=lTw9FsXhZnmtQ1N1xQPehtPMRwW8Azhd5cT/YOu4SW90nG77Hn0Lso4ZS6rWHI8xvK
         6a/hlpRznTrc4HXWnprW9kOuOsEc9hvkCgFfMPgtV+EVB9+SCyBLhKI6p1EqQZ70AxTz
         DoBJ6tn6xRKMUminLMPc2FY1uQtOZGi3NmzCGVIoiS7GBwwIj9sTz7pbhAuxOromQVaT
         bwHS+7M2qR457KCjPs/iWwe7yazq5H7+hZs54ol0nOVkGI6bb3+rdumuN05pAFTQYLdZ
         Bx+r9N3FjmTTZyGXFqcHl7ot0g26l3wI6yslrGinB92CxyDijSC2mKWIxzI/dT9D3hCb
         r9Pg==
X-Gm-Message-State: AOJu0YwD2mIbFARXizRxlmA4BtSpGunGSMBTDYNqybnLB15RmWUtJ0ix
        2Qze+zD2KLes/rzRiGwDptESwmcBs37wI3qcl7pd1g==
X-Google-Smtp-Source: AGHT+IE+Yj6UGT7YFh02LiAcpqD90NlgA8oWfEpkKz9aADnGxq+LADDX2rEe5zEVBrZ7yhIHck7Wlz35+WD3Sidycnk=
X-Received: by 2002:a05:6102:2d03:b0:457:6858:af77 with SMTP id
 ih3-20020a0561022d0300b004576858af77mr14962529vsb.26.1697117034180; Thu, 12
 Oct 2023 06:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231011120830.49324-1-brgl@bgdev.pl> <CACRpkdYe+U0vs+xB-H8pjR_f4xt_7sQpZQvHCTLGH_tG=UiUwQ@mail.gmail.com>
In-Reply-To: <CACRpkdYe+U0vs+xB-H8pjR_f4xt_7sQpZQvHCTLGH_tG=UiUwQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 15:23:43 +0200
Message-ID: <CAMRc=MdyJjkyPJH6nd2NKTNee5nnXyN3HJ4fvJXwp6pRm9Da+A@mail.gmail.com>
Subject: Re: [PATCH v2 00/62] pinctrl: don't use GPIOLIB global numberspace in helpers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2023 at 9:08=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 11, 2023 at 2:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have a set of pinctrl helpers for GPIOLIB drivers that take a number
> > from the global GPIO numberspace as argument. We are trying to get rid
> > of this global numbering. Let's rework these helpers to use the
> > recommended gpio_chip + controller-relative offset instead.
> >
> > This work is split into phases: first let's introduce the new variants
> > of the helpers. Next: let's convert all users one-by-one for easier
> > review. After that let's remove the old helpers and rename the new
> > variants to take the place of the old ones. Finally convert static
> > functions in pinctrl/core.c to using the same signature and to top it
> > off, let's remove now redundant wrappers around the pinctrl_helpers.
> >
> > This series introduces no functional changes in drivers so I decided to
> > not spam every single driver maintainer anymore.
> >
> > v1 -> v2:
> > - drop the conversion to using cleanup.h helpers as this is not the
> >   subject of this series
> > - split the patch renaming the new variants to the old names into
> >   several patches that perform the operation step by step for easier
> >   review
> > - collect review tags and acks
> > - add follow-up patches that drop the wrappers around pinctrl helpers
> >   where applicable (where all the wrappers do is call the helper)
> > - fix build error with PINCTRL disabled
>
> I tried to apply the series for a test, with the intent to queue this for
> v6.7, but there are conflicts toward both v6.6-rc1 and my pin control
> devel branch, so I can't.
>
> Since we are at -rc5 and the kernel looks better after the patches
> than before I think they should just be applied and not held back
> by minor review nits or process. But i couldn't.
>
> I'm fine with the series as they are, but it looks like we need to queue
> it at v6.7-rc1 for v6.8 or you need to send it to Torvalds after he
> merged GPIO and pin control for v6.7, either works for me!
>

Sounds good, just please make sure to send your pinctrl PR early in
the merge window.

Thanks,
Bartosz
