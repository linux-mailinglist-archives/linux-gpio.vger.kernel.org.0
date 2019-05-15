Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2B11F5B2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2019 15:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfEONia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 May 2019 09:38:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45119 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfEONia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 May 2019 09:38:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id r76so2517010lja.12
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2019 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+6q+E6Xgh/2YMnAMUKEGO13bSID45p2F6up8jNsuSBA=;
        b=TXyl7/X9g3HmH7DrqfEtAvyTNfbM3qGuKqfLaWLCSVnQSx7dM2y4INIQdpGzrlc8T5
         nM2WxyPVLZYCMyP8hDhmfaSeLFkzZ4lD2UltR3BTnP9c7S3ToxK8bWuvNvDqX5z5YCjT
         v9NNtyttDIweW+4OX7y4tYFAfvxHQFAgJiYvZZZkAPXiB6gFKxqAHja6kwmfjPxFVyEE
         Uxf+Og3s3R1EMXvvi5tXGD7rTtBaPpsEFpyTkAUmNnJLQ1iRkaT4Y4BHv1oVnNqK2t91
         +o3FoIVFAtBqjK7CA6bdeR0lzf+238IXVijuRGbQi6PK3hDGMJ0cvFjvt/Qeri60K2KO
         zLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+6q+E6Xgh/2YMnAMUKEGO13bSID45p2F6up8jNsuSBA=;
        b=CEOqq/+I55p8IynoruIlS0N0QjhnH+vDRUscy9GO2I5918Psbth88t9pVXsRI+Tb3k
         NoAaol/1fn9lr7O0PEaOaNeRylRj6xl94kVMnBOf+YeX3HsGCsFoAIIDflA1zW26ZE6L
         A+QxeQlGTyEkw7BJoEb3dAdbuLyhP33mVDelCqGsu2UIhEuS8tn1Wf2dqRbLSTCWllue
         n1rpHPq82Gd24+IFgOoHNZzK3dqljMR5jqdbUTMCrt6iqJJ6f6vnUbT4OKizSI5RfW9S
         t7BD3q3+DFN5qxK+Jrilx1N/Vqc6ejp+J2rEc+lg3leMLtgnPsQborU72okb0Xhi9EVV
         4MEA==
X-Gm-Message-State: APjAAAVWv/YNCuzBSBHYW5h98lSSRVpw95GXgsPeVkElZdN8phK7XVXM
        wcU1mn5JCzyhS9JC2DvIYgLmMX/CP5o=
X-Google-Smtp-Source: APXvYqxH42jFUOqto8p0z9OgrL+vm86ip0vW7Jlu9HPB9BWRMi/1L47cdVAMicwDNKhohV6rbMzp4Q==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr18486916ljt.148.1557927507537;
        Wed, 15 May 2019 06:38:27 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id l76sm389351lfe.77.2019.05.15.06.38.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 06:38:26 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Wed, 15 May 2019 15:38:25 +0200
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 00/11] pinctrl: sh-pfc: Convert to new non-GPIO helper
 macros
Message-ID: <20190515133825.GB31788@bigcity.dyn.berto.se>
References: <20190513152857.13122-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-05-13 17:28:46 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> On many Renesas ARM SoCs, there exist pins that are not associated with
> a GPIO port, but still need configuration (e.g. drive strength or
> pull-up).  While pins with GPIO functionality are indexed by their
> GPIO number, no such number exists for non-GPIO pins.  Hence for the
> latter, the pin control driver uses numbers outside the GPIO number
> space, derived from the row and column numbers of the physical pins.
> 
> For R-Car H3 (and later M3-W and M3-N), the choice was made to use the
> SiP (System-in-Package, i.e. SoC + RAM + HyperFlash in a BGA package)
> physical pin numbers, as the SiP was what was mounted on the
> Salvator-X(S) and ULCB development boards available at that time.
> 
> In hindsight, it would have been better to settle on the SoC physical
> pin numbers, though: the pin control driver for R-Car M3-W was reused
> for the RZ/G2M SoC, which is only available as an SoC, not SiP, thus
> making it hard to match the driver with the documentation.
> 
> But even for SoCs there can be confusion: several SoCs are available in
> multiple packages, with the same or different number of pins, leading to
> different pin numberings.
> 
> As this numbering is used only internal to the driver, and pin control
> configuration from DT refers to these pins by signal name, not pin
> number (usually, see exceptions below[*]), I started wondering if we
> could get rid of the SoC/SiP pin numbers instead.  As the actual numbers
> don't matter, all that is needed for the driver is a unique number for
> each pin.
> 
> Hence this patch series converts the affected drivers to use new macros
> that allow to describe pins without GPIO functionality, and refer to
> them by auto-generated symbolic enum values, similar in spirit to the
> existing scheme for handling pins with GPIO functionality.
> 
> This series consists of three parts:
>   - Patch 1 introduces new macros to describe and handle pins without
>     GPIO functionality,
>   - Patches 2-10 convert the pin control drivers for the individual SoCs
>     to use the new macros,
>   - Patch 11 removes the now unused old macros.
> 
> There should be no functional changes induced by this patch series,
> which has been tested on Salvator-X(S) (with R-Car H3 ES1.0 and ES2.0,
> M3-W, and M3-N), Ebisu (R-Car E3), and KZM-A9-GT (SH-Mobile AG5).
> 
> [*] The user-visible names of pins without GPIO functionality are based
>     on pin numbers (e.g. "B25") instead of signal names ("CLKOUT") on
>     EMMA Mobile EV2, R-Car M1A, R-Car H2, and SH-Mobile AG5.
>     I didn't change these to preserve DT backwards compatibility.
> 
> The "name" parameters of the PIN_NOGP_CFG() and PIN_NOGP() macros could
> be removed, if these macros would generate the names from the "pin"
> parameters.  However, that would:
>   1. Require replacing the "#" suffices in pin names for active-low
>      signals by "_N",
>      R-Car H3/M3-W/M3-N use a "#" suffix, R-Car E3 use a "_N" suffix.
>   2. Replace the names based on pin numbers on older SoCs by signal
>      names.
> Both changes could affect DT backwards compatibility.  None of these are
> currently used in (upstream) DTS files, though.
> Do you think it would be worthwhile to make this consistent?
> 
> Thanks for your comments!

I really like how this is used, much better then SH_PFC_PIN_NAMED 
approach!

I have not reviewed all renames of PIN_NUMBER() to their more 
descriptive names, but did spot checks to make sure it made sens. I 
trust you for the rest ;-) For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I tested this on
- r8a7795
- r8a7796
- r8a77965

Feel free to add to those patches,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Geert Uytterhoeven (11):
>   pinctrl: sh-pfc: Add new non-GPIO helper macros
>   pinctrl: sh-pfc: emev2: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a7778: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a7790: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a7795-es1: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a7795: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a7796: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a77965: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: r8a77990: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: sh73a0: Use new macros for non-GPIO pins
>   pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros
> 
>  drivers/pinctrl/sh-pfc/pfc-emev2.c       |  70 +++--
>  drivers/pinctrl/sh-pfc/pfc-r8a7778.c     |  29 +-
>  drivers/pinctrl/sh-pfc/pfc-r8a7790.c     |  34 ++-
>  drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 333 +++++++++++------------
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 313 +++++++++++----------
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 307 ++++++++++-----------
>  drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 307 ++++++++++-----------
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c    |  87 +++---
>  drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  19 +-
>  drivers/pinctrl/sh-pfc/sh_pfc.h          |  72 +++--
>  10 files changed, 797 insertions(+), 774 deletions(-)
> 
> -- 
> 2.17.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
