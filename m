Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54F504A19
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 01:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbiDQXll (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Apr 2022 19:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiDQXll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Apr 2022 19:41:41 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033DE11175
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:39:04 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ef5380669cso109637367b3.9
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=isOzx1R652BQKfPh1GBlAV/+AdRMp3oAEWnCwdaM+Xk=;
        b=PXZztnDb00ziKsLwWf14n+fHjb4dFSSNvSMTBJZPC0WIRNELLhjhvjOwzprf9w0Sv7
         Pogl0pMtNqeH7Llbuh9649waAVX54WV7T1xjW4y6mRo92o6xhYWRYLA21yfF6qxzuOrb
         RHJs1L1Gromo2CU6PRpuFSa0KVfY7Ks1d8m7zjdyEuOu0afjpn0TZ8BoExd0HzCZZsY1
         lg9iHb3v+iswCYjML0Ly86C9+orQkiEKCAyjPlHvKH5iP6fdki207krmb+rZWi3HO687
         mWvL6QoXPxyiInYJWN16fJIrxBpmLyLgFzu1bnHAQ464kP00Tq4AtQPetWax0gClnSUY
         4LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=isOzx1R652BQKfPh1GBlAV/+AdRMp3oAEWnCwdaM+Xk=;
        b=vaqPVH+Dmra3mwBP8mHXlhU7OEUiHvB7PtD7l1X9xZVdgoQ1df7x54EuTzT7/Nvwp6
         Yq5zOBVBh4JzRCbQ+sKkgRnjUWZzEjbh9Yle/fLlRZqQ8HeqlTnO/OJ0ai+FX5b26oFM
         nK8G1jwIgsJw5/AB5Au+6colK7EhmORpJoIMD+ryV8YU/DCf6UYh29NFXUHD8GWt0YAv
         HIR1UvByu3qnR8n080OjhBnpDzY/pn3r5LeELV31gmEDXJOVTggbevIBDy6PXEoK++Na
         YUWhO1nNzWXtIpKL9edRbikpnIhEymKK1ar8KYbtRvURNzhELrB5ad1ySdg/es6R3gMx
         8OKg==
X-Gm-Message-State: AOAM5316JGSNA4CfcoG5sEiU6yDf1pXrCiw53YtZsvV8oHD6ATXAwBOu
        DTBq5qrU+6LhYB5wuv+1nRBnhWdbuJlgWgYj07L1bQ==
X-Google-Smtp-Source: ABdhPJxVj6FpioinHECp0I834flQrRt0BquG2Ag/8/rIvLz+cbcCGDEtVItw69+sfnj9525EJeZXGIG9JTP5VRIzvq0=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr8642749ywh.140.1650238743295; Sun, 17
 Apr 2022 16:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220318183004.858707-1-luca.weiss@fairphone.com> <20220318183004.858707-5-luca.weiss@fairphone.com>
In-Reply-To: <20220318183004.858707-5-luca.weiss@fairphone.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:38:52 +0200
Message-ID: <CACRpkdZN7chCaG7aNsrKbAnmOBo05fCpKpacWb2tt3Z7VrL9Sg@mail.gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: qcom: sm6350: fix order of UFS & SDC pins
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 7:30 PM Luca Weiss <luca.weiss@fairphone.com> wrote:

> In other places the SDC and UFS pins have been swapped but this was
> missed in the PINCTRL_PIN definitions. Fix that.
>
> Fixes: 7d74b55afd27 ("pinctrl: qcom: Add SM6350 pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied for fixes.

Yours,
Linus Walleij
