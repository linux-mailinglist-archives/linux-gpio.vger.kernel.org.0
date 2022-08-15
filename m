Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2033592D7C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 12:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241640AbiHOJGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 05:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241538AbiHOJGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 05:06:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59911835C
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 02:06:12 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w3so8839114edc.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=44Fl8O7TjbclXQeBVlf9eeR2A/Qg5kDFt4fRh+hjhrE=;
        b=IEgRbmGxJGN4flDsa/Phu7+0pG+lWoyUlmDIQgqzrw7LmZxYepepRA3e4gGM9je5v6
         x6g7jYakBOyv5DjXADfAdk2shSK68hAYjpAzvxTKWzqtMo4H6yf3aywSV9JKagEwZIAh
         7wwobTJ5FoLEpsXhe9QC/rblqS0IQSvuAur3Ex4S3XG+hoFDv7tY8hp1607qR8QVKvG1
         ANfndZsS2RTMckXbbdQvdPS8MacvBsxBL2cJz39bC1D9iXa2rZWLdDaCbEYBpnrCAsNI
         evuSdf7tJ0GQnh+jb6Myw9g4iG68NWUBZolXNYR7nvA/AfjMS7HfKpk/PaZjj5S6DPa7
         Z+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=44Fl8O7TjbclXQeBVlf9eeR2A/Qg5kDFt4fRh+hjhrE=;
        b=0NPeVCuWB82OBNuO4TR4U2t9sGaKlc6pL87ThhNMudjZOzOOYXVDqgdBE91tlTXduM
         a2VZbt74kjw9Je7ubMsjEECVsOZqSyzrV7wCMqDmNYwi2onV8XJyBcSuH6MDAmRp5OFN
         LempQuari93f7a+ajf8xTX5D7bC2rd6TTRsJ9udFK1e9jveskvoHsKmrEoO4DWbWR/sX
         edtu8DiSfQypKFQvsft54yg/3HWS3cJ7AkLmJcxaZsAPJp/E6P098FN34AmTJtC3e3TO
         IYtW1mACCqV9KVSMtzfgWN0GaeBsizm9HQGTZ621NodsKPUfHEKCRzQYCkw41Po8WR93
         yotg==
X-Gm-Message-State: ACgBeo2G3WmQMLA1xq6oKMn95gNMssEnQJQ3j20l/wZXuWsZqFeAsZ+r
        NqxmZwCYGX/O7qL0UaaiFDTi4CiVsMFYzz5VhoY+Uw==
X-Google-Smtp-Source: AA6agR44r30PYJUVzZR0NjpgNUdMjyNkBe9wpD9qBBJNDQRLR8pt744u+pmvMEAbsFZILifQg9yCsfl7NP3jqBwEfWI=
X-Received: by 2002:a05:6402:f02:b0:440:3693:e68d with SMTP id
 i2-20020a0564020f0200b004403693e68dmr13896631eda.29.1660554371336; Mon, 15
 Aug 2022 02:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220812133012.7283-1-shenwei.wang@nxp.com> <20220812133012.7283-4-shenwei.wang@nxp.com>
In-Reply-To: <20220812133012.7283-4-shenwei.wang@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Aug 2022 11:06:00 +0200
Message-ID: <CAMRc=MexvX_sZK6RdiAdjNQnvqAU_o_g7pCfUPDORHnQ4PcEMw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] gpio: imx-scu: add imx-scu GPIO driver
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 12, 2022 at 3:31 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> The SCU firmware on i.MX8 platforms provides a set of APIs to
> control the GPIO PINs on the SCU domain. This patch implements the
> standard GPIO driver interface to access those PINs on the
> SCU domain over the SCU APIs.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

This looks good to me - Krzysztof: do you have any other comments?
Otherwise, I'll pick it up soon.

Bart
