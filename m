Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2353A4D9203
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 02:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241881AbiCOBJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 21:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239073AbiCOBJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 21:09:58 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8FF1114B
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:08:47 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id m67so943018ybm.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 18:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YR5556kMG+ExTRaqj/MBxlBJP0ZMBW4VDXaLYIOFmfY=;
        b=LCfGwPi/KdTmIhklJJCb5fFw3KGb3NN376ZIcCl09jwRaQGKI7oP5c1t5iL952/4SP
         EGiNA8OVqe3+M5srBHoiaTd407UbTY5ZDurOOUu974nC6uYoM2KHOC1j5ULftkOXvHm3
         vRWYO71iTvQN67B1zqAkhpkUmlixSLxZyK/8y6obEF0k10bAfZQQgaeFTHRltr0VH8Hp
         VKgg6dsAei3jvoq4/Kx0bHptTcfPGGhVqW+3iiYpDrwxlbr5mxFmgAxI85c/7ePqGmQL
         lPmUa5MQE5MvIrtTMb4BlAQxkBxQ57IELs8R6JsBRGqz+PqUhsj5+r2+YTXf9GTcKmAP
         tMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YR5556kMG+ExTRaqj/MBxlBJP0ZMBW4VDXaLYIOFmfY=;
        b=7zt3pqFB0KtZAijBP4lrLsN+B5ZPsl5uhxe0mFxA0HztvqrgfiCTY7Ofj1piFAYRCt
         bKWiLPFIoN6Z6VM6PkJ67N0WRI+QLTC/T2xPWOBfrj6gPLbRmG8hyX7AzMtLMkTmHpVI
         +VwKreKXHuBL12m/37lJ1IZoMQU4Ue3PB2fPo7J2NKYf2+A+vHPHb1mchyoKSv+uluDb
         OS/aUOu4tJlkudsbrVoKSWX9Fw0K98NxxDW7a1QQbY9gdPzTFjZdz8uXjMOAzds+28NV
         7PF/neKrgytvu9B3kdLQoQM3Lv0rNobBuw+sqLfy7EvUNjYECEDmCD5ODxogLLn11Xpn
         II9A==
X-Gm-Message-State: AOAM5333HI+WM4Gr/tUJbu51dovs5bb0YdC5p+u9IOk1EsJZNg8SpneK
        yTo8enF9aAFAe37lkA6XjxOw9G7FLkrlagFpVQ5vUw==
X-Google-Smtp-Source: ABdhPJxadza2WEGAidP02pySB88+nMpoxMKLDM+kPlLLUiL+IMCq2snsXV4fTV+zKxxhCWyjsx/01XJeKYNS8zytYy0=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr2576664ybi.492.1647306526857; Mon, 14
 Mar 2022 18:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220226204611.1824379-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220226204611.1824379-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:08:36 +0100
Message-ID: <CACRpkdbh37Ssz-A6u-At48J==J6q2rpr16qeK=kAvB5+ZiYP6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8450
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 26, 2022 at 9:46 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Have you updated the bindings first?

I am fine with bindings being fixed in the same patch for this type
of oneliners.

Yours,
Linus Walleij
