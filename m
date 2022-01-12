Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE34A48BBD8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 01:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347196AbiALA3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 19:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346811AbiALA3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 19:29:23 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C15AC061751
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 16:29:23 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id w188so1335469oib.7
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XWQPHdXybadB6e7/P7sAbUm970gAaRr2bcJInNv6MII=;
        b=OZwsXnDc9UPynogrYZXJH3NZkKffpbXSs+Dh0F9SzKL5beUBdoUZdVGXfmgY7dPL8D
         nAYOuFVL238WUh6Buu/adZacXUdhIOn7NE879ZhMcYPE3YaHEVOj3wtRUWXzEX+1QDpR
         hJa9EJmHaW57Mxvrxfj1vGMGSDv/EcvUVXCmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XWQPHdXybadB6e7/P7sAbUm970gAaRr2bcJInNv6MII=;
        b=1eF2Fb2IX5QT5lmT2b3o5Mnb2Cdo5LjHlhvyktBFccp97Jch1qEO5zlTdiMRsumdoq
         pIUBg4rzHWaOWoX7BssOOfcdqcGanHR2fy/+YLz1oz/kJqS22eI42J1H38fy9dAOODig
         HcZZl/lpgJMi8iOh20Q5dNI7bKBBwnzbp79qV3H/bfAuOhVkMv9w6XBrCyRPN6KRzlq7
         yNuzrg0dFs6YPrp05eiAnNKNNpHHiZu9Rv9pbQZK5Vh08cjKa1y16apuP/WhoF718uiF
         nUytPnzx562ZToUCDp4fXiJgMRDcpAJc+w009HAeXp4gpl+0Xc38cPWsSxbSFrXPz9tb
         0YhA==
X-Gm-Message-State: AOAM532Aoc47tV72BGv1L8FBaq75RoYE0KYov3/DsxBpnjRatn1kLe4/
        ri4hQciWKSDUg6cWk0+z1PZeJXVDLeLBRMfFZWAXug==
X-Google-Smtp-Source: ABdhPJzs0Rk433uSwQw7ceFQP2bC9DKwS55Ky7plEX/1aptBSsq9LHbT1XbhIKGNGccDNMx12j+tEMjEY3DZmgZLWwI=
X-Received: by 2002:aca:4382:: with SMTP id q124mr3534110oia.64.1641947362878;
 Tue, 11 Jan 2022 16:29:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Jan 2022 16:29:22 -0800
MIME-Version: 1.0
In-Reply-To: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
References: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 11 Jan 2022 16:29:22 -0800
Message-ID: <CAE-0n51tqh7XP8SrqTY_EfsmqWnh2dVHuTTcRJt1BRR27bAL+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: drive-strength doesn't default to 2
 if unspecified
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2022-01-11 14:05:21)
> If the drive-strength isn't specified in the device tree then it
> doesn't actually default to 2. Instead, it defaults to whatever the
> heck the BIOS left it at. If the BIOS doesn't touch it then that means
> it's whatever the heck the initial state of the pin was when the SoC
> booted.
>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
