Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B766D5F49F3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 21:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJDT6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 15:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJDT6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 15:58:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B7A69F58
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 12:58:10 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id qx23so13089862ejb.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 12:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dguxz/Ezdu52FMs/VeEtnrfjn86z366LIxkOOBNVZZw=;
        b=wGoTNPdbibA40hw/Gip8cARqKnr3cokUnOVXBSFFmhfmIsGvVIyoFLTMdfBJfLEUzs
         g/CWopjmJiIy3IjjUdxk9wOpgnduT5ICx387b7NDe0X273MHtArOfEnRTmNf1ON8NLN6
         wiWpr7wf7ZrHhejyn6VRskLGS/dmmG7XPAWWfYPuKZc2/HKPJeRijIF1rwtiSo7J2y0y
         vILm0/NooyR8An2Yxs4hNcDpJinWxDlpYxKyBwbPbuCWqDLWgPtYHOFXJcZGJ8R9vF/L
         BGRorq1xUOY76dGXP4M2XZNrz2LfLUszvyibPg8Ox0nWsC2np0/LUI8eAY/8XfixAMuD
         sXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dguxz/Ezdu52FMs/VeEtnrfjn86z366LIxkOOBNVZZw=;
        b=EmWrZZreR+L/ZLYnHjhBdu8LFocmjQdpzCCQkgCXMdzumI4t87VFY2SxueBS0ZqZx4
         1EN5w+4omBoxelqtYtoWdWlJahgwzjgu3Rc7l9WVa3iEC3pGKzBSmoInz+ShzmaObyFC
         LBuSoQfnu2Ga3CepeikNltCF5BqMAEZyR6CRZnOIeco+mAkbgXTkpQ2i6ru2Wzv6fZSE
         8e0leQTBMY5xbnuug5/cZQ9crz5byWUotGSyRhk3JmK+Tfh4enRDjTX93Em6zqmEk1ea
         IFEooGXcYMYW29Va1c0u0vXIaT8rOhH/ZQIs+mbd7Oe1igxwI8cRpVFwChnMQRWcUIRH
         MoKA==
X-Gm-Message-State: ACrzQf3eHLVdWDYY3ZOfx7tAO9AWEwc2cHAS0/94aF7kRJFSXlgTicha
        IUDepuoYv7J0o7i5QEs0Hz2NpUmx+GvY3R/0ZHsU8g9oa9ZG0A==
X-Google-Smtp-Source: AMsMyM50nurAIJk16mylb/lVVdRmBZHVQM0yRvlYzbMPxncfnaAmgDZ62Ts57Pqj3A2usDwHEdD21wmKJHfxnzjLmqk=
X-Received: by 2002:a17:907:7b9e:b0:783:10cb:2826 with SMTP id
 ne30-20020a1709077b9e00b0078310cb2826mr21077478ejc.208.1664913489372; Tue, 04
 Oct 2022 12:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220925021258.1492905-1-yangyingliang@huawei.com> <CACRpkdZijkQAT84mfP06SgxBjHmrqSbWwctBBA0pvb_1xYzGvA@mail.gmail.com>
In-Reply-To: <CACRpkdZijkQAT84mfP06SgxBjHmrqSbWwctBBA0pvb_1xYzGvA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 21:57:58 +0200
Message-ID: <CACRpkda6kCL-FbEdfu9msXH6xnLn9fLC-q6hcm=e_H_AT_uVEQ@mail.gmail.com>
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

On Tue, Oct 4, 2022 at 1:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Sep 25, 2022 at 4:06 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> > Using devm_add_action_or_reset() to make workqueue device-managed, so it can be
> > destroy whenever the driver is unbound.
> >
> > Fixes: c297561bc98a ("pinctrl: ocelot: Fix interrupt controller")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> > v3:
> >   Using devm_add_action_or_reset().
>
> Patch applied, after deleting the hunks removing .remove because
> that was already gone upstream.

Ah, the patch introducing that is in the MFD tree is it not?

Either ask Lee to apply it or wait until -rc1 it's no big deal
anyway. Remind me in two weeks.

Yours,
Linus Walleij
