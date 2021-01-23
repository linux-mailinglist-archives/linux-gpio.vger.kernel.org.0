Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E883012F6
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 05:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbhAWEQP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 23:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbhAWEQN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 23:16:13 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DB0C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 20:15:33 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id g15so5127807pjd.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 20:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=xCKUtFB5AUq1zD0repi+CXyQ+OLFoMfHVfJO3G4+2+M=;
        b=vhq+YrJ90PBFBtx19eu201m4T9vp+sq202+YYsBMRwpVsdmz9sAHvh5e4iWIZLrCi/
         T5jU1ZVCKGCbTiBBkFm5CrdzfXmCczvz6OzGsP9OOJxnJum715qaHP8TpRDE0hAqYEe/
         m2+ScBGUv77pHKdYIPYbf9L4gm65HtiVtnLEVnILFNHNgBPhGGUr0U80d0E5WMGGt91m
         QHqsAiytER9cg4Xs0HbMvhdvKxv/Tdsk9LIZVmoosQgfQVkAKwVA9WVnp2urS0m9cIED
         2FKKyANCVDgSKS5xJvlQyWLemc+a9JjdbF+7eyN0Dtsy6xXFIeIfYq03P2W5g/sRB4cq
         6gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=xCKUtFB5AUq1zD0repi+CXyQ+OLFoMfHVfJO3G4+2+M=;
        b=srtCM2E9dXCCNaDLQWornxjwRyNK0Fg/55fTfGz0R0X8izqF4ads9EXG32bywDdX8+
         rNw2Q2KoJWyXApSa2oR4o8L66ycN3SVQeaNdj3LCQFGOyac0cJQ0uy6tyJ+K9I6qVBnS
         lWxUEVsf/WjotS/Z4vvEni/jEqL9Mq2FrSUXr0V548+u2QhjLeLtOuX41CJW5zPvfo82
         CXuAKuCxJanrwdffgyydtND+MYM4BTtZn43oJLzSEdKwSTE3hjHehAR/sRfyH1YuW2/w
         1TWPZ/Bl96qTu5tuYwJPqmLO5KBOdAjtLkwytiGROGx+IGqx/2TH42Say/kX7a3nJm+I
         VR0g==
X-Gm-Message-State: AOAM530L56aCQXDHgNZr71Cn8YNxy5pjzLPpDsgPbho3ShidqWMNSZGB
        LEBLqIeApH6f0IjAMCwk/W0Jcg==
X-Google-Smtp-Source: ABdhPJxTcn8px+6zfNoLrgMT8aWf+N1AzTljJsLW4aBD2WfsXLyTmuDDz3l0oVnr1BOXYvAUeiSxBg==
X-Received: by 2002:a17:90a:fa18:: with SMTP id cm24mr9179849pjb.180.1611375333088;
        Fri, 22 Jan 2021 20:15:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id c62sm9775252pfa.116.2021.01.22.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 20:15:31 -0800 (PST)
Date:   Fri, 22 Jan 2021 20:15:31 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 20:15:30 PST (-0800)
Subject:     Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
In-Reply-To: <BL0PR04MB6514439CE158BAB4253D8903E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
CC:     linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        linux-gpio@vger.kernel.org, seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-4406eaf7-474a-41a6-8a23-8d75e79c8521@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Jan 2021 00:32:38 PST (-0800), Damien Le Moal wrote:
>> On 2021/01/21 17:25, Linus Walleij wrote:
>> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>> On 2021/01/21 3:21, Palmer Dabbelt wrote:
>>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
>>>>> Hi Damien,
>>>>>
>>>>> this looks all right to me.
>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>
>>>>> Shall I apply just this one patch to the pinctrl tree?
>>>>
>>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
>>>> take those as well and I'll drop them?  I don't generally like to drop stuff
>>>> from for-next, but that's probably better than having everything all mixed up.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
>>>>
>>>>> I think the line that touches arch/*/Kconfig should be dropped
>>>>> then, that better go to the SoC tree.
>>>>
>>>> I'm OK with you taking them along with my Ack, but if you don't want to that's
>>>> fine.  Just LMK
>>>>
>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>
>>> Linus,
>>>
>>> Please let me know which way you want to proceed. If you want to take the patch,
>>> I will resend without the Kconfig change and move that change to another patch.
>> 
>> It's fine to proceed as is, since Palmer already applied the bindings to
>> his tree, just apply the pinctrl driver there as well. I don't see any
>> risk of collisions in the tree.
>
> Sounds good. Thanks !

I don't see an actual Ack here, but I'm OK taking it.  IIRC there were some
issues with the DT stuff as well, I don't remember if they got resolved or if I
should be expecting a v14.

>
>> 
>> Yours,
>> Linus Walleij
>> 


-- 
Damien Le Moal
Western Digital Research

