Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238656626DE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237232AbjAINVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbjAINU4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:20:56 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EE3260
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 05:20:55 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id e21so8483767ybb.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xG3W+vK7RwrCdtjwLK3vNCE7vbO36bpYtpEuaP14DXM=;
        b=iwiA9nCEk8VDF99Ls5nNHHwL8wlLIbTaNikhbEYzRNypMLB74PdazEBldEB4XwwQXG
         P9jJVdpNY5pd1GSFMvoEewOBrYjFbHTr3v5tt66h6FkvZ4ZmZKUUtFG595RPLVZQYmtM
         BoN+NBopdl/nYOLPs8ijjvJutnl/uaCBWybeKVvHDz7wo/w46kn/u2X0xcNab2CutK/x
         0sC3VcX7SiCaTaUfAkpmbzLQGpkldQqp+ySZWxaaD3kyjZyFbLWwNYFgfrHjEbJvgE+D
         4LkPeIE6vNRnXGal38ZBz6JRjafXEj+j7bEswAJ2ylWdUqqj9B24cl7JizlDydMgTqBz
         1zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG3W+vK7RwrCdtjwLK3vNCE7vbO36bpYtpEuaP14DXM=;
        b=mhwRmSc36YS6kxbbjfQbdt5oFGFvIy1yeaHrT1jwqoGC6b/EILY3ELpiGXTHISYnV2
         SRL8RNB2uxmaGyehM36aRxaeLrwyFVEgKek1nG9+pzNPZIBMbQR1UoUHgzHgLk/2epSc
         E+Frdv3JiowL0Pgv+UHtOgiYpNly/GdG4Vi6gXd/jtq3yvtq12d5Vwa6EV+FZVVjYteC
         hgVlNg1JYzxOG6NE2vKeflX2xakdWiNoPj2wKDbdjK2YXZ6MKsKc5skSc5w4DfW6HXxK
         bJ4gy/LRHieeHVqXZOwt7db+eAbn8yXkj2F4VYuTCJebbK1QnBwTQwIEtoqvC5QKECyi
         VLAQ==
X-Gm-Message-State: AFqh2krboNUohE9kxwC2tBzq2M99O2Z0FQ4rEWRdtSsUoM9mhhhHJQO/
        vJrEdQIUNCpasTBrHw4JTa5GVVYqsEaOU/qfNAONWQ==
X-Google-Smtp-Source: AMrXdXvw/vMNQ2j4TQfyElQboPVxW6IRXKAPjB8bvTx1Sg00Npe71IQFuGLmER0nV13jikyspHUeMLsR75qaPgdfCsg=
X-Received: by 2002:a25:6982:0:b0:700:e0f1:6335 with SMTP id
 e124-20020a256982000000b00700e0f16335mr5702066ybc.520.1673270454521; Mon, 09
 Jan 2023 05:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20221230203637.2539900-1-abel.vesa@linaro.org> <20221230203637.2539900-2-abel.vesa@linaro.org>
In-Reply-To: <20221230203637.2539900-2-abel.vesa@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:20:43 +0100
Message-ID: <CACRpkdbMwV01+K8kPRhNAnjXYekN1ScEZL4LSMcseGkaYKkZCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 30, 2022 at 9:36 PM Abel Vesa <abel.vesa@linaro.org> wrote:

> Add device tree binding Documentation details for Qualcomm SM8550
> TLMM device
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
