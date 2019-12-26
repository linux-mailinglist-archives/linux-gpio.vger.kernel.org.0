Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2464712AD13
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 15:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfLZOeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 09:34:23 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42039 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLZOeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Dec 2019 09:34:23 -0500
Received: by mail-ot1-f66.google.com with SMTP id 66so32705432otd.9;
        Thu, 26 Dec 2019 06:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uyXJLCypDRcPx/dQLKQopsy2jS5X1aGNtltPKaE3ejc=;
        b=IxwbsJVqy0Z5ID3cLy1p5jcdQlaVkTaCqwl0pITVm8OXWn1A2Yvnc4wGCxAp4+F7TH
         gAX2PLDXrbkI7WWVmaPFTnuaJiISoeONea5aU8UdzYWF08/Gn+FAV2zXdFVFvQSCcVSc
         nH4IVfklb2ELkLAGwQDzI14ZlXM1Ysv7LJp8oSEHG5xZhVALnHg7h6+K6wpJhO6BJ2Zv
         2uEx7hpQQOgiPCpcjmH+fbYviBIVBY5eDFldCBor3b8UA+lJc5fhvpa1fFjJ2HT6tKW0
         2wZds+9IZVRfZeGG+2j9GDN45anjKMxnUapNC4++MiR//Ritoooyjzk4V8f8iVN7/BnH
         ItWw==
X-Gm-Message-State: APjAAAV2oK8O6N65tW5E+k6kDGrsIuIGJ6YkJlJw4aToormjHJoftZdC
        4TBvm6eHrcvrDB8Q/CzsxOPw8Kzcckaa1Ncm3a8=
X-Google-Smtp-Source: APXvYqxTP5IfHEE0iuORPur5LEyFjotvw370NR9yqNjJ0FeavjP1C1QtnlOT5FASczusf0CTCAIj0zKVGrqv85ldzAo=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr51044086otd.39.1577370862936;
 Thu, 26 Dec 2019 06:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20191217184242.827-1-geert+renesas@glider.be> <TYAPR01MB4544936355182F4091F89EECD8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544936355182F4091F89EECD8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Dec 2019 15:34:11 +0100
Message-ID: <CAMuHMdVnoGpBvU5hH1dBHo6QXFS5voy6SmEDZKyu1JWqLfwhGQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@de.adit-jv.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 25, 2019 at 10:46 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, December 18, 2019 3:43 AM
> >
> > Despite using the same compatible values ("r8a7795"-based) because of
> > historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> > (R8A77951) are really different SoCs, with different part numbers, and
> > with different Pin Function Controller blocks.
> >
> > Reflect this in the pinctrl configuration, by replacing the existing
> > CONFIG_PINCTRL_PFC_R8A7795 symbol by two new config symbols:
> > CONFIG_PINCTRL_PFC_R8A77950 and CONFIG_PINCTRL_PFC_R8A77951.  The latter
> > are selected automatically, depending on the soon-to-be-introduced
> > corresponding SoC-specific config options, and on the current common
> > config option, to relax dependencies.
> >
> > Rename the individual pin control driver source files from
> > pfc-r8a7795-es1.c to pfc-r8a77950.c, and from pfc-r8a7795.c to
> > pfc-r8a77951.c, and make them truly independent.
> > As both SoCs share the same compatible value, special care must be taken
> > to match them to the correct pin control driver, if support for it is
> > included in the running kernel.
> >
> > This will allow making support for early R-Car H3 revisions optional,
> > the largest share of which is taken by the pin control driver.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Suggestions for simplifying sh_pfc_quirk_match(), or for alternative
> > solutions are welcome!
>
> I wondered if using weak attribute on both info variables could
> simplify sh_pfc_quirk_match(), but such a code [1] doesn't seem better
> than using #ifdef. Also, using weak attributes waste data size
> if R8A77950=n and R8A77951=y for instance.

Thanks for the great suggestion!

The trick is to add __weak to the existing extern declarations in sh_pfc.h,
instead of adding weak empty structs.
When the structs don't exist, their addresses just become zero.

So I came up with the following (whitespace-damaged) patch, which I intend
to fold into the original, if no one objects.

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 8da95bf22735fd7b..92f8d5f5b6930849 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -1120,19 +1120,11 @@ static const void *sh_pfc_quirk_match(void)
        static const struct soc_device_attribute quirks[] = {
                {
                        .soc_id = "r8a7795", .revision = "ES1.*",
-#ifdef CONFIG_PINCTRL_PFC_R8A77950
                        .data = &r8a77950_pinmux_info,
-#else
-                       .data = (void *)-ENODEV,
-#endif
                },
                {
                        .soc_id = "r8a7795",
-#ifdef CONFIG_PINCTRL_PFC_R8A77951
                        .data = &r8a77951_pinmux_info,
-#else
-                       .data = (void *)-ENODEV,
-#endif
                },

                { /* sentinel */ }
@@ -1140,7 +1132,7 @@ static const void *sh_pfc_quirk_match(void)

        match = soc_device_match(quirks);
        if (match)
-               return match->data;
+               return match->data ?: ERR_PTR(-ENODEV);
 #endif /* CONFIG_PINCTRL_PFC_R8A77950 || CONFIG_PINCTRL_PFC_R8A77951 */

        return NULL;
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index aa298332f00f1a8e..d57e633e99c0ce66 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -318,8 +318,8 @@ extern const struct sh_pfc_soc_info r8a7791_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7792_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
-extern const struct sh_pfc_soc_info r8a77950_pinmux_info;
-extern const struct sh_pfc_soc_info r8a77951_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77950_pinmux_info __weak;
+extern const struct sh_pfc_soc_info r8a77951_pinmux_info __weak;
 extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
