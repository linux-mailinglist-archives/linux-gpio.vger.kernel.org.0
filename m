Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61E528ACC0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 06:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbgJLEUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 00:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgJLEUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 00:20:16 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D722C0613CE
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 21:20:16 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 1so2051295ple.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 21:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rQGNEfXrpPUCBuLRUMQY74vDZyCBVzFwJG26smzlRuU=;
        b=L5v+ViQR9Ym8DfmUui+SPEHRtr5noAgnh3wnjQVOG7i0nszy9TpXsddp1RXWBQOSfk
         apYPYrqMWUNd4GgosL4wwJlJhpg65/M7MDGTLs+5gKEZiHVB/Qhd0hqrMNVCMoZJYOdf
         ub9mjws9T1FrbV9ZKZkIcrbU/PkFDZgltRm1LzrfOiGssIefKMA62/9g/VJDesfWh1P7
         77x8XhlLlrmcwQYjewXVLBdv2jhHilpqZ+ubb2WXAaJ0LlJBEf6XDIfRedwNHUI67WuB
         aTjKt3ge+5R8uGnjKzOXbecyDCuZW5FQ3xieH7MDzld1D/bBeiAYm8tWjxbXofmFlBBC
         6SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rQGNEfXrpPUCBuLRUMQY74vDZyCBVzFwJG26smzlRuU=;
        b=czOw5FW3plP2eNGVzYyAzJt0bkSjSMAIy2fdsHNGKY/VtYn7yDbIq8Lqr5p945v/gU
         fdfzb2bwx8Mm+nSr5D1ipbycbYv3ydSCCpV3jekOOB3epMlOLO81Zzf85zY3U5DPfCpr
         KsVrggD5/mgq4rHhO0Hex767/guprAPLOBDz/kASQVv4OsNgZP2D0hwOJnjRr2z5UrJg
         +d4b6VZylMfuqHD10+T4KCs/MHZR8bBjgrMSkBv+31/d0Vs8Ia1ju0eaoHn6nsj0GAL7
         sGrDRpqf1grLfl+zqFwGVWSY3t5LOKmGBkMtVqmlOL8262VpvrpiIGkXhm8Leth1qi4P
         t/rg==
X-Gm-Message-State: AOAM533e5Xl53m1D9fqfvaKBn2BK1eLRl77bIrFPhRnFygfXjjn9OUo/
        GuMeLhwKnTgcdKPa3J32sfY=
X-Google-Smtp-Source: ABdhPJw3rVb/QSdOaHlY76Ce3juYppzW7dcPucmAFzixwSW/2M37O+8vYIrhHiGRzlhE8dPSCbkNlQ==
X-Received: by 2002:a17:902:7e0b:b029:d3:8afd:5392 with SMTP id b11-20020a1709027e0bb02900d38afd5392mr21798018plm.5.1602476415763;
        Sun, 11 Oct 2020 21:20:15 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id d8sm22618555pjr.46.2020.10.11.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 21:20:14 -0700 (PDT)
Date:   Mon, 12 Oct 2020 12:20:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Switch to use
 compat_need_64bit_alignment_fixup() helper
Message-ID: <20201012042010.GA13984@sol>
References: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 08, 2020 at 04:41:05PM +0300, Andy Shevchenko wrote:
> The new compat_need_64bit_alignment_fixup() helper allows to avoid
> ugly ifdeffery in IOCTL compatible code. Use it in GPIO cdev code.
> 
> Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
> Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")

Where can I find these?

Cheers,
Kent.

