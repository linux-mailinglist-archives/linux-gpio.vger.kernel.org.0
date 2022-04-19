Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE16507BC5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346793AbiDSVRY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346825AbiDSVRX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:17:23 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257EF39827
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:14:39 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id m132so33379524ybm.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B5FkgS7CpCMD1fBHRk4Pg2TvAwwG8HWvfvSYT8z+CM0=;
        b=cWM1mQNRxVVmkRqvpJoS6HQ7n4uVQ8ZXRkav1OIuUXOelKwkJGOE/I5lh4mFQSdjQs
         9CywP7VVEHQcY0IMFPwuidd5CTnqBt53/BReu3XS6fO1tL8Dsd4kjIXv5l2hgfHpAE9w
         dOkGgbjywxdy2/bwAxkLlXpuAqoL1N7Aa3o/nhBed31tzQe5TG07pQxl08GFRBMAAiKS
         LiN/5rbJScXQbBkUNQKS3Ol0BSMkpZC23iHgRos10Z1Pp4sQq9svt/A0KUukNX9Bmx5Z
         9cE7gtXwERipmqD/bCVXKTx0bYgY2z55WTHhHsBZVY5j07YliDRhWaHLeDn0v+nhYZGW
         NRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B5FkgS7CpCMD1fBHRk4Pg2TvAwwG8HWvfvSYT8z+CM0=;
        b=XTSKbpwdejFDL5dnXhaGKusW3a5VGK0Vp8S3Lu2Cv7taW2nCN+4wk6lDAAY0Jslkhx
         CPdZi1UeI8GfAdDXI1zyiRNBCAL3rYlAm0Bm/McLIEnrRuoO/yObW0PWDPS8V5JW1/o0
         zdE3JyfzdontfMQGOqB00UadTHfEf7OPLUPjxSmPzQ/L9xKg4Ewlqc67AOwDic5MTtu3
         P37N9Ap0QJa5VVcs69qt17ttntV4Wl3tV0RsJvodhXZ0dt3mTczh4855yBQ5UhPX3ZH1
         /4sYXtNw+kpKXqpcg3aiovk9CsCYzW2EYYa9xnFP+FVsuHUXgB4W5/6wWLRsSdbfusUj
         QHwQ==
X-Gm-Message-State: AOAM532IL5q30L0ZKGDRzgFqupzKlzvjODR77+Kn1tKNqj6x5L9Qnp9e
        eeiciMOpjTSCbHwWZoVUiBhNcNOiBgcEoF01F0MX9Q==
X-Google-Smtp-Source: ABdhPJyUm04KA3osPPotEEqNmtRkf6e+697t9fH2aHJ9OuoYnB5ZhpMPCHKyoLBadeQJAgM1x+lwH2LZA0t7o/A48cA=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12357883ybh.492.1650402878390; Tue, 19
 Apr 2022 14:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com> <20220315211936.442708-4-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-4-nfraprado@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:14:27 +0200
Message-ID: <CACRpkdYbRXrqNwo-h2jn91xU20pQ-aiNxeJHxyK2uMgbKm7OsA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,pull-up-adv property
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 10:20 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Add the mediatek,pull-up-adv property to the pinctrl-mt8192 dt-binding
> to allow configuring pull-up resistors on the pins of MT8192. It is the
> same as in mt8183-pinctrl.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied!

Yours,
Linus Walleij
