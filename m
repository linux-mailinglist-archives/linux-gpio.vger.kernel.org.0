Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFD2179B42
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388783AbfG2Vhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:37:48 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32952 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388787AbfG2Vhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:37:48 -0400
Received: by mail-lf1-f65.google.com with SMTP id x3so43212514lfc.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6SGKTpDBVf1QoMNMHV2QxgTIUw60sPAmgJMLuUozsA=;
        b=u8iapjwNjwnZ7jcCyKefFe+jgiBX5u5HsLpuFvT0Z1yV+9VtwjFOQcc8ZOMl6KvFPF
         M7QYUd9GHwY89FO/oIy6Vs7z2LpUu7VvpqsZcilOTsOKDmMpm2e5QMU1PO9cNUZZbgSl
         E7qc0BLNAU+W0cXByg1aaGz7e1qqPtAIKoeDdHRcuRXAV/U8FwFMO2v9GRT6O4lnbmv0
         STtsybUIKUHzspa5YXLLFmIVORmtDhBfSpcRz6FxasXB3ukoXv4J6Xx0nc1CqaS0brjS
         KAatnGipYKvOgHMS/jo0jJcdLtJrjGEIa+gqcxm6qIaCuw0UWtIpdSCMFAF/cUigb6S6
         L2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6SGKTpDBVf1QoMNMHV2QxgTIUw60sPAmgJMLuUozsA=;
        b=beV0z5VcZzELiIvhIOLV3F8AqSCouQVTbko7dsp7JpuFjMxXLgvgHRbFevp4XgpgkF
         SSuLCK9xFeCyQjyjJHSjQXVA07vL53yr72/d5KipXcjFb+Ts/5XCMNNehBleCFLibu0w
         wH5FTPnHqjG5kT2je6qg9wi9bqILUImyCUADyPz9RoJY9tGYOifyULk5VPlWyv4FcjdO
         5+C/5syWcmfnpr6erJ+so6fD6YUPHK4JdK6ineDBnn1CiouuH8m3pzwZAd/5HymD2dXm
         RlJ/c8AFVtfWMex9JZoZirIHWJM8mEEB1QpbA7UYvtw5KpgTbalANnE28bov5OhYtZIq
         pGLg==
X-Gm-Message-State: APjAAAXt/KyG7s4T6NSFd0b2iVHE/nXZsh3FVgKwlLYOp3kNtAhJMxpy
        wdChiLnVBkGE4+Ayms7m3t0fngaicj/SlsJCEmpLQg==
X-Google-Smtp-Source: APXvYqz3UTZrxCuWCFpHX9xCUQzE7FgKee1vYyZDSUrGPt39sYEtKuROQUXJZ4DR6J5QXxct4aus6tuGSmQowU3As4s=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr54407619lfc.60.1564436266269;
 Mon, 29 Jul 2019 14:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190712061721.26645-1-andrew@aj.id.au>
In-Reply-To: <20190712061721.26645-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:37:35 +0200
Message-ID: <CACRpkdZxcRqV18tfcJHNVD=FUwDShwJsJm-v9+SVrxGPC5jvxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Strip unnecessary quotes
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 12, 2019 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Rob pointed out that we didn't need the noise of the quotes in a
> separate review[1], so strip them out for consistency and avoid setting
> a bad example.
>
> [1] https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/002009.html
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
