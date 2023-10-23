Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB97D2C92
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Oct 2023 10:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjJWIXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Oct 2023 04:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjJWIXu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2023 04:23:50 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB35FC
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:23:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so2805904276.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698049426; x=1698654226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpnntzEb5o/Ml0Qqe0KCKq4eq7J7NuQ3k8IMCzED+Ts=;
        b=TJWrolUYCT5emRY6ml9XKBbUnfz5Zl1sbvwSQ9hcWNUCqssj4QzlWiwg+aO4ZhI40n
         MlSgozndN7cWKneUbFK/z51CtG5YcM/RrDdGzSHlEjoFQoCQDiaLeog6AA2zyCXFC03U
         oRRo5f/TuC1y81Goa/bChFYycNRpzEuYVoCV6PBjgotYMynlUXO8bg1bDIYFOWS6wCHw
         aqYWSoWzSaVT5mzUp9hPQWaf1+kcP7/jXg3U2CKMcLakQb0G0BxBSwPefDRRno9hRLjC
         EyDcL5t4iTDdFHdbkDmyiT9DXpx1A3LPAGongWichdtjich3C4Xbonw0XTD85MtNVr3i
         Lm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049426; x=1698654226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpnntzEb5o/Ml0Qqe0KCKq4eq7J7NuQ3k8IMCzED+Ts=;
        b=cYD4mlG/7lHdLxdlAVYc3qC0E85pqGrMzg8arFuD7j10HMDJkmoqhFDQl0f83Bj8F/
         UCUtyK+16to5Wn/82jZpRqEPmA7BpvHxU+oGCE+tllT+sE2J822z7Pt6EEVD+pAjYtci
         6jgf1numbHTyWenqHYMzneQSiLB37KnX1LTf5ma+qIaiCVCF93IH6tDQuI/gNIqpsBTk
         nqilHS7toZUN0BpmieBzr21XTBQOqK/bELpGsOyfEuk35iIC9j57+rB9cHMx2JqsqGG0
         7n5zDaJiq6s8S0QP+AvTrCE6gC1aa8rZU9OHj6AexGwNn7kHazL0wwQFqvYLI99AUcqi
         mdkw==
X-Gm-Message-State: AOJu0Yyzer7ZoisntG9P5q6+cNk9gFwfaYc6vQTUJNaZgVjGpdzNNILU
        aEnRJ5aI2GcyW6gT9dkeo7jhJLh6PZR1LoWxRwmskA==
X-Google-Smtp-Source: AGHT+IF6ftqwtJugUOJmnNX5j0h06zjDNP/RGkApQv6ItGfNW54yB/Tbq1iZq2wbglRvkVe+knfJjLN9DZIKxICOgMM=
X-Received: by 2002:a25:e606:0:b0:d9a:56c2:545c with SMTP id
 d6-20020a25e606000000b00d9a56c2545cmr7898590ybh.15.1698049426245; Mon, 23 Oct
 2023 01:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231020185203.3941590-2-robh@kernel.org>
In-Reply-To: <20231020185203.3941590-2-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Oct 2023 10:23:35 +0200
Message-ID: <CACRpkdY7eroz_+wgb9p8y4DnsNs4w=X1DpqPhVx2LTuedUO55Q@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: brcm: Ensure all child node
 properties are documented
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 20, 2023 at 8:59=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The Broadcom pinctrl bindings are incomplete for child nodes as they are
> missing 'unevaluatedProperties: false' to prevent unknown properties.
> Fixing this reveals many warnings including having grandchild nodes in so=
me
> cases. Many cases in the examples use 'group' property which is
> undocumented and not used by the driver. As the schemas define 'pins', I
> assume that is the correct name except for the one case, 6358, using
> 'groups' which is documented.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

> Well, it's been a year[1] and no one else has stepped up to fix these
> bindings. I'm still not certain where "pins" vs. "groups" is correct or
> whether it even matters (to the driver). As there are no .dts files to
> go by, I went with the schema being correct unless the example was the
> complete opposite (6358).
>
> This is about the last thing blocking enabling checks that child node
> schemas have unevaluatedProperties or additionalProperties. If no one
> wants to fix this correctly, then apply this or we should remove the
> bindings.
>
> [1] https://lore.kernel.org/all/20220816183911.2517173-1-robh@kernel.org/

AFAICT you did the right thing, thanks for your perseverance on
this Rob!

Yours,
Linus Walleij
