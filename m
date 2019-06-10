Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACF43B46B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 14:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389532AbfFJMPd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 08:15:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38128 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388866AbfFJMPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 08:15:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so8935076wrs.5;
        Mon, 10 Jun 2019 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TNg7dffhdY0k328udTWVO2CXIL9HjzaUVHvDgf+GtK4=;
        b=ZXLPQq+o6b0nHKPZK/M+Qxx+orok889VPYieNoCf6MJVzZ8VSDN1BzvcxpdKVntchY
         C1/sw4NDZP0TUhAMPNkYtDw6AwrsqcnbUmdn4dXvq912jSdsDC+vSyAme9UkMRIga+J3
         +GUHIdXkEjbWUNkxxNmHzZ3NCBqUeSEEeOtOsvnmfAsu23ey6WbVZSOhgpI+KOiGMzzn
         fLpyI+p4nx5dS9N6aPzCZe0vE2r5t440mvO4FK7d60UbD6c8Eq2DPERRqehWbpfAeAHk
         nt+1PpKw+OkF6i+jWmSEygcr4LEoAlH4aEdP/Oj15O7GQrB108NI0bjYSf9znu0e+Spn
         ZWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TNg7dffhdY0k328udTWVO2CXIL9HjzaUVHvDgf+GtK4=;
        b=EdEbb2wG/+eo/ARWsgwlLnxMZVRN2i3c9V+s8olaU3J+cJXNhC+TR+kqpIkSfP48Wf
         blsoYc23qBzrmOTPgQ62fV8mUQSCbacvcS6vFYUycH7Gws6qPoYXb96xdVZOhwuYfRDK
         YTpTB0UdrVeG4WjW6ibMuyg/cyv9yA+COxNDOhUsy1Cgws8qG2DipgW45ducDBC9nY5v
         IuW0MlhVvKOMSAbHDCPOyOxOmmswLrLFGVaKFrofhqpXvPp2tjndaTuuNA5k2Dx7ddSF
         EwVKz4c8aL07AQTk145K6lG5UPYwa1ZplrVlTGxap/o7Si+lj33YnQPdTh8QBs82en8s
         MfGQ==
X-Gm-Message-State: APjAAAVo3Z9TaYZLe84vnKOQe6Xa2QNWWBgcmWVByIoF5Q2s0a2ILaMv
        xSBbT0YHUrb2Gj6lB1LsdQXdbzRD91s=
X-Google-Smtp-Source: APXvYqzlQSAtl9/8yztiGR6lp/ce64UZfTWo4eBT3hz9ZP/qGRp2sOkCeft5kX5JxyJgCWLCirAzxQ==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr4158638wrr.56.1560168930388;
        Mon, 10 Jun 2019 05:15:30 -0700 (PDT)
Received: from debian64.daheim (pD9E29896.dip0.t-ipconnect.de. [217.226.152.150])
        by smtp.gmail.com with ESMTPSA id v67sm11434321wme.24.2019.06.10.05.15.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 05:15:29 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1haJCy-0004Co-5N; Mon, 10 Jun 2019 14:15:28 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date:   Mon, 10 Jun 2019 14:15:28 +0200
Message-ID: <4056907.DrFocau5Ix@debian64>
In-Reply-To: <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com> <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Monday, June 10, 2019 12:09:56 PM CEST Sricharan R wrote:
> Hi Christian,
> 
> On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> > On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
> >>
> >> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> >> CP01 evaluation board.
> >>
> >> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> >>
> >> +       clocks {
> >> +               sleep_clk: sleep_clk {
> >> +                       compatible = "fixed-clock";
> >> +                       clock-frequency = <32000>;
> >> +                       #clock-cells = <0>;
> >> +               };
> >> +
> > Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> > on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> > From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> > declares them at 32000 Hz. Since you probably have access to the BOM and
> > datasheets. Can you please confirm what's the real clock frequency for
> > the IPQ6018.
> > (And maybe also for the sleep_clk of the IPQ4018 as well?).
> > 
> 
> What exactly is the issue that you faced ?
> Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.

We need just a confirmation.

Then again, Currently the qcom-ipq4019.dtsi is using 32768 Hz.

|		sleep_clk: sleep_clk {
|			compatible = "fixed-clock";
|			clock-frequency = <32768>;
|			#clock-cells = <0>;
|		};

<https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom-ipq4019.dtsi#L144>

Which makes sense, because all previous Qualcomm Atheros MIPS and the
future IPQ8072 SoCs have been either using or deriving a 32768 Hz clock.

For example: The AR9344 derives the clock from the 25MHz/40MHz external
oscillator. This is explained in "8.16.9 Derived RTC Clock (DERIVED_RTC_CLK)".
Which mentions that the "32KHz" clock interval is 30.5 usec / 30.48 usec
depending whenever the external reference crystal has 40MHz or 25MHz.
(1/30.5usec = 32.7868852 kilohertz!). The QCA9558 datasheet says the same
in "10.19.11 Derived RTC Clock". 

For IPQ8072: I point to the post by Sven Eckelmann on the OpenWrt ML:
<http://lists.infradead.org/pipermail/openwrt-devel/2019-May/017131.html>
"I was only able to verify for IPQ8072 that it had a 32.768 KHz
sleep clock." 

So this is pretty much "why there is an issue", it's confusing.
Is possible can you please look if there are (fixed) divisors values
listed in the documentation or the registers and bits that the values
are stored in? Because then we could just calculate it. 

Regards,
Christian


