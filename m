Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58AD58D1BF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 03:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiHIBab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 21:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiHIBaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 21:30:30 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5039B15A38
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 18:30:29 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso16247620pjo.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Aug 2022 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=g961c/IBMGoQZYVBf0Kv0EkdG3MHdwtOZTv9Sf0/Crs=;
        b=CoD6CHveKl8qJCC4hYWUv/DmVJXeHhSDbZ/uWH0ZDqvzgDodKZ8CJ2L8TZzI+f5DHQ
         ZZaKWZNSNqgR7Gt25ydjbUFxbYj9nBhwRiR6nFfQEkaSRZ8S2veMEA3aF9TABM+xcgvP
         Tvnrp05OdsVTJklsl29L+zGa7fKL6Ob816yOjhdnkCpQP02JOnqbrEoiUOaPkWIv8Y8u
         WMsCHzylQFfm0lnAdZ/05bc2QqI99anc5cPp4IlZwrrTXaHhh3gYK/21PJUGy+nnCvtg
         /U0/4/ZzQGTlcgztU1R8truF2sk6tvM7OIQHmG9dW+s23tk0TZVuIK3abYo0ltNA/M0S
         nP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=g961c/IBMGoQZYVBf0Kv0EkdG3MHdwtOZTv9Sf0/Crs=;
        b=BEL8t6B+9yzm/Im9j2Mpt66ECpZGs44SuT8BbGSwHuLlNwzqqf9OD42mV0gZnLZ5Pc
         rQvmWY9nHkSdRpnQ+4uh4fO6vMkBCpdG3Wl7g+mP3C8WrHheSn4DwEzDKCj+RyBXrn04
         Jmjkh04rsrJmtkYEU2SXloBX2TafNOwF2OuzmWPWcHNNYzg4QFSZKm2i9F512g9A3wiM
         8ZzvX56H66jVQwf7H4Lxl9GcUxCGso44FzwAMXWTJVOoqEZEO7t0hlReOOfiIrb//Vr2
         NXkAWPDYC7l88xU2H9IqfyZqu8e5llB/0JT60fr4ouRviYvSc4Pokx0pXBLJb/1/hPXo
         gqmQ==
X-Gm-Message-State: ACgBeo2KVxraH5HE4I9W9zdkc1TvdMU7t/BiVqHg6MI+c+/LarizqBwK
        PIyVolw6uWcTl1wcVXxxM9c=
X-Google-Smtp-Source: AA6agR6+Q+uapZss0LorkMoSwuTmr4zgFtC69U6ovv1Qth9LoEzAERjymxGXmXDBort0KlgCDqSD2A==
X-Received: by 2002:a17:90a:c38f:b0:1f3:2f26:e7c4 with SMTP id h15-20020a17090ac38f00b001f32f26e7c4mr31358634pjt.124.1660008628729;
        Mon, 08 Aug 2022 18:30:28 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 1-20020a620501000000b0052e37b32618sm9267077pff.132.2022.08.08.18.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 18:30:28 -0700 (PDT)
Date:   Tue, 9 Aug 2022 09:30:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: amd: Use unicode for debugfs output
Message-ID: <YvG4r7AyRMNuEMp7@sol>
References: <YvDlZaydFKN5loe/@kili>
 <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
 <YvE0dvWCX3raEpwy@sol>
 <234a1945-d09b-8d55-a6ae-fd5f7e05943a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <234a1945-d09b-8d55-a6ae-fd5f7e05943a@amd.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 08, 2022 at 01:21:07PM -0500, Limonciello, Mario wrote:
