Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7DCEEB4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 04:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729835AbfD3CMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 22:12:37 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45358 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfD3CMh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 22:12:37 -0400
Received: by mail-qk1-f194.google.com with SMTP id d5so7245049qko.12
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 19:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AvEs9iF7UgH1KoPh1IzqcTHpTm8A152gkwFXPuBPxi4=;
        b=qZFM76xqwX0nHQwBnaEyXEkQW/Nn9Cxxfguc3CWDmtGBZ32MljDrhYn2YTKLFb7Czx
         aw4hhzV5DzabQQFxoo8Nsg3ioD25APmb9se+2ym5QcnWM3B9BYPyAqPUcz/6uZig0zyT
         QAnHoCyQzZJjTocOK9ePD4uO3nvTnIcDpEPEqjgS+9y6hgxX3Y0WpEX0qbcrYbmQpb9Y
         dXwB7l0x1Q60XoUvmNmN0l+k1O0Nt5tbcrB80rYUK5LvOGE0n5Irshwld5BaFlIWmK4g
         rUX3SKGhr0BSwseFpeLZXj2M8hWfaw5/kziMKB1BAgcTE/54PH5LvR17oSCt6ECW6TpY
         RVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvEs9iF7UgH1KoPh1IzqcTHpTm8A152gkwFXPuBPxi4=;
        b=fF+XdTpa23XVmAVvztbK6s0hDZzX3eysj7DxXgG+05sxQLZdfVLeUxUOqw6/fgwQvL
         w7vfqGa/IhWmvg41jZ3w9A2D2+KTufEnjMfj0jVn5c4dfIQQoVjAl9CSijQDHYRe2885
         c8hen6x52B1UQIQVsysc/JraW+3ZUw/mxx2mheHt2wdUL+X+8Z4eGtW1PUYkVrPGXpT/
         MNJlw9z0takzXFkdgu9XRFtNCj8giLmtzYtKNKSBATrEvKSD70zN/1ZdlqQl7nxobIQj
         /aZ2T3gFpvDjuGE5DC8bQxNZuWqj7HO1pdxqkIGapd43EvAK+PIvFn1Lv8iHv1PQKPPp
         rXiA==
X-Gm-Message-State: APjAAAUpP0y+rY6iwTycHmv/Xg5rvPyrLvqJ53w/OA8zJ5vkmfbGhSw5
        8lubXw+fFjxOxuifRSG4uqFVpxCqXEWvGmt9JtlXVA==
X-Google-Smtp-Source: APXvYqzqb3PJHn1yZcKtN0ujVfgfOiIbacUnfqiU/Iwlvs3nFz94JrQtCCBqvBgb2BgMuPsnhY7XSR/J6J3QytvtpQQ=
X-Received: by 2002:ae9:e60b:: with SMTP id z11mr18198439qkf.80.1556590356354;
 Mon, 29 Apr 2019 19:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190415055358.9269-1-chiu@endlessm.com> <CACRpkdanhW206AEj7m+2FQBhJ5epUzw60Y6v+k-eoJLLW_-SSQ@mail.gmail.com>
 <20190426125031.GQ9224@smile.fi.intel.com>
In-Reply-To: <20190426125031.GQ9224@smile.fi.intel.com>
From:   Chris Chiu <chiu@endlessm.com>
Date:   Tue, 30 Apr 2019 02:12:29 +0800
Message-ID: <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
To:     Andriy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Apr 26, 2019 at 8:50 PM Andriy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Apr 23, 2019 at 12:38:17PM +0200, Linus Walleij wrote:
> > On Mon, Apr 15, 2019 at 7:54 AM Chris Chiu <chiu@endlessm.com> wrote:
> >
> > > The touchpad of the ASUS laptops E403NA, X540NA, X541NA are not
> > > responsive after suspend/resume. The following error message
> > > shows after resume.
> > >  i2c_hid i2c-ELAN1200:00: failed to reset device.
> > >
> > > On these laptops, the touchpad interrupt is connected via a GPIO
> > > pin which is controlled by Intel pinctrl. After system resumes,
> > > the GPIO is in ACPI mode and no longer works as an IRQ.
> > >
> > > This commit saves the HOSTSW_OWN value during suspend, make sure
> > > the HOSTSW_OWN mode remains the same after resume.
> > >
> > > Signed-off-by: Chris Chiu <chiu@endlessm.com>
> >
> > This v3 patch applied with Mika's ACK.
>
> Hmm... It's supposed to go along with our PR.

Anything I can help with?

Chris
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
