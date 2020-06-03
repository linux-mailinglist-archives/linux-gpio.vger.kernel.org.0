Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE3D1ECFE1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 14:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgFCMe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 08:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgFCMe6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 08:34:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E01C08C5C2
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 05:34:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z9so2447863ljh.13
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PI7pydsdlkyMsOD6xUcLp/qzxqU4rnGyfjXgCb9CfWA=;
        b=xfnWQd9oEyAsFzOPGt1mBJdArDRnh2rm2HZKJiiufZ4G3XU4PfqVW12McDu5EdvBVb
         qyfCex95T6C8Tcy86/IPyXEU3S80ASk+HARGYDiI6ViBZrc8pU4AWMn1Jqp8fW1s8W1g
         rRcyu95uIpQjRNQ0t7A8VWRPB0Gjrr7ZjNixzNhSgX334YRru7RYUn5hqcPerbW9I/vk
         IUaQ8XN78CUAtwSMO7xGQaeSOXYyu8EoTuCMR15KHfh8nAVjRMCqTcvKmwNbafE99vnv
         TaEjAvcLgbbAIs3kQ8rZcHoQPOI3s29vSI6VHexaAO6k29daJjUDM2GVsCcOKfV0FEES
         j8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PI7pydsdlkyMsOD6xUcLp/qzxqU4rnGyfjXgCb9CfWA=;
        b=BG84IUd/lBUjN8WxqA5PeRkmxabKyvz+39AShNUHmvVheekixWaW3+DNQxs5nVpUfk
         vXqz1l/dafgz48kSOdh2C9bAnxNnpTtiMXgDL5jJg7ThLRC+sDbzdRR1+6BXe7QL9T2h
         cTKuZNR3iZ5Xk5hmRKTrLmSo0UI7Y2a9HEhdwFiIOVspzXxLPdiRKkzez9W15UOASfiC
         tRJrCSAfHUyCAZaJrT2HsgCu441eTw8On9F1x7gP2YIYdlB97F7WQz77L0PCBlZlXAMh
         GDJLhjpdoNg4c+NT4GdoyZN6gdbewxTS/eH3EhZcKcNuzq3nt1W8zrslvpWvLLA4L9SU
         eMJQ==
X-Gm-Message-State: AOAM533pzS6IpldQWXki2ViftlIUcpJA6KcBgf3ATrfhKeS7UTwQbbKR
        MKHm4dF3w+dzng0kEZFbvYpgMR7bLilxtMmgtiuhhA==
X-Google-Smtp-Source: ABdhPJwzUPzaqApWBasR0U8pnoYQewI2Zvey0OigUC/P5cfEYrETfElS5dHa5BQgryE1VDaIwAKQXp5y9hxab/Kb4RY=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr1926898ljz.104.1591187695709;
 Wed, 03 Jun 2020 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:34:44 +0200
Message-ID: <CACRpkdYR11Gy99N0TPCkNFoBKKQLP2x3JsnH9=_S7mxPXgYKig@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 30, 2020 at 10:49 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'pinctrl_unregister()' should not be called to undo
> 'devm_pinctrl_register_and_init()', it is already handled by the framework.
>
> This simplifies the error handling paths of the probe function.
> The 'imx_free_resources()' can be removed as well.
>
> Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
