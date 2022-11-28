Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522D463B0F8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 19:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbiK1STC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 13:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbiK1SSP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 13:18:15 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CC428E05
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 10:01:54 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id v128so11381940vsb.13
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QexoqWdeokElcVRbvwTIwf4cQaQS5dsOdW0P+NAr/z8=;
        b=JyMC/rotFxRFXfPF+3IbjnU9Epuw/MxwkPLEXbNO+fc0tC3rGj4wxW0xv/b+2bfjTD
         qBurEsi5SxshCZ2Ddb4TgUE9c1ZxlBHqxXoqJMSv1mF2DmTV0BVXxwSGrMmSxcHmuWVN
         JkZ82bxrPFfnjLPv/AxRpd7NnX9wU1Ywwx+1QQiCuXlxhQ4aQAEYNo6RSYELcKmeP8DR
         d8xIZ8FHgCnKHIHbnzLiEuTpH6DmNhmoi5WJzgniMk5cCFB+fHypsHYC8Rq9iNUtEZlj
         RH7uN+tWflR2DMtf+JrBJtVIVQbkYa2rIzQBv9b7xPCv2vBp2SikFhziSmyy2yZdu0ub
         75nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QexoqWdeokElcVRbvwTIwf4cQaQS5dsOdW0P+NAr/z8=;
        b=PU21k+/kC4QrcHOQ3+WjMGWhSpkAMWfMHusBUQAwd+4Jc+aikikKfubQCgz4t04nFa
         iWbb/GppmRm97x+bdX9jr1EanhhTEn07s0oJxiK3nhLQNGEhcUI/L80C30/N882LzaFR
         Z7YohBMqDB8P6GdIiAObRSmECUyWipV22A6R+CyoQ/4rQpTuJLfanVIALT1GAGmBExsa
         dEmP34KP8m+OGHrdSJRiBkH3vu9YTYp45kjjjZSfymz3U0OO9blOKq09/22kMB3bVCVT
         dPfDz8jGU9QDp6MyXnRHsFzgcsEg07WW43+YYZnlMXObkvx00aqPLWrphYae/lTI3xQr
         0VQg==
X-Gm-Message-State: ANoB5pnujQueMuSfCStmJdUw1tixbj+2ZH7UEHQ6BNxY49NMBlen9XfF
        Hs8b7ldV14Jgq8qOvG3teSdqgi5nVKlzxzE1v2SL2Q==
X-Google-Smtp-Source: AA0mqf4PMrKYKIo167WI1hOKlkTa957uLxB9epK6wjt+Opyh0hBPMBC2n8lZ9a/7/ZK5hw3TDxvRzFlvHXMsoaVhaJE=
X-Received: by 2002:a67:f645:0:b0:3a7:769c:6dee with SMTP id
 u5-20020a67f645000000b003a7769c6deemr20340311vso.13.1669658513251; Mon, 28
 Nov 2022 10:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20221116141728.72491-1-andriy.shevchenko@linux.intel.com> <Y4EJv2gCR8nj3hHj@smile.fi.intel.com>
In-Reply-To: <Y4EJv2gCR8nj3hHj@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Nov 2022 19:01:42 +0100
Message-ID: <CAMRc=MdBDsN36CEvmFB_1pH9o5kzMMuSfGQmWKgDA6iaOqURYw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Unify access to the device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 25, 2022 at 7:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 16, 2022 at 04:17:28PM +0200, Andy Shevchenko wrote:
> > Some of the functions are using struct fwnode_handle, some struct device
> > pointer. In the GPIO library the firmware node of the GPIO device is the
> > same as GPIO node of the GPIO chip. Due to this fact we may use former
> > to access properties everywhere in the code.
>
> Bart, can this be applied?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Sure, now applied. Got carried away with this use-after-free from
userspace problem.

Bart
