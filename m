Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC4312FF7F
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 01:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgADAVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 19:21:40 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46126 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgADAVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 19:21:40 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so42947376ljc.13
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 16:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a25MTBnzC/TY/vt8zz8+qKKJTGhY6mCF1CmPfY1tykI=;
        b=gRnVfA7FDAgs73jNy22XumTxemh0aYDjK9B1YAV7aDhmr0DazAVJiMp4WVw1bkv31/
         bcATx1sRwYkcsu4O0LQVmlmjSHW5VtsN8kArTfZitHm7x//5M6K3YcSNLlNrU4k2nXBM
         yt6DH6rszExsqnVul0yZCOGTl1phucIVvqvK/Gcklh4kjZC6VQ1xu9ZmRNx0Ik5oj39W
         PUCHY1sxyw3q0Pr498xt9akwnDTU17FpPWdhZ0+b30zgWzvbnxDXRO1SyZ+eSC73LL7M
         4bTSAi5L7Qao6/+sTppkChYPciZ16A05vGdttDOmIm7Rn2KAj85O40F9gtCbP1HMl69m
         XGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a25MTBnzC/TY/vt8zz8+qKKJTGhY6mCF1CmPfY1tykI=;
        b=oAhddxCom5bdhXvjteE4WMz0AKuylGZzmnx1aDtjNyNUqiYruy3qy50P5XgckBJV12
         me4KrJj5KkLwkJ3fm8ENG1FlkjdCG3rw+RtLC2JNPqNVtb6E4obWrcRbfyg6R1Q9PeAp
         39nvGsXL0IgxHNTpTWFkndsUzdEsUfLcEGbvKa5dU1yB0eaVEgGSKSLI3ggXR3to2aNZ
         X8iw3SxfLk4VMxBFKO6UnMEvELIYIc6Q3+BL18cC7jWskdgfZAEU8J8Y23cdP2DOcaJs
         v/qp41sjiXyxRAtPLtF58gclaK1Rf9e3Wfd7mII6OYK2X7SUsgDQ8WBqdyeihNA5Em5k
         BrVQ==
X-Gm-Message-State: APjAAAUpncyQeA9ilKPeMAMo9yg7F7+c0Jy4LIm2eLRgHnyJT2L+ypGO
        l4UbPweNj5pXmXJRhBKMZpOqFPae3Sb8N2iE2fFTUg==
X-Google-Smtp-Source: APXvYqxHT5NBcGXP7l31r/rUzGwxDXqF6xPcQ35bsC0BAshJRd7O7pJFod6OutyDNvKjGim9p9LsFYX1ulkLOKLmCGs=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr51946653ljj.191.1578097298469;
 Fri, 03 Jan 2020 16:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-7-geert+renesas@glider.be> <CACRpkdb1XZAeSThxWmJtnm80T4aPufXV2UvJdVdgnw-TJe3trg@mail.gmail.com>
 <CAMuHMdV+Ww5Y9G7+bS-SyHtm4dC89V37yuaYvrS3kYW=PRTkFA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+Ww5Y9G7+bS-SyHtm4dC89V37yuaYvrS3kYW=PRTkFA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jan 2020 01:21:27 +0100
Message-ID: <CACRpkdZwos9Dtt9E3OkxWf4rqMALNTge5NGduzGm-7MhQyLZuQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater documentation
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Dec 12, 2019 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Dec 12, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > +The GPIO Aggregator allows access control for individual GPIOs, by aggregating
> > > +them into a new gpio_chip, which can be assigned to a group or user using
> > > +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> > > +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> > > +GPIO controller, and no longer needs to care about which GPIOs to grab and
> > > +which not, reducing the attack surface.
> > > +
> > > +Aggregated GPIO controllers are instantiated and destroyed by writing to
> > > +write-only attribute files in sysfs.
> >
> > I suppose virtual machines will have a lengthy config file where
> > they specify which GPIO lines to pick and use for their GPIO
> > aggregator, and that will all be fine, the VM starts and the aggregator
> > is there and we can start executing.
> >
> > I would perhaps point out a weakness as with all sysfs and with the current
> > gpio sysfs: if a process creates an aggregator device, and then that
> > process crashes, what happens when you try to restart the process and
> > run e.g. your VM again?
> >
> > Time for a hard reboot? Or should we add some design guidelines for
> > these machines so that they can cleanly tear down aggregators
> > previously created by the crashed VM?
>
> No, the VM does not create the aggregator.
>
> The idea is for the user to create one or more aggregators, set up
> permissions on /dev/gpiochipX, and launch the VM, passing the aggregated
> /dev/gpiochipX as parameters.
> If the VM crashes, just launch it again.
>
> Destroying the aggregators is a manual and independent process, after
> the VM has exited.

I'm thinking about someone making some industrial application for some
control of a machinery say a robotic arm.

And do make sure this VM is only controlling these GPIOs related to
this robotic arm, they create a GPIO aggregator. And we care about
cases like that since we provide this security argument.

Surely that machine will be rebooted.

Surely they don't have a printed paper with all the commands lying
at the console, and asking whoever powers it back on to manually
type it all in again. That feels a bit 1981.

So they will have a script for this I suppose. Possibly in some
initscript so it is set up on boot. And this script echos stuff
all over the place to set up the aggregator.

Is this the use case you're thinking of?

I just like to have the whole picture here.

Yours,
Linus Walleij
