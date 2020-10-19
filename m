Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D334292B3D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 18:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgJSQNj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 12:13:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:47642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730320AbgJSQNj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 12:13:39 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40DD32225F;
        Mon, 19 Oct 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603124018;
        bh=Xrci6+aiYQ+sMtZrSdB+hUvGFLT0OrXhk3iQny/zoqk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Iinhh9ErJ7aTDJIPbu/sJHpgnZ3In91sSV86R3N2aK5I7tkMFiqHmaZvLQEyQNPEa
         gGjpQJsaEKVuEJcUZHHJJcs1SsRZBAJxea7kuMKz7GnZAnH9n4VR9HIJg+oTYZSabH
         WrN62OYRn7ZFnz31xZR3wegYEZ0SiQaPEkdJsh3s=
Received: by mail-ej1-f47.google.com with SMTP id qp15so14710589ejb.3;
        Mon, 19 Oct 2020 09:13:38 -0700 (PDT)
X-Gm-Message-State: AOAM533c88XcNAWo3s5S6wzWzdLtdigXowC28S3DNFD9fE8P5gWAoH58
        FFmnDzcRvtuyyH15HU7g73ZW6uxOjFPDaddC2G0=
X-Google-Smtp-Source: ABdhPJypXMaGS9Gg7VJ1UdDd/ekgmgHor/+gwcb4XtdBOSb0fwLU+G4oE9HlSVzQ8GFUd4BAzc9WCqE3v5c02F/qT80=
X-Received: by 2002:a17:906:5247:: with SMTP id y7mr574082ejm.503.1603124016721;
 Mon, 19 Oct 2020 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-2-daniel@0x0f.com>
 <CACRpkdZDyp83AiGkX9eFe2_w9eK1NXREFG896DZfPUaHboy+0g@mail.gmail.com>
In-Reply-To: <CACRpkdZDyp83AiGkX9eFe2_w9eK1NXREFG896DZfPUaHboy+0g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 19 Oct 2020 18:13:22 +0200
X-Gmail-Original-Message-ID: <CAJKOXPecUBTqbyiQQRdSPq_YuBAF+ut3RbM9AcW8nyciJyw8ig@mail.gmail.com>
Message-ID: <CAJKOXPecUBTqbyiQQRdSPq_YuBAF+ut3RbM9AcW8nyciJyw8ig@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 16 Oct 2020 at 18:36, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Oct 11, 2020 at 4:48 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> > Add a binding description for the MStar/SigmaStar GPIO controller
> > found in the MSC313 and later ARMv7 SoCs.
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
>
> I think Krzysztof is working on some generic bindings that
> will make it easier to write YAML GPIO controller bindings,
> but I don't know the status of them. I would be happy to merge
> them early for v5.11 though.

Hi,

The generic GPIO controller dtschema got dropped because Rob wants it
to be part of dtschema (outside of kernel) and then
relicensing/rewriting property descriptions plays a role. Only the
GPIO hogs went to common dtschema package.

Therefore as of now, one should include all generic properties
directly in the GPIO controller bindings.

Best regards,
Krzysztof
