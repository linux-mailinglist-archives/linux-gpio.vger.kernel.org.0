Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1E963373A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 09:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiKVIex (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 03:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiKVIew (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 03:34:52 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFDC27FCA
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:34:50 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-39451671bdfso112047337b3.10
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 00:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFNWZX6nqcPRLAP3+p36POBcq2PQuLvUG582lwuLDsU=;
        b=LQ3kFeWQ2ww95B+4OGM/Xi7/EhnpNDt1EmBmwI4DT0yUXiW6umbD9hx++bvotDI8K3
         CX9Yix/41xJH9FKCIELQkCUCRfZxBZrgPQqQ1OV9qCn3RIAZaQNnEkjQGyfVVW/7leQk
         hjzkwVSOKuILe7qujZovTjJBAFnjYaABa92WQkUVNY4ErS7bfEbTBeNeWjewcpZoZNTY
         zTcwNKruUOGSTfcHRvypjheI1dWtxsxaNdJJ97yirVI1wOImVd2TCcV7TFzRa8cY4UtS
         1KQ0eid0pYmANe+Pu3gcXhXYOCHwwsyWwh8g0M1joaKs3+STGH5K8ujgOUyU82A0URV1
         +P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFNWZX6nqcPRLAP3+p36POBcq2PQuLvUG582lwuLDsU=;
        b=4VflW/h39mkx2OUyns2kKOXkS8r2HKwh9pBuGAePYliNMBz2XNiqiIjt0Gadc+kULB
         syCNOHEzkot8ZEmqVqFZwn/6IU/GH1Ve6AYYWedDevY06m5L+22HZ+5Rzwbk+QtV7WI3
         KYrEjIoKkZSfgh9aBR9MKYjMatzTdsMJNaxaO0H1d049bdy9yEb2PEDZmITfbexAtFpq
         4CLDSfvPSQq/9LWg2xZsgmXrA6zjHvbixep2phB8uSLOYn1UjTm0Ux7hHR5n50BvDmC7
         JO40yV4iN8GhFuwEwNJ1p6FSLt09tekQxtkxt7vi5OznQ4wyuzsq9xUfrN//5sf6uv4G
         WdyA==
X-Gm-Message-State: ANoB5pk07GM0KCV2LLBdQG0X5Or/PRlFvS7Pj3wuDhgClGRq5deC8R/T
        IuNDymyuR8vpmYqQb1GiefXFEa0W9cj50yE/a/D2IA==
X-Google-Smtp-Source: AA0mqf75SduNvhVQKDFmQuCeAd5sRLnb4nLRDUoaE1P/ORcJuPDqFvjop2ZWxhYR92NufjgI1Gwz6IZA4WKX4793LGs=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr5218311ywc.380.1669106089855; Tue, 22
 Nov 2022 00:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122-mtk-pinctrl-v1-0-bedf5655a3d2@chromium.org> <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
In-Reply-To: <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 22 Nov 2022 09:34:38 +0100
Message-ID: <CACRpkdZUjcO3hDwibCL1qTiSiLPQVYo5FaH3rzxygUBBwVHTwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: meditatek: Startup with the IRQs disabled
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ross Zwisler <zwisler@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 12:39 AM Ricardo Ribalda <ribalda@chromium.org> wrote:

> If the system is restarted via kexec(), the peripherals do not start
> with a known state.
>
> If the previous system had enabled an IRQs we will receive unexected
> IRQs that can lock the system.
(...)

This is obviously the right thing to do, so I just applied this
patch for fixes. Any ACKs and reviewed-by can be added
while this is tested in linux-next.

Yours,
Linus Walleij
