Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7828932ACEA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383787AbhCBVSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380002AbhCBKYn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 05:24:43 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2818AC061788;
        Tue,  2 Mar 2021 02:23:36 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id t25so13552757pga.2;
        Tue, 02 Mar 2021 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CqC/YcTGec2wtgTv9MY+9W7rWWO+4UdP1mK6FGLTeFI=;
        b=MooJHbRjpwShSFWwg8HFB+9S6s6w/jsUh6EqcU3ypubGBDwu5a1ApeG21aL5ZcK1Nb
         hxJlHcIVO3a5iGI2WeXaJ2g8F45zCPl0rf2apSKmjS3BNs+xMhAKPrZwYEMBg2cxLMXL
         B4rWGLU1iNoDwPT2qIi2QIFJW1Z/uD20Wm0uFa5wIn6Xsu8qc2kZwVyUNYqwC2z+PXnf
         6SfFE+MGpt5kk7/vPrJLissmrr8zQnZNVg+g55PH6uKsXIkZvwtLiYih4IrhpTboioD3
         oOd8DkKja/0Te/bFUaLfJGBDxOfIqHdZJdXsVfJXjrnqA8A7OBaog0D95a5c9bE+SMD8
         HVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CqC/YcTGec2wtgTv9MY+9W7rWWO+4UdP1mK6FGLTeFI=;
        b=nE2hwh0zUP7G7zHB7LXDsxrcVzFSknA2W9ADRQbos1U8k1r7fBFZ8L5taxKA857R8s
         U/doGSumry9cLZDDV23XpwsIrYJfldq7wJawfEVd9i1Sq1kPFxNtDqWqqsfbtNcMc3lN
         DPpTnmtq9PzF524Umbc9mHAiWZ8NLXBsb3oVgtnsTwNZKlHbYS2L3QqFkb/yL05jmaG2
         w7o0EsPxrqDDiPz2wXwKoz4YdWazIWeq6eBNsZcZEXeYSlC7pqUVeyyZhpTz+GYpWBaE
         tCmHQ9SDaxiKGly672i6492IomO+ns3U1JLBTvubmLWvxFUb/qUtccaBrvVr9/A96uBS
         tQAw==
X-Gm-Message-State: AOAM5317I2kRNHDfWy5pFP5fnPMzfcb2UBCsCESf06CYR6lY57+TmvoB
        WmgH1ATBtpAsbL3U2dNR/jA8c8kUCcjkQ6g/wYE=
X-Google-Smtp-Source: ABdhPJyGDk2rvwLfp4t1TmUcUPe68BTF8cNUlRMiiufV4xO4BW+JgtXkDxEtMtSFj2eN0RhoE1L1twRWLA0MaqUqrx4=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr2805274pfk.73.1614680615693; Tue, 02
 Mar 2021 02:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20210212223015.727608-1-drew@beagleboard.org> <20210212223015.727608-2-drew@beagleboard.org>
 <CACRpkdb1-OqZU93nMD+iztPOfLEn3-j+-=uTEo+zbE2TmezmLQ@mail.gmail.com>
In-Reply-To: <CACRpkdb1-OqZU93nMD+iztPOfLEn3-j+-=uTEo+zbE2TmezmLQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Mar 2021 12:23:19 +0200
Message-ID: <CAHp75Vcvo8v-emHJZ+9fiTg+Vv26Apotnm8nD8rF550VgY-5gQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs files
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 10:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Feb 12, 2021 at 11:30 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> > Switch over pinctrl debugfs files to use octal permissions as they are
> > preferred over symbolic permissions. Refer to commit f90774e1fd27
> > ("checkpatch: look for symbolic permissions and suggest octal instead").
> >
> > Note: S_IFREG flag is added to the mode by __debugfs_create_file()
> > in fs/debugfs/inode.c
> >
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>
> Patch applied, thanks for fixing this!

I guess we are at v9 of this.

-- 
With Best Regards,
Andy Shevchenko
