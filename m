Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FC92026E5
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgFTVeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:34:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39563 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbgFTVeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:34:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id a9so15288541ljn.6
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
        b=fM4jBfoJ8l2d8ZgUkqeYaPu66l91KZ+pIQwrkEHS4iDVaScL1olYwKtzFsLv7tD6nc
         U5k2wV+U0eGTAME55rsSEefFLQbDFZoLdJWUSbEFQ6t2b9dMa5pThSZpU6CpmQhaAA6x
         wZQhubqxLH+t28SzlysCuddi8WW516Qro+ktfIHpZpNZO6upfyub7jvC1rh4j1dzn3kN
         r5s0jtTEv2e77Tzt4Z8dZ4ZvsjOeJF8+gJsFz2nwuIyW2DkeeOkQKMcGAsbiACdNNct8
         xXLJO8p/SzLJuWgd1BIvAcPLaFclUaxFY/oF3V6ZsY1n6ODXPpOTgsHK/601jY9P/XqC
         NDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMLLcSh0FlLbcDXmFaO9BURwcvJCFIp9+2dM/IBT/Z8=;
        b=Vwx63yX5+ii+qqY5wNUfQPLyqyvXDJ0HK+VCuTbCHEuz65QiUNPYIXd1nWQLh8bWHy
         fi5PxwYdxkneLIcYfOtSnQGh+uZREYjOlTN1RhsJeYYr2/Y7hihwvjxdVfdbHgGTuZZC
         Yd1/Jxwk2wCHvbw4Cd4USlcze/mjYQ0kA/jKWan1N6Q4PPqWseN+5Jp0Hdk+pAQNQbAa
         IdUPkQctLE0tk01mR+pmDuqskYdf0DBwZC2pFWV6+Y+v1D8DpCaZH8fROgdqPe2mH9gp
         0ekn+4LQhcMsi//Fe7p1QZHhGTSkECkD3MeUEPX6AXW+CTrJg8C5RjM2Oa1oomLB4LFH
         VdUA==
X-Gm-Message-State: AOAM530mTv7L2ROIZ+tbpp+9prYeP47RKqvcBl+Bk2pT/syIwFJ7HGN8
        QVYpidaPUoQ78Vm8DxMw9Rji7wITHJiTjZqEvvtSDQ==
X-Google-Smtp-Source: ABdhPJyc/rKcuZI7IzUgOFsdvhotZrQBegRWHGiFD7Jo5zA51VgOf9AQa+SOJTDLDml/A2XI/RqRiyXvUzFabtKoFAk=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4816556ljz.144.1592688785302;
 Sat, 20 Jun 2020 14:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200220162246.8334-1-benjamin.gaignard@st.com> <20200520085142.GD271301@dell>
In-Reply-To: <20200520085142.GD271301@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:32:54 +0200
Message-ID: <CACRpkdYry6=iJ8hpy+pS9hFuBJD5Cf1ZKJwCkCBZPGW4rGa86Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to json-schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 10:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 20 Feb 2020, Benjamin Gaignard wrote:
>
> > Convert stmfx bindings to json-schema
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> >  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
> >  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>
> >  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>
> Linus, anything from you?

Looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
