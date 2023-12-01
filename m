Return-Path: <linux-gpio+bounces-875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAF801422
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 21:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351BF1C20BB4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 20:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F24A56B80;
	Fri,  1 Dec 2023 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSFwR5W0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C9A198C
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 12:13:25 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d065be370aso5090065ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701461605; x=1702066405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=tSFwR5W0KZoLz2swN64EUPYq+bdUGsZvyEbT5ODipbl8cYs5fPPzZW/CSncEj4Cpe7
         twiKw0ekvf83+PQLw02wf92YHui8CVNwGm97jR22vVnSk0htpMxgIUoqTKV8KilDmENe
         QAjubZIIRUOirSxQNKLY6IcxunDGr9MzM8uCSl9zKW1ItKT0043Q/EYsyD4aU1LU9bvv
         yo/3gWBHG/TZKoj3HyOy1h0v+XcPcZ0xP9sLC6A6qsHefcEkrQqfWrp6We46xlrkfnVn
         NWSxANLTYEqwAXxSVGuBdywgqMLFbjW6pDEnJQ9n7SstLGzQyOwTS3SrRfgVCxk+wyB/
         CDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701461605; x=1702066405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=shTQJmqpbLJ3jeEJGzs0KUIk9sfByzijBTNpUyhPPG0OvUwN5g1FitI5Rr7F0aiswn
         b5ANXWR9yCW36xKNAMIB7ZHOM+wgQSdV90lNnY1glirIMG/FBP0FEk1u1tKKwDtmX3XO
         LMsw/98oDCa2fY1xrgQqAsvHW6uJOWBMy+FZi8Mm11ddz2hbV69AP7khGZ6704bhiuH9
         QoYk5RiUySc6Vjxoz+F2IuOpVB59mT/78N8mPuNrYAbn5UR9MJPS8Yp8AVtrsj+1yTzn
         SMMKOKgv+MEISdbjvusI8mxfJXyK3EocZ90Xu1XJzVBLRi7q+sNlBy/G+R2Mrh14pCnw
         mdEQ==
X-Gm-Message-State: AOJu0YzVrQRmPgUln/bfrkVYKJscRQOj0i0s1OSsdRiKvSa0ikKH5iZW
	Ib+pFAx30RsuXTwKrB5d8uQe4Nd+q0gV6HnmqNC5jg==
X-Google-Smtp-Source: AGHT+IHkEyBcFrICiGFLOM8wMi5B888ezZ7RSvNyP3OK3Rh9MsRoluODUxrTWHGQPO04o2OjahKipeMHCbUIGEDXEfY=
X-Received: by 2002:a17:902:efc1:b0:1cf:fc8f:3fb6 with SMTP id
 ja1-20020a170902efc100b001cffc8f3fb6mr76235plb.17.1701461604899; Fri, 01 Dec
 2023 12:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-5-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-5-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:13:13 -0600
Message-ID: <CAPLW+4nNuRXB8a6M0dmWhFZYkSu62M_nAW3aBeV5wfedVLkraw@mail.gmail.com>
Subject: Re: [PATCH v5 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-wdt" compatible to the dt-schema documentation.
>
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
>
> These WDT instances are controlled using different bits in PMU
> registers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..57468c2c5ece 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -17,6 +17,7 @@ description: |+
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wdt                      # for Google gs101
>        - samsung,s3c2410-wdt                   # for S3C2410
>        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and=
 Exynos4
>        - samsung,exynos5250-wdt                # for Exynos5250
> @@ -42,13 +43,14 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850)
> +      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850
> +      or Google gs101).
>
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gs101).
>
>  required:
>    - compatible
> @@ -64,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
> @@ -77,6 +80,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
>      then:
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

