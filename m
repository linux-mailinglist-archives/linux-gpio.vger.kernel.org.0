Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA847AE649
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 08:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjIZGzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 02:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjIZGzf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 02:55:35 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD83116
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 23:55:27 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59f7f46b326so41192437b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 23:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695711327; x=1696316127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHSkNGK03t5d9rG+f10qQXua3Wp3jtHQqzKshE119FY=;
        b=mypcl9B6J1Cs0PkTManL/as8PTIqMef9XvLWO6qrachl1UJwrEOOmiDcTEgdmWBsPm
         GU/y2uYvgxYhT8uIzrrKDCYp/I7vDpdh+8IxJP3e7nTVYv9thPH/xqvBCHY0kS57VUzA
         nkzu/kCi1EwnWBUY1pZ8BxEb9RhFzJt91g7QdfsTlrj4quIPIEIcC0jYnGNXjO3fbeB7
         HzbK94muvO7LOREahc6LuH7E8RSKvtufn1zxPi2uqJdFhL/ulRWkcC2BbQKBxdykxu47
         evSIAm/pcAdas0xnhIgsoK/M0WmekrUTMfh0N+zYNTuTNMSM8GyuWlYwf1d2ju7Iswie
         9tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695711327; x=1696316127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHSkNGK03t5d9rG+f10qQXua3Wp3jtHQqzKshE119FY=;
        b=FK9aDaQnIX3Ld+l3ucfrQhp0iDFtDnXBzR+9QdX2LPcGQ9tIND4Tz8+F6S8MvCRVjf
         GEF/iif2m7FHA++NkzREZQjRe6aaPgXbzQQ/20PwOtC6OgoWegsQbI04Q/KcOJdyjxGC
         +UUubCnmE7NPVf5tG/a8IWVSDdveHNS+7DC5CjAOb7HAr8p2i2Gee5HqTiZ1XFphPFop
         IgYl96+a3G5lii5AiHq5r5+KF93gxuT19edSFuDc1oaYCjVodFvBgb5DGiD5oNRWe5GR
         mc47HJIkJcKzzz58rgQKJsERv1Q4Cl//fuL7t9O6BVeIf/xuFw4WkQ0HRNn1cTk1zxKN
         cJQQ==
X-Gm-Message-State: AOJu0YzRej2s06sEFF+GoZGUkwZZNVyrZOTxGMtqVlYhpWuP6TzHD32p
        c94Gj4ys7DzSZ9URMJiOCT0V95bCRUgLd3HQRroONQ==
X-Google-Smtp-Source: AGHT+IHoO7TBziPA5htbsuH2VXUX9yGcO/aIOtLwPZZVCJAErZgDwgIkJ3nSHIbU3VSV/WI7WX5/gfB00KELiu+FW9A=
X-Received: by 2002:a81:4f92:0:b0:592:60e9:97cf with SMTP id
 d140-20020a814f92000000b0059260e997cfmr8225904ywb.12.1695711326765; Mon, 25
 Sep 2023 23:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230925212713.1975800-1-robh@kernel.org>
In-Reply-To: <20230925212713.1975800-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 08:55:09 +0200
Message-ID: <CACRpkdYSvgUsuMS+-=LXmCtH0bLF=EMguuvWwZ7VjUfnx+uyaQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing additionalProperties on
 child node schemas
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 25, 2023 at 11:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
