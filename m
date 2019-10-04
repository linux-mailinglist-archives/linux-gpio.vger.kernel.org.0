Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C29CC350
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730090AbfJDTGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 15:06:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46103 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfJDTGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 15:06:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id d1so7542149ljl.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 12:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JYj5Vuu2wwz5/1bubcaD27zMhmuUTtHi+dTrlxCeEQo=;
        b=WkdazjxwXwGBBU0OPmDk7Htn7m2xKTQ8eGPNzHJur5HfrO6gY6RnZ86tbKbx2SW/F5
         BUnxhc6enI1bM/H5poFAxSYKQikJ7b17bqABQoX0xtYthyQlS1HTquO4Qnu8Ez13SNbX
         7YkCztFJFieyUhqsJEhpRgTensIzMriCnhTpaSnccvzTPdlCZ/KnCNeooScFZ5gkT+xg
         u1KL3MHvokRekQOYKIfy930xlNX0cT2cdRoWgTexquyGdFCzmOGjbfm0JfEMJAxYbHic
         NkWXe0+sjVoGs2VTv3q/8N4Sua45qNVNyIma0u5499juQTId9Ov3oIiTyFVgCZ+YNnC9
         /zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYj5Vuu2wwz5/1bubcaD27zMhmuUTtHi+dTrlxCeEQo=;
        b=Y+vWXRCf0WIwVIEJnw5EmGHBHsdxK19WEFq1JOtI3hJsACPfcHx0RFwx6YuEnJc01m
         QreZHtRDS5YAtHB4as6cCEk82oNXhnZqZHr6GGKOjseNCQCfhuyYbNCMqz1t5xf1SBcF
         UynbqvA9d/GbjS/r2StGnJcsfl8azIRMDkBK7LwnjoBi8Vfb/Ka5HwkrReZsOlycTs4F
         TRvSzbkdDRErnW1SPmHtMuzXLg4hy3QWTuHlhxIXhXOQcBoWvd/rdTTb8qtRZHM2d0fq
         qpP/HyQoPBMBabsGq1eg1gFkXCPkgQwF/YFk9vrjYE0ibolp/OCCzOYynk3ov2V1ri6K
         tvpQ==
X-Gm-Message-State: APjAAAVSP9PxL03brK9/MkfxAUaXc3otVZWG5ql/nXxlzFS71xPALGtu
        8zLZFro79avLUwQF2KL5obNvH5f5t8tpOL4NDUMrR6Y4pRiVjw==
X-Google-Smtp-Source: APXvYqzV7LwLHfUN/uOof+1pMQj65BBC/djNC3BS8vZC+QuB1i0JvUK986VyoSTMIAIDmGIg0K85ux9PRsidtiGsiOI=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr10234333ljg.41.1570216009077;
 Fri, 04 Oct 2019 12:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190917105902.445-1-m.felsch@pengutronix.de> <20190917105902.445-2-m.felsch@pengutronix.de>
 <AM5PR1001MB099472B4C90EF215134EF5AB80840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM5PR1001MB099472B4C90EF215134EF5AB80840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 21:06:36 +0200
Message-ID: <CACRpkda_RuK_UfAVd+m5PZwMHUv3G-vSYdu+LWL2BG2HQqim2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: da9062: add gpio bindings
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 24, 2019 at 12:53 PM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:

> As mentioned for your other patch set where the regulator driver makes use of
> GPIOs for control, I think here you should probably have pinctrl to define
> alternate functions of each GPIO. It seems that mostly pinctrl drivers support
> GPIO functionality rather than the other way, so maybe that's the direction
> to go in? Maybe Linus has some input on this too.

Usually the both functions can coexist but the simplest if often to put
them in the same driver.

drivers/pinctrl/pinctrl-stmfx.c
Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

is a recent slow bus driver doing this.

Yours,
Linus Walleij
