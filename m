Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA2A1D325C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 16:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgENOM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 10:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgENOMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 10:12:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA80C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:12:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b26so2761056lfa.5
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkzKtHfHzDrv9acZGYhRUV9tmRVRbn6arGIc1dXkxBI=;
        b=XottLg9cQaTSjBHR11pedGRx+Glhzf+8Usg9K//kY6W0jNVJL1plss0LJBLgC3nXhz
         M7/NBircuUPinVKCHjYMUacfV2lTSjNWOTELV64WKqTIb+VoAHkWrKK+LyXiKxtTc91H
         EkpxcjLeryrGNDHr3ahfTehONNWh2vDTvJC3KrUAVwr5ekDS6uVYv5S8fYzsZqRMeDcg
         U9QIPtq8KUiqElnQ2rNtYXfrfX1ML51sOsdTUPKMJPSEfu+9xo31LZcyI4nCectwBKUP
         tA1N9H4f3nEE3y6yZE9MxWwkMpIknY1ov4rh2crp5UPVHztPX919W+E1wCHPIKL0EBRz
         aJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkzKtHfHzDrv9acZGYhRUV9tmRVRbn6arGIc1dXkxBI=;
        b=gYft7sxCoMog13nLQHo6L74lkA7PylVbTK++yP171qNpDmeZIz9c16zNwhqtP5gUSO
         NLulHa0DrN61vde9gDxF6Samz37uSA0/dcL5n5u6VYLxRGtOioGkla1wiRDSfVBhR4O2
         Y28Na6V2eEIJyXzegXdN1rmyt4TmQT5FOELZ4NE2cxtUNVi8XGFXEiSaMJzIolKeNEHj
         HX5MWiq3IryQw+UNyLNjmJ3Mg/GpWeIHkQm5LrYCaufKA2qdhgKdPCihNeBDHiqNM+hV
         0aISsQ4ScdG4+O5sPYyFbvpiKFp0WgvhZxDW+kGwsXaCfUna79pdE5vqz13Khyev79wq
         P1EQ==
X-Gm-Message-State: AOAM530W/bDKJLx29zjYsak6vOnmget0SsGiwzmnkgdxe4+RfztEnAux
        EbWIIQB6pasGnt/AT9HAbeTg94OsM933gK2AoSr0mw==
X-Google-Smtp-Source: ABdhPJzbFJbGyW1QIZoQeEMNyecliP3FhYfrVVsA0/vlx9bAuXukGyGD9ZMmozQ02I6kOFg4AohML8Hs61aAnqoqEGA=
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr3507458lfr.77.1589465542377;
 Thu, 14 May 2020 07:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org> <20200429213453.GA32114@bogus>
 <20200514060422.GL1302550@yoga>
In-Reply-To: <20200514060422.GL1302550@yoga>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 16:12:10 +0200
Message-ID: <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 14, 2020 at 8:04 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 29 Apr 14:34 PDT 2020, Rob Herring wrote:
> > On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> [..]
> > > +#PIN CONFIGURATION NODES
> > > +patternProperties:
> > > +  '^.*$':
> > > +    if:
> > > +      type: object
> > > +    then:
> >
> > Needs a $ref to the standard properties.
> >
> > Would be good to show a child node in the example too. (And try having
> > an error in a standard property type to verify you get an error).
> >
>
> Finally looked into this.

Can you send an incremental patch because otherwise I have
to revert the patch that I merged (maybe to trigger happy, mea culpa).

(If it's too hard I can just revert it.)

Yours,
Linus Walleij
