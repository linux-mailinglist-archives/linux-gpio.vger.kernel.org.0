Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF4832CE33
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbhCDIOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbhCDIOs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:14:48 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CCAC06175F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:14:07 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a17so32237402ljq.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7DE3EOn1LK/QiW+pLa0hfXIsp16ijWPfYYWPT7KOMCY=;
        b=OlRTcnZ1Dv90YX3sASl4duzPrkW2Hl1l+B/t+0QNwArp474ZavCfZReagMouJgCY5E
         jncwOHQTTXWvcvmYO/+UsqsqtVpVputW09BXeaHhpdcn/6i99XGN/rsG/RZZH2pNpZMr
         BbJ1BFQfnYkfwgdjIYggV4zoXNP2mM7N5gKyULDkASPy5bVUhhwYtURCLYtXx27GeefR
         evoFDDLw8xT25h7k/JfUByvQLjs4CrT7krJ9jP++196k9jtd6pXFuXDFxh6QaqaVkmp7
         z7oTxTO2xwha3P+t9CAiinBQGDFHGdxP7yprFahLaOQkIHbXxfFf8FnDBVinpmY2IHUC
         9Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7DE3EOn1LK/QiW+pLa0hfXIsp16ijWPfYYWPT7KOMCY=;
        b=DfCfHVDnUjTzzsIWMhx6KOY8QLsJrNob0tL9jT4CPtpZ6SY++PFCtYV91wxhM55jCB
         AxCv7jFhxDDBkgBMt/ZIDSVnip+1JFLx2uVuu4Xl2DnNHvlyfgjtM7MQGn324dM/HGJU
         ra8OokkElPr1XERyDM6Pb+8T/2gAYcfyHXawZmTSq6R671MHE9jYrFX8nhCUJYoHeCRP
         q/MfHnAcpI30Vg8yt7NJ+0SD2EqNATvQq+40/EDebWV4xDTLjEW6GAKTkI1dswlWxQ7C
         GYdA9VsRYU8UDpy3wErGH/fjMAqaZYm0m0HvvHBHEcyfhoU3PsuFhRt2xSCmg7I80Qj3
         tc1Q==
X-Gm-Message-State: AOAM532nRJmmi/H/KwQgNLeRExqT7XBmw3hndOLhyb4DzIN169kW8ejH
        W6dU90hyjwue0HTLIwWzvbRERt5QYmI3WUc9MDP9Ww==
X-Google-Smtp-Source: ABdhPJxF2y/oAkTQveeV+6k32lK7mTd6pcnX8/iQxyXeiafRULoetV+AexgBOWv5iLq2yF4Uy79/Qz798b++kz7zvq8=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr1758960ljw.74.1614845645809;
 Thu, 04 Mar 2021 00:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20210303142310.6371-1-noltari@gmail.com> <20210303142310.6371-2-noltari@gmail.com>
 <40403445ae34e822474e5f39be75fd0b@walle.cc> <E341768B-BF42-4749-8D43-8C5CB24D64C3@gmail.com>
In-Reply-To: <E341768B-BF42-4749-8D43-8C5CB24D64C3@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:13:54 +0100
Message-ID: <CACRpkdaJ3kGj6wi7L8_0WXq_dj4tt2LEbhPUy20R-Z-Mam_pdQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 5:12 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> Do you want me to send v4 with these changes?
> Or maybe just this single patch?

It's usually better to resend the series because then the b4 tool
will pick it all up properly.

Yours,
Linus Walleij
