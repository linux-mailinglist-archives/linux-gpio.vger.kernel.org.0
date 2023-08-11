Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B652778FC2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 14:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjHKMnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 08:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjHKMnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 08:43:05 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32704E64
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:43:04 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-447c22f326aso784212137.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691757783; x=1692362583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rep4ElIMW6Y0HVMaE5mi08ZR3VC0fheZpkTAuVi+7Lw=;
        b=XY8DeHrcZCNt9frx0wg5Kk67vxAM7jHOPj4RsLWb5TOZri1oRRBry1q98H4TaTI2WK
         KyT6HnfwK9gHVCYfzhAhevHVfSDBueO7hMB/s811v7tiUI60r4pjdxAmEYp0VSkt+43s
         f8aKnV5Tg5A/60YauQXYlxssj1mMwup6A4/lDWmdoy9FtxY0bSmVN8wvUC4Sf6BwZ0SL
         TocXljdcz+1aH56JxZjVZT9qXZMQ6dA5WMMu580inVjAH4ePn6Pu1TMklGA5h1nnI4fx
         VivpES8XzVYeWXdzIrUNChaM8j1iAbrNuY4K8+PrKzUvobsVOSAyv4O7w00oeyS3BtLG
         W5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691757783; x=1692362583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rep4ElIMW6Y0HVMaE5mi08ZR3VC0fheZpkTAuVi+7Lw=;
        b=J6G5Oqplc3wsQu5COxpAX74dzuHAUAXdjwcUHoAstac43dazFDttjspfe2uoDCVFdm
         Me+oEYFSlO66G16oQktKxeB78POva1Oe8sOwFZ1XV0QXsNbpwMOYCe2F52tYXng8+cRD
         Pe/tDuKfS4EvfcPUdEU25Ttnadok1f9u7s/PPHrqAN9KS6rON3swedUOevqYZHOczYa4
         hwEhUK7Bn7rHH2PUWnIaNJFBuFmK4Un6BQ5tF7bnOS2BGsWR0BJfeitBSlJ7pHuMm48I
         YdVxTdUYhxvNMSmboh/7evXgxUnKkFfmJouP77vjB3GUdSDorlP6B84G+hLDpBWbXgnG
         jmKg==
X-Gm-Message-State: AOJu0YwXMcGACus1K4R7cedmSNJ7gCsNfHFhuSK7D4KAWnMkQ+hTl2mD
        Zo3BFXv4j85HL88L0h2T27Bxzgb6SP0KiusQlegncQ==
X-Google-Smtp-Source: AGHT+IHyhYV1FW5k6XKDt632/vcoQ0nbucjq2Jt2UJiwF7nmxnL41ncnvFsBcN2FR0y8Z7O2bS5hTHhseyZ81n+3VVs=
X-Received: by 2002:a05:6102:119:b0:443:672c:2d8 with SMTP id
 z25-20020a056102011900b00443672c02d8mr1426250vsq.22.1691757783244; Fri, 11
 Aug 2023 05:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230809131442.25524-1-brgl@bgdev.pl> <20230809131442.25524-2-brgl@bgdev.pl>
 <ZNT2pNW3aPu82vs1@smile.fi.intel.com> <CAMRc=Me43ZqeDf0e3pA=UJ-x_051HxUbzESmTfSSTbG3cV8-hw@mail.gmail.com>
 <ZNX72qCPBK0mzEVq@smile.fi.intel.com>
In-Reply-To: <ZNX72qCPBK0mzEVq@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 14:42:52 +0200
Message-ID: <CAMRc=MfwR0sNGe5ER0xbSK=u_i+AFsKwb_4C7bg6jO2y0LW1NA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
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

On Fri, Aug 11, 2023 at 11:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 10, 2023 at 09:04:12PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 10, 2023 at 4:42=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Aug 09, 2023 at 03:14:42PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +     scoped_guard(mutex, &chip->lock)
> > > > +             bitmap_replace(chip->value_map, chip->value_map, bits=
, mask,
> > > > +                            gc->ngpio);
> > >
> > > Perhaps with {} ?
> >
> > This scoped_guard() thing is in essence a for loop, so I believe
> > kernel coding style applies and a single statement doesn't require a
> > {}.
>
> You have two lines (or single wrapped line). I found to read it better wi=
th {}.
>

It's just a broken line, not a compound statement. Matter of personal taste=
. :)

Bart
