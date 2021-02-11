Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5965631878E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 10:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBKJ4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 04:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhBKJyV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 04:54:21 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59707C061756;
        Thu, 11 Feb 2021 01:53:41 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id fa16so3093906pjb.1;
        Thu, 11 Feb 2021 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2/r886KQW4/hmgGlGU/bFt+5s/atopbbN5Yr8MK8T8=;
        b=vQystuV8OWeUPFQ3fFsiGIqaSCxcNFDVbhkLn8xcohJXWQYYbiqtdKXbckM/D9dXCj
         fKfz2kijNBYFNr1/O3rZVTte5r+2gb9FoXlFVJ18L1BEtiy1mj0aydeUAFMbUdY+fL3t
         v56Qrbz5YTHi3tcxlPE6C3GmKyjzFV/l1B8uDD4k8gT4/oXpV4Q+BeLY8RxxionPZtaF
         JaTGGQFKDYAxh6gZXVQAN+orJ5fbL/1iykRtYV3EueJ0ryiyxDOA4T6mEF/bgvP28BQL
         hqtTEfVqaVaCV7S/ISIF+VVf6afLIpQwNZADARhn53ecri4gZOZZOhQzsAjCpIiqBmyW
         6KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2/r886KQW4/hmgGlGU/bFt+5s/atopbbN5Yr8MK8T8=;
        b=Aq9eBqAMHcRJ6elRm2ttzu2/U12F1YSeXwhL9h/x1cyXVOg4YDOhDfmaBSzuVeoBnf
         ekQV1LLmxWHuV4j/zZWFSBTBhu1OkZF8eDtulAQJrMfa8EEeZ26XclqxRCvv503PkAWQ
         4fZ0U2r7wdBIE62xzMKH+PIyG+655311OihUAwGHi8XgCySck3nNh1puET36rH1buIHO
         GyslQwa5UlExzA0blxfnD92b2BjgS65RCd45kPOsHpOLbR6ipdTUFnetg7sRcIRoKwtw
         a3wSDw5IsHifnHzH37GdZfg+q4jVtqAIbODtHv8zHk6tQfTGNBM0zI9m2UASnINbV7tt
         RFbg==
X-Gm-Message-State: AOAM5316mF4AovNAANe/S4xnFYqF6sNkyNJPjjX3cjmYxJSChAwUCRTx
        q7x5t8wCD644/K3Y8Eo4zF5CNQPpReTAE/G9wJ0=
X-Google-Smtp-Source: ABdhPJy+YBCILgGQR6FWOWTfpw13kwHqTUdrByKLx3NGo6g9JeyKlKtrYRmpysTlLijpT38oXfcXSyWU5WPSPL2KbwE=
X-Received: by 2002:a17:902:be14:b029:e1:bec9:f4a7 with SMTP id
 r20-20020a170902be14b02900e1bec9f4a7mr7208681pls.21.1613037220776; Thu, 11
 Feb 2021 01:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20210210222851.232374-1-drew@beagleboard.org> <20210210222851.232374-3-drew@beagleboard.org>
 <CAMuHMdW3dZWEbHzXZ-62S-bb3WKbrfwR_EKf7b_fQ6z913SX1A@mail.gmail.com>
In-Reply-To: <CAMuHMdW3dZWEbHzXZ-62S-bb3WKbrfwR_EKf7b_fQ6z913SX1A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Feb 2021 11:53:24 +0200
Message-ID: <CAHp75VeBbv8YzsnOsdXKOwPFd2WpjueCwMgm9mQPR2Xq4zW3QQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 10:09 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Feb 10, 2021 at 11:33 PM Drew Fustini <drew@beagleboard.org> wrote:


> > +#define PINMUX_MAX_NAME 64

> > +       if (len > (PINMUX_MAX_NAME * 2)) {
> > +               dev_err(pctldev->dev, "write too big for buffer");
> > +               return -EINVAL;
> > +       }
> > +
> > +       buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);

> > +       ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
>
> While this guarantees buf is not overflowed...
>
> > +       if (ret < 0) {
> > +               dev_err(pctldev->dev, "failed to copy buffer from userspace");
> > +               goto free_gname;
> > +       }
> > +       buf[len-1] = '\0';
> > +
> > +       ret = sscanf(buf, "%s %s", fname, gname);
>
> ... one of the two strings can still be longer than PINMUX_MAX_NAME,
> thus overflowing fname or gname.
>
> As buf is already a copy, it may be easier to just find the strings in
> buf, write the NUL terminators into buf, and set up fname and gname
> to point to the strings inside buf.

You beat me up to it. I was about to comment the same.

So, indeed, instead of sscanf it's simply better and faster to do just
something like

fname = strstrip(buf) ;
if (*fname == '\0') {
  ...
  return -EINVAL;
}

gname = strchr(fname, ' ');
if (!gname) {
 ...
  return -EINVAL;
}
*gname++ = '\0';

on top of the buf pointer.

> > +       if (ret != 2) {
> > +               dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> > +               goto free_gname;
> > +       }



-- 
With Best Regards,
Andy Shevchenko
