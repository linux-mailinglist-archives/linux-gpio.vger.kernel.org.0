Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036F722231E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgGPM53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbgGPM52 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 08:57:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A92AC08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:57:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so7058783ljl.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YG2LKOdWYd/bTTjkxfoKbEzQhT3TK/zDfM+CI3ExrzM=;
        b=Nk82UzN5seJrl1cNhd5ZZzA9N7Ryj8gabhrOFllw1G/xGomBuYnR9kgX/TTrnQAcKr
         k4jd7BiRk0qKQPuyh75qogQZZlNbViUSqd8MGqHxIINCPaEELr9C5afXHS+E3c0gnQ+g
         ztsOv6J9ZIQqkNwI8AR2U75UJT5O9CKySItQJit3hJq7M8SGQaYs+abu/ao2Oe8GwCvx
         TfZU9OTKtmDUDSdLjPtglEbioJnRy8H+YI0t3K7hAqKYxsIh9xUtYwk6x8357KOhMt8N
         DkYrW1qE0WcpoyQuBOFieGC1FffoFHQBtbdntuK4chG3KdSTT3/X8EEwD3JYx/ucxTm0
         1OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YG2LKOdWYd/bTTjkxfoKbEzQhT3TK/zDfM+CI3ExrzM=;
        b=Z5VQD0BOFGUlXD2MYNBQl39aMZXXaWoAIPv0WDabIsv90SexnwNKvVv1T9v0rKd/3O
         n3m22IwPNRyIBvBoz8nZM3aKR0H9WswPsNF1SZy48EZ0OPwH5AdiUtkHCCdXnoV26gXr
         KgOrM7+IF+1qHekTSMZsdpSTpemQfSwGerxjsynR3aGD8ukXZhaudzgNCj/7W2ZJI5/2
         pMj3rw14zUOPUPwHKxxVuQftXyRNP0NZEQiJ/1MVWu13jZf0v1j9DOZ9gwyg8vxJe40S
         mxZCJrGrTFeSKtZK4CTUbNGRCLH3w1jeqUQiIb+6zM3UAod5BvaWs7MHC2Kk6x+y5NYG
         keTw==
X-Gm-Message-State: AOAM53143JOZ1aezTKL6JnYEFO+qknRj5fb30q8tn5p+sY7YFBWLqNud
        Z6V3OhivSQPGdCRdyDKMa41I2z0Rqr0p/nctIXo6Wg==
X-Google-Smtp-Source: ABdhPJwvgTFLxPouWe0ts45LeDMTroofYm7kdd4TAF9Saf4bU0BF0CtPgz4G2dEZU8LGfXYo1Kje5pie0asFSyBYuGI=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1818019lji.338.1594904246944;
 Thu, 16 Jul 2020 05:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
 <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 14:57:16 +0200
Message-ID: <CACRpkdZ6AKfpAVbBgWffOonp1m7_AfeCw-6YTQxw1wSfMFsyFg@mail.gmail.com>
Subject: Re: [PATCH v2] [RFC] dt-bindings: gpio: introduce hog properties with
 less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 11, 2020 at 6:54 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> compared to (implicit) v1, changed to ..asserted from ...active as Linus
> Walleij suggested.

I'm fine to apply this but would prefer if I can apply it back-to-back
with a patch adding support to the kernel.

I know the bindings and the OS should be decoupled in theory
but ... feels better for me.

Yours,
Linus Walleij
