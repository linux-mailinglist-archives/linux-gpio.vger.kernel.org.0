Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C087454C99F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239827AbiFONSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbiFONSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:18:09 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA872FFD5
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:18:07 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-30ec2aa3b6cso60319887b3.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6V4Ue+dndzuDT7j3moByTJo3sQjDjIr/li3Bn3qA9k=;
        b=zGD1COlS5dQINR9FxGh1mSbulwGX0JEeM6g5U1JVj2GjCOFw0RWsLtrNqnmUBYbhn9
         Ds97zfYou14tPKByWr5FiR2h4qFTmzhkch9+rj1SAo92vLZJuac2oJW86i16EHu3lvpu
         0XqZCFYyjB9O5ZMFHFyLP2O8K/BWIUgDozW80GCCZusHzl5vzCYM5P4N5F/uI4tIrNqH
         rqXXaSmS1IqcMSDGR2nB6hVLOtmOzlbz8tZhT595nDXr1MSIegKbd2ssDdkregLeW5oR
         5XvlaGL4XHzYriIG+YQ4uib0qDzAnsKu7r1uaJii9rmBI9eJcpKvNVrFc1MIKDUsVc5h
         T85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6V4Ue+dndzuDT7j3moByTJo3sQjDjIr/li3Bn3qA9k=;
        b=o1vbQOcqSJ8EUQU6SElx/RfS2sK6n8CXcMsJ3eqMswJDctFwcGSCtvY/HFv4RzaO46
         CRMhtFn3NsjJDlOxjBvS3zbZGSTSmDTRR2a69c6RKxj1ASXsQ2e5E/3M0s/Ri3F4p5RM
         WgjT+yBPz2TjrDxaWxC9C/4zbUTETfoltp4j1Buj2b87HltkhfiWdqTsKZoK8pia433h
         bruz/ajvmYq/csWy2H87PISWg848Xp939euaEwMf3NzmhfZZ+5bnUcvb34Wzm56K1Xhh
         FzlxlHUhEKv3VGfS7xLzIO4XMW6kQX2dIB2YPOSq8N55ErMqrcOrxJhaRFctS2xL1iKp
         O5yQ==
X-Gm-Message-State: AJIora+jNmWrTVljtnrFFmySseghyFWVDZjwla3jhoruHpkBmu+EcKAc
        kYLSQUVnUS2++iY1iGvVJZ51pgNyWx5hw4MC/CsGC/CSHfE=
X-Google-Smtp-Source: AGRyM1v5bjntVwpzPV9DDMEuPHXjhLnFsrSsCYkao4d93p3BkffDo3oHs8NbOrG7qCLG7pjh26QW8ztV0Ytmnytapcg=
X-Received: by 2002:a81:a00b:0:b0:30c:5c1a:19f with SMTP id
 x11-20020a81a00b000000b0030c5c1a019fmr11550606ywg.437.1655299086690; Wed, 15
 Jun 2022 06:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:17:55 +0200
Message-ID: <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
To:     Andrei Lalaev <andrey.lalaev@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
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

On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> wrote:

> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> Previous implementation used absolute pin numbering and it was incorrect
> for R_PIO pinctrl.
> It's necessary to take into account the base pin number.
>
> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>

It fixes a patch by Maxime so want Maxime to ACK this if it should be
applied. Paging Andre and Yangtao too, would be sad if we don't apply it
if it is a necessary fix.

Yours,
Linus Walleij
