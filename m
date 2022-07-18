Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937FF577E90
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbiGRJZr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiGRJZr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:25:47 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343E91705B
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:25:46 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bp15so20109853ejb.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ue1T5gaWA2gyQmS15ZO0dzp0M0fjfc8vzpEQVbLSV3k=;
        b=QAppelc4zHui6hM3bdks/ClZ6NQVtUa7095jmYtBA2HXTgIIIYCphCR6f5kB+7gyq/
         bB+rlmdIPymAAmsoBWRtXo35kOO8ImYJ0oLYG2yArdCZhRD2ctEOze2mY2ETQw1OkatO
         BHm9p5ZzUfkG/sAj7P7lOxK1Fi8r/ebEn5QEPtdej+IulNLKkme04KT3T5syepH4DXlY
         4AE5x9hxG9mD4v8Oxp/YkJGgjNoUfiOlUVFfqIpKbh2Lhf/btDPRs3TNuUWg/84fiQVG
         tPCI6nuo6f47RuGog9e0wayNtcpikkRGW8tJ3UOPARtK0apPsoUkrPf7Gi7VvPGSV2BL
         FW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ue1T5gaWA2gyQmS15ZO0dzp0M0fjfc8vzpEQVbLSV3k=;
        b=lffBonMm//9+pcLWwbJNoJAZ80vwheaRCG0opmSwvD3BttkTW4pREQfwBeQf1YkHfB
         klMRh+ujla3Ts/zW/PsZkfJexv7VNVcIN03pC5TMykjkP69PlcC0eS4y7sY42H+4kerA
         CoOKhDDnddEnTx6pS1dm5FTxqQ9LVpWo/UlBld06gkNfvtkwW1mLt+rN+HYUYoRrcNV8
         Dd4YFuXAGn3XbRD4W59kQD53F98xKfINcqsjT02LIBKCRQoW5EE//B8FR2r3tLcmZ6Ki
         UzNpET8x7IxMhzK/VExgwt0/1es7l8Buglhz6jNSmA5nS+f3RgSWeWw806IgtlZzAkqX
         dD9A==
X-Gm-Message-State: AJIora+Qu3712eyWCZMbqIgr5t5ZWXqvUDhGMPRYZpIYuqZEDbv3yeJ9
        oJQpSwclRLxgj8QVaEWik8Y8x9d4cCpzdQMDHvk68Gj27/w=
X-Google-Smtp-Source: AGRyM1ssu5ywRY9hKC54gdNEx5pzZB8ZERsoMcZwcvFaexjTtRIebbAC1A6bMeCmjGtPdRfgCOKVzSPVShweYG2b6is=
X-Received: by 2002:a17:907:a053:b0:72b:3051:b79b with SMTP id
 gz19-20020a170907a05300b0072b3051b79bmr23622636ejc.690.1658136344832; Mon, 18
 Jul 2022 02:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220713225151.1476041-1-robert.marko@sartura.hr>
 <20220713225151.1476041-2-robert.marko@sartura.hr> <Ys+xTubC2iwetqYS@COLIN-DESKTOP1.localdomain>
 <CA+HBbNHwbPtxGYW=xnay7zW9nxUgu5EURy6nX9m2rkTPdSELLw@mail.gmail.com>
In-Reply-To: <CA+HBbNHwbPtxGYW=xnay7zW9nxUgu5EURy6nX9m2rkTPdSELLw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:25:33 +0200
Message-ID: <CACRpkdZYApW9udahm-PE7hBq-g+oi0u6TRNYPxtBRO-X4kNLzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ocelot: fix pinconf
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Colin Foster <colin.foster@in-advantage.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 1:07 AM Robert Marko <robert.marko@sartura.hr> wrote:
> On Thu, Jul 14, 2022 at 1:01 AM Colin Foster <colin.foster@in-advantage.com> wrote:
>>
>> Hi Robert,
>>
>> On Thu, Jul 14, 2022 at 12:51:51AM +0200, Robert Marko wrote:
>> > Commit "pinctrl: ocelot: convert pinctrl to regmap" moved to using
>> > regmap_read/write, however it neglected to also carry out alignment
>> > to register stride of 4.
>> >
>> > This would cause the following error:
>> > [    1.720873] pinctrl-ocelot 6110101e0.pinctrl: pin_config_set op failed for pin 34
>> > [    1.728110] sdhci-sparx5 600800000.mmc: Error applying setting, reverse things back
>> >
>> > So, regmap_read would return -EINVAL as it was being passed address
>> > of the pin without stride, so for example pin 34 would end up being
>> > 0x22 in hex.
>> >
>> > Fix this by accouting for the stride in register address.
>>
>> Sorry for the bug. Horaitu found this as well and recently submitted
>> patches:
>>
>> https://patchwork.ozlabs.org/project/linux-gpio/patch/20220713193750.4079621-3-horatiu.vultur@microchip.com/
>>
>> The second patch in his set fixes both of these issues (reg_stride and
>> max_register).
>
>
> Yeah, I noticed his patch only after sending this.
> Sorry for the noise.

Better too many fixes than too few!

I have merged Horatiu's fixes now.

Yours,
Linus Walleij
