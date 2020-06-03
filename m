Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553441ECFE2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCMgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 08:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCMgR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 08:36:17 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1E5C08C5C0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 05:36:16 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u16so1203808lfl.8
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2oyZw0RFpvd7NmXeAe7nEQlUj76DhyhPpaW7s64pjzo=;
        b=nYbT+KBvLmwkQ6le6OlzAzNOKvT3Jh7p9gr61RHPWHvUzcjcnSFSjWjunQ/a14BwFl
         RYVXP8Jd6L5c/jA8xnImgA5ldUsdUiYHYpHi7+isWWKHQ5qEaNQW1Vqzix7ErPwjSQ0/
         PJHJl+YSh+/WG3rXz1W8TWAqLbQ5DdErtdDy7ROGhT603o53dqXT1Jf9y3q+6Mordp9+
         e283njEu6S6F/edrVG0wwT8uBAv7JnoOe51eiNmVuASPn6I7yuwgMNGBc/kPblXDf4Cq
         /PeGpvo+3Nqm9MB1MnLI0dWDpEybIlTrf9qaiCDVEBWudLTlwfCbPbAQOMP1aAlSvQ+6
         fNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2oyZw0RFpvd7NmXeAe7nEQlUj76DhyhPpaW7s64pjzo=;
        b=EdPPT/aaKtQArDhW10jrhwBWKtt1LUY9Gt4VNvMhQauIYX4eMAmPBcFPK+k58e3vj2
         C0T2J3/ONxgXLNxMMm+cMc/0neQorEgdAPK+IJgY1Z4Y77QA4T4wNhSMFhu67RI40mR4
         6DB5oO32sfDC95+6EEW+ot5ipEv54Jf8ySKfJt5iT2+f/KG/48ubFm5BlUqXMITwS+6e
         bzOhCsxFFUDxnknjBkfL5mWnj9nX7WbYDjplP/rZatNUHBv7x43gyHgQGqVR/Txw1PN8
         w47HNE5omdQidXq0aoDaD+svqCxOurqtTw2hY1bchSVDVCzrK8mSHjNG+DYLzbfsqLal
         v7Kg==
X-Gm-Message-State: AOAM533wxZnAxI4p5Wf7GiUavmX3MM9HWoq8webEhk97sfyHEWExlUuj
        8gRCQa3WNBooJjqNkNu1OiIQU9CE8rgGPPu650fw/Q==
X-Google-Smtp-Source: ABdhPJwCYemYvuXwzTBpyi6T9nzWXhKBePZlC6Fv9LIFM+G4DsxpeTAyg4aaSqPz3ZBzGFeYp/yuKFfOc2jEiOJ7ASU=
X-Received: by 2002:ac2:562b:: with SMTP id b11mr2394435lff.47.1591187775383;
 Wed, 03 Jun 2020 05:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:36:04 +0200
Message-ID: <CACRpkdaVcTqPcpf9jgauWEuinJG1aJm-OC7nCfFy=PvBz8UdXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a
 resource leak in case of error in 'imx_pinctrl_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <aalonso@freescale.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 2, 2020 at 10:06 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Use 'devm_of_iomap()' instead 'of_iomap()' to avoid a resource leak in
> case of error.
>
> Update the error handling code accordingly.
>
> Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
