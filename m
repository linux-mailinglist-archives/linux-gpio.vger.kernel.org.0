Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A945AE6D6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 13:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbiIFLrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 07:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiIFLrP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 07:47:15 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74F73E74E
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 04:47:11 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id m1so14758639edb.7
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ngBAVCxWIlH8IqYdCuJaPRZX+NvS5qeJJgCq9JPi1ac=;
        b=i61C4OstlNuj2Z1KBA3wKr8d00GO3ZCWwyyQYAAwqwNH7lCR0Poxa2XeF/vihRVqZI
         SMtutL6hXnuzsKNTnD4TCWWvwsAX7eDPI52N8kj+WwwBqGDH9a5K+WnY8TTosIKqFhtd
         9ArJd0/3jDdGooE+QQtbRT35Jyype0hobR71ge6Rl1V+6YlO0mkh8CIF5o0Q2JQwZ6mn
         UZuyO4TG7ZXO3s0ZsnChocF08riZRO54ukvwn9mqkE2pRftPZbLumW3xN9VCgZDVMRiz
         sPoOLMaxkfarCAQkjQuzf+VyG+Kgmgs+3aF5hVX+ApL7xR9YSvevU/DXKsGz6uP1tZtk
         7CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ngBAVCxWIlH8IqYdCuJaPRZX+NvS5qeJJgCq9JPi1ac=;
        b=Y/OZT57tRFgTzHgNr5+ZZ6eHnAJJE6QcU2++9vUdIEQGScc96MFN7PdM5bbVvOM6qS
         THYv2bcKxld87+encnz8guVgomXOMXqz61cQMyiYqwVyRnrIB5jgEUwDN+INOHR5GRQF
         VOB1H0oaXdEkgZ9yvMQRzuQNL1pGz8AVo+1Wp9XuhuL/dysrj/BIBb+uwf8sqO7JQN/A
         sAG8+bjMQiX+S21UM2FYMwzsj8ixIOe8MOEIEieZck0esJrqTcIQvyF458MhR+GZQIuC
         NUyFS0sM3AGohV31/Kbj/Ea7H1c0AWiSe4sSzNLpd1QvlJo+11trOlLSHyTPuuToGTkL
         jAoA==
X-Gm-Message-State: ACgBeo2RS/p2dU6kWcktpG0XIjgmWKF2FTuLxBMtqXanoulX6v91FgHz
        ylRGtgOkAc05v3jzPWDnMnNKXtiBy77TZQEChiwxAg==
X-Google-Smtp-Source: AA6agR60go4ZlOyalFyzE2h6wepgnbqL+cKvO+3GR8QFGqpNNV+my65VHjpQncabwZoMqG4ntKYKNeWh3k//IAJyNEY=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr46828996edb.46.1662464830544; Tue, 06
 Sep 2022 04:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <202209050952.vfkohsRg-lkp@intel.com> <CACRpkdaLQ68VfYCfv40hGuGnpaMKchiTOSTJy9rnDKnBOQnFDw@mail.gmail.com>
 <20220905212156.GB6180@francesco-nb.int.toradex.com>
In-Reply-To: <20220905212156.GB6180@francesco-nb.int.toradex.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 13:46:59 +0200
Message-ID: <CACRpkdZDYVu5x=fv5ZvtH3S1OxMDqVP1yBB61WtFkV2LwdrJEA@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     kernel test robot <lkp@intel.com>, Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
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

On Mon, Sep 5, 2022 at 11:22 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
> On Mon, Sep 05, 2022 at 11:08:11PM +0200, Linus Walleij wrote:
> > On Mon, Sep 5, 2022 at 3:55 AM kernel test robot <lkp@intel.com> wrote:
> >
> > > kismet warnings: (new ones prefixed by >>)
> > > >> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
> > >
> > >    WARNING: unmet direct dependencies detected for PINCTRL_IMX
> > >      Depends on [n]: PINCTRL [=y] && OF [=n]
> > >      Selected by [y]:
> > >      - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
> >
> > I have a hard time to understand these warnings at times, but I suspect
> > you need a
> > depends on OF
>
> I'll have a look, however while the recent build errors in pinctrl-imx.c
> are because after my change for the first time it is build without
> ARCH_MXC and with COMPILE_TEST, this to me seems not a regression.
>
> Am I wrong?

It's not a regression but it's nice to have COMPILE_TEST working.

For me as a subsystem maintainer it's nice to have COMPILE_TEST
working because otherwise the bots keep pestering me with this
kind of stuff until it is fixed.

Yours,
Linus Walleij
