Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B694729080
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjFIHBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjFIHBJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:01:09 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B61726AD
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:01:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bb2ffa1e235so1405176276.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686294066; x=1688886066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcmQrMMdS3jdVT7c4/E9jCpJX5xSmfuKaEf61OJrc0s=;
        b=w6g8VdrBXNCr55eww/tkDfFzgbugHuEIpAMJrISRTtjZyI0LsCN963pVlB4IL22CkY
         agl40c3PVq5KH2D1FFqdIxqmQ4Pzqz955NHrzBYgEBWoDFiyRvwXjXYBtJKWom7Gantp
         6WI2chAkG/H91wRtFa4PH8gWWB/iHF7QSr5/xRR7JVO8K+11CkjZPitYh2rN73NjKfJL
         MM05QfClwGKOrJjYq/hi4uRVbfGbuWRfS+kBozwIjwycoITKtvvDAnFB/qdRg6i2OAO6
         986Bl1Rk/O4dRF43SzPS5sHpvRN+KtkAnQg9zu4kr4PEw9RgUL0sU8Y5clZFd6S5Dlan
         43Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686294066; x=1688886066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcmQrMMdS3jdVT7c4/E9jCpJX5xSmfuKaEf61OJrc0s=;
        b=aEtLnuMMInVMDZ8wh9BPWwtN304NwX45g+b4iz52RRbtZRUFp0FA5DZWcKaFDcWkCu
         8nkbIWk4qpJ1mdNijaAKTZB3T4eL+kTkeFhDr6szvyFqAxm/sD7R368NBSUoP9xQX55e
         VT7xjmv5hWkYA4we/T213td0/OvaDxVBCEBNTjYLloTrgH2CaYXtRvpXHZPl3UdW1zGi
         s07tYeAyZSyMmY6slTXcuv8mep6FTXR+gcZHmaVKxHg+TbA9c0m86iaLFdoA4cvMOqQg
         dEOkV+9HC63Tazto6OA5XnvQdk87fbaoJ0vjtjY598dbQxccBW3KEg1cBPOJZHcqn1nb
         rTBQ==
X-Gm-Message-State: AC+VfDzeyBft4UMSn2LOH7G0JQufrOtq49/SzA1/BV9TOjrCv7DHgIdB
        h22SpdWdNi4oqx8Z5DTQbJrrEW97t/+UYMlXQRdOJQ==
X-Google-Smtp-Source: ACHHUZ7rTy6awtUQMyfPhaGWBaSda8vwZxqW0IXTdzwX+XwJhxx3v+1m03iYtsMU4EemfVrVkKFXLo0HEn+t03KFPz4=
X-Received: by 2002:a5b:20c:0:b0:bac:7294:4faf with SMTP id
 z12-20020a5b020c000000b00bac72944fafmr343225ybl.27.1686294066359; Fri, 09 Jun
 2023 00:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230608122152.3930377-1-quic_srichara@quicinc.com> <20230608122152.3930377-4-quic_srichara@quicinc.com>
In-Reply-To: <20230608122152.3930377-4-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:00:55 +0200
Message-ID: <CACRpkdbmtQXNH0xXyJKS0=nTETrKJVYmR2PxoERGM4e6qZqhyQ@mail.gmail.com>
Subject: Re: [v9 3/8] dt-bindings: pinctrl: qcom: Add support for ipq5018
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robimarko@gmail.com, krzysztof.kozlowski@linaro.org,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 8, 2023 at 2:23=E2=80=AFPM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:

> Add device tree binding Documentation details for ipq5018
> pinctrl driver.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Patch applied to the pinctrl tree for v6.5.

Yours,
Linus Walleij
