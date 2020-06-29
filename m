Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBE220E011
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388152AbgF2Umb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 16:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731648AbgF2TOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:14:04 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [IPv6:2a00:da80:fff0:2::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A313DC00E3F7;
        Mon, 29 Jun 2020 05:15:27 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0BFDF1C0C82; Mon, 29 Jun 2020 14:09:20 +0200 (CEST)
Date:   Mon, 29 Jun 2020 14:09:18 +0200
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Martin Botka <martin.botka1@gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: Add support for Sony Xperia 10/10
 Plus (Ganges platform)
Message-ID: <20200629120918.GB1319@bug>
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-9-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621213806.551879-9-konradybcio@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

> +/dts-v1/;
> +
> +/* Ganges is very similar to Nile, but
> +there are some differences that will need
> +to be addresed when more peripherals are
> +enabled upstream. Hence the separate DTSI. */

This is not usual comment style.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
