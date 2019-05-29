Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC282D685
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 09:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfE2HjB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 03:39:01 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:38797 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfE2HjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 03:39:00 -0400
Received: by mail-it1-f194.google.com with SMTP id i63so1998025ita.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2019 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYdxpoQyKFeDaQbdKIUrN5/Ag9haNiYupFVN0i2N9tI=;
        b=uHyaDhs+yuzAFqEYJAVKpxTifDtlQH1n+iiledygxDhAWUxN21+5LPjKLrF81HPxVo
         D2QplBvvzVVRjujCa1RP5wHv/+uAKXtTZ5OmkmzBcQtszNJdcxWqQmE5/dYAcRwOdGLa
         hk5uHYPHHFLmOcp2LQswEdJjF8bX4JE9p9d1fUtTXKT8+Mg+pzbxoBErHaDy4o3HvSHh
         lSwfGtAYobCEWGbtdyBYRaVaDyvFvGBw0MTy6b5KGP2Ztaho5GjxZmaAPHE2kv6hev4I
         SKVF9ybnj72MgdsN95OdzbVAdNC+hLmQ09GmAQy6XfGi+0fo5Scs3hLEws+LDqMcDULk
         IQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYdxpoQyKFeDaQbdKIUrN5/Ag9haNiYupFVN0i2N9tI=;
        b=PJc6LMOjrkK9SaaJ0IMNC8JrjwUXlarrZXG1h7BDuS/Met6NZwwo/3BI5BlPqBKtUW
         4YpdZp+R7X6S4Oa0BLNZq3a7NNLUx3X8bkrvpziyvV5pXgWA6kUKGRQuv1UzyeEm/GyD
         1pGbbEjRPKRrP6Gcvc0aG1Dz1fXSu5MpJBCkSkAQwORHVh1qmP6IJO4dNV4PIrZF6c8n
         aUu+IMGvnm4DxE8CgeJYI+Fww7PZtJ3fneFO+jBHlyFMSWGPsUmt6NUzTJn2c2IYoBuG
         KkSrtt2/2oENpzEIh5UhaRJvfD/faujkQMeXikNi8bKylRuy8V+plfIbUJeII05P0WxK
         7gcA==
X-Gm-Message-State: APjAAAV8LubAxHLuVQq2Xsm19mOAwI/T3kiK459DqUMwMMHtLbEGJy3z
        kzk2gCIY5YdgMRwCsMQyBmx+zbcZ7iaLe12H/boR2g==
X-Google-Smtp-Source: APXvYqwJaWt8FOT5iYYwEp1+i82EfIFqj3p//Hr4qZtGOCamTO84O9sAgIaSczF1o/Ft+u1WfFjVLNDcfZybQ0ZTrP0=
X-Received: by 2002:a24:910b:: with SMTP id i11mr6751918ite.76.1559115535209;
 Wed, 29 May 2019 00:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190528133647.3362-1-ard.biesheuvel@linaro.org>
 <20190528133647.3362-5-ard.biesheuvel@linaro.org> <20190529073129.GP2781@lahna.fi.intel.com>
In-Reply-To: <20190529073129.GP2781@lahna.fi.intel.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Wed, 29 May 2019 09:38:42 +0200
Message-ID: <CAKv+Gu_BJO9AYDicyd4hC7uSWP47ac12wPzi4kgCETwjGZQZOA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpio: mb86s7x: enable ACPI support
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 29 May 2019 at 09:31, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, May 28, 2019 at 03:36:47PM +0200, Ard Biesheuvel wrote:
> > Make the mb86s7x GPIO block discoverable via ACPI. In addition, add
> > support for ACPI GPIO interrupts routed via platform interrupts, by
> > wiring the two together via the to_irq() gpiochip callback.
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> Hmm, I thought I reviewed this already? Well anyway,
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Yes, you did. Apologies.

Marc, can you still incorporate this? Or is it too late?
