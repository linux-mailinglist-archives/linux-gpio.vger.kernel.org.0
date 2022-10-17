Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451206008FE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 10:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiJQIpD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 04:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiJQIow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 04:44:52 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83701CB30
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:44:47 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id w18so23225760ejq.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/OVv+puCl+RQRM9zhQGR8lncVSVca+QHB0gRflBJ//Q=;
        b=i/rUSlQBenPAyfceTiwTGO+jhdjLwzrRYlVwYw9Rw4gSXj4SgptNYbRAkgt3e7Twzn
         FcBl0AvjmtZHC33jiqgiWFpc5YQiKnu5BBtnjcxxPlO8+CkujRDNrTq31P74HCBz8agp
         5u/1chNeuJ1JSJm5mWB/xgZbA2RjdUdxvrKt0UiW7ft14ZS7BeILfawp+UCQvpDy0bX/
         ee4rRi3tISwq9VvSDU/ig1zVdyCF7jshH6jXQQiIx9Fj4R3lIJ7qZWnubzSBWGgkZVZX
         FNXCy/JiRbt5XwfHlDAdajqHfEtw68g17TmzUm8YY/GRTEpwSlr5dqgAGzD89SIqBzh2
         7PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OVv+puCl+RQRM9zhQGR8lncVSVca+QHB0gRflBJ//Q=;
        b=UNojr3csf59Aqzp+yVSHbJVb4nBmN1jHTimj8/QfVfUdvNRmaCcaxzu/lQj8Y0niNI
         M3zQVRUNAIJUUw29fL5mCI/0Ui9+0//XHCTc7qF3pBV2mODvpnxv31a3xFXJikh1sa7E
         9TBRiRjdiBA1Uy39sfmMr4neAw9yqfAndC2szDc2W7cyOUFUJs/+DBy8/MNZVUITVDva
         vweWZ8qyYMh3hBMUssVHtJ1+OY1jr/eSZeSw9UzVktf36g+7mQJlWaghPkvt7QoVLTki
         NteEi0sZAEziv5bDZNTaWu+vhXhm2LfYxyDnxbt+Wiigif4dQssE5xC/oUrS0X36jgu3
         vs/w==
X-Gm-Message-State: ACrzQf1t1Tw00Q7kUUnkp9dZeAA5WKoIfuvdx/Qj0FnqX97ch8haYU/5
        Ruz/NCJj/1PXvxW/fRBzKvRIIwH0XM2i4GBg4c4EGg==
X-Google-Smtp-Source: AMsMyM49b5U7oAouHD2U0NEtNBrMwVZryMS2GdwJ8IX6bhaC6lAzqvCxAyiBmjd0NxrhR38RYKHh9ezr0bAAXY1w1pA=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr7661722ejc.440.1665996284981; Mon, 17
 Oct 2022 01:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220925021258.1492905-1-yangyingliang@huawei.com>
 <CACRpkdZijkQAT84mfP06SgxBjHmrqSbWwctBBA0pvb_1xYzGvA@mail.gmail.com>
 <CACRpkda6kCL-FbEdfu9msXH6xnLn9fLC-q6hcm=e_H_AT_uVEQ@mail.gmail.com> <ddd58293-0b5b-3c34-c396-0a635444410d@huawei.com>
In-Reply-To: <ddd58293-0b5b-3c34-c396-0a635444410d@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 10:44:33 +0200
Message-ID: <CACRpkdafE7Nrv0YwC2z8PWcUxRUyAjXnoTPsPPLAug-g18XBXw@mail.gmail.com>
Subject: Re: [PATCH -next v3] pinctrl: ocelot: add missing destroy_workqueue()
 in error path in ocelot_pinctrl_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, horatiu.vultur@microchip.com,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 6, 2022 at 7:54 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
> On 2022/10/5 3:57, Linus Walleij wrote:
> > On Tue, Oct 4, 2022 at 1:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Sun, Sep 25, 2022 at 4:06 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
> >>
> >>> Using devm_add_action_or_reset() to make workqueue device-managed, so it can be
> >>> destroy whenever the driver is unbound.
> >>>
> >>> Fixes: c297561bc98a ("pinctrl: ocelot: Fix interrupt controller")
> >>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> >>> ---
> >>> v3:
> >>>    Using devm_add_action_or_reset().
> >> Patch applied, after deleting the hunks removing .remove because
> >> that was already gone upstream.
> > Ah, the patch introducing that is in the MFD tree is it not?
> >
> > Either ask Lee to apply it or wait until -rc1 it's no big deal
> > anyway. Remind me in two weeks.
>
> It's OK.
>
> Thanks,
> Yang

I rebased my development on v6.1-rc1 now and applied this patch!

Yours,
Linus Walleij
