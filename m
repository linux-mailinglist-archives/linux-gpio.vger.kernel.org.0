Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92322F0B4D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 01:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfKFAx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 19:53:57 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45215 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730606AbfKFAx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 19:53:56 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so5550121pga.12
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 16:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=3uQpVyXJaXa5octIsuRsjge4Acr0kuDzkNnN24hp4S4=;
        b=kRAq9RJC+IeswRYCOZIa7Dt+QMa4F0+m+dmVq/tibUgNLMB4pzEGqv8AQJvfOXmMiM
         rgEZWUfqQA8ZbLqRYCA5fT3dvLgQjwwR4ILNznO/aqkbn0SrpOU3cYGJ2833uLcS3rkW
         31QWs4Us/g1UEwckrc0qvkXPPTJzoilZvktSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=3uQpVyXJaXa5octIsuRsjge4Acr0kuDzkNnN24hp4S4=;
        b=o2VpmRM89yrTeg8VhV5lLz/pafWHmQ7AJZvQThp6zMMi9nPFPzRy4rs0gWT8gC+p9N
         jNQfDNXltuJSJd+xIJAivqstR77NBCTAzK3pfk66Do1KYxyyR3im4dA2XIpVKo5Abrcb
         cTQlC8z8tp/7LRickdNrh+YQ0TUYCuHzrJbaTyi0vyYpf9dFDOizo0CcFOJRWMhot1Nk
         tNnGPlXx/xbw6A8zBN6ZZoriJZV3p8mUBL1eXZcHiHmHs5ptJamSz1RqWoJkWTpUBx+Z
         1gYhVL8Q1CFrnaFoJvAx+/FhrKfrCflAgJ+jbXg3mHorfGE2+ayD23j9tFaUGG1SBJDt
         R3dQ==
X-Gm-Message-State: APjAAAWPA22yprb4oC31m8mh2HH71GtlFHyB+zlrWqImxf16Jg84AgG5
        6d45oEgZdguEKpzUoQGEFGLNhg==
X-Google-Smtp-Source: APXvYqy5UMRUJF7C0ofuP/uPjLiE6rZLxVjRUxFYcGqwGYVelxQZVEYveE06wun4pbXGH6Uk+r5FHA==
X-Received: by 2002:aa7:9787:: with SMTP id o7mr40483812pfp.120.1573001634099;
        Tue, 05 Nov 2019 16:53:54 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 6sm23290656pfy.43.2019.11.05.16.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 16:53:52 -0800 (PST)
Message-ID: <5dc219a0.1c69fb81.f5014.42d2@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191105205832.GE16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-7-git-send-email-ilina@codeaurora.org> <5d92829e.1c69fb81.d860a.9096@mx.google.com> <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com> <20191105205832.GE16900@codeaurora.org>
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add SPI config register
From:   Stephen Boyd <swboyd@chromium.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 16:53:51 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-05 12:58:32)
> On Tue, Oct 15 2019 at 00:27 -0600, Stephen Boyd wrote:
> >
> >I had another idea the other day. Maybe a better approach would be to
> >make the mailbox or SCM code an interrupt controller with the
> >appropriate functions to poke the bits necessary to make the interrupts
> >work. Then we can make it a chip in the hierarchy between the GIC and
> >PDC and make the interrupts call through from PDC to GIC. The locking
> >could be handled in each respective driver if necessary, and otherwise
> >we don't have to use a regmap or remap the same registers (except we may
> >need to describe if the parent is the mailbox node or the scm fimware
> >node).
> >
> Wouldn't that be a stretch to image the SCM register write  or a random
> register write as an interrupt controller? But I agree that it solves
> the issue of determining whether we want to use SCM or regmap.

As far as I can tell it's similar to PDC which is basically a gate on
the line from a dedicated chip pad or a GPIO pad that lets the interrupt
flow through to the GIC or not. Isn't this yet another hardware block on
those paths that control the edge type or something?

>=20
> But, we would still need to add syscon to the mailbox and then regmap
> the registers for the interrupt contoller.

I'm saying that we can make the mailbox driver an interrupt controller
driver too. Or if that doesn't work, we can map the region twice in each
driver with ioremap and cross fingers that they don't touch the same
register at the same time. It sounds like that is the case. We won't be
able to fancily reserve the register region and map it in one function
call, but maybe that can be fixed by limiting the size or offset that is
reserved for each driver manually based on the same register property
that's described in DT. Basically, one node in DT

 mailbox@f00 {
   reg =3D <0xf00 0x1000>;
 };

And then each driver will ioremap() the whole register region that's
parsed from DT but each driver will mark sub-regions as reserved for the
respective driver. That way we don't have to worry about using a regmap
here and we'll still know what drivers are using what regions of IO in
/proc/iomem.
