Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE73571348
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 09:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbiGLHlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 03:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbiGLHlt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 03:41:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496989A6A2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 00:41:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id va17so12878462ejb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NSrNMqUgWaYuH+mTVW1bDRg+I5uODANEes06ggGuCQ8=;
        b=hSinwd2+o7s7Z5GqAva/JbWo3c3bbU31+fz4J9bmDcla74i63981XKzdYwltOdOu1s
         2jTGjN6+qb5wlVV+hkl0h60UYgDH8kFDFL2aVikT8YCXbwim0ernZtNOJWgcZbcLbb2i
         PdZr11THsg6zAbwfwDrRoSIduA+KV9lUAknSTADM1h0faJPFYZo/mf86nSUbWkClq5Mp
         52rUpSHWGHvwV/UJ1DbTRI/iEgEA0ZuaV0I/zwH8xzq5VaxPhbdIqHoWScSbZ4olJSPO
         CfUTV8fs2HWp92EhfeTstC8tbHSSCX/trZxM0SQybm5vscnXl8h0QEebFp1UHZlMj3zm
         xCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSrNMqUgWaYuH+mTVW1bDRg+I5uODANEes06ggGuCQ8=;
        b=P1zQzYfpLRSoM+KFVdiCQlUCZG8DSAthsfgwDe1PtOHs91XY+JVuNNTxR+36ZsqhyS
         QQ/B2Mosvh+0A+jn1lCfazgdY7rB/v6A3CWv+2Gi3vOD0q2CaFFy7rsfdFB09qhqWNTJ
         MgnbLuuPHvG4Inj1o70FwnUVKLTL8bwCuvBIObdWtQercUb/zKWMo5sa9yErlxmXPyYo
         CMRkG9TR41nP5sR7djMTGaIq0Dv6oO+ZM26l3rFZzUuBj8bPySbtH+Gg+cy/bfhx8FfU
         eN+YQmSqtk5MHgzGJ2eXs9gc40Qtk5NbTcBhmFrBNVMXquUAsNtwcC5W2LDa5jQBEZaV
         PhJg==
X-Gm-Message-State: AJIora8jw1h9oJi6ebFWGstJOG8x0csMayZmL7QTCQsE9YQmOnl0e8PH
        HZmsFPvfypmAl9jawcphmVp1DDy7K4eTtrU9qtUpHQ==
X-Google-Smtp-Source: AGRyM1t1jqeS/pkiVbY2dvEmVvi4l4xwSga9AY8LFBsQiNHxBtdvWIBVEBlrrfH6Dh4ib0IVtklOMMyO9OTHI3qY87c=
X-Received: by 2002:a17:907:cc14:b0:726:3555:ac63 with SMTP id
 uo20-20020a170907cc1400b007263555ac63mr21853308ejc.697.1657611706834; Tue, 12
 Jul 2022 00:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220711173418.91709-1-brgl@bgdev.pl> <20220712023714.GA9406@sol>
In-Reply-To: <20220712023714.GA9406@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Jul 2022 09:41:36 +0200
Message-ID: <CAMRc=McJjcOo2_xcU0CgoQMO9PJH3t_dWeSyS8QX3wYaxeufhA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix the chip_name configfs item
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 4:37 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Jul 11, 2022 at 07:34:18PM +0200, Bartosz Golaszewski wrote:
> > The chip_name configs attribute always displays the device name of the
> > first GPIO bank because the logic of the relevant function is simply
> > wrong.
> >
> > Fix it by correctly comparing the bank's swnode against the GPIO
> > device's children.
> >
>
> That works for me, so thanks for that.
>
> Not totally convinced by Andy's suggestion to rename swnode to fwnode.
> Variables should be named for what they represent, not their type, and
> you use swnode extensively elsewhere in the module, so either change it
> everywhere or not at all, and such a sweeping change is beyond the scope
> this patch.
>
> Though it may make his other suggestion to use device_match_fwnode()
> read a little better.  No issue with that suggestion.
>
> Cheers,
> Kent.

I agree on device_match_fwnode() and disagree on the swnode rename. v2 sent out.

Bart
