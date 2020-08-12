Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF182424FB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Aug 2020 07:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgHLF3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Aug 2020 01:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgHLF3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Aug 2020 01:29:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3745C06174A;
        Tue, 11 Aug 2020 22:29:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a79so433785pfa.8;
        Tue, 11 Aug 2020 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=304tL188pyo6y/SOiT/QTty2aReGXLED7+kCMwqLL9g=;
        b=rlHh5+NzFSHNpWwu7++E++7CQ/qxSYwfQNvETTJaVo9PKBHhVnF70jK5OUyrLVtKUG
         aovptJnuQUXug6zB5piFdvZaTMuc1A5S7hbXvMKm1KMd+gMw66ppOOPXw6fmWlOheXt1
         2rXD/6uJKKjaQNlOfcFRUvOC5Hi0XibOmVja2UQP61cc5o0HlQlpwFubgckpN0BYL0B4
         kRy0R49+9K+u+RxJe+OsOiEFqVNXjAjkRlg4AoMxYWxkNDidp0BOMEY2Jlq5E/88e3SR
         Y6GAImFPCcM+nKiUZp2SwAuYAaDHGqElHl8Uoz4qQ7VGSvl5OE11uoLZL7PjMJZI8Kv5
         nuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=304tL188pyo6y/SOiT/QTty2aReGXLED7+kCMwqLL9g=;
        b=sSyZyPpLE6pjaT5w5DZQ7sgQt6mb4uiJ2zhDUHOiyHJr1mmRdZJwuuS/lv5XToJy2l
         I/LxTw7RGMdV/PA2r97hwk26C12WIN4aECJy/p7OdvNRnqq+8KhM5h/Hl2TYEmr8iQca
         jzXbbop/pi2EN2y5re4falT2WQhve/CHN036PZW8wHsQOpocHp/7vqUjIsN2ndvRbhvi
         suNo0qrV4SwBPR7P4tlIkbG484RLNVYe8RUvtKxlTon4uk94o4837DFvQx8xUsq46HVE
         lD5LaN87D3WEYOZ0dgA4VbxeOUIc05po5oOEPJBFcGsx9aAZXThy80awQb3SsY+H6QAd
         45ug==
X-Gm-Message-State: AOAM533iRVjSiKgYlWTn5/uwHlxXnmZ1+c+8Am/UKfAE2uVqwy/ZnoSO
        jnQMPx7mtPR75coaCd20tDBot14g
X-Google-Smtp-Source: ABdhPJyKvlU7xcrJ/nXe72WmTCtodUwCZLcrgurEnLH8+pEuPqQzxrtYWHnz7QGiEDzMwF1wZHd0Ig==
X-Received: by 2002:a63:597:: with SMTP id 145mr3712801pgf.119.1597210187059;
        Tue, 11 Aug 2020 22:29:47 -0700 (PDT)
Received: from sol (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z62sm856910pfb.47.2020.08.11.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 22:29:46 -0700 (PDT)
Date:   Wed, 12 Aug 2020 13:29:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Subject: Re: [PATCH v3 06/18] gpiolib: cdev: support
 GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Message-ID: <20200812052941.GA116346@sol>
References: <20200809132529.264312-1-warthog618@gmail.com>
 <20200809132529.264312-7-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809132529.264312-7-warthog618@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 09, 2020 at 09:25:17PM +0800, Kent Gibson wrote:
> Add support for GPIO_V2_GET_LINEINFO_IOCTL and
> GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> 
[snip]

>  
>  		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>  			return -EFAULT;
> @@ -1251,7 +1353,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		if (IS_ERR(desc))
>  			return PTR_ERR(desc);
>  
> -		gpio_desc_to_lineinfo(desc, &lineinfo);
> +		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
> +		lineinfo_v2.offset = lineinfo.line_offset;
> +		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
>  

This is broken as gpio_desc_to_lineinfo() requires the offset to be
already set in the info.  I could move the setting of offset before the
call, but would rather change gpio_desc_to_lineinfo() to treat info
strictly as output (it can determine the offset from the desc) so as
not to trap anyone else in the future.

I also intend to replace the use of strncpy, from this patch and
elsewhere, to placate the build-bot.

Cheers,
Kent.
