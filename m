Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01EC6B8424
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 22:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjCMVnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 17:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCMVnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 17:43:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F3419C40
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:43:26 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j7so2700666ybg.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSd3V+HZ2T3mn2cPqXWrHfR5YkKZfdZAyYpCo4chbXU=;
        b=wNETqUCxQ2QTd0peBTohCpYEJ2IuKEYfhzChAAwi15Ax+cZ7Nu5/9on8O8dEN3/Yhk
         uUGfMvg+3ONZHcO34fS2YEBbMgnkk0EjwRwnZsdKpZoc5KuSgpvVSqF//mB1TCI7rcr4
         DHyrzg0Rc6r31JQtJXvJJR4kaM/Sb6kinPnzSv/iHCW5UCe6wbyk8dQIZB0PkpSMnWGe
         ttkmmIR2DJNzR+RoFcTUnKUx/ndmMrYASfV+2JBR/gqgzJDHaSw1/wb3/vHHmbOc5Moj
         v1D7GhXJa6ikrvJDzXnH1h0rYF3IQJnTCt4v6ikbPATQZBqEJ8YkTZNNhxRUOMTsjBRy
         T30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSd3V+HZ2T3mn2cPqXWrHfR5YkKZfdZAyYpCo4chbXU=;
        b=Fm81vCjH+z4bWSA933Qq1oWsCLKr5qcH3bPtU8U/uPRtA8ScjFdhtpG/YMuCMQcSDp
         0u/pE4gyyTleSB/rPDcBwIhLWZBJD0II2GAtJvPTwOwPWQd5EFLY0nDbns+TvXfxn5qB
         apblzTW7tOlYsxQnT+zIO1H3Vl5qEVYSKHKSqtjej4MiIkXkFs1MCtMsxXDR+dPdEXxS
         qxuPZYjsbaIyEUkWbfXmObgz5qw1gUyHdGWDHoNHMUmGIaY0R7Ixac17FOvgplH8ttZb
         HMSJU6AHyrSOMgYdIxbQostm+i/24+PWNdQhuq811AzyXoYZXip/LPrhxnfWX/q64xHD
         kL2w==
X-Gm-Message-State: AO0yUKUHmXjVacIl7AwhqUGu2oLGTctaXrdpzxDP+570QIIJ6RfNWti1
        FnfkRsnI+5wwRyddT3al1ntY50+3c+4hyvKQ/MbETA==
X-Google-Smtp-Source: AK7set/44tdYO4dx/yFdy6mWrlex/dEJSg8Dq1+hFA0Q9cUVadFi5fLDSwyepQRkDs4fZQ1h3nRg33KAEHniI/POZO0=
X-Received: by 2002:a5b:c7:0:b0:b3b:d433:b063 with SMTP id d7-20020a5b00c7000000b00b3bd433b063mr168215ybp.4.1678743806009;
 Mon, 13 Mar 2023 14:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230313161138.3598068-1-sean.anderson@seco.com> <20230313161138.3598068-4-sean.anderson@seco.com>
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 22:43:14 +0100
Message-ID: <CACRpkdan3xZPWazk5tS-i9uAvKB=UO3kt5WS0VALkwnUk6ckgg@mail.gmail.com>
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 13, 2023 at 5:12=E2=80=AFPM Sean Anderson <sean.anderson@seco.c=
om> wrote:

> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.

I think Bartosz will pick this as soon as the DT maintainers ACK it.

Yours,
Linus Walleij
