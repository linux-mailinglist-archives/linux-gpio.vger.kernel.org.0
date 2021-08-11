Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1A53E8C9D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhHKIyG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 04:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236392AbhHKIyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 04:54:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6846CC0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:53:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d4so4102193lfk.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3AiCUWhgfaQ/Re4MVUqsQq5azIzJHgBMesbI0wlW/ZQ=;
        b=uCwmQccxrxGK0rbVI2asZmP3OKbsYKZ+DvVUn6w4vzMQO2hqr5ZpeMmShnvbBU8/Yr
         ZHrWLxRoxQX1pVuGeAJoOic61PhlPpiwESkj7USTzPr/1EAXEQxFAjqosz11DxT4FlFM
         bbrPVxhBxg2k5VgjesQQZC9WjuEXQz4y4fIV4eunpY/rKbK7wv13z32fDiOGlz5tlXtF
         lC15FlLulxhKFjSC41aMc28F/YM8Gy/fhV1LC5lcLoLFKfmLCcY97MdrfpTDMX36LDzg
         zLXli7upUMMfUBTLWPlXFZlU7rbgvECD5d3SbvaneR1in6XEIMcHGVMHFG3FuiJMk7Pa
         dHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3AiCUWhgfaQ/Re4MVUqsQq5azIzJHgBMesbI0wlW/ZQ=;
        b=Gw4M4Vj1wNWfhnStnldLMb0bUvpIuTuyw3C6s+gbILWG0RfCQ7m/SQea60QKc3DNBI
         y6FltanrTBsx3Hav7pEoP6Bxu9km0G/m9fI53QOOY0p6NVQyWYXgohmwwS89LvCa19i8
         5MRGCA+vvgJGHSfNk+wXR2uuC8B1u6HoNy+U+QYtBXOMVipKP74bXs3yNthHlcFBX6ia
         ZXKlRpKNC4WfN2sQTWDib4JkjhVEq+vs/AmKgJjf1LFbUUzwXb/5aK8myVO4NPw3KUAu
         Xva+yfmfyjnVQsoehD87wdy3ahUy9xEWDhazEY3IzQmIrIO7f6xYNzcgLe3nQPJFsNgq
         urbA==
X-Gm-Message-State: AOAM532F6FQJLHFVBA64d81Gw9shOXIPUqafVNCCPoaeSvckqre3W/Dc
        UYASDjLCx48b6DRXhY29ZD/8J+mPDuffKTOKsrJrMg==
X-Google-Smtp-Source: ABdhPJwiM31QODgSzneDy7YtTHVThH6UHiJzC+ra8IUt6YwIQr8jCgHTyTZ7OO09tzof0XpJJpPWGQJeaRRxwn8/QIA=
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr13222195lfe.157.1628672020757;
 Wed, 11 Aug 2021 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210804044033.3047296-1-hsinyi@chromium.org>
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:53:29 +0200
Message-ID: <CACRpkdaC-vD2Op-ZzJY8uWQUoS8WH5UPd0FPpWYkExXDg-5biQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to include/dt-bindings/pinctrl
To:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hsin-Yi, Matthias,

I have applied all three patches on this immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-mt8135

Then I merged this branch into the pinctrl "devel" branch for
v5.15.

Matthias can pull the same branch into his MT SoC tree so
that the hashes will match up in the merge window. No rebasing.

The same patches will then come in to Torvalds in two ways
with the same hashes and match perfectly.

Yours,
Linus Walleij
