Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7795C27C741
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 13:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgI2Lwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731378AbgI2Lwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 07:52:35 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F939C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:52:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m5so5149992lfp.7
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tsxcTYlmIt7fvSKcCyMiXfnmpMUlkCmokvJqIWw/AQ=;
        b=jjOWrjZ7uwCllS0OYNttixtOrGeXrQxJugCu2v3GwGaMU88Cbu9bKFfcGk4YgS8kA6
         CsxTSPEhUEB3QIobkbv54/t2k1Apsnjom+7y/88PmGKC6hXYb23/zfW9e2NG9HFaTWH3
         giuTVdl61v/yhftsQIkuKaAtvCQDNCkOPMMCmqk4P1QjWB1kaBJQopeN3vzmME+jkiMF
         StGTEqKwiChGFx+SW7eOlWuhtGOUsgUvkCAYA8z9mGM0jiR9LJkVXCR2ev4BtHpPTdpD
         4tg6P7tqtBhWeLx7A/5BU61hYP1khSLAlsN0wd4MfmqHTfV2chMeeo+BbvoDURpxfFpK
         R8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tsxcTYlmIt7fvSKcCyMiXfnmpMUlkCmokvJqIWw/AQ=;
        b=s/3eDxb2g5rJVHZcFCpLyxBxR98l4hsAPcFK3vr548cJe5IP6iXCd+IAUSEnGCIIZa
         ubSW4moAz/3W9rdBvtWOGTE7XPd2UHQ9DaMWMnqYTuXg9oM6MjxXlA9+DjkgWciFCOln
         3cBOQdKntVzhFKY/VUF/5zl+NfoT22Rq3s5iNXYQzeR5YPJfU2IqlhMMWhUtDDaSrVY/
         u/i1EIHhKA9i5nx6arlSCFyn9EYXY2Iru8NIRMA2nFQCb4Ri63fuETaWVnZin01gw1eb
         yuDlt+RZREd+bAsfoQTITbfUB4AzZbr3ZtdICda5AOMjDqJKqQRW6EAsORsBqGm+qoxp
         agug==
X-Gm-Message-State: AOAM530Q2M6zLt/1qgx/LKo2JWgdIXHzr5aairF1fgU9j9/P84MWHQyv
        A04Y1OwrSeX0SUgpnR3nofJlNHWNX/bXiaC9Cm7/tA==
X-Google-Smtp-Source: ABdhPJyz74jPaVUkdmhbwYZ2S+u3dSjvZvKxeT3Peh7LpsNsRgF1dUdYrIIkppHQ6YlpE4/57iHv2mOxCZjyaQ7fBcM=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1163049lfq.260.1601380352826;
 Tue, 29 Sep 2020 04:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200920195848.27075-1-krzk@kernel.org>
In-Reply-To: <20200920195848.27075-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 13:52:22 +0200
Message-ID: <CACRpkdb+7jX7LV0U9J74sQefgxzkwOMv5E+8uvjrmb2Vexv+SQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: pl061: add gpio-line-names
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 9:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Describe common "gpio-line-names" property to fix dtbs_check warnings
> like:
>
>   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dt.yaml: gpio@e8a0b000:
>     'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Patch applied.

Yours,
Linus Walleij
