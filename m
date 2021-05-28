Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0484394646
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 19:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235676AbhE1RTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 13:19:19 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:33267 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235299AbhE1RTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 13:19:18 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id CB08822172;
        Fri, 28 May 2021 19:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622222261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aZt4BXJ2sP2DnTFDeWjkqfyonBO7Xc+fqJd9oInjT1Y=;
        b=olhI4ynssKrDrEBYeNWjJtGsfPvEfBWDKu9Ikk+sg44Fk9AoLzle7k092EW+4XanvBsROC
        +1o5NyE3+A85YRjqnyuatg6EF09OyEnYTHKvO7ulYxtUk+JFsi+fhLdNj28J6Oj21AyaPy
        TCc76ji38zvMhmsmaLHozCdjKCqVUCg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 19:17:41 +0200
From:   Michael Walle <michael@walle.cc>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com,
        linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: gpio-regmap: Use devm_add_action_or_reset()
In-Reply-To: <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8c1f817e48bce8a4cb730d79c1ef0330@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-26 08:10, schrieb Matti Vaittinen:
> Slightly simplify the devm_gpio_regmap_register() by using the
> devm_add_action_or_reset().

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
