Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB491322CA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 10:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgAGJph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 04:45:37 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42423 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgAGJph (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:45:37 -0500
Received: by mail-lf1-f65.google.com with SMTP id y19so38382949lfl.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T3vugB6Qu+hg8N2SRIaebFbxjQ0rXg7WNTL//JNDGnk=;
        b=L7YekdgjF3qbrxhKWPnQGcodWPSyCVzxAm1Zp2kbJL+CTc2UiYzlmnpuntqa1ei6Pe
         Qq2EchUzXxcGdUnHVWtgpSN8yuAv7alGgUzWOnVGYEtnK5ae9zWA+G+RJm2Knshz4GcH
         vQZmr4ngNwiHPcHWomuop4Kn0rNd+2XiyP4L0PMjNeQO5fkCUZIEJ4eObIl7AgFO09t8
         fpKb5PlQaBWquu2sElIJqcU12SP08cKt6ewbzpky6TtoOzyyKRaTTzXd1MLQHtJ5ee0I
         CJmhTb/mPMy5aHzcf7/0HngijnODPmVaRUFMB0tPX0JoY2Ir0EDQ8sa5WU+0geKvMGlW
         vk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T3vugB6Qu+hg8N2SRIaebFbxjQ0rXg7WNTL//JNDGnk=;
        b=eTDumTeuxPLbTQDOmriH+5KYD7gOcbAz37GBUSLD2yno+OSeJdDc2JeO99Pe7+6iUs
         YIQkDKIShaLze5Cx3gm2ZHL2WgYGUA+80EpyAAKzgsTC49fAVrMguepKN0TgyIsKI+eR
         m5p5pugO538xxBycZBrhjYs+NqH57cdDeobKm8oAsmM/Z0WuvVdFuWV68awKSJ7IT8U+
         hMEybuQaZN/sfSXxlV2pbfIgvKbhq/g4488CTJYfXgo00xe3+naeqDODYwpvZzhknGLZ
         /xs0NcGUBsDYdbMo3iPUo8zXwt56Jh6gtIQ+bgO/oTfhRNP3QE3twJN5t+YwR6MY0TpE
         GJUg==
X-Gm-Message-State: APjAAAX1Qp8Z39+WT5RSMWJGjxW9IqbqAvqz3i1Y9Onld2I5I/x6BiA7
        VIpLqj42utQEyptM757F/14LX441ULe9bGBEutDBJwM1glQ=
X-Google-Smtp-Source: APXvYqySRirN6OVtQ4D1qwmutDdmHlcunK5AA3Rw93pqwxd0gFUoAfC+0BNom26keyxoOQ7H+ZpYS1n3fqMftps70cU=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58157919lfi.93.1578390334610;
 Tue, 07 Jan 2020 01:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de>
In-Reply-To: <20191218163701.171914-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:45:23 +0100
Message-ID: <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:

> In a rare randconfig build I came across one configuration that does
> not enable CONFIG_GPIOLIB, which is needed by lochnagar:
>
> ERROR: "devm_gpiochip_add_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_free" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_request" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_get_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
>
> Add another 'select' like all other pinctrl drivers have.
>
> Fixes: 0548448b719a ("pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> subsystem, or if there are still good reasons for leaving it disabled
> on any machine that uses CONFIG_PINCTRL.

Hm that is a tricky question, they almost always come in pair but are
technically speaking separate subsystems.

I have a (very) long-term plan to merge them at some point before
I retire :D

Yours,
Linus Walleij
