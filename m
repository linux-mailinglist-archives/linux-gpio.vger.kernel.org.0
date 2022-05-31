Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED07B53943E
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 17:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241048AbiEaPry (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 11:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345882AbiEaPrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 11:47:52 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5883389D
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 08:47:51 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id fd25so18113803edb.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kk5IwDjbWVind0mIbSujA/O0VSYka/USEApE9hKNgoM=;
        b=JqsjB+COM2GrMrq1mx9ze8MqESvA7R8r7t4s5sdHzopAnS4YBM3DUjyOi1FU4vtb4S
         H6LNn3jz/U6M6AbztwUQVL0nD1YFueIcRBPJUCXnJh3+fTVI/M3WLUehW1883BEiK42h
         Et+/VNZPFnI2dZmvVZmgDVGWMl3AwVSxyrCrmQGFlvQ70C1pIQyO0wZQ1so2Yt4Z9f00
         jKNXC08opGk9QTtyxPoEwFa/Yug+PGbzXT6iC/1hoWssSpMfxjix+XM+bBJa+BqeRADn
         v/5mzg/pXxEgCFDc4yQc06Ic+kTOJh0xVjlflRWmob+qABrjZyFbiE0uPxNmD1xGXEwc
         ZPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kk5IwDjbWVind0mIbSujA/O0VSYka/USEApE9hKNgoM=;
        b=MoCT916lCcLQzQu/FxxGGlBt2ssw0NiNqWl/f83JBKcQFrAYU4Ev2EgaJ/Cra98wfs
         vZS+xuKXzvEsLXJRxaBfBtI1Z6bBSc9LRHS40PNSQKYm5WVly0xldw6C222FCVtA47XF
         N69bvDjcBMsdS7Vdb4C+Aag5YhA9d2/QuYTBO7CBMGjqOGvJmQvIzn8DHq/nSw2zGP01
         zGbu6XXt6im0F2bmh/rYGhBrlDu6uJiUXQwIPMmWX3/VZsVfz1VuaIrH7L74PcENZ/zn
         GJIDv4F+lVdTUhBBOCt35ok9MRpF6BGnTGz3Qojv9GLntbAZJI9TqAfZmWkqsUIla9NP
         frNw==
X-Gm-Message-State: AOAM532BpitDJaTD/N9qsjBUzh8uiuBw7Xn+EQupbKHBegeL0l5ojRAN
        sm8f2+SE8Xp7K/cjqtqwhIgNe6ysC4HYi3gQkhHgBZ82YPBVlQ==
X-Google-Smtp-Source: ABdhPJxS19lDUWU8uGm6okfLBPWuBY5JV8Z7V11S5rqqWCGew0MeRCTODTWjPeeRRhQFV7xCTsUmcJAy9CsVLzulJqA=
X-Received: by 2002:a05:6402:2806:b0:42b:67fc:8565 with SMTP id
 h6-20020a056402280600b0042b67fc8565mr46735589ede.230.1654012069925; Tue, 31
 May 2022 08:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-5-Basavaraj.Natikar@amd.com> <YpXsjDEkUVw/KXdu@smile.fi.intel.com>
 <968dd586-afc0-691e-6701-3b031ffd43b1@amd.com>
In-Reply-To: <968dd586-afc0-691e-6701-3b031ffd43b1@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 31 May 2022 17:47:13 +0200
Message-ID: <CAHp75VdGLKvNaXrQjxDRzHArMpCGMVve5DQD4pcHLohGEhE9_w@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: amd: Define and use AMD_PINS macro
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Tue, May 31, 2022 at 5:27 PM Basavaraj Natikar <bnatikar@amd.com> wrote:
> On 5/31/2022 3:53 PM, Andy Shevchenko wrote:
> > On Tue, May 31, 2022 at 02:13:20PM +0530, Basavaraj Natikar wrote:

...

> >> +#define AMD_PINS(...) ((const unsigned int []){__VA_ARGS__})
> > Do you need to have it as GCC expression?
>
> yes, or else I will hit the checkpatch error as below

Does it compile? Does it work? If so, fix checkpatch.

> ----------------------------------------------------
> ERROR: Macros with complex values should be enclosed in parentheses
> #31: FILE: drivers/pinctrl/pinctrl-amd.h:285:
> +#define AMD_PINS(...) (const unsigned int []){__VA_ARGS__}


-- 
With Best Regards,
Andy Shevchenko
