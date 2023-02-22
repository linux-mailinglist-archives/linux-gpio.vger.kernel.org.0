Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD6469F1F2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Feb 2023 10:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjBVJjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Feb 2023 04:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjBVJie (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2023 04:38:34 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA7F38E8D
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 01:35:35 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-536c2a1cc07so90542997b3.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 01:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cJT+GEaVd3YjMehyWddsFxrXLJhVT7GVxwoo47DYBg4=;
        b=ZpcNOnqqoUokoHfkyiTROBFeSS1Ck/f7c04bGSGdqvj5MgPlmwx1o641A2+iXPbesC
         cPEM7TvI3TbyFE05rsqmwYCjHGpNRH5au0SEzu1tciszXj/PIgbYG0bB8caBUXWa0rsE
         SkaqL93QiamKDHGSR1EcwiU0150NMMVm8dViUvwSg0MehUBy1ZBLAPc+gg/BMbTOlufw
         ukXF5eYozXis+BwjN9F0zvXVcegepw4oORBRmvC/o5e2chhQgvh9++nuOtBY25+8IoYf
         Txx0NxUOOXGeT32QzAQxyF5mCsAo6gRsHEcKGc17QF49cCwBGk0AZJomK2wi0FwZfif3
         S2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJT+GEaVd3YjMehyWddsFxrXLJhVT7GVxwoo47DYBg4=;
        b=IhreoeOnoUTqLF1ynjICt9X9ir5SRMPlBZdb4KD3SspuOlLrrVtUIFJhM3wuCauUcB
         uM+HFQygs51A3/8Ilq3ZyKyFqusDDhRDw1gixBlHk30KozstPY00xKMquBDNH4k0h9Q1
         8G34Gz4XJyR9U0GZd9Q7f7rKhCB9X4+ybS1cQgpJlWI6U3aCBBUBbsESK4azPscu6CQT
         kHbribwQrsV9ec/s3h2yeBaef/ghno+2Eeqdas30ACs4bVUIkh19tmbk84Kz9TSz/aVG
         nPSsmQrz1o+m7GyJDWzEMgg3gMLUlKaSTaT+q59hbgTevZkPIlA1+5NJ9UyCv2XaXN5a
         PILA==
X-Gm-Message-State: AO0yUKWQcsRPKrwWt7o6gXn0iKwX/wJVOTK7eRBaPrFMee3tX5fzOodR
        UWpof8meUCSIBjd/5xGry9mbnFdwkwifhWcJ2KM7BdiBnMxsio5ZwJY=
X-Google-Smtp-Source: AK7set8eLkunsPCG5M7KhAsYFtDSeO2fkt4I0A5sG8z14oPLrVSXx7sdnDgdy3wC8WdXRvKLDVaqPkFcMbqpuV2Um5s=
X-Received: by 2002:a0d:d205:0:b0:52e:e6ed:308c with SMTP id
 u5-20020a0dd205000000b0052ee6ed308cmr656878ywd.524.1677058482582; Wed, 22 Feb
 2023 01:34:42 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Feb 2023 10:34:31 +0100
Message-ID: <CACRpkdYy8nPeJbBVMsyh6DAeKXPMnsdp7CwK0O2oLWG++oSgDA@mail.gmail.com>
Subject: Question on device links
To:     Saravana Kannan <saravanak@google.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Saravana,

please help me to look at this device link stuff in the pinctrl
subsystem!

I started at one point to add device links for pin control and GPIO
based on something that was done inside a pin control driver,
resulting in these patches:

Enforcing links in some select drivers:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=consumer-links

Enforcing it over all drivers:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=consumer-link-enforce

I am under the impression that your generic dependency work
now made these patches obsolete, so I can drop these branches
and forget about it, is that correct?

What about these two drivers we already have:

$ git grep link_consumers drivers/pinctrl/
drivers/pinctrl/core.c: if (pctldev->desc->link_consumers)
drivers/pinctrl/pinctrl-stmfx.c:        pctl->pctl_desc.link_consumers = true;
drivers/pinctrl/stm32/pinctrl-stm32.c:  pctl->pctl_desc.link_consumers = true;

The effect will be to enforce links for each handle from a consumer
of a pinctrl handle:

static void pinctrl_link_add(struct pinctrl_dev *pctldev,
                             struct device *consumer)
{
        if (pctldev->desc->link_consumers)
                device_link_add(consumer, pctldev->dev,
                                DL_FLAG_PM_RUNTIME |
                                DL_FLAG_AUTOREMOVE_CONSUMER);
}

Is this also in effect superceded with core dependency tracking
so this code should simply be deleted?

Thanks!
Linus Walleij
