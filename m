Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050354688BA
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 01:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhLEAfH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 19:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhLEAfG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 19:35:06 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B01C0613F8
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 16:31:40 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso8669870otr.2
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 16:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ohfUx7+Ba/w55XvPHx2jac6mSSYo1iGShALmEmttMH8=;
        b=ZyM/HdKaO00iGySBTTsd54bfQp7hn0KQmfRiHoBP1/eUvXjH1I12pcmV7jhk+9GLLl
         q/lepb+rIHyCs38zQr87qMkiOBBhnQBVDIt94P2PFla+bEjvkwVA/f2F3ZF5plFCfbT5
         6ZBwdaKvUbXyOpHgg2kyZeh7GqP+uty921HINgXEpfdzVG/uw6uDY/yqeRjp9G/6RGoJ
         mext4mObDHgo0ph/sB2HATgT61c0mPHTwsHp0UywpEI4a8WH8ohAqZiaAaJbBosBwGwE
         WGmmfal+rhm4aP1Wi+tejByEyqjpOX26mClwOSG0t+Zf0CombCItoBH106nc+QH9/L4S
         vkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ohfUx7+Ba/w55XvPHx2jac6mSSYo1iGShALmEmttMH8=;
        b=u/MdvyfbtR335eTVk9PCzwRiBQAr6QzPQNl7jFeAWYT9YSZqvGTEJsrhfYvQSEpvW2
         EiYSZVjNct4MtFt+fSrXW11LEhfFFLtaji187OVPFoT3L4gmlRbJ11yj4EtkZWaWyNru
         X5vPr/vAAG8aiBEp6fs5f2viCrGhnwIg41wgBt/53ScSAfCD5p0fL+cLWz3BuANkw0C1
         IQaaWKLJOKBLTzoDDc5gHMkp36sxoQgS8i/mHZvc8PEZaeF3vTbK/nCuKe1Jt/nLRJIT
         GWYBuW3sRvFv1MjhwPemjkDxhMiXYARPrsF0rAcL7mh6Fj7JUlI2IhZEoY0CMX4hT/PB
         TIpA==
X-Gm-Message-State: AOAM531lzwvVaRMzHnGTm/2yBq9C4dVDkjQQYTl+2tR/wXleD5Xb8Ipg
        zvVKJy1dyIfpl+AQmGohx+twu/0NPTQLwWd8jUskWg==
X-Google-Smtp-Source: ABdhPJz9IUX0vw8Jzou3ekRTltWjDhOFDT+ndkoP4wMc0wt4IlUJv8D2e6x/wkSMlf1sxRQPobEfWdkXr7mH8wF9X+A=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr22884362otj.35.1638664299828;
 Sat, 04 Dec 2021 16:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20211202063216.24439-1-zajec5@gmail.com>
In-Reply-To: <20211202063216.24439-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 01:31:28 +0100
Message-ID: <CACRpkda=C55QiCBYjMTiN61FME4p0Ji2XfZC2tg+e3h0twR3oA@mail.gmail.com>
Subject: Re: [PATCH REBASE] dt-bindings: pinctrl: use pinctrl.yaml
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 7:32 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Also fix some examples to avoid warnings like:
> brcm,ns-pinmux.example.dt.yaml: pin-controller@1800c1c0: $nodename:0: 'pi=
n-controller@1800c1c0' does not match '^pinctrl|pinmux@[0-9a-f]+$'
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> REBASE after 1dd19cae1552 ("dt-bindings: pinctrl: uniphier: Add child
> node definitions to describe pin mux and configuration").

Patch applied!

Yours,
Linus Walleij
