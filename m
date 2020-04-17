Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209021ADE22
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 15:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbgDQNTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 09:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729799AbgDQNTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 09:19:42 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9A0C061A0C;
        Fri, 17 Apr 2020 06:19:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w11so1087223pga.12;
        Fri, 17 Apr 2020 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CV8f9fUDt9Ye3K4+eyyMNBwqOPh+bB0aDZMTDBg5B1k=;
        b=arucBQ+/EchOT6pi4l3KrhCifh7jzAbc+c8SJBhI5Pu4XdCy05L1XekzmJcStIWx2b
         a7lWfKcRkEeal7qdiCusOzxHHf8RPk7B45dOWY/Y4FHBp1BxGb3LLtxZ4Hej/PDlr4r9
         ji+gc6BmzX8Xvb6PjQlF5oiCRPc94jxRe0La55hCMV4j7Whvaws+iNAsto3pYbroEQ3u
         Idocbfe1KPCjWmKo455Oaju3NhaHjDPsVjrtfPPG0/sT2pqGTDRz1Fl/2ikK9rrs1arq
         wK93BtAXjCIuMOLs8aemywSfImI3V+y7ztcwC1W1XiRI9pSvs9NSfxRx9DMVABcpaKGx
         UK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CV8f9fUDt9Ye3K4+eyyMNBwqOPh+bB0aDZMTDBg5B1k=;
        b=am9vGJipaTu/TdPXD2ylCO5Na7WWA8e/XOq32dvUkw6KvYHUsOAYUTAjlWVe+SCT8q
         IMyLgLPNzkPiuP2tCmF5d1X0Z+N+Hv78NPb0D4uRkpnAzx7xQOXfhZ5f0nV+xjeYh3xU
         3P7WjT6fnlPeO0b9ahKyZdT9+FmZpzVhAtX17grwCGLI9mtLCUHHHpcVW0hpcv2JJVDi
         psK8tTR7kX7TDjImMyeJ2LzUMHOcitkh+k24KjFDokwjj66HuQssnQWZwGKMV6gVOnSN
         AVF15jcxNVV9cjJhFQEANhvLifm+Oir5wU0w+7EAsXEt7Y4c5j7LzfVn1+hLVqs3r7lj
         X9zA==
X-Gm-Message-State: AGi0PuYKwk/jTLompDikHGPfzmASaHE+/Kkf1FQSg8rKyBOn/RodjxXk
        VsoFm450aTDMGLNC6BipDwaYi/t19Eax/xJXqPY=
X-Google-Smtp-Source: APiQypLcNtzPYv2k2eGg66NditC/QPx1/u2hrrqd13v0vTJV/qlKEIuHZ/eabl0VDTrJeDhIMt+jtJ3pYSblemZIRUE=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr3163344pfr.36.1587129581013;
 Fri, 17 Apr 2020 06:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200417030449.10601-1-grace.kao@intel.com> <20200417041154.13063-1-grace.kao@intel.com>
 <20200417090833.GO2586@lahna.fi.intel.com>
In-Reply-To: <20200417090833.GO2586@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:19:34 +0300
Message-ID: <CAHp75Ve0yzbXUAehBnKnDUFPeLt=H5bmcH_M_zG4RjEHXAq71A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Grace Kao <grace.kao@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 12:08 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Fri, Apr 17, 2020 at 12:11:54PM +0800, Grace Kao wrote:
> > According to Braswell NDA Specification Update (#557593),
> > concurrent read accesses may result in returning 0xffffffff and write
> > instructions may be dropped. We have an established format for the
> > commit references, i.e.
> > cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in
> > byt_gpio_irq_handler")
> >
> > Signed-off-by: Grace Kao <grace.kao@intel.com>
> > Reported-by: Brian Norris <briannorris@chromium.org>
> > Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied for fixes, thanks!

-- 
With Best Regards,
Andy Shevchenko
