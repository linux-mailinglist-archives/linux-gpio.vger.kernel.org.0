Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5BFE32F28C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 19:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhCESaG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 13:30:06 -0500
Received: from mail-oo1-f47.google.com ([209.85.161.47]:38609 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhCES3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 13:29:41 -0500
Received: by mail-oo1-f47.google.com with SMTP id z12so215111ooh.5;
        Fri, 05 Mar 2021 10:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q7C5srUMjqR7mTHLtb1KoH/0EwvHmEFAeiLqZIKcwu0=;
        b=Vcl+davoyETZnqjslkSziPoMr5FAks7fskLe8cjXbgl4PYAND4NdhFj3TN9rcgPl62
         TZx+BZ/GdX5v2CGgeg4R9R84AMhH+tQIRAL7NywBk/OSMudsoyOF/CQe3RaAWzbe6Vb6
         MMxkJjmIhH7xNIrS+CXUn9fb+YdxVag+Bybb2mdeiiNEURlyDtNJitWPEYRz5/8DbWhD
         6JZJYjd44ksJTO5BH+HL0+h3lbEQGeC51eUp3H7qE4ZU33+SvwbDnZ683xGvZzbhmCBz
         +q7uEquLnLemsal0XwPJIF301MOmfsWXiMrCQEqeEEH+kNWI8UzH0+pJeGphxrgBr9Wl
         4aNA==
X-Gm-Message-State: AOAM533vCooEKxp+YqIbkAhSr0dBCnJ9RAo1DY9T/3qy3KZup9lPGNjC
        7T5GGoB2TvRDLOnaxQlBfg==
X-Google-Smtp-Source: ABdhPJyT1c951it0I+dEcjhFtGuostLapU+mgEJBGNONsUTb0jkyqE/bGOpWC/zWjA7Pl52aBS0wCg==
X-Received: by 2002:a4a:6b44:: with SMTP id h4mr8817110oof.38.1614968981184;
        Fri, 05 Mar 2021 10:29:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s73sm684339oih.36.2021.03.05.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:29:39 -0800 (PST)
Received: (nullmailer pid 430979 invoked by uid 1000);
        Fri, 05 Mar 2021 18:29:38 -0000
Date:   Fri, 5 Mar 2021 12:29:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: RFC: oftree based setup of composite board devices
Message-ID: <20210305182938.GA399009@robh.at.kernel.org>
References: <20210208222203.22335-1-info@metux.net>
 <CAL_JsqJ-bz35mUM3agYjq5x+Y+u9rL1RwesCaA-x=MW8uv5CrA@mail.gmail.com>
 <76bf0f7c-9477-f370-8fbd-ce8ef15188b1@gmail.com>
 <44b9b561-5e0d-6a1c-ca5d-4e9f6000884c@metux.net>
 <89086c87-c730-ff35-3865-4cf145883a95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89086c87-c730-ff35-3865-4cf145883a95@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2021 at 05:14:10PM -0600, Frank Rowand wrote:
> On 2/24/21 7:00 AM, Enrico Weigelt, metux IT consult wrote:
> > On 15.02.21 02:12, Frank Rowand wrote:
> > 
> >> Why not compile in ACPI data (tables?) instead of devicetree description?
> > 
> > The problem is a bit more complex than it might seem.
> > 
> > Let's take the APU2/37/4 boards as an example. They've got some aux
> > devices, eg. some gpio controller, and some things (leds, keys, reset
> > lines, etc) attached to it.
> > 
> > Now we've got lots of different bios versions in the field,
> > enumerating only some of the devices. For example, older ones didn't
> > even contain the gpio, later ones added just gpio, other ones just
> > added LEDs (with different names than the Linux driver already mainlined
> > and field-deployed at that time), but still other lines unhandled, etc, etc. etc.
> > 
> > A big mess :( And I can't ask everybody to do bios uprade on devices far
> > out in the field (litterally open field, sometimes offshore, ...). So, I
> > need a usable solution, that's also maintainable, w/o testing each
> > single combination of board, bios, etc. IOW: without relying on bios
> > (except for board identification)
> > 
> > OTOH, I'm also looking for a solution get rid writing those kind of
> > relatively huge board drivers, that pretty are much like old fashioned
> > board files from pre-DT times - just made up of lots of tables and
> > a few trivial register-something calls. Sounds pretty much like the
> > original use case of oftree.
> > 
> > The primary difference between classic oftree and this scanario:
> > * this is additional to existing platform information, which is
> >   incomplete or even incorrect (and that can't be fixed)
> > * extra carrier boards that are detected by other means, but no
> >   enumeration of the devices on it.
> > 
> >>> This is something I've wanted to see for a while. There's use cases
> >>> for DT based systems too. The example I'd like to see supported are
> >>> USB serial adapters with downstream serdev, GPIO, I2C, SPI, etc. Then
> >>> plug more than one of those in.
> >>
> >> My understanding from the past is that the experts (those who understand both
> >> devicetree and ACPI) regard trying to mix devicetree and ACPI in a single
> >> running Linux kernel image is insanity, or at least likely to be confusing,
> >> difficult, and problematic.
> 
> Since you have persisted, a more referenced and emphatic "no" to mixing ACPI
> and devicetree:
> 
>   https://elinux.org/Device_Tree_Linux#mixing_devicetree_and_ACPI

The 'no' is for mixing the 2. Despite the no, it's been happening 
anyways. That's mostly been the reusing DT bindings in ACPI tables. I 
won't review such bindings if I realize that's what they are, but 
usually that's not evident.

This is a bit different I think where both ACPI and DT are used, but 
they are totally disjoint. I don't have any issue with that. Why would 
we want to force 2 different firmware descriptions for something 
otherwise independent of the base system's firmware. Maybe that's not 
exactly the case here, but the same changes to the DT code are needed 
(unless you have a better solution for my example than multiple roots). 
If someone wants to implement the changes that align with what I want, 
then I don't really care what their motivation is.

Rob
