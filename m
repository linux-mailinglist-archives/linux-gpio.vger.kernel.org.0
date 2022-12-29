Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB53658836
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiL2BD1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiL2BD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:03:26 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A12913D3B
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:03:25 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-12c8312131fso20307589fac.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xaDFX5R3pZTlwgMJAjMdLHj2CV+7CKefg0hSkS1XLA=;
        b=ym5qubZM8rvr6e3c4BTxhSbGtkpKOxXqmxySAm5ouSmO/3xYIZecitlfGz0iGAbf2T
         3UV69RtQhH/ycjrQDhaLM/5dFp0QOF7V3RKpWyteCr9shvAredTXRp1h3TEWe39HNblB
         vi3lOvAqibbHJAOX4Gcs/Ho98KVJ63TODCI6Z4cTxOeyaSExe35B+6AYjG4fi/bB49IG
         tJx+pEFPlLYScufQGsW20N7IYlvVPrfXRBtKHQ2t7AcCOpiLxG27Wxa4NjZuNCFYSM9T
         PEQ7vgGRMiwxAD44nq+HgP5tud7QYvHuE5oSHXFcfRyO94cM87rJO/tHaTA+7VeonS5s
         x4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xaDFX5R3pZTlwgMJAjMdLHj2CV+7CKefg0hSkS1XLA=;
        b=VOAsjneTP1i48KGv05O0oqR10WShmj7wpSM1wBj98zP6PA8r0SdEnh0Tzt2njy55HJ
         J7czBY9c2rwh3tzW/m6Gsy2H+BXuOtIy8h6/3AJ7x/iRC4ezd/hYNOIYKsCcBXH/UMmm
         +QspFkdDmT0qRjNECZuJwckiGqLltEuvFhJCLoS47gpF3pP0Yv9DIKSKjwCoZv7TJhQX
         OIhRG2/hW/ocmQ/Waj7oeZLnAhinHJeJbeY0XswEEPmiZkcuOdPyQL/vpHYvbQoPrRWn
         Rkyqq+6IvbpODEJkSfeS21/Dr6M9QFUL/I5UQy34xH5FrS4nX9d8/pUgwqg+ljWymB6r
         oFuw==
X-Gm-Message-State: AFqh2ko0Sgd7+pnR/aCCFRp0Ngd8JytvxN3/25yiM2ZxR7wJus0nnE16
        gRbnQ/WEzixhnVLRZYUpmrncg35a7rsum/IYRYbPdCnonjq7KgZ5
X-Google-Smtp-Source: AMrXdXv20ZBkBlGC/+OBKVy748kQCTa3/9o0X3ic10yfZ1WRTIALr2BijBk0rHxHFQl12L+sSvW9XQZC5J6uJnpNeV4=
X-Received: by 2002:a05:6870:fd89:b0:14f:ede2:db25 with SMTP id
 ma9-20020a056870fd8900b0014fede2db25mr901499oab.42.1672275804413; Wed, 28 Dec
 2022 17:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20221213182125.929303-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221213182125.929303-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:05:18 +0100
Message-ID: <CACRpkdafGmfVKTggGfuBg3HZZEE+7LtyOg2SGMfk6qMZUSCr4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: da850-pupd: Drop empty platform remove function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 13, 2022 at 7:21 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied!

Yours,
Linus Walleij
