Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391856241EC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 13:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiKJMGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 07:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiKJMGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 07:06:36 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340E471F05
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 04:06:35 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id l11so2757354edb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MWHu8Og1TN4/IlsXYrNslghO2l0tEejx0MLyLd+JvI4=;
        b=W8ePiUO2kWOW1N0Ucu/yHDU8XdaynF4GHHYtBfzCYYCgYzXrwdmcQkRmTGbQJFS+4X
         UREXvaNh4cREzN6z3b42IHDHxB1ERjQE/Je4t2LTpP0cAKarYnzzlnqKhn2dewhg28E7
         t7f/sCTZOtbCxp/9dkmRnF3AgM7ep2wyI4P0agcBAE51rTRPY6L0C53k/Uj8Z3cAwqaJ
         D5MNMCzpNNaPFs6Whoe4q8Mga4dTXHBEPzy2E5ujaQMrBUMSRnOI5sn5rlOcbtq960T7
         MV+oAJrg6mgOyeGOXPt0kyvbMToQQ7txm/IJ9aqgba7sSfi/YzIoZdLLM7gOrw3iPhdE
         ofjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWHu8Og1TN4/IlsXYrNslghO2l0tEejx0MLyLd+JvI4=;
        b=olLVdWpltDtGEsZnA4VyejSOTAVH2bmoWT+OnD/OfjkLWkbTgGEf+7ngcHd9bjBcRi
         A6u1+/jgNBrxDF4TDQhHStS5kpKRnsIhuJZczkckLLx3pqmYfxcDs8IuQH8JPlFHCiNb
         oGIFLM3Qp3Fn4A19N38RxF2mum0CyPj/Hy5oFl2lEvMJspXk63mnKKj3VHETPtGtGqJe
         cuYXSYK3siPV6p+XuHoPwSC1ZXpAAf0ITRxsCJ1sK+MAnYYZKTPoBVCZ7lX3iAWNQH5S
         mEhZx4CFVZ9yhvZ5VCEp6qvmPUbKE/pZZ7mAw3zXQuyLd+8eBQ+Nl20O/2T9pPdMrwtf
         aYOQ==
X-Gm-Message-State: ACrzQf0qwwsp0VoakZW7jWvbiGC/0Ga66zct6KG2VTOE+wOArpXb+bzM
        RKe/bkaL5eSI5x70JwdE6ZeH5trER5X58OwRdZrkdA==
X-Google-Smtp-Source: AMsMyM6hKpe3mhoANx9tDlJYMetAuEi6pWwyk9O8oZrg4cgzCa3MPXqsA7gkGl/2PARUn203NHmhKlnT0paWt4+4eOI=
X-Received: by 2002:a05:6402:4002:b0:463:bc31:2604 with SMTP id
 d2-20020a056402400200b00463bc312604mr2142009eda.32.1668081993733; Thu, 10 Nov
 2022 04:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20221110082056.2014898-1-zengheng4@huawei.com>
 <CACRpkdZQiTzLiP5ObRxp6bU=jFnJUFKS6_itSDwtn41x9-2+mQ@mail.gmail.com> <4ca04229-f2ab-7696-1719-5b24a83b4368@huawei.com>
In-Reply-To: <4ca04229-f2ab-7696-1719-5b24a83b4368@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 13:06:22 +0100
Message-ID: <CACRpkdZp7xonS=-z=QVu1ppaaVM-oP0tiNyHV4S4YOjAVq_p_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     dong.aisheng@linaro.org, swarren@wwwdotorg.org,
        linux-gpio@vger.kernel.org, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 1:05 PM Zeng Heng <zengheng4@huawei.com> wrote:
> On 2022/11/10 19:27, Linus Walleij wrote:
> > On Thu, Nov 10, 2022 at 9:22 AM Zeng Heng <zengheng4@huawei.com> wrote:
> >
> >> Here is the BUG report by KASAN about null pointer dereference:
> >>
> >> BUG: KASAN: null-ptr-deref in strcmp+0x2e/0x50
> >> Read of size 1 at addr 0000000000000000 by task python3/2640
> >> Call Trace:
> >>   strcmp
> >>   __of_find_property
> >>   of_find_property
> >>   pinctrl_dt_to_map
> >>
> >> kasprintf() would return NULL pointer when kmalloc() fail to allocate.
> >> So directly return ENOMEM, if kasprintf() return NULL pointer.
> >>
> >> Fixes: 57291ce295c0 ("pinctrl: core device tree mapping table parsing support")
> >> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > Patch applied for fixes.
> >
> > Interesting that you managed to locate this using *kasan* of all
> > things, it kind of requires that you manage to run out of memory
> > exactly at this time...
> >
> > Yours,
> > Linus Walleij
>
> yes, actually it runs with *kasan* & companied with fault-inject into
> every single time.

Aha! That's a neat trick. Thanks for doing this!

Yours,
Linus Walleij
