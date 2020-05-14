Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3A21D3329
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgENOhr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgENOhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 10:37:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A2BC061A0E
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:37:46 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so1317851pgl.9
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=myAfLnmBUwxOXrWpGmgAhuCrYyR/+Qq8ha9lCmTxobQ=;
        b=VVJT+tRdvrHedNG3fWcxgTVWuPw1kNXTpW31v+Zdv+sQr+6lTcPgup5zkVZ9D7YNKG
         sGXHX1XE/Ca+gIB8IBrlzNwi+Mko1SqNSHfodsk12A9YwLOnksgHlalr0gCQE/McA0Pm
         MLAhafXzPZTcbuXIWkQRsIsTGeXX5vm6ujwTR3aC8vCv3cRiHZ6rRaDEpSJg9tFoEfF/
         V480eHYm2hDmTpSj79PvM3VpG475Nlp4IP0mA+qnTjcS4VVyqWyvuEq61oyht9AWrW+Y
         AqfNHZq/nAxOgWvR6YMkZL/BZA9CPzIAxtn6q6gOA4Lp2yJKaYIIgAXLrl9BjABi37/L
         uYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=myAfLnmBUwxOXrWpGmgAhuCrYyR/+Qq8ha9lCmTxobQ=;
        b=Hta4GICvewbVGv57WlW24WOTd/xqC3b0td91nSivT+2bdCEeSmaQh4aogmaP5gW/bH
         OnOychfapT5f5BVidWGgbeaOATdGCEZkYkBIRbwpofD1Ceo7rCPbIrY1q0DMChXb1UvN
         XAegTFYwAoe8A9vZH32TQ97hYtENb7KCgcp1fmlSiZyF6So50S5y6sKQGTqlE3Fz5qpV
         UedEdVF67JXXIr4w8U8HnWs1UpqYVwxiynbavKbICa/fGxPfkvNH6/WihPACWCYQg5vD
         KoFKhIVvvNVAdMHNvc1icXzqoeOAmP2CU+6lo+E1y6UFW5Cq3BK0t6BxK278aNrB3xDK
         TPGg==
X-Gm-Message-State: AOAM533K5XrBiKc2w2AB5ti/Hk/7eGVmGJbCbL1CzRAl3OUvdHdlqH5y
        UkmzMU+E3WpQXnFwaKclGLq9fQ==
X-Google-Smtp-Source: ABdhPJzMUAO/Hp/8HePC/WpyIdkcWchv8FZml1mVlO6EUQe7g4ISZjDUtlBSdcFzqCdLKZBeYAn4ig==
X-Received: by 2002:a63:440e:: with SMTP id r14mr4398210pga.340.1589467066271;
        Thu, 14 May 2020 07:37:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h14sm18053136pjc.46.2020.05.14.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:37:45 -0700 (PDT)
Date:   Thu, 14 May 2020 07:36:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl
 bindings
Message-ID: <20200514143616.GU2165@builder.lan>
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org>
 <20200429213453.GA32114@bogus>
 <20200514060422.GL1302550@yoga>
 <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 14 May 07:12 PDT 2020, Linus Walleij wrote:

> On Thu, May 14, 2020 at 8:04 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 29 Apr 14:34 PDT 2020, Rob Herring wrote:
> > > On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> > [..]
> > > > +#PIN CONFIGURATION NODES
> > > > +patternProperties:
> > > > +  '^.*$':
> > > > +    if:
> > > > +      type: object
> > > > +    then:
> > >
> > > Needs a $ref to the standard properties.
> > >
> > > Would be good to show a child node in the example too. (And try having
> > > an error in a standard property type to verify you get an error).
> > >
> >
> > Finally looked into this.
> 
> Can you send an incremental patch because otherwise I have
> to revert the patch that I merged (maybe to trigger happy, mea culpa).
> 

I appreciate that you merged this already, so I'm happy to fix this
incrementally.

> (If it's too hard I can just revert it.)
> 

Afaict there are two different $refs available with standard properties
and adding either one works, but I don't understand how to add both.
Also $ref'ing pincfg-node.yaml means that the binding suddenly accepts
standard properties that the hardware doesn't support, so I would like
to be able to reduce this list somehow...

But I don't see anything preventing this from being done incrementally.

Thanks,
Bjorn
