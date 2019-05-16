Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50DA620807
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 15:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfEPNZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 09:25:15 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42757 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfEPNZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 09:25:14 -0400
Received: by mail-lj1-f194.google.com with SMTP id 188so3074529ljf.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T7i74xwX9U5ncTUvzhWe57o2tW8tsCxNGT7kMEIaIPk=;
        b=UZ2HOcb7CW2/11jSTnSPHfiHBasuAf7GrJd1OBF6+iXtAEPjKJR5dDzMbRtLzM4B0l
         /VkhzqF8QqngYjEeMk13keD+R52PQsWlMoV5kTRyWfoAgz9X9IgjKR6nnUSsEwV0mlvq
         y+2K3uxFvkCLSlgMAAxkNqa4ewh01JlutozwHyviQURNfG80lV2yU7d+3oyeWqBazhAI
         kuHMJC9agm5hBYp4WmqgZDYo+Xp7/nQBxPU7o3rG/+09m1MHnx/mOwKZsbFpC+wr6c5S
         sZFsWoZBbHj9rRsvLHsDi9DOijCG62RpIhgTZ5Oe6FQPq/y2Q6YEKijQk72SopivTngI
         oXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T7i74xwX9U5ncTUvzhWe57o2tW8tsCxNGT7kMEIaIPk=;
        b=sarMwal825znZnZwN1phbMH2+3PN49/QwuLejlvt/+M5u/4yksA1A8JEonVv3sACXh
         DFD5SiNPJJcWzzLkdCeMm79+brcsbXad6qB/lnfFyR7Rc3SWLoXDNoND5ag/KK1MKHrw
         4gbKaeWDK7zS25nLveF/zGzFLdl7MKNydSsRFi1UoxcIhYp0ZL670oKZznkQzw+znWFB
         y49qmJOBrb0+H5rwkvVfoQgsvl7UfwdyNW+/iw/Vdc8Av4qLD9q2ENyl1wigH3PL7xD6
         JeSbHOlruygG7fpHIgNixxrC/kSwnEJ+zoB7F6ltgrA0V5PHyYr/i4AeVz7Srr6RXsva
         BlZg==
X-Gm-Message-State: APjAAAU9UQh8IkTNTgEu9XP7Jt0ZyTYTJcNGn580ICZifshMX96wQhgx
        7GYWJ8VibDty9Jy4q5eIvAx22MEvsOvclAtKC1VX9g==
X-Google-Smtp-Source: APXvYqypGlrkwcWpkDZqIzkGCG+DJBLuflw6yusCBeidrQObvNv3EKCslo+yOFvLup20kJPOGzeawHtuUNUjQ5uzhwo=
X-Received: by 2002:a2e:731a:: with SMTP id o26mr21535501ljc.105.1558013113062;
 Thu, 16 May 2019 06:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190509205955.27842-1-f.fainelli@gmail.com> <20190509205955.27842-2-f.fainelli@gmail.com>
In-Reply-To: <20190509205955.27842-2-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 15:25:01 +0200
Message-ID: <CACRpkdZqAi4bbpGO8sTBq573dDRF-VWg9gE8=uGVJ3Jv0MY5bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 9, 2019 at 11:01 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> BCM7211 has a slightly different block layout and some additional GPIO
> registers that were added, document the compatible string.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied for v5.3 with ACKs.

Yours,
Linus Walleij
