Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACCA29789
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391203AbfEXLtP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:49:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39838 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391169AbfEXLtP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:49:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id a10so8397354ljf.6
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOvtRlpgwrennubIJ2Y/ol1Fu3d5Vq/WpGfePTtRPuA=;
        b=kqFzBgdp+KA8oZ07ITq8Vy9oGfQPEKsOwl/CwI541Nc8qn68LWFMJoH4xxcPFYHbOf
         BBSOhvUgvgJH705+GF2itw1f+g81VrnNQyEjiPsudL6kbamAcHWjvip6WBJLR4yk7A5m
         UrNlKRknWbO5tAhNGmhZLpsI/GaNM+T2bbKk/VqHAZFUrEtKa8Ru+eIbTnUE5DOGCatL
         aI4bNiNMKwwkUprr5vmFCjo655fsZOLkLll6AjPi/CkJX3woHsMdyyN6kC8kQ+ji6+vJ
         udk6IW9q4oJGvWOCjvOgZcBpgGXIE/ZR0Eg5TbaVqpfmW2NJaM8rIlCcHgg8H6TbEhhX
         P19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOvtRlpgwrennubIJ2Y/ol1Fu3d5Vq/WpGfePTtRPuA=;
        b=uMlrZB3n63lL8XamtDr33oxiv9owHh9kP7SsBr1gOwrr32PXHE8YmRQOkEyaSoSHTA
         991Mg7FGpSqXDlZ/9dXSdEYPYMMMw3kfr697OKiWO4hnuAo/2xGeW/gaeKnCPnh/1vvW
         dc8Alg8/EF1wrufyc4Wq4WXJlOtXN8RPXsB8GeggjWlOGGhQA7inx0gt9Y179vDT7oCU
         vvmKsISUn4vC2LCbG5d9svcIoMrB44D152QsibzJabJVd9ySpLLn9wA7IpCrpCvs/g9+
         p1A7McUu27cOc6tcdeUWF3eUITC6Ia5hdXBH8I1NpOoGGR0YBK5HrL75Jv92wdqmstEN
         iYiw==
X-Gm-Message-State: APjAAAUprPEH2f2nnpdLWTvQ2j0ymRApJ0AcJ3BHTPrx1xqcNA9j6f1S
        WKuCXCmehA5MFKP0XLThpoPdhEaZADwokc9la7w4/twW
X-Google-Smtp-Source: APXvYqx12Jd/oGdeYccOTNL544l6qLoeJ1js/R4g159jdpy6s0xveqSPxI2AZMsqesCBeYpmFKamqshKWqG/AN7gB/A=
X-Received: by 2002:a2e:89cc:: with SMTP id c12mr44977574ljk.90.1558698553619;
 Fri, 24 May 2019 04:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190516151339.25846-1-jbrunet@baylibre.com> <20190516151339.25846-2-jbrunet@baylibre.com>
In-Reply-To: <20190516151339.25846-2-jbrunet@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:49:02 +0200
Message-ID: <CACRpkdaKDXCbR9di6upx_iezGfajGbqw7Y3p+LZnwYWdJ5dJRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: add output support in pinconf
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 5:13 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> add support for the pinconf DT property output-enable, output-disable,
> output-low and output-high in the meson pinctrl driver.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Only standard properties so patch applied as obviously correct.

Yours,
Linus Walleij
