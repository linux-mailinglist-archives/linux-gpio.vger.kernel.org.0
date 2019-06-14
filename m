Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5ACC46B21
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 22:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfFNUlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 16:41:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44526 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbfFNUlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 16:41:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id r16so3810478wrl.11;
        Fri, 14 Jun 2019 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PhBFLtR+RLSKJI14k4b+jQmHTO5RvF7MzDB1Qhshvx8=;
        b=ftuQRUKpikD7n5QznlRZZbq7usgvYFQ416m1PrvUhUF538CYvlq/QK6jyoYtoNnWsw
         MRwyIFIyN0Y3TuLyMhcHl7ddX/Mr317fJl81I9DIRoQyMAvqv2koXhg8KvPaCKamqcP2
         aBYfT6gFSlBiErpkn2WxIEkWE9u61fa/Xj1JuQTCUumr5kg/c6CGk8jB2/7+H6lm0KSq
         gFzbDPjsWUmYvWO0TIAQB8z0lPZVQidOZewc3aC9N4zNbROYecw6BYG1XeOKhslZK3n8
         GzEZHoPZE/6oImTu6Wv8IXjBPv3PFREb9+AN/jYPurfug4+5/OSaN1zaqgC/jCFYMZBs
         /5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PhBFLtR+RLSKJI14k4b+jQmHTO5RvF7MzDB1Qhshvx8=;
        b=KDw6FLXKqtdasy+CSbtYvAeZfWJIYWfUVrRGe/HsZBnwVg+AKFWcNH8qF/4xXvk/oL
         JJ/VH3YJomTVo+lQYW9PWIfkGGtuJoTSPkhrsPP6fxZBOLRL8OugL+O+I9JlY7JqXC+a
         5M3ltPkF8Tc83xufMclMMSzzC9O3vI3pS1JrjHPulwOX7r8ZwtDwlaGOC/6iS7R77DSX
         RWstbnxY2CZ6lErU5mjaoIsqLZLzZF3GuAoa3rAz2zYlyYL3C3oS5Gc0HbhkUWZKeWin
         R07qbcU0z5WA+nDSAsjqV4lyF7Stym8bchttYB5EJniveEsWgCfBj3C5CxVYc7BNfFNu
         aY3Q==
X-Gm-Message-State: APjAAAVOU8eX06t4+o+2XUWTxCBfAO/NIWBfGHgqoHkJrNe1iRJe3sQ9
        dzCrZZaLc7bBJfx1yQ52kl0=
X-Google-Smtp-Source: APXvYqySesIUR8LqjdHWEANs0GRdseUo+3jR3YN1YK8cIoLD77upTGb9emt8vq0KuipvKZJ52rYjqA==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr1131305wrn.316.1560544876719;
        Fri, 14 Jun 2019 13:41:16 -0700 (PDT)
