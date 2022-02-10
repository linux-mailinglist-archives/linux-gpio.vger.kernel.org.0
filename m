Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E8C4B14CA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 19:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245475AbiBJSAT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 13:00:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245469AbiBJSAT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 13:00:19 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20EA25C3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 10:00:19 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id fj5so14334062ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyiRrCTCvD3kSlcteklEwF1Z7ulIFO497MFIShZC2EQ=;
        b=lDJDV3gk7vJd8epZow77aLEhctdFJiMdWg4bPXyRqV+P8SCznLTjg9qaMrl4uBKi4W
         FIa5xSqiTkfMTDDaQX3a6eOR3PULr05leKgBb7dtj1Z9aBTmqdnSEHwpCDlCePcizdIr
         RL4deMl0WEaY0Jh1Ab9JXnycY4MaE3/yjJweZ3uE1EswISDRfgGvftKiIcyY4+H4cJmx
         ksSJIN7XeO+LqnG802F/TkZsEYNXr+GmnNkQS0ZABy7zH5ImLkTkhCeBnSYlJHR3czCM
         ubCKLT2cdNKaVcXthXtuVbskMddyIIhCb3KdDg7PxHdghxxP8+GQpQM+WnSRcdvK6IOK
         wuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyiRrCTCvD3kSlcteklEwF1Z7ulIFO497MFIShZC2EQ=;
        b=wAUq3W8KSyrI8krU8TdPWwzomt9Sk5qdUoC1w3zNPGeJRGlfBenqRMNYB4z9E55VmE
         YOs6Uhcbjx7GnS9Pudg5YZoujiRJ3yUqaGiwpzZktTTC95IjqRF3cn1NHhwe5eENg3P4
         d+oDYoGqYoI5oxmxnMlxgyeBN+Nqajjj+XA6zKtb09tJrcENLUR7p4xK9P/v5Obyk7iE
         yRooDW+dhR/+3F0/lqwHdCTnvYDtkNfNi9MC22SXSjzL/0J2NuD4qLZ/3RFYm2hkfi69
         IZ10iENb9U+TKHwJ6bBBy/y4UfqiMPxMn+4iOwEEH5YYdaSoA+2JLQlEB5XGmOnH09iA
         rYuw==
X-Gm-Message-State: AOAM530qV1Iw/8rrgiOw3xbchxMlRVYZel7nAmDYj4MNygEla7NwW7n5
        LswHan70s3l00c0iabmqMgfl345C5jw4jtskGqM+CA==
X-Google-Smtp-Source: ABdhPJxJuyhh7OCTVxsg1XD+thnzuteOezciR0odv+RtncFHrFra5L3HMOaU0zxHkSa4CRu6l4IZA/I4m8Gi0BaaQrw=
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr7308424ejo.636.1644516018273;
 Thu, 10 Feb 2022 10:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20211116093833.245542-1-shreeya.patel@collabora.com> <874k56znix.fsf@collabora.com>
In-Reply-To: <874k56znix.fsf@collabora.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Feb 2022 19:00:07 +0100
Message-ID: <CAMRc=MdByxO3+hJruvUkULtXAaB7aWewTd=Wv0MbWyX2vykdjA@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Shreeya Patel <shreeya.patel@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        wsa@kernel.org, kernel@collabora.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
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

On Thu, Feb 10, 2022 at 5:36 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Shreeya Patel <shreeya.patel@collabora.com> writes:
>
> > We are racing the registering of .to_irq when probing the
> > i2c driver. This results in random failure of touchscreen
> > devices.
> >
> > Following errors could be seen in dmesg logs when gc->to_irq is NULL
> >
> > [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
> > [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
> >
> > To avoid this situation, defer probing until to_irq is registered.
> >
> > This issue has been reported many times in past and people have been
> > using workarounds like changing the pinctrl_amd to built-in instead
> > of loading it as a module or by adding a softdep for pinctrl_amd into
> > the config file.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209413
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>
> Hi guys,
>
> This seems to not have reached the Linus tree on 5.17.  If I'm not
> mistaken, it also hasn't reached linux-next as of today. Is there
> anything I'm missing here?
>
> This is required to prevent spurious probe crashes of devices like this
> FocalTech touchscreen, FT3528, when using pinctrl-amd. We've been
> carrying it downstream for quite a while.
>
> Thanks,
>
> --
> Gabriel Krisman Bertazi

Hi Gabriel!

My email address changed in September, that's why I didn't see the
email you sent in November to my old one.

gpiod_to_irq() can be used in context other than driver probing, I'm
worried existing users would not know how to handle it. Also: how come
you can get the GPIO descriptor from the provider but its interrupts
are not yet set up?

Bart
