Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931804F11E9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 11:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236317AbiDDJ0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 05:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353762AbiDDJ0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 05:26:19 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB932C677
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 02:24:23 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f18so5204047edc.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CXvWCMq8kYMI9nx6nZpPVzVMVJ6yPyefjs8s/2tz2rM=;
        b=SlgmaKIo9aOLfUmIZhs3qO3e0UXJPvza1+3IPHtSEqnV+cF5vlenhi0yiSk4xpAEzQ
         3RqPTA3Ao3ik1PVdUI3DD7aX9yehdo+7v39A51esX2M4kEwBITEoX8gI/3OCpCV3u+eA
         SZVBvCN/8IDEo4i/b7Ms2/70Fb8R0F+U+OncZl1n1AGtwSgcO9dlX/k9+sxAb6mi2Zuz
         jaZRFFlG83tqk7RG9AgwluUiwxBrpNh/Nl3OB6cIMXpfBzoSLKxiYbB3hsDYEL92EyEY
         JfnLP115GDQigOhyMeqBxHn/jwnxH5YVCIs4yFkjcQhAiW/BLojOcbzZddeIdducas2K
         N5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXvWCMq8kYMI9nx6nZpPVzVMVJ6yPyefjs8s/2tz2rM=;
        b=0wjIB/CLW5nKfaozx6nfIFTolaYNRe6xh51tQK3Mnvw3on4LhN1tGxs6Pr6CehjCxN
         jeq3142tySJ0N675wQyAzTTJnWMRHLGCbf83EaRV6z5QYTVAmV5xBURbawOyL4488mwh
         qHp+M+hudDa9IONosMUI9njz+1zL+Lj5Zlb6PTDzjiEsRdrx217hlYnFQ+2xbTaRAVQ6
         abFbfXH3fk6UhXxOThQKXYqiTF8e1i8KNLsnf/GQWMx176R6aGUeEl5OFIOtCLnt/yWT
         DGCqd7baGcE4jpfMeeQYUPaha+EJbd7FVucyqSzpEpgfZcmQyUGHKNfwFfIuggIT7h90
         3ZJg==
X-Gm-Message-State: AOAM531H2l9ZIAp/JzkOIV+n/hU3BUQEsL3n4kXBspv44jA37po9Z/xw
        lO9gdl15ry7SGB+pV/PAUqF+7pkwSM7Q524pnphns3AVsf0y5A==
X-Google-Smtp-Source: ABdhPJyzPl6yWncR3tz0dS1NaK/cd0QlfPUXSTm3GJU/g7dgE72aKgWTXD+rwIeJ48/SoPv4q/uMAmddd0Trxafd4Nw=
X-Received: by 2002:a05:6402:b19:b0:41c:d713:5cba with SMTP id
 bm25-20020a0564020b1900b0041cd7135cbamr2502209edb.270.1649064261850; Mon, 04
 Apr 2022 02:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220331025203.GA53907@sol> <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol> <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
 <20220402014510.GA7939@sol> <90f7d9eb-935b-3803-1531-65bd20418bc3@redhat.com>
In-Reply-To: <90f7d9eb-935b-3803-1531-65bd20418bc3@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Apr 2022 12:23:18 +0300
Message-ID: <CAHp75VcuM2qZjZCkcZ01u=KSqyudMJTB8meORpZ0hxA4_PFg8A@mail.gmail.com>
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 3, 2022 at 6:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 4/2/22 03:45, Kent Gibson wrote:
> > On Fri, Apr 01, 2022 at 12:36:57PM +0200, Hans de Goede wrote:

...

> > Probably best to extend the uAPI to add a strict mode and leave
> > existing usage unchanged.
>
> Agreed, adding a strict mode to the uAPI seems best.
>
> And if you do it this way, you should probably also make
> the kernel log (using a ratelimited log function) why (e.g.
> bias setting not supported)  the call is failing since errno is
> not going to tell the user enough here I think.

...which reminds me this one: https://lwn.net/Articles/657341/

-- 
With Best Regards,
Andy Shevchenko
