Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AF57AFB75
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 08:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjI0G4i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 02:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjI0G4h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 02:56:37 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2360FA3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 23:56:37 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7a84609acc6so4047609241.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 23:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695797796; x=1696402596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogHgKYOg4Pr/48DpWW/k5DqXjmMzTHrz2VavoAqChL0=;
        b=VtlD3vjw3b9qsIlToPFug2iap18BxG3lbLhkcfkI9y4ecd8E+VHNI7WdcmruujfaZU
         bZHs02deWDae8FNoT8GAJ8BmgyOWvjs9r585LO5qlekLupo0Bf3O5CPRUdu/i3qNlzgb
         sGVG18XF40qbag2saOy+wRLX+h8WPzPCx+q6nXLyZ7eBoFTX+Bzf0AMnPcaQnSQjuuKX
         xIB7juVwxW+azV1Mv7IRjbsFffzU462iZOru0OKdfEWwrgVbWMjviJdNwc8T/ROCnq/h
         qIcHwoiuzpuLOq2VEejXivx2/LrvGx2l08u70s4FUfdKNpdvh6C2c0uPwUg9T/rpvLqs
         cOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695797796; x=1696402596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogHgKYOg4Pr/48DpWW/k5DqXjmMzTHrz2VavoAqChL0=;
        b=iXoByRdTp28osK0z+XOXH0Lo9vXY7SlSNshSqhWHJAuIZrBkquEnANLgboqeQCkijV
         FNfeAXp3n/MJ5ZOC6dsf9e77koyGRIrpbRiRFs1jZ3aSkM4Q+zxz3Vl3SdJJcskMQUmA
         yn5yFovblZ0c9yRfyCVK/me7oqJIqbhx28pcaEG38UVqz4rhMUJn01ZsPIrM3+pfm1aN
         bbS7NFglFnY+AUG0+mhlekugLEDQQ6PKvg46cl1LjlSiriQOSg0mW867PfLP+8W8U3+C
         eSVIUIthcSdywPati21JtBVMEcGheVCDkZ2Xxn9stbeJVLeA+O/tm4n1PNvPZbv/67kl
         ht0g==
X-Gm-Message-State: AOJu0Yw0a/idWuxPv6ZvTVvqMHBqV2CCP4PUFmwlm88fVI88VbsUpNzW
        YWHZGDvvIQulgmDN1vP4k1qms3ST514XlWcdS99OtA==
X-Google-Smtp-Source: AGHT+IEu7l+qv/EzFktz29NbLQ8Mjiny3AVF2fHHy3dxJi8oJsXwR/qzlMXaz4XRHFg37LF+Nq2tqw4MF6xZYwKTDJo=
X-Received: by 2002:a67:eb16:0:b0:452:773c:e0a6 with SMTP id
 a22-20020a67eb16000000b00452773ce0a6mr1149906vso.9.1695797796250; Tue, 26 Sep
 2023 23:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org> <20230923-ixp4xx-gpio-clocks-v3-1-66f8fe4e7f15@linaro.org>
In-Reply-To: <20230923-ixp4xx-gpio-clocks-v3-1-66f8fe4e7f15@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 08:56:25 +0200
Message-ID: <CAMRc=Mdk783GGe8-9__sNigr8kMedmLO1xtqtsbK2y=RMFJ4nA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Rewrite IXP4xx GPIO bindings in schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 23, 2023 at 6:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> This rewrites the IXP4xx GPIO bindings to use YAML schema,
> and adds two new properties to enable fixed clock output on
> pins 14 and 15.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

I queued this, no need to resend it with the next respin of patch 2/2.

Bart
