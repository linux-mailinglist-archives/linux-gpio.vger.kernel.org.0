Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33746230898
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 13:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgG1LZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 07:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgG1LZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 07:25:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EA0C061794
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 04:25:04 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so10779686pfm.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 04:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TUmUMz6UgsCt+CXB7icgRI+l8Tvn7Jgl/4MrS/vbZRg=;
        b=M8+Svu+YOx7/2gsUroIjDqeqHz0fv6v2+W+hVAiWJjBagMP32QT2IblXw9nSm9xTfn
         P9JhY1yHNLyhLyPjMbyUZp5HXoSgVK3X7j3rZT7az+bSha5/bNtlA3jF4dvV5m1Cv5V0
         223oOfoaOSyr31V1z6413MMc2ZmpAIMNyHdDbkbUQO6ZycyI7WawnVNd1mZqI9qJ9e/X
         MV+nUvUTere0RZopRHkbYmVT2ARjTc3crPxm1ZWlZyq8MKceZjlC2bzX2971Djx1l4Xu
         RMC4Q/F0wfGJpEViHq5cmHpC/LadlhUnU9KqS/TM/SVFN88SGDS0PJAwWXyhu3pDJxm7
         sfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TUmUMz6UgsCt+CXB7icgRI+l8Tvn7Jgl/4MrS/vbZRg=;
        b=HcR4fxSSO7dXe0KmlOTdaylz+sgQSVbcdUGLMcnbZmtk1t59DiTT+2s1qJA10IwtIr
         f11X+pVPaCAoBEGWOxV5IlAFyysyDUxOEYuhqYZjPFN6k9rmoz3fJfvLZ7PekfFSvmCU
         oB7Bi/ErFSRTXBexTzJqNsRmXUa3k0lnXVqH4hHHBX01ZLTRwyF0gxFJAxlQ8aPhluGp
         DQ6kCduGDF7B3uTsGghMa/ib/WjfmpeGXXxqjJ2OI4a4FWsTUHCExiuO0IAMAd3aFsmI
         9ShDYJNjXaVnSEXgPSd+hc+EW5ld5jjFkOpfwMc2SMq9znk1pmj0kz0/mNPK1unmziIx
         Rx7w==
X-Gm-Message-State: AOAM533B1eIX+TgEUl2MLFdPuqHYXOcWasvLW0/KEtB23ZXH9JlSulNd
        Kqkrz4qzQg8QAGjbhVDmuJiNDQ==
X-Google-Smtp-Source: ABdhPJzHsWs+C2CAir0w1/n4qx2AAi7Eo9fWCt8dVNRFp68sei/9QQuAuxDTPc580wHpTPxR+0lNQA==
X-Received: by 2002:a63:cb03:: with SMTP id p3mr23750881pgg.444.1595935504307;
        Tue, 28 Jul 2020 04:25:04 -0700 (PDT)
Received: from localhost ([122.180.34.198])
        by smtp.gmail.com with ESMTPSA id j26sm17746105pfe.200.2020.07.28.04.25.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 04:25:03 -0700 (PDT)
Date:   Tue, 28 Jul 2020 16:55:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Anson Huang <anson.huang@nxp.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
Message-ID: <20200728112500.a43jow25yueltyuw@vireshk-mac-ubuntu>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <CACRpkdb0=9K4-F2xFWN6OvnOi5-jwLXihdphTgMCA1vTejB_Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb0=9K4-F2xFWN6OvnOi5-jwLXihdphTgMCA1vTejB_Qw@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-07-20, 09:59, Linus Walleij wrote:
> On Mon, Jul 27, 2020 at 12:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Jul 27, 2020 at 10:18 AM Anson Huang <anson.huang@nxp.com> wrote:
> > drivers/pinctrl/spear/pinctrl-plgpio.c:static
> > SIMPLE_DEV_PM_OPS(plgpio_dev_pm_ops, plgpio_suspend, plgpio_resume);
> 
> This one is affected by the same problem, I don't know if anyone
> really has this hardware anymore, but there are some
> SPEAr products deployed so the users should be notified
> that they may need to move this to syscore ops.
> 
> Viresh?

Yeah, I can't test the patches but Ack them if someone can send them to me or if
someone can tell me exactly what to do here.

-- 
viresh
