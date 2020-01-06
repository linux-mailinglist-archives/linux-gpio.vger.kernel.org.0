Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C1F130E68
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 09:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAFIHG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 03:07:06 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38285 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgAFIHG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 03:07:06 -0500
Received: by mail-ot1-f67.google.com with SMTP id d7so66167981otf.5;
        Mon, 06 Jan 2020 00:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DW1SIti7NHYB1AbqgFvyF14dNMwa3qPTzBW09JetqYs=;
        b=fLBvsDRjAp27Ry4z3ybY4TWK2AC39HDKg34iIBO0JHpK4ZW8DIG1X0FLVIcoaFKQPl
         FcnASseG3YV7gK9AzPCfrox2rjHnRyOSipoEyNKXwGcFFAr30aIEn5KWFdaHrUWaP8sg
         n8YLlfwpGwRBi7DndS5zY0CSnLwdZeUvyur4u+IrJr/GjJFnn5e0SV8PwOgD5QxajggX
         GpPTfAuE8jxPWVJ5ZdfdCOhDlZckyYGQmpZ4jNGMQGaOXu2yFjnpx6aV04qnhqKXsmJ+
         ssGU5M8L6v9M9e3oOx/tIo3A+JENrzYd/59yzbk/ZCZ9GS10i08SoBX1FERJnR3L3Qs6
         25mA==
X-Gm-Message-State: APjAAAVOtT996oCGUCAki2uSbSzYITPnZYYhM2djUur4DzuhvbVL9rQn
        M4Mz7A9vSrpKvjWYnukfm26QXsOikh8nIZxQS6s=
X-Google-Smtp-Source: APXvYqxAKJhctUL3mn7UzaLw+sqHKf++PDfXB8dUrOnMMXR6h0t2N8/KpR/0X7vcb8CRnhjsdWQ+ZW4+Y5nwyAvTH3w=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr15235457ots.250.1578298025342;
 Mon, 06 Jan 2020 00:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-7-geert+renesas@glider.be> <CACRpkdb1XZAeSThxWmJtnm80T4aPufXV2UvJdVdgnw-TJe3trg@mail.gmail.com>
 <CAMuHMdV+Ww5Y9G7+bS-SyHtm4dC89V37yuaYvrS3kYW=PRTkFA@mail.gmail.com> <CACRpkdZwos9Dtt9E3OkxWf4rqMALNTge5NGduzGm-7MhQyLZuQ@mail.gmail.com>
In-Reply-To: <CACRpkdZwos9Dtt9E3OkxWf4rqMALNTge5NGduzGm-7MhQyLZuQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jan 2020 09:06:53 +0100
Message-ID: <CAMuHMdWZ7Wh9rq7SGt7edgCXL1e5UwtSUfxLc0exHa-TEB=W5w@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater documentation
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sat, Jan 4, 2020 at 1:21 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Dec 12, 2019 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Dec 12, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > +The GPIO Aggregator allows access control for individual GPIOs, by aggregating
> > > > +them into a new gpio_chip, which can be assigned to a group or user using
> > > > +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> > > > +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> > > > +GPIO controller, and no longer needs to care about which GPIOs to grab and
> > > > +which not, reducing the attack surface.
> > > > +
> > > > +Aggregated GPIO controllers are instantiated and destroyed by writing to
> > > > +write-only attribute files in sysfs.
> > >
> > > I suppose virtual machines will have a lengthy config file where
> > > they specify which GPIO lines to pick and use for their GPIO
> > > aggregator, and that will all be fine, the VM starts and the aggregator
> > > is there and we can start executing.
> > >
> > > I would perhaps point out a weakness as with all sysfs and with the current
> > > gpio sysfs: if a process creates an aggregator device, and then that
> > > process crashes, what happens when you try to restart the process and
> > > run e.g. your VM again?
> > >
> > > Time for a hard reboot? Or should we add some design guidelines for
> > > these machines so that they can cleanly tear down aggregators
> > > previously created by the crashed VM?
> >
> > No, the VM does not create the aggregator.
> >
> > The idea is for the user to create one or more aggregators, set up
> > permissions on /dev/gpiochipX, and launch the VM, passing the aggregated
> > /dev/gpiochipX as parameters.
> > If the VM crashes, just launch it again.
> >
> > Destroying the aggregators is a manual and independent process, after
> > the VM has exited.
>
> I'm thinking about someone making some industrial application for some
> control of a machinery say a robotic arm.
>
> And do make sure this VM is only controlling these GPIOs related to
> this robotic arm, they create a GPIO aggregator. And we care about
> cases like that since we provide this security argument.
>
> Surely that machine will be rebooted.
>
> Surely they don't have a printed paper with all the commands lying
> at the console, and asking whoever powers it back on to manually
> type it all in again. That feels a bit 1981.
>
> So they will have a script for this I suppose. Possibly in some
> initscript so it is set up on boot. And this script echos stuff
> all over the place to set up the aggregator.
>
> Is this the use case you're thinking of?

Exactly.

And they can configure that by echoing the GPIO specifiers to
/sys/bus/platform/drivers/gpio-aggregator/new_device.

If their system has DT, another option is to describe the device in DT,
and add its compatible value to gpio_aggregator_dt_ids[], cfr. the
frobnicator example.

> I just like to have the whole picture here.

Sure. If anything is still unclear, please let me know!
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
