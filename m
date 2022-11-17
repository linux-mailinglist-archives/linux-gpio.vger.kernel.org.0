Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB43262D652
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239664AbiKQJTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239590AbiKQJTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:19:41 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF126CA0E
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:19:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id n12so3453562eja.11
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tE554iAjQ7h+EY98fG7iQCp1+WR6gTDY9R3izQaYbSM=;
        b=RJhyPa+0sTKDvMNQhGaUZE84gU7cSwkIKl8kF/HVjWq5Kj8MIaUnjuF3vLeI9zmqt5
         S4s2/BXDCeR0toJbwvrndR8Rf5UdjyCQum80hnZc7NVvKmoSa674I2uUdmUvlens85Oh
         4IEcYGdVLztzhbGbHqk1ZEtp/QFDREZj6FTRUqRKGVlXFCjQljGRgSSASkya/Vzc8HYK
         VTCncgrg+fqLRoFnVi4HvY7VC9MQCX+Tm7avrETJiBdVXAgiE7WBypICOwr5fpEwMgS9
         eeomFvvxoF/uVInIxAoNemvxQI3VF46GvnxUZznQv1ccf6lqUT3r9FGZ2CCBL3f6760M
         X6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE554iAjQ7h+EY98fG7iQCp1+WR6gTDY9R3izQaYbSM=;
        b=lk4SFmw0+YvxPazoHHPChcuQYbtLEJHYbk5PMc/Ql16G2FRT0WDCVutxfUmfDI9aB0
         NdHGEerpu+9HYm4DwEAn7l3ZhH1fmSP+Y6DBHg3E4pF2oObuypAbdh9QI+o3ko2/Ntfi
         lqHEAMdI2T0974DFe9T99Kjp7Shnk+a7TPeKV6exzmWPFvI7CWbR91mZUw7upGDvp84f
         25JMyo7l0EfngMCecw7dwlw3D/YgltfQTnxbR72hKVvz+Dw/13IzdEBa/IJ8tTPL0i3E
         cpO8BGDZub+U4nCRdLSKCRZ07iLHFmVhPYpkV4Jlhli4h6BfN3h6M97Q+F8wZ8UetUua
         ZE3A==
X-Gm-Message-State: ANoB5plZi3PRDBO0o48ZC7Ehwg0yf5YP3+GOufRocAS+s6BACQp4kdtw
        /5oS9d0WFfKFPhCeCDqvNZm+HLDN1b2AoQldteZ5HUtvaxk=
X-Google-Smtp-Source: AA0mqf5VrTpLOj4ZlFDKaIXtnaXLgZ0CYm7CAAQQe4DXP0PzbRK8eD99DVN0IU9z/RBBDpyRyd9Mayz9bYXq1N47AjA=
X-Received: by 2002:a17:906:19d2:b0:78e:11ea:8528 with SMTP id
 h18-20020a17090619d200b0078e11ea8528mr1440243ejd.190.1668676778935; Thu, 17
 Nov 2022 01:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20221021172012.87954-1-sebastian.reichel@collabora.com>
In-Reply-To: <20221021172012.87954-1-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Nov 2022 10:19:27 +0100
Message-ID: <CACRpkdYKdTWAtW_dhCgfja4pNZqNh=ixZ0H36bpFj=x_3t2zXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: rockchip: further increase max
 amount of device functions
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
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

On Fri, Oct 21, 2022 at 7:20 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> Apparently RK3588 pinctrl has 13 different device functions, but dt-validate
> only checks for pin configuration being referenced so I did not notice.
>
> Fixes: ed1f77b78322 ("dt-bindings: pinctrl: rockchip: increase max amount of device functions")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Patch applied!

Yours,
Linus Walleij
