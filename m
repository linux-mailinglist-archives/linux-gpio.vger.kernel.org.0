Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8526A3975C2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 16:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhFAOuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 10:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbhFAOuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 10:50:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043B5C061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 07:48:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso2097491wmq.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VBC6p0CYeTEs8LBPbXWO6qCXW99P1wQJJOQ5N5i01VQ=;
        b=f55fOyvgfKVrMZ6UQnW/TFJ97BT7PIjrBGSrf0ub+jmYIYveM/SacTYD/ffCi1gMvy
         dx8UoLwj0/giE/LRl2F15A3HRxak29o+Efm4mX1g3WkiptBHirjkOvAGxhY/pVV9gX6/
         gUBj6RiAzW/jZRPUduBuSH6Z2R79khEBSKbSbbvDcmAJ6htuMk7Qo7PuTod9CVLY4JRd
         a+sqCtPYJDudohhGXcdBN2TthfFLDOcngAhN62joNzcfa1dok5sj7cvtH0QQIbxyK5Ig
         na4SoYMk27DwSowOCkNqj/TsnC8Zcge5EOt8x5elNcfKnBmG9Mm8p+8IMaH7iiwLMwRa
         +dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VBC6p0CYeTEs8LBPbXWO6qCXW99P1wQJJOQ5N5i01VQ=;
        b=k3efioRXUDLT50GuIZQj0ZcmY3WtpEfyIG9xFGLwKYBgm0J5gn1RE+ZAV3WMj0Ew4v
         wU6iqg5maNFDmtJxx9WxbQzqlTi23Zo7JjST+DTIkQDnzkSjQlecKj69DxcmX+6E/YK3
         GCqPRkj+p5dt56FznSpUBbjTR8yjD3l9DeDplB0X3WMc36uHffy0Ev/vfdpX0E6JZFM0
         ey8ljxF4uLme6+ktFrxoMZH7ylMf1ShYZ5kDhtzk0AReP+c0fUjJOs8R7cyiipkfzGWR
         RJLe6LHx0KhgoQOyccGNlcob/PhEUxoKkwEy10cc6xf8A7+h4jVvZ2bjhKcbla+GHIo3
         V2XA==
X-Gm-Message-State: AOAM532x36Vga8ylx3NYrL3ulFyTSO2ENBigjFvgn1A+U7EgCg/5wuYK
        ityd3DCk13oa3hBCUcAtlUe7bv39xaqvAg==
X-Google-Smtp-Source: ABdhPJyKyx/OmLkVnsfXkw6GGCEzY1jkBlJAaOeO4cBcuvzhR67UEnNW8PWcyRlGmP0CkoTkW6pt6A==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr302581wmc.104.1622558908619;
        Tue, 01 Jun 2021 07:48:28 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id h1sm3331865wmq.0.2021.06.01.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:48:28 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:48:26 +0100
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
Message-ID: <20210601144826.GI543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
 <50ced58164999f51a8c8b9c8dc01468e@walle.cc>
 <20210601135816.GG543307@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601135816.GG543307@dell>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021, Lee Jones wrote:

> On Tue, 01 Jun 2021, Michael Walle wrote:
> 
> > Am 2021-06-01 10:19, schrieb Lee Jones:
> > > Why do you require one single Regmap anyway?  Are they register banks
> > > not neatly separated on a per-function basis?
> > 
> > AFAIK you can only have one I2C device driver per device, hence the
> > simple-mfd-i2c.
> 
> Sorry, can you provide more detail.

I'd still like further explanation to be sure, but if you mean what I
think you mean then, no, I don't think that's correct.

The point of simple-mfd-i2c is to provide an I2C device offering
multiple functions, but does so via a non-separated/linear register-
set, with an entry point and an opportunity to register its interwoven 
bank of registers via Regmap.

However, if you can get away with not registering your entire register
set as a single Regmap chunk, then all the better.  This will allow
you to use the OF provided 'simple-mfd' compatible instead.

Now, if you're talking about Regmap not supporting multiple
registrations with only a single I2C address, this *may* very well be
the case, but IIRC, I've spoken to Mark about this previously and he
said the extension to make this possible would be trivial.

So we have to take this on a device-by-device basis an decide what is
best at the time of submission.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
