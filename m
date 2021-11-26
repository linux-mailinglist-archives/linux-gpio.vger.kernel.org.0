Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A683745E3FD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357427AbhKZB1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243939AbhKZBZg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:25:36 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3ECC06175C
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:22:24 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m6so15845451oim.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuogPhCIrdMIXK39LxLYKagPj76CP90ZaXCX1cv9amU=;
        b=FCbPn/aC74Fpmi8E4UlFo6hYpkm0KZSY8RA3nZRidNzko8tPVxlq0siNDoY/PjhMWY
         +tkvfhiTnO4S2B2PJB3cCrCWXtw0AgsvU0NlHuqL1c479BLJenUG1Mw7qm4FgovQivdd
         m5g9y1DRmy2NTUSh+6K4eqeN6DmIbiWUiv4mEhhN88forW3vYvceEYmMVGhI+5coaEYn
         RS74wwVAgrj7OahokEpJ83YtktWLU2M56wbWZL8hf3zns4rPh9aSAe5XiEleZNDuhp2T
         Bl/lYudQsKMRXq5w8VdaZLSPhZroOqLXJoQUZnf2Ub5z9JBOPRcmv0lI2hGElRvKyR00
         f+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuogPhCIrdMIXK39LxLYKagPj76CP90ZaXCX1cv9amU=;
        b=jhtCKS1H/lFt2eqOHJsbA8nyoJenMnam9J/Ot9YnkkQ+fwWuLRaP/n0g26Ip8xgT9L
         A8i0ATEvK1Am6Vce0vr60NPGywcymwtbKft1alUWgcpYFchVaBTBPZXFa0CM5DkEO1K5
         IV6ar3kVfJAB24ruESpCrjIQ2ViOW5+CriTQCsFS+RGoZuR2H6RjLE+Pfysz3t4eGna/
         DO+mBn+98Eb/nqvdpa+CmWuHfClrAxsfgO/sibRGvewSHz31BjLbt7cVZc1AVJPdY6rc
         sOl4PgeFLbGBn3bOdJz+ZI7dyKTFZbf2BoPfbeEX5IIMTHokcEhz72HOpXdpLVLE/Xdo
         YfhA==
X-Gm-Message-State: AOAM533LtzWvWOvAHSXdGMNm5GV/8iCPZeh01SM+wxtuY4l+PCCtnKN4
        Ob2AY5TFfHOoklbFdPqDZPi1JFjqOOACi4WVnpvEGQ==
X-Google-Smtp-Source: ABdhPJzXRZ+hFzrCAc/CnvRtQFmXfAkjddGUIIxuiIQENVtM9MrI/+32qI/f5gkye0w9e+g0pyXVu7oBcPzBMoQ/S/g=
X-Received: by 2002:aca:120f:: with SMTP id 15mr19675974ois.132.1637889744184;
 Thu, 25 Nov 2021 17:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20211125152043.162655-1-geert@linux-m68k.org>
In-Reply-To: <20211125152043.162655-1-geert@linux-m68k.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 02:22:12 +0100
Message-ID: <CACRpkdaFBOq4-Pok3au+Q8uAXe5QscO81JYAhXwMS9B2FjuUiw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: sifive,gpio: Group interrupt tuples
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 4:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> To improve human readability and enable automatic validation, the tuples
> in "interrupts" properties should be grouped using angle brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

(...)
> -        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> +                     <17>, <18>, <19>, <20>, <21>, <22>;

Tuples? Hm they look single. Like singletons?

Anyway:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
