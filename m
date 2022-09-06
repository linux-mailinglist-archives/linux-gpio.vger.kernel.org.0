Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B855AE675
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 13:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiIFLW0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 07:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239563AbiIFLWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 07:22:22 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4375792EC
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 04:22:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u9so22448271ejy.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GxQwxvduDPxgkHYfa7obgx4RJSzWpdb3Q2J+POnbbzU=;
        b=wlufJTOluaxqsHty22wfvgr/yaOUMasEMj3CQptHjqMXuIL0VgsnYnf9UJUnPrBh8L
         BMGaxzUHUiAceo2egADuZD1PxZqJlfMgLrugsjt+1c5uPklueqXMvs6y5mmG83w/3Hcc
         NiB2MVxdJMAm3eQTrDrsCbZKiOUbPaCWxYDGh2DjSvHjyyCKIOHsz9AHVNIMliuOTTgu
         3Kta0L0kjSYtIozp36z67zyWKhuWkp7FTKJGxrKrpd3P71zA3qt30uC8CkwrunPvrOYu
         iyKEfzARp1y6GPfMijVrxt9WkHVhnRpdZOoLbG+y5pl4rLrKlINV2FsFO/kiOK6SsSiI
         MZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GxQwxvduDPxgkHYfa7obgx4RJSzWpdb3Q2J+POnbbzU=;
        b=mnHkavD1j/+FURFD2pin5MsaIYHWZSSfcGDLqQ8L675hNZSyPxUr7PLPLzcLzggTzZ
         HEy/10Xp06UIZ7D1ZIGyCU4qnnltQaJRRymmzrWELuOVpaos4RrZYi8pC7hF0F0ReVmJ
         +/yUegnfdEBymfUXMpcDCIV1HNGqe5WE9otyI76AUH7eyKIGWAmuOXTC9tEjS5v+J3qs
         ZotD9THQ0ojpOQIE2sZvPfRbLJ8glzE3kX46tcUHeIX0Ur9YyEJMTR88JdXs5ZfBitsh
         PBXwifpF7kty5E5FgRpcFd2R1sijRaYSBrj5WfjT3XWFAPsN/dQFZdTVPQfoixGKQvMl
         AOOw==
X-Gm-Message-State: ACgBeo1qF+5g1gcAy1XsxRdAFpuVEUBCdj/6KT3y7/aHM/8xPri9K+mV
        YARkDtwNg3dx3RbXJKc9AdMMWn+TCO13dWciws4DYnw8+gwgxw==
X-Google-Smtp-Source: AA6agR6qOgXW0cQGHTsQD5997iYQ/IwGPFitZiCal+0u+c3seIrnzzlcqbWaneV9j1rFlp2n++AKBdQWpAAmtBm/VIw=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr33365628ejc.208.1662463334764; Tue, 06
 Sep 2022 04:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk> <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk> <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk> <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk> <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl> <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk> <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 13:22:03 +0200
Message-ID: <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:

> Another argument for having sub-nodes is that the firmware actually
> exposes *two* GPIO controllers.  For now we only support the "master"
> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
> separate set of SMC "keys".  We currently don't need any of the pins
> on the "slave", so we don't expose it in the DT yet.

That sounds backward, like we don't expose device X as DT node
because $OS doesn't use it yet. DT should just expose (by nodes or
other ways) all hardware that exist or at least all hardware we know
about no matter what $OS is using.

FWIW I think nodes makes most sense because no doubt for example
the RTC is a separate hardware unit somewhere, and so is the
GPIO. The fact that it is hidden behind a software abstraction doesn't
change the fact that the HW definitely has these discrete units.

Yours,
Linus Walleij
