Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B737B7C66D9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 09:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343596AbjJLHZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 03:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347113AbjJLHZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 03:25:34 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B683AC0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:25:32 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7ac4c3666so8276497b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697095532; x=1697700332; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDAhFdVB+tI63Tlx2t2hh2M0UUe3pqSQGZTAV8ccMac=;
        b=A6VeEVM7CMTkMAW3XQEu2P/1mFYFlEYacRE0Ls8x/hzbESmj5QyPpZJD1x5SsFhPqv
         H557ocPI0nTRzBCMZ5L9QPjLjxw9McUxqPFsLLmasP/Yc64mNyipynfh7TIU7M2Y1s+0
         Ig+1b1lOTnmbMVXJ1pdf+7mQOfAdH5omjlglhIyA6iuvZ80pY9AT2SnghAwrIpTVTLKI
         Mm8Xs+03HTsNjEEO0XKEn55jLC2kwP1NbEmxPb8+ldVztl7xQZ72qnU7+JhJSBuLrvQb
         +FtvuC1G3wqCFVyc1DtCcJ/bC741gF9izTDxwfWVtB/OEByXiGvsXf2iFiZhTtLPUEFR
         Pozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697095532; x=1697700332;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDAhFdVB+tI63Tlx2t2hh2M0UUe3pqSQGZTAV8ccMac=;
        b=ByPNulUoN/ycmuSbFBCDzGoRyakijzLx6dFLmOmwIa1Vw2/prayExdP1kN+M2hBJqs
         C4O74xvE8453/nKBM9f4mccwj0J8ggyy/gu0hZkPMT8LmEa/yc79EsdmT6rw9cIBgvU3
         3wLGdxVSnLn0wqf25cq3p0VlMV2dWVqiNvy9zeucxDm+A4kMqkaojWIhoY/OZrvnlX7K
         Js07h2FfQxXff1cYdIcQYD7Ge+Z1B0EVqLPMlow2LuDh83GL00zLzLlKbMi7wlzBrPKk
         WA6TVfjRAR/yG0SrB437iKnYv28GzZ0G2940E3NYZ5feMdR/RjFamyt4PLPZDyu/T8ZV
         F87Q==
X-Gm-Message-State: AOJu0Yz6TXeBjWSqJR0Wsnb08PeiFjCgLyc/2zuuYZzEZVEtdSOnd7gy
        O5TwYxFwwPXLIWxnlkpdH4ndqVdrIW2MWaoQCmvm5ASEUIqWbc6e
X-Google-Smtp-Source: AGHT+IE1z8dAp3iRYvs+gdRvN9L402ugX2Jjidpf6aPy91pCQWQFCgioWCTUTu8Sw1eBuPdlEorX6wiszzJHDYzZZa4=
X-Received: by 2002:a0d:f5c7:0:b0:59b:d872:5ca8 with SMTP id
 e190-20020a0df5c7000000b0059bd8725ca8mr22496429ywf.22.1697095531944; Thu, 12
 Oct 2023 00:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
 <20231005025843.508689-6-takahiro.akashi@linaro.org> <20231006132346.GA3426353-robh@kernel.org>
 <CACRpkdaLsfSBEG-h9ZNT2_Lm8tW8AZO7tedDVNeuZoQAqSkyjw@mail.gmail.com> <ZSTgTC4cFFpofYAk@octopus>
In-Reply-To: <ZSTgTC4cFFpofYAk@octopus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Oct 2023 09:25:20 +0200
Message-ID: <CACRpkdYD6pkccYoy90AfzV3KT7oYkBPD2_4ZW-AXzT1eUVpchA@mail.gmail.com>
Subject: Re: [RFC v2 5/5] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>, sudeep.holla@arm.com,
        cristian.marussi@arm.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Tue, Oct 10, 2023 at 7:25=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:

> > We can probably mandate that this has to be inside a pin controller
> > since it is a first.
>
> Yeah, my U-Boot implementation tentatively supports both (inside and
> outside pin controller). But it is not a user's choice, but we should
> decide which way to go.

OK I have decided we are going to put it inside the pin control node,
as a subnode. (I don't expect anyone to object.)

It makes everything easier and clearer for users I think.

Yours,
Linus Walleij
