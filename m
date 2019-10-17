Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12BDAEBF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 15:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394727AbfJQNuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 09:50:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41425 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfJQNuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 09:50:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id r2so1953168lfn.8
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kIxf0CXaMXP19ytls9EVnq9glUVujBoZEFuoo1TReUo=;
        b=WFJDo9JbE2wQezugkwqR86osos1Syqspo2i/9//fCoGIj6FFgH5sXT3dz00jn4CZTX
         yWs6J3/uwlgocDSUtK0dcRGPdXehhbWTcNsMf4su1D/BhDgkJx0CInnSNCvYktAR+x6T
         VTVhyqj7+cakT+AlmFIPqnmA2rkS02Gf4rNlEwTgUSOcOC1xrR9okh4/ktcuvRy9q/wM
         BLkcSEUWWnrSm+vUQCKXW9O00OeRSINOEcAWPrNjSiygah1sMAkT4hfinU5KzOY9J9XE
         w84JJDFvVJ7Y1YAbzgkSCTOabaJpsMJVOQKMVTtJ+z4S+jpWkb1/hdUePd7HOMMPawpA
         leVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kIxf0CXaMXP19ytls9EVnq9glUVujBoZEFuoo1TReUo=;
        b=TslWm/278cF34hmKhK81NMcCSDllFNCmwKxHrvkrEfDluL7xiv5xYQ/GYz2rrQWFx/
         oPKbMb0EkyMU++yc7pnquuDuQphjXFi6ZrOuJwZJ4QwEbzlz6RmvMqDFd5LpGlPhvRFo
         0NrsxanxyXhDiAsU7LXTlLUiFncgxvYlutrOQLMufZ95ZzfBEN9Lp1spE2pyBum6VAP1
         4C57FdIurLuZUyPpxTv3qkL2EM4poATBVoOeG/QEDQwl7h12zD4km8VCoc0lq2v3cTnI
         52sHLL3NIJ67Mrg++CZFMyP2bCX1+dtAg7UxybGgiBIivjthQf/kZ9rA8kwOKvywWK+K
         n9Cg==
X-Gm-Message-State: APjAAAV0jQKWnBLxCwwV+l07fShHsbPFfgde08VQxq+qZhUhEIEwJZLS
        CR00KKhxVMa/oLf41xMZmtZhKfsr0jlG/yYoxqE=
X-Google-Smtp-Source: APXvYqzgok6YCr+ARGUVfkAfSpmySMXExzm3CebcPHplItyosGcqxrzCElEN0I/T7z61egyDR4W5gGR5z5lBUAkmu9I=
X-Received: by 2002:a19:855:: with SMTP id 82mr2429104lfi.44.1571320198501;
 Thu, 17 Oct 2019 06:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AuCCs27+hYTjs2w9j=nKUv3jzEraR8q1qSDg78F84W4g@mail.gmail.com>
In-Reply-To: <CAOMZO5AuCCs27+hYTjs2w9j=nKUv3jzEraR8q1qSDg78F84W4g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 17 Oct 2019 10:49:48 -0300
Message-ID: <CAOMZO5DmHSYybje0bVk_bnVVp_pMRnTbXx8Kd_yRgXVOy12mTA@mail.gmail.com>
Subject: Re: pinctrl regresssion on mx28
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sascha Hauer <kernel@pengutronix.de>, Marek Vasut <marex@denx.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 17, 2019 at 10:19 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I noticed that on a imx28-evk running kernel 5.3.6 the following
> pinctrl error is seen:
>
> [    3.758280] imx28-pinctrl 80018000.pinctrl: not freeing pin 24
> (GPMI_RDN) as part of deactivating group gpmi-nand.0 - it is already
> used for some other setting
> [    3.773300] imx28-pinctrl 80018000.pinctrl: not freeing pin 25
> (GPMI_WRN) as part of deactivating group gpmi-nand.0 - it is already
> used for some other setting
> [    3.787913] imx28-pinctrl 80018000.pinctrl: not freeing pin 28
> (GPMI_RESETN) as part of

I have just retried it on a clean 5.3.6 and I am not able to get these
warnings when the NAND is populated in the socket.

I only get these messages when the NAND is not present, so I think all is fine.

Sorry for the noise.
