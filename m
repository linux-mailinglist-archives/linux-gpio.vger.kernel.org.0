Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1341E3DB6D6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbhG3KGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbhG3KGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:06:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915F5C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:06:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h14so16814110lfv.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MDeaXXNGwwhC0GkHf1gY/QFrTI8fvHufxHaO7O1GHSc=;
        b=l6ygxwSOcOrmGad0iqZLsX9YS6hEMiuRBWrFDbo4KzJzbWMnF7o+LYM8KgzazwtA7a
         oECIgyewDj0P/nztKn4DAOuPhkRCheANdkHoZw3ceY1cP7/YP7rrMQWPmArcrlMs8A5D
         sIAndcIkZ5x0Y3jwbSfdixj36Vhx3HzMds6Hqfm+r1365sTmxf5r0WpuVxGET2tOaZRb
         yTOMRRGyNyAijnsZ61yDjuJ5ON4+GUU3xOSb3g5sjssZmg1XGZ856c+vOxsTV8ZQzHPt
         pdGb765lKcsigwhlc9fkS9ay7BMoPA/gh9yyVvmUlZLYojaCv+h4cPnIdMifit9G3jUS
         yXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MDeaXXNGwwhC0GkHf1gY/QFrTI8fvHufxHaO7O1GHSc=;
        b=J1gXl0BjxdR57yx6e5iViZFpBOO/glfBBYEvBTAkWghi7G7kQOykIlh9FoJ5GRty8w
         NRl1E430z02sfGSzWACc18sHruAPrTW316Rqk9djntMBhC48IRAcHtv8CkHHnOOD3Rmz
         Dj1IcOq4dBymU6ridlpQUP3B4wCQK/umJdieW0IJVA3db3W7vDMvGZi7OhCmPJu7Je2i
         VnicDItgB7t9mwRAk7lTwWP4/YXiQtGi4n6vzPwjfsuXjtUhlPS2aqoybjpeHHZAkC1a
         /zTr80sDjSSlGceMGkvw+KlXADSOpPoSwq9x5EWBqkMXr0MQnq8i5lwy9hdHl2qKnQmS
         ePYQ==
X-Gm-Message-State: AOAM531d/whcltJVSKgHdFCmjhp0l8WAY/bjjrJfuqClVqFTIan9dlhK
        Kg5n7jxkHzCDEPkDJbS0PYrALHYIbraS5EV0uDvr1g==
X-Google-Smtp-Source: ABdhPJxIxi/Xh7kQNOz/Hu2CF2ZuFyTD8nJZybojkWqTbPPHLBGavN8isAU7Mz5znqylohWgsjgDVTd8aDHvR2FvBVQ=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr1288506lfu.291.1627639592976;
 Fri, 30 Jul 2021 03:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210716131341.3370620-1-festevam@gmail.com>
In-Reply-To: <20210716131341.3370620-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:06:22 +0200
Message-ID: <CACRpkdbeRufGukxKhY=-SwQAKJrZW=VGph_tixANtJk6q0MaJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx8dxl: Constify imx_pinctrl_soc_info
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Dong Aisheng <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 16, 2021 at 3:13 PM Fabio Estevam <festevam@gmail.com> wrote:

> The imx_pinctrl_soc_info structure content is never changed, so it can be
> declared as 'const', like it is done on all other i.MX pinctrl drivers.
>
> Make it 'const' in this driver too.
>
> Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Patch applied.

Yours,
Linus Walleij
