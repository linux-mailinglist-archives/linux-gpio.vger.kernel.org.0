Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F2EC633
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 16:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfKAP4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 11:56:33 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45647 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKAP4d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 11:56:33 -0400
Received: by mail-lf1-f66.google.com with SMTP id v8so7538190lfa.12
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2019 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fFCvFToGeaHVIGU5sFBVgfSRoD2BKpJyYjD9mLtHujQ=;
        b=F9Ndl5PhHtMPfUuMcm8khWvn73/BEOIl++HBIcr20Ca4EaRLGm0X6RFvsiVYxyTX1g
         ScVc4k5lnnHBMJ/H/gnJWwg7s7cajawJ2YKfsHiEtNaOhBIrW6P82v9lWIsp4xPGOmsA
         9q8ZHL/h7W1JGbUDLXrlJb3earEteWQrnKzeYI4pTOy0d8MaY+lfEZgmfgMGyFxVDWOZ
         lusyDw5qW5fg9ImIFhykFIXEit3Pty0/IEovLGP9ElvcQ0+kyi6ngXU+wqtlfiMAIXmA
         3oC4MDlTxQoJKR2Ml8zNsEQhHYR4x9mVMEqIxS+PkIWxgT1z+NItPSoSl+FuRRrny1sQ
         xumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFCvFToGeaHVIGU5sFBVgfSRoD2BKpJyYjD9mLtHujQ=;
        b=i01shonYcY+TTCKf4jyo7QsdrB9WlBGafLm/26vUNRAzUGkEdkNgklv+ajA4R7WxxT
         WdXlCk06Aurkr6A/1Qlwnt1A/8wS8y4b/So1WBvjnwqwNNMNFbby/YDbFyK3X20QuTAn
         lyCsYf9sQORpc4LBo3fHXoIw9/B+44ChUAsy3T5t5stFOU5lPXYJQAd35mTIXU1tPl+3
         J8gqvZiaRmdaSm/aEpaTFAqMASXKfBRBKQ8dijxpNkF8FBBVC7LklMuF7bLPIDtKRlCK
         1LRjD9k/NLIBk54i2YLpC3gU88WDeOfc2xEO3BUIqgg3CDzYYXFSsQcU4AN5X63W6ZqC
         vqug==
X-Gm-Message-State: APjAAAXW36vIg4kHEarE1+NWs9DBeq7IxOLqsL/yqtollilkgBlh6/QU
        +3l7T2Q7mpc4qIEmol+r2wsjTN4VBe/g42i4JqcZXA==
X-Google-Smtp-Source: APXvYqxLkZQZkIBPHIuRg8wW008rxg1ziHdr9p3sXGGFnFmuX+RTcYVkFo7wPFbzWchz3TjPyV901OIH/V9MrUR/M5o=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr7717304lfp.5.1572623791617;
 Fri, 01 Nov 2019 08:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
In-Reply-To: <20191030114530.872-1-peter.ujfalusi@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Nov 2019 16:56:19 +0100
Message-ID: <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,

cutting all the discussions in this thread we need to see the bigger
pattern:

On GPIO rails

People want "something like rails" for GPIO. In power supplies
and thus the regulator subsystem, rails are connected to many
logical endpoints.

- The suggested inverter bindings would be effectively an
  inverter on a GPIO rail.

- This suggestion would be equal to many power consumers
  on a rail, such as the usecase of shared gpio-enable lines in
  the regulator subsystem already provides.

The former seems to have been identified as solveable for the
userspace that needed it and absorbed into the drafts for a
virtualized GPIO controller. (Aggregating and creating a new
virtual GPIO chip for some select physical GPIO lines.)

I haven't seen an exact rationale from the DT community as
to why these things should not be modeled, but as can be
clearly seen in
Documentation/devicetree/bindings/regulator/regulator.yaml
the "rail abstraction" from the regulator subsystem which
is in effect struct regulation_constraints and it sibling
struct regulator_init_data is not in the DT bindings, instead
this is encoded as properties in the regulator itself, so this
is pretty consistent: the phandle from regulator to consumer
*is* the rail.

This goes back to Rajendras initial DT regulator support code
see:
git log -p 69511a452e6d

So it would be logical then to just have:

- More than one phandle taking the same GPIO line
- Figure this situation out in the gpiolib OF core
- Resolve the manageability of the situation (same
  consumer flags etc)
- Instantiate a kernel component as suggested,
  mediating requests.
- Handle it from there.

So:

gpio: gpio-controller@0 {
        compatible = "foo,gpio";
        gpio-controller;
        #gpio-cells = <2>;
};

consumer-a {
       compatible = "foo,consumer-a";
       rst-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
};

consumer-b {
       compatible = "foo,consumer-b";
       rst-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
};

Hi kernel: figure it out.

From this point the kernel driver(s) have to figure it out.

I don't think this requires any changes to the DT bindings
other than perhaps spelling out that if you link more than one
phandle to a GPIO line, magic will happen. (We should probably
make very verbose dmesg prints about this magic.)

This is enough to start with. After that we can discuss adding
flags and constraint properties to a certain GPIO line if
need be. (That will be a big discussion as well, as we haven't
even figured out how to assign default values to individual
GPIO lines yet.)

Yours,
Linus Walleij
