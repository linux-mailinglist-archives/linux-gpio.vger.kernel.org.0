Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B9420036C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 10:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbgFSITF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 04:19:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:44828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730828AbgFSISM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Jun 2020 04:18:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 983E9207FC;
        Fri, 19 Jun 2020 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592554658;
        bh=HA7ailzZtLyGM7+dSmDkKq58t5uhEiFR442OtgMD67A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ra9354xvWkO2Dai0qmF2ZONN5WpMV3njHsp6+IXb73/Nr57X2Rn9FHLEXyyAG1bfV
         VqoFAUrjsqiwX45sD6tRwf/ymM0j4XUVar4W6MSUCXw+EEKSxT+c2tJyTspJSca3hY
         PVbhVwh+9NtcG5ZANMfTHj45MelhZioUy3ElHoGA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200618073331.GA9403@localhost.localdomain>
References: <20200618073331.GA9403@localhost.localdomain>
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Date:   Fri, 19 Jun 2020 01:17:37 -0700
Message-ID: <159255465783.62212.9583042633101060784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Matti Vaittinen (2020-06-18 00:33:31)
> Add entry for maintaining power management IC drivers for ROHM
> BD71837, BD71847, BD71850, BD71828, BD71878, BD70528 and BD99954.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
