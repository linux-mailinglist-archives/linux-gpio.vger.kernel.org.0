Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD80D589229
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Aug 2022 20:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbiHCSV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Aug 2022 14:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237847AbiHCSVz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Aug 2022 14:21:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EB71A3A5
        for <linux-gpio@vger.kernel.org>; Wed,  3 Aug 2022 11:21:51 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gk3so20734983ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 03 Aug 2022 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=altzbewDE/Wwwgxa1r3vizNyU1k5iQam4KRzm34xggw=;
        b=KV0eLWruUwaMIjIN+TLkEejbtz4M25VvPf+mMKE/qdUUQAMgh0ImEPVq4lO0UI5LQp
         H+rj8qGzlImNhA/w++um3Vsfebu0uNGKpdSjnkYWbOE5fSGDutzvpnWVhfzGxrD5szdd
         bPJAqVhUqF8QXR4rkudQ7Fqr7K09F8z+dZCJeDsnlTWCrKRxd/ZeEiw+ONW1erZ5gmaZ
         FQdcG53MqxjTcrQe2rhdDg4rEQOWVM8UtgTitVJ2YHfPMkdLVPr5o9jWADi2Cj+3wkGl
         xDL/iKcxoSDIEwH/+usTHQEJPH6Sj4WaoO9WVGZdPpV/RQp8JI65eShqNwzTvYWHhgr4
         Qd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=altzbewDE/Wwwgxa1r3vizNyU1k5iQam4KRzm34xggw=;
        b=JwhNiBD178X8vDd1qVWK1mXw3s/csmrxkRoTE/q9DyxZLYNW/tsw6gAxwgPkoeSZxK
         /xkRRfEF2Ttfo2VJNV4aytIvuZLWBCfoK1o5eF1Fvs6xXz2bko+WwROnITkvInTB9VXp
         idB956pC7v3NiP1OBSEfpyPdLH7yoitL6IPHYrgjdr2yzXC5mj8vDJhwuIaYPpwpGzhj
         DVoP/gXMXbq0ywZJmaMxAM7Q6b7CIUFfVlrvTwv2hYYodtoHa2w4oJIP+X+yZzv56khp
         dwgrWueGFzNeSPJy3HGXI/MtCHv7pJDNokGPxT6Do8bLxw7C1xpqxPifGG4Ce0dUpMzh
         J1Ew==
X-Gm-Message-State: AJIora8EHiiB71kFEYLrzR3emmSBdzVfRD98+bJtGVtDUvaV3d6000/b
        i+JilQmSBD+gQ9QN+Pdx8J8Su62qnNsJBbHY07QJFQ==
X-Google-Smtp-Source: AGRyM1ttga43cTYdEGBr+E0O1w9eKgXTrUP1AahWa0gawLTIeHHKdh/aMaZ7BE4vxr7VjbsHG0yboWsmwhtICvtHyTc=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr20905120eji.203.1659550909766; Wed, 03
 Aug 2022 11:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220803015645.22388-1-lujianhua000@gmail.com>
In-Reply-To: <20220803015645.22388-1-lujianhua000@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Aug 2022 20:21:38 +0200
Message-ID: <CACRpkdYVLeAU5L0yGQqBsqk5TiQnoSGwbBBums=uNiX8r5JDww@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: qcom: sm8250: Fix PDC map
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 3, 2022 at 3:57 AM Jianhua Lu <lujianhua000@gmail.com> wrote:

> Fix the PDC mapping for SM8250, gpio39 is mapped to irq73(not irq37).
>
> Fixes: b41efeed507a("pinctrl: qcom: sm8250: Specify PDC map.")
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>
> Changes in v1:
> - fixes typo error(mapped target is irq, not gpio).

This v2 version named v1 applied!

Thanks for a quick fixup.

Yours,
Linus Walleij
