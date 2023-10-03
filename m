Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60D47B72D8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 22:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241120AbjJCUxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 16:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241115AbjJCUxF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 16:53:05 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910C6BF
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 13:53:01 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59f6e6b206fso17150577b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696366380; x=1696971180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt14wylIoWnbcXhDHRlgibumbtrD/L6WB2BDNq/uwc4=;
        b=Q3cDbYlqd9LAsD+g7YS+1sBhTT2bt3ZotGmQIG3aHsbpxLadUWwQMjev3sc9uS6HAx
         sDOor30yfP98HIIkQ8tp28uspiH3lIwo/PjFuVp0SmSrxOnyJYe85rYGZHGzJVhdZW6N
         y53dRYm197/nQ8VyaE25YmREl5aKcSW3JfOHBE4WoU7EQR8MS1GlGnNKUrs++TmJJ7XU
         sAzPr4E6vuNsIcSDDP7U8HYAfqPZMkRFGJRU9xgvd9fEpyQBjttQF2I8lxLvZxFwTjHM
         jhfx2AwGZw5aKwW6YMI7soPa3VUe8eSSuq/skm1i1YAduA9KgVeXJrtUCY+1Q7MCCfRU
         MdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696366380; x=1696971180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt14wylIoWnbcXhDHRlgibumbtrD/L6WB2BDNq/uwc4=;
        b=NY96qV1dD7wdwgAbmG+7BaMbOP3RMGIBY7LVTtO3AikzH/hXfHpd1gdw882AyToNQs
         5GAVypNKX1CJX6Fe3xs7um+diftKBgfkLtak+AQPbks2XCl9Mx+g7UOqrKQOpUdQXCAN
         mCSbUDTco3NEvBxNW6D7Qg0VPvqfFHrRO6QKTmTCcieBgtzYqh1u405DxTPLenBRNASV
         0cuCs7oHP4HstgJlwtbVzhEM7VQr4EAxwnc1iQ8ZPfjC50628Wzx2z5pDCt0wgfVNVOL
         SomIPr/m07znbMWf4mHPv3dROBs2v+srIVMegrgikcYhZsSRwqm99NM3Ysi2LrAg8vrN
         ko6g==
X-Gm-Message-State: AOJu0YwXAD+XkEZrANJUVpyDYuWlvlTk58cR9eAmA2hfLNNxTdY6rHRt
        KYI9vy+15f6QA6GKznhyXoX8S5wXbziUyG3f6v+Hkqsi34PWWUkb
X-Google-Smtp-Source: AGHT+IGltDHvoagwvELuhiXRm3gPHaNjqQ8ydWenusCYp5p2iPnIMX62XJICRXgdqR/Og5UsqkzHiiwDO8oYfsIhKho=
X-Received: by 2002:a0d:f387:0:b0:589:c065:b419 with SMTP id
 c129-20020a0df387000000b00589c065b419mr734080ywf.34.1696366380636; Tue, 03
 Oct 2023 13:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231002021602.260100-1-takahiro.akashi@linaro.org> <20231002021602.260100-3-takahiro.akashi@linaro.org>
In-Reply-To: <20231002021602.260100-3-takahiro.akashi@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Oct 2023 22:52:49 +0200
Message-ID: <CACRpkdY1NwE-jw_HqhwAAiLJHmz-kjzjB-SyqgwR-0n4gbWG6Q@mail.gmail.com>
Subject: Re: [RFC 2/4] pinctrl: add pinctrl_gpio_get_config()
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
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

On Mon, Oct 2, 2023 at 4:17=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:

> This is a counterpart of pinctrl_gpio_set_config(), which will initially
> be used to implement gpio_get interface in SCMI pinctrl based GPIO driver=
.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>

Makes perfect sense for what you are trying to do.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
