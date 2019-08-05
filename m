Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB268172D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfHEKgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:36:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39789 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfHEKgR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:36:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so78801856ljh.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMDXKniohFuBPRLguP0pUUrpe4kGWQLXsJ2UgVzEajY=;
        b=Ja3y/qCciaFzokLgL6u25vb1VO7Jhd9hDVgi831a5t9rj9AH9Un97C+tZ2f0nZEfH6
         4D1vVJRh9qg+tqEo+zKbHUZq8lWz8hQOwwRPR3gomDMkjUS4pRhVtqFhPNrain1SuaOr
         N6vly5/z6MlhpO1oDoBNJG6X5kHjq4Esv3E9SaDVBY9KSAZ2swaRFmzu6u/e+0ZHK7pZ
         k+CX1SeKUVCBajhNjiMExFEk5RgmYg9qiXnYAXCD3PbiKWZnJIZ3tDIm5MESgqVbbjN9
         eLdGt+lPl19J3ik/4xmhMzMB6BUjfJjxYQm15K+vO83/Te5WnuvP+l1NmhkMYq4cUeXT
         Nn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMDXKniohFuBPRLguP0pUUrpe4kGWQLXsJ2UgVzEajY=;
        b=QtprLuL7DqaFlFeYmBqq97vdLefHJYVPItNDKcfc/H+bybgqKCA6PhhzaoI9W/L2MZ
         ugCwSUfKNlB0vx5PSrWdDvbRakcjVD+T1Z4/co7RW/CbDmKHGrPkhda8dOwQnSpJPqx9
         n6hc5sbvp1T0JpV84AAsJkQwBc4kGG+2E7zI4pSpIbNU88RIZZya7SYGYiH13B8NnPZC
         bKZMos4oTPk1DkcqBJ41Tgy9giDktwNW0GsG0w7qYdwkqNzA0/YGrx1bFTW+3eUWyi/6
         q7p6BTgZWAzq0ncZQvyelMC0A6jdmaKqtywai6//tzV3xKYsI4re6QylrELDptO7PZj/
         ftXA==
X-Gm-Message-State: APjAAAWCzFWgl0fBgYRDvwx6Wv4xT4CogvZWz9A7pAliD0xEj5p3SmnW
        xwveRc46JI5HZ3R0+CSSazQCvUI3Bnz+B81nuTnN5g==
X-Google-Smtp-Source: APXvYqyB/49/aeHh2mx864HdyglYXRLbeplrleopj5uZcs1oTYM9hcI7bKMIk3eFK+kMXyQkKYCUTOCwVkAKT2Az3D8=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16472034ljs.54.1565001375393;
 Mon, 05 Aug 2019 03:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190728031227.49140-1-icenowy@aosc.io> <20190728031227.49140-2-icenowy@aosc.io>
In-Reply-To: <20190728031227.49140-2-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:36:03 +0200
Message-ID: <CACRpkdY65Ob-zbd+c4reUzYtXdk441horQ0ykL08YeBrgXWqQw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] pinctrl: sunxi: v3s: introduce support for V3
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 28, 2019 at 5:13 AM Icenowy Zheng <icenowy@aosc.io> wrote:

> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Patch applied to the pinctrl tree.

Ypurs,
Linus Walleij
