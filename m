Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225E220E07E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388883AbgF2Uqo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 16:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731544AbgF2TNw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:13:52 -0400
X-Greylist: delayed 371 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 29 Jun 2020 05:15:27 PDT
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [IPv6:2a00:da80:fff0:2::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC62C00E3F5;
        Mon, 29 Jun 2020 05:15:27 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CF41A1C0C0E; Mon, 29 Jun 2020 14:09:12 +0200 (CEST)
Date:   Mon, 29 Jun 2020 14:09:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
Message-ID: <20200629120911.GA1319@bug>
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-8-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621213806.551879-8-konradybcio@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

> +    soc {
> +        gpio_keys {
> +            status = "okay";
> +            compatible = "gpio-keys";
> +            input-name = "gpio-keys";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            autorepeat;

Do you really want autorepeat on keys like camera focus?

> +            vol_down {
> +                label = "Volume Down";
> +                gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +                linux,input-type = <1>;
> +                linux,code = <KEY_VOLUMEDOWN>;
> +                gpio-key,wakeup;
> +                debounce-interval = <15>;
> +            };

No volume up?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
