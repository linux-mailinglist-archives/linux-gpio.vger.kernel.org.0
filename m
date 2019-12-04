Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CD91137A6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfLDWeU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:34:20 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33282 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfLDWeU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:34:20 -0500
Received: by mail-pf1-f194.google.com with SMTP id y206so568048pfb.0;
        Wed, 04 Dec 2019 14:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mj73wwGTzwobUOE10qqPsX0ktiedj3Elx2zmgNCccJ4=;
        b=iwtBMr1Hy8CtJSLeMmSrtMcwOz8IGWK9v6+xEobUDXXH8VKGJqbTqEJKziPAyeSpfh
         fFBDCFEBHtdsEVDinSCI9eTBZUh+yG2I5rIDJiUXno77WEgA+GLQovsTStPRniyylUHS
         C/Ex0fjDVBBw/byoQ4R8gvurZIpQl8qyW90cCSmwPWIoMeA2m77RrgdH10p8ZVJS2GkJ
         DHXDT+wctNxP/KWd3WiPZeB/s7ESwtkBgZTX5fntMlegK5HVvYI6e8vCAtlz7e61I6RF
         nKvC3BCe1r5gv0uy15Hiignm1cdTiEbpsj/P9nlsStE5GURRf0J7ywG8tKe3APyWAquC
         zsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mj73wwGTzwobUOE10qqPsX0ktiedj3Elx2zmgNCccJ4=;
        b=nwd8QrbwUT0FphsXR8EepEynSc7NsxHnYCnwOjuD0kD//n/5ziKqejHcfyY/3eiUxm
         WQ1WXcdbuuhmNpIodvbIZ1Zy0apkhxK0OuT7g8vxpkeSvzQxThuQY3juAlIivsIlrPox
         TvAMRfnO7RCU/njlW2eRpyIQadpnQyYm2UmcQ/E5ZPobQsUVPVasspiN1MlU6SOBbBg3
         1uRO5VgGQWzZ5RxlthP/h+3kzaO8bYjcsEPrj8Mgmjt3EY3T/5tzBS2cBmZ6PNEreq/E
         hxw0wuu/Y65+pBVATKn+jlm+gT1kpa1EFUEbQh+cntRYVKOmV+rdvUeY8ScS+E5LDyLD
         +EKw==
X-Gm-Message-State: APjAAAX+nPhl+kGZeIlPxnnhfN4v2aCwj5fEoAfGtu4C+y9tnhsyB6ez
        1fpDjx4TJxAu2xc3lCG2CQUAK7RUtCj5Q0MSgJQ=
X-Google-Smtp-Source: APXvYqzPL1VrsxAaAH8m3fWGppI2f1+2DcKVlmnPfqF6XpjI2H4L2ZPs+A6+Lo5lRyIykXrMDIaljzx1oqqwPYahj9g=
X-Received: by 2002:a63:2b51:: with SMTP id r78mr5964208pgr.4.1575498859478;
 Wed, 04 Dec 2019 14:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl>
In-Reply-To: <20191204155941.17814-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:34:07 +0200
Message-ID: <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
>
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
>
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.

> +/**
> + * struct gpioline_info_changed - Information about a change in status
> + * of a GPIO line
> + * @timestamp: estimate of time of status change occurrence, in nanoseconds
> + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> + * and GPIOLINE_CHANGED_CONFIG
> + * @info: updated line information
> + */
> +struct gpioline_info_changed {
> +       __u64 timestamp;
> +       __u32 event_type;
> +       struct gpioline_info info;
> +       __u32 padding[4]; /* for future use */
> +};

Has this been tested against 64-bit kernel / 32-bit userspace case?

-- 
With Best Regards,
Andy Shevchenko
