Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DDB7C60F2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 01:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbjJKXNm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 19:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbjJKXNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 19:13:41 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED04B7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:13:38 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-27cfb84432aso251714a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697066018; x=1697670818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=GPbQZJE9q9mKJ25cesAtcP7x0E7ZClY4Plh3b+GhSmZA7zRrisXrH87uAJLqONC/Pl
         8R/ogLAMAmQQb0aLK+Dgj0E3jt6NazJkBXJWYjX4DRakGTjWicTZM9T9KS8a59wm2QB7
         SCz6o5xcW8q5MrBUpo16ixjQhvth8Yu/B+wjbuIicHMP0PEKxYOtv7Tni0JILan+Nb73
         IOSmByv6t4z0YWz4/4YVYVwjL9TCfTEZy6ICsM5r9LpwZKpWLjMOezwhP5hPus1SgJlZ
         DmYAvJi7zSY9+qs/aDfZ8sL43XNhhRTS2B17760kfv28Vghy2u2Xexc3OBt/FE1mVeZs
         rcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066018; x=1697670818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=aM9g5f3ehQOVEANZYaP0cEDVTdbRUDJeJCEvQ6nNx5+/SeOA09f5rcsFQWrGXE/u7a
         jb6bZDSXIlSDq6jBBW83Vb2olbiPP/HA707BUdcR7AZQ5OaEGm/tYM9AP/iimITGUMYh
         qZHS1yZsQJ4VPhxhbml2oBNkCQ6qPnHCBUraCq+h8bLwRzxO39JA16T0rcgeR2w2VNEe
         nJc6m9wUWRhodRN4PpVs7jBRV19ZmNpC1Yp4kuXzVEnA8N+nqtZXvQDLLV6IaAe9I8br
         TKtbhu+dbHQFxDg8sW7jjG/ybVLtxir9k2yCliDBWLG5wRKB4J2pvrSzd3g8RRbqFk4h
         3Cbg==
X-Gm-Message-State: AOJu0Yw3KKdqwFk24f5tupgj3DkODu8JQ4oOs8w+noKnG4fFsiRMJt+j
        L9n2QSB3+1iRUpnclEh+TiOSlGPXpjXiJ1ol0PLowQ==
X-Google-Smtp-Source: AGHT+IEld7S7h6gZ3fWO8KAIshEdLEI80q2ynQn1SW+nlZmhOV1fXDdbKEzZtX6rH7IBM+FnyFZOxN8YxMRhPqYZWog=
X-Received: by 2002:a17:90b:3891:b0:274:862f:3439 with SMTP id
 mu17-20020a17090b389100b00274862f3439mr19558004pjb.13.1697066018140; Wed, 11
 Oct 2023 16:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-9-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-9-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:13:27 -0500
Message-ID: <CAPLW+4nMKtgdGrjijWpXOCxaYWN5sBVVw9boYk9UMmHLnV3pAA@mail.gmail.com>
Subject: Re: [PATCH v3 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 8bd88d5cbb11..6e807b1b4d8c 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - apple,s5l-uart
>            - axis,artpec8-uart
> +          - google,gs101-uart
>            - samsung,s3c2410-uart
>            - samsung,s3c2412-uart
>            - samsung,s3c2440-uart
> --
> 2.42.0.655.g421f12c284-goog
>
