Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB6ACBDBD
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 16:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389395AbfJDOp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 10:45:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41967 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389394AbfJDOp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 10:45:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so7547055wrm.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HNaskgA9CGTRjPX5e5ZK2QfhqMEnQGHXob8M639FZMU=;
        b=cige8aeI93GPpuuoEgeWsSpy4l0fVuwBai3aDolKgCEZoMgoDPcAwoNVLYoJYCEa5Y
         T6msSfDjto/LLQ8zYZpFpczbMJht8u586Mi/ddTTN29VtoCVE2OafbjiBDYtIHgbqO9L
         HpMfh84b2Ecaou4bqbFvXc8PDpp7fc1oOmohsoAHd7dZTck6mBlhPSVPZc0oVtspwf2a
         boDTgI3N67eFN1mih+5qCEjjHjaQAMAf1F2mMtMNv1rATkJiNIUWREvPkpp9Mw80jlTf
         8oUqJ3/HuQSNA3EzgHiMeKNj67g9AVY757SSDybSX3R+fvVoO1FeHuGyqcREgO9sMFtJ
         w3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HNaskgA9CGTRjPX5e5ZK2QfhqMEnQGHXob8M639FZMU=;
        b=hnPwJF1L6wgmt2OiINLNnFzBUYthAOkxIWBBUbwcrAxi/PPyv4G52URjlLleIs4oUv
         VWrISwNvYMCxI+ofHoQk51YxvEfedzexKg9SOUokVTfAgTpAwui8cj29dO7kSUYw3qrG
         uJSV7ppqRj1aB5kx0OVzrDtuUtZFyPFi/jZVuNOcNvuSFlRA90LcOSk9VH69ayVUUr17
         jw9wViaYjdZ3BDY+4W/0/76jpH79rg3A4LxG8bCoIAOP7wt7pfY0y2tlUzS13DgVST6W
         QGAIrci/I2Gkr3KQVDkTlqwKlwx4HLnZRM87PSOGXnH3zSePVf/X627VBoHqqNjwg9wF
         HfBA==
X-Gm-Message-State: APjAAAX0zxKfOmvk+YrgvWkrPl+Gie8dWwfZPkES3M/iLj1+JtGPsdFf
        OvSdVKSQW2R286Qpy6z9TKfJgg==
X-Google-Smtp-Source: APXvYqzeTXoEKPqTHngsFt5A7Yz0CZBxZ6TGexzTbaMsTPn1BMdEvT9oeQJeJ2hU/X9uJQuQ1NdmDw==
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr7281348wrr.11.1570200353922;
        Fri, 04 Oct 2019 07:45:53 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id v8sm9165069wra.79.2019.10.04.07.45.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:45:53 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:45:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
Message-ID: <20191004144551.GR18429@dell>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
 <20190927221550.GA28831@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190927221550.GA28831@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 27 Sep 2019, Rob Herring wrote:

> On Fri, Sep 27, 2019 at 12:04:04PM +0200, Paul Kocialkowski wrote:
> > The LogiCVC is a display engine which also exposes GPIO functionality.
> > For this reason, it is described as a multi-function device that is expected
> > to provide register access to its children nodes for gpio and display.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > new file mode 100644
> > index 000000000000..abc9937506e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 Bootlin
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xylon LogiCVC multi-function device
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +description: |
> > +  The LogiCVC is a display controller that also contains a GPIO controller.
> > +  As a result, a multi-function device is exposed as parent of the display
> > +  and GPIO blocks.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - xylon,logicvc-3.02.a
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - xylon,logicvc-3.02.a
> 
> I've seen a couple of these with 'syscon' today, so I fixed the schema 
> tool to just exclude 'syscon' and 'simple-mfd' from the generated 
> 'select'. So you can drop select now.

Does this need to happen before this patch can be applied?

> Reviewed-by: Rob Herring <robh@kernel.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
