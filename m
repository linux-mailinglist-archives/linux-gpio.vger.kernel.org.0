Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4BF71680E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 17:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbjE3Pwt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 11:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjE3Pw0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 11:52:26 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5589B1BB;
        Tue, 30 May 2023 08:52:04 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso3479542b3a.1;
        Tue, 30 May 2023 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685461924; x=1688053924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QvjuGnOnuMpHS/8h2nMBHcd349FV9zoUe5mktYfGvK8=;
        b=HRMltly7dJjLX1TKMHJsfQoVdWBcj3G8rDr0uOTq4Zt+jlbKtyaUP2IfTpqDfbpzuL
         uNGg3emgSKQYlGKPJ/hOfHPxJK8Ig3cD90Ag81/ThD/WTkFNC0mJ06y4CfvigjOovBWJ
         AWI6iuPIauT0NJw5m7wVHLjDWlhLaNwNywWneHUfJHGKI+e3Xoj6DF0M6egscTLuPBwx
         3lSVbp+CWVROJ/r3wu9CZKs0b9LgC8XkxKs/hVHyGPN6mc69ODh4MOQpxup80WDaAOhy
         jQ64thcI4D7DX4AEtFsFR4bfdzIafdaW8jXvmrsNUUlDYxaNFx8ecY7QlvTthR51pV7u
         4/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461924; x=1688053924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvjuGnOnuMpHS/8h2nMBHcd349FV9zoUe5mktYfGvK8=;
        b=j1skOtIDEXD4tZSpj4IPB6YETzDXPsrfmEfJkdgPCzfFvAhxlODGGOTBYbrKvmyDQ7
         ubfxaonmWj8Ii8mdNp2WHx/Up09bvD6K6BMyUNkyO+d7QiTzjphx8BKyxddYMinTTG6K
         DHU3ftiuA4mVGUH/EhsmZNW2fs4RsrSEQxZMTIM0NpfoBSy1Ir0LIJgTXgUcRoELeKFo
         Vw7QTYVtw/d9GY40dUU6bcjIrWTEe1WL8qdYLgCRgOeamPKQR17H7bdawbqutSNmltMk
         WgTbhMyRNaQSPoJx4hYqPprviGQoafsPwa3Io9zBcTZ2UiOOtOMqmZ45OXjbCwYP5aAH
         DdEw==
X-Gm-Message-State: AC+VfDwDrCBvdd/WN9vUz+Sf4v5Xlw8WEv+DptqOCb87ylzuPdpINX6V
        M34jw8FwFGAeGpA8/5i3C3c=
X-Google-Smtp-Source: ACHHUZ6aJ7O8Zwe+9NJNXJ9SUYdgthdaMnKUX27ssWc2qhsxBQDH9E6dZc/7XKVR9x326pS5UKA2cw==
X-Received: by 2002:a17:90a:17af:b0:23f:83de:7e4a with SMTP id q44-20020a17090a17af00b0023f83de7e4amr2874304pja.7.1685461923581;
        Tue, 30 May 2023 08:52:03 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z8-20020a17090abd8800b00256471db12bsm5148323pjr.8.2023.05.30.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 08:52:03 -0700 (PDT)
Date:   Tue, 30 May 2023 23:51:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: introduce hog properties with less ambiguity
Message-ID: <ZHYbnDHgc9ZMc7rj@sol>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 05:19:44PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this is another approach after
> https://lore.kernel.org/linux-gpio/20210503210526.43455-1-u.kleine-koenig@pengutronix.de
> two years ago. I switched back to "active" and "inactive" from
> "asserted" and "deasserted". The poll about the naming is ambigous, but
> I think with a slight preference of active/inactive over
> asserted/deasserted (with my unbiased self preferring active/inactive,
> too :-)
> 

FWIW, this makes sense to me too - the active/inactive naming is used in
both the GPIO uAPI and libgpiod v2, so it would be consistent with that,
if nothing else.

Bart, just wondering if gpio-sim should support the aliases as well?
I realise they don't support active-low, so polarity isn't an issue, and
it could even be confusing to support the alias, but just throwing it
out there...

Cheers,
Kent.
