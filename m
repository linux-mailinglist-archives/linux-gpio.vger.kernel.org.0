Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A8738FBF6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 09:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhEYHsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 03:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbhEYHsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 03:48:23 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC46C061574
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 00:46:52 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n4so5142063wrw.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v55P6S5W7xrOd/7SzhygqC9B4BMec90s1TTSAj2EVxE=;
        b=JajTsqVKIfsWuZ1YrQXqPuTRbCnCPA8rGan8mjq6zPyXX2H4MFK5L3fnVH7R22ucVi
         1SYgnolIifkRimEssKJG31YS1HT2fFeZB3zvVt3J9IaFtNnJSThrbl5Yf+TGlZVd59ta
         D+8wOIOStaAQaJ8ifPspoDD77EDjnSSMhTZGTE+EcuAClrkId1vNjEeWZIXmbYNIqMRu
         bWqGjVzBQd+FBecuDWce1Pw2msLiJK67HHr2EGDzSkjMeJs9U583NdjCRPKI9Od2S2rZ
         NDe6OmegGTq7eTb5/TiycCAdK/52GDNoVy+6/062Qq3HZUE4GW8Xp5US/V23Wv48k1Pk
         29lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v55P6S5W7xrOd/7SzhygqC9B4BMec90s1TTSAj2EVxE=;
        b=udVyG3DQ6NDMh6gjj+NDMdYlu+WHWDsDH7rIx9cGScepdJyfkmVe/CIbV8g7tuK1J3
         D5ccKio4YMos+5ErvMBom58eXbGoa+4f+oXuzPCFQI5lXilLnpUUPRsyRdHYevg+Zzt3
         zusyXH0uxBLsv1V8zcFdRmMXE3LMVYU/cKpx1B66Zo5jevWNy9y+SJDlt/P7whR+Oylo
         zFkTP+7ntSzCueIZWb+H1B4qD9MpWaXn9hbDScM5GkdbvRbrF8ecpdOf+FJRr3KTds2g
         +4EYf23rbiY73eB98G8d/zMSaJawxqmXMIz592UV7u2geBM6rYF3pkerC9XFyfHB+Qw6
         gy3g==
X-Gm-Message-State: AOAM531wXmDkOPxZEzL9bePbQg7pl9qmA1WyRammvzw+VhnvEJKu4TmK
        gdZ/NJOYE3uA7fQIivjpX3rElw==
X-Google-Smtp-Source: ABdhPJxra+VdD0HTsZR+c2d1us85Dq8lMeLNrROWhWra+R6dRK5Bqzi5HZanKgKfTsSKdJMTHwMgdg==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr26244243wrq.2.1621928811370;
        Tue, 25 May 2021 00:46:51 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y6sm1749432wmy.23.2021.05.25.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 00:46:50 -0700 (PDT)
Date:   Tue, 25 May 2021 08:46:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Robert Marko <robert.marko@sartura.hr>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210525074649.GC4005783@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210524230940.GA1350504@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 24 May 2021, Rob Herring wrote:

> On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > Add binding documents for the Delta TN48M CPLD drivers.
> > 
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > * Implement MFD as a simple I2C MFD
> > * Add GPIO bindings as separate
> 
> I don't understand why this changed. This doesn't look like an MFD to 
> me. Make your binding complete if there are missing functions. 
> Otherwise, stick with what I already ok'ed.

Right.  What else, besides GPIO, does this do?

> >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
> >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++++
> >  2 files changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
