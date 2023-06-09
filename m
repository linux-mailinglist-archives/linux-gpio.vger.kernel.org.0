Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55C372A430
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 22:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFIUPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 16:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjFIUPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 16:15:43 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1961C2D68
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 13:15:41 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4301281573aso620823137.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686341740; x=1688933740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raGvAg29sSFwcM9RybsJx6+tqHFKznCftHEYSM8PqQ4=;
        b=pPNHsRh9XiWRLgHB0psr+DFRlrIRviKoHNYjlD3Z2cAP6yYCcNYhAjkk4gy21UwZ5e
         t8KNonsK5yKuN/oy7DksWVDxaBxUsNCI44HBD2rpaVVUxooIdgVaBZrHDpgV+eMLT+qs
         9oy2zhNURd+ECpyD92bcnVa8viSrPWkhYVYzvQTIczSgH8rhBnzfth76pw2wfWL39z+N
         CO92EIGZXp7n9l1uWigMJEUNLCsQa5Ct6RK3slYzQ6kviSoO8JybSKggVuS7Jmji6cGA
         /E5MXZRmswlRVAkRh0doAjJdla9rKLboqyGYeW/WL0OzxLFrhhoGD2zt6zl/MBpyqvL0
         7QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341740; x=1688933740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raGvAg29sSFwcM9RybsJx6+tqHFKznCftHEYSM8PqQ4=;
        b=O8XXLXWAMPXI1TyV0NhmNtxYLghXmvJTASrEr+7BP87TspwF/yLzgAlQlCDBjaki6k
         0u90HB3G0CoEw7wb7a3Q13M2ZOkxcelXVDRIfajQ+BeyEKIcZhLLMl5YuLMGoKnPfnS3
         Y4eqc49Akxt0eTDJB4b/S0iezDJFQRkY8uUD4xLqwWDpQDf3L/olUj+IDkcS/sE5ObhS
         WsZbaRjOFiK/jNQv8ZcuRHY0DQLOrZqgz/BMNEqY2gZ2owNjdmb7DVF0yR1HAYpwbgED
         7sTNSidnGM0/uWFp2jCruXXilIKuIsEKTOG9neJsOUEg2jj4qUNxTOH4aOJPmONvcIBy
         MJYQ==
X-Gm-Message-State: AC+VfDzoGIn7x4Z73aHmCCjJYsWA0AmxeQSAzRMMhJpDDc+uLLbZF0H8
        l1MObAGvDl0dFE39mZxSDU3y3wQvsA4nMVW7WFXRsg==
X-Google-Smtp-Source: ACHHUZ6buQWS9YCWGt3+h3H7ytmFRag705dKxxCwPKDrEa608VLfIidhHQ3FzwOdmHPVkkzqVsIHN/lz359RcfvV0DI=
X-Received: by 2002:a67:f241:0:b0:43b:2551:5172 with SMTP id
 y1-20020a67f241000000b0043b25515172mr1263807vsm.24.1686341740176; Fri, 09 Jun
 2023 13:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230609143609.209373-1-brgl@bgdev.pl> <CAL_JsqK77OW3n0PW6zP3FNdmuQHnDp9=wfX4E3ga-VW0_LRHHA@mail.gmail.com>
In-Reply-To: <CAL_JsqK77OW3n0PW6zP3FNdmuQHnDp9=wfX4E3ga-VW0_LRHHA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Jun 2023 22:15:29 +0200
Message-ID: <CAMRc=Mc7bbaDA1g3gn79XJZL6bTPGf9xZsB3=A4oiMUggzb4kA@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: drop assertions for GPIO hog messages
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 9, 2023 at 7:01=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:
>
> On Fri, Jun 9, 2023 at 8:36=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > These have now been demoted to debug and are normally hidden. Drop the
> > assertions entirely.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/of/unittest.c | 28 ----------------------------
> >  1 file changed, 28 deletions(-)
>
> Why is this a separate patch? Don't I get at least 5 days to
> review/ack changes in drivers/of/?
>

Sorry, my bad, I queued the previous one through the GPIO tree after
it was reviewed here thinking the unittests bits are trivial. I can
back it out if you insist or you can ack this one and the end effect
is the same? I will pay attention in the future.

Bart
