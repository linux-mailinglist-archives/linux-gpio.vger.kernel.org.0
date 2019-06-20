Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFB34D235
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 17:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfFTPc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 11:32:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43906 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfFTPc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 11:32:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so3471253wru.10;
        Thu, 20 Jun 2019 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=twKREVP4dM76TlVVsHi0mp9knkKfShom6a8O1rWrEqA=;
        b=h3I2j4ciufcpKsQ5gfJM/DTpOBVP9ObrBX99kiBPaZ3Mfqh40mklLdWMeGl9lg2mIL
         sKfcEyRUOXUMxrXO37Z5miyEthTdi0anVI8MIAfOv16cWbo+89vGWTBivfwhb/NlK8z/
         KlklbFZfP1n3aVJqPFP1HMpotaneYBS6wCEs3jJ7wt5U5PSPl5p4SDdgG9U6eNJcjMru
         +CNoYQ3pRBHs/rFR+tSpwZAa8yB5IgiZVJcL5ntVJTY4M06nJ1SHTbFyZ/e/VYbJHCwy
         JxNU9Dah4QdXuKEaLlE6tjzzifk6aGOgs+PIiLcedS2+fE1gBEY9npPqmQ4X13uS01Wt
         9nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twKREVP4dM76TlVVsHi0mp9knkKfShom6a8O1rWrEqA=;
        b=MoHuKZ6m6P6XVqXDunkjwFE0G0h0NcRnl9JQYnsQc9MB/6ro3Ko9AQCwWRz8tlS5Ds
         +9P56fDcnHa5IhZKj/rvO+zZcHK+pA2Nps3ggJMObohIMTwlLX6DdK4yV+HxtfxWNhFd
         PUipVY34UG/cibSu9cl3LJKbyTO5EUPOTwYFdha9NK4CQZfeLcry70OXx+m5IjdbxhK5
         aIHGZPpqyh+JuejiqB3n60tazQil3hygF1kr8WktuPLan8m/q+f3N13fc+xDu1mgKhPM
         XnV+m/LYiPsUErr3Pywe/5lx8twXj2CjHAWNShef+mfPgWWjYdPfTbVtA/QZhiKI/e+7
         zf/w==
X-Gm-Message-State: APjAAAU6Fn499kLjCFDacO84RNL29snJlHfGp67mZmwFZZGjr0yOqGRH
        1kgDCqEpIoGAHEo8U0Iso0Q=
X-Google-Smtp-Source: APXvYqxezO6uB6L4KgkL7Xs0u+cI6dkJWDdisTd5axsPvkukVNXGFDtFUmm2ifdZ4GWp24gRMXMJJQ==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr14572739wrw.231.1561044742105;
        Thu, 20 Jun 2019 08:32:22 -0700 (PDT)
Received: from debian64.daheim (pD9E29A96.dip0.t-ipconnect.de. [217.226.154.150])
        by smtp.gmail.com with ESMTPSA id w23sm6218936wmi.45.2019.06.20.08.32.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 08:32:20 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hdz2y-0003SE-6i; Thu, 20 Jun 2019 17:32:20 +0200
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
Date:   Thu, 20 Jun 2019 17:32:20 +0200
Message-ID: <2600627.FlAEz51UtF@debian64>
In-Reply-To: <96fd8992-e333-6b3b-15c0-2845984120aa@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <1981742.H2rzviYcjI@debian64> <96fd8992-e333-6b3b-15c0-2845984120aa@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Sricharan,

