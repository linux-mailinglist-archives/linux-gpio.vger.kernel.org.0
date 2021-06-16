Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD323A97FE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 12:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbhFPKqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 06:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbhFPKqy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 06:46:54 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C843C061574
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 03:44:48 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ei4so1463339pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8WNBsA8w4FtGwSAbPBjfQBSltJaZNGycOCn6FfDSNJY=;
        b=UNuWhApqrjPlFIwUDHIpwxtkPkpE6FXBtfMl2LqgMVKmGVS+gOZNy34AEK4UGwyFyu
         jOF7LrDoIDYTuqvSF19EB3soRKFLlhwT2Gzk2GJMKauPSeDlcVhUe2IvRiqmZ1zIBkss
         G/rkOw2IR2v3+nIkLWllbM+IitFXlaFHOFuylOw9TKut4S4wg2CmOqGo1fYTfC0CJTWK
         OKLwDVl5qfwdKuqV4Q0TsI10Tw5XpqCIOOCL4rBmdxEOUFMDMBB0KB/389/nQ0BBVDL8
         4Zq+mfa0aAgl3BJ5Y1wS/P06vk6GLHnOPJ5QfgagBkCC9aa6hI3cW9k+0oSvBUTK35Mi
         1rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8WNBsA8w4FtGwSAbPBjfQBSltJaZNGycOCn6FfDSNJY=;
        b=HXsDkI3YcaP72snIumWM/WEWmkzafSgo1jvsQNUQJnnYhaQDaoXSwmXJEVljvBDYkb
         zZNz74jPplWXwvqExo3pJ6RpksYiUpM9ck3emdmCpXSyXFBIQ+lhMyM54SxQOOcWydQh
         4O1ycR8bREbGu0E7nMrVPcymy1zrDEhWe+Vz65ZYoPKEToH6ZhAC8FLgHJglvJZG6Lv+
         qnyFYdbvz/kPrs/lCoadDE5AUoGoXRpk98hDAf1SSU7JiC3Iu60qWPTH6kC2Ulolkcje
         h+2qRU5j/TkirtEdKGaYjtryB8m0QhcgXD4W1kAeYUKsSpf2VsSXs4KWp12JZkVrX5id
         FfSw==
X-Gm-Message-State: AOAM531ceeuR87MhuA9cYtAGRPqslaKoQXO5xqPiQkxK4ctuQQZQLDAb
        r/7thU8GXqzvC21+P0GDkn0=
X-Google-Smtp-Source: ABdhPJwyZrNKZ8WaOAcsJmSSRMq0UDIzwgcF4VQ1T7T0c6DjUQ2iHcfNInJXwlbviTRiNPTlwCIgpw==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id e14mr10091152pjh.209.1623840287561;
        Wed, 16 Jun 2021 03:44:47 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id y20sm2194105pfb.207.2021.06.16.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 03:44:46 -0700 (PDT)
Date:   Wed, 16 Jun 2021 18:44:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@microsoft.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Potential bug in gpiolib-cdev.c in v1 notification about line
 info changes
Message-ID: <20210616104442.GA160816@sol>
References: <SN4PR2101MB0734B4BE5D7750A5CD43C3ACDA309@SN4PR2101MB0734.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN4PR2101MB0734B4BE5D7750A5CD43C3ACDA309@SN4PR2101MB0734.namprd21.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 15, 2021 at 06:57:03PM +0000, Gabriel Knezek wrote:
> Hello GPIO maintainers,
> 
> While upgrading our system from the 5.4 to 5.10 kernel release, we noticed this potential defect in the gpiolib-cdev.c file: https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-cdev.c#L2255
> 
> In the lineinfo_watch_read routine,
> 
> } else {
>                 struct gpioline_info_changed event_v1;
>                 gpio_v2_line_info_changed_to_v1(&event, &event_v1);
>                 if (copy_to_user(buf + bytes_read, &event_v1,
>                                                 event_size))
>                                 return -EFAULT;
> }
> 
> if userspace requests a GPIO v1 line info changed event, the kernel populates and returns the event_v1 structure. That structure (https://github.com/torvalds/linux/blob/5bfc75d92efd494db37f5c4c173d3639d4772966/include/uapi/linux/gpio.h#L367) contains 5 words of padding at the end of the structure that do not appear to be initialized in the gpio_v2_line_info_change_to_v1 routine (nor its subordinate routines):
> 
> struct gpioline_info_changed {
>                 struct gpioline_info info;
>                 __u64 timestamp;
>                 __u32 event_type;
>                 __u32 padding[5]; /* for future use */
> };
> 
> It appears that this could be a potential kernel information leak to userspace, and could be fixed by zeroing out the padding field before copying the structure to userspace.
> 

Looks like a bug to me too - well spotted :(.

> We wanted to get your thoughts on if you feel this is actually a bug, or if we overlooked something.
> We're proposing to fix this issue by memsetting the entire structure to zero before calling the conversion routine; if you agree that that's a valid approach, I'm happy to submit an official patch.
> 

Go for it.
I'd zero the padding in the conversion routine myself, but zeroing the
whole struct in the same routine as the copy_to_user(), as you suggest,
would more clearly demonstrate that it isn't leaking stack.

Cheers,
Kent.

