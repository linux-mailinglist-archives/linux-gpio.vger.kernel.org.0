Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AA866B916
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 09:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjAPIcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 03:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjAPIcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 03:32:06 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6913F3A89
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 00:32:04 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id n190so24423860vsc.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 00:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X0l9EC5lE4//cPxZ1V1dfcHRn1ut8/Kdba9WwwFyQvg=;
        b=Aq6mrkAUo0t8dbQTGZ0GehCvRdjw4B3yw9WBY8WZM7nkMvTSkkmwMBkT4p73qkdEo6
         vTrSn2wYxKHooNoQMQGX8xo+1bpau6neJcsBO6V6sVhfKqKaDP14Ib4r/ppDD67x3CVM
         v94Qoe+rJI8ejU9Q/IrjFfjiSrj6BygWAd3Oxp3CC26Om+Qd/2YUJ3X1XYompv1nUWQv
         hYK91qW7z1IbtPQYZWw95LJzg5AeT7y4XwL8QtMtC/F/OVeiYsT3OCus12Qg1SgM5x7L
         90gcJ1IIgQVdN9wfEVJgLlfMW0KjO35csIknGYVAnIL71fpS6+PevAkdv8sRoyns+Jpj
         26KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0l9EC5lE4//cPxZ1V1dfcHRn1ut8/Kdba9WwwFyQvg=;
        b=cK5RG+eqB2oxQntrUiVH4o9EiaYikgsihsewgaqWXCVIslhsV6PUOpS5XK0skZmIVx
         BwUnyi5tro2K652IjM2dkYbfs1YDgewDd4jktD0RVQgDVJ0OfTNsATYZlhHm7fJb0mVh
         49k3hbyZB5wbiFeeNm/o/oLMMrpP0ikTteigihUGrAWzc0ycByTINbtM1G9jMjbAIehm
         6Krv9nHTXAuQPr101dumv/NIyglfw/jZGYKszO5QIkkneCInRXHDaJtlM57gbrkg6MKa
         xUZz0ycmboNQs/HugcD7odscUsLACWsR2+nvGTwWJjeN0r5M7i41I7E0a30Oqv8A15ZJ
         EHAA==
X-Gm-Message-State: AFqh2kpYXsAhx1hb5+cicrimU4JlwpGSf2+/PM/OwEzHLwvs5FPHfu36
        z1/qHlLRybTdyij+wmeSvzIrVQJFAxZObNosYObOMuz3mPHflw==
X-Google-Smtp-Source: AMrXdXt3RAr4qCyWLeHf7/G991br8+tCTh5HjJ9xnac7bU2QjwqnkcmvUzJpxVBlgXHzbMZEOgklcPLGl41J0FlL62s=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr8026359vsk.62.1673857923568; Mon, 16 Jan
 2023 00:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20221013215946.216184-1-marex@denx.de> <20221013215946.216184-2-marex@denx.de>
 <CACRpkdZwZCDA-pvneLYyMvxqeZkSoM3CFRHEkpOLoiWpPvXOxQ@mail.gmail.com>
 <24df1fa1-c24e-a07b-f7bc-dbf9f059549d@denx.de> <CACRpkdZ63r0Vo0TpQ8w4t9gzJ2uXu1ywaTWXJ3mmuT1zW+KH4g@mail.gmail.com>
 <8ddfac59-79d3-c506-e2a9-3919e84feca9@denx.de>
In-Reply-To: <8ddfac59-79d3-c506-e2a9-3919e84feca9@denx.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 09:31:52 +0100
Message-ID: <CAMRc=MdDJi7q9ADYYHGzW0EKV6Q00Ctxv7QBviwNUgS=fMYdAQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Marek Vasut <marex@denx.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2023 at 9:16 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/19/22 00:21, Linus Walleij wrote:
> > On Fri, Dec 16, 2022 at 10:51 PM Marek Vasut <marex@denx.de> wrote:
> >> On 10/17/22 12:24, Linus Walleij wrote:
> >>> On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
> >>>
> >>>> Always configure GPIO pins which are used as interrupt source as INPUTs.
> >>>> In case the default pin configuration is OUTPUT, or the prior stage does
> >>>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> >>>> INPUT and no interrupts are received.
> >>>>
> >>>> Always configure the interrupt source GPIO pin as input to fix the above case.
> >>>>
> >>>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>
> >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Can you please just pick these two patches up ?
> >
> > Bartosz is queueing GPIO patches, I'm sure he will get to
> > queue them soon enough.
>
> Bartosz, any news ?

I don't know why this has escaped my attention for so long. I wanted
to apply it but it no longer applies on top of my for-next branch.
Could you rebase and resend? Sorry for the trouble Marek.

Bart
