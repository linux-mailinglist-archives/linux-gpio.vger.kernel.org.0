Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4666D20B3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 14:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbjCaMqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 08:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbjCaMqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 08:46:07 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827D71D2E9
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:45:46 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id m16so6884786ybk.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HKfBpYDui2jI8K5LgjSIY/OSJW/0mGd+VN1L2aUDv4=;
        b=q79CD/0L6HR/dRZEi3GQO7M4pFjsIkMivQYdySeQGayP236pXi2kThqDw2bg8lqn5q
         fiAvYKta5zzSlt4jOuJ8lYjqHzo1+wBa+7Fm3ENNUylPxE10MnLem48AluZP2JpUuxZ5
         S7HYmpZ4xJteNJlN3gKC3/XPBtbmR1MBbXu5ey8BK/7W52Ccwmo0fu+lN14bF0BXqjIw
         tpF9O7JyQ6r8wP1dgtNQTlvvcJxiEZH5bua2lkdauKjZ96m5GKL721tLrQ1eAKlQuyv5
         rw/Bw2z7sTZQGa9POtJ4Kkzr1IsVJwhKoKrUe8Op3j+YmYlzY+Hpgvz87/d+ADyTJnqf
         yIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HKfBpYDui2jI8K5LgjSIY/OSJW/0mGd+VN1L2aUDv4=;
        b=A7aBxWPf9hFydvjay008fI35wAf7oSKIzH3TROktUigIYD2h650xX/Mp10JHatrjUK
         CJ2WjEJab8begqs32V6zjhnV6eVyiy/Be94e2RiFRQvVbolP/tjOt9RSXpe9KYfVHONz
         K97Qg8u1+u6fZpPl6q0qOZThE8uj05v0kj2amPuz+ELYTrT+xs8ekVVGXyccnzPlzjvE
         9YkFAJuf6Lt2ix1zsnF0j6tHYBiGE0X80hYTqojJOPn+q6o+vJIshxblOZz68UeWRBRM
         P66G2ZG1iGGqgEFXJ/SIPQ9TmyQamhtgMw9j/G8uZomBufDihQWtlDEYstarmzi7ENsH
         fwqQ==
X-Gm-Message-State: AAQBX9ebTSmjlp8URxpV15xDvtVs7ey4IEyUqeC/m/oPtSJmPEtS4ehm
        oJFgOGyifLoWKUhAGYMPEFc+a3/kKSI1tG1Ul8W4Zw==
X-Google-Smtp-Source: AKy350bTpAaze35hjxiuAALTHZ3KSy715dUTYBm0bv9MuZgwP+tj8wMsO3D8vWDj94xprGIrO4VxcpeweKWQ8v5OpL8=
X-Received: by 2002:a05:6902:168d:b0:b26:47f3:6cb with SMTP id
 bx13-20020a056902168d00b00b2647f306cbmr14344149ybb.4.1680266745586; Fri, 31
 Mar 2023 05:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230330100550.2049687-1-peng.fan@oss.nxp.com> <20230330100550.2049687-2-peng.fan@oss.nxp.com>
In-Reply-To: <20230330100550.2049687-2-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 14:45:34 +0200
Message-ID: <CACRpkdY2wT-79dnLUdNSGbHE+bH-uc1QyDN0CrsoJju7LW6u_Q@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: gpio: vf610: update gpio-ranges
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Mar 30, 2023 at 12:00=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> And bounds for gpio-ranges to address dtbs_error.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V2:
>  Enlarge bounds, and still restrict as 1 for previous devices
>  Add A-b

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
