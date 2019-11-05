Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B82EFE50
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388982AbfKENZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 08:25:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34371 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388938AbfKENZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 08:25:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id 139so21861881ljf.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oP2Qg5DulasBMIF938P1Bp5KL5tW1M0zdz+2GVaj+Uk=;
        b=htgooDkyaSv71Ti+556eAKWXlqMjpxkAkSOki+vleaBb6Av+WzlFduwJhyDFzZZxOZ
         0RyJiO0Z7zhxnuLxk6elZgul0SSMAmNWjfH8yz3iCC9YaQFHYrL/y/xQp8RdE+vT9e2E
         PngH+tXC+ktbnz7hEgGDXmhwX43XFwEqyzK+mv2tBGLw38RDkA/zJAVke51imLothgPi
         1GtM7Sxz+UvM5Iw2d9/g4J9unmhAExVIZ9sIALS8Yi0mhIp2PydULQBs7JnM1j0ZTzOi
         uPwTifHGSQadVDNDCxtIoQNt23BlJTEfXTi9ZSDdZmNio9+GMRgThfeecurQ1kgrdiFb
         J06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oP2Qg5DulasBMIF938P1Bp5KL5tW1M0zdz+2GVaj+Uk=;
        b=N5hPcEJBV0wtqtf2vRXcvjjckwrYFsoe+sDo2Xl4KkqA1HqE5pKkPB4oTR7xbM1isl
         PZPctp7GstgJvgJsQix8OqVVXepnRMWoQadIEwaICaJugJJmn+mYdPIQYyYpQP5d5+rl
         By6Rrm1U+Ruw8H2CGw8j688LViPnOq7ibd4Qm5AR8ibVBYzInq4iJh5NuuucOvghm8ih
         AXgs6RalJ1e2FG1hPP9veOS2OzXcSYCMERPlBtADjiDKwO4XkOB+O7u9x1TfhUNS/xyt
         psXJ9N3F+AOY/63DZ2eat0pEr1CR/q4mxqShqbcpoV+f8y7/UxD0klkmSClH1f1Ev5rN
         5TNQ==
X-Gm-Message-State: APjAAAXwAqPYGMd9o+Y96r0a+fv141z1rXdm3fZP5DbFu4w/QyLg74um
        wgjq5uid88MM6gXD8fzCaUMvtaPnrpnXXjCIVatzkA==
X-Google-Smtp-Source: APXvYqwGVvtw2JLHo5RcIlsIMDfC4bj7A1mhDFHbnNes729TrLIAwbe19y/dMBfnRaFx7NDuYWTABRX2z5TR4cfVNKY=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr23474840ljm.77.1572960346944;
 Tue, 05 Nov 2019 05:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org> <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
 <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
In-Reply-To: <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 14:25:35 +0100
Message-ID: <CACRpkda2CdbPe7jsomZSxdJ1wE65OmNYDsZNj1OmfzdvG4kWng@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 10:35 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This controller just has Output enable bits, No pin control properties.
>
> As you suggested I can move this to drivers/gpio in next version.

OK perfect, thanks!

NB: this probably also affects the compatible-string which contains
"pinctrl*" right?

Yours,
Linus Walleij
