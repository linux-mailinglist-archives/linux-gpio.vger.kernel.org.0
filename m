Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF81460274C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiJRImu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiJRImt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:42:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B6E3E76A
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:42:48 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id d26so30460678eje.10
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTyZoAG1Msmk9uodk66u2eG085RCcOEtYKv2XNmOQG8=;
        b=MlC5tIQYknk7saPUItJ2DOuP94f1ZNnZVhQWVtB7n+Kd/Nrm6dfkKJuOKHhHNX7XvH
         BMXOrBw09ho8M7zMKedLCocv6dzZ0T3Qi9S2canTfhydIYettVdBmRBrwYB92V+8WB+A
         in9Kh2mh+2rfOW3pkjH4TxzWPIy/TfcIWaJQsCmTnMhDfpZp8tSrJIzGR1xeRzY0JXke
         k3ZbhSCVZbnjPpUQ91ptQJKPof3ICLYScffpZzxiLbGWqdDDbe5sX0EsWV8dl9GsQhMy
         bfmaC1aZK3I78SMGxT5CDF9oW5OUlALe61hFdW1/o92t6phVbH5faz1j+mwewEhfxv8+
         l9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTyZoAG1Msmk9uodk66u2eG085RCcOEtYKv2XNmOQG8=;
        b=S9IOkUphm0c7HmKSB0KUnRTIAPeVGloNS+1C8dgaoiyL0sc4ux4210Q4PmgEeupIuV
         CjgQetmi1Ht/eNnzGnMMnJx5ck0IO5sBDM+qxPXXHwCFkrPK1/6P+h2r/YD1BLxxvAic
         gk+y2Y9Vs+xh6muu0NJ6LsOlx1sQDxsyIVCTykT3JbM6MbmnkLZoP5/tZGyMCBCXzpJN
         vekqzUlp9y3owUMeIPGwYE+/hW0KhJvWLzK2aMsoQSY45uAHmEnioRFqXB76Fh4VrsN3
         vHEkl6VmC3XEgIdmeXhJZhxk9kZkNn0iG7y2hlZfmvUf5ZaBauDLac7IGe35nn32zx95
         xcfg==
X-Gm-Message-State: ACrzQf0vDWeTkD7HQs6KDXjXT6lQpv7w2S4G2PTPHx9fm7796pkbcZbZ
        JqhAwEA0blSsTAWPYGFfvmWmkdXyeIN0G2uJCzkEetmtip0=
X-Google-Smtp-Source: AMsMyM6eNyhJxObx3NMuafA47nbI/HO2ux80D3ao6jX7hXNxj8sZmF3gpmbTjs8h2VIYXe2WXLts9a8Yo27/FXsiALw=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr1492290ejt.526.1666082566712; Tue, 18
 Oct 2022 01:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221018070959.1322606-1-horatiu.vultur@microchip.com>
In-Reply-To: <20221018070959.1322606-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 10:42:35 +0200
Message-ID: <CACRpkdbP=x_PZfxF+J6RRqEg2jHOrP+KfmrWe=oNvpxqM9zw-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Fix incorrect trigger of the interrupt.
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc,
        UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 9:05 AM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> The interrupt controller can detect only link changes. So in case an
> external device generated a level based interrupt, then the interrupt
> controller detected correctly the first edge. But the problem was that
> the interrupt controller was detecting also the edge when the interrupt
> was cleared. So it would generate another interrupt.
> The fix for this is to clear the second interrupt but still check the
> interrupt line status.
>
> Fixes: c297561bc98a ("pinctrl: ocelot: Fix interrupt controller")
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Patch applied for fixes!

Yours,
Linus Walleij