Received: from debian64.daheim (pD9E29824.dip0.t-ipconnect.de. [217.226.152.36])
        by smtp.gmail.com with ESMTPSA id v24sm3041197wmj.26.2019.06.14.13.41.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:41:15 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hbt0d-0008KE-8s; Fri, 14 Jun 2019 22:41:15 +0200
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
Date:   Fri, 14 Jun 2019 22:41:15 +0200
Message-ID: <1981742.H2rzviYcjI@debian64>
In-Reply-To: <1a00e8c8-d07c-3b02-8ea5-6d5f3e2c7b1a@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <4056907.DrFocau5Ix@debian64> <1a00e8c8-d07c-3b02-8ea5-6d5f3e2c7b1a@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wednesday, June 12, 2019 11:48:48 AM CEST Sricharan R wrote:
> Hi Christian,
> 
> On 6/10/2019 5:45 PM, Christian Lamparter wrote:
> > On Monday, June 10, 2019 12:09:56 PM CEST Sricharan R wrote:
> >> Hi Christian,
> >>
> >> On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> >>> On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
> >>>>
> >>>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> >>>> CP01 evaluation board.
> >>>>
> >>>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> >>>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> >>>>
> >>>> +       clocks {
> >>>> +               sleep_clk: sleep_clk {
> >>>> +                       compatible = "fixed-clock";
> >>>> +                       clock-frequency = <32000>;
> >>>> +                       #clock-cells = <0>;
> >>>> +               };
> >>>> +
> >>> Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> >>> on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> >>> From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> >>> declares them at 32000 Hz. Since you probably have access to the BOM and
> >>> datasheets. Can you please confirm what's the real clock frequency for
> >>> the IPQ6018.
> >>> (And maybe also for the sleep_clk of the IPQ4018 as well?).
> >>>
> >>
> >> What exactly is the issue that you faced ?
> >> Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.
> > 
> > We need just a confirmation.
> > 
> > Then again, Currently the qcom-ipq4019.dtsi is using 32768 Hz.
> > 
> > |		sleep_clk: sleep_clk {
> > |			compatible = "fixed-clock";
> > |			clock-frequency = <32768>;
> > |			#clock-cells = <0>;
> > |		};
> > 
> > <https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom-ipq4019.dtsi#L144>
> > 
> > Which makes sense, because all previous Qualcomm Atheros MIPS and the
> > future IPQ8072 SoCs have been either using or deriving a 32768 Hz clock.
> > 
> > For example: The AR9344 derives the clock from the 25MHz/40MHz external
> > oscillator. This is explained in "8.16.9 Derived RTC Clock (DERIVED_RTC_CLK)".
> > Which mentions that the "32KHz" clock interval is 30.5 usec / 30.48 usec
> > depending whenever the external reference crystal has 40MHz or 25MHz.
> > (1/30.5usec = 32.7868852 kilohertz!). The QCA9558 datasheet says the same
> > in "10.19.11 Derived RTC Clock". 
> > 
> > For IPQ8072: I point to the post by Sven Eckelmann on the OpenWrt ML:
> > <http://lists.infradead.org/pipermail/openwrt-devel/2019-May/017131.html>
> > "I was only able to verify for IPQ8072 that it had a 32.768 KHz
> > sleep clock." 
> > 
> > So this is pretty much "why there is an issue", it's confusing.
> > Is possible can you please look if there are (fixed) divisors values
> > listed in the documentation or the registers and bits that the values
> > are stored in? Because then we could just calculate it. 
> > 
> 
> Really sorry for the confusion. So looking little more, SLEEP_CLK is derived
> from an external 38.4MHZ crystal, it is 32.768 KHZ.
That's really valuable information to have. Thank you!

> Somehow the clk freq plan etc seems to mention them only as .032 MHZ and misses
> out. That means i will correct the patch for 32768 and probably the
> ipq8074.dtsi as well

Ok, there's one more issue that Paul found (at least with the IPQ4019),
https://patchwork.ozlabs.org/patch/1099482

it seems that the "sleep_clk" node in the qcom-ipq4019.dtsi is not used by
the gcc-ipq4019.c clk driver. this causes both wifi rtc_clks and the usb sleep
clks to dangle in the /sys/kernel/debug/clk/clk_summary (from a RT-AC58U)

   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
----------------------------------------------------------------------------------------
 xo                                       9            9    48000000          0 0
 [...]
 sleep_clk                                1            1       32768          0 0  
 gcc_wcss5g_rtc_clk                       1            1           0          0 0  
 gcc_wcss2g_rtc_clk                       1            1           0          0 0  
 gcc_usb3_sleep_clk                       1            1           0          0 0  
 gcc_usb2_sleep_clk                       1            1           0          0 0  

with his patch the /sys/kernel/debug/clk/clk_summary looks "better" 

(something like this:)

   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
----------------------------------------------------------------------------------------
 xo                                       9            9    48000000          0 0
 [...] 
 gcc_sleep_clk_src                        5            5       32000          0 0  
    gcc_wcss5g_rtc_clk                    1            1       32000          0 0  
    gcc_wcss2g_rtc_clk                    1            1       32000          0 0  
    gcc_usb3_sleep_clk                    1            1       32000          0 0  
    gcc_usb2_sleep_clk                    1            1       32000          0 0  

but judging from your comment "SLEEP_CLK is derived from an
external 38.4MHZ crystal" the gcc_sleep_clk_src / sleep_clk
should have xo as the parent. so the ideal output should be:

   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
----------------------------------------------------------------------------------------
 xo                                      10           10    48000000          0 0
 [...] 
    gcc_sleep_clk                         5            5       32768          0 0  
       gcc_wcss5g_rtc_clk                 1            1       32768          0 0  
       gcc_wcss2g_rtc_clk                 1            1       32768          0 0  
       gcc_usb3_sleep_clk                 1            1       32768          0 0  
       gcc_usb2_sleep_clk                 1            1       32768          0 0  

or am I missing/skipping over something important? 

Regards,
Christian



