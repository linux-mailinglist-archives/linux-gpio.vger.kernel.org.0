Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFB554C9D7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbiFONbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244665AbiFONbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:31:13 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CDF33E07
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:31:12 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-30c2f288f13so60994897b3.7
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VaDlzhe/4P2Kqx2Bwnrxn27JBdo5H/KOFM+Hot3AAmE=;
        b=VjGtmxbDwO5KvtVwDsx0byMAEpIZJFQyb1385NLVlSIaOVXqE4BRBKo0Q+CB1K6clR
         osZqtBgQQ8vtGi+c0v87jnfzT4gXOLYWe5IeLTNQzsEjRjWgU/37rSGtmIIP5/g5pZ2E
         lRlL/CzFxL41AeCMnOPafpbPqgLCEOtcuVtvIwqP0YPBmvflkjGDMv2YXNFYCqNmizpP
         MobXUKMIkpAVxy3trUAjZTIH+cU/LOqCng4dHafCdu9rFFkLByjosnAeyfeNtJtAcOIZ
         49svvBvQUZS1pKEfKA2X8TKUMQsmlN4k+URgZm5RgfnljyrQO5mKlPbajY+LqYncEtnj
         JxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VaDlzhe/4P2Kqx2Bwnrxn27JBdo5H/KOFM+Hot3AAmE=;
        b=kUwkbt3d+rv34dERuYf02qca0jvAPHV+nNYVR8wDBRya5nIex3rP573tbEud9wNY36
         sXjRk3rCAgUb7/qUvP54eFjRJF/LI/G1TBYMnyiod+DSeRFGS21DSmaeXqHrCV3w81Ml
         IkwT3yj7gTjboAqqXm+3hMhgmyieKrbIngVYFYP4mlrLyWXQp9KhvxL/CdvJdsncB18U
         bCtzWXkZpH47zfAsEn7KgJUrLeG8QNf2jRiUeuluO208KQ+SxrViRVdUQBms7vhMD/Fz
         R6qNzwaAFGd7jHfMEOIcYn4WtwvXVxVY25SuMCkGcaRffLGWffFxOe5OD+ZnKUv6kB+R
         RdHQ==
X-Gm-Message-State: AJIora/iwpveldoZOwW6x1PxdBfWgVeA98YZMsFlPVZygpdvLlt6jlzz
        V3bmD6zfr/rjqUT0N+wlJ/arVTEOQg60idOU1Aa32A==
X-Google-Smtp-Source: AGRyM1uhDAk/ild2A1mNKUqVV7KIjDeNtFQGXSjhxjTW8mxcpzZcCXEnXrU9MrIb4NLDnIGXlsp+0mACPztyzwGZO9I=
X-Received: by 2002:a81:6807:0:b0:313:35ba:79da with SMTP id
 d7-20020a816807000000b0031335ba79damr11666091ywc.268.1655299871601; Wed, 15
 Jun 2022 06:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220531221954.160036-1-nfraprado@collabora.com>
In-Reply-To: <20220531221954.160036-1-nfraprado@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:31:00 +0200
Message-ID: <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] MT8192 pinctrl properties adjustments
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 1, 2022 at 12:19 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> The two patches in this series substitute properties in the mt8192
> pinctrl dt-binding for ones which have a clearer meaning and are more
> standardized. At this point there's no DT using the mt8192 pinctrl
> binding, so if such changes are to be made, they need to happen now.
>
> v1: https://lore.kernel.org/linux-mediatek/20220525155714.1837360-1-nfrap=
rado@collabora.com/
>
> Changes in v2:
> - Dropped Fixes tags
> - Added 'if' blocks to enforce mutual exclusion of properties

This does not apply on the current pinctrl devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Could you please rebase onto my branch and resend as v3?

Yours,
Linus Walleij
