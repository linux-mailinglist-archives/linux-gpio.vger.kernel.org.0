Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41435A3DEB
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Aug 2022 16:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiH1OA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Aug 2022 10:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiH1OA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Aug 2022 10:00:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360E6BCAC
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2022 07:00:27 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id p16so7935391ejb.9
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2022 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OrgWu3fZldtDvQBuwt0mH44mgmjlE3JZmLjqLKOozG8=;
        b=3yF26VHuCw3Ae9F8lemwYUpowtD0mSbjTYaLGAY8FtzyRZl4Bjcd1w6tqEOyC7Se7T
         o+kpEkgWOKhHykpo9b3GlH+G/EbOi3xLFplTUyX2I3+AqeS/o8n0tJkmIk8mDCJWu+dw
         VVVw1mPqZCIwXy47cXvk0VtlT+mRvMIG5DFbCnLfmhTlOQzmvqsikU5YNW0ng6tpQQMU
         efsKB2FdCbH9Fg1YpTrxNGeUgnfYM1wQYQnT7Ck8VATyl8NtPJ+mKK3wCVsR8Xycu6ch
         v3eb4rCHpkzUIQd85nEEN9YpRNXqWcmQdm2x99DESZ9RqQswMmOHqi6UddthtcDCxOis
         VY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OrgWu3fZldtDvQBuwt0mH44mgmjlE3JZmLjqLKOozG8=;
        b=n04Jz0KezLsM8JCXhqH0a5OjxaOWtCMTTWDzIBuKrZzm0EOb0wrtesHLFsv7dQFJvn
         H6jdhD6LwGDaeHR1hVK6gUL8bcuWPvjs63AyWhhI5oTnq07gDXY60iLgxmRva4aNKn8e
         O3afk+YXRj+XtZKEZcu8GvCiwUGBPuacKkmUZ0cgUUHY0jN3FccZ/4EKBO0w0g0qHUj7
         9LpsHvZxEA2swuGzvO6USFhjSRcmkClVoPUwsW8BkDlutZKgsAK+dw/HmAKHK3ekJxiL
         o50yp4S7khObNVfONUUjvkOhwPIxVecaGBoc0ivkfQMExSqQI6xhwKEZZ3CX0CWI6E3m
         tAjw==
X-Gm-Message-State: ACgBeo3VgezhMIatj8XnubKNcBh2ABawp7KizQFUE3WXkNqvE6xMVm78
        xvzMl2LBQ/EjrVLrs1NmpifT9KFGuLULmMKDPHET4A==
X-Google-Smtp-Source: AA6agR67pEUKbSn5UDlZuduzA4Hw2gJow8cOzt7dog+krnEcvAWb6BvEApsqRV8+n7bLdevvqc4nf8IvlSNdNpky5zc=
X-Received: by 2002:a17:907:1c87:b0:741:8199:a59d with SMTP id
 nb7-20020a1709071c8700b007418199a59dmr1154715ejc.736.1661695225754; Sun, 28
 Aug 2022 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220816145225.84283-1-weiyongjun1@huawei.com>
 <CAMRc=McG5Pf4b5HymV1iaFAGqMMEtyYSQi23z9LmjvzmbF4rYg@mail.gmail.com> <7d1b0bb8-838e-1a1e-886f-507b75066df1@huawei.com>
In-Reply-To: <7d1b0bb8-838e-1a1e-886f-507b75066df1@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Aug 2022 16:00:15 +0200
Message-ID: <CAMRc=McDo2MbebGGueqacEbs11r8c_MHr8WaTktGzkVWZD2K4A@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: mockup: remove gpio debugfs when remove device
To:     "weiyongjun (A)" <weiyongjun1@huawei.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2022 at 3:27 PM weiyongjun (A) <weiyongjun1@huawei.com> wrote:
>
> Hi Bart,
>
> On 2022/8/19 20:49, Bartosz Golaszewski wrote:
> > On Tue, Aug 16, 2022 at 4:34 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >>
> >> GPIO mockup debugfs is created in gpio_mockup_probe() but
> >> forgot to remove when remove device. This patch add a devm
> >> managed callback for removing them.
> >>
> >
> > The tag -next is for patches that address issues that are in next but
> > not yet in master.
> >>
>
>
> >
> > This isn't very relevant as the module needs to be unloaded anyway in
> > order to reconfigure the simulated device but I'll apply it as it's
> > technically correct. Did you see we have a new one - gpio-sim - that
> > uses configfs?
> >
> > Bart
> >
>
>
> I am using gpio-mockup as a interrupt-controller with the change[1],
> it works will with overfs dts[2], and can success mockup device and
> trigger the irq. But when switch to gpio-sim, device can not be created
> by dts[3]. Not sure what's wrong with it. Any suggestion?
>

I see you submitted a patch series for gpio-sim - does it fix this issue?

Bart
