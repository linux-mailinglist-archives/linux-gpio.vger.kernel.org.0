Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0D73AAD3A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 09:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhFQHU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 03:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbhFQHU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 03:20:57 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323FBC06175F;
        Thu, 17 Jun 2021 00:18:50 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id e22so4193699pgv.10;
        Thu, 17 Jun 2021 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urMPTkRkijNnq1YTyn7+SteYdXmaIXj2TQZnikbLXEs=;
        b=QqObbYwhOZtqYEGImDxe+JckngZqWKDW5ifZeQZHpAT2cUvDYK9vPjzhVmpB/kqK52
         2X3S9uCa7ue7j8/8gfXNgSPHy1sxELuEscsFso3LNqZzVFY0+NDKXrrHjOSxMf+r2exn
         QbJNxB60BtXOkBCpuHrrI8uct9Dllx7DkRCqcMBPaKaCp35J67z/suX2RPxAK2gJh756
         GWaULDDll06gMPHK98NYmCIyZoveoTay00oiUrhIoASXFYKPNWcOF2ULvow+OO+c+Uki
         yaNCUAPaNywRt4FccsYisu7PauB8M2yLH1c1bIeeLIsUODO13oioO66Gvc02yJA6WWVp
         3kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urMPTkRkijNnq1YTyn7+SteYdXmaIXj2TQZnikbLXEs=;
        b=LCCdy+qyzYQmp8Bx262P7IfjfsbzWi+b/7+FWazlgeE0g57UXCuwiPXQVixCJyH5/F
         t78h3fO40FvijMNx29IJfX1aVDSenARCFQwVJ7S4fRjtJZljlj6aKFTfK7JQrVq/TPth
         JIIn3iQSRbEsXOZiidXPZF+QeDTZZvzZx7Gl5ZVZseZvrljJz0uXdE7GA3nkPDtS6rrd
         sP259EiAFllpgFknk/OhBjSeV3tgsJcenfZ65qzmaVGeVHejbp044AHxz2Vaip18G0Gh
         tWQj8sFWCm3bvgRlutPBaYox6Qy/m6d4eyuEl/bIIKY5IwlVz1X5NoQX/p/yG8Aqlal5
         t0hw==
X-Gm-Message-State: AOAM531693jck7bzN7EDgAqQPmdQc05urFl/hI454B39uCK6WtqSyeha
        kX+POVubucBDs8cB5pu1E0U4PsRr0kpViD28IWw=
X-Google-Smtp-Source: ABdhPJx2RTT5n7WoD6XIYmdUVuUkAr7Ak0SI+3gHXobSWPWtgaEpjpZDq+n+Q8TxsRLysqNXPXyy3uccfjbLXXtvYTA=
X-Received: by 2002:a63:b00d:: with SMTP id h13mr3732496pgf.74.1623914329647;
 Thu, 17 Jun 2021 00:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <DM5PR02MB387726AB4144F0DB28105007BD409@DM5PR02MB3877.namprd02.prod.outlook.com>
 <DM5PR02MB38771A8BEEB3E01006B14E46BD539@DM5PR02MB3877.namprd02.prod.outlook.com>
 <MW2PR02MB388198021497399F280A374EBD0E9@MW2PR02MB3881.namprd02.prod.outlook.com>
In-Reply-To: <MW2PR02MB388198021497399F280A374EBD0E9@MW2PR02MB3881.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Jun 2021 10:18:33 +0300
Message-ID: <CAHp75VdPuGqsKqAMipzaAf11OQi_kBfPeLH3vsxTot_OgUiDtg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 9:37 AM Sai Krishna Potthuri
<lakshmis@xilinx.com> wrote:
> Ping!

Do not top-post.
Do not ping for the sake of pings.

> > From: Sai Krishna Potthuri <lakshmis@xilinx.com>
> > Sent: Tuesday, May 11, 2021 6:08 PM
> > > From: Sai Krishna Potthuri
> > > Sent: Wednesday, April 28, 2021 11:04 AM
> > > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Sent: Monday, April 26, 2021 7:35 PM

...

> > > > > > > +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> > > > > > > +               if (arg != PM_PINCTRL_BIAS_PULL_UP)
> > > > > > > +                       return -EINVAL;
> > > > > >
> > > > > > Error code being shadowed. Instead check it here properly.
> > > >
> > > > > Are you mentioning the case where ret is also a non-zero?
> > > > > If yes, then I will update this check to if (!ret && arg !=
> > > > > PM_PINCTRL_BIAS_PULL_UP)
> > > > >         return -EINVAL;
> > > >
> > > > No, this is wrong in the same way.
> > > >
> > > > > ret non-zero case, we are handling at the end of switch case.
> > > >
> > > > I meant that you need to pass the real return code to the (upper) caller.
> > > Here we are checking for valid argument and not the return value of the
> > API.
> > > If the read value(argument) is not valid and return value of the API
> > > is zero (SUCCESS) then framework expects driver to be returned with
> > > '-EINVAL' and it is a legal error code in this case.
> > Do you agree on this?
> > I am ready with the other changes, will send out the patch to address your
> > comments.

If you are ready, drop a new version (note, ~1w is a good time to send
a new version if no one answered the doubts in your previous one,
which means "silent agreement").

-- 
With Best Regards,
Andy Shevchenko
