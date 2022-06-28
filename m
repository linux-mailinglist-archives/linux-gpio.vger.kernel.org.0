Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9882A55EDCC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 21:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbiF1TZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 15:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiF1TYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 15:24:54 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF7A25C5C
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:22:25 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3176b6ed923so127152837b3.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8mNceUjsEzV58CF8Izijaf1LL3RieDehSF/+hLMsKA=;
        b=JgN0mfHT+WkY7l9z20sPEEiVEFNQpYJGJ2Q9EgyebwjHWk8c+2IB0NiKp7A7y0jK31
         pSegamBFQuXDaV6txhKbomrXZJKL1VgXbHPqfvhndP1GAo0pITsu8450NZ7IymPndapE
         kWc7FG2l8uKCyXFtfhpkcltuabV1j+ts0AAIuFIK+L1oVkCpToytEKJl3CV/3ogqHkRx
         C9qid2GCyJvpUzoHvI3Lp1zABSRtTL/GD+1eRRDDadFU39bANf40UuiZVB2HmUEjMgzg
         uQZQvyUExIsgevBH5UsWHSlVJmPISjFbXU45HCVLP3YrbP4hl+B/9czk/6HS7AhzhIpw
         1Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8mNceUjsEzV58CF8Izijaf1LL3RieDehSF/+hLMsKA=;
        b=l11fugCZx5Eru+HtMOX14fq3Dvf/UiGoB8M9RqjxF7nVx6Wez0TSnxvWcwf00XefLy
         +RglQrHAGzOOgHDrZn1cd4r1GBUvnRCzf3RTMM9zy9SYYIBates2IVCPrxTfHgZP3zT1
         uV839blxjnIY5AVJ4Z8LeR2VIfrKQjjwSHTBFDLgXeHXLMn7QfpEyA3WuYSG9j66Rxvb
         KMNow/VhLC6YaEth9/idcLq51ALXGPNhHCC498bmEzl8YLD590NJchKQLDRp8BXPPIU5
         92ExT8LihJCViVvmfdK5RLgKgOIeZW+TGjrioxHyVwuAP6MXUj8M55+xz4u59OmiSnpR
         9ZhQ==
X-Gm-Message-State: AJIora9dk2fomLuvAWnNEY9SGcAveyzJgGTOLsOsRSkL5aGrwucIbcLC
        Cdu3WSUno9Zl9mIj79rOfa9kFWOt8A970jQEHM0=
X-Google-Smtp-Source: AGRyM1s5xAvBeQDYA0el4oRa6jVQqKQ58Xu91Lfpu08nVibzfy2+8ppFdgNYXJw33bdPtqXoQTifOYbiGc0xVxy4VcE=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr22635041ywa.277.1656444145025; Tue, 28
 Jun 2022 12:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com> <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
In-Reply-To: <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jun 2022 21:21:48 +0200
Message-ID: <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Sungbo Eo <mans0n@gorani.run>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, git@amd.com,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 9:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jun 28, 2022 at 4:35 PM Shubhrajyoti Datta
> <shubhrajyoti.datta@xilinx.com> wrote:
> >
> > From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> >
> > Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
> > The output port is controlled by a data byte with register
> > address.
>
> 1/ Have you checked if there is a driver that sounds very similar to
> this already upstream?

Actually, why can't pca9570 be amended to support this?

> 2/ Have you tried to use gpio-regmap? Why can it not be used?

Same Q for PCA9570 driver. (Maybe gpio-regmap wasn't existed that time?)

-- 
With Best Regards,
Andy Shevchenko
