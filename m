Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FCE6792EE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 09:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjAXIWT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 03:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjAXIWS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 03:22:18 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC6B8A5A
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:22:16 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso12231179wmc.4
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9DqS2Jn9nJYNaDy07cme/7hQmGWWsUBjAPPDyYRsn4=;
        b=Vu2rxQhfqYQNgFFNRdKmRY6baqaJ+wwVQzel9USbomB3kstntshg/9LBTQZpk5SPY6
         SDRy0WiL0IpizDWYRT0N2/2Tw1JeWu/YXwMwC8sok/CA/IeuO7BG+6Zol4XtzttTWx5z
         mzP2+6XybKArW3kdhnDz3yYcoa2rZvGJnIZUjiWplWf7HLXCmww+AKipfQ3vWJ1GPsA6
         pt1qrFpjgHqM4VdD8nFt9XdEk7RrYhBC50UqZqkKZ2H0LhH/uCQlm93ENJmEOu/mssSM
         5TsN/fO5/a8Cdc1QexvNUVnfKWlsJCNoGvlpEnxP2OCHrRpWWJ0FL2TGptMEVapD16Cd
         fvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9DqS2Jn9nJYNaDy07cme/7hQmGWWsUBjAPPDyYRsn4=;
        b=68Tys7T4dQF7VDYhv9zIUihpGVsFQTodkSfTOjURhdJnua5VGEULZoiqTSZX+Fb8lr
         Ajm4m70WN9u4mTRNxNhmqYf6D0Wap1BSJGXckzKMHRvLLZ97f7sZRK0SRg0OLVjmbqk9
         go0AfqaP5xCswpNpZXPO7CI04Rx6bM4Zjpx5XR7Bow/YeYaEXsje5eEASl+HMl4Gde5h
         b3Vb2KhwRyeq24v5Bl1o6T0K3AHu29Ez7Qq62hnD/Nn3JX4EQ8th3q0J15lyrqX+m5vR
         d/VvmxtXZed0NQh8+/JbL3EqTD2J6hyA81Bmp0Q6plK9X/dpyP0A1azIVrS1bJCUPEie
         fOMw==
X-Gm-Message-State: AO0yUKWIlhWlPnx42OLN0m/67a9KdT5jMQjYSCBEG70Un1G9qUIw3YvU
        TFw5q34Y9QI4uGdy4IaYYCJ2cJo5s14RcTcpMtg=
X-Google-Smtp-Source: AK7set9kgsgyREqDkDA4wXQveg9l8CTz4di8q5DI2C+/Ud24R0ZH9g/nee+rfw3tBwzBqjJdZL6CoA==
X-Received: by 2002:a05:600c:4fcb:b0:3dc:1687:9b9a with SMTP id o11-20020a05600c4fcb00b003dc16879b9amr460697wmq.37.1674548535007;
        Tue, 24 Jan 2023 00:22:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c2cad00b003cfa622a18asm13870207wmc.3.2023.01.24.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:22:14 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Subject: Re: (subset) [PATCH 0/8] soc: amlogic: switch bindings to yaml and
 adjust some dtbs's
Message-Id: <167454853388.2972173.6260080234043719240.b4-ty@linaro.org>
Date:   Tue, 24 Jan 2023 09:22:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, 23 Jan 2023 22:22:15 +0100, Heiner Kallweit wrote:
> At first adjust some existing dtbs's so that they pass dtbs_check
> after switching bindings to yaml.
> 
> Then switch further Amlogic Meson bindings to yaml.
> Tested with make targets dt_binding_check and dtbs_check.
> 
> Heiner Kallweit (8):
>   arm64: dts: meson-gx: Remove invalid pwm compatible
>   arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
>   arm64: dts: meson-gx: Set only one compatible string for mmc
>   arm64: dts: amlogic: Remove invalid compatible string
>     amlogic,meson-gpio-intc
>   dt-bindings: rtc: Add Amlogic Meson vrtc controller binding
>   dt-bindings: pwm: Add Amlogic Meson PWM binding
>   dt-bindings: interrupt-controller: Add Amlogic Meson GPIO interrupt
>     controller binding
>   dt-bindings: pinctrl: Add Amlogic Meson pinctrl binding
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[2/8] arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
      https://git.kernel.org/amlogic/c/1be13a5091bf71627aa1a3d35360b039510f42f3

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

