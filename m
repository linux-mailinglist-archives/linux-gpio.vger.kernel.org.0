Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9891EE3EE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDPfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:35:48 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42076 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKDPfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:35:48 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so7100889ljc.9
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2gHuiLO7og745XJNw3g0G5hTaWSPN2O4Py1ymt1s8lA=;
        b=vb5swnB0Zimxbp54PAEDpN3fc2ntGzlfDiHa8SXTG2MOqiyFiNssKaM/gRQWP/VGa6
         pdHMrlrzamAiYWXRgNhIJ8ixJOHZYktydfH6ch0OVlSO2mtEY4czBLE62CrphXEbV5Ao
         oxG/y8hTaGG5uDF+I2YwBu+uL3nP4rbAomHLh/888PFfgGdhDDagdDCj0+I6Y5gjz1b5
         4zTNIbX6tPYatPkizcnBfwQLe7Dz/Q987/GLd+YtMq7M1sykhoUelbIsiVbZFqmUIAyB
         vnpVglev5zvAIR89jWwrUcUCZPfxDHP2GgpFk2CRRHyR7sw8llAV9pwP2PduTQMSBT/Z
         wBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2gHuiLO7og745XJNw3g0G5hTaWSPN2O4Py1ymt1s8lA=;
        b=gJRP4y5//LOdBcaNVd3tKKOmmXHAGy6lMx9Q2+84Zcj+x2DVVFWeArmF+D0EZB1hTb
         rBYG6/eQTmbT0Gd1uQQnRERSLkYxP+suvQ7SWWGIaqmrh0k/Hj3+/aVQhSFi3/V6tDt6
         6nnPxM0yBiFPDChNpH3nIBZ6PLZxG8ck9n4Lowo7sIH7lPd9j+yEomcFRes872KC/UQK
         9GPdmIBwB7ygHc/Nifc3vDPJu6dc3j1H4Q25lfSV1Lg/GIT42io2qatvtgJazpWjjSZ1
         vuKynO2RTKg5qTizeuiNQzr7OojYCWq2MaiwfSwKifN+X5jtMz4rutpFJG3KZVbvniAM
         vgUQ==
X-Gm-Message-State: APjAAAV24ez5JYaa+2HH31W+bA/Y+Gr76KxNwUYhN8f949XEig4Q47Um
        jESAm3eD/RxcsIhtggzabHl4tCCK9YBO8LpFcKvXWg==
X-Google-Smtp-Source: APXvYqyQYB/lSdek2O3HcmnK0Sy6vuSnsziarHtWr7U82KwjasLBk664GvWgm//Wp0sc1sz+wrYTLu0epXxiUArFPCo=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr19390165ljd.183.1572881746505;
 Mon, 04 Nov 2019 07:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20191022160806.42971-1-mripard@kernel.org>
In-Reply-To: <20191022160806.42971-1-mripard@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:35:35 +0100
Message-ID: <CACRpkdbf+RPu9FGp+cAhEJFdXNXdXvmawFCwTyi3t9+4F-yLkQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert Allwinner Pin Controller
 to a schema
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 6:08 PM Maxime Ripard <mripard@kernel.org> wrote:

> The Allwinner SoCs have a pin controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Patch applied with Rob's review tag.

Yours,
Linus Walleij
