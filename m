Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D60895574D0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 10:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiFWIE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 04:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiFWIEy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 04:04:54 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB5F47079
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 01:04:52 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id w6so34474029ybl.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 01:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJdGY8if0kKaADIOnNz/K5T0O1hT/jUoomceGsgv8qg=;
        b=VTQtFvKLR234TeEsJG9hJ1cv/fTlg/g75r8DUnXK6ZHcXDiNZlsJYB9CHo/M+MtXXm
         kHxKIuNF0rtlBZTftpqriI4HPVkNAF8Kgf2nEavzZoQhhOEgRbl56Yidg8QEwndgSNmo
         guDcAYV+JbY07aCqXNXOm0MAQ374EyPk3ywDSm8OW4cMFCwWkHtQXObbRqfIV1Au2qL/
         2xJX/OVUmoI0Ru+JwXOHrC9gjW8I3BqdmxJTIj+bkS/ZKg4cBj3SDMQZSf2iggQyehVV
         s0m81yWPr2B/Nu8wqEz2Z07cBjk9Ng0bbJAp4gpara4efxy5PPr9RgZdjjBJiDIEtWTH
         KYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJdGY8if0kKaADIOnNz/K5T0O1hT/jUoomceGsgv8qg=;
        b=rW0D4AY0vIg46Wy3qzP2Le0LBFHcmvqiyPjoizV2anzzKyroH/4ZVV0/tvwQS3ZyaC
         wCkXYOAkt+YDOUl31jk77nF7+ssEwIsC51afq5894lpWxgMs/0g3D6cyJ+1F/2XWvLAW
         V2BR/pVa1NXYXGmNQuPcVbHKFhXrwNfqvfT1SUFHTuzPCzv7v0Mdyq3VxPkBOBGlRGwc
         SyaTYSRyKB5Y1IhKxRSC44FQCgK44QHkAy5qYKYdsafLZaWD6oAgXEVWcIeBPoINi5R0
         n3JGXzU4TbMc0PO69Lzo2L/e1GQwJsMfDCnqs3dp8A7M5qw9Q49MkTjdmrnpvaMyAjVm
         iBYA==
X-Gm-Message-State: AJIora8pASSTzh9gNg8bAamYRzmmH2prIcvL4vR5FbB/mBK1RiarRddN
        n7T4oQCiGIEC0QJ/NwrzthsCVTW88rLE6HcVgli4Xg==
X-Google-Smtp-Source: AGRyM1vSa06Bo2VNf1pFNqSEQ2ygrs7ov2BN88IdRJyYwpujxiov2K55jHdtpFFoYamFYqbsbeU9U6O7j7pmqWeF7uU=
X-Received: by 2002:a25:d8c8:0:b0:669:5f5b:7d75 with SMTP id
 p191-20020a25d8c8000000b006695f5b7d75mr8205442ybg.80.1655971491674; Thu, 23
 Jun 2022 01:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220622215912.550419-1-saravanak@google.com> <20220622215912.550419-2-saravanak@google.com>
 <20220623065031.GX1615@pengutronix.de>
In-Reply-To: <20220623065031.GX1615@pengutronix.de>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 23 Jun 2022 01:04:14 -0700
Message-ID: <CAGETcx_TaR+_Z9bf-Gsx3pXC9QwSUT85TTwALj5KjaOY1oNK8g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] driver core: fw_devlink: Allow firmware to mark
 devices as best effort
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 22, 2022 at 11:50 PM Sascha Hauer <sha@pengutronix.de> wrote:
>
> On Wed, Jun 22, 2022 at 02:59:10PM -0700, Saravana Kannan wrote:
> > When firmware sets the FWNODE_FLAG_BEST_EFFORT flag for a fwnode,
> > fw_devlink will do a best effort ordering for that device where it'll
> > only enforce the probe/suspend/resume ordering of that device with
> > suppliers that have drivers. The driver of that device can then decide
> > if it wants to defer probe or probe without the suppliers.
> >
> > This will be useful for avoid probe delays of the console device that
> > were caused by commit 71066545b48e ("driver core: Set
> > fw_devlink.strict=1 by default").
> >
> > Fixes: 71066545b48e ("driver core: Set fw_devlink.strict=1 by default")
> > Reported-by: Sascha Hauer <sha@pengutronix.de>
> > Reported-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/base/core.c    | 3 ++-
> >  include/linux/fwnode.h | 4 ++++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 839f64485a55..61edd18b7bf3 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -968,7 +968,8 @@ static void device_links_missing_supplier(struct device *dev)
> >
> >  static bool dev_is_best_effort(struct device *dev)
> >  {
> > -     return fw_devlink_best_effort && dev->can_match;
> > +     return (fw_devlink_best_effort && dev->can_match) ||
> > +             dev->fwnode->flags & FWNODE_FLAG_BEST_EFFORT;
>
> Check for dev->fwnode first. I am running in a NULL pointer exception
> here for a device that doesn't have a fwnode.

Oops. Fixed and sent out a v2.

-Saravana
