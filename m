Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A4DAF8E4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfIKJ30 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:29:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39867 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfIKJ30 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:29:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id l11so15867599lfk.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=meoyF5qnG1EbOZhPqlVN2+IiExXsiF/sJ/BQgZ1twjI=;
        b=blO4zlD2kpj/8/v83jVkDYzwy/DXX2v+pWYr4ZysLvhmiPcDuXpCjOELy0K6cPbbn9
         PiJe1ObQU3MpmlNHhUm1/2yhq/++D7dAEH1evQfJ/NXRSYeMG74G+yHOJEivgjVKBR/g
         9VbTPqwbXk+V6n/gJ6fSbWfWvquIaEIzWeOlEaF2kAIeIJSklsoktwxpBHncLz+Flb0X
         DXOj0b7DdhqyW++P/hbwgvrE3+4tNpTftDM1ffmOOspcPY5QRQPG6Bl8TlP/8UbMHdfn
         LkshNjdIwBAxjKNDblUx0ex684BdzoLtfsOyaqHRxOP5WFspRavgJ+4pIDoOT1Delae7
         W0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=meoyF5qnG1EbOZhPqlVN2+IiExXsiF/sJ/BQgZ1twjI=;
        b=lti4CDAa2EBPh30cLpXQR4ndKyzi9FrMtgvpsQsgHvP/Fw3dIPFsU38BP1ePhAUo/5
         mqIcX+LAes0uLajVN5xewzqHIM9wY4OSDLB3jMd2y9aR4Cb6JdAON48Sro1aYr57BRfZ
         6aXxbPaoShY/p51yXUanotb0ibnJBlw0asmvglWJUJT/kr9mFDPIBENO127WExm6D/VN
         ffEj8bABIDZn66uhGuM3un3VvslzAmNDITivv6MumhrXh3oNczTQTxcwtlZspta67T6w
         XOWdOR84HDHe2YyG1MapJxVy72PqnOr9qmYRdKQhjpWLdMz0sZ+qsUpA7I77Uv1gCsSJ
         B1eg==
X-Gm-Message-State: APjAAAUoaj1nv9KETW5U96t0yOM4ytZoEJ6jhSuAS31M2ZOKr64tpq0j
        RCZjV84GkVvUqXlX+3cXcZqFjZmukvRfA9oZ5TXNvQ==
X-Google-Smtp-Source: APXvYqzOYZehJ5Xw3MxFgYRqFUIZbXMNBMiPJdnrux4Wxk8zVbXjZTviaBEscQ9wTzhD2drdfEvrsRgqL7YT5XRozlU=
X-Received: by 2002:a05:6512:25b:: with SMTP id b27mr24506530lfo.60.1568194164645;
 Wed, 11 Sep 2019 02:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com> <1567663210.1324.3.camel@mtkswgap22>
In-Reply-To: <1567663210.1324.3.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 10:29:12 +0100
Message-ID: <CACRpkdY7Vpy-fBHSXnjby0kK_tDWBtZaCwjCGxFy4HWeJ1FgEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> v2 is the same as v1 except that commit message is corrected according
> to Linus' comment for v1:
>
> 1. remove Change-Id lines
> 2. correct sysfs as debugfs

Looks OK to me, but i need Sean's review on this, Sean?

Yours,
Linus Walleij