On Wednesday, June 19, 2019 4:42:11 PM CEST Sricharan R wrote:
> On 6/15/2019 2:11 AM, Christian Lamparter wrote:
> > On Wednesday, June 12, 2019 11:48:48 AM CEST Sricharan R wrote:
> >> Hi Christian,
> >>
> >> On 6/10/2019 5:45 PM, Christian Lamparter wrote:
> >>> On Monday, June 10, 2019 12:09:56 PM CEST Sricharan R wrote:
> >>>> Hi Christian,
> >>>>
> >>>> On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> >>>>> On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
> >>>>>>
> >>>>>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> >>>>>> CP01 evaluation board.
> >>>>>>
> >>>>>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> >>>>>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >>>>>> --- /dev/null
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> >>>>>>
> >>>>>> +       clocks {
> >>>>>> +               sleep_clk: sleep_clk {
> >>>>>> +                       compatible = "fixed-clock";
> >>>>>> +                       clock-frequency = <32000>;
> >>>>>> +                       #clock-cells = <0>;
> >>>>>> +               };
> >>>>>> +
> >>>>> Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> >>>>> on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> >>>>> From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> >>>>> declares them at 32000 Hz. Since you probably have access to the BOM and
> >>>>> datasheets. Can you please confirm what's the real clock frequency for
> >>>>> the IPQ6018.
> >>>>> (And maybe also for the sleep_clk of the IPQ4018 as well?).
> >>>>>
> >>>>
> >>>> What exactly is the issue that you faced ?
> >>>> Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.
> >>>
> >>> We need just a confirmation.
> >>>
> >>> Then again, Currently the qcom-ipq4019.dtsi is using 32768 Hz.
> >>>
> >>> |		sleep_clk: sleep_clk {
> >>> |			compatible = "fixed-clock";
> >>> |			clock-frequency = <32768>;
> >>> |			#clock-cells = <0>;
> >>> |		};
> >>>
> >>> <https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom-ipq4019.dtsi#L144>
> >>>
> >>> Which makes sense, because all previous Qualcomm Atheros MIPS and the
> >>> future IPQ8072 SoCs have been either using or deriving a 32768 Hz clock.
> >>>
> >>> For example: The AR9344 derives the clock from the 25MHz/40MHz external
> >>> oscillator. This is explained in "8.16.9 Derived RTC Clock (DERIVED_RTC_CLK)".
> >>> Which mentions that the "32KHz" clock interval is 30.5 usec / 30.48 usec
> >>> depending whenever the external reference crystal has 40MHz or 25MHz.
> >>> (1/30.5usec = 32.7868852 kilohertz!). The QCA9558 datasheet says the same
> >>> in "10.19.11 Derived RTC Clock". 
> >>>
> >>> For IPQ8072: I point to the post by Sven Eckelmann on the OpenWrt ML:
> >>> <http://lists.infradead.org/pipermail/openwrt-devel/2019-May/017131.html>
> >>> "I was only able to verify for IPQ8072 that it had a 32.768 KHz
> >>> sleep clock." 
> >>>
> >>> So this is pretty much "why there is an issue", it's confusing.
> >>> Is possible can you please look if there are (fixed) divisors values
> >>> listed in the documentation or the registers and bits that the values
> >>> are stored in? Because then we could just calculate it. 
> >>>
> >>
> >> Really sorry for the confusion. So looking little more, SLEEP_CLK is derived
> >> from an external 38.4MHZ crystal, it is 32.768 KHZ.
> > That's really valuable information to have. Thank you!
> > 
> >> Somehow the clk freq plan etc seems to mention them only as .032 MHZ and misses
> >> out. That means i will correct the patch for 32768 and probably the
> >> ipq8074.dtsi as well
> > 
> > Ok, there's one more issue that Paul found (at least with the IPQ4019),
> > https://patchwork.ozlabs.org/patch/1099482
> > 
> > it seems that the "sleep_clk" node in the qcom-ipq4019.dtsi is not used by
> > the gcc-ipq4019.c clk driver. this causes both wifi rtc_clks and the usb sleep
> > clks to dangle in the /sys/kernel/debug/clk/clk_summary (from a RT-AC58U)
> > 
> >    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
> > ----------------------------------------------------------------------------------------
> >  xo                                       9            9    48000000          0 0
> >  [...]
> >  sleep_clk                                1            1       32768          0 0  
> >  gcc_wcss5g_rtc_clk                       1            1           0          0 0  
> >  gcc_wcss2g_rtc_clk                       1            1           0          0 0  
> >  gcc_usb3_sleep_clk                       1            1           0          0 0  
> >  gcc_usb2_sleep_clk                       1            1           0          0 0  
> > 
> > with his patch the /sys/kernel/debug/clk/clk_summary looks "better" 
> > 
> > (something like this:)
> > 
> >    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
> > ----------------------------------------------------------------------------------------
> >  xo                                       9            9    48000000          0 0
> >  [...] 
> >  gcc_sleep_clk_src                        5            5       32000          0 0  
> >     gcc_wcss5g_rtc_clk                    1            1       32000          0 0  
> >     gcc_wcss2g_rtc_clk                    1            1       32000          0 0  
> >     gcc_usb3_sleep_clk                    1            1       32000          0 0  
> >     gcc_usb2_sleep_clk                    1            1       32000          0 0  
> > 
> > but judging from your comment "SLEEP_CLK is derived from an
> > external 38.4MHZ crystal" the gcc_sleep_clk_src / sleep_clk
> > should have xo as the parent. so the ideal output should be:
> > 
> >    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
> > ----------------------------------------------------------------------------------------
> >  xo                                      10           10    48000000          0 0
> >  [...] 
> >     gcc_sleep_clk                         5            5       32768          0 0  
> >        gcc_wcss5g_rtc_clk                 1            1       32768          0 0  
> >        gcc_wcss2g_rtc_clk                 1            1       32768          0 0  
> >        gcc_usb3_sleep_clk                 1            1       32768          0 0  
> >        gcc_usb2_sleep_clk                 1            1       32768          0 0  
> > 
> > or am I missing/skipping over something important? 
> > 
> 
> Sorry for the delayed response. So what i said above (32768 clk) looks
> like true only for ipq8074. For ipq4019, looks like 32000.
> 
> That means, there is still some thing unclear. I am checking for precise
> information from HW team for ipq4019/8074/6018. Please hang on, will
> update you asap.

Thank you for looking this up! I'll definitely stick around for the final
verdict.

Also, I think the "xo" clk of your IPQ6018 dts should get the
"always-on;" property (any maybe sleep_clk as well?).

Paul discovered that the QSDK had this extra commit
<https://lore.kernel.org/patchwork/patch/1089385/>
(Maybe the changeid can help you look it up internally)

For IPQ4019, this enables the high resolution with a 1ns resolution
instead of 10ms.

(echo q > /proc/sysrq-trigger can be used to check this just look for
the "resolution" value before and after.) 

Cheers,
Christian


