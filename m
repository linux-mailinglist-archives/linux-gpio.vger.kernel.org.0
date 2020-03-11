Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35DD7181D35
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 17:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgCKQJ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 12:09:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41454 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbgCKQJ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 12:09:57 -0400
Received: by mail-ot1-f68.google.com with SMTP id s15so2545257otq.8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2020 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHCMeKPDxYeB8oLBoOVgW7eRt3m++jTxFNAqk0lBahg=;
        b=T+2qbotF8YuwXHpWLAJaVZ3hVF/dquYCSRS05M1A7mvQV5LzfewtWVTsHWdk8Go9F/
         2g/4Ym2nx7n5QV/sER4Txqu5rPTxqet8VHyUWGxCmwWAJt3qUQiSWGPET2xfNz9JfedF
         5xwHqKoGb41geEImN2fUmeSQQF7St0SbGtqHlmlfn6i/7S3/hSGDeYa08lyFqq83sM5I
         UZp8EKZAV1mUiq5TMGDkiQlDPoljkg8PtpjL06pqruUn0UYWL7pIycT6vZrXwQHxfMFV
         S60j0XBqb/FAOJfDMpT+2LXN3h4M5o4PLyfEnFL6nPDVvmcVHwvYhv+3zKS43eS04L3G
         EiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHCMeKPDxYeB8oLBoOVgW7eRt3m++jTxFNAqk0lBahg=;
        b=siQ+sZ1Uq/YNyWPOPFpyame+ghULf5z55KfYJzuy/B64XcVAo8z7qhsb8qFadJVMf0
         OVN9WWgnPUA6Pg/UiAorbkPHDyMDUTd43idm80y38g71/9DULpz8DgN4GGl3Ziz25vYd
         iHcJ7PoLqHgAt2mf+2FFO+gZXdXgSlc/8sW2n7HkO3ZZj7xmv54xlkNF+Ih+rcBTDwgq
         8nEGp99nsLmH3NnRvvFiuUNcO09a2g3EdqJPKaTQYj/UAbk1XXIDpHMUIirHIvDj4KpX
         Mbj0/s3+898/+rAfpOIIe73ZlYO2pqnikurW8Ov26h69HB5nowsiKGcaChQ/jeMen3gU
         ny8w==
X-Gm-Message-State: ANhLgQ3UjwLZRGYq+ejunMI8OZiOBh3yfQkEpQlH87BU3yePFsLG3/OE
        Cbg6tgoqdSAqAVY3LCbsH9blpuxXTRKb6DJGHj1Mlw==
X-Google-Smtp-Source: ADFU+vsF0mYOWDUY9jeerFS7C1YHWPcdcvJokSfwKoYIwMy0iUuNQO8orU7ziwk2fzKINRWEir3a59IQXixeW7y6JDo=
X-Received: by 2002:a4a:2a47:: with SMTP id x7mr790140oox.23.1583942995604;
 Wed, 11 Mar 2020 09:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190430101230.21794-1-lokeshvutla@ti.com> <20190430101230.21794-8-lokeshvutla@ti.com>
 <CAJ+vNU2gnKKxX2YL1JUSnpF7qNqKVAsPhC2emv=Y79HPJbZXzw@mail.gmail.com> <87zhcmkicp.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zhcmkicp.fsf@nanos.tec.linutronix.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 11 Mar 2020 09:09:43 -0700
Message-ID: <CAJ+vNU2agPYq+Y3kXG40wcfUzA9q-27Cdvqj7gLT2o6RKCQK5Q@mail.gmail.com>
Subject: Re: [PATCH v8 07/14] gpio: thunderx: Use the default parent apis for {request,release}_resources
To:     Thomas Gleixner <tglx@linutronix.de>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 11, 2020 at 8:43 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Tim,
>
> Tim Harvey <tharvey@gateworks.com> writes:
> > On Tue, Apr 30, 2019 at 3:14 AM Lokesh Vutla <lokeshvutla@ti.com> wrote:
> >> -       if (parent_data && parent_data->chip->irq_request_resources) {
> >> -               r = parent_data->chip->irq_request_resources(parent_data);
> >> -               if (r)
> >> -                       goto error;
> >> -       }
> >> +       r = irq_chip_request_resources_parent(data);
> >> +       if (r)
> >> +               gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> >
> > This patch breaks irq resources for thunderx-gpio as
> > parent_data->chip->irq_request_resources is undefined thus your new
> > irq_chip_request_resources_parent() returns -ENOSYS causing this
> > function to return an error where as before it would happily return 0.
> >
> > Is the following the correct fix or should we qualify
> > data->parent_data->chip->irq_request_resources before calling
> > irq_chip_request_resources_parent() in thunderx-gpio?
>
> You are not supposed to fiddle with parent data at all. Just because C
> allows you is no excuse to violate abstractions in the first place.
>
> irq_chip_request_resources_parent() rightfully returns -ENOSYS when it
> can't request a resource from the parent chip because that chip does not
> have anything to offer.
>
> It's up to the caller to do something sensible with the return code. If
> your chip is happy with the parent not providing it then handle
> -ENOSYS. None of the chip callbacks should return -ENOSYS. If one does
> then that wants to be fixed.
>

Ok, makes sense. Thank you and Lokesh for the feedback. I just
submitted a patch to fix the thunderx-gpio breakage.

Best Regards,

Tim
