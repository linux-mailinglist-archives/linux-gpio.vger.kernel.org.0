Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFAF388356
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 01:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbhERXxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 19:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhERXxG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 19:53:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A96C061760
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:51:47 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m11so16323389lfg.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9edfP7byxvK0U61EA/wSfyi78oOGqh1Vam8gAK6iPTs=;
        b=qBLQUbOhrNIqoPvFcPylhSjRcgJSbYYE/U9GIqwEedomt/tfWzA85r+bbVrKAwis73
         id2JCF8EsvI9ww1M4ucaVaNAw2gXh+Nzc3lr7EVrJdRRKtpaYavMppRMiaTVw6sU5bwe
         LWT0Esl2qD0Ups8rO/RbSSyKF2jOVrLKtXAUup3Y9/3/YsvHt9IyGfScBsl+0JZDQhNf
         6AM54mGvvp9VSIarEyfB8qSx0C1OJDJt9fmcZ7pZocKk1fNik/whA/Gna6vQgRTYKZTK
         ZRqWdr/Vgp1cR9t90PXvENWM/xpuDfJvoImwCgJaz50DF/E0iVQkYuWwqSdCGZdZzQhN
         GgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9edfP7byxvK0U61EA/wSfyi78oOGqh1Vam8gAK6iPTs=;
        b=AhlWkUZq/HOyglQDQEFRTnJANC0TS7L3WeJZ0fyE+14Zfp8NmJPLmK6D8BGasZXPo2
         j86mZmGcFaZpNrHqGU2GDW4U/tjIC1HQjJzuj9dEucveM3HEnq8FXAWI6ooiMrUkF2Nn
         +UkVzB4kwoZgiE+R0IOLWQ174Z52dmnZqs7vyiq1PFTyMpJr+TpiEtaJrLkewfNlqaVo
         XQS/zU5ycTKk2i0I7FOtV0x9toizPJNXLiXi5SUYEF1tYgWza2FMRAo9zw8X9bdQn0Z/
         0LiAgy636pDGQsyc3Wk69YT1H7RmarkcrVKywfL14O3JH2zONXFYwDrM21Sc3tGcME9B
         S8PQ==
X-Gm-Message-State: AOAM530adIPEvsD2WcMPcxVawqDUS8Db5rg0WgaIiXz/TTxCJN5W1Zfr
        jafOD7METccVqBYkTnjWVPjXfJZ4G0cuPjd9cDquew==
X-Google-Smtp-Source: ABdhPJym9GoeL27+IEeJYYnnReVKRL2eKM1qmzRgU3YRPz12gHL8AdcQPEWAsVeSGo+ydu3yWcnvyvzdoCxUgZkGdko=
X-Received: by 2002:a05:6512:49b:: with SMTP id v27mr5967475lfq.29.1621381905714;
 Tue, 18 May 2021 16:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210514123309.134048-1-tsbogend@alpha.franken.de> <20210514123309.134048-2-tsbogend@alpha.franken.de>
In-Reply-To: <20210514123309.134048-2-tsbogend@alpha.franken.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 01:51:35 +0200
Message-ID: <CACRpkdbhyvMt=e-ne50Vb3jbCbcPCdhFw6nov4Gxge3q1fo5_g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 2:33 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:

> Add YAML devicetree binding for IDT 79RC32434 GPIO controller
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v5:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
