Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB6D52D30A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 14:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbiESMwO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 08:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbiESMwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 08:52:13 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D5FA7E23
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 05:52:11 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id d137so8801597ybc.13
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eYHvw/JfgdFF38mVmeyZqvOLi39VF/O3hfS7MsPbrq8=;
        b=fjXRUPtsRIN/w510M8vc9HtNrrYEKR0jfxnFcBGW6DJhVOLuBww01ZkeIoKqqFFGV5
         Mbt3UKwMkev3bNDjbMeP+7J4dsqOZfJ2g0EdZAUfrhH35t0Rohuf7J+TKllHUCmKTeOG
         v5uZWL9qsUNKsYujTwQ5JRhIqtTHC/TG7ztG78QKRdvQZHewOhLORlit3nDcbiDOmfeY
         VrGVE1WKq5kwygGjcQg5fNmK0uz0SelDOSED9QaOnhjNtXboZwVGwA0uxijoUJANWbGk
         6rfQ/9o+agfSEk1SXUK4MGXc2Wh2QkGCfEaTSMJkKEo3h3GX6WmVtMcNIJJ7wq29dbFh
         b8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYHvw/JfgdFF38mVmeyZqvOLi39VF/O3hfS7MsPbrq8=;
        b=sv1pdhkGzP0JVUDbYmpFvvgbGqe3N/Jt2rRQeN/Y8mxvn/kQH/mPq1+2Kl9+tX4NPr
         Usblr3inC23qOo/DtsHUT2E8tx5S1rHMccUVho7Setw5LdhSuIu2TXPeuyUzpds7NSvl
         VHBzzo28mniRXiN8Zv97awC/LMhPshnPB+M5QV4ezcpKPxOUWRDJaNnJU8LLdsfeL0Hp
         Xk+XAn49bZOJ7b/bgnHDcLPgWT/SoxlT3zthoWaOJOBZrvw15j3iDn0qw/THb5WdkQFS
         Gl4cJg85EgnMT0jr/CmK9U4mEPT6bi9q1yDFgltkw7f/1oHH5OCT2CEbEmdykO52uUoY
         0fEQ==
X-Gm-Message-State: AOAM530ad5X+wlzKK+Af/o/ayVe9O33DInQtq6y9cp/JfujOfUBbY3Xa
        cJKmEs30yMBeODdIHEddRk1W2UADy0xcAzl3g2sGRQ==
X-Google-Smtp-Source: ABdhPJx9yMsWBarHPBxLQAxxFY3f/PggaV5qHdtzVRcIGew3O1hnPU38nLAFXsswEDlbsMrR1trfkXPVJ8F1LJKSAUw=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr4294931ybt.626.1652964731100; Thu, 19
 May 2022 05:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220613.1015472-1-marijn.suijten@somainline.org> <20220511220613.1015472-3-marijn.suijten@somainline.org>
In-Reply-To: <20220511220613.1015472-3-marijn.suijten@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 14:51:59 +0200
Message-ID: <CACRpkdZoZMmTOMB3EzYtVPKoNt355Um+EFFZMAS2m+hgMkWozA@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125 compatible
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, May 12, 2022 at 12:06 AM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> The pm6125 comes with 9 GPIOs, without holes.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This patch 2/7 applied to the pinctrl tree.

Yours,
Linus Walleij
