Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054C9316FD8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 20:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbhBJTPZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 14:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234520AbhBJTPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 14:15:22 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF77EC06178A
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 11:14:11 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id z21so1867002pgj.4
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 11:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JmUcntoSnbYZCu5swdMquGULXXyoqXzqD9LGXM3UkFg=;
        b=k4inAo+WcC/PkZIpNA1ki8dI+F1fTtz/sDYC+IpWZPRJkVx36ZuwYunWaIHmW/3dLl
         A8/rQBnqff+HhJ+54zErI04kQdsu1tMYhbh0Vr6zey73AJPJEP+PYQ4tFFlFMnSTklAa
         aWwPujo9I5kBwVqvai507Zc4QYYeV3fF3QBd7x8N0sEWTJTOi8FjeasCCRxNACWNQwFv
         PDdHj6pt4ATJVdUB2uSE0dwr3uPa0u1f3g75l1GYTHSdp1jGxiLgLzKUKrjSiuIaur02
         xa/tqYPwSa7aVd7ZAzTaKfnTCGmm/lheemBrmj4JZ/CEs9D3It+49TsxNNxcd9W3BFtg
         gkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JmUcntoSnbYZCu5swdMquGULXXyoqXzqD9LGXM3UkFg=;
        b=i7t2/VdK6/1Rr8/tC02SVlmxv7zlpej1sw2KJQ7a9n3WaQNEcE9h3hl2yy5jKKwysi
         OBDwmGZ+lA8Pg1SHwwWiQwsAKeWrv4srER2AnQzbG1yiRX2qAD9CEKQZ/r0Mr1easQB6
         Q7EMk11i+SurHgXTsPsx2Dirl6cOsykiZV0rMPJlqWaxI1WQb0qrH/F3bhnLDKzr57+6
         F1gYqg0wyyHO8tY3wsLxKukLYycpA0lkyHSJrb6dz7sK8hBzTc+r/I2N39jYDg2UZBAB
         QgECq11LbD0kdYdVG8l6OvuGtTD8tu82FYtGlebehbxr/EPS84O08U3vv6avs0VpZfhq
         XG9w==
X-Gm-Message-State: AOAM532C2W9DfwQ2afy4HVa4vtA64aBO4M7ZKyGuEEh6Xjha+9IG3OZ4
        weqA+SBFcAogkiM1IyqBenMB8w==
X-Google-Smtp-Source: ABdhPJzCmrupbTOqFkod0ripyoNlPL0T5+L6rdPo9BlWXY72YKmeGuFpgLM6I2lt23SEvc1o8S3R3w==
X-Received: by 2002:a62:52d1:0:b029:1da:1371:20b8 with SMTP id g200-20020a6252d10000b02901da137120b8mr4551090pfb.73.1612984451507;
        Wed, 10 Feb 2021 11:14:11 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id h15sm3173312pfo.84.2021.02.10.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:14:10 -0800 (PST)
Date:   Wed, 10 Feb 2021 11:14:08 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>, kbuild@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210210191408.GB188420@x1>
References: <20210210074946.155417-3-drew@beagleboard.org>
 <20210210182044.GY2696@kadam>
 <CAMuHMdUTG-0PMsP--i4KE2RA_zOaQgpUDksvtU8dLPW9dSpoug@mail.gmail.com>
 <20210210190528.GE20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210190528.GE20820@kadam>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 10:05:29PM +0300, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 07:39:16PM +0100, Geert Uytterhoeven wrote:
> > Hi Dan,
> > 
> > On Wed, Feb 10, 2021 at 7:21 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  694    buf = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  695    if (!buf)
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  696            return -ENOMEM;
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  697
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  698    fname = devm_kzalloc(pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  699    if (!fname) {
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  700            ret = -ENOMEM;
> > > 99b2f99aa41aa7 Drew Fustini  2021-02-09  701            goto free_buf;
> > >
> > > The gotos are out of order.  They should be in mirror/reverse order of
> > > the allocations:
> > >
> > > free_gmane:
> > >         devm_kfree(pctldev->dev, gname);
> > > free_fname:
> > >         devm_kfree(pctldev->dev, fname);
> > > free_buf:
> > >         devm_kfree(pctldev->dev, buf);
> > >
> > > But also why do we need to use devm_kfree() at all?  I thought the whole
> > > point of devm_ functions was that they are garbage collected
> > > automatically for you.  Can we not just delete all error handling and
> > > return -ENOMEM here?
> > 
> > No, because the lifetime of the objects allocated here does not match the
> > lifetime of dev.  If they're not freed here, they will only be freed when the
> > device is unbound.  As the user can access the sysfs files at will, he can
> > OOM the system.
> > 
> 
> Then why not use vanilla kmalloc()?

Yes, I believe that is the correct approach.  The problem was due to my
misunderstanding of when devm_*() was appropriate.  In this case, I
should have been using the vanilla allocation as the buffers used in
this debugfs write operation are not tied to the lifetime of the pin
controller device.  The are just allocated for internal use inside the
write function.

thanks,
drew
