Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C830764D301
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 00:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiLNXJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 18:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiLNXJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 18:09:03 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC5F442C6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 15:09:02 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id js9so8602496pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 15:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ehVNxRAk8vtcQmEsS2DeBEXBsGDUIlgGFYWQTXu6Hk=;
        b=XGNT1V8bB+E+b7ARt7dy88tch1s1aCC7J585miYX8QJAQHTQDryfRyy/yUbZe84R3Z
         QJ7OhpwNdCrA01EPKWFvknWSPw+t9xl6+DApoaVCcW9P6hnZtW89BYPZAJ42P547x/26
         meb60w9D91tfFRNBLiL1qGf8wirGUo1fIfqMeHLIpjqP9c1zUtguR4FFW4p6uewrkK86
         xKAydwss7Ktfjm8lJXjr8VmFLpKBGTgpQ5ZyG54z3vn2vPZMkDHePBP9fauHDYHKsmcP
         HmzlCquXfd7JZcmZ5jRnUHrATM998CH2pypijXpvXMtUOZSQ9JXbvaIr0ZWopAfdXi6o
         tkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ehVNxRAk8vtcQmEsS2DeBEXBsGDUIlgGFYWQTXu6Hk=;
        b=NxPtyXZvlbn/DrCDR6p9Bm+acUXVesT/3pT5zHM08XNg/sukYjsG8TKyVJLciaZ/BG
         dcmMACthSfE8qsh0lDLhMnHwoA0egUDuundCLHrnXV9kzks+h1vXzO0pcdmyiFvCv+Oq
         pHnpi4aj0Bak8x4NCP8OiYLO1fJb2gG5/fD11DEiM3WTmUkbBlfd3bnWDCVhuoEiLONW
         +IUUdNzsyVS5c89ctuKOErFLiOKTHdz1xAJ3unBRjrjRkKb+ur8F2lLyiebcCu6xCXBo
         9mqQYz3pXfukdNacq3Wb4g7hrm+Xr+2CXKbvIn1TQQm5OasaSi9p7C/WVHqwzdxU5hOl
         zfdw==
X-Gm-Message-State: ANoB5pmwC0iMD1ubNHQ6hFOcgwPT34U+JZ280zy2hlJIIrsf1FkQB7D1
        r1fILW5EV8kVLvtM7prTEo7ZErvYRd/AYepFd03Hwg==
X-Google-Smtp-Source: AA0mqf4F3DDjCXcDZNjOHDv7HOXv55ZrwJY8PAYxDaDIKWp/7EopgFHllqtnyYZqC/Y9dH5TVaBIAEWv4YV5P1wITi4=
X-Received: by 2002:a17:902:eac5:b0:189:f06e:fd93 with SMTP id
 p5-20020a170902eac500b00189f06efd93mr11179976pld.37.1671059341322; Wed, 14
 Dec 2022 15:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20221128054820.1771-1-clin@suse.com> <20221128054820.1771-3-clin@suse.com>
 <CAOMZO5D0wJcfbFsvUN3K17S5F4zT2Yf8yQB+wMKQPzuMBitrpA@mail.gmail.com>
 <CACRpkdaKYFbXRcV1WgDEiYPEwzNAZq-AqAHpWd1rJyW-h369dw@mail.gmail.com>
 <Y5K726npjKAO4sIq@linux-8mug> <CACRpkdbyfp3FwUfS7aDCLmsyM-3Xc1GfyX7_jFcuF1dhf+knQA@mail.gmail.com>
In-Reply-To: <CACRpkdbyfp3FwUfS7aDCLmsyM-3Xc1GfyX7_jFcuF1dhf+knQA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 14 Dec 2022 15:08:25 -0800
Message-ID: <CAGETcx8V0xop2E11oL3CcaOe4E7w61-suHXU4A-V7AdhRxrUQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: add NXP S32 SoC family support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chester Lin <clin@suse.com>, Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Matthew Nunez <matthew.nunez@nxp.com>,
        Phu Luu An <phu.luuan@nxp.com>,
        Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 9, 2022 at 3:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Dec 9, 2022 at 5:39 AM Chester Lin <clin@suse.com> wrote:
> >
> > Hi Linus and Fabio,
> >
> > Thanks for your time to review this patch!
> >
> > On Thu, Dec 08, 2022 at 10:37:36PM +0100, Linus Walleij wrote:
> > > On Thu, Dec 8, 2022 at 12:04 AM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > > In other imx8m pinctrl drivers we pass:
> > > (...)
> > > > > +module_platform_driver(s32g_pinctrl_driver);
> > > >
> > > > And we also register it in arch_initcall() level.
> > >
> > > Do you really need that though? This driver certainly does not.
> > >
> > > I was under the impression that recent changes to the probe-order
> > > logic has made most explicit arch_ etc initcall orderings surplus.
> > >
> >
> > Could bool/tristate options in the Kconfig be the key point?
> >
> > Based on current design I prefer to build the s32g2 pinctrl driver as built-in
> > rather than a loadable module. IIUC, when the driver is not built as module
> > then the initcall ordering should still matter.
>
> It is true that if you compile something into a module then all initicalls
> are the same: they are called when the module is loaded.
>
> But the remaining initcalls used to be assigned to core, arch, subsystem
> etc in order for resources (such as clocks, regulators or pins) to be
> available before the drivers that need them get probed.
>
> However there was first deferred probe to partially solve the problem
> and recently a large and refined series that use the dependencies in
> the device tree to resolve probe order.
>
> Saravana Kannan has been working tirelessly at this, issueing
> git log --oneline --author="Saravana Kannan"
> you will see the scope of this work.
>

Thanks Linus.

For a system using DT, fw_devlink's goal is to make module load
ordering or driver registration ordering irrelevant to proper
functioning of the kernel/drivers. It should automatically figure out
the dependencies and have the devices probe in the right order. It's
already true for at least 80% of the cases for a system using DT.
There are some known issues I'm either working on or have on my To do
list. So, if you see a case where fw_devlink is not handling it
correctly, please let me know.

-Saravana
