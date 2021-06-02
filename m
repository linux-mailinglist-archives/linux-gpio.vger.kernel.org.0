Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFD43986C4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 12:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFBKpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhFBKps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 06:45:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B515CC061574
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 03:44:05 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n4so1802535wrw.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jun 2021 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ole7lO4EyLGinmZ8kUSEG9cz+TpAxKO/SXaZD0DSzF0=;
        b=zLctya8nFGOpjiADxV6+6MKc4Xq6E8Lxwv6ip7ffav9gMpcG73fAmznNqHuh7YZM1n
         LH8RAtsoM+ItO1+nfvLc+wggdWn+YXTue7oUj+zw8kophFRhEKJWejDH9BksEmkQd+9T
         pqWXovq/ljsy5DRNIMZMauGzzcJncdwRGzIVrjpNgz2PEnZBdYwHi5hXl9yGOyDz40+Z
         Tk1k+h4hxC/FaJJacBLHBFDM8JautNH3ZIIl1Gt2njZf6Y+phCjqdRWvJEr/kfvMxKve
         CHY/LwcVcM0GeeBT6kUmnyPlgDus2plwRD/H4MnR0FP37QgBgr0bhHigkKDoTRf2+ves
         nM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ole7lO4EyLGinmZ8kUSEG9cz+TpAxKO/SXaZD0DSzF0=;
        b=jQsB0ZFNIr1f5p6jSGlGY2eD9T8TSoMtP5LfMKQEk83qocYgPnM8n9S+/cEHR8kgiw
         Pva05mAetl7rdbGwAz0KCyT1CkDP4D3yc8p6g3fhfr1pVaG57pblpPaKRPcywN6YrpgN
         N4TgPcABGgfoZkYhJIy13QoBLzDXdbrBdxgagYoHG2btRmVZZNmobFTIyZ0znBPaOLTk
         96kkNee3XpDWWrMExE0ywppckqVQwLsepIzIUzPfXzRakmbr+1qaB5tgFIoL7IGKK+U4
         PiyXznl+G+lOvxlPesvR8BGQ4n7wt9CXuG3AqiZoY4DuuGbqUTcFSPb2K2vRx6nIjdEs
         cvjg==
X-Gm-Message-State: AOAM533CqrsSRIqEyYpZcMTAOY935DG6lS0Qo/TBm/y7GRU+2FsdVBAo
        /Rh+XeBnj/eHRLo+Ty0RHhKZGQ==
X-Google-Smtp-Source: ABdhPJwDqgbP/SHb06O2H30yLG/kSQpCc/ed/6ikkEiiCozM8oxPNF8qMXZV8rBwVRyi/g2dNSgrTA==
X-Received: by 2002:adf:f28b:: with SMTP id k11mr14056396wro.89.1622630644414;
        Wed, 02 Jun 2021 03:44:04 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id u17sm6216067wrt.61.2021.06.02.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:44:03 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:44:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210602104402.GH2173308@dell>
References: <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
 <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
 <20210601135816.GG543307@dell>
 <20210601144826.GI543307@dell>
 <bb73c46de48094759099e244e09b333c@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb73c46de48094759099e244e09b333c@walle.cc>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 02 Jun 2021, Michael Walle wrote:

> Am 2021-06-01 16:48, schrieb Lee Jones:
> > On Tue, 01 Jun 2021, Lee Jones wrote:
> > 
> > > On Tue, 01 Jun 2021, Michael Walle wrote:
> > > 
> > > > Am 2021-06-01 10:19, schrieb Lee Jones:
> > > > > Why do you require one single Regmap anyway?  Are they register banks
> > > > > not neatly separated on a per-function basis?
> > > >
> > > > AFAIK you can only have one I2C device driver per device, hence the
> > > > simple-mfd-i2c.
> > > 
> > > Sorry, can you provide more detail.
> > 
> > I'd still like further explanation to be sure, but if you mean what I
> > think you mean then, no, I don't think that's correct.
> 
> We've already discussed this:
> 
> https://lore.kernel.org/lkml/20200622075145.1464020-1-lee.jones@linaro.org/
> https://lore.kernel.org/lkml/20200605065709.GD3714@dell/
> 
> And how would a device tree binding look like if you have multiple
> i2c devices with the same i2c address?

Ah yes, I remember.

I suppose the saving grace of this scenario is the presence of the
Reset driver, since this confirms the device's MFD status.  If it were
missing however, I'm not entirely sure how we'd solve this issue.

I'll go have another look at the latest submission.  Bear with.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
