Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D680A29718
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390777AbfEXLYv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:24:51 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36982 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390701AbfEXLYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:24:51 -0400
Received: by mail-qk1-f194.google.com with SMTP id d10so6941731qko.4
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJOfEs/MqDUbj+5GWfxqoTL+Bnu2gJiCCqBKbfD1wrw=;
        b=Cvl7JA+e+AVFmYWhu4jfB9IBFJMs3UrJuQAHr8G84WfcFbHYYdnqNhSCTe+ZtcSnWf
         rzXWKMc6HTAUDclUVjYUUww8hXPFS50T6YXTCSLdGrNaqWPnMnrQxAd6MoOgU6DzPuz5
         BrMBv068cpA54YqwABzC/8gwXnsigRRsGM/gtorFnLkDK+whFy50WUW8FVR57zy4AWE+
         kNzBR+1njXc1ImbB9goDKdUvjbNPZcXF7yDvJb3YZUZUR/pYPtQiNXXfqiow8V//vFpR
         KfTsSDiGsVVBdvgCwXal2d90XQF3X0YgmERFZmDMipobhdPM/xt/Xtu2BfXtCE7+LitZ
         GPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJOfEs/MqDUbj+5GWfxqoTL+Bnu2gJiCCqBKbfD1wrw=;
        b=T3jd8qdndEPkIPpCsh5pQuuLlyl3ODRWapKPrl0bqpex3LDKId8ZWPeo4PMQ2Wxgvq
         GJ3/ff7vluxnwvL2HL79k3coizoGQx5Ei5IhQ6Y2jBcjZj75KZLkIGWgr5ALhG1Oe4HG
         9ZXKFJVRPNB07sGN5dr14oiXS99pAeAQEIVozmyfjF9Mf2BKY7DTpZbP7booRSYkFn8D
         ZAdgP/yhOQ4GhGgs63cnJXArNHBmkTbBe/QWsU6RcZ/WF4NVc8Hpf9j3JttmrnW5PV0V
         QZMHlZTRMQ0dDmCCUG0UNws0bUq98iOga9GCzhRkrZdTximpnQoKs3nIDEZVZXR4ANmz
         TfLg==
X-Gm-Message-State: APjAAAWtA6Dt7HGhBbljOv9iDbI5PVzZ2RKJA/eZeIqptWCqNSrwrrUz
        a99Wr4fnkC+xvRKkRbvA26u1atZxGAfpl2MmfjwHpA==
X-Google-Smtp-Source: APXvYqwdg7Y2VtK6CWVYHgo4gTEBhE8cGin8YUEKNu+EbS+93jSoldSI3JTfoxGuJdQANtMMQQ2lmSxsjjO2/iAmeuA=
X-Received: by 2002:ac8:2291:: with SMTP id f17mr33453092qta.51.1558697090303;
 Fri, 24 May 2019 04:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:24:37 +0200
Message-ID: <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: stm32: add suspend/resume management
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 9:42 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> During power sequence, GPIO hardware registers could be lost if the power
> supply is switched off. Each device using pinctrl API is in charge of
> managing pins during suspend/resume sequences. But for pins used as gpio or
> irq stm32 pinctrl driver has to save the hardware configuration.
> Each register will be saved at runtime and restored during resume sequence.

Both patches applied.

On the same pinctrl devel branch is also Benjamin's patches to support
the "link_consumers" property on the pin controller descriptor to
enable links from pin control consumers back to their pin controller
suppliers, especially important for STMFX.

Would you please check if it work fine if you turn on this feature
for the SoC STM32 pin controller?

I am working a bit on refining the patches, so I want to enable testing
with some SoC pin controllers as well and possibly make the
behavior default.

Yours,
Linus Walleij
