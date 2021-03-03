Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBAA32BB4B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbhCCMVY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842967AbhCCKXK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:23:10 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9911C0698FE
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:29:28 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y12so14822856ljj.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pt7bwWLf4920jEAu2gq6f6qTSZz/ofLlHmtVgGdbwS0=;
        b=OHCvDategtwfbq1t+iUQ3BUMIX/2u9CSxvhkjo6CHMesJuRzpXLXBCUJIAaN7ZW7hJ
         QCmELwk+3bp/x8hr+45WHtBDIEeaRo15ff5vIA3y3HjHVu7Fanwx3CTkIiPGdAKMJkYx
         LlzKJQ5dL/de23YEQr2LtK57p0bty2ozdNAjRqhSEgiBJYxbTwBtiRhvLZt/N4XiPFA4
         qk3fABIHDrlEdcqit8hVuBLaF87XJhXrcYY7IvWsAWAFhsH3Rhvz/sqfJXaUMvfshTw0
         W9Ohs9Ru8L+3PQKB64FxeYsQRdo8tdHIFr+1tJdgDlkKIS1t2HNLMvhJ75L3Wqt/CoUW
         OP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pt7bwWLf4920jEAu2gq6f6qTSZz/ofLlHmtVgGdbwS0=;
        b=Sn/td8K3QWw7pIm6VTSgG14ocWey8lPWlCxQHingkT7vfd0eF2we2MgZm8OLM1m4RA
         6tAi2MzduyQcPqJ9h27Jm6I7LC8sBgRExbA4MMt2Zt64qjsj5LqhjnLWUE6/IS3IHflp
         zs/ANFa+cZtsH2TCtuqCo6oG9JY05PR6gNjSQenVcQfbKnwbdUZTDCI//ZGHFQeGbooI
         aKL3vArsSBF2hcx8OCZ8ciVHeg2xMzaPBAk3XanAcl4CNNGj9GH2hhRDOf1ax1UXZIZV
         7UVZpxd9CScZMRgxvpEK30ckm813TstsabkpVa7dcmPwrKdQC/ilc4Q1QFI0UCEpsn2R
         LRQw==
X-Gm-Message-State: AOAM532EbHyIzNSla5aqUVcOks9znucXIckbLW+NR9yhWYctNWt+PDKK
        akviXop6qayOF9Y+jizoYQKkmNIzdz0rT3F9uccXpw==
X-Google-Smtp-Source: ABdhPJyBXKG/RAzEp/BaFV38EdjMQqMd8P9lhGks+0u2avRFMf+e8fP+L9KmneeIp6ivnGu7W2B8pnAFWvKAFliInK4=
X-Received: by 2002:a2e:9041:: with SMTP id n1mr14590765ljg.273.1614763767393;
 Wed, 03 Mar 2021 01:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20210302191613.29476-1-noltari@gmail.com>
In-Reply-To: <20210302191613.29476-1-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Mar 2021 10:29:16 +0100
Message-ID: <CACRpkdZQRtTi75KMFDpM6eJ9hVuPLNJBBs6bHKMt7_PNW8gcFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: add BCM63XX pincontrol support
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 8:16 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> v2: introduce changes suggested by Linus Walleij and remove interrupts
>  - In order to use GPIO_REGMAP, the need to get gpio_chip from gpio_regma=
p
>  and use it for pinctrl_add_gpio_range() and gpio_chip.direction_input()
>  and gpio_chip.direction_output().

Looking so much better don't you think? :)

If you also get rid of the exposed struct using DT gpio-ranges we are
done I think, just need some DT review slack for the DT maintainers
for the bindings.

Yours,
Linus Walleij
