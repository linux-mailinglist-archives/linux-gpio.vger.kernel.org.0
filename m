Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53F859F57
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 17:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfF1PrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 11:47:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbfF1PrJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Jun 2019 11:47:09 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B2692133F;
        Fri, 28 Jun 2019 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561736828;
        bh=IvQrseI2FT7GlH+2IVTYalj+9dZqPkQ+umge7Io8BYs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qiBPRUh2Rl/4JkSewXW0u5fTbCvxhNAiAvyoKPvWUekoyPQH5NWCaeHqoHo8wrx/z
         +F+dnsHWd+I11+gyHYSrt7TBj0HOf3gNZZL6EP0gSEQayXinWtxuzoeLJlLC3Nqneu
         JmWm7oUz6pJSL2mRKcrxq7zpVd4D504DPYgODGcs=
Received: by mail-qt1-f182.google.com with SMTP id h21so6754833qtn.13;
        Fri, 28 Jun 2019 08:47:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVm769vb6eCqE84DT2Z2CnllTQdbZLG/vJ5dBUMAkJ7crySoC/b
        phL8pUeNGz9wUrZhhh/urajHJ/jDG3244mntIg==
X-Google-Smtp-Source: APXvYqzI7nz1Eud6yl97g4IKf/vW5/y3ZQY7AiYHNAFU5cp6XG9kpOIjyOkxG/G+hIZCgCZpbktv/2gOhf4y7pIKPB0=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr8736951qtf.110.1561736827529;
 Fri, 28 Jun 2019 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au> <20190628023838.15426-3-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-3-andrew@aj.id.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 28 Jun 2019 09:46:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKjDyuDjeBBqhF=2ceG2h0WiJC6QKtHJ-=yL3XqxXF0Hw@mail.gmail.com>
Message-ID: <CAL_JsqKjDyuDjeBBqhF=2ceG2h0WiJC6QKtHJ-=yL3XqxXF0Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctrl: aspeed: Convert AST2400
 bindings to json-schema
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Johnny Huang <johnny_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 27, 2019 at 8:39 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Convert ASPEED pinctrl bindings to DT schema format using json-schema
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2:
>
> * Enforce function/group names in bindings
> * Move description above properties
> * Simplify specification of compatible
> * Cleanup license specification
>
>  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 ------------------
>  .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
