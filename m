Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433DA8E5E6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 10:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfHOICL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 04:02:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34388 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730382AbfHOICL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 04:02:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id x18so1527979ljh.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdnZ8FW1TfT8n8DkyD/uq1PCbx+6HXPI9e0fR2hTtis=;
        b=gFCXoY8Acj249BXp2f2hUsAQmbPOSzjLrZ1gZ1X7VlmY096ACTCNmo2YOkKrTI6K8C
         YLIMhMhviNPh161PXgCE8l7G9PnbE222S5lHuVSu6y6GxUEn1Ycf9+KK5u28uGGyMpuV
         t25I2sdzd5oQqwoXyMN0L6rqChX/BMxyw3PYZHbIBBKgeBMDCncll+JAjhzUhENjFE0t
         KPlwa9IMZ7T+1vrMS9ekDDcq2TEPvuT6FA9qYsaWzb07OB85/0lsxJIFio8Mm4409Q1q
         7xJkkforVVU0nsBBmmG4asBwv5x8Dx0upw7RtklZcWsOxp/JZI/nYQcjXbZy6jwIaEko
         ajKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdnZ8FW1TfT8n8DkyD/uq1PCbx+6HXPI9e0fR2hTtis=;
        b=mew1RSsBOcJf/Z7xqR/Bi+oYKMOet+7YxnTFWPcXh8GbWXba4j3aUhjh7h59jvezOa
         jHPXGh2m9dMz//Yhu853Gfx9rBhgRTsbpUdgvbUPclUhnb08SQWIkFeDwhHhhV+41+ZF
         cN5UAd/HJonVFFAMLLK+kYUbEGEMzTUl9rCb/HhFv/VR2elCnF1uoYfp8V8+5oizONz5
         IPvTgzvFJ+a2dEwAnFn8aEnw7vOVp2jqqY4cnR3LGx1/puZogcQvqqD4c1roB9JJPePS
         uP8WX3bolR5kXZlKvhXMW1HfUvvZVWM5MG+7Y5nCGM0V8jbUX5QNoXcw4GbLM58idpvy
         jQeA==
X-Gm-Message-State: APjAAAUJzgkDl8WqIYV8GbHKLrKxjrhA+Zl7eU4H5lKIS62bvmdHRA2F
        IqZQQpH6/5Gr4UDDUKX4ilsaPXEaqzu0lu8RHOFpGw==
X-Google-Smtp-Source: APXvYqxb/9D/4/ki3Rv+e0KtkU6V1OyAbTUxUliMLPIoWilizXOqy1EpldXgjzNHnDOPgfjcf5g30oUuUB/TxdPZo9k=
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr2023286lja.180.1565856129231;
 Thu, 15 Aug 2019 01:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190809125515.19094-1-linus.walleij@linaro.org> <CACPK8Xew4myVDGq5SL04kqAVeWkMdF+PsmrkutM8s-nWkJLdeA@mail.gmail.com>
In-Reply-To: <CACPK8Xew4myVDGq5SL04kqAVeWkMdF+PsmrkutM8s-nWkJLdeA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:01:57 +0200
Message-ID: <CACRpkdY7w2r4N62Ue-PjBMWe34DB5Xw0EPi12HetCp=rve90Xw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Pass irqchip when adding gpiochip
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 6:44 AM Joel Stanley <joel@jms.id.au> wrote:
> On Fri, 9 Aug 2019 at 12:55, Linus Walleij <linus.walleij@linaro.org> wrote:

> > +               girq->parents = devm_kcalloc(&pdev->dev, 1,
> > +                                            sizeof(*girq->parents),
> > +                                            GFP_KERNEL);
>
> Is there a reason this is kcalloc and not kzalloc?

Following the pattern that we have one item of sizeof().
The parents can be several, so we try to follow this
pattern so people get it right.

> Acked-by: Joel Stanley <joel@jms.id.au>

Thanks!

Yours,
Linus Walleij
