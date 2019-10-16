Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F16D90D3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391044AbfJPM16 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:27:58 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42767 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390999AbfJPM15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:27:57 -0400
Received: by mail-qt1-f196.google.com with SMTP id w14so35734304qto.9
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RiitUgtPHWYB471TBDHiVHPPALR+DVcpaO06JHpx/Ks=;
        b=YFoZ+P9HHoSoLVHZecxRW+Z7+f5LggWJqYiP/+udF6k8cZBRCQRsm8W8AwvIMcyD6J
         zTw6j4UEPKQKVMpk2gJnDJoOksG/VEM42AGDsdK/YZyvHpkkYyC8SKShI7Agk6xfypfJ
         k0nLAPhKyNxQWeYBhOEk7LuzIHr8mqN/lTDSJFSLPoXiSfAlJVCewPyLfZD8+7j+5AAN
         FEY34BuDnOTiVkBk1hYZCoocdavCaQCeBlt8eW+zStBLnFGieKwX13ennTtwM4s0iYje
         F3DBnl5Fg6qyga8kRN1/JGplByRpdSwo3UHi51A8RpphiOx14cymS/FA0PVlTS33uYb9
         KGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RiitUgtPHWYB471TBDHiVHPPALR+DVcpaO06JHpx/Ks=;
        b=XsqfOIjWMQSW6C6dCFKfDjrstTVmyyUwn08dCGq345s11q6J2sfsyvyDyVA/8cQzza
         yrhpQ972jHxgv9npzRH2UZVbgskGCuV1zFxacUNDNtVtTUmIa5ZN0T2pZtsDpgxWmyTp
         WLo263UyqpJMr2scHiZVN7y7sBdGjhApi02XeM6oeMlQzrPyxaJExx9Q4XW/a6cO/rwi
         F2sAsA5hSO9Il8LBN3oZud6yvEF3fuN/EQMj5M6bAd3ayQej3RI3yPrcztDYUcxOMnmP
         ADDAVXYCWgzcnbvFktNq/2y4YUXmvJJMRrtoUwUu4TWhYBAfyxBVRdgpuVw3lDsO6LQy
         6FyA==
X-Gm-Message-State: APjAAAUo62SCmqOPp9H0oEiaJUOnCvM0LRf8hcD9gUtyWWS64Va+xlEC
        GILyc5T9A7llZCctMQ7zefUahG3Yczp5tJmAQ+JSkg==
X-Google-Smtp-Source: APXvYqzDHm0kSmPDqed4NoHcllkNpwqptCmh2deQ0fBpLLPQJG+ftMU1r99mU527MOglkMOMQ/pVQl9DwOdDGZP4UzM=
X-Received: by 2002:aed:2462:: with SMTP id s31mr45321050qtc.40.1571228876746;
 Wed, 16 Oct 2019 05:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org> <20191015173026.9962-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191015173026.9962-2-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:27:44 +0200
Message-ID: <CACRpkdY3OC675EjZ4PYhYxnk1XWh4EO-a3JJBha2rdBttySUNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: Add devicetree binding for RDA
 Micro GPIO controller
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 15, 2019 at 7:30 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add YAML devicetree binding for RDA Micro GPIO controller.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

First: this looks awesome to me,

Second: since this is kind of a first... could we move the standard GPIOchip
YAML business into a generic gpiochip .yaml file?

We currently only have pl061-gpio.yaml and this would duplicate a lot
of the stuff from that yaml file.

If you look at how
display/panel/panel-common.yaml
is used from say
display/panel/ti,nspire.yaml

Could we do something similar and lift out all the generics from
gpio-pl061.yaml to
gpio-common.yaml
and reference that also in the new binding?

If it seems hard, tell me and I can take a stab at it.

Yours,
Linus Walleij
