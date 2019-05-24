Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55CB829797
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391023AbfEXLwC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:52:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46551 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391179AbfEXLwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:52:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id l26so6896341lfh.13
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6iYR7JRp1HHKG9HCoJt7Z3ej82/8WkT9mMtbM2Bxr1w=;
        b=eVJQ8nvD3hAKgGuALBDODWh58e0l1HeXP9wXW7FkvNcgnbbFuZmFeCJovVHM7dlj/m
         2EiHPDPxvbTD2brb1rT+agQlFIUawA/Dzm6nyArjH8xr3WTv2B6gMtblpROM0lb8OJrD
         VGashTDvVUiaWWxCOc5ezn4iX/aWk+8fmj6TVDLYJogUsOmKuhBtWeoUozBpCe0OX+yX
         K4swzxSB5D53DseVA278hofCrfKYTqriUqPa6ygQQHcf/KgMvQq+TRm1eSn/h/n39EzK
         LO6xBo6WWVgl1/V6k1rKddLmIA1nePqoCwSjk6sPrzwEslBhyCmRfdyKxx+qT3d8MNGO
         ZoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6iYR7JRp1HHKG9HCoJt7Z3ej82/8WkT9mMtbM2Bxr1w=;
        b=sXhx8PTPKJELVqTnktHqRntGaaEpTSVBxr+9oEcUhUpBbT60tMrCc26nzphZGW9hg8
         getGY6YWSlOMdCFzqeEG+qZ3irScVWfwN+j1u2oZkTnjXHZHmtEKKRtJvUbF8KvHKrVV
         qUlys1QGssf72YrBXiSHOwgI0ke+OmEhP20iObDLXN8qzmOua3p5dT/Ze/WXgEe7GNqa
         rnPIBAbvaTktobwkUla/ug8pxDXSjX/lgS7vIyIhPYJ6ZSO+bSvl7RA59XWsOyKD1/19
         4yJl1bMVAXkyXBs/ZWXzEZaKtDkBtrDUFpzs7eGxvUFguh1e1206t2GN3Kst9WdJJXUY
         t4Lg==
X-Gm-Message-State: APjAAAVM8VUjSaTugrFqW/Fy2zk3GwokeQcF4+xYdpkhKCqRV8B2mSDB
        qF/qAsyAdwb/rE209fnxg314dBzIqqazkfIYGreDMg==
X-Google-Smtp-Source: APXvYqz1+uN4e3Ih8IK72RpE7uJUloQIFTXznGy8kaAypBy8X/PEODddYscikHDcaeojiUt2pj4//IiIs7Se/lmo8RM=
X-Received: by 2002:a19:750f:: with SMTP id y15mr1121022lfe.74.1558698720606;
 Fri, 24 May 2019 04:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190520083101.10229-3-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:51:49 +0200
Message-ID: <CACRpkdbWCbhCdrbUueC9Jv1tJQcKiu5OaFfAqyMhKmEK+nH+xA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: bitmain: Modify pin controller memory map
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        alec.lin@bitmain.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Earlier, the PWM registers were included as part of the pinctrl memory
> map, but this turned to be useless as the muxing is being handled by the
> SoC pin controller itself. Hence, this commit removes the pwm register
> mapping from the pinctrl node to make it more clean.
>
> Fixes: af2ff87de413 ("arm64: dts: bitmain: Add pinctrl support for BM1880 SoC")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through ARM SoC.

Yours,
Linus Walleij
