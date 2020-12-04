Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863512CEA99
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387569AbgLDJOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387531AbgLDJOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:14:39 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5180C061A54
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 01:13:52 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 142so5741099ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XN3FvCjmFNo5Sr6ESr4GizIse9YN91u6D5JhDvwqTc=;
        b=GBst2pETPJ1j+SpZum1btOVpGJOd6ns7aePudho7xjkOALoKW9+qWfjMJvKK3OxElK
         p8z0BgvKP8/IT40pDMT0s6H6VKbA70f15oN3L+ocyFtEnnqChD6WNaQ2qQNChI0/UWdt
         YklAsG4+m4LHxLTt4kjbDG9h5veAtuCvXhBgPx/r7Rj7yv0H4RUG0sMkn7kc1mO8HURq
         p9N7JUnTyyRq7oNTzmD8tL77QrEuQl7QFxdbeb3+HtOiJqlxdxgNCBYex7IF9Vd+1PBZ
         n6eFRCPU1n1s6yvRDYX7oTmK537tQiBJsGS5AYpfLeuKLpdT9ODGZdZ3VaWJ+9uqGYv9
         FKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XN3FvCjmFNo5Sr6ESr4GizIse9YN91u6D5JhDvwqTc=;
        b=RJbjf6H/6Xx1HOtkQjedufSFHlyJZJ811j1gM94fdYmv0gE+v4BzjPI8KEWINQUEbo
         +6DDvBLxHKhYe/SRpwErUSNcl0O5ViWZr5xb+YOtoMmA3SMeNkJOqjFL/PMtRNHhFCoj
         VFE++WcrCJDZL18Nl8HbcB76gEELRWRH7M0bMBxWyuXR/BfZANdKO9gi99PyTZxRzAwB
         PAOW9xqOfbi3RQv73GcTq/wlTfbyUcST2DqmeEL+QPxE91x/Fb9wfU0GuTPa+OXvksyM
         pw2Z6QyRemO0rHFLiBuFD8mVFKFgnzorjU98EsQk41sHvBsxqX+EVNF8ZGZZcKM4MGES
         1Fbw==
X-Gm-Message-State: AOAM532UlH1Ku1J8RAD580pURDeq4Rd7ZO5kcYgskq4M0uvPG9nlpNi7
        K7vjkRDzdKRyPpL1zUwnQpaKqmpQdRBjt4LKpKMZBQ==
X-Google-Smtp-Source: ABdhPJw5qYm+l+Rp/69vH4PvUB0w/FnfN/CwLKYy56wGElmGSDNFyMyPm7Ra81YrEho49ZapdSAiLLv+b56JVz4/h3c=
X-Received: by 2002:a2e:97c8:: with SMTP id m8mr2792964ljj.338.1607073231283;
 Fri, 04 Dec 2020 01:13:51 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com>
In-Reply-To: <tencent_220963AF059847E1171B4AB9@qq.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 10:13:40 +0100
Message-ID: <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To:     =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Cc:     khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        jbrunet <jbrunet@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lisheng,

this patch got a bit mangled but I get where you're going.

I think Meson needs to be augmented to use hierarchical gpiolib irqchip
because this seems to be what the system is doing.

So start with drivers/pinctrl/meson/Kconfig and add:

select GPIOLIB_IRQCHIP
select IRQ_DOMAIN_HIEARARCHY

Then use the generic hierarchical gpiolib irqchip as described
in Documentation/driver-api/gpio/driver.rst
Type
git grep child_to_parent_hwirq
for several examples of how to do this.

Yours,
Linus Walleij
