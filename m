Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C48C1D2EFB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 13:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgENL7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 07:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENL7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 07:59:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D460CC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 04:59:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h188so1643080lfd.7
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cq4YDoKxv+Q3T5Dn5K6+1xRpSkx8zziLBhh588R6AP0=;
        b=WTjp9I7QTWVtl3rkw8ifQR1BpRtYiO7nPRppNf+bMXC1LDsD5niJJ2rtEQJSa+4L21
         1x/bXlMrWJa5FyLuNVJ3dfg0rXZ9YHgOpmLj8cDliWBXENSyqHloLb6iqGLJUh++PLYn
         lhzgO6fDM6v5fa1Gtu4v3WX/1oV+qtnnXJfQy6pg7LqHQ4COtkauFU6ildGzdlF4zY3X
         qNCrOm8tm0X17V2e33RClrT9MLy0NSNfAacpmRSJB2982pyshJ9Q6MeiABvw1HAmhe3z
         RqZ3kA7t0QNX3aXTHts9a+n9TjNoJNmKLpEtswDiv0HhdlauY9pjFXI2ZkHeqMYIf28w
         38DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cq4YDoKxv+Q3T5Dn5K6+1xRpSkx8zziLBhh588R6AP0=;
        b=ulpMTCjUdI67kExwznTwtc+dP08cLYGsOjvo2Onegu7aPC2yXrZ7x2NRlYnIV7KhFm
         PnFjHkBJVixiHjKB/0H50GUwWYkODgmezDvFO8PLOZXA0ALYhPwVd9sYK9s3CzlM3X8G
         fzwsdVsWNcoZPpFcIQd/40FpdFu0TNdXT4ULUBAC68V0oBoCzpSnWnAUH0KIykHaLmI2
         heaWNJQpO1asCKv7yK/pK4CHG+Pt53OIyjoTd28sGkyeTt+vpUWDyzNrE5VFZepnuZO2
         CatN7xItdj26W7Y76ZS+A+nUlrnD3VhstGxWM5SSW89jkIh2ybpRSNop5gm27/EbShYQ
         Gkqw==
X-Gm-Message-State: AOAM533Vs47r167jveEYNddzwoVLf3OA19UFbo+D4LRpfDJiyt9LFC+y
        DG6Xd6vrW1Xfktc3ukuRp/o=
X-Google-Smtp-Source: ABdhPJwIL2BkMoIqQu/zTfxX6g3jofgO5Rur9vgrPsYTAiS55lhAThxRWXgrsO8Bt3BBpCjcKZW95Q==
X-Received: by 2002:ac2:4a70:: with SMTP id q16mr3064426lfp.79.1589457579321;
        Thu, 14 May 2020 04:59:39 -0700 (PDT)
Received: from mobilestation ([95.79.139.244])
        by smtp.gmail.com with ESMTPSA id v4sm1386140ljj.104.2020.05.14.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 04:59:38 -0700 (PDT)
Date:   Thu, 14 May 2020 14:59:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/4] gpio: dwapb: avoid error message for optional IRQ
Message-ID: <20200514115936.nfjwwfifo2leddtu@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200513144349.GP185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513144349.GP185537@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy

On Wed, May 13, 2020 at 05:43:49PM +0300, Andy Shevchenko wrote:
> On Tue, May 12, 2020 at 09:45:10PM +0300, Andy Shevchenko wrote:
> > platform_get_irq() will generate an error message if the requested IRQ
> > is not present. Use platform_get_irq_optional() to avoid the error message
> > being generated.
> 
> I will wait for Serge and others to comment before I'll send v2 with a fix to
> the last patch.

Thanks for the patchset. I'll have it reviewed it in a few days.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
