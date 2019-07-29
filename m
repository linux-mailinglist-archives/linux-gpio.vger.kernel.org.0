Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A913879CEB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 01:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729664AbfG2Xkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 19:40:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727165AbfG2Xkb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 19:40:31 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 850F921773;
        Mon, 29 Jul 2019 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564443630;
        bh=7+dKYuXRCa5ZF1sBBLaJXHlVEQeYcSawe/De6ZYjmjc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0vDcQ4xj3eYYqyHRsoPwWx4XMC9sn9G3ZnGDzKIxtBwXez3BEMlcv+otZT3btTl1j
         o9/II04NLT9fbKTQsjCZHrJeE7u9Dss/066Bou0MdQFSlAmalvBllLKkVu5hukB6Jw
         9WnY5rgoztDcU/orTdQkZ5PGL1fqvcDi7lINf4sI=
Received: by mail-qt1-f177.google.com with SMTP id l9so61210727qtu.6;
        Mon, 29 Jul 2019 16:40:30 -0700 (PDT)
X-Gm-Message-State: APjAAAVSR4cMGDKKGuJkEhfJi5QjTysSUVt8Wrw387OY5baB3MkptdBS
        ja/HVqbFmYsvMj8WoljWhIjJcqTEnA2M85b8pA==
X-Google-Smtp-Source: APXvYqyaCa+KVNuh9jCj7c0XvJUMcuDC4MQz9V9TU0flj76XUMhpBDn4frU2dByCzFiQI8HP63DdqNt3RAGN9tT5U6Q=
X-Received: by 2002:a0c:baa1:: with SMTP id x33mr82268862qvf.200.1564443629749;
 Mon, 29 Jul 2019 16:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190729055604.13239-1-andrew@aj.id.au> <20190729055604.13239-2-andrew@aj.id.au>
In-Reply-To: <20190729055604.13239-2-andrew@aj.id.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 29 Jul 2019 17:40:17 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0f=jWJ2QTNzi+pmvzTpVacbP_C0zgpOwTumwJU7Gh=w@mail.gmail.com>
Message-ID: <CAL_Jsq+0f=jWJ2QTNzi+pmvzTpVacbP_C0zgpOwTumwJU7Gh=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryanchen.aspeed@gmail.com>,
        Johnny Huang <johnny_huang@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 28, 2019 at 11:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST260 differs from the 2400 and 2500 in that it supports multiple
> groups for a subset of functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v2:
> * Avoid patternProperties for fixed strings
> * Don't needlessly quote strings
> ---
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
