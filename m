Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917BE369673
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhDWPzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhDWPzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:55:52 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A168C061574;
        Fri, 23 Apr 2021 08:55:15 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id t22so229775pgu.0;
        Fri, 23 Apr 2021 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+UIkzK9mkfwrs3I5lMZXF8gNHIUH333Map0CEJkPcM=;
        b=Osa3h5S558fPLVuIaLmVUQpFAyoDPPuCEuhSJ2orTf3vFWwytAyd/QV1ZyQez04Kz/
         T2J6aUt+3QT/cARsKeRSRj8DbyaXCLk1C0wsCYtFCJxgQVsGt6TZO/hO3Cd6+IYY1Cie
         yFWajPfceLnHYSmJu7vID16VLOqqRHvIeEX1SzYBnZ+bM7M5GW+7O8A1xWeGy63C7sZz
         bRlcChS+mRLp1SfAuLEjj9UdsXxzxMH7tj+CWxVaiXy4w//BA8xIAposgR1wYqo9ZF1Z
         I7JaHBbImI+fOWjY3vdy2awqAOXNqwOAmBmkhZFsJXp2GfoxjV8vEhzNph9aT1jFaTE6
         xKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+UIkzK9mkfwrs3I5lMZXF8gNHIUH333Map0CEJkPcM=;
        b=jf62RxKR/iEJQ54sdqdCuu1X34tXpqM0JFJJoDWAmE5RbLYvBnpZunfvxX28a2rhFZ
         v2FEbhsJHVCBfjW6KlxOgWMj5NGoUAuKaYyR6NJG31GGzixxbJmpNIvnjheshM31M56l
         9jx3Nyv3LW6MFzl5IC38Cnnh8f+ommRnxa2ReXp+s/t77EJMS0WHq7RMOUAZZWLYAlXc
         WPr9AXwvSoCax0uIaQ6YCPPpu64BaEXRduESti/DpxpcuH6GG8Z0Cnl1DiJ5QKx7ZyiS
         l/MIMoRLZ7eN/rOYRZA6Y4TZYxPZaj++KbUMQfH7NaaCuPvKXyq42KTtDsubheTLIa/J
         vPzg==
X-Gm-Message-State: AOAM5302RGa23PqjN5Uk9sd852RPa7bekdx7FRB80EwCPYxFeDLWEzXp
        I+1TqqhwybEg2Wx72OFPVrJiuNxEdL6Wul0RKvU=
X-Google-Smtp-Source: ABdhPJx53ocT19tkO4h4aibYvyEwQmPVytNV6p1QXTOLr8AVIpA3QMBGuj2+pfumrHzfoBfaR6FUDaJKuNqP1VuXFes=
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr4466384pgs.4.1619193315238;
 Fri, 23 Apr 2021 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CACRpkdaDP+JnCP+go9hZAObnNgmJyJRDFypX2CZGp-UJBh5wNA@mail.gmail.com>
In-Reply-To: <CACRpkdaDP+JnCP+go9hZAObnNgmJyJRDFypX2CZGp-UJBh5wNA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Apr 2021 18:54:59 +0300
Message-ID: <CAHp75VfpvPdAAW2JpvdiDtzS3LUF_=Ej7c2LEML_+pOwi6CtWg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add ZynqMP pinctrl driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 12:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 22, 2021 at 10:30 AM Sai Krishna Potthuri
> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
>
> > changes in v6:
> > - Rebased the patche series on 'devel' branch in pinctrl tree and no
> > functional changes.
>
> Remaining patches applied! Thanks for working so hard on this!

Hmm... I have had a bunch of comments. Okay, they may be addressed by
follow up(s).

-- 
With Best Regards,
Andy Shevchenko
