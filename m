Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4495329DA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 13:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbiEXL6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 07:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbiEXL6j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 07:58:39 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CE463395
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 04:58:37 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ec42eae76bso178773577b3.10
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ulsJuHEbmU6H809aZthX3kkbkskOpWkTXlpj3AKF9nM=;
        b=QHvEpE8zGci+s/j7msNSc9rDw23ZG7U2OLBhPrjkPsHcyVVKEAJQAf7u2/FpqfTjZ+
         ZCnKkHJN/DLT8C3lRFrn1xSJGQsETmZbk+3iDRZ0UzY14mDwGDFhCmodEAN9UXqADvig
         OtW5npBu8nXcadIDHDmt+N9LlUXQ8t9AHAPTojvnc9xr5RvDwlC14OMBu2N8uJCm4ems
         uW8fkxtH5Ds5boX/++zBTlbrlJlnmn/w3oha418YUitpkMGGdqAOUg1erYfKYuBXy4Fb
         5ukxfqHtGn5I3yMVbn/dBTVKbTxK2+1XICUhiUg+gH55roK6DL1OlLNyjSRPkLwA6zjm
         dHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulsJuHEbmU6H809aZthX3kkbkskOpWkTXlpj3AKF9nM=;
        b=LdSdXvRS4mfpuI3IiKYaqwkeLECMESSjTi59HQ8wLypsHTw8JnM5sfYQk7szYDtB06
         hwIYgOu69/ffF7tMIv9D2sFV7AY7A9EiV6cRtDeecESo9Ci3lZqjCfUCowvhKerpWrAZ
         YwLlWK8eSzM/RyJTVQGxChkTUfP68KY4O+2+hrTPWPgmL9EyUpfUqN1UDVtFQ9xIstFl
         lug5/jgI5UPYngkJoehz8Z8KRRSOBP1zvBj80FLywKbThvlH5rPt9IiPX63h/ocqW3H5
         b2UGVVjqCTcd4zanVi2ZXCSWlp1wwL+SnkK18JqRj7KyOr4cVzj96zfoxWT6nfu5qk9q
         uYeg==
X-Gm-Message-State: AOAM531BtK7/DcznxEFP09p17K7DjaXRXdpkXwMSBkQxGfxa5jhU3Sy3
        W4Tjn35FBGNqdZ0nnqgUAOc3tvYTlxzGI0DdnhQrtA==
X-Google-Smtp-Source: ABdhPJzNalYSSt+nPIEcUZ3ynaY+Avf50QP2IcdvoWL058b0lfx7uDSH9ZIy4aG4ZLTixiZ6rx8+RR3jLTv/tshpL2s=
X-Received: by 2002:a0d:f743:0:b0:2fe:e466:a482 with SMTP id
 h64-20020a0df743000000b002fee466a482mr28731967ywf.151.1653393517194; Tue, 24
 May 2022 04:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CACRpkda5x-O+RT-=4AU0MYgeR2j7ToH5maYGCUH5NDyx6T7CFw@mail.gmail.com>
 <CA+V-a8s8K0VaNunrFnW_BzPCHmi9RK887bb1tBfodbxBmGOvPg@mail.gmail.com>
 <CACRpkdbqm_DYagbtnv3m8H+woQZxLK6g9WrV+8X8PDQyrK-Gxg@mail.gmail.com> <CA+V-a8uu5sTOWrWZVY=YaUaOfQZFHx46snHTRnW7ddJyH-obvA@mail.gmail.com>
In-Reply-To: <CA+V-a8uu5sTOWrWZVY=YaUaOfQZFHx46snHTRnW7ddJyH-obvA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 13:58:25 +0200
Message-ID: <CACRpkdY6FCNPt6z6NEZDAXUdFwaxNgApL-sDFYnoxbNRETVaog@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Tue, May 24, 2022 at 12:21 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> Since currently there is no other way to release the resources which are allocated in
> child_to_parent_hwirq()/populate_parent_alloc_arg() callbacks the free callback is
> overridden and the bitmap is released there.
>
> Let me know if there is any other better approach on handling the above and if it
> can be moved into irqchip instead of irqdomain.

I have no idea, as long as Marc Z ACKs the patch, it is good for me, the irqchip
intrinsics has burnt me more than once. (Says the guy who constructed
pin control,
yeah I know my code isn't better!)

Yours,
Linus Walleij
