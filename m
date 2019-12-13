Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5B211E768
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 17:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfLMQB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 11:01:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46837 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbfLMQB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 11:01:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so3170238ljk.13
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JutpvUzxOsyoaSk9NwrCbjNfxIk5I6Gyk3NK08J6cQ=;
        b=XbodqbL3vPQgnrqfzeaCyEVhD38xe5Ee/7W6WG+3H0r8d3gK1zcoVwKVXMuUgAU0M2
         4DQOvNLUDR/////SzUbHc5j5W1xWM/yBLPPmprf6fAhrBPgnVrF9MWLeN4O2vYZCJ7M1
         4X1x8Fw9FLKKsz3moE9wj1ErHuqh07bNN9CKKPgDO7bCoXbsFXdawNp+ESB1lLm7lQbR
         T7yralAgbY7NRKeWAjgOfz/kV7Au4VVQTOzHFNzsMAdqqDo6XqgWVar4MM1VmRxH+vOC
         PfeOm17pCYVt57aHpW1G40Z4N/b7GfLJcpE1D+kmru6Dz8XIukjA6/e/RZoMG8TAjDWv
         SgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JutpvUzxOsyoaSk9NwrCbjNfxIk5I6Gyk3NK08J6cQ=;
        b=Pm+vEBMFC0vTNi7GOzAKDGRYzU61r5DrI6bhu6zXAcwHHi/ILoNORBOAuF5A8st5iq
         OxDxXBYVqrRZ64TFcWjmUpl/rMmMJ2th1KG9PYCaQIqP4ZcUk8evTS027PdNBykscRYa
         DMndfC4aAllSIlMgIYEw/NkcSrgmy0Ios4PtvDKWvVTD4oXOu43eIcXwurhIwbDPsOLP
         r5xib9FvQzEn9e22F4Uj131PC0XJfrjXMOII4k3MJlKN6ywRLTxoxM1GhnbyxeBsDL8r
         oX6JRP+qNAN82/8sONia7hndHVmygc52/SHLGUFPaX4xTwEOQn8/uaER85lAuHOaLlGP
         vVBA==
X-Gm-Message-State: APjAAAUJrAzQMvquItRnDFQvBUoeCq2P/Q3U+DwVoX1JHPHKS/Yef1RR
        ld8V3qrssGVJbOwmOffEcLQ7Sd1meIbeiG4G+vTssQ==
X-Google-Smtp-Source: APXvYqw5j7XQGOFi0lBLLQGKLSulok+o4hXa/wOnJ5dacau9siOORcPCGi5To+aftjmvKminoQEjm3PyKNxF1Nwhy2s=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr9948355ljm.233.1576252914355;
 Fri, 13 Dec 2019 08:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20191209163937.8156-1-krzk@kernel.org> <20191209163937.8156-2-krzk@kernel.org>
In-Reply-To: <20191209163937.8156-2-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 17:01:43 +0100
Message-ID: <CACRpkdbZ8d0K08uSUhzUwnDupXX=Y+Wc+sa_etK-LnPL7RDB_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Clarify the option titles/names
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 9, 2019 at 5:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The config options toggle Samsung Exynos SoCs pinctrl drivers, not the
> driver data.  Clarify this in the option title/name and also make it
> consistent with other Samsung entries.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Like the other Samsung patch this doesn't apply to my tree
devel branch which is close to v5.5-rc1.

Yours,
Linus Walleij
