Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C41EA88C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 19:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgFARsJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 13:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFARsJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 13:48:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DDCC08C5C9
        for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2020 10:48:07 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so357585wmh.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2020 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EF2MUXWe+0T7eyxkA8rRyjXJ0lsym9S82yVeKfIolyg=;
        b=wS+C3T2s8Q7602JUv3jWGhy8HPjzuOYzUPOpfSA5smX0EG3VwfTnAlZsoGasBnlyfg
         4ERS3mJMRO2/G3pVMuJSD09lBkKa/NcDOuUqMb4g2CwqWQzMCBZvoQ41i3H50aDvU0Rx
         ERuHo8/KK/pjd5PZRwwIPJ7mKT7wV7tPAFfpZjYgZDp6jCA3KWWzxyjNE3+7HmbsVdEP
         /SpwYW0aUknx/oMKZE168CjaLYOdZj4+BaQ4/j7WddQdFJc3qUZtVYgRGgOE2Dgyfl6G
         HhzZGjddlkJ2txyX10rH5WJWrhyn7jSt+lSXuW5wTNQNHTeNVN9+BYBjjr/SvmVXYhlX
         Hg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EF2MUXWe+0T7eyxkA8rRyjXJ0lsym9S82yVeKfIolyg=;
        b=Fc/OCl9y8Y9ngYojx6Qivrg/hgCvP0V0F0uGzihNQVsJRBvT9SbB3IUWubDK9R3Eme
         2GECsS3tSRgdA13/plNp/fxJa8ICwmZgTNG4qhkebyrpF7ibWhceXFRR59barKqvIbLL
         3mVehGbS5Uckq/dJQwEPWAHTJW7AVzZdaJV2gYr1qydvtUiYX9zCIefvaVhO2coIx4pO
         Rut5P6npguu8/R8ikHuhGUm+3y9Rj8EvzOK5K0/cmZ6Sc0luIMJAwQC5UQp8ZXyznSpC
         Nrxpg3S7EULsVL9RZXQdeGgXZP5voZPE5squyGbenIhmvShT3vDrKkE9TJdz/ippnudB
         idUA==
X-Gm-Message-State: AOAM532AhH8/OufY7VZUIL9dSBlQfRTjBexUU4TNso9sWaN9lafB1qeN
        JpREUqNO0k+De5L74irtPwZqOg==
X-Google-Smtp-Source: ABdhPJwGZ7xVM43OkmrdbN8kKFpqKZnhsQ0DhmfJ55I00xz5ohrw+O7sia6vxKrkXQ2zK+FBQy25gA==
X-Received: by 2002:a05:600c:2110:: with SMTP id u16mr426062wml.26.1591033686091;
        Mon, 01 Jun 2020 10:48:06 -0700 (PDT)
Received: from x1 ([2001:16b8:5cbd:c001:98fe:8f8:cce1:59e])
        by smtp.gmail.com with ESMTPSA id l1sm297821wrb.31.2020.06.01.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:48:05 -0700 (PDT)
Date:   Mon, 1 Jun 2020 19:48:03 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH] pinctrl-single: fix pcs_parse_pinconf() return val
Message-ID: <20200601174803.GD1371046@x1>
References: <20200531204147.GA664833@x1>
 <20200601161851.GC37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601161851.GC37466@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 01, 2020 at 09:18:51AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200531 20:42]:
> > This patch causes pcs_parse_pinconf() to return an error when no
> > pinctrl_map is added.  The current behavior is to return 0 when
> > !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> > incorrectly assumes that a map was added and sets num_maps = 2.
> 
> Looks OK to me, would be good to wait for Haojian to test this one.
> 
> Regards,
> 
> Tony

Yes, I would like to get input as I don't have the other platforms using
"pinconf,single":

$ git grep 'compatible = "pinconf-single"' arch/
arch/arm/boot/dts/am33xx-l4.dtsi:                                       compatible = "pinconf-single";
arch/arm/boot/dts/hi3620.dtsi:                  compatible = "pinconf-single";
arch/arm/boot/dts/pxa3xx.dtsi:                  compatible = "pinconf-single";
arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi:                 compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hi6220.dtsi:                      compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hi6220.dtsi:                      compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi:                    compatible = "pinconf-single";
arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi:                    compatible = "pinconf-single";

NOTE: the arch/arm/boot/dts/am33xx-l4.dtsi was patched by me from
"pinctrl-single" to "pinconf-single.  But, I think for upstream
submission I would need to move that to one of the beaglebone specific
dts files like am335x-bone-common.dtsi.

I believe this pinctrl-single.c patch fixes a flaw in return logic and
is useful regardless of whether beaglebone adopts "pinconf,single".
However, I would very much like to get input from others in case my
analysis is too narrow.

Thanks,
Drew
