Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3031129AEA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 17:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389221AbfEXPWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 11:22:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42071 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389435AbfEXPWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 11:22:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so7428563lfh.9
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QyF3o58FFX1H1q5j3kdiPxjWQwX8mwAfxQ1M8ShVyoI=;
        b=R2nXicON9l8j67j7PadKSRB4aV4W8j0X8VrwwypSh5dc/jQT2y5uUN8rZSpBv12B+g
         WI80lgH2mR8r7dRtZOOv2HePNQnSEUDtSG39KhmqNSiNiNkYA4OzyUBagAy3bsf7YDqU
         WpU+CA4s+vDA1kVZj7mmPnOOihogo5bRT1jbpXir6J/KOpZ27oTLsUSdfYAaozpPatwA
         1sRNLToQWgrSwoDi8cex+LE58QAxSyaW4ykyLPlSzUgydnGj2DgGMBXKvmwm1baKM5dv
         u848+Lu1/GSCycSO+lRYhXvlzCIviyFwen68e8/QHujHkVUwZLTw5Y6Vk3wuTMC3KND0
         JKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QyF3o58FFX1H1q5j3kdiPxjWQwX8mwAfxQ1M8ShVyoI=;
        b=g1ACCmbpAabtXdmRAPSkcmBhL+olSlWB7aETv9Z0PPIz9cBbFQtc3VRSkdIwe9OE9o
         NEFVImC5S6Fwu6EePoIK3pAzSHgnt8ANYtFzoZg9EfOWq6aGClsjpiNSxqIWvDUzQ23+
         cG2Ep29higldxjfZoqciYuD4M7SKlzVdOt6WC5BKG73ml47PB6KEtAwJkO6xOjP2lX+k
         N1Wgfr777wVtK/W1+nNJ++bPBB27pc1AltID/T/SUF2FayATOi86fq+slsaI0U11kEsk
         AbSo3ePaTb1o+uoVFMFKZZESUZDBG3Q4m+7zeWo1JFrPCvbCLz1XaA5Q/G2YQ3E6+oxW
         ldWw==
X-Gm-Message-State: APjAAAX8OX26ShmMAI6zBh/ei9dlT7mUmqaazpHlHdzKtmvxbgerrflS
        EEllfcHcraV/ccG33ESOMpoStcTZ+5h/DeVHp3Ua8N5w
X-Google-Smtp-Source: APXvYqwmvwWHGvypE/OcPxIOvNOsboOsJx8yQtKE+WMD3B1aEcSgE8sirRO4jcp62+tgDg3VjDVnaACWJ1dbGLlT+EY=
X-Received: by 2002:a19:f60f:: with SMTP id x15mr351461lfe.61.1558711341073;
 Fri, 24 May 2019 08:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com> <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
In-Reply-To: <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 17:22:09 +0200
Message-ID: <CACRpkdbJKAGyeBU1tX77-wSYzGXDBqRYR1gQyzOZ_XT4RGFbsw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 2:27 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 5/24/19 1:26 PM, Linus Walleij wrote:

> > Patch applied, can't say I fully understand it but you know what
> > you're doing!
>
> Thanks :). Do you need a better explanation ?

What I need to understand for hierarchical interrupt controllers
on GPIO is what I can pull into the gpio library. I am working
to extract some code from drivers/gpio/gpio-ixp4xx.c
to make generic simple hierarchical domain support available,
and Lina is working on generalizing some stuff.

But these complex domain operations in the STM32 seem
to be some special beast.

Yours,
Linus Walleij
