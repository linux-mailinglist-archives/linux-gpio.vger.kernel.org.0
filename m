Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F1D2AD855
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgKJOLu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgKJOLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:11:49 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563C1C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:11:49 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id i6so17747722lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpEnlnWHjDYLqMoNrHt/KysUsi09ROrhJWtHTDCWRGI=;
        b=BDkgs4woTqGqDFzLsQFt4eu4Kw92iGzSuCTQeQElSxv66BP10wEsrSFhEWFcyZ8k+1
         PY2O0/GuW4gT1FhsqFZJi3uxOBoAEcecE1Zua8LkaBKmPibKBYDWknfrRvfVCBmfE15S
         WHvzbxRGlltekn5L7pZkl/bAllYsZT+H9vsyI8xK8CTZujcKHBkTnRDmIdOUVT8QoiXK
         PjOG6C3zAZa4FamO6GIFICx+i4z8QX3Yia4XxDo5GyTR8msPcqbZWUG2rvPmTTAzgugE
         URxSZbvHY/vHKL/LjDwynre8bcWqE/RPy5l8pxFgc70rkWm08TN0LEKlQTfEiA64FeZ1
         PQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpEnlnWHjDYLqMoNrHt/KysUsi09ROrhJWtHTDCWRGI=;
        b=LzFzOEG+jWS7dDWXm43pGiKegLWC/nj59Yiq8X4eihibCjU4nutAKh1zMoWJS48R9Q
         q6AGyGktMlASMfBjHv7910J+UMSxoUQ0ZxylPA8PAhArx+c0X6vZSORSWDoQT7Z6+kOO
         amO2dmuqhrz0v67LY9Bwv4uYxlfw9b9S/eHcOKr8ERpa5UhXkozvz/EH5QKgaUkNesTo
         Pr5LO3cr1mXn4Y8eYTjzuQ7uEG87uFkh5Qre3xxV36r2FpCEqOr1+Ayt/6Cl41hvbEXB
         zxaAl+R5uz+XrGMqihfIOPLlVTbTM7nnFBWXKO+Qm4iVethv+hbaK5TLYoKo0+ChHfNy
         slyw==
X-Gm-Message-State: AOAM530yuoWjf0iwwiTc5c5oZsIL3lF9bvRJB4PGFlDmbnA1ohpeKScC
        RKy7Q6orIU1wqK+G6ncp4JiUTgMPz5l6Dc0tzuuugA==
X-Google-Smtp-Source: ABdhPJzvVokIIH3qqB2eJVY8gRVEaKtrnAHyEY9b7k7GNoTkcxcN1g1p9HGvhDxeQyifSTCtb1kd1CZTXmDi34FpIYM=
X-Received: by 2002:a19:5e0b:: with SMTP id s11mr6995400lfb.502.1605017507860;
 Tue, 10 Nov 2020 06:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20201106093118.965152-1-gregory.clement@bootlin.com>
In-Reply-To: <20201106093118.965152-1-gregory.clement@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:11:37 +0100
Message-ID: <CACRpkdYJHd47-vpuXjb8s0Y=Y=w+QaAMEK+=STqRFbESXJ8M-g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Extend pinctrl ocelot driver to support other SoCs
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 10:31 AM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> Ocelot SoC belongs to a larger family of SoCs which use the same
> interrupt controller with a few variation.
>
> This series of patches add support for Luton and Serval, they are all
> MIPS based.
>
> The first patches of the series also updates the binding documentation
> with the new compatible strings.

All 4 patches applied.

Please consider converting the device tree bindings to YAML
when/if you have time.

Yours,
Linus Walleij
