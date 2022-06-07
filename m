Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953C953B0F3
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 03:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbiFBBNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 21:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbiFBBNr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 21:13:47 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E8C28DC12
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 18:13:41 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w19-20020a9d6393000000b0060aeb359ca8so2454782otk.6
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 18:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Rm+nlWHmtK3hCgXCMXiJ7jm13/nhGeNK572RFA6RE68=;
        b=hz8L42GZ3MjrJT8zQvbU0Gjdz6YpJMtgCtl4dpGSC964xc2evT/CnKhIY1JHh4LWjp
         +LM+FyszkciMtKhP7Zam1U3H6f3j/LPYW7SODR25bKL72QneSpkZ1S1ScDH1mE8dYPw8
         w3fwww6eOnrGvo4dZ5RvKgo8dO+U0i5wU5/Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Rm+nlWHmtK3hCgXCMXiJ7jm13/nhGeNK572RFA6RE68=;
        b=mCSx25tmTV67WjrllvGUDUOtWWQDWOpOAYOAtmZEmvLAZHhtCEeQQy4NuB1WqyXoRW
         qh2R6dVjQTP8MU+BEjxEXHqWuoD3m0Pj7+bsRsqrf/mIitIhb5H95o4ymNFZ0j7IfZfm
         mNgbbrRYDP/a+s9W8wFGKC33hQh2MkfrAjiwaGak1hqpXnso8DhemGeaP5vEv5SAA3TG
         V5WvUr6PBar545OKyu84yJq01jPqhGrNYDHYoqVtNIFJGpSCoH8btLZJFkEJSxHuVpTQ
         FxnZT6ppjuVsvWSlIket6/bsHBwva/Zs+61yk/9Yy3Mny6l3hAcMAC0v/pkoVk9KwGTa
         qMgg==
X-Gm-Message-State: AOAM532cEdx5PrdcN7iqcEv4cf/5w7ikzStXSITZ99gigJV0DY8vQcCn
        r3W4upbxdm0nvMUNxvtYWBoA8azBnkSgs83buOcptg==
X-Google-Smtp-Source: ABdhPJy3LJfihXvgizpO9YOYl97KB0keIbmS8UgdFCl7rKBWuosnrAafB55EO8lfmUfiw5usvkSZMT4lK7UtFaOPPIg=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr1153603otl.77.1654132421005; Wed, 01
 Jun 2022 18:13:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jun 2022 18:13:40 -0700
MIME-Version: 1.0
In-Reply-To: <1654079415-26217-2-git-send-email-quic_srivasam@quicinc.com>
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com> <1654079415-26217-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 1 Jun 2022 18:13:40 -0700
Message-ID: <CAE-0n50nfwZPdSS7Vw9FiV+Shfn9-bX44hfLq5ey9DBsAy0y4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: sc7280: Add compatible
 string for adsp based platforms
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@quicinc.com, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-06-01 03:30:14)
> Add compatible string to support adsp enabled sc7280 platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> index d32ee32..53c2c59 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -17,7 +17,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: qcom,sc7280-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,sc7280-lpass-lpi-pinctrl
> +      - qcom,sc7280-lpass-adsp-lpi-pinctrl

Can you confirm that this is the same hardware (i.e. same reg property)
but just a different compatible string used to convey that the device is
using "adsp" mode or not? If so, this looks to be a common pattern for
the audio hardware here, where we have two "views" of the hardware, one
for adsp mode and one for not adsp mode. I guess the not adsp mode is
called "adsp bypass"?

Is that right? Why are we conveying this information via the compatible
string?
