Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEE6791616
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Sep 2023 13:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbjIDLOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Sep 2023 07:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjIDLOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 07:14:44 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F431AD
        for <linux-gpio@vger.kernel.org>; Mon,  4 Sep 2023 04:14:41 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-48d1412c5c5so188586e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Sep 2023 04:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693826080; x=1694430880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfJMpYVZ6VmU4zIv8ZAC1/bqFAQrQAsbXTsCAbSo1AQ=;
        b=oMigW/+YKsvXRvYllMTv5oAFALOHIg6XArvhVwPBWYBYdkBaxhf7LPcS1qyV4Eo779
         /l0Xs1z4xcWECqOaKqHd/we1aQ6PIVxzraBHhuWy+lQJoI6W0Hw85/D95wDJxUhADP1N
         FiQg+z6ZEcrH6CxCardBDQiaFs13QcuyVVsxZoot00SMEsoJn8qfqsuMJUxJi8IYOgZk
         +/935m+lHnkccfNvZtJQTrCNYT4kgdWcePKEOa8/g+QAmaUNILnhdoVK+y8wJ5BVcRQW
         f7PstZ4y438SdO2/255qPp0E4DFyA3SezJqKoXyzIt5FB/vnt0LbiFUWDXtG5suUiMkV
         Pt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693826080; x=1694430880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfJMpYVZ6VmU4zIv8ZAC1/bqFAQrQAsbXTsCAbSo1AQ=;
        b=JLWfugpQ1Jh4OCWddiWmGRZo4rJB6cXQMC+sgzUQTvMdwkWs/Gex7MB4Az6cneu+w4
         /mgJYV2uL14qXRIU4ggev5fyZpZJG0FVDNQVfAAA86IYDJ8WDnsg+k2+QGH+BlIS8yyY
         7r6ZR0hONUsbgRbiexm/o+xhjfXpZwHpNECqzjd2o/jnhUEDWHO6CaZ0hPpRlw59lSKa
         atXmjdK6ZFmPowAXKi2tG0pDXw8ZXkHY/Qot2AzB7Tl25EzbWmTSuZx4VRxPcM2ynhBF
         QvQMwICMSxRBvJrA4OKV0RemJmKcvR/Bt5PSGAkiWzr7wdEtSJju3qjkd/8STW9kzmth
         FT/Q==
X-Gm-Message-State: AOJu0YwrVF1vHqajENYccc4njoN+IFG1XxjnNr4CTWmgGYyfITLToccg
        FVIc0YnEyO/XSOw7MdpRCGI0lQYt0IxFys0VSbBxXA==
X-Google-Smtp-Source: AGHT+IEGgDscf0R/uTPg9TiCMmJ28nuBxuSj6RLC/8wJ3+L5NeKgWB+94K1OVSJyXN0KdJe2Hy1NyLjXcw0OFj1Fgh0=
X-Received: by 2002:a67:f3ce:0:b0:44d:4385:1627 with SMTP id
 j14-20020a67f3ce000000b0044d43851627mr8565060vsn.14.1693826080115; Mon, 04
 Sep 2023 04:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230903190657.12393-1-brgl@bgdev.pl> <ZPWvJc90rmIAPR+r@smile.fi.intel.com>
In-Reply-To: <ZPWvJc90rmIAPR+r@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Sep 2023 13:14:29 +0200
Message-ID: <CAMRc=MdMiMPFvvpAg7DqStSb07Z8L5p0RAmcTimHN8YkcLPV=A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: unexport gpiod_set_transitory()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 4, 2023 at 12:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Sep 03, 2023 at 09:06:57PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are no and never have been any users of gpiod_set_transitory()
> > outside the core GPIOLIB code. Make it private.
>
> And rename to be gpio_desc_...()?
>
> With this done,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The rationale has been explained in the other threads with renaming matte=
rs.
>

I'm not buying this explanation. Public GPIO functions don't have a
monopoly on the gpiod_ prefix. Eventually I'd love to unify the naming
convention for the three important structures that we use:
gpio_device, gpio_chip and gpio_desc, no matter whether they're public
or private as that's already clear from their placement in
include/linux/ or drivers/gpio/.

Bartosz

> --
> With Best Regards,
> Andy Shevchenko
>
>
