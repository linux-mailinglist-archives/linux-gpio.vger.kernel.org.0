Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521883198DB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 04:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBLDg2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 22:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhBLDgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 22:36:25 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BB6C061756
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:35:37 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id fa16so4622200pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 19:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FU6M+H964ngY0zpfpbcjRSHTk9tl8Qf14a9FzoajTy0=;
        b=YAgCHymoFMiybaEx8M86wrnBJWK+FetX/KrWwPlWv2jAsO4ynRIco23kUFw0tIeaI+
         VvucPeKM63bfOzFDc71Svu3V0yF1oh4USkG1gbu7FkxtDhDNB4ELvLPvD21JGIl4FvHI
         rz9t920eozmBG0kWsot3K0MlzNxSZzfXvNrFEzkmZrNMYUFbdv026xSbvu2uFBq1r6k4
         Cg8dkfqjZHUYxt/zVdOGre5S2DAn+qCL6Dlx/qUfBEZS9nekQGCSij2UcO0UkjpAa+Fv
         0TLysYr0aezQ9niOkvJbNVinV2m00KOcxth5K33YMt6J2h+eV9ChTuYjzJ7XA/1Pgmj3
         dJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FU6M+H964ngY0zpfpbcjRSHTk9tl8Qf14a9FzoajTy0=;
        b=PH5+H4bnWOI3KTZ+fLe3iNzzk+k0XedmFF3es5su6JVDG5+fzmW0WFdAPF6yqIBe8/
         m/vcrWpr/5DCXI58c+u97x4IfAS6F+kxRbOTgyb+Omdxg4nqpbeTtLu33pcEhfK1TSJY
         1vAIv6D2rcH1bSS/IkaQsYtDBP+03s+9jO4cq+rN1iEiW/lPqLWz/8jqWMqg3v5CYUIp
         Okwf7d+xeTvUch7A7w8qPWg04AWw1F14PXVFatqY7rgOYGKnNfECjUZeRkPRAegt+YR7
         HEp9U8sq0gXPV9zofKkE6bmp1KuNP7Lv71c8epwXKxrZ2sCzPw65f7fqu0sdzCRHHvzv
         pDbw==
X-Gm-Message-State: AOAM532DNWzM47tdGc650VI97/6Ei46uz6Ef4C3h19G5zhhliCsaE8Nb
        xBTfFS0dyNr0Ipfg2+pGAaP2hw==
X-Google-Smtp-Source: ABdhPJxnDOxUrhhX4wg2Yab8769hfK9YKrifY98MDT9GV4jvBb6tiEkA3IOeIO92a1q6nQ5OkszSvA==
X-Received: by 2002:a17:90a:da02:: with SMTP id e2mr880989pjv.173.1613100936894;
        Thu, 11 Feb 2021 19:35:36 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:3a7f:bbfb:1664:2a63])
        by smtp.gmail.com with ESMTPSA id y16sm6964889pgg.20.2021.02.11.19.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 19:35:35 -0800 (PST)
Date:   Thu, 11 Feb 2021 19:35:33 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210212033533.GA347396@x1>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
 <20210211071153.GJ20820@kadam>
 <7b4105ca8671a2962910deb5418a934bf07d1458.camel@perches.com>
 <20210211073938.GL20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211073938.GL20820@kadam>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 10:39:38AM +0300, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 11:24:23PM -0800, Joe Perches wrote:
> > On Thu, 2021-02-11 at 10:11 +0300, Dan Carpenter wrote:
> > > On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> > > > +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> > > > +	if (ret < 0) {
> > > > +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > > > +		goto free_gname;
> > > > +	}
> > > > +	buf[len-1] = '\0';
> > > > +
> > > > +	ret = sscanf(buf, "%s %s", fname, gname);
> > > > +	if (ret != 2) {
> > > > +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > > > +		goto free_gname;
> > > 
> > > We need a "ret = -EINVAL;" before the goto.  sscanf doesn't return error
> > > codes.  Normally we would write it like so:
> > > 
> > > 	if (sscanf(buf, "%s %s", fname, gname) != 2) {
> > > 		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > > 		ret = -EINVAL;
> > > 		goto free_gname;
> > > 	}
> > > 
> > > I'm going to write a Smatch check for this today.
> > 
> > It's a pretty frequently used style:
> > 
> > $ git grep -P '\w+\s*=\s+sscanf\b' | wc -l
> > 327
> 
> Yeah.  That's true.  I looked through a couple of those and they were
> fine.  (Sample size 2)  But the other format is more common.
> 
> $ git grep sscanf | grep = | wc -l
> 803
> 
> I have written a Smatch check to complain whenever we propogate the
> return value from sscanf.  I'll let you know tomorrow how that goes.
> 
> I should write another check which says "On this error path, we know
> sscanf was not equal to the value we wanted but we are still returning
> success".
> 
> regards,
> dan carpenter
> 

Thank you for comments regarding sscanf().  And also thank you for the
LF mentorship session on smatch this morning.  It helped me understand
it much better.

Based on further comments, it seems there are better ways for me to pull
the strings out of the write buffer, but I will keep this in mind if I
need to use sscanf() in the future.

-Drew
