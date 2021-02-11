Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88A3185E0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 08:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBKHwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 02:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhBKHw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 02:52:28 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412A4C0617A7
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 23:52:09 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id q72so2940318pjq.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 23:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=06Yprus+hDrW2/xZYx/mlg+VxWu/BiZE+sW68Jmo1RI=;
        b=Ra6kYfi1+ZunK+HKHgtBU6GmKSsL+3PXTyKBlp2Te91gDQ+k3OFcoTzcZuYbf0YKox
         g2O7fkQAmi8uN/PS6M6qSqjJ7oroSwB0cG6KYReSyAAaoy4LEl8/T/BRNWoOIZOWWaAn
         lxRTTfd8BweGMjMB6gP0AZq1xWVOdz1ONAaxnJSVDy2iXF2BqaE9LOA1UJmKlNsoKndj
         JRSkby1T/HI0M2h/OGKTaxxrWM6rI2LYib9K/ZJB5oz+7bKyXgBFyWa3pPmchZi1GgJP
         hA8fC03P7H61aIfhoAHk61fSf4rhuUnEgpPsvnKsjMcCWVnaDoBtOwPC5yITh+AfZISA
         lrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=06Yprus+hDrW2/xZYx/mlg+VxWu/BiZE+sW68Jmo1RI=;
        b=mtVihvXfyjdVtizKLyO/3sLnSMbZtWFwnvm/Yo+fJzlIyoBK/Z8Q2izsT294cfO7nd
         46adA5KGVNLsL/ECEey9bdJjqzDj6fY3G74DSEXK3KjIV8yTW6Yf0e/cPhnFBQfIP9EK
         yMPNEfCOuOgTIzrAqYhSiREIcRKgC+SEZNx1olpNlVXBmOEjBAF7HU73oTQhETHFzbxV
         39r/+UmUt7PLr3G35SrOLJQUn89UsJrpPtUxahZE3RJq1xmJoqCV9sUgNU+UXNnta57O
         GXDzpxn/X4Kik0VVEyZGPjKnG02IxrxAWLBxWD4iDkQckMh+ct/qS6hIsu7Hqvp/obX8
         uMjw==
X-Gm-Message-State: AOAM532ODakMBpQLCq2Y/WKgidSHW5wyT1gx/bkLzosyojv9SQPvAEG/
        HO1WG7WAO0AJekUlzCwg2Ju4ZQ==
X-Google-Smtp-Source: ABdhPJyy0FX3Oitq2i/n8vZ/zcw0IGZLhXbnM/DumP0UFq6ucImVOTkrrFRRQq21ahUAErD/li4k6A==
X-Received: by 2002:a17:902:fe03:b029:e1:2c46:f3fd with SMTP id g3-20020a170902fe03b02900e12c46f3fdmr6683457plj.62.1613029928698;
        Wed, 10 Feb 2021 23:52:08 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:3a7f:bbfb:1664:2a63])
        by smtp.gmail.com with ESMTPSA id r189sm4731832pgr.10.2021.02.10.23.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 23:52:08 -0800 (PST)
Date:   Wed, 10 Feb 2021 23:52:06 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 1/2] pinctrl: use to octal permissions for debugfs
 files
Message-ID: <20210211075206.GA295123@x1>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-2-drew@beagleboard.org>
 <408ca31f3f43f4db40998f607f582aeb0ffbab1e.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <408ca31f3f43f4db40998f607f582aeb0ffbab1e.camel@perches.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 11:36:39PM -0800, Joe Perches wrote:
> On Wed, 2021-02-10 at 14:28 -0800, Drew Fustini wrote:
> > Switch over pinctrl debugfs files to use octal permissions as they are
> > preferred over symbolic permissions. Refer to commit f90774e1fd27
> > ("checkpatch: look for symbolic permissions and suggest octal instead").
> > 
> > Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> > in fs/debugfs/inode.c
> > 
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >  drivers/pinctrl/core.c    | 6 +++---
> >  drivers/pinctrl/pinconf.c | 4 ++--
> >  drivers/pinctrl/pinmux.c  | 4 ++--
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> > index 3663d87f51a0..02f8710afb9c 100644
> > --- a/drivers/pinctrl/core.c
> > +++ b/drivers/pinctrl/core.c
> > @@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
> >  		return;
> >  	}
> >  
> > 
> > -	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
> > +	debugfs_create_file("pinctrl-devices", 0444,
> >  			    debugfs_root, NULL, &pinctrl_devices_fops);
> > -	debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
> > +	debugfs_create_file("pinctrl-maps", 0444,
> >  			    debugfs_root, NULL, &pinctrl_maps_fops);
> > -	debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
> > +	debugfs_create_file("pinctrl-handles", 0444,
> >  			    debugfs_root, NULL, &pinctrl_fops);
> >  }
> 
> Why aren't you also converting this block in the same file?
> 
> @@ -1890,11 +1890,11 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
>                         dev_name(pctldev->dev));
>                 return;
>         }
> -       debugfs_create_file("pins", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pins", S_IFREG | 0444,
>                             device_root, pctldev, &pinctrl_pins_fops);
> -       debugfs_create_file("pingroups", S_IFREG | S_IRUGO,
> +       debugfs_create_file("pingroups", S_IFREG | 0444,
>                             device_root, pctldev, &pinctrl_groups_fops);
> -       debugfs_create_file("gpio-ranges", S_IFREG | S_IRUGO,
> +       debugfs_create_file("gpio-ranges", S_IFREG | 0444,
>                             device_root, pctldev, &pinctrl_gpioranges_fops);
>         if (pctldev->desc->pmxops)
>                 pinmux_init_device_debugfs(device_root, pctldev);
> 
> 
> 

Thank you, that is a very good point.  I should have included those
calls to debugfs_create_file() in the patch as well.  I will fix that
in the next revision.  It looks like I also need to change how sscanf()
is being handle per the other thread of discussion.

Thanks,
Drew
