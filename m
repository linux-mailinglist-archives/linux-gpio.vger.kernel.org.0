Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675B1365B2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 22:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfFEUln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 16:41:43 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43902 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEUln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 16:41:43 -0400
Received: by mail-oi1-f195.google.com with SMTP id w79so10126004oif.10;
        Wed, 05 Jun 2019 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VG7hExm5hhRslGMHfIJDbnrnuG2niFw1Ee1+Wn5GINw=;
        b=dBzOZzCW4ZMvgQ3LJtEmT51cdQ5zsOJiWRWh8mUJ0hEeM/o9d0/v2qMz9OC9+YNoLO
         fYCn1qON5pcQzWzNd2Qj8813NNaGDHPHKUlVgdYgvol5CRaXNc85W4nmIGP8qacTm+0z
         Swz4vWodatwzbSCCralYISnr6/GCU9vFJ3GrgAKyFfpDW+eyAEqp/8YNZPePNEsjgptA
         w4ijnZz/Mudnmbenf/LS2/Pz3YEDchiXsfiDpfdoXN8wGxNh5co4Rgh7Vg2peDZBvb9S
         EdVHycKFzQ7e67ASS1asbM34MAdZVaMYs3OaGQUVUezKZsGK5gRFX7QHTKs/CdiPMBRg
         5Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VG7hExm5hhRslGMHfIJDbnrnuG2niFw1Ee1+Wn5GINw=;
        b=k8yKtvL43G9VUGQQlxLXWfaSu/68hg/dVd1SL678Hb5Hfn4RIoAARVYfLysRspbO3n
         z5wspc6NbOq3PARWnbNRhGMyEWuqppNJnavADeBhjr+0w/4YzQ3fEJZBE16O+E2YrSbD
         iCMDcHsTjZI9fl1LxTAl4pXMwolzJUUgjD0ZdkFqpnUhWvKHh5/rRhJ0osraLneU9ead
         T2lFWsy6BfUizytSXwYHpKkZtP9X2//+ELMSiib3FqC53ofo9t/rEJtYZepH2DoPdul+
         CS41z6mPPfmcsuyCErKarOnG5kvKBDisJxg6CFlv6NiYZL6yAFIT//TOCFeCv57ijsWN
         7Spw==
X-Gm-Message-State: APjAAAXQFakMKl34mvtGq/vmojPqiN8jSPBZZ/V0RqZgTwRYZFGK4LSc
        poTcFGkdb0abWVx3qhCpUaoyNTPG/2Ok2163mmE=
X-Google-Smtp-Source: APXvYqwUI4OmGQQSr+ze4cMgtR7ECcegoUlrEFr63QH1//OisEkmROYxAFX68SNh/ZVKr04GbZ1HEW11r5w3QDnkVME=
X-Received: by 2002:aca:3906:: with SMTP id g6mr9276536oia.106.1559767302061;
 Wed, 05 Jun 2019 13:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
From:   Christian Lamparter <chunkeey@gmail.com>
Date:   Wed, 5 Jun 2019 22:41:28 +0200
Message-ID: <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
>
> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> CP01 evaluation board.
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>
> +       clocks {
> +               sleep_clk: sleep_clk {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <32000>;
> +                       #clock-cells = <0>;
> +               };
> +
Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
declares them at 32000 Hz. Since you probably have access to the BOM and
datasheets. Can you please confirm what's the real clock frequency for
the IPQ6018.
(And maybe also for the sleep_clk of the IPQ4018 as well?).

Cheers,
Christian