> On 8/8/2022 11:06, Kent Gibson wrote:
> > On Mon, Aug 08, 2022 at 07:33:07AM -0500, Mario Limonciello wrote:
> > > On 8/8/22 05:28, Dan Carpenter wrote:
> > > > Hello Mario Limonciello,
> > > > 
> > > > The patch e8129a076a50: "pinctrl: amd: Use unicode for debugfs
> > > > output" from Jul 22, 2022, leads to the following Smatch static
> > > > checker warning:
> > > > 
> > > > drivers/pinctrl/pinctrl-amd.c:249 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8c'
> > > > drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8e'
> > > > drivers/pinctrl/pinctrl-amd.c:294 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > > > drivers/pinctrl/pinctrl-amd.c:300 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > > > drivers/pinctrl/pinctrl-amd.c:306 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > > > drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> > > > drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> > > > drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> > > > drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> > > > 
> > > > I didn't add this Smatch check and I don't know the rules for this so
> > > > when someone adds something that basically looks sane, I don't report
> > > > it.
> > > > 
> > > 
> > > All of those are expected to me.  If there are rules against this type of
> > > change then we should (unfortunately) revert that patch and the follow on
> > > patch that fixed an unused variable.
> > > 
> > > > 
> > > > drivers/pinctrl/pinctrl-amd.c
> > > >       247                 seq_printf(s, "GPIO bank%d\n", bank);
> > > >       248                 for (; i < pin_num; i++) {
> > > >       249                         seq_printf(s, "📌%d\t", i);
> > > >                                                  ^
> > > > In Gnome this looks like a thumbtack.
> > > 
> > > Right, it's replacing "Pin".
> > 
> > Umm, #?
> 
> I guess if paired with a heading that is a great suggestion, thanks.
> 
> > 
> > > 
> > > > 
> > > > ...
> > > > 
> > > >       279
> > > >       280                         if (pin_reg & BIT(INTERRUPT_MASK_OFF))
> > > >       281                                 interrupt_mask = "-";
> > > >       282                         else
> > > >       283                                 interrupt_mask = "+";
> > > >       284                         seq_printf(s, "int %s (🎭 %s)| active-%s| %s-🔫| ",
> > > > 
> > > > Gnome emojis seem difficult to read.  Theatre masks and a water gun?
> > > 
> > > "Mask" and "Trigger"
> > > 
> > 
> > 🙈 and 💥?
> > 
> > If you would consider seperate symbols for masked and unmasked, rather
> > than appending "-" or "+", then 😷 and 😛.
> > 
> Oh duh.
> 
> Separate symbols makes perfect sense for mask/unmasked.
> I'm not sure that 💥 is any better than 🔫 though.
> 

I was looking for something more visually distinctive - it is hard to
tell what the pistol is.  I was also thinking "spark" so ⚡, but again
the collision symbol looked more distinctive to me.  YMMV.

You are after level triggered and edge triggered, right?
So "-💥" and "/💥"?

> > > > 
> > > >       285                                    interrupt_enable,
> > > >       286                                    interrupt_mask,
> > > >       287                                    active_level,
> > > > --> 288                                    level_trig);
> > > >       289
> > > >       290                         if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
> > > >       291                                 wake_cntrl0 = "+";
> > > >       292                         else
> > > >       293                                 wake_cntrl0 = "∅";
> > > >       294                         seq_printf(s, "S0i3 🌅 %s| ", wake_cntrl0);
> > > > 
> > > > 
> > > > Sunrise emoji?
> > > 
> > > "S0i3 Wakeup"
> > > 
> > 
> > Somehow ⏰ makes more sense here to me.
> 
> In this context it feels like a timer though, not sure on this one.
> 

Well it is an alarm, which is why it is inappropriate for the debounce,
as that is more of a filter.

With an alarm clock you will wake, else you will continue to sleep.

> > And if you were to use separate symbols then 😴 for wake disabled?
> > 
> > > > 
> > > > ...
> > > > 
> > > >       369                         snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
> > > >       370                         seq_printf(s, "debounce %s (⏰ %sus)| ", debounce_enable, debounce_value);
> > > > 
> > > > Alarm clock.
> > > 
> > > "Debounce time"
> > > 
> > 
> > 🕑 or ⏲ or nothing?
> > 
> > Sorry - couldn't resist chipping in - poor old dan.
> > 
> > Cheers,
> > Kent.
> > 
> 
> Thanks for your suggestions.  I'll work out something later this week to
> change to some of them and leave you a Suggested-by tag in the commit.
> 

No problem - just my 2¢, plus it was the highlight of the day 😂.

Cheers,
Kent.

> > 
> > > > 
> > > >       371                         seq_printf(s, " 0x%x\n", pin_reg);
> > > >       372                 }
> > > >       373         }
> > > >       374 }
> > > > 
> > > > regards,
> > > > dan carpenter
> > > 
> > > Yeah all of those emoji are the ones I intended.  Details above.  The point
> > > of this patch was to shrink the length of the line in debugfs output into
> > > something more manageable that it didn't need to be imported into a CSV
> > > processor to look at the data.  It can be used with something like "less"
> > > now.
> > > 
> > > If you (or anyone else) has a better proposal for any of those symbols I'm
> > > happy to make a change.  My goal remains to keep the lines ultra short
> > > though.
> 
