Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4556D2019
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjCaMXR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 08:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjCaMXN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:23:13 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5F120314
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:22:48 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5445009c26bso411400947b3.8
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680265365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2owAB3QIh/fJmsl2/RdqrmdgMBNDGNEWdkKSHrJDCNo=;
        b=AHL3dXDDbBLaLWU/gvqB57G6n+zZ5P0WuNtY7UVz7hYQg1Dyt4lEIR9ezSGfR3YgH2
         l7gRTIFuVsxhmhcvoK6nuBb4rcjcEaz70KC485Awzk6urblUULbmP1V6FCuxXJw2c9NM
         IaFa7XSp3NK7BuzOpxGYBfO8pHG+eqFODg0R9nNLi7KTASWGm68SB7iiirBlFHfhCOI1
         P4l+FiMUs026/Rq/pFvBBm3mEx6ylsqBOdbUQyiJjM+yEz0uVNRm9QRR1q/d6SMciH/A
         Wy7QL4OddVTtYV1qa58u4QSOGYDQKpBA6j2XX7q+beXqVTX6XCRnnUI03BU5cG1EhBaB
         Tu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2owAB3QIh/fJmsl2/RdqrmdgMBNDGNEWdkKSHrJDCNo=;
        b=JrbziMn9rQsv0eyYa7M29bpCkOCdUR7c5h3FZsVW5/Qz6P5JIaP7PhS/aq9dra/77+
         R3cl/3sup1yatyzYOzaDMeo64zApZnNgPoQOJeumBBcVS+cQSAt1KOtdC6mpiNi5OfOg
         A0KnZMTDH4ufUo50PMwjfp/0SBtFUqU5skwWNzmLHFmyFj2E0a055kRvmyvOYF63gCHI
         7HQpof/HHw36JeYfwPXd0Fu6d674KCxmb59EMqRJOHQ9yGFxa8umeBFM5dNZ7EB/SuOV
         4UbFDj328NqWAEkWkauZhx+WiwXJ5NFg/cdQbQKPz4VNM+CBo+v7E82Jg5QNh4V+4JXo
         j9Tg==
X-Gm-Message-State: AAQBX9cgNBTE7T0mmr1vTpAXsWsX/4Fg+pTthKvScxq9xyYkgkhhZTOW
        ouXXIQzJqFviNSzmgPojIOhInHZJHKGY9xI/qWIxNQ==
X-Google-Smtp-Source: AKy350Y75Hrriomm/pGgLwtjhceJ4FaC1JCezQW32b0yP9veCHMLvw9+T4Ah1HaSl9byrDxUB04ZhK9nb9gkqXcBrsI=
X-Received: by 2002:a81:4426:0:b0:53d:2772:65d with SMTP id
 r38-20020a814426000000b0053d2772065dmr13513308ywa.9.1680265365023; Fri, 31
 Mar 2023 05:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230328052912.1957000-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230328052912.1957000-1-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:22:33 +0200
Message-ID: <CACRpkdbx_4CqMokdKf8Zs0BrBz6iEZrwL_8c7nrP7yqxM46A1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: fsl-imx-gpio: update gpio-ranges
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
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

On Tue, Mar 28, 2023 at 7:24=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> one is not enough for i.MX8, so enlarge it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Makes sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
