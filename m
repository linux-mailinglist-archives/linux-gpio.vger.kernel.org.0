Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C5B735734
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjFSMsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 08:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjFSMso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 08:48:44 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCCC91
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:48:42 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-45739737afcso702379e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687178921; x=1689770921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/AjXyhuwgoNXiF0++Wk1vrY6btEb1ynLaiD8sz29O8=;
        b=B2G1W8R9ryOXQdtAFd8KcJqjIH8HMerk6q0Lv3ji6kKcqZ7e4AkdvCXd3mFojrCiWv
         +S0MqOiSdBxdEMahu/MeGCR6jDhn4RoRfai1Vsejstr+vnw9wFp/vJTDZN+CZGvFFK1Z
         CrmnCFItRT63Lr4ajPVin/QoqOxt/oJJMslPncliMQCCagnLTxo+g4qj85w1QoUhB9pZ
         KW6otalMDJLMLxyYid3SeH+Ry9pm+vfOM0zlM+K/fC6d0szs7WVoDTkF4Sq69mkJvMOB
         UJvIZAScWE02uBXPL6rOp3Vrg5Bl68oSggDt70MTwFe/DlAXWqIz3e6pAx3ZT+os0wBK
         i/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687178921; x=1689770921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/AjXyhuwgoNXiF0++Wk1vrY6btEb1ynLaiD8sz29O8=;
        b=GTR7A/adVL1y4FI4+OokZEtTZ/KILVALcvEhPsseiQTPohsquvaC48S+OeUGR3iuPj
         aL0nvqFItZQyxlJb2a+yzH1+vRNAnJMRJglEb52LviTcyWNqa9S4Y8ULLBTOvFkw4z5Y
         AT+cpzwQ6oWXF5Q5yG64efnr+PnhKgZ72OZrCz+lcBmDHFH3dbzgOzgXDfV2E9wDRb8m
         +Kyfof+BlE4oh+BQ5oHm1yiuNqKBMRSi1Nus0BrT0lyIuyZe0N7Q/2i7i+vN7K4AvkC6
         yIjULgbRgWQWBa9Ml7RqBTUFD0qqOhXiJwpYzfvQkhNIuNGjWrayQUGdW4Gnfn8IUijF
         DFwA==
X-Gm-Message-State: AC+VfDx5xZ43NPhN1cpwGwvqkGSqSh7J80mpEy9F6k7ofi3pHkl6fG4Z
        38fefcqR9nBrIfVTQYNHPiubSenTXjhyv0gr455eeQ==
X-Google-Smtp-Source: ACHHUZ7JKpTnuTOb4+fedtmThaVXgxK5mM9ub5S04uBN5zlxpetYTE813z/vuxwIQJOYfRUooMjQoVmeziA5e5VBZ6A=
X-Received: by 2002:a1f:5ecd:0:b0:46e:7c85:acb0 with SMTP id
 s196-20020a1f5ecd000000b0046e7c85acb0mr1086838vkb.14.1687178921454; Mon, 19
 Jun 2023 05:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230619063907.128561-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230619063907.128561-1-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 14:48:30 +0200
Message-ID: <CAMRc=Mf21-w93QC1B3YEfOxmLKwiPceGMZ+j8nR1-J_Dib=eAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 19, 2023 at 8:39=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Allow parsing GPIO controller children nodes with GPIO hogs.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Narrow the pattern
> * Remove properties covered by generic dt-schema
>
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index d2c39dba56add..7c2d152e86170 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -61,6 +61,13 @@ properties:
>    gpio-ranges:
>      maxItems: 1
>
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  required:
>    - compatible
>    - reg
> --
> 2.34.1
>

Applied, thanks!

Bart
