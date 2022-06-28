Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B131955C58A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345094AbiF1Mfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344555AbiF1Mfn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:35:43 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBABE2ED77
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:35:42 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id p7so20538249ybm.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1/f2/rKITy1d+h7OReZAB8qaT+bG+8V7QHnxwKLcGA=;
        b=lU1z+CzAevBaDc15yFelws3us8JVnpogXhsQcidQDpHx1AjPTZ9H7eF+hr7e0vZx9F
         4qX3GxTnk52V1J8q+VVPrESxk1fOG3dWpkoNCHzVVZXq6fAK1UfY6Mzfpm2GxaQeFrnK
         uofo138vjBf03ffwAans+YN5wJ+3/+cOmz6hbS8Y3LHNbqkfZ2LFzmkPQATM+D+gNGcq
         GlpWSPbC5agrsSBxdiUtdSDwgGOVfPN1TwIsuJgjCL9Vb2MRXVgmZDxBUwYL5DxJZ+UW
         BeTjwjtepElXjXlrMjbwwSetDotOfsiCE/bLJMZ1h083FqIxUWUw4z1UHdz8DMxA09+S
         3zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1/f2/rKITy1d+h7OReZAB8qaT+bG+8V7QHnxwKLcGA=;
        b=0wIb13Y78wdmTrZCQA/zu6eNwYPJuOUzV+4h0XNCxZrmVodF0Ve0MstYH3mOufkhvR
         Ss8h+Zu/o2hb8K6nkxwRK0H8BuYMWQ9RJ09TB1oMErIJF+ZEPlTSa377kwdzF/RZOLoj
         OwYyN7MEHjLPNhseSk4LhxwvzaL4XArB8Jrsb9ZzuhOp0YL4yg8GgSJRanE7B8k3T7ct
         VIVkathsoJpmmglsGCse4wvkzJggg7QFsTPoGPRVoAoD2mv6rMSlKB1N5g8GnxCr+eW7
         goWq0X1cOXBVHeZHskLoso7Z8u2JD+0hP+ViqBYPwYOfZ6byhZuAHRwaWr+0uzZ0fJwB
         vglQ==
X-Gm-Message-State: AJIora+hIlcADvhtjHzpp0X7332NhkqlU1xPrRrm0pzZpI7itMRqRVkN
        D6IU6tZFFLp8gpn60puoOdeijW4VCVyyIf0IMHDdiQ==
X-Google-Smtp-Source: AGRyM1tmgt8TZnYAyNkpqAhGWIFEBstt9BBC216HK+qH4HToNM4WG0hDUqZE/qRnYCiuTQ6glRAZQaz84Y4ucDy3XfE=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr9331040ybh.533.1656419741944; Tue, 28
 Jun 2022 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220307141955.28040-1-alifer.m@variscite.com>
 <CAHp75Vf=vQd5-PGPu3Pcx9bhKSfhdnYDOSOmZKQZQ+bxVkpmYg@mail.gmail.com>
 <AM6PR08MB4376058D3FFB4139E9292EE8FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
 <CAHp75VdDDhMgQ_oiHGA1m8TQmP+F6neT_KG=UKqsEe9P96HbHw@mail.gmail.com>
In-Reply-To: <CAHp75VdDDhMgQ_oiHGA1m8TQmP+F6neT_KG=UKqsEe9P96HbHw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:35:30 +0200
Message-ID: <CACRpkdbV+07oVqDvdHEUJ65rvuFN7i8i4U1T4zf6h5KLOXz91g@mail.gmail.com>
Subject: Re: [PATCH] driver: pca953x: avoid error message when resuming
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pierluigi Passaro <pierluigi.p@variscite.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alifer Willians de Moraes <alifer.m@variscite.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Eran Matityahu <eran.m@variscite.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Francesco Ferraro <francesco.f@variscite.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2022 at 6:03 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jun 20, 2022 at 4:18 PM Pierluigi Passaro
> <pierluigi.p@variscite.com> wrote:

> > > > Avoids the error messages "pca953x 1-0020: failed reading register"
> > > > when resuming from suspend using gpio-key attached to pca9534.
> > > Thanks for your report and fix. My comments below.
> > > First of all, how many of them do you get and why is it a problem?
> >
> > The number of occurrences depends on the time required to I2C bus to fully wake-up.
> > It's not a real problem, but the message may lead to think about a real I2C problem.
>
> Wolfram, do we have any mechanisms that guarantees that I2C traffic is
> not going on a semi-woken up host controller?
>
> Writing this, I'm in doubt this patch is a fix we want. Wouldn't it
> just hide the real issue with some resume ordering?

That sounds like a bug in the pm routines in the I2C driver. Why is it
returning from [runtime_]resume() if it is not properly resumed?

Yours,
Linus Walleij
