Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B91653C745
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 11:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242955AbiFCJNB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 05:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241874AbiFCJNA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 05:13:00 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59ED20BF7;
        Fri,  3 Jun 2022 02:12:58 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id hh4so5103571qtb.10;
        Fri, 03 Jun 2022 02:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xrZu3JWLdC5Y2R17LStLOEC4phCuKGH0ZqwdOEha4HQ=;
        b=Q7o3fsbqEzZjd6lbzXzmzRTc03mMEKrsYvp9S/nPHIbwtj6+4pBsT55pLmcd+KE186
         W8DQ3HeBEzBP3+Kef3hgofIYF46cfDN3U6T2ld2hgQ35xcH1+GnmYN1DlRAZp7FOfLr0
         dCm6enNlqwijYjt4+M6R/VmREbV6jIs6+1beH+4HEYNvODB7kaoF+qNKj25JqjWSBjtr
         BovZL14pHNbtyMGH2o+8oqmu55qsKgESEePrNbC1ZQ3c3nn6eerfuIBkgiVw4+cR+KGS
         f7cHeu5k/u82x/7yIYzZfvNI0GFy6EQy6i8sLMS57ioqZ8DXTeYSv7fKEqPVW6vhCm/7
         n1Bg==
X-Gm-Message-State: AOAM533XZXN4CEDbAoLYwhXpjbMDNek7x/8IeS9+5WHpurdurt/O2Z40
        OxuZssgKSy316q4IgM/lNM8YjLs3mOP2cw==
X-Google-Smtp-Source: ABdhPJw+3hUzlJEz7/ycUqnnBaSsBrk4qYBjZjYddalyLFA+voNNHXgSQq+l5rEWW7AolUxxx3DpuQ==
X-Received: by 2002:ac8:5a86:0:b0:303:fba5:ed5e with SMTP id c6-20020ac85a86000000b00303fba5ed5emr6604827qtc.330.1654247577638;
        Fri, 03 Jun 2022 02:12:57 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v7-20020ac873c7000000b002f93be3ccfdsm284865qtp.18.2022.06.03.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:12:57 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id w2so12678738ybi.7;
        Fri, 03 Jun 2022 02:12:57 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr10146637ybu.604.1654247576916; Fri, 03
 Jun 2022 02:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Jun 2022 11:12:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
Message-ID: <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Fri, Jun 3, 2022 at 7:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> These are for V4H (r8a779g0) pinctrl patches.
>
> I have separate new macro definition from original patch [1/3].
> I have cleanuped original initial patch, and merged its fixup patch [2/3].
> I have merged original many device settings patches into one [3/3].
>
>   [1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
>   [2/3] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
>   [3/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions

Thanks for your series!

Here's a first set of quick comments. More will follow later.

Note that this does not apply cleanly against renesas-pinctrl, as
drivers/pinctrl/renesas/Kconfig has received some changes in the
meantime.

Please fix the following issues reported by scripts/checkpatch.pl:
  - code indent should use tabs where possible,
  - please, no spaces at the start of a line,
  - please, no space before tabs.

Please enable CONFIG_DEBUG_PINCTRL=y to run the sh-pfc checker (this
works even when running on another Renesas platform than R-Car V4H;
all included drivers will be checked), and fix the issues reported:

    r8a779g0_pfc: pin GP_1_23: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_1_24: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_1_25: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_1_26: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_1_27: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_1_28: SH_PFC_PIN_CFG_IO_VOLTAGE set but
invalid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_3_19: SH_PFC_PIN_CFG_DRIVE_STRENGTH flag set
but not in drive_regs
    r8a779g0_pfc: pin GP_4_0: SH_PFC_PIN_CFG_IO_VOLTAGE not set but
valid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_5_0: SH_PFC_PIN_CFG_IO_VOLTAGE not set but
valid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_5_20: SH_PFC_PIN_CFG_PULL_UP flag set but pin
not in bias_regs
    r8a779g0_pfc: pin GP_5_20: SH_PFC_PIN_CFG_PULL_DOWN flag set but
pin not in bias_regs
    r8a779g0_pfc: pin GP_6_0: SH_PFC_PIN_CFG_IO_VOLTAGE not set but
valid pin_to_pocctrl()
    r8a779g0_pfc: pin GP_7_0: SH_PFC_PIN_CFG_IO_VOLTAGE not set but
valid pin_to_pocctrl()
    r8a779g0_pfc: drive_reg 0xe6058888:5/0xe6058888:4: pin conflict
    r8a779g0_pfc: bias_reg 0xe60608c0:20/0xe60608c0:19: pin conflict
    r8a779g0_pfc: bias_reg 0xe60608e0:20/0xe60608e0:19: pin conflict

It is also a good idea to follow the suggestions about pin group subsets
and reserved fields, as that will reduce table sizes:

    r8a779g0_pfc: group mmc_data1 is a subset of mmc_data4
    r8a779g0_pfc: group mmc_data1 is a subset of mmc_data8
    r8a779g0_pfc: group mmc_data4 is a subset of mmc_data8
    r8a779g0_pfc: group qspi0_data2 is a subset of qspi0_data4
    r8a779g0_pfc: group qspi1_data2 is a subset of qspi1_data4
    r8a779g0_pfc: reg 0xe6050040 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6058040 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6060840 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6061040 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6061840 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6068040 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6050068 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe605086c can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6058068 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe605886c can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6061068 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6061868 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6068064 can be described with variable-width
reserved fields
    r8a779g0_pfc: reg 0xe6060100: field [0:3] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [4:7] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [8:11] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [14:15] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [18:18] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [20:21] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [24:25] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [27:28] can be described as reserved
    r8a779g0_pfc: reg 0xe6060100: field [31:31] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [0:3] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [4:7] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [8:11] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [13:14] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [17:18] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [21:22] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [24:24] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [27:28] can be described as reserved
    r8a779g0_pfc: reg 0xe6060900: field [30:30] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [0:3] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [4:7] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [8:11] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [12:12] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [14:14] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [16:17] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [20:20] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [22:23] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [27:28] can be described as reserved
    r8a779g0_pfc: reg 0xe6061100: field [31:31] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [0:3] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [4:7] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [8:11] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [12:13] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [14:14] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [17:17] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [19:19] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [22:23] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [26:27] can be described as reserved
    r8a779g0_pfc: reg 0xe6061900: field [30:30] can be described as reserved
    r8a779g0_pfc: reg 0xe6068100: field [0:3] can be described as reserved
    r8a779g0_pfc: reg 0xe6068100: field [4:7] can be described as reserved
    r8a779g0_pfc: reg 0xe6068100: field [8:11] can be described as reserved
    r8a779g0_pfc: reg 0xe6068100: field [12:15] can be described as reserved
    r8a779g0_pfc: reg 0xe6068100: field [16:19] can be described as reserved

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
