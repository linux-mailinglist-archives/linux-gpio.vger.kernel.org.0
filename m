Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724AB3AB06B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 11:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhFQJ5m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 05:57:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhFQJ5m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 05:57:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B11861400;
        Thu, 17 Jun 2021 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623923732;
        bh=+qCEg5YO9xl4YV8Zb5YtPd5hoiY0UwinldP+ikR3DIw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PJbFdhd8j62O66EXDRZ79oUIyjGRN3UXcwTnCR+7MOFcMTbsdvqA9jE0xAOVgzTnM
         FFWfpUQn/ZBp+08GDO8PvdTTgPM87f69KtxEe6lPW/E1L9ZA84LAuOcPxXwSYwnyJq
         CAG/vBr8XhfG8vLiYSL4ZL4D0nbsClZWLtqENO4zTA6XKmX01iUetO9Oxz2PU4jEpJ
         uri+HUoU48EB3slogQMO1He82vYLQHTVYMRkyx2sRJNvdZVZZ65dzVFg4RanOz6i4/
         76YD1RS6SKVmju5qS0PFfyGsZKxSLfLbhaD9DsV33MtR/LHnHxdF52KYrAkV1KLOSe
         yR3kiEbObTHmA==
Date:   Thu, 17 Jun 2021 11:55:27 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        pali@kernel.org
Subject: Re: [PATCH] pinctrl: armada-37xx: Correct PWM pins definitions
Message-ID: <20210617115527.0659a5ea@dellmb>
In-Reply-To: <20210614222527.11237-1-kabel@kernel.org>
References: <20210614222527.11237-1-kabel@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 15 Jun 2021 00:25:27 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> The PWM pins on North Bridge on Armada 37xx can be configured into PWM
> or GPIO functions. When in PWM function, each pin can also be
> configured to drive low on 0 and tri-state on 1 (LED mode).
>=20
> The current definitions handle this by declaring two pin groups for
> each pin:
> - group "pwmN" with functions "pwm" and "gpio"
> - group "ledN_od" ("od" for open drain) with functions "led" and
> "gpio"
>=20
> This is semantically incorrect. The correct definition for each pin
> should be one group with three functions: "pwm", "led" and "gpio".
>=20
> Change the "pwmN" groups to support "led" function.
>=20
> Remove "ledN_od" groups. This cannot break backwards compatibility
> with older device trees: no device tree uses it since there is no PWM
> driver for this SOC yet. Also "ledN_od" groups are not even
> documented.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Should this also have a Fixes tag? (If it is accepted...?)
