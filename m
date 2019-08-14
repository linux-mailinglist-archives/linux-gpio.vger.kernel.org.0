Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428988CEA4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfHNIlb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:41:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34886 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfHNIlb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:41:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id p197so78701193lfa.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KzpALMQhsAYiuMs6y6iJLV3dLZWeIJlGmnisMykIAis=;
        b=r2pSn+KrIj0p/r1Jh1Qa8oRX30gNZzgGkBpwKkDEJNczG7E+VnEvwitjkTtXDi+iiY
         4quGEaWmppl+rGwEtCxpw/UZ3hBqlm+OVntmnenzCFo/I6+LXJxNE7F5nzZUYPGfUZiM
         xiG/6RYIi+mV1854OvRiWUXHkXNDPIzy+8pHNKtKmSgN6mwGISjCmBFoX1/xBh582HPF
         0rE/0WduaDy2igRu2LN3eXNSIweY7DEhtBe8nqhlALJP8Xv3yu9U1R/0vGBigFAmvlLa
         PAsFJPhwguzevp0v5g/p6gMTOOiq08hxCCU/MhScC+UZSJVOlkN0kzs35xo7Oo+fvBp+
         LgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzpALMQhsAYiuMs6y6iJLV3dLZWeIJlGmnisMykIAis=;
        b=P2N1ader6tdTIemtFRGw3gvWyGPIy2W0lAr2fePmXh66JxO5040hmMj2ePpUrpJ4Ns
         136yE+OAg82EXkws6sW1lY7ynjDJyLQBMXgzioSFNPi1XRFvKrXknnCzWPcRCLEdgWng
         gg+cwVKsJxxhjPqsqaekgxNf+r8yjlbFSX90dpvSUZq9hT8ohxvoa66C796+JX2OTTAf
         XJFPGk5CQcQBqkGrKYyykzT7gBjs6cF9F4yh4l/0jN98aFT8jKx4XZOePXs2++XNtRej
         v7EeylrAZKoUBqkNwFBlLCkBstlJzGin5n3c9I5e4YMZXxR4PELmZtql5UQxpT2P3CVI
         FtIA==
X-Gm-Message-State: APjAAAVkmKXV5alz3DO+Hw1XU6zboAPVYZJrRQ9hgAPIQ+nuwS/NaoXg
        2XNsYviQkvFbOuvN8fC+gHPDUHQ1Fmo0PvizZDLDCA==
X-Google-Smtp-Source: APXvYqx5nqnXeVYMCMOMXqQ9fV6cH2bSPFPCrhICg/SdR9VyEVww1xueQTgGw2t8u9djOnijC0ljUID4vf6sSeDgNCQ=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr22886155lfq.152.1565772089303;
 Wed, 14 Aug 2019 01:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au> <20190724081313.12934-4-andrew@aj.id.au>
 <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com> <20190812101504.GF26727@dell>
In-Reply-To: <20190812101504.GF26727@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:41:17 +0200
Message-ID: <CACRpkdapA_-yp4ihY3S+CHMmDMKU2b0u=sj2UhJ-cvv39Dji_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated compatibles
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 12:15 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 05 Aug 2019, Linus Walleij wrote:
>
> > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > > Guide readers away from using the aspeed,g[45].* compatible patterns.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Patch applied to the pinctrl tree.
>
> With my Ack?

Sorry no. :( Was I too trigger-happy?

Usually I take Rob's ACK as authoritative for anything under
Documentation/devicetree but if you have concerns about the
patch from an MFD point of view I will revert it pending further
discussion.

Yours,
Linus Walleij
