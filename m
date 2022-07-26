Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21245580E13
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 09:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238517AbiGZHlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 03:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiGZHlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 03:41:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E1C27B21
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:40:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c72so13829068edf.8
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T9AkE22NC0dR2ypursI2fN61qW/1wSf5rUvH6q53xFE=;
        b=ge7laRItcMaYz8CbVUmxu6fySWP6WV1vCNqQjPey7pCqpDVmXSL/OKsjz2cyQR0AZB
         MJGMng4U2M+FPryqWHApgaW+gVXE00zgoy2GtuaysBpIJC1AIHHBCAtAsyqKW02GIJaz
         StxWUCuuCnpCJkR9fp42qXCLB70UdwMTqQZU98XHIljorRNAn/RwBWrLhy0Zhqz0tlng
         a8dOSU7fFBjc7T/ut6wAkgbfOiEvp5bd+vEANLcBbfEjzwjoaf0bNkzLjiESwvhtL6gT
         o1NwdOhjDA05V3grNzlr4IbrNcISLiYuHF0fGau8O1dH2RDVQzDWRYpMkY4PIfuVgnuD
         Tmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T9AkE22NC0dR2ypursI2fN61qW/1wSf5rUvH6q53xFE=;
        b=5dDPu7yNZII9B5NH54aWpRGvNOKVKIHPtGoUPKzPcKPOPFyjiLxAdvpEYydZvK6EH1
         WFUoXwUeQ6oEMEtzJD1STyzAckxlyq37KhyUA3kyj7hbkVBqs276CzDfBv3uS2nsVrL+
         W5UQwUBQ477IMJS+bcx9oyWY/Q3NbyEHmmAsaHa9Bd7aMnuexdvzw4LmyQWFPT3OxCwM
         g+kw4eH32nFtIGp3/a6oL2k0td/c4bWV0ANPL8Asw9pUDYS5j1RIFxHmCG5hOWbg4JkA
         EsoEERI1ln33ocJpdyu5TRlZ6SPcRWlGouLaZSj89uII0jBxyFodPKIbO1qbfBvdtr6a
         gKDw==
X-Gm-Message-State: AJIora8xqFAWO5wIGio/gpxrD3lD4fNQ/HGa4zCP1OMcDNMwA3JjoyRK
        nGWS+VHvYGYZyCcAgqN3+j/+BXmFpCDj6d99eTBy0A==
X-Google-Smtp-Source: AGRyM1vwZzhnBcWkZffdETCQmqtRoad3oPyepW/LJhXmMjspkJKij3hGNnPFM101r9JRUaT57ut9pk6wGB+tFiiLJ38=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10704544edd.158.1658821247900; Tue, 26
 Jul 2022 00:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220719214955.1875020-1-robh@kernel.org>
In-Reply-To: <20220719214955.1875020-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:40:36 +0200
Message-ID: <CACRpkda+pLvw1AUxERdVaXooH0VFtSHAj6qJ97H4JKx0p1MdkA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: st,stm32: Correct 'resets' property name
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 11:50 PM Rob Herring <robh@kernel.org> wrote:

> The correct property name for the reset binding is 'resets', not 'reset'.
> Assuming actual users are correct, this error didn't show up due to
> missing 'additionalProperties: false'. Fix the name and add missing
> 'additionalProperties'.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied, thanks for hashing out this mess!

Yours,
Linus Walleij
