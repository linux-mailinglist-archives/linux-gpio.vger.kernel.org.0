Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23A14208EA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 12:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhJDKCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 06:02:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232487AbhJDKCV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Oct 2021 06:02:21 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A63BB61373;
        Mon,  4 Oct 2021 10:00:32 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mXKlq-00EaPO-LI; Mon, 04 Oct 2021 11:00:30 +0100
Date:   Mon, 04 Oct 2021 11:00:30 +0100
Message-ID: <87a6jprtxd.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     <matthias.bgg@gmail.com>, <Ryder.Lee@mediatek.com>,
        <devicetree@vger.kernel.org>, <enric.balletbo@collabora.com>,
        <fparent@baylibre.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <hsinyi@chromium.org>,
        <john@phrozen.org>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <sean.wang@kernel.org>,
        <seiya.wang@mediatek.com>, <wim@linux-watchdog.org>
Subject: Re: [v4,8/9] arm64: dts: mediatek: add mt7986a support
In-Reply-To: <20211004091208.31335-1-sam.shih@mediatek.com>
References: <0459da08cddc579f069a28e659e614fd@kernel.org>
        <20211004091208.31335-1-sam.shih@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: sam.shih@mediatek.com, matthias.bgg@gmail.com, Ryder.Lee@mediatek.com, devicetree@vger.kernel.org, enric.balletbo@collabora.com, fparent@baylibre.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com, mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org, sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 04 Oct 2021 10:12:08 +0100,
Sam Shih <sam.shih@mediatek.com> wrote:
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		clock-frequency = <13000000>;

I mentioned it last time[1] , but you seem to have ignored my comment.
This property isn't an acceptable workaround on new systems. Please
fix your firmware and drop this clock-frequency property.

	M.

[1] https://lore.kernel.org/r/0459da08cddc579f069a28e659e614fd@kernel.org

-- 
Without deviation from the norm, progress is not possible.
