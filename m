Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AFC79AE3C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbjIKUyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbjIKM4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 08:56:39 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489CBE40
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 05:56:35 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-493639d6173so1610371e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694436994; x=1695041794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkfaITpjzvoowVVfws6abpFf+2OELZsAD/wJz25EPkk=;
        b=BqT1CXdK08i+zxeQsmuWeUwDX1+zvvX3SigN0N26Qqcouinq+d/W2ukdCylg9DRYwj
         GVXL3tq7lGoDgTJuhv48CUEXskpwa24dWxiDrjpmXrABltM5PeKATRjKFtz8gW81PtLu
         eTlBaML8h/yceBVSxZ3M7aehNoqlOXI6/V2WJ8A6GxMLeJQ/sSPCBcLK78pRR+SrzJ2O
         Q2/XI4rkrl4N6W2FpBb8SEkyafQbr/zaMgOZT/OFwKZLarXU/5k77l5SPyGM3QF9HIeH
         TmeTzo2Kz1jUmBxPmqlhfQ7PO/pqxsgf62TPHZdhz5iBJApt0YR43Ah3nKaX1gl4AQH7
         bM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694436994; x=1695041794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkfaITpjzvoowVVfws6abpFf+2OELZsAD/wJz25EPkk=;
        b=fsNtdLmByACDAhRzlijR0Acbw7+bv95dfWRNWvMrAUJnmBZ6x4G26vHzxiWtKgygFC
         OmNtG7K3nFwEiL+4pXSUS0KlyWN1GyEq0pofWqR/7/JkitJx95e0bK3YrNM7GWqta1HU
         Hwx5ha+nFyhnyihBi4iGD3YBJ3YM+FuHwH8oQyqI+4b9+KejRXPxk/qykk9VWucSoFw+
         JotjCkwuOAnh33VqSYMUaWY+NLDcXsVLX968dnVOpbmAsnIE8MSNrnxY4cwCIb/Omg8M
         NIwAS1XpbUwAiEyppOZ0HUwJswjpkiwY9/qsfpoFrBJL5Q4uoR7XKgupvJuLZpH8/Tmm
         VaCw==
X-Gm-Message-State: AOJu0YwQPonCj+hvM+PRM6UY2TA2INJYaFfbutI++PhrmeYjPs0jb8PI
        DNt9nujRmE6ymOzvSTSyUb/I4flSxVPIv0bEt22A9w==
X-Google-Smtp-Source: AGHT+IHewLB3FfSioBycs718X0V3D3Aiy2lRD0SXx55qRkB6Sbz0u8Ef0VHW6xOiSEMCmY4pWDMF6vFkJSzeT/+Fe+k=
X-Received: by 2002:a05:6122:2ab:b0:48f:c07e:433a with SMTP id
 11-20020a05612202ab00b0048fc07e433amr8172421vkq.11.1694436994319; Mon, 11 Sep
 2023 05:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230911110740.16284-1-brgl@bgdev.pl> <ZP8N4M6cqyP9rS3W@smile.fi.intel.com>
In-Reply-To: <ZP8N4M6cqyP9rS3W@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 14:56:23 +0200
Message-ID: <CAMRc=Mf8zhmMaMSoO_cceG9meCHr1AbZMMRJE7Qms8qEt047Cg@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: sim: don't fiddle with GPIOLIB private members
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
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

On Mon, Sep 11, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 11, 2023 at 01:07:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We access internals of struct gpio_device and struct gpio_desc because
> > it's easier but it can actually be avoided and we're working towards a
> > better encapsulation of GPIO data structures across the kernel so let's
> > start at home.
> >
> > Instead of checking gpio_desc flags, let's just track the requests of
> > GPIOs in the driver. We also already store the information about
> > direction of simulated lines.
> >
> > For kobjects needed by sysfs callbacks: we can iterate over the childre=
n
> > devices of the top-level platform device and compare their fwnodes
> > against the one passed to the init function from probe.
> >
> > While at it: fix one line break and remove the untrue part about
> > configfs callbacks using dev_get_drvdata() from a comment.
>
> (Just wondering if you used --patience)
>

I may have forgotten this one time. I need to add an alias.

Bart

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
