Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F115A871D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 21:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbiHaT5Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 15:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiHaT5W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 15:57:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8C5E096B
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 12:57:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id kk26so30479866ejc.11
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3/C402UrLcFdr+55UasuTaaa+TRTdcGT9j3EBVa3jV4=;
        b=4U2aNm2Bzl6sWFxYmpkLatmR/VIT9M4TC1wx0Hz6KqTkVCAaqUdhJHrXDM2HUeISWU
         1gj3skkD3jlLf9mYWNLSCbFU5iqJnZUEzJRPLeBqgrWLPfK3DdFHW4F+uXR7U2I+h6Iq
         LitD5cgW2roRNHIEh8XLMWtQ/h8iXF+zWOuHcYLxTMTT1Sa9Sf0eLeD2czf+5ijLTb3S
         swZ2PvazSBanHogOiTiupHKA5oTBim4W05sNNoz0PS5RRM0lh1QI6rDxkjo73fQfdjW3
         tTaXih8CgMoJ5VZwTjcjfyo0FsfiKKIgv90cljRY1FlGuaavwP93wqgZ/FfBX3lJhfyL
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3/C402UrLcFdr+55UasuTaaa+TRTdcGT9j3EBVa3jV4=;
        b=zxnP7vQ3riajRaheVIRBGwev6+H0aEtHs+aX3aBAFOHY14Yr6vnQ4rq12LkLHBLRFO
         ba3StJXK/d2iPsTngi0sbnBRWt5Ew4foyAMHdXm5jSsEuYy9k9w36BVq7DfmVN1eh6HG
         S7c3XEXmop5MCOXqia0PQA6EqE6rmEkJsjIOhaiQPnC8btECFsU+okhowSFJd5fpYSgE
         KsBmCD1QTb45n/IfZEEddo4VmnVnJmq6XvhDiFNfZ0OXBASIVEpFYYF26xufS5IyNC/A
         FHrjiS6usGuX8S17+8/2wy9Z47fnbJuKD72rc14kOp4b8UW3YOx9+wxqF8+pTgXs8RQG
         +NOw==
X-Gm-Message-State: ACgBeo33siNYUbSGcUjCjCAsrVHTlq6vLVSTt1NUJbjJKGcuzPSji4ry
        AUGq67rsLvE2VCVFmB3Tvnd7byf+hssH7nqNlEnNIA==
X-Google-Smtp-Source: AA6agR4eCcEmRzF3NJLEVzxJ5LTDTqeQtu9d8ExuzstxWQae7oIVIV99F7ZjR94wAkhLZw8SM3jUdy/xwxuuxtIc+dk=
X-Received: by 2002:a17:907:1c87:b0:741:8199:a59d with SMTP id
 nb7-20020a1709071c8700b007418199a59dmr11832796ejc.736.1661975839012; Wed, 31
 Aug 2022 12:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-4-francesco.dolcini@toradex.com> <20220809134836.GB44926@francesco-nb.int.toradex.com>
In-Reply-To: <20220809134836.GB44926@francesco-nb.int.toradex.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 21:57:08 +0200
Message-ID: <CAMRc=McqfBSb+ZoD_WT-rWBqxqTCpogKUhO2uJr2R8dctTA1CA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: gpio: stmpe: Remove node name requirement
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 9, 2022 at 3:48 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> Hello Bartosz, can you pick this? Patches 1 and 2 were applied to MFD
> tree.
>
> On Tue, Jul 12, 2022 at 06:33:43PM +0200, Francesco Dolcini wrote:
> > STMPE driver does not require a specific node name anymore, only the
> > compatible is checked, update binding according to this.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > index a0e4cf885213..b33f8f02c0d7 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > @@ -8,8 +8,7 @@ Optional properties:
> >   - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
> >     due to different usage (e.g. touch, keypad)
> >
> > -Node name must be stmpe_gpio and should be child node of stmpe node to which it
> > -belongs.
> > +Node should be child node of stmpe node to which it belongs.
> >
> >  Example:
> >       stmpe_gpio {
> > --
> > 2.25.1
> >
>

Sorry, I was off most of August and missed this one. Now applied.

Bart
