Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC902F5CE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 13:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfD3Lhd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 07:37:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45514 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfD3Lhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 07:37:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id e24so6894959pfi.12;
        Tue, 30 Apr 2019 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArYktBF09rhGuKJJvxws6bmCXNyXRl7oK9w8DZA3jMs=;
        b=cLvRzkIcWgly0/Gpwh4ATcidIfK8nunE+CfEIHNMuZlNChdocwBsWQWtV9mWnVh+Tg
         IGR5E1rHZxWIne0KNjl2kr2YsvbAXEuoxT6l/Wxt+P82QPQh19Ahw3b3Nvo7O6QtRRAO
         2d49DVJvlqH6/4su4vBDD15NeprPTxITbkR1EwwrxbkB45eIgU9iyp4M/GQWXNYtgZRE
         2fY0EwBPEjxd293a2C7drN6MWLvLPNPzKUNgA8EuSNrdnPKCFl+PkHADjj47egCx4chJ
         KBwhuLm03wz9qDJjUmeciMHaVvaMzPJFgqSEo3ZLsQD6oP1idZ5WaaoIEjkCFQ7/B1NW
         rldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArYktBF09rhGuKJJvxws6bmCXNyXRl7oK9w8DZA3jMs=;
        b=Y2YutZUxK8twNQj0nT0tD/hGQNZOBR1WRKrr3Ehd1mTlFbgUa8B00BZ9MjrtpTyb92
         p44PrvGG8UWnr8UXTNTkbXHdCVFbEsztNTiviXhMtZI+9Wjtco0RoIIHXfVkbwSMJnLK
         tH9uE1zz2TWsEuVO9I5RFmuvzXVXxwGRRPKbIPqZaxOzYuFRVlXTI01TXCoFE+AEtHlC
         /9bJ61uo6iYOzKMXfl1c86tXHbHoL38Pu/oNZNUw0YR8np1g/MsbO17ElkeTBSGmerDE
         7fPVRq30/nKg2Jj2mHk3dpEaDknW0oh722yTeosUUR/DrdVgh1+h2q3Agfw4rBu9iAlR
         oeUw==
X-Gm-Message-State: APjAAAWGwgZu94o6NaIOMxu8IA4doHSWGcDi2GK3DDS77RySFufqfplP
        HVYURie0jDZNrysgE1e4z6oOA9MW/hK4S9ZT8h8=
X-Google-Smtp-Source: APXvYqxeTLEwPB3TIeB8WOLsRYNJsiWdLDF7iEquJbzVoKTXQ0DmwzZH0n+9/pxWuXYK29wkHSrqbfnjMvyNB8fX6AA=
X-Received: by 2002:a63:c54e:: with SMTP id g14mr65308627pgd.265.1556624252039;
 Tue, 30 Apr 2019 04:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190415055358.9269-1-chiu@endlessm.com> <CACRpkdanhW206AEj7m+2FQBhJ5epUzw60Y6v+k-eoJLLW_-SSQ@mail.gmail.com>
 <20190426125031.GQ9224@smile.fi.intel.com> <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
In-Reply-To: <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Apr 2019 14:37:21 +0300
Message-ID: <CAHp75VfXj=1Ef7aXWyETyiaUF3ftLEodTs3azoDHTq=yrj7adw@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
To:     Chris Chiu <chiu@endlessm.com>
Cc:     Andriy Shevchenko <andriy.shevchenko@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Daniel Drake <drake@endlessm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 30, 2019 at 5:15 AM Chris Chiu <chiu@endlessm.com> wrote:
> On Fri, Apr 26, 2019 at 8:50 PM Andriy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Apr 23, 2019 at 12:38:17PM +0200, Linus Walleij wrote:
> > > On Mon, Apr 15, 2019 at 7:54 AM Chris Chiu <chiu@endlessm.com> wrote:

> > > This v3 patch applied with Mika's ACK.
> >
> > Hmm... It's supposed to go along with our PR.
>
> Anything I can help with?

Not sure.
I sent PR to Linus and asked at the same time to drop Intel specifics
from devel queue. Fortunately, for-next doesn't have such issue.
Linus?

-- 
With Best Regards,
Andy Shevchenko
