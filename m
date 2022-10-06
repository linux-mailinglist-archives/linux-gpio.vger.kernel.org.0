Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDCA5F638E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 11:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbiJFJXz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 05:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiJFJXx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 05:23:53 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8862598C81
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 02:23:51 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z23so3129326ejw.12
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wzZ9wWp7UYvnCxIpLbO55WWroOpcvUpldPq/EJxSsFs=;
        b=BEEUurO9wMsAhS9TBQKLGHJWW5hytq8RNHB/ZSvn7H4zLhRDL114VcDLh3hj4RHf32
         WABKUMQ+iF2S1Wk9iajduFk/nC/x09LF5D5wB2p+D7ilxh9EO3aiw/m8+W5vB973WhOt
         GDvHnnXx1KsTL517mw3g390tJ765RuSzGU0CS9dkd7Nt70tMWLVBdH0OYsLzM7JjpZvd
         QWVz6dBOCdBrQUwbogS2Vi9wIEqOIpR8naXwlNWCMk8gtZuZZH8FZiJ3nPOEvuEE3IQL
         GglZqgCXS91f6YncRkwotVXnYUdVkQtKSI6bz6rGt14LRksCUUiHUtaAC1MrqVscxYDP
         KcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wzZ9wWp7UYvnCxIpLbO55WWroOpcvUpldPq/EJxSsFs=;
        b=a3OMTHLyQ2UH+8sv2KyNy/kqPWYqh8UNFPzY/MBXy0No3HN3WWFsokOlVpicHE7Gqi
         cQcwhkxQhjw6C2WezDuiPK94Q2U/5LanraUWZ8/y/oRM7qrNX2rThPUn94j6iwzq8PPF
         b/j5iUXDPnSr7HtyvdMw7HjOHmOazVNHRo2wS0cAy6khkOpyFptmmILeTS2Ddr1kaDY1
         8j8zUwNbX5+pLwDRoVhhtwGf6mBjd+YA+Gq2BkGOGRuhfI6IupXhk3X+M9UjkrzrwFi/
         eRIYWH5mr+hRfVrb6NYkRCUOSs5c2exQguKuUz9coAr53ljERdgsyHkytNTQcgiyWszT
         1TZQ==
X-Gm-Message-State: ACrzQf2XBztAwvXKMCoskqt9AbkbmsexiCGwhsxi6JFvEmrz/ILCLD5g
        eb1Etw7X10EocOh7C1Pof1oZUkYf9eumz68OacN05Q==
X-Google-Smtp-Source: AMsMyM5fv69bTEg7ZmHLVuLYd2+ejXhCQ+P9GFLk9dNI1COIQDqLlH9qEC5b7nVYFds/xtn+DfHLh2K3kzXsvnk5dUU=
X-Received: by 2002:a17:907:a064:b0:78c:1511:a3cd with SMTP id
 ia4-20020a170907a06400b0078c1511a3cdmr3181681ejc.203.1665048228986; Thu, 06
 Oct 2022 02:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221006080154.5396-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20221006080154.5396-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Oct 2022 11:23:37 +0200
Message-ID: <CACRpkdaVUfM23i9kWT8hbbTEWQWJ887mDyH2WUU7GqpEmDtdew@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust STARFIVE JH7100 PINCTRL DRIVER after
 file movement
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 6, 2022 at 10:02 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit ba7fdf88e98a ("pinctrl: Create subdirectory for StarFive drivers")
> moves pinctrl-starfive.c into its own subdirectory starfive; further,
> commit ba99b756da17 ("pinctrl: starfive: Rename "pinctrl-starfive" to
> "pinctrl-starfive-jh7100"") adds the suffix jh7100 to the driver and
> dt-bindings header file name.
>
> These commits however do not adjust the entry in MAINTAINERS. Hence,
> ./scripts/get_maintainer.pl --self-test=patterns complains about a broken
> reference.
>
> Adjust the entries for STARFIVE JH7100 PINCTRL DRIVER after file movement.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Oops thanks Lukas, excellent work as always!

Yours,
Linus Walleij
