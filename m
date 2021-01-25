Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A3D303014
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 00:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbhAYXZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 18:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732725AbhAYVb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 16:31:58 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FA1C0617A9
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 13:30:13 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id b8so8445413plh.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 13:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EveaE3RUDHFwDwSfFINwaTDkn6wXWDNdOlgc8Q12yaI=;
        b=07+Jd9Szs9KUcHzmltVPJh6vTAnNrp8c0zPagDCrukBer+YqQjYEI70xDgr7ozKkBT
         dQYD/rnU9y9TvnsMPdWKDpjT2IhEtOAx695bqUTDfQAx2m8Wkww/ho4z0Evo9XnfhgB5
         zUnS1m0zGw1cZRjYJZoabSvt6/h9h47pPFwRmWAprz3thYrfSXWqfs8+WM+bHpcIHv8t
         xaW8tfZzBhOtMmUrMic7iZs3dvVoTlysl17YAgTVhAjMrfrmUTTxRxttwDShFHSNsRES
         VBa4qr+tQaC4egQ+rWe8w0MZrlwt3F9H1Obrzy6CGxqQUF7zoJhb0bC3wz1CHagPEhJW
         P5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EveaE3RUDHFwDwSfFINwaTDkn6wXWDNdOlgc8Q12yaI=;
        b=rNtc0FIEqnRqwp3VviGeIx37lfiFX0SoJmAQ0Vc4a7espiwOiIV79sD8srEhByU8ER
         ZOYbj9DfSBapzsfWGcPbcBb6gSpBlDTQqBSbebakXFUs0RGqt7cBFFqp1V5Sqh/mJ0Yf
         gfbOieEbEQz6GW4FX408GBj8IXzZjJ7k2StgeI7OhuMBU702Vog4uUUyVMTkLt2L24BC
         XAIGIo0DpTt5XwKspTC12R2Zfo7s+mqrVlRhmb29bCQ3kLHe0+yBfT6Y1IlGoLpHtFWU
         EgUBk1DzKmRIBFxNJWomiHAno3eMXNt1Fbzy4JpxmdHm/mE7ReLviTb0cMB8NtItCyyD
         Ba1w==
X-Gm-Message-State: AOAM530S54liHrJl8Ca4RkHMPOsZ42B+4ZBYmGwRyAJ3J9iAzdajsPD2
        w/3EtylQRTU2JSa+rhtG3aC0Ew==
X-Google-Smtp-Source: ABdhPJy4vzzpiaPdcgTQAOfFUGrwdrd6vbbquC1Tn/suJtCmyOne/zG8x0P+5kUMsPakIBvOfO/qxw==
X-Received: by 2002:a17:902:728b:b029:de:c843:1d4c with SMTP id d11-20020a170902728bb02900dec8431d4cmr2471029pll.84.1611610213048;
        Mon, 25 Jan 2021 13:30:13 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:dd5e:ff29:33fe:cad2])
        by smtp.gmail.com with ESMTPSA id w6sm2693403pfq.162.2021.01.25.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:30:12 -0800 (PST)
Date:   Mon, 25 Jan 2021 13:30:10 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH v2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210125213010.GA57277@x1>
References: <20210123064909.466225-1-drew@beagleboard.org>
 <CAHp75VeOB7ORsq0OWKHCyGy8ouUyQSoC85-F7RCdQ2WK_5R1UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeOB7ORsq0OWKHCyGy8ouUyQSoC85-F7RCdQ2WK_5R1UA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 05:32:39PM +0200, Andy Shevchenko wrote:
> On Sat, Jan 23, 2021 at 9:29 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > This RFC is a change in approach from my previous RFC patch [1]. It adds
> > "pinnux-select" to debugfs. Function and group on the pin control device
> > will be activated when 2 integers "<function-selector> <group-selector>"
> > are written to the file. The debugfs write operation pinmux_select()
> > handles this by calling ops->set_mux() with fsel and gsel.
> 
> ...
> 
> > RFC notes:
> 
> Please, move below to reST formatted document.

Ok, I'll make it a series and include Documentation/driver-api/pinctl.rst
> 
> ...
> 
> > +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> > +                                  size_t cnt, loff_t *ppos)
> > +{
> > +       struct seq_file *sfile = file->private_data;
> > +       struct pinctrl_dev *pctldev = sfile->private;
> > +       const struct pinmux_ops *ops = pctldev->desc->pmxops;
> > +       int fsel, gsel, ret;
> > +       // RFC note: two integers separated by a space should never exceed 16
> > +       char buf[16];
> 
> > +       if (*ppos != 0)
> > +               return -EINVAL;
> 
> But why? Do we really care about it? Moreover, you have no_llseek() below.

Good point, I'll get rid of it.

> 
> > +       ret = strncpy_from_user(buf, user_buf, cnt);
> 
> Potential buffer overflow.
> 
>   cnt -> sizeof(buf)
> 
Thanks, that is a good point.

> > +       if (ret < 0)
> > +               return ret;
> 
> > +       buf[cnt] = '\0';
> 
> Not sure, shouldn't be
> 
>   buf[sizeof(buf) - 1] = '\0';
> 
> ?

I'll take a look at it.
> 
> > +       if (buf[cnt - 1] == '\n')
> > +               buf[cnt - 1] = '\0';
> 
> strstrip() ?
> 

Neat, I wasn't aware of that one.

> > +       ret = sscanf(buf, "%d %d", &fsel, &gsel);
> > +       if (ret != 2) {
> 
> > +               dev_err(pctldev->dev, "%s: sscanf() expects '<fsel> <gsel>'", __func__);
> 
> __func__ is useless, please drop it. And below as well.

Sorry, I should have removed that.
> 
> > +               return -EINVAL;
> > +       }
> 
> > +       ret = ops->set_mux(pctldev, fsel, gsel);
> > +       if (ret != 0) {
> 
> I thought I gave you a comment on this...
> 
> if (ret)

Yes, sorry, I should have changed that.
> 
> > +               dev_err(pctldev->dev, "%s(): set_mux() failed: %d", __func__, ret);
> > +               return -EINVAL;
> > +       }
> > +
> > +       return cnt;
> > +}
> 
> ...
> 
> >         debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
> >                             devroot, pctldev, &pinmux_pins_fops);
> > +       debugfs_create_file("pinmux-select", 0200,
> > +                           devroot, pctldev, &pinmux_set_ops);
> 
> Consider to add another (prerequisite) patch to get rid of symbolic permissions.

Ok, I'll do that.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks for the comments,
Drew
