Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF30854C9FB
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354243AbiFONjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354343AbiFONjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:39:46 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F8937008
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:39:44 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id h27so20590411ybj.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hd2Q7z9uWW7dB0gy7lxuAP2GK3dj82/CD4CwzUHIa4U=;
        b=rPkstlrZwE646fy1fdO0Vu8lKssadxnY/cq1nHk/4Drjaed9Hyl/FzAV97Qw6CvIOZ
         ukuClPhw1cqKIxSdjV+m1grXdgBQgi+gLNnMZ7HqXd0JJeUPu6JXC1gVuTwBjilsC25M
         046vbKX3N0sgQ1TA9dwRUme8KeoU1PUtU8IECplVwcTFYaJIgO/VSyyVD4xWFk4Afnl8
         7o7tzI6DEzz4TuN43YTXQPTuXTvo1omNKgiz4HSoz26G4MBgCF0gubbzX3NnlnAvpfqL
         cKHyVg2yoBW8qKIxE+KQiKn3UdKz47hR2QBV3lkKhJTUCVPlbM/fFn9AGhFZh6f1wIyx
         o+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hd2Q7z9uWW7dB0gy7lxuAP2GK3dj82/CD4CwzUHIa4U=;
        b=Yse/2AEVHsfSKUYOUvfYqkot8d7q50bifMJQMzRoYC4dLfEK1DtOn2YOTYnkRHbCPq
         bkSMC+ajGad8frOLauwdWhev+5sCxggyljkhRDy68cfXb1AeF3XMIXRAIRUMIMBzS2MQ
         mnUVuV3Tq04Zi6c8AL0MDLBFnWEXsCvv33+uJEJXqJgznWY4aAf3qlUxugbSb8E3jSwz
         30bFTSWp712tLPNKCJEMSf6NmzM++6ra15obsO907qkWm3Lqpn+lP7i31+YmAUq2ycAo
         t9JS2eqWI/nA12WiRon3HzZ2S/kxjcZ84XB+AKY195nXm8C0fOqW78lElXVIosW+4COb
         XCzA==
X-Gm-Message-State: AJIora8mKUjHtVSq7ppnUdAcnm6p2Bcd4gtY8jDSBjH2jKaYnpA9K828
        QXNb1obaoTGKUCk35lYsxnCduHgqbehuDCkp0izdIQ==
X-Google-Smtp-Source: AGRyM1tmMuIlqeQp7nqh2Mjy2GzaCsjE7hVrrxP2n3u/EC5oobfK92wjpSUNebv+96g3JYgFgZ/eKGfNefJpR0XngmY=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr10062220ybs.626.1655300383762; Wed, 15
 Jun 2022 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
 <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com> <a2b7de25-55a4-7d31-2787-be6d0ccf9500@quicinc.com>
In-Reply-To: <a2b7de25-55a4-7d31-2787-be6d0ccf9500@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:39:32 +0200
Message-ID: <CACRpkdayb3Rx=jxdxW4rZxg6efEyf_Nzv1rgL0t8pLLJd-NsiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant
 data for adsp based targets
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 3, 2022 at 1:03 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> >> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
> >>                 .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> >>                 .data = &sc7280_lpi_data,
> >>          },
> >> +       {
> >> +               .compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> >> +               .data = &sc7280_adsp_lpi_data,
> >> +       },
> > Drop this and instead add some code in the probe()
> > in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> > lines:
> >
> > if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
> > of_property_read_bool(np, "qcom,adsp-mode))
> >       data = &sc7280_adsp_lpi_data;
>
> Here, only diff between ADSP and ADSP bypass variant dats is
> "is_clk_optional" field.
>
> So we can keep something like this. Kindly suggest, if it's not making
> sense.
>
> if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
> of_property_read_bool(np, "qcom,adsp-mode))
>       data->is_clk_optional = false;

Looks good to me!

Yours,
Linus Walleij
