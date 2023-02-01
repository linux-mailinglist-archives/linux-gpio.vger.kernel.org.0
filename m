Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B57F681F5A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 00:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjA3XF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 18:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjA3XFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 18:05:07 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C1328870
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:04:40 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id q9so8783778pgq.5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XdRC0OQkVR/ozB2hiuV32F6DVYjFM4/FcPLtjobz0Ao=;
        b=KOIq9/jg3JX30yP8DPF9fmoHorPXLFxGtJPT1u5/kXCZ5Wt5bPI2asmD8niO9Kzx+M
         xD/Gkd6Ql+W1ToFWl1AuhlyUhj1fMctfmUim7NRt+qXh55vestjQDdPLLcSGEPJx9aky
         Q+jvP4IwoUr4OHtvt4ktlLD1cyo68+qD6H4pAKGW0w5OP+zvDrbdEQnKhUjkm/S22wc4
         akUuTDIFYfeQ2UrLpFV4v7imYvCH2IP1HOrolUZ2yeLXBvcaC1R46c7+F7T0cBHs06qs
         xvuwskMX+c+nWA7TqLVpnNKGR758TXg/Bh5hX5Ymehm0ObyejY5rxX4TLNZYqIQIfSem
         Epsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdRC0OQkVR/ozB2hiuV32F6DVYjFM4/FcPLtjobz0Ao=;
        b=5CHtQL8L7WwJeGv25PbScR/Sy8CMHjWhXEvNQ+AZHSKRWMXQn4IPp0MU6/D+Knae5r
         yAfJLb2/qxG6KcHW/6IKROikd6jBRDIdEHKmA0ItuAcWem4aSiiZbOS8B59AAwewLlPQ
         bIMSsdaklio8O2GOOOJjsuS1R/8CreODv8O60m5AlvqwVMkwu+YVg9jdRPj0zqG0+gjt
         dBpvWfRi07YZcsjFFMFkXzDlrTpHrW3d3KvGVenWolI06m6kvLNLxOS780gNRR4OrjAK
         dt+i8H1ubXRuG9Y/3TERC7xjyWIXZq0krDytJRCxoRS/EFd5OHta5UNEFaI6X2SRbX9F
         ExeQ==
X-Gm-Message-State: AFqh2koTnLRycIwgoCXdYfYOyPLAyRBg6Sy8owtgBKf9eqbpSsYq8Vwr
        0rHUnND+yBFGdx4lt+m3xz9sbIFlde1EkIFMv14kGg==
X-Google-Smtp-Source: AMrXdXu78ZNBFwh1Hdz7MGXxBugR+lKveWyplrZS/KbJUqwTgyFF8mtvAlEh8NiqWf32qu8rg8xqReGWQy5C+y8rEGM=
X-Received: by 2002:aa7:820f:0:b0:58d:a713:d1dd with SMTP id
 k15-20020aa7820f000000b0058da713d1ddmr6673321pfi.59.1675119815929; Mon, 30
 Jan 2023 15:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <20230130085542.38546-1-naresh.kamboju@linaro.org>
In-Reply-To: <20230130085542.38546-1-naresh.kamboju@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 30 Jan 2023 15:03:01 -0800
Message-ID: <CAGETcx_411fVxsM-ZMK7j2Bvkmi2TKPbzSuD+03M3cb7WKHfJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] fw_devlink improvements
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     abel.vesa@linaro.org, alexander.stein@ew.tq-group.com,
        andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com,
        brgl@bgdev.pl, colin.foster@in-advantage.com,
        cristian.marussi@arm.com, devicetree@vger.kernel.org,
        dianders@chromium.org, djrscally@gmail.com,
        dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru,
        frowand.list@gmail.com, geert+renesas@glider.be,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jpb@kernel.org,
        jstultz@google.com, kernel-team@android.com, kernel@pengutronix.de,
        lenb@kernel.org, linus.walleij@linaro.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux@roeck-us.net, lkft@linaro.org, luca.weiss@fairphone.com,
        magnus.damm@gmail.com, martin.kepplinger@puri.sm, maz@kernel.org,
        miquel.raynal@bootlin.com, rafael@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, sakari.ailus@linux.intel.com,
        shawnguo@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
        tony@atomide.com
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

On Mon, Jan 30, 2023 at 12:56 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Build test pass on arm, arm64, i386, mips, parisc, powerpc, riscv, s390, sh,
> sparc and x86_64.
>
> Boot and LTP smoke pass on qemu-arm64, qemu-armv7, qemu-i386 and qemu-x86_64.
> Boot failed on FVP.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Please refer following link for details of testing.
> FVP boot log failed.
> https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-devicetree_20230127001141_407071-1-saravanak_google_com/testrun/14389034/suite/boot/test/gcc-12-lkftconfig-64k_page_size/details/

Sudeep pointed me to what the issue might be. But it's strange that
you are hitting an issue now. I'm pretty sure I haven't changed this
part since v1. I'd also expect the limited assumptions I made to have
not been affected between v1 and v2.

Anyway, I'll look at this and fix it in v3.

-Saravana
