Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A6B6D2097
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjCaMlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 08:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjCaMlZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:41:25 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CEF1EFD6
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:41:01 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-545e907790fso296463057b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRZsZGRSBUttBDdfhkXu+iVZ6M0OXbmk7WZu3FuQ8Jg=;
        b=bHKkubKvpHVbMRxx1j06pm8nus5PdJq7l9RkcGq5ExEKZR2/osMq1YWgwQkIL7fmLJ
         kW26fA9F5tE+XNhM+3jMnlOpQ6srJDId+r356SPXqg8V/i/VdF0o1U1BtiJIqyt1nHYM
         yOqUFFIl3GrWuDrpMHpLAtnTl1AYwkFAd1roVvIiTVzsbcrj6TDqpvmmeT19fCx4BxSG
         iXbP5u5VVhqd6lajF32hLW6wgK832F0brgd+B0fgfM5k7Vu2O5DTAJx7QcQ2vS6FeSB2
         MlJcD2OcrhueOEOgRzI+GbeQmlZ1zMCGdB2SiLD3/9u0iHFfvh/JNniF89XFiqsW8Llz
         5c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRZsZGRSBUttBDdfhkXu+iVZ6M0OXbmk7WZu3FuQ8Jg=;
        b=VtM2aDCDFsDjzpj4DnlHYirN8I01BUcMHyttpzo9MyJTp2kJXF+8QdsE41UpMrU5OU
         sbJKnJ/UXazpkTUTSSN+DWkuJ2oMjA6SKg5Q4Gax2nguNpyTqp7eNfEISvjuor0pUWmZ
         4tsDYdafDwvaqaaVLVYI6xtMilCNVpbvGdvXhNMY+yvbR1iIP7P2htxTvwjQ2q6+ePdQ
         BhCd90gJ/OUV+DHz8j09bCkegeqBALuVceAb4Ig/W84mXuoPic3EIi/yXajPKl6/yDd6
         wMqDe7Gxo46OUMoFZ8KJ2bjLSazMF8SsZH6LU2rb2IAFbp/2CuaM/CUAbzd2vTCrc0dn
         K0Dw==
X-Gm-Message-State: AAQBX9dzbMQJrZlxWMSE9g8r16g1RXdTyZjdBXfBeXm3/0rL8s82QcY9
        4LdvsVOFN4Ga4Bn7/e7GVR7Yxsxwm7UgbHdPaCd5FcBBY/oyLjnvgcg=
X-Google-Smtp-Source: AKy350YEjxPDjbwYwsSFrCU0uQJYztKPQjzwuEM1U/PujPKxlNAw3tq/F6qGz4Sr87IntJwwOldydyNsV49f1QjtAPQ=
X-Received: by 2002:a81:d007:0:b0:546:81f:a89e with SMTP id
 v7-20020a81d007000000b00546081fa89emr7575796ywi.9.1680266460814; Fri, 31 Mar
 2023 05:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230330212225.10214-1-olek2@wp.pl>
In-Reply-To: <20230330212225.10214-1-olek2@wp.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:40:49 +0200
Message-ID: <CACRpkdZo4VKixBM9XLsiUVp+wcqQ-irY9DjNCSNeh4CfUYVWwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: xway: drop the deprecated compatible strings
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 30, 2023 at 11:22=E2=80=AFPM Aleksander Jan Bajkowski <olek2@wp=
.pl> wrote:

> This code are marked as deprecated since kernel 4.5[1]. Downstream OpenWR=
T
> and upstream switched to the new string compatible 7 years ago. The old
> compatible strings can safely be dropped.
>
> [1] commit be14811c03cf ("pinctrl/lantiq: introduce new dedicated devicet=
ree bindings")
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Thanks! Patches applied.

Would you be interested in listing yourself as maintainer for the XWAY
driver in the MAINTAINERS file?

If you (or someone else) has spare cycles I would be delighted if you could
look into converting the bindings into YAML.

Yours,
Linus Walleij
