Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AF73AFE78
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 09:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFVH5l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Jun 2021 03:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFVH5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Jun 2021 03:57:39 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48BEC061756
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jun 2021 00:55:23 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id c23so1699069qkc.10
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jun 2021 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g9aBePfq1/KpWdqkDFgr1We+3KCLkJ0L8u7O6nn+3jo=;
        b=Px9Tadx5bMq0vSKM2XDnWx10m9NkEZC+S+ZT+Ccdf2855IhV4DbtWdLO06ur8qkiT8
         iZVzl4yOsDQz/cLQtHNY+UPzXOckkBZg+cFuzOyJFVfxv0jJEiYSUymGF0ZqB8GbZy1w
         BtT01X6nY9orL7tj6PQo3bkl8iIBlFrwN9fog0Tu6s6gSnaqqlyW2Vu9DqUR1cMPwSC2
         TwWVZGus7bRQYaPsfxt0iZbDkclMVEbwyAdxULaXBOQKOAqa9msQ+7I2586IK+E6i9iV
         GGYiSO8BaBCCI9FNJ1oOQDkb1QKi9nIxcNQcUH4H5s3GA3sb/wwd4TUTXXaUx10XGdAA
         3Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9aBePfq1/KpWdqkDFgr1We+3KCLkJ0L8u7O6nn+3jo=;
        b=Fagg3XfKM6Lw2aKgDFMOV2hV7N39AfwKG1sFTydG1fAVZqOLD/RYhsGgS8fmj4lDlL
         wbBFPUmDkIG9U4o/5W4myaoQ9ehWCcoZ432TP1ElhxKMlipH0ZeWoBLU7GJ4h65PwtgU
         0IxpB86ox0ze9wZ1FiSCpQ1XBgPDOd8Zi0MCVJU1wiSIEBJDiHeTRSvjeQhNxi2FpW4Y
         okOzGvovpuPoxiAnPpp1TbB7+K27fLIqnfJvDAzhhEc0vjOVEFEodGJviNd3Xn8N1w/i
         4Jh80Fb/1sEoa5VHtT/UFiclwBhs2HBb0SBoZQgvDAzoH7XsSjjROlRAxwba6/1lspHh
         2MqA==
X-Gm-Message-State: AOAM532UCDG3Oz+GhO+hvJHfJIqPQHEJbnrP90gwbV86bAzi5mCnLs/p
        04O7ewTDXGNbl79h8Flotvg1AlZ037oQqUQBvOl6/Q==
X-Google-Smtp-Source: ABdhPJw2hXewn8FpKtmuSSAZpnVwhBWJde4ZMKIrIVNNDVTtd+9iS/Zf4hPk2BHfcx94ZNirkltH5BZ187sDZ28F5MY=
X-Received: by 2002:a25:1804:: with SMTP id 4mr3012601yby.157.1624348522940;
 Tue, 22 Jun 2021 00:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
In-Reply-To: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Jun 2021 09:55:12 +0200
Message-ID: <CAMpxmJVREmcqxFJn9CQYL_Y9E3X-8DYRiTMLD5hNE90m8sSG6Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: cdev: zero padding during conversion to gpioline_info_changed
To:     Gabriel Knezek <gabeknez@linux.microsoft.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        joe.reviewer@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 22, 2021 at 12:29 AM Gabriel Knezek
<gabeknez@linux.microsoft.com> wrote:
>
> When userspace requests a GPIO v1 line info changed event,
> lineinfo_watch_read() populates and returns the gpioline_info_changed
> structure. It contains 5 words of padding at the end which are not
> initialized before being returned to userspace.
>
> Zero the structure in gpio_v2_line_info_change_to_v1() before populating
> its contents.
>
> Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
> GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> Signed-off-by: Gabriel Knezek <gabeknez@linux.microsoft.com>
> ---
> Changes in v3:
>   - Include the Fixes tag referencing the code being fixed and properly
>     version the patch.
>
> Changes in v2:
>   - Update commit message and subject with suggestions about clarity.
>   - Patch series at https://www.spinics.net/lists/linux-gpio/msg62163.html
>
> v1:
>   - Initial patch
>   - Patch series at https://www.spinics.net/lists/linux-gpio/msg62084.html
>
>  drivers/gpio/gpiolib-cdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index ee5903aac497..af68532835fe 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
>                 struct gpio_v2_line_info_changed *lic_v2,
>                 struct gpioline_info_changed *lic_v1)
>  {
> +       memset(lic_v1, 0, sizeof(*lic_v1));
>         gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
>         lic_v1->timestamp = lic_v2->timestamp_ns;
>         lic_v1->event_type = lic_v2->event_type;
> --
> 2.25.1
>

I fixed the wrapping of the Fixes tag and queued this for fixes with
Kent's review tag.

Bart
