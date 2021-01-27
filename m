Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF923052C9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 07:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbhA0GDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 01:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhA0FsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 00:48:07 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903ECC061786
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 21:46:18 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id e19so478927pfh.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 21:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=dQTVty13FWkU7w1uhlDVsfbx9oRCoQ1u3obrytMgFvo=;
        b=fp3hWsuxXsv3uG2o797K2QBX244/CQ5VJLjvF0UzxjXQtfGfry2l0bQUaP47KcW7DF
         uSr9KWKPd/MHu2urs2W6SKY/nejY128EfaGZXyuyU6CYm+LEDDxbopM6RG4skTE2B7wf
         26av1b8qyd1H051MYEqOdQOogb4emT0baXgthDwCEC0UK0KZ1qy9kayrdhwJpbUaqFM4
         Xy6PkReARLb7QsaCop4gfo8jMpNH2HRFGrbp3qOinqa5hE53QATYyGhJhVNcL9y3at0j
         bzTR6/wYW86VqIJfONG7hWAMNYD+Dd+xNEKwq7WWiZY6KsaY2O1ayvdocHOIzAvw/s3m
         nIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=dQTVty13FWkU7w1uhlDVsfbx9oRCoQ1u3obrytMgFvo=;
        b=df3/RjwowHirohTyna7/JFZJ5Zpu8YLlLwG+KIaBpZfOoKQJsRijcMvSCTnMuG4qp7
         fXmvrpdIzpNHb1XqzG6jYSbZvyIBviFREN93ymkrWDIXWdex60e+1fejzHf6vndbbEmo
         j+DdZ6Fdnn2NFksRkMEyEasp7VlR0MSWiaeH2IkU98+REwYk+a/8JkoUOFaXjQfrN4fb
         Rpf5k71q+WwYM6EdhlYxCxQ27OkS2UvS22e43beo3Q1r8R2w+9WgIaU4Tp2yRS93H1+R
         kdT16SmvUGJHXFpH/7wL4pugwtPGbf+yH6LmPkEzUeMwmVLgV6U5Paq+5IELjlMdg0g/
         mLKQ==
X-Gm-Message-State: AOAM532X1wR/cAKeG1XRCJEvgBqP4tIL9VD6/ugxknbAuCu1buB7jQ6/
        JMn6fkGH3n1wDms3yGiflV3mOg==
X-Google-Smtp-Source: ABdhPJwQPp8sa/gDYpvmRptSsHpV/LmYDfv2OiMy5FTeSLrwIgRYhHIe+HQu2rEh6ylL00Kyd+rZXg==
X-Received: by 2002:a65:6484:: with SMTP id e4mr9521885pgv.401.1611726377946;
        Tue, 26 Jan 2021 21:46:17 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i132sm884744pfe.10.2021.01.26.21.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 21:46:17 -0800 (PST)
Date:   Tue, 26 Jan 2021 21:46:17 -0800 (PST)
X-Google-Original-Date: Tue, 26 Jan 2021 21:44:15 PST (-0800)
Subject:     Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
In-Reply-To: <BL0PR04MB6514540BF8CC35309C376394E7BF0@BL0PR04MB6514.namprd04.prod.outlook.com>
CC:     linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        linux-gpio@vger.kernel.org, seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-1e63addb-f00d-49c7-be01-995d5a403a43@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Jan 2021 22:19:51 PST (-0800), Damien Le Moal wrote:
> On 2021/01/23 13:15, Palmer Dabbelt wrote:
>> On Thu, 21 Jan 2021 00:32:38 PST (-0800), Damien Le Moal wrote:
>>>> On 2021/01/21 17:25, Linus Walleij wrote:
>>>> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>>>> On 2021/01/21 3:21, Palmer Dabbelt wrote:
>>>>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
>>>>>>> Hi Damien,
>>>>>>>
>>>>>>> this looks all right to me.
>>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>>>
>>>>>>> Shall I apply just this one patch to the pinctrl tree?
>>>>>>
>>>>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
>>>>>> take those as well and I'll drop them?  I don't generally like to drop stuff
>>>>>> from for-next, but that's probably better than having everything all mixed up.
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
>>>>>>
>>>>>>> I think the line that touches arch/*/Kconfig should be dropped
>>>>>>> then, that better go to the SoC tree.
>>>>>>
>>>>>> I'm OK with you taking them along with my Ack, but if you don't want to that's
>>>>>> fine.  Just LMK
>>>>>>
>>>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>>>
>>>>> Linus,
>>>>>
>>>>> Please let me know which way you want to proceed. If you want to take the patch,
>>>>> I will resend without the Kconfig change and move that change to another patch.
>>>>
>>>> It's fine to proceed as is, since Palmer already applied the bindings to
>>>> his tree, just apply the pinctrl driver there as well. I don't see any
>>>> risk of collisions in the tree.
>>>
>>> Sounds good. Thanks !
>> 
>> I don't see an actual Ack here, but I'm OK taking it.  IIRC there were some
>> issues with the DT stuff as well, I don't remember if they got resolved or if I
>> should be expecting a v14.
>
> Palmer,
> 
> Linus sent a reviewed-by tag (see above).
> 
> For the dt-bindings problems, the v13 that I sent already addresses all make
> dtbs_check warning and also addresses Rob's comments. The v13 dt-bindings
> patches need review, as well as the clk driver patch. Will ping Stephen about
> that one.
> I will send a v14 only if there are more comments that need to be addressed.

Ah, thanks.  This is on for-next.  I'll look at the rest, but probably not
tonight as it's a bit late here.
