Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EF342531
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfFLMM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:12:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44691 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfFLMM5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:12:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so14868265ljc.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELkeEswy3RryzFI9wP7fvpF8yJjPUXwtrgXJFfzoWvc=;
        b=cs1gGg57RFwsFNBg5Wz1FxALZjEjnWdh36wZ2+m8aRNowiw+keszis1eGyPtUSycfJ
         jw4fgGS36H0s7D12QWk4cu5sD72scRy++h1LTxCTbcVox4Xjha4j2VqTkBupv8Ta2Ui+
         irn2QLfGeUryARGROwaNwQt9HbqFNSh55sS39e3e7IdSxoAb6RCUk7ubQQvb3BRpq9Qj
         ysE9d/YnTN4UNmKzzslol++aPGqWB5P+7Mqsp3Uyxu59iZ4oIRaUFQbuwvNOAOUbDXwZ
         tgQdhfyVIfSiIroPFqotYYUROmQXrYohGNecKnbB1jB+kRnxiMrUHi3i6HtA6P0t39dW
         WtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELkeEswy3RryzFI9wP7fvpF8yJjPUXwtrgXJFfzoWvc=;
        b=M808nF7kqa52ZJp09S8YG6TiaYxvcmFwuLwR1LOzp/kyZgEAw1ahzZLhz3uAsnMdhF
         Rneax+W6ORZbVn8M6BZOfTKHjM7ySh+wpl4tczKeHpvkOqFYYWYlIYwJM8wQLzjknbqN
         MnvjPcJJcjwo+k3UuPwcew5ZYYG3D9JQjvL6I8krJynyASG/SAcebfLMQ0TALOMM+PjH
         OiakUgjeFpCwgMckkOxtW0uAQ9vAhRezs5EJRcVyTUnJfvtZHLAi0UvKDM/Rzo7vmnza
         TdxuBfeAZn0RFQABthYWvoLt7ZbvgjuCDOcCceyk2yEplnTfnESSa5BGKnhNLdzNCvJs
         OKUQ==
X-Gm-Message-State: APjAAAUNdrEP5Lqsp2/ifCr1XptkZzYu1AzXT+zh1TVmEfoUnFugtydg
        Xghh+DeMMIeIKNnMldBlgifRe3oM8Daifp/ZFGt8tA==
X-Google-Smtp-Source: APXvYqwX/cz4Ov/rw6ige4uWEBhHtZdC1FwFiYjZbazDExi8Yz+Hq0FkTVaZ7z4h+4ZcFlJnGyli0LLghmuu6GyC4p8=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr4505822ljj.113.1560341575429;
 Wed, 12 Jun 2019 05:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190611140940.14357-1-icenowy@aosc.io> <20190611140940.14357-3-icenowy@aosc.io>
In-Reply-To: <20190611140940.14357-3-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:12:44 +0200
Message-ID: <CACRpkdav8F0F=Kepa6YskZbFEC6vfGxRe89VpK+bw8o_+dgAdQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: pinctrl: add compatible string for
 Allwinner V3 pinctrl
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 4:11 PM Icenowy Zheng <icenowy@aosc.io> wrote:

> The Allwinner V3 SoC, despite come with the same die with V3s, has more
> GPIO pins than V3s, and a different compatible string for pinctrl is
> needed.
>
> Add the compatible string for V3 pinctrl.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
> - Add the review tag by Rob.

Patch applied.

Yours,
Linus Walleij
