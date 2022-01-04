Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C4C484664
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 18:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235635AbiADREx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 12:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbiADREw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 12:04:52 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D83C061785
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jan 2022 09:04:52 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so47505508oti.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jan 2022 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jbFt9L6krYBtcAbEWqf0z5PDV9qPyLwggi9o0oOg8Q4=;
        b=tcZMB5CjcUmMaN+9Id/E0rFrxKPtu2D180QRxxDNQ+eUXqMRI5iXCpeIlPhxwt8xtL
         7kl50sONeFBSybYsP5pD3FfaBi2T3p5ZTocjbRR3wOBPLEqyH1dqamzOn8xI2Iozxbf1
         kE5coq8UPARsp+ArLP9KPaGT5cojTcaKXyEkwJhFYIJc4Emgr3F0fzyQ/syLJ3dQNwUo
         laBYrJJ2e2f153V8+uo5MqtcRlq6zszD57q9a8FR76bzMbNK8cRomdQoPg53DA2xAi5f
         88YoZtiL2v4Aj88HHQeyXic6cS7vgfKCjrRLvYFM3Qru74Y9Iqa9eYsOIEawT20mjoYV
         AU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbFt9L6krYBtcAbEWqf0z5PDV9qPyLwggi9o0oOg8Q4=;
        b=Pn8/3P1LhQkNdm3vrhOkj8W/P4N+ZpZwtYGB4Bw/DO96suM0oI149gnMeb1Qk1VimL
         jcofojYlmk0VUdBi7DXViprjL8NEcsliKgMJH9N2dhAORJqG4QQG1qSdroVPQY8w9Wib
         EWzisoAptoOm8FGXcWA8V63HCJ+8iJn3nwgfa/i40lIiej1vqVJwA6fb9kFYMLRA6kmO
         EL6kxdDPAsCYLH5rFOMAveiYOPJjPzOO/ZLu8hslkENc4da5/yxyNsyEo/4KD0aXHN5W
         Qo1Uh+MDm6QwTRZdHVBvEhmtLkujGRPE9+wYra/XNZihseCulacNsYiKj1g8elapRTGV
         HMqQ==
X-Gm-Message-State: AOAM530K4UTELkY7zEoE50i5qgMDU/q6rgToMQyhe//kLeZxMguIzQ0v
        T47jpHhknO1P0rtJXY58bNsB2VJm7gtZFyp5p+cWaw==
X-Google-Smtp-Source: ABdhPJwCVupKQYxDzpYMKPhj1MXJZPz+3XUECsNjRfYFrPd16sAtNpJ/PYjjfuyAFjwn0935xEp+qI2DeVBLrvPkuKs=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr37978893otg.179.1641315891943;
 Tue, 04 Jan 2022 09:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-2-phil@raspberrypi.com> <CACRpkdZ95bCJVDo4tCXsMnsXax4+ZydoLS7AsM-yzMjXbONk=w@mail.gmail.com>
 <95851343-2887-1e04-9598-e8c8ae74a99a@i2se.com> <CACRpkdbnqq+hwXt1oUWZfyxFjdd4aSAz0MzhzYVWuqqVAe4Eig@mail.gmail.com>
 <ec8090b6-6c91-e9ae-fd02-955c8c10ee3e@web.de> <ec60b52b-7a59-266d-9608-11c0da9053a6@i2se.com>
 <5a5bc9ac-6d8e-d6de-eec2-ea72970b88bf@web.de> <0951facb-8b19-c0f3-4f25-a5ac4a798859@web.de>
In-Reply-To: <0951facb-8b19-c0f3-4f25-a5ac4a798859@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jan 2022 18:04:36 +0100
Message-ID: <CACRpkdZCiRJ-8eN3arKgt0s5iWgGwGE=aZMo7yx7UtUn=GNF2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Jan Kiszka <jan.kiszka@web.de>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 2, 2022 at 4:16 PM Jan Kiszka <jan.kiszka@web.de> wrote:

> But, in fact, this series was misordered then, suggesting that patch 1
> was independent of patch 2, but it actually depended on patch 2 to avoid
> even temporary regressions.

I picked patch 2/2 out of my tree and sent it off to the SoC tree that applies
DTS fixes.

Let's see if they manage to get it to Torvalds before the merge window.

Yours,
Linus Walleij
