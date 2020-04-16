Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC931ACCB0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 18:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgDPQHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 12:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727936AbgDPQHC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 12:07:02 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1600DC061A0C;
        Thu, 16 Apr 2020 09:07:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so8403017ljn.7;
        Thu, 16 Apr 2020 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LbJR4G88FU2SJNDVd7+mZPSSYRkRlcccCmXj//WrJbc=;
        b=BzwXd/+X5wHFpqbjKYBI+DM1PTiB+plm7L1MKs0YDQVU0gNK7K0SU5ic11WGDlnNDv
         pSMw+EEoB4GZ//KOhpHfb4zxktf01lNSZLICSqirSCxe3jdnX+/wBpszQvIbhFCo5fjc
         2eKr778KFbc6v4N6TxrU3zC2bGU3OGxR9fpMq/vz4xrndKEx8pTK1QyYJsdyNf3ZAt+R
         sMaD531bmASpI8hN6IJkY01MBlPgfUXvn22IHb/XPDIHLrAnPDywzjVNf/qhofLi9Bfw
         lKNkD9M5O1fUlS37dFEHBFAtnDPOtgozHzQ3ZheJtE8uF7H+7+6HUhxUfbDyFW9oyXWx
         Zk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LbJR4G88FU2SJNDVd7+mZPSSYRkRlcccCmXj//WrJbc=;
        b=oKCUmmBrvNlTmpF7dXnSbTZKKHE01AAlZnJR+Y9ebUQ4sK/TRqnv+77xUdzT4fhEhH
         HDCbvaV03/ZVYvQ0uz+754UZNUCazIZ+AoIErxRPrwANoAChzpW+XOyMan/LXGWDR8v+
         XBVkGDFCpbZdzsXa22nljLxkNftOq4Wja0onuQtn6q4WEVRRHdBJx8dyF/AmUT/9Slcv
         2XL2k4x6khjDCi/KipQ8E6eSAaviGUxcuLc0w09Y16KImlw5X+v45hGW2+eFXcq8F/a/
         SVLesO9lW/+gSimpBwQmbwEZ5FGiQ/E3jCmldrzSPgt7mf/KgM2HjnwrvLfR0CebjTJr
         0urg==
X-Gm-Message-State: AGi0PuZUVsjkfDxONxBV0baPVOOuop1rjxTmGt1c55b2L1y1uyzIYoWF
        He1bj6cWMZ6X9pMijL+9eJk=
X-Google-Smtp-Source: APiQypLfL2DZlKS1XN9ILdmvxgaYQy9VYpTiflmdlmdRTwsMFFbwwuQm1KYi6SXRea5lUpEX8q00bA==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr6797750ljk.103.1587053219333;
        Thu, 16 Apr 2020 09:06:59 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z23sm14116438ljz.52.2020.04.16.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 09:06:58 -0700 (PDT)
Date:   Thu, 16 Apr 2020 18:07:38 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200416160738.GA2511@x1>
References: <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
 <CACRpkda_upTeRn7xT9LuAkVKAf8LxUmQJJbVWhOoq+4zyoxfsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda_upTeRn7xT9LuAkVKAf8LxUmQJJbVWhOoq+4zyoxfsw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Thu, Apr 16, 2020 at 02:03:43PM +0200, Linus Walleij wrote:
> On Thu, Apr 16, 2020 at 1:36 AM Drew Fustini <drew@pdp7.com> wrote:
> 
> > Is there no way for gpio-omap to call into the pinctrl-single backend to
> > set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?
> 
> Mostly a Tony question I think, but the single pinconf_ops call
> pcs_pinconf_set() which is pretty straight-forward.
> 
> Have you tried modifying omap_gpio_set_config() so that
> it accepts these configs and just calls down to
> gpiochip_generic_config() for anything that is not debounce?
> 
> Yours,
> Linus Walleij

I did add the plumbing to gpio-omap to call pinctrl_gpio_set_config()
when PIN_CONFIG_BIAS_* is set.  I added lots of debug printing to
pinctrl and determined that the problem was that
pinctrl_get_device_gpio_range() would fail.  This seems to be the result
of there being no gpio-ranges property define in the device tree.  This
makes sense as currently there is no interaction between gpio and
pinctrl subsystems when running on the TI AM3358.

Another issue seems to be that the AM3358 device tree is using
compatible of "pinctrl-single" [0] and the pinctrl-single binding
documentation states this means no pinconf is possible (as opposed to
compatible of "pinconf-single").

I did try switching to "pinconf-single" but it failed to boot
successfully.  I need to troubleshoot more to figure out why that is.
But I am uncertain if "pinconf-single" should in theory work for AM3358.

Thanks,
Drew

[0] https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/am33xx-l4.dtsi#L279
