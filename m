Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C103AFAE5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 04:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFVCJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 22:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFVCJR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 22:09:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E45C061574;
        Mon, 21 Jun 2021 19:07:02 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 21so230344pfp.3;
        Mon, 21 Jun 2021 19:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+eNaqCSw1GzSakghPgObAofSfAD7TV7alaYIjcbBA2A=;
        b=KxDCCUv7Vj7vpHfKF27pYRTONtQTFyirFW2wO3NDnloHcIxMUL1P/jY+APL679aP4w
         tHWWoXymUFayTyjA5Hsyo8P8LUhaJugSA68VMfYOggVwKaDAKxW7iUbv+nGeG7GwPtYU
         e5AnOXcPPmHAXV6PuYvx+Gl7fO00EXk9KmhCs0NMYrbmmlqnYuxsiuvhnfj5KnW/ZTC3
         JDpS6Aa7wQbaHZnAhNMg/Ff33RPT83K/SLyz8kGUnnWeiQSeiW9DeYSFpZmgl4sz4wFK
         A8Xhd1+aQ0tqOpROyHtXhN3lfiq4LvAu3r0s0w59qan/bKcCVcLMyF6073kDMy632Xo9
         HClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+eNaqCSw1GzSakghPgObAofSfAD7TV7alaYIjcbBA2A=;
        b=ZlKlH+nOfOgsFAw683zhDIOVf+eIZtyh4mI8hZtrkcpCjuwV35Y8tnD9r+EMm52kYd
         VYpZ/Ljc8X26RSKmAnkK7aUZhUWonzhkaq9nhs1BWXOdaIDw5raIRtJ7DDw3wIh4PxmW
         pTgnKevPz4iEwapZwLgMMFdOmTeIspg+ZqY2cwbVbCXkWLX8DYSc5gzbFm0MDKUQzqim
         NZz3A2ILRHoZkCqubFTL1/Uo7ypgjD2ktkhzBRRpDxgEYIxXdcfSQvjEJeoXztTeJg5x
         q43MhoEeMIQLLvmQ2z/a2jPG4ZQK2w8KMcMEPS/uxQPITlzF7BaAU0l8pkz+dY4h9KZe
         w73w==
X-Gm-Message-State: AOAM530ykOWY+yoXxHVHV/6pgtHZQFXUJ2Zg9WUc8mvPO8fgcHehDUIz
        0pLzvjLf3RI44UIPipHQ99EP42+DYTb6JA==
X-Google-Smtp-Source: ABdhPJyZW0bGP+Wu6o4Bss/FwiNDBI6lImCMMTlmIO/ZPmYm03OLZl9V62hwcz82mUj7fyuvXmi9ZQ==
X-Received: by 2002:a63:1453:: with SMTP id 19mr1413031pgu.270.1624327621789;
        Mon, 21 Jun 2021 19:07:01 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id b1sm425924pjk.51.2021.06.21.19.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 19:07:01 -0700 (PDT)
Date:   Tue, 22 Jun 2021 10:06:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@linux.microsoft.com>,
        bgolaszewski@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, andy.shevchenko@gmail.com
Subject: Re: [PATCH v3] gpiolib: cdev: zero padding during conversion to
 gpioline_info_changed
Message-ID: <20210622020655.GA8794@sol>
References: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624314539-17396-1-git-send-email-gabeknez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 21, 2021 at 03:28:59PM -0700, Gabriel Knezek wrote:
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
>  		struct gpio_v2_line_info_changed *lic_v2,
>  		struct gpioline_info_changed *lic_v1)
>  {
> +	memset(lic_v1, 0, sizeof(*lic_v1));
>  	gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
>  	lic_v1->timestamp = lic_v2->timestamp_ns;
>  	lic_v1->event_type = lic_v2->event_type;
> -- 
> 2.25.1
> 

<sigh> The joe.reviewer@hotmail.com in the git send-email example that I
provided off list was just that - an example that you were supposed to
replace with the actual reviewers :|.

I wouldn't generally bother with the links to the previous patch
versions, though it might be helpful given the rename and version
issues of the previous patches in this case.  If you are going to
provide links, use reference style with all the links at the bottom of
the mail.

Other than that, the only problem I have is that the Fixes tag line
shouldn't wrap - it is an exception to the rule.
Bart, are you ok with fixing that on the way in - assuming there are no
other objections?

Cheers,
Kent.

