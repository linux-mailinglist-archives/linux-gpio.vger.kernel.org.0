Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC34B1AAA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 01:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346504AbiBKAqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 19:46:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346484AbiBKAqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 19:46:15 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C485F8E
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:46:14 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id e140so1183548ybh.9
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aqg2zYlKFhDU5R59omnns1h0zMhseRBVTVyLe6xPNAw=;
        b=X0L8pqDQdxoPIp+SQ9ATds+ARsJ5XaRoakuQEEb9AFJOQkztFhYCnS4eoc+7WtnGKs
         IsI/x2HthuAgMOz5p1lV5S0zHy571/uytyaHe9Es0b2tW60l4snqT95ZuJ+UA8SkdRfh
         aWdY5u7olCieQnKYht1p5QG5ZQf0gfpf2YXRz6Hn26bbnAQ8XSniclLvAF8ru4GJg8ie
         jY8OPuKSa+f2NFkdpfL7Qp+Bt2Vh53xHnARth/o1ESmN8uulrsmvf30hIXvcbA/e1lL2
         R5hGHRrGYCrVsTi32PzHqttKWX6Jc1xa1FGkhTcFZxvZKx9tKO/rSiTm9a6waUuh7myC
         RGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aqg2zYlKFhDU5R59omnns1h0zMhseRBVTVyLe6xPNAw=;
        b=DmQwb6SW/rSEKv2AGbQt3xcUrVP/m1cV0dAS092QOMnqjH8tRyrPqVsqLlpgireRh8
         +4l9bnuO2qy2Lnfc9JT/2oR25mrwMLIoD/9A6/wCQBfYUGsAQW1hT3ch1TdKTImu7KYJ
         V7T2nppt3f49TtyW9kObhTU+/6aYmH41fwHHCgdiqxJUgPcUheksotBQaFxr/Wr/U5rx
         Ga9X1uNwedcydyJHWuhpXxcV3pS//u7G52Qqg8eqhQ47ngbSBILrfppYIQVUE1UVisW9
         imjip+8EE7kHqpG/SOUaKu4cGl39O42Z1dom4mjG4RSWB6tqIyuWLwqyYwqMdW9VTkht
         sVOw==
X-Gm-Message-State: AOAM5308odJpozVAYgOJ021npmZg7ipmTKrWjt5AYibfnuzlzetoYXXX
        A+c+8kizKj/UdnLwdqE+iSV6qTera0Aq8vECijyZiw==
X-Google-Smtp-Source: ABdhPJxPdUAdZzu441vtdOPhtVOnx5TxV2FVC7NtVsI9RRP7ptyI1elK0lctrq3IqH8VqzMTb+ldzwpyBRi01HARJ18=
X-Received: by 2002:a81:4cc3:: with SMTP id z186mr10573147ywa.140.1644540373922;
 Thu, 10 Feb 2022 16:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20220202153528.707185-1-wenst@chromium.org>
In-Reply-To: <20220202153528.707185-1-wenst@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:46:03 +0100
Message-ID: <CACRpkdaqKAU7_HWoCqjnbmCEc77FKJD9gUFR+ARbmQmR9zRZSg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: fix bias-pull-{up,down} checks
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guodong Liu <guodong.liu@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Feb 2, 2022 at 4:35 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

> When the constraints and description for bias-pull-{up,down} were added,
> the constraints were not indented correctly, resulting in them being
> parsed as part of the description. This effectively nullified their
> purpose.
>
> Move the constraints out of the description block, make each description
> part of the same associative array as the enum its describing, and
> reindent them correctly so they take effect.
>
> Also add "type: boolean" to the list of valid values. This corresponds
> to having bias-pull-{up,down} without any arguments.
>
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied!

Yours,
Linus Walleij
