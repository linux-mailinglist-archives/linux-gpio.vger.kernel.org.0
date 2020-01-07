Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407A11335B6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 23:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgAGW2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 17:28:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:44648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgAGW2X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jan 2020 17:28:23 -0500
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FC02206DB;
        Tue,  7 Jan 2020 22:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578436102;
        bh=Ng4X0689ET8txDYg+HTSgh4A/4430emIWmGDU7xejoo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YmOBvRNwxn2p4VVNlN1mtPMiHLf88IILl9CU5zsl8oDc2tEKa1JDkDCVyO4Wy/9qd
         Yw8vOC7S8QS09Rv6JU0fD4t8I+ojDUHRjDHedmMf3Oi43gBxQs2Q98Q6n0QgUy6HIQ
         OHTtvmHiGFEn6GyDZhW85HM98ibHSVCqqa6rv8CU=
Received: by mail-qk1-f173.google.com with SMTP id j9so974861qkk.1;
        Tue, 07 Jan 2020 14:28:22 -0800 (PST)
X-Gm-Message-State: APjAAAUUPFkS4VB8XamxNWD0SFRN8E3eurzfYZcpjgmEGoKdeSKNT4lp
        wdzDakFT/C+P8mgo3YdO96Mkk/qWL+mHr6irjg==
X-Google-Smtp-Source: APXvYqxoOQxfocQW4kA6khk+aHJU2pwVfyqaD/KAMlGk5ufz1LIdR6mv3ZWKi1+rUBmcLJKspMa+7b9aCsoIRm4X5cM=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr1635519qkn.254.1578436101562;
 Tue, 07 Jan 2020 14:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-9-srinivas.kandagatla@linaro.org> <CACRpkdYc-kB4Kx690FnU=3CwnjFdQhdxofGguFAAs_j==C=nmQ@mail.gmail.com>
 <1a027d45-6082-1697-ccf2-4a5be9a3591a@linaro.org>
In-Reply-To: <1a027d45-6082-1697-ccf2-4a5be9a3591a@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Jan 2020 16:28:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJksUGvLJeYbeP3zv_TtSe0NBWfrTmUsVes1KrwJW0Ahw@mail.gmail.com>
Message-ID: <CAL_JsqJksUGvLJeYbeP3zv_TtSe0NBWfrTmUsVes1KrwJW0Ahw@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add bindings for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, Banajit Goswami <bgoswami@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 4:17 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 07/01/2020 09:47, Linus Walleij wrote:
> > On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >
> >> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> >> gpio controller to control 5 gpios on the chip. This patch adds
> >> required device tree bindings for it.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Tell me if you want me to merge this patch through the GPIO tree.
> >
> Yes that would be great!. gpio bindings and gpio driver can go via gpio
> tree as there is no compile time dependency. Also Mark has already
> merged the audio codec side of it.

But there is a dependency because dt_binding_check is now broken as
the codec schema references this GPIO schema. Not much to do about
this now other than get the GPIO schema into -next.

Rob
