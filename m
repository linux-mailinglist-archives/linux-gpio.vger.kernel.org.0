Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2FB6225C6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiKIItJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiKIItH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:49:07 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE9615A07
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:49:06 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id 13so44894356ejn.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t6EfFhYH21wXCx5kjRB3VR+RjAOXhDuqMYuEWR7pfrc=;
        b=Nv7TuRYLaRfjIJzC6Ibfw2k09vxMwaZUw45xYAICJVBRgjbKOKg8PUDAQG2g6d8HJi
         t3pRsguCdxuipvLzx/0kRwuRJ/DG4SSvIuzTQHtUAJTnMywRLHL/PXt8UYYTsOB7ALyg
         BQZ9ocCaax4iGoUDpLJ6QXNKRZDL7RVGCaBkwgQwePtVY3amGCcBqLVTItoKRHSgpmQB
         q0PTk8/L3xeNCBKUOFkI3tNolnWCJ7IPG6Drl7RKCIv/3hmqJ9vA5R/rpLgLO6CFazxy
         REOPyLV2fG236cF/HQWDda+X47ZFZ2W6zCDiJnpJOF41PUgxFx680dNyvZLLT7mM12xA
         IkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6EfFhYH21wXCx5kjRB3VR+RjAOXhDuqMYuEWR7pfrc=;
        b=42M0KaJ5QvX6rEXvBKCHxtH6XqNXkdWLtNY+2y9n1JmT/YTIb48H7Lv7YzLOnks+kn
         NLnaPeQ3ohyApqFC84d1Hx+SpHxfwe+04553NKY9wLuf9Gctwfwk6mTZowTWzyfTY1vi
         7zMWjLoTbg11qmDMJ3rpsq7QH+pEQieu/lHAt7b0mSUZUJ3Xa3d6ZbusexZY6xCxcIye
         jCFO2y0LTQbX7afGTz3Nwl0yO5s8oljIvqreViMv0IaRvU22RpUAYPicbS2Mez8U+atv
         xaVx3dh8k7e0jwMDqvs1iaSF96yN/O/7hRaHScsosa5i77hjLPsGOzReajeMMFuvELIj
         y2QQ==
X-Gm-Message-State: ACrzQf0jxmr4qlrR+OwKMDkqGVWmZgZdEInpgCHff+bvEXHL+3uxUkVB
        RXsP/QFzRheBCsqE5PKVYALjGfO18jDwOOHJUTNT4w==
X-Google-Smtp-Source: AMsMyM7nxsdRqbV99dDWXx3gc/r8zrl4uOIAkQi5rHuFSGiwieq/RYyQHXEPHnWl7E/GjBRB/NOZh8cH3d+9Df2IBdQ=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24200210ejc.690.1667983745034; Wed, 09
 Nov 2022 00:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20221105084905.9596-1-linux@fw-web.de> <20221105084905.9596-2-linux@fw-web.de>
 <166765939131.4158830.8416727494529058690.robh@kernel.org>
 <trinity-c732b826-2a12-4ab1-aaac-294ac5524926-1667660774779@3c-app-gmx-bap26>
 <CACRpkdZsP-aj6hcD2sOB8ypVqdxwC8dWOo0d52qnDpxppUwNAA@mail.gmail.com> <6752A6BE-3750-4195-821A-917205F59258@public-files.de>
In-Reply-To: <6752A6BE-3750-4195-821A-917205F59258@public-files.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:48:53 +0100
Message-ID: <CACRpkda+yxwUhPSZ1EFHJJRFONKW63caBb_X1qPVVKxSA+QNhg@mail.gmail.com>
Subject: Re: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
To:     frank-w@public-files.de
Cc:     Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
        Sam Shih <sam.shih@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 9:46 AM Frank Wunderlich <frank-w@public-files.de> wrote:
> Am 9. November 2022 09:38:03 MEZ schrieb Linus Walleij <linus.walleij@linaro.org>:
> >On Sat, Nov 5, 2022 at 4:06 PM Frank Wunderlich <frank-w@public-files.de> wrote:
> >
>
> >That patch in turn says it needs another patch first.
> >
> >Now I am utterly confused, it is really hard to follow these trains
> >of patches depending on and breaking each other left and right...
> >
> >Can you please tell me which patches I need to apply and
> >in which order?
>
> Sorry, picked the wrong link. Put all pinctrl patches together into this series to make it easier to follow (but v2 because v1 was for changing only mmc pinctrl and to have no conflicts or "broken" commits):
>
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=692462

Thanks I figured it out I think, even managed to apply it now!

Yours,
Linus Walleij
