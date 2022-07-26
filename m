Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AD5580E4A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 09:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiGZHyN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiGZHyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 03:54:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA4E2D1C3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:54:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id os14so24724686ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwWOam8AkJePn2ktxHbxWAYEN4tvG6OsJx/ndKi36bo=;
        b=Aq9Pgk8JKy8jdg8wHTi1XUzUq2D8qvgaZAAJjOvHbIh2j9sqQb/KzNH0MxtFqQyrwk
         gUpHTW8T3xNOf93KxOBwbb7+sYbMnHp6zERnBW2f3Q2KwwyOmAbTu0WvOzzYRl27NSwP
         lEiZH1iNUZ4PSB+1qhjD5Sjn/fQJGZPYc0kVNYB3yGNS2Ph/XgjICkNSndqxfAd8m51+
         oFhRxjMeNbbzccJ/bn+RtBQdbx21hO4rTibl7sty/gpcD14X9D4Pd4SfqBAtXHD+ZUaz
         w05/Pxu4KqufFvrQS65izn/TmHYL5bFFseL7lfjxWMIwIu8E+niEbx4gq5h092D/TjEw
         l+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwWOam8AkJePn2ktxHbxWAYEN4tvG6OsJx/ndKi36bo=;
        b=2RRs/mh3v02Z+8bXL1gJcdajYfmexUDgY0xu8xIhOHYwu7mPTcASik5NywT1pvtZ6G
         my32NMlz7EIvZi/Zx7risLWnoWNXOmgM4Jc0jFX0Aoq2QkqXRJ4HmvTxy9bblSWz1WmG
         K5UzVl9OvRrmXrZi3XVqYBO2nSQNr8M6JawEzrOFrpnxt6IjnW2p9d1WMH2WDf8Q6R+3
         D17TXqkUdvvRUu9Vs3OJaCtxOJL8BjS76N4BOMGFuC7Yq5y5pjDXX/dENZzTqMrP+z3m
         lXSgtlS6Xfxj6wo9RNzWOm45sofdMBAPzcKIA1nBzGczlMk5V8fJSikDv70MIEU9wbWu
         8+Xw==
X-Gm-Message-State: AJIora/xuE1UoTiMresS3dfiovSELOBRVucs8AguuLkH+dtb7Vhr+OgO
        PW8Qn+0u72u4pUdZAPyCG5H2JomBB117PYNKl0Gu1w==
X-Google-Smtp-Source: AGRyM1sqpceXJY+oav7suooT5GuxJMUQkP0Ff6auJEqZByRKdd8M9KunUZDOfxtzgIluZCLWdZtOmj783eIJw7PvgHE=
X-Received: by 2002:a17:907:1ddd:b0:72b:49ff:d39e with SMTP id
 og29-20020a1709071ddd00b0072b49ffd39emr12973545ejc.500.1658822049777; Tue, 26
 Jul 2022 00:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220722092419.77052-1-slark_xiao@163.com>
In-Reply-To: <20220722092419.77052-1-slark_xiao@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:53:58 +0200
Message-ID: <CACRpkdb+EpiHpSYNK7nnpVHJ9t6io3_4_j03MFTxBba19=LyHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Fix typo 'the the' in comment
To:     Slark Xiao <slark_xiao@163.com>
Cc:     ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 22, 2022 at 11:24 AM Slark Xiao <slark_xiao@163.com> wrote:

> Replace 'the the' with 'the' in the comment.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Patch applied.

Yours,
Linus Walleij
