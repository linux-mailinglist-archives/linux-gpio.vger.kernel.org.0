Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D8350934B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 01:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382590AbiDTXEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 19:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiDTXEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 19:04:37 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912A51DA5A
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:01:49 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p65so5568571ybp.9
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O338brRj+O5YsxQJ5fqE/nOTBxiBpev6iMtGc2zgLXA=;
        b=fU10Esjv9giD6Y9O34jUzKITzmT2TLIcx8CkFHESF0gqbPMOLMPEpq2vOSe59FKB2L
         bQ3YD/kmsFzh31gm+znNCnRTF6ViRhAcfedw1z7URsFLtqotRUxr/FD7ZXEIPkRO5isI
         dzgDWigHbRuTL/qN280W3zKWBhp5y689K7cs8v78DSDl/CBtfkvh+ZPuSbX9VeJTIF8z
         fDty7T89ojJRvRTJKy3CHG18O0UWdt56AvWJ6DlWtrzlUE9i+iut8gVJ4cgC79IMSMxs
         I072kvXjPYqY/iHusW0fpkJOuReDVwAGUKlu43jcAYRB1uRmccUBTtxOETtGGOcd1Efx
         Kbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O338brRj+O5YsxQJ5fqE/nOTBxiBpev6iMtGc2zgLXA=;
        b=Jzd6GrPkXrGsZ9nkEGwLwaVY1CWfQaOPocFeuHMISGGj+c68GYQAbFPmZTdH1HL9q3
         YS15fiEaFXzK/ynQeutvYltQVa2gHLXLybK2nptuM/3mEz+dmlpnMdPTm/Bpv3M2FC97
         q1Q5/bluclBYWr9IbfDe/YdlydVdBDsiGjZbk+mUGv6fxLCLuFScmyv8QHEj73zH0X83
         7ZZRYUIa6552uS+0MX1/1oLbTgawkOdB47v4qiAb6zpR/iwAZgbxcKhHlRpvlg5phYqR
         n3fcz0Q2c/1hsK/VtIyNJ7Z3N+tCXD1ObpL+ldaQZMf9PlUdWDvSPGAbFwczpmpU2WRj
         9UhA==
X-Gm-Message-State: AOAM530/K0tXzjYLmVAT2xq3xJAo/5P+0JFtvUZXn7qc9F3zVaP10Um0
        i861adDNbqUPzR6UGiA7VglshB+HfmAjqm0sTIdSvg==
X-Google-Smtp-Source: ABdhPJzJypBygVuBPKpk9rDFlfYc4pVEaO7EgPX1tP/mN/h81CQRJKfPSH+/7/RK9G5XmPdwn2++jqJiBGKtNm0EBzU=
X-Received: by 2002:a25:73cc:0:b0:644:f4a3:6f4f with SMTP id
 o195-20020a2573cc000000b00644f4a36f4fmr18031370ybc.369.1650495708846; Wed, 20
 Apr 2022 16:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649533972.git.sander@svanheule.net> <7105ae382d7b328102f66b39ffd7c94998e85265.1649533972.git.sander@svanheule.net>
In-Reply-To: <7105ae382d7b328102f66b39ffd7c94998e85265.1649533972.git.sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 01:01:37 +0200
Message-ID: <CACRpkdYmKbHOZChSHjB-ykQCyCziwYTO_+Ai2vheo0y-vD_akA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] gpio: realtek-otto: Support reversed port layouts
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bert Vermeulen <bert@biot.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 9, 2022 at 9:56 PM Sander Vanheule <sander@svanheule.net> wrote:

> +       if (dev_flags & GPIO_PORTS_REVERSED) {
> +               bgpio_flags = 0;
> +               ctrl->port_offset_u8 = realtek_gpio_port_offset_u8_rev;
> +               ctrl->port_offset_u16 = realtek_gpio_port_offset_u16_rev;
> +       } else {
> +               bgpio_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
> +               ctrl->port_offset_u8 = realtek_gpio_port_offset_u8;
> +               ctrl->port_offset_u16 = realtek_gpio_port_offset_u16;
> +       }

Just checking: is this really a different silicon block, or is this
GPIO_PORTS_REVERSED flag passed around just a way of saying:

if (!IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) ...?

Yours,
Linus Walleij
