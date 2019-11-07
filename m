Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DA6F35DA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 18:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730690AbfKGRkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 12:40:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:36254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727132AbfKGRkz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 12:40:55 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0F702084D;
        Thu,  7 Nov 2019 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573148454;
        bh=OYgQrmdZmNroAHb74sVUuSnpCtxolSUHgVGyEjv4V5Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rDltopZkGIFVN3tdTyMtIBC0/DHvpYC//97XoCxkCgL1Wprtj27pPVltzMEqfAnS9
         H4eUUc89erhUBoVs8OiiQr9GmEe8B6Hw/1e6dQBfKiDSw4lxtaIWMORzftVi5lU2bE
         OiHu70ENCi0eJ9yVREDlYILAWx4y/Po/OkXaHVvE=
Received: by mail-qt1-f170.google.com with SMTP id u22so3219324qtq.13;
        Thu, 07 Nov 2019 09:40:53 -0800 (PST)
X-Gm-Message-State: APjAAAWfQ2jvVcRlr9x0D9Rcemoo8XH0id4cDAfbo6KRn/LiBqMbg1V6
        XQAf0WxAYTqrUdYMhiOUmVgi8E11W7hnDgIBMg==
X-Google-Smtp-Source: APXvYqymGGkqABjYdF0xhvWYzF9gyZ7Mx6LFLCCgTmCamvcfGddIsg5zyOUpdwQsy7X4I+/2Uw4D8lnhSwngyNf7W74=
X-Received: by 2002:ac8:7612:: with SMTP id t18mr5129163qtq.143.1573148453179;
 Thu, 07 Nov 2019 09:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-2-srinivas.kandagatla@linaro.org> <20191105193100.GB4709@bogus>
 <315fd1f8-b6b5-5df7-604d-4ca92b31772c@linaro.org>
In-Reply-To: <315fd1f8-b6b5-5df7-604d-4ca92b31772c@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 7 Nov 2019 11:40:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ+EUe8TiNfUN30D9x4XNcUnevUSK2cM9zVQR=jDR1wQQ@mail.gmail.com>
Message-ID: <CAL_JsqJ+EUe8TiNfUN30D9x4XNcUnevUSK2cM9zVQR=jDR1wQQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, Banajit Goswami <bgoswami@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 4:08 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 05/11/2019 19:31, Rob Herring wrote:
> >> +  vdd-micbias-supply:
> >> +    description: A reference to the micbias supply
> >> +
> >> +  qcom,micbias1-microvolts:
> > The standard unit is 'microvolt', not 'microvolts'.
> >
> I started with microvolt but dt_bindings_check reported errors.
>
> looking at
> https://github.com/devicetree-org/dt-schema/blob/master/meta-schemas/vendor-props.yaml#L19
>   suggested microvolts should be used on vendor properties.
>
> Is this a typo in dt-schema ?

Yes, even the DT maintainer gets confused. :) It's fixed now.

Rob
