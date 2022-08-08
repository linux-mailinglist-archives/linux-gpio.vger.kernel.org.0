Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A65358CBD4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 18:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbiHHQGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 12:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbiHHQGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 12:06:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E879626E2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 09:06:19 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so8218644pjm.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Aug 2022 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=1NBWmJg8KfqL9gHbV0UZnyUsmBydxAdF5lO2CwI5Bck=;
        b=fzZC59aO80e745Z2K4424vDUBZdWnrZvZPC6veewzuJmvDf8s6mCmL+JgaEemuJX4u
         iWsrsokPtnQ/NvfHwCiuDaEUmcbgswAzCnCHVH44Jk0PhREK3gpUDhKWAdNPUKZ39b1B
         55g5DMdbJPmZ7nsjUjSNzv+nO7lF1Uj0IxSpvLB55XXYNBBr7cZGHgKaPl5aqWX0RVJ0
         ciNR1AsZw/6PjFAwrk2hBEq37auepDI5kT7LTwllaMgPOvooJ3L34mUCk/tXKEtfxpVA
         NNS0CSTREKuMFv6ngwzEcxxlVkKa2f7RF6093FiKtvTGEEhbshZ4jKQqAzjDpzC9Szcq
         dBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=1NBWmJg8KfqL9gHbV0UZnyUsmBydxAdF5lO2CwI5Bck=;
        b=YfWiU24ynCL6WlkVTChUooRInxWtIl3JyLjO8ko859aLs+bH7HcFj6kgK9/Y3raW3b
         ignbnNfH1ZTZ239i30FEN8RVMWDHPlOI63JgHSTTOH81Dy7cGC4iPmcU/SGs8gyCxNT2
         KFEY29FBnXRIvuMyK7zj3nDuw8M840FzJVh87YuAl+wofI2d0Zjw+jN8UEdfe09a0nbH
         EpmCsECZ6TFi+1ZlVzNH/7M3XoB9uCSDx7EVo8t4btHsRVS4nSb0arqJtOD0fAv8rAIL
         kdWnwJgsuWavr76pX8pm0N3WeF5ad1U69ww3+oSY421MpwYUfLrnQJr3I2hTy9mFTS0G
         CpJw==
X-Gm-Message-State: ACgBeo3+E1DeCdiDx7MUs+AG1OIuohg2XARVNG/mI5A5L1RRNpcynWOd
        GjQCSiiHeEBLjbF0Kog3PRM=
X-Google-Smtp-Source: AA6agR6L5xkm/0l1ysLSqJIfIEM7U7vGl2i91Gs/4Bx5/3CULhEZy1xuLITCVDTY69nzWSYB+joS2Q==
X-Received: by 2002:a17:902:e5c9:b0:16e:f3b6:ddc4 with SMTP id u9-20020a170902e5c900b0016ef3b6ddc4mr18856653plf.30.1659974779392;
        Mon, 08 Aug 2022 09:06:19 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e17-20020a63e011000000b0041a8f882e5bsm6543103pgh.42.2022.08.08.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 09:06:18 -0700 (PDT)
Date:   Tue, 9 Aug 2022 00:06:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: amd: Use unicode for debugfs output
Message-ID: <YvE0dvWCX3raEpwy@sol>
References: <YvDlZaydFKN5loe/@kili>
 <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 08, 2022 at 07:33:07AM -0500, Mario Limonciello wrote:
> On 8/8/22 05:28, Dan Carpenter wrote:
> > Hello Mario Limonciello,
> > 
> > The patch e8129a076a50: "pinctrl: amd: Use unicode for debugfs
> > output" from Jul 22, 2022, leads to the following Smatch static
> > checker warning:
> > 
> > drivers/pinctrl/pinctrl-amd.c:249 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8c'
> > drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8e'
> > drivers/pinctrl/pinctrl-amd.c:294 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > drivers/pinctrl/pinctrl-amd.c:300 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > drivers/pinctrl/pinctrl-amd.c:306 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> > drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> > drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> > drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> > drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> > 
> > I didn't add this Smatch check and I don't know the rules for this so
> > when someone adds something that basically looks sane, I don't report
> > it.
> > 
> 
> All of those are expected to me.  If there are rules against this type of
> change then we should (unfortunately) revert that patch and the follow on
> patch that fixed an unused variable.
> 
> > 
> > drivers/pinctrl/pinctrl-amd.c
> >      247                 seq_printf(s, "GPIO bank%d\n", bank);
> >      248                 for (; i < pin_num; i++) {
> >      249                         seq_printf(s, "📌%d\t", i);
> >                                                 ^
> > In Gnome this looks like a thumbtack.
> 
> Right, it's replacing "Pin".

Umm, #?

> 
> > 
> > ...
> > 
> >      279
> >      280                         if (pin_reg & BIT(INTERRUPT_MASK_OFF))
> >      281                                 interrupt_mask = "-";
> >      282                         else
> >      283                                 interrupt_mask = "+";
> >      284                         seq_printf(s, "int %s (🎭 %s)| active-%s| %s-🔫| ",
> > 
> > Gnome emojis seem difficult to read.  Theatre masks and a water gun?
> 
> "Mask" and "Trigger"
> 

🙈 and 💥?

If you would consider seperate symbols for masked and unmasked, rather
than appending "-" or "+", then 😷 and 😛.

> > 
> >      285                                    interrupt_enable,
> >      286                                    interrupt_mask,
> >      287                                    active_level,
> > --> 288                                    level_trig);
> >      289
> >      290                         if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
> >      291                                 wake_cntrl0 = "+";
> >      292                         else
> >      293                                 wake_cntrl0 = "∅";
> >      294                         seq_printf(s, "S0i3 🌅 %s| ", wake_cntrl0);
> > 
> > 
> > Sunrise emoji?
> 
> "S0i3 Wakeup"
> 

Somehow ⏰ makes more sense here to me.
And if you were to use separate symbols then 😴 for wake disabled?

> > 
> > ...
> > 
> >      369                         snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
> >      370                         seq_printf(s, "debounce %s (⏰ %sus)| ", debounce_enable, debounce_value);
> > 
> > Alarm clock.
> 
> "Debounce time"
> 

🕑 or ⏲ or nothing?

Sorry - couldn't resist chipping in - poor old dan.

Cheers,
Kent.


> > 
> >      371                         seq_printf(s, " 0x%x\n", pin_reg);
> >      372                 }
> >      373         }
> >      374 }
> > 
> > regards,
> > dan carpenter
> 
> Yeah all of those emoji are the ones I intended.  Details above.  The point
> of this patch was to shrink the length of the line in debugfs output into
> something more manageable that it didn't need to be imported into a CSV
> processor to look at the data.  It can be used with something like "less"
> now.
> 
> If you (or anyone else) has a better proposal for any of those symbols I'm
> happy to make a change.  My goal remains to keep the lines ultra short
> though.
