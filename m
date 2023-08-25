Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1388A788212
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbjHYI3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 04:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243793AbjHYI3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 04:29:12 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0981FFE
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:29:01 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7481bc4d6fso695000276.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692952141; x=1693556941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zShbebGR7PLkGJplbdrGe4oJjyEATchL4Kco8hr2mfw=;
        b=lA42h9oMHbn8ANzZqZZYwhwSU3LzE6UI+MdUojllb8PZIK+J9fdXyIZidkkIY86J/P
         Tmjqx1MH2Q2aR9tkgHJQtV/HBhVMDMC8KFgD19MQvNuYjHbJCm1hmGQ8WqqPPqjgiLG+
         BwFx0pULpbC1nXpOUzyvtLnolCxsELioVunYnQHkXD0NIGvQJq8LuY9aM1NmZbkNFmxj
         WPokG/TPg98o8G4zDqtIeZiMTxyShulYWvR/Kw40lCDixFdooNDnjo6+yjgrSuDsFrMP
         scROwaX7vSTyMXHhqP9lwsL0CGObo3y13ryuAWDdiv7mnwFC9un+zXJTroQaLNop7SsU
         jeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692952141; x=1693556941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zShbebGR7PLkGJplbdrGe4oJjyEATchL4Kco8hr2mfw=;
        b=GJ8bqjLJTwwDtDp+GxblcQwgE7hOYyrkFeKvvFzIt+4fslm0g5cwPFKPJqPWrko1Nh
         OdBQ8aDv9ILEWj6uK0F67amK3ay69iDjxt+9wAqxbWOh9FoAfjTRiRPV8eV8NTVaZeN7
         xnUm0nXItn3OZDD1K96WfdDmnA/soBNlWxdrH3TqRfej/ufJVFCNAQagPBwxl3jyjTL8
         e2znh3oEUvWOcR5ntTvMdeiyorrZ51d56z/okj4ozs9QkcaktxuesqIXQpkIzR4uDm6V
         AOKmI1HLL9nEQ9hKV/wuazQzOr6nbqvgeHXIcyKRHJ8dNd1ynecNGtr2Nwf+Flq/OYxs
         VhyA==
X-Gm-Message-State: AOJu0YyPVo/v4U4AuSE1dXCVwRVcmhYAaA6y0kPcr3r6U7Q2Cn/uDkfC
        /q9+BBTEMoQY0HGVEwAVwsQyRkn2oFVvl1saTzA7Gg==
X-Google-Smtp-Source: AGHT+IEGhPMThQPIReVUQ1KtfTOcgXLO6sOeeePCLDKT1Sqwr5Xc9ZLjLVoYzRMYYv8gLYIJo+zXxQHfAGBgeVWHyi0=
X-Received: by 2002:a25:8707:0:b0:d3c:58ef:ef7b with SMTP id
 a7-20020a258707000000b00d3c58efef7bmr16436162ybl.6.1692952141144; Fri, 25 Aug
 2023 01:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
 <CACRpkdYU7MRXRV3Uw1w300sdxv=9XT=P1vFFarHfpSM6BT20Hg@mail.gmail.com> <DU0PR04MB9417B3CB9638F936DF19C523881DA@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417B3CB9638F936DF19C523881DA@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Aug 2023 10:28:49 +0200
Message-ID: <CACRpkdZKMsC1Wyi+nOf7idAWMTUe8w2XbtpWnbDKrCLD75ND1g@mail.gmail.com>
Subject: Re: [RFC] scmi: pinctrl: support i.MX9
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "oleksii_moisieiev@epam.com" <oleksii_moisieiev@epam.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 2:47=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
> Me:

>> it is merely making things more complex and also slower
> > bymaking the registers only accessible from this SCMI link.
>
> This is for safety reason, the pinctrl hardware must be handled
> by a system manager entity. So mmio direct access not allowed
> from Cortex-A side.

Yeah I understood as much. But I don't think that the firmware is
really filtering any of the access, it will just poke into any pinctrl
register as instructed anyway so what's the point. Just looks like
a layer of indirection. But I'm not your system manager, so it's not
my decision.

> The SCMI firmware is very straightforward, there is no group or
> function.
>
> It just accepts the format as this:
> MUX_TYPE, MUX VALUE, CONF_TYPE, CONF_VAL, DAISY_TYPE,
> DAISY ID, DAISY_CFG, DAISY_VALUE.
>
> Similar as linux MMIO format.
>
> Our i.MX95 platform will support two settings, one with SCMI
> firmware, one without SCMI. These two settings will share
> the same pinctrl header file.
>
> And to simplify the scmi firmware design(anyway I am not owner
> of the firmware), to make pinctrl header shared w/o scmi,
> we take the current in-upstream freescale imx binding format.

The SCMI people will have to state their position on this.
Like what they consider conformance and what extensions are
allowed. This is more a standardization question than an
implementation question so it's not really my turf.

I was under the impression that the ambition with SCMI firmware
was to abstract away and hide aspects of the hardware behind
a consistent API. This approach drives a truck through that
idea.

Yours,
Linus Walleij
