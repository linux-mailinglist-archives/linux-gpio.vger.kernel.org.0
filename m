Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E8B2D696E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 22:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391632AbgLJVHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 16:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393935AbgLJVHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 16:07:24 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4406CC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 13:06:44 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w5so4625730pgj.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=sOXhUWYSO+7Ec2yrlVOKodV7VJPSDj5oaxzwn+tEHKw=;
        b=b/OBsaxyIhb4UxzGUoqUGRgM9AhFLZKn6suNn+TyZmbe4lwHMV1RyxJjIKoh0TKBh7
         k7begKjj3oAumNmQFzfJkxSXAkouZM9qkzHZUDXM4rBphWcr/DpgeasP5xdadHRiZl47
         /VUuMAr3i4BvFUn9impJznb+b4pMXo5RHp1Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=sOXhUWYSO+7Ec2yrlVOKodV7VJPSDj5oaxzwn+tEHKw=;
        b=XNVq3XBY8VhQ4toE5LN4GywFyquTqRs6BTCaUYyPWqb6sTCgY8l2PrFq5qQ0/zg7XK
         q/3Stol5t7DuuIfIRyVGDD8S7pXbqq5ZNuLW9EUU1yCITaKAylm7mxIOnryWH7LX9vq5
         BMNZaGQYlxssop22k6Jx6VRGEzKOrTE+E8yHJEdW2TQp2V4oVmiRZHx7HH/5YkI4XD30
         yqy241MemfdkHvHoNiTynpB8BgH8OrTXEHrPHc7fpvDXSIAkMsuE8lGoXMNk8nflZG2/
         KGNQcgRx6HbGFdpef/0nSxXDVfc9LZMEMlOUBLcYYuP5t7WX5gAqoZj347aIqbzxZAK+
         yhWQ==
X-Gm-Message-State: AOAM532xTCDTswtLL4Y5+8+iZiFoxtVHWlxskolgIO0KWNQLkUB3KrlG
        IUJC2vqYk3giCUDIo0t+wOoHPA==
X-Google-Smtp-Source: ABdhPJxeBjsKUmXUisDH7bsUh2rRFNSNmUNxpcMeRJM44Tz2B1oI1xfP7Iz1ngC8AwIRiEaH3LOLxw==
X-Received: by 2002:a17:90a:dac2:: with SMTP id g2mr5799573pjx.17.1607634403856;
        Thu, 10 Dec 2020 13:06:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a19sm7097407pfi.130.2020.12.10.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:06:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209163818.v3.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid> <20201209163818.v3.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
Subject: Re: [PATCH v3 2/3] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 10 Dec 2020 13:06:41 -0800
Message-ID: <160763440177.1580929.656020512153968577@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-12-09 16:41:02)
> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
