Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3AE29F011
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 16:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgJ2PfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 11:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgJ2Pef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 11:34:35 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F1AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 08:34:35 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id n11so2632320ota.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 08:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gj1jJpANXv8NUxKuc1U2kl0sCOsIJejtHtuP5pNNdq0=;
        b=hfWH7DQo6MwXumxkNFEKQ6mIUkgN/obcpao7IWfhHJqpjo61R6fm7nMF4GfWRZZ7gg
         6v++9WPm9136sVxb7WABbsXBM+AqlbgE8SMi+UcLO8dQgD6KLmSpBg2nr7W+XZQxeZ2I
         kbvlULl7hTiQ61gXLmKCUlPZBk5Yrlx18uwefqSuRW/fmpPxzTCKf1tGMBEtw21oqC3G
         gwYfpkc/FrK4Vj9Ujfmm2UD9+V5RNmWXyIOYY8x62RrdoP/yzzkiYCh6ql7s/kTVcgDW
         rugAPCELON6oOF0BNIStyGR0eq6Tm3L1XrDoRgMm1jNqyMcndRHTOQ0doqg6O6zuy15w
         vwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gj1jJpANXv8NUxKuc1U2kl0sCOsIJejtHtuP5pNNdq0=;
        b=UESFtpkwaBp7z9k8+uPJ49qJWHcteOVxMwWYIHHXP6AgcoVof94tZgMVTo1sNedf5V
         weZLgD7xwkW84Y94pM3ED+hSfXrsEdRBjNxpkAWM9HTSqTgYiCFnzA/pWtdYMUVxjoob
         cbvjaSamyNN9PtbSi3e6CuA9e/6joxkEvmZN2J/mYAD4IQsuOTs9yuenQanGrzPhZcLA
         6cbp8sC9DJHc5Pvfd+NT3aaqeGbULkBfpuIVoJFaSuV+GcZ3xmqwMWEmgypu8WFF5khk
         xVdX6H/YCcOg/2z+EL6qxdWyJR5tA89ZX4lMki3SzeQ8n/1RhLYlIJ0neTU82Vd5r3ql
         0pQg==
X-Gm-Message-State: AOAM530IkzJdUl2jhvec1y1KsH6cHoAZOnvI/ARQKc+8KiSKIrJ2ePmK
        ToxPHwrXLrRGCJ7ygPjHmgm2J9driHZZISRsNoIZyg==
X-Google-Smtp-Source: ABdhPJyGMqctXGvAmi1ujldo3C/IhTNjpeGLqbnC4WkTn6uj6dRtNongZ+NbPm+WXw74/1zYMbAnzsEbA8DtBOJdsC4=
X-Received: by 2002:a05:6830:14c:: with SMTP id j12mr3812378otp.334.1603985674321;
 Thu, 29 Oct 2020 08:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201028171757.765866-1-ribalda@chromium.org> <20201028182744.GZ4077@smile.fi.intel.com>
In-Reply-To: <20201028182744.GZ4077@smile.fi.intel.com>
From:   Ricardo Ribalda <ribalda@google.com>
Date:   Thu, 29 Oct 2020 16:34:23 +0100
Message-ID: <CANiDSCvy2dPyY8O5DVgTBwNNLmfA=kJ5HUKJqcFLnqQ8CWsJgA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Support GpioInt with active_low polarity
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

On Thu, Oct 29, 2020 at 3:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 28, 2020 at 06:17:57PM +0100, Ricardo Ribalda wrote:
> > On the current implementation we only support active_high polarity for
> > GpioInt.
> >
> > There can be cases where a GPIO has active_low polarity and it is also a
> > IRQ source.
> >
> > De-couple the irq_polarity and active_low fields instead of re-use it.
> >
> > With this patch we support ACPI devices such as:
>
> Is it real device on the market?!

Yes, it is a chromebook.

>
> This table is broken. _DSD GPIO active_low is only for GpioIo().

AFAIK the format of the _DSD is not in the ACPI standard. We have
decided its fields. (please correct me if I am wrong here)

On the other mail I have described why we need to make use of the
active_low on a GpioInt()

If there is another way of describing ActiveBoth + inverted polarity
please let me know and I will go that way.

Thanks

>
> If it is a ChromeBook, please fix the firmware.
>
> > Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > {
> >         GpioInt (Edge, ActiveBoth, Exclusive, PullDefault, 0x0000,
> >         "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, ,
> >         )
> >         {   // Pin list
> >                 0x0064
> >         }
> > })
> > Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
> > {
> >         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */,
> >         Package (0x01)
> >         {
> >         Package (0x02)
> >         {
> >                 "privacy-gpio",
> >                 Package (0x04)
> >                 {
> >                 \_SB.PCI0.XHCI.RHUB.HS07,
> >                 Zero,
> >                 Zero,
> >                 One
> >                 }
> >         }
> >         }
> > })
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Ricardo Ribalda
