Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45709A981
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 10:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfHWIAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 04:00:32 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35159 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731354AbfHWIAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 04:00:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id l14so8037004lje.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2MWurloFC424CUmSqLbHj0wb/3z06n1cb9tNRKzCOz0=;
        b=sA3b4HdX77h7s/fsgrnjxNpZZL2Q2H0A0yDHqxZ97wKFl/4wY6a1hIV5EQoqmrzZ7r
         f4Z8cqeST9COrJKBqhuaiYdi+KUCmgfbGSP1wKpdmxquge83gpeW3HfaT5SCIGS5uwVG
         3veKuafvjamg3UGf5XlzSwsesSMNOTzddh4Ge5Tqp+I26zHMONWLgzNiAq0o81va1Jc1
         emEV0eUjqLBewyOer5y+Dho936IyFhHQSxCZlZqIw1KZGcbRpXPMFujKyY+ryczpp+Yx
         sISvmhOjokZhZ62yOeO8PFUTc2yZ4Hf2TWU69qgzlCyG7Oq+xQhaGlB5ijax6S+LsHQL
         jClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2MWurloFC424CUmSqLbHj0wb/3z06n1cb9tNRKzCOz0=;
        b=tFfWf7ZYLilznoGdD8VwQPqZLEqz1fJ/dXKXWSCHQry2a1BLI2toYFwcAa6mj22MRL
         I9nAaJVI8ocAv49XpLnP5dh555A9TqJnlWHnjcygw0Gg9VBMWNS0dEveiUk7f9isV+Ez
         l7D1o1TEMj/RM4v9i0L/L7F9wun2Jd0R3+8G2Tb+q3CFApRedGO/CEcmAOU8tiwkio0V
         YUbHPnXgWvcUo7VG0opY/1gsxYsfPiL9eScU4UqokS+ule9PHqzqDNl5z9j/LyW1Vjn8
         am6ZC2D0/TTUJzozZ3v8x/x1/5JgObDTlh6/m3lmXGmY+bF3ObMCCIl61kixi/2SIjB3
         FTyw==
X-Gm-Message-State: APjAAAUzYTFu0FM7qyhbkSPSnvyG2PYb1OAqPBGGvM1RWKrWWpv8Ad+W
        H7FVwacxoRoW44oTChHneuOb4GDwMH6gtnR3GQsQtQ==
X-Google-Smtp-Source: APXvYqzLQ5ClEUlmAOPmQjblokk+7eUHmNQEQGStJEPG0CbEku6phix8tVMaf7PE4m+a0XscjlciF/e0C/PJmTAj7dk=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2091021ljc.28.1566547230567;
 Fri, 23 Aug 2019 01:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190814123512.6017-1-vkoul@kernel.org> <20190814123512.6017-3-vkoul@kernel.org>
In-Reply-To: <20190814123512.6017-3-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 10:00:19 +0200
Message-ID: <CACRpkdbANSzMbO2dDGrfFK=KP_ZCkoaOA7xG4zirhzo7hHG_ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150l support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 2:36 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8150l GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied.

Yours,
Linus Walleij
