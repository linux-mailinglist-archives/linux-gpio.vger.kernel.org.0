Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184292E9243
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 10:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbhADJAD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 04:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbhADJAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 04:00:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C7BC061793
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 00:59:23 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id h205so62589586lfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05t36dGE9bZNKvTJSmUC2VCNwPOgDHBT4ilFLddS6AM=;
        b=rTdYfDoUNDEk9t81dezSnY0Y4BW9TKYrS/vndmeU++wFLQO+d656xBvytl+DkGaGkp
         S71eysWt6txbLaKIHAllq7ncHU22bs1X9Ght3X+LGCknZHS85Lh8s6R5F12XigpOlXuB
         LKcahK8O/RwdVrz4B4mDF41WUxI2oR4Lr+20mqTbiLzk003g+LF9v7BqlcnHDvGXINTA
         2jY/4uZ2jtmKUzel8NOf+GmyKJMXvOfneJ2X60n+5lnv5YQsQ133LIdFtKrdX5y4C43G
         VvpkyqAO4t5UB5NGOAhBXH/Q031cZzaB+xIlrnlHnwtDYH7WSIQZKv6998bLMdyQNesc
         RWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05t36dGE9bZNKvTJSmUC2VCNwPOgDHBT4ilFLddS6AM=;
        b=JpW6/KrvXx81K8DpZpwXWRTNmjHrcOC1QJzxUML88GkgrLhTj52e7nfKhosaYxWVU+
         exXyLVTqFeQHyq9gq/yMcxKk0NixE0dlD1uZWOTvLy/rbMiLS0RExWoXRECRn7xKIkAy
         4EspHMVFbx7sxQyslG7GICRWBx4QCr+R/ZOU0dtbIQGDRfKnw/aCn5e6nLCIqtKvZLN+
         GMXLEuN9FGO9rM2i4ubOM59/24CzhklEDhCWwxuGY1RF/ziXrWzJZpLzIke8nK4cfcNx
         zEsuOJV56zH23IQeZzpXs7FnmFOJP8urPbzx7n5pbla5RhBcvsmtt7w9r4Oqkao3aQL1
         GA2Q==
X-Gm-Message-State: AOAM532zsDVfr4N+VlMMoAF2pjcKL1Uve+e2tKY2R1AWWgalosOs5Kyl
        q8QdKOPGl0bVNlKagOfoAFOOZsqpoMuXeDxGkyccTQ==
X-Google-Smtp-Source: ABdhPJwH+5EgjAH8XKKrWcsfJ2KYxTX6etw+GRpnp/HJsQqGleG+/kA56Pt1S9klS0Hk+rWCSvaUYwG7SApBeHC3QbM=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr24951562lfg.649.1609750761149;
 Mon, 04 Jan 2021 00:59:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607601615.git.baruch@tkos.co.il>
In-Reply-To: <cover.1607601615.git.baruch@tkos.co.il>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 09:59:10 +0100
Message-ID: <CACRpkdaDzNyUUARs63ydC+XkW29vxvZBjtj4K5rp7+_WEUeeAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: mvebu: Armada 8K/7K PWM support
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Ralph Sennhauser <ralph.sennhauser@gmail.com>,
        linux-pwm@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Baruch,

this series seem to have missed the previous merge window due to
remaining comments, will you rebase on v5.11-rc1 and resend them?

Yours,
Linus Walleij
