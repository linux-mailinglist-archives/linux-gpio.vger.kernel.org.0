Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7252854ECA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbfFYM07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:26:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38817 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbfFYM07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:26:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so16044191ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkM0/+Y2mDTWRWvyb1EfYEosGBa2XCe1MpHMrOCqACs=;
        b=gjRocc0M0csOsxcltg1nkQWWzkjs3PSER+yR2O1GOwKo2FVeeoBS8PgxAD1E6mjPxY
         LLT3xmGdPMDMbbTnk6hBta7ypvxPkY6YPvTpZ+01Z0y098PfPKQ/+49XGlm2WDmMh5tl
         D1coqelf7c3PUCElzY3sJ9LOc4F3XRV8vFhFCXIBISTf3Zg5DyOBweRq306XDmxj3zbr
         QFf+mbnJOyKWRpw7ox/wP9s7TnI3bxPYYM/t6l1xHEx/ARZvPVDZZXiS28HhVjokMT8L
         C/AmhzogK4YVADlvOLp6zZpxSrK0oXTk2Wyo8ngs/zRfpv9qxe/Ofch61mG2cQ8oZDX6
         ZJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkM0/+Y2mDTWRWvyb1EfYEosGBa2XCe1MpHMrOCqACs=;
        b=tIPFl+oisn9aFuMNBvdBxQt73Hm4gDyVzrWO2wFh7elC/xQhF+OqM5/JbLefv52l3d
         YOb5My8aQN/Tnv+dZGNdmF7dz0Nt/6/BgC3Pu+ZcszugrIzAIlIoxuKDgRPGwzNUm7ek
         mxCBoUqDmySOir5dVgifg/H4lggIDsfe1X6IIflydasfBDQN/47cF0TH2Dl1leWFJVl0
         6NkUloujRLZa8YyjRpZf6ZrzdMEB7hrC0rqvwj8TffLYA3yJ0qV1nuIH9UE4snmD+M+9
         tKabE2Lui/KwIznoLOEKDYAdA0u+oWwuao3onLOa5MTcimCIhgHtias3aTJYRwYyt81+
         Vy9A==
X-Gm-Message-State: APjAAAVHyAtD53mEiP2LuKGKRIGSDucFn3WSpfUh287Hcvy1A94Ts3ts
        LaRz2L4WRGjQje7K6Go+Zc52U49lEtECWDK2Mm5sOw==
X-Google-Smtp-Source: APXvYqwqmW7K+YRAv/jeZfMAYfAGHtHSP+nnNJ4VnkYeEMfCpom4R1Lx1FjpN+hjQApZV+HFHvgf/yn0v6vmuNYbGmo=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr9060553ljm.180.1561465617100;
 Tue, 25 Jun 2019 05:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190617215458.32688-4-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:26:45 +0200
Message-ID: <CACRpkdbSS18us3o=v7ki_=8cLXYjfDd8q321xMCounXPh11GAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: mvebu: Add support for MV98DX1135
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 11:55 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The 98DX1135 is a switch chip with an integrated CPU. This is similar to
> the 98DX4122 except the MPP assignments differ.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Patch applied.
I just assume this one has no dependency on the clock patches
so I can merge it separately.

Yours,
Linus Walleij
