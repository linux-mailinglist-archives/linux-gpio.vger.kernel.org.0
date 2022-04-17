Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097C0504A1F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 01:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbiDQXpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Apr 2022 19:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbiDQXpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Apr 2022 19:45:34 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2F813EBE
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:42:57 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id t67so23170369ybi.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Le1W4emwmC8SAm7xHcpciZnFzcfo5oYtjJ98cu6Km6I=;
        b=DfXFYpXmszgBq535LnqMbUGOAhbJ1lybwvoIEPYj42FDvwilY5mQXELmsLtBEnX0l3
         3rOTpuwSg8i4vX0KIicaioTF8Vq0/tey7SKCBPu+sNEhYaLfreG1Br6+0vL+7izS4YMf
         1SoJdDHhk3VGIyBXajk2RRMM+f7OL+vBA8hEE0zOu3xU/z3xtWTKnPoeVbDvqer7xd7A
         98V4VV0JK17y+S/Z6VLtvbGD3RpnW7a+UvMuFUXHBPbPMcDTS0NeoLUWHF+YzTbopZLC
         FA/a/SEvcs1myAs+prKPSbvMVVFDu9EG6MbJgeyiaR2oo7r50fXe3MNnSrNuR+Q/wSDl
         c8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Le1W4emwmC8SAm7xHcpciZnFzcfo5oYtjJ98cu6Km6I=;
        b=PIryDqhlEeT661jo6Qrfc7/99obEZm26xtU/N6R2lBhcVBGsFAVCOtTj087uxvE6Su
         Hc9jlQx30ydPPSL7kEqSyxvJNIslBz2u8C8En8jDMi7ZyVCB/eW4oD2O7x/RojpdUDkv
         gBfeXvuOBlAincVqT5Svbc116Z5Ix80la4wgNscmdNNm5SnPz62bJJ2MiqYpJM1w8LzG
         mLgXQX6+pl+rkzwkAVyziNXZFwuOUy1s4LWdHZZ8TS1F4RyftasNhDMnLLLk9HHgb63p
         1ge9YD7VllwH77AakR6iUxJrghlyDza7XhqmBzFxqM9jp62RcWxiQW+RTAM+yt/+oPes
         A3YA==
X-Gm-Message-State: AOAM5323b48kEWB8ACgdkhZUhXFRTgSLORRPYI8tWJgP2R6m2/S8dts3
        9zdUQLluw4OEkx63aAuzTuLar7EOc1lxFy33v+QrEw==
X-Google-Smtp-Source: ABdhPJwtcjuDUl0/1lhkF30uD62jYzzr8ofEalJ5SS2ebSGJfVM87d/e3g3rnjrSOYRrOwPONcc3UtP80VEZPfT/QL4=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr8143618ybb.514.1650238976760; Sun, 17
 Apr 2022 16:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133318.99406-1-luca.weiss@fairphone.com> <20220321133318.99406-5-luca.weiss@fairphone.com>
In-Reply-To: <20220321133318.99406-5-luca.weiss@fairphone.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:42:45 +0200
Message-ID: <CACRpkdbuLVS=+1GM77nGD7Aq0haOOEbFi-0gO-u63EaJwpxg2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: qcom: sm6350: fix order of UFS & SDC pins
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 21, 2022 at 2:33 PM Luca Weiss <luca.weiss@fairphone.com> wrote:

> In other places the SDC and UFS pins have been swapped but this was
> missed in the PINCTRL_PIN definitions. Fix that.
>
> Fixes: 7d74b55afd27 ("pinctrl: qcom: Add SM6350 pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - nothing

Since no changes I assume it was OK I applied v1.

Yours,
Linus Walleij
