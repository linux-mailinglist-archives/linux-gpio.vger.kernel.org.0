Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5A27821C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfG1Wn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:43:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45519 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfG1Wn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:43:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so56581605lje.12
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVgUrXXh1f6QVqV+7OAZL+r7ZQvDOZk6g4gSpdr0TXw=;
        b=V87tM4AoDeEqkOmFTOksnqU/8lf7niD0zMiaWn48Tytv/7YqDI/GxXF5P/3dF3dK1z
         F7H0IhtVeEYo4ZibuSI+TZce3thmsrff+u+Yow1jmb3b1ElTl0d8wpFhiIWWbL4yeg8U
         DiQA7nTU47BC2zbDUc5rVVEYvEnZFIUerQ092ZrorrC/8VJx72LyBu8PdW0emtn2wcSS
         K6KdYK6S/QSvIDftMJIztdrx1D/SfwuDaEkk4ESig5pwT3yXpVtu8epDNz8T1dljJDd6
         SvKgo/gCoPsWyPPoHq0+Z1RTSi9aV2sdfQa8yNnx+1zs1HeH3loo7GDjleT0aWD7qOV5
         riBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVgUrXXh1f6QVqV+7OAZL+r7ZQvDOZk6g4gSpdr0TXw=;
        b=Ru65lgWCpM5ereyW7/MKGB/gh6XRn37IM4u3Ni87N2IzjfHIwCX1v+Ueo58n9/OTRu
         zCPpwefkCFtwW14ASBTMBQ6N05MnWtEnVPdf0BpXiHqPdIkhATkKw9KoDgOsVZ/+HM8S
         hWbXti76CafjZyjOM0FVx48eomEqjdLyCUcqqXugnXdqcFLgc45w2ky81ZaTSkc89AkD
         XWvdQ73Mq2obb94ILpz89qowsxclp2eptIKT0ygBL5LBScHVbHt3gdr6mtTWGUO8WcHG
         ksZiXHepY86Wrxnkrv7T4hG/CtcJcmVnJ+AnF6MD3IS7Xc2EQar21L3CsRYc6H4DUFOm
         ftzg==
X-Gm-Message-State: APjAAAX2p/1k3vRyQjAs7HM7qhrhu4E8LAkDrV0uQ/OTdNsStwKXo5Yo
        mjvkwDdScMXB6/XS0il6KF6uvw4rYsJB/YCpf84CHg==
X-Google-Smtp-Source: APXvYqw7QgNS/wjVPvNuLLoEC5Nr60MshVyqHQ94alNNSjy6TL9nljAoTKUGljH1nhW167wm0rlnUMQ9lQ012H6vZIY=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr8094434ljs.54.1564353804766;
 Sun, 28 Jul 2019 15:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190724083828.7496-1-linus.walleij@linaro.org>
 <20190724200007.GO7234@tuxbook-pro> <20190725151603.GF18620@codeaurora.org>
In-Reply-To: <20190725151603.GF18620@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:43:13 +0200
Message-ID: <CACRpkdY=LdfOMc2Cnw23hZA5-WZ0trFewSzHGyq9j4soNqtPTQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 5:16 PM Lina Iyer <ilina@codeaurora.org> wrote:
> On Wed, Jul 24 2019 at 14:00 -0600, Bjorn Andersson wrote:
> >On Wed 24 Jul 01:38 PDT 2019, Linus Walleij wrote:

> I had something similar in mind [1] as part of my series reworked on top
> of Linus's GPIO hierarchy series. This patch is not far from it.

Sorry for constantly doubleworking and stepping on your toes here :(
Adding a Co-developed-by: since it is pretty much the same.

Indeed the hierarchical irqchip will need that the set-up is done
with this contemporary method.

I will try to respin the hierarchical GPIO too with Brians changes
so we can get that merged and create a Perfect (fingers crossed)
base for your development.

Yours,
Linus Walleij
