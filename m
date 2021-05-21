Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E59838C140
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhEUIGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:06:21 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:46101 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhEUIGU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 04:06:20 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 819662224D;
        Fri, 21 May 2021 10:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621584296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nSTicCgFPLz8bT6sxCt7FpN97fVeykecr1m01Xg8n20=;
        b=ixYBu6tQYrinQxyy4HnnIhjTjzUEo7r0s4aZff1OB2QqG9ntle3yw9OzAki68noXUycFx3
        AmVpoys+Go1NsLsuyP37GXwzLwow/ph5c2OT72zu6G1eCHvPx77ESyJrx74b5LDfHgo9Uk
        SsPOky+paYP+SZOPSIg8YzfPDniyAjI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 10:04:56 +0200
From:   Michael Walle <michael@walle.cc>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
In-Reply-To: <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2044737db51904355817a5ca2771df91@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-21 08:27, schrieb Matti Vaittinen:
> The set_config and init_valid_mask GPIO operations are usually very IC
> specific. Allow IC drivers to provide these custom operations at
> gpio-regmap registration.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
