Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9F3974BF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 15:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhFAOAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 10:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbhFAOAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 10:00:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79394C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 06:58:19 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n2so14506649wrm.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lPDyqCgW5N8mKQzA0MAxky9M8WdDayexIhj7sTzmUNA=;
        b=tGhARSkhrsVAUWgiTeoM3jWxu0au+PdD26HNhU3DKLnH0ixY27FTZNo51u2ZsnCwaY
         Dtrl++pdq/SBeLdT4BhhvAAsBfrSXOI0/T/8lX6d+Tbvsu3aL+SgA5lieONd0c28b0CI
         na3aQO/hrI/mbnC8TMdIK/ovoRYZajbx+M2kp746+LMOQNvgrfxF0qSat2jByJDbDyTS
         L93r+/r9UlO4O7v5rdCQYWx64ZANwFy9d+2jucgPI4HFSGwH3zBJ0sF9ZSYdX4kH+CeD
         cPbzKsSK1T7Bch4MJ04rJcK8ad4X07/LwRhhZ/AMxJu2MqDD4RahAGkMNzUg4NB5VYUw
         rF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lPDyqCgW5N8mKQzA0MAxky9M8WdDayexIhj7sTzmUNA=;
        b=nulJTGyQCRUuvaglc56hypIm+mLqanBEOr/nQXLYVzJ5TToObhPHfskqSbpPTMXHwI
         47VOlkbpPlEa4ZPiUIMs6EJqkNG3zjuoNwPho+PvkE9A8DEkGe1G3Z5LokPXEWvv/iXb
         mMHbbah/EBc/Nd941pFMsGmB1IHgV/CTySIjuReALZDe0N4IODTED97BJhFhafuRstdl
         dck7CZi10GBY7vPqWqN7Fliz6RvLPYPVPoLNVlP1Q+aPpgdycJLtCSzSp1DwI9kZ41x5
         lBRPXwP4lsIsbBwOQEnh3AuuIeFKYPq6oQDG4U47c+E81g2IWJIOyCaSCILX8cmyCwt4
         +Tyg==
X-Gm-Message-State: AOAM530AWMKEE3UhaqV96h/+O7v9Tj96RUw9L3SwW6FfLjC+/HpJjXMK
        CeeZcd9T8/IUVFqn33BSplkMlA==
X-Google-Smtp-Source: ABdhPJx9NqeJClVntQi50fQAM3ToqxsfX7q06xCQWjOTFRNIU+hyHWkjDpO5Clfx9yxLhH9p3HZPeQ==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr6386878wrv.109.1622555898143;
        Tue, 01 Jun 2021 06:58:18 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id q20sm4179532wrf.45.2021.06.01.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:58:17 -0700 (PDT)
Date:   Tue, 1 Jun 2021 14:58:16 +0100
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
Message-ID: <20210601135816.GG543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
 <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021, Michael Walle wrote:

> Am 2021-06-01 10:19, schrieb Lee Jones:
> > Why do you require one single Regmap anyway?  Are they register banks
> > not neatly separated on a per-function basis?
> 
> AFAIK you can only have one I2C device driver per device, hence the
> simple-mfd-i2c.

Sorry, can you provide more detail.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
