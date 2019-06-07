Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D2A39964
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 01:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbfFGXIb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 19:08:31 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33099 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbfFGXIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 19:08:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so3118940ljv.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=FkVCVtLwoVP2xNToV3V9nLLFBH8qK0uahCMEKeFCpaR2z9IF0rpEg8YFqnUmGXZsgq
         DfvxttPbgwKv51MItse2JF1YQ5TsRI5GCwNHRb9IYez7H3NYfXRNHgXB0gnp2gTndxNB
         LwkbDBxTrRmHrzyvFF13obVOy9KBAFVFFzTocL3+JUOgAFqMpgZ+U41+ABtrRyWnIodz
         eqN5ctPHY09xzgpkZFV2Tez9dxUvSL4e5wfFHFtt31VxWoUedzV9qMV9ZKUB51qacrdz
         tTCqV/urQYCK3kC4ka+GuQTTXl3BE0wjaSiIPmANYwxUqfk3h0q8w6gczsAnBL5+4gOe
         vC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=JjwcYZcJ+F7CSl3tqCJ5kx6zjffxdjksklOyYiCHqu59ndaeUQA5QnUItc+I1YEgN0
         clpwNqJR53tzlfP7i4GijJdsY130A90iI+C5qaWU9RelR4iENW5SAGFS75Qf61Av/05f
         VIgXLVshCbR9rnuVcvxHpG7e4ncsnZk8iIdY2ifLYadFND9wnxmKRYiQX0DQ3K8N+2dx
         kFs7Jl0Hf7XWAH82j5tILCVMHcHHF4YZ5YsuEsxonm6vD8AE5cXbUGwIsXZHD+WihHQJ
         HBsqvNxWavWpy6Gn+ECp0jAub2wffFTntUXBZXwEYqrbQvVwS+TvlX35odDpswT7jnRS
         yugw==
X-Gm-Message-State: APjAAAU7TKz6M9s7sXts9bS69hx27agrrhF6FeOTFas3YIUmk9PBrqlX
        vE41jEBWPvgt8r3lgfc6Jf8Q0pftIV3YtlL9k4SQLg==
X-Google-Smtp-Source: APXvYqxUOi2ComwroPYJqL0+HmrxnRaNzTbxCzwrLY351hzZwjGfd8PvKzmcThTDM6zJHWY6X2LcwPf0/66wKSkFxIw=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr19985474lje.46.1559948910013;
 Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 01:08:22 +0200
Message-ID: <CACRpkdbxUHR8Uo+M7+_0v77Pg6k_jmL79KeHKNzWmFhtq+mZXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add minimal boot support for IPQ6018
To:     Sricharan R <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote=
:

> The IPQ6018 is Qualcomm=E2=80=99s 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq6018-cp01
> board.
>
> Sricharan R (6):
>   pinctrl: qcom: Add ipq6018 pinctrl driver
>   dt-bindings: qcom: Add ipq6018 bindings

I'm happy to merge these two if I can get a review from
Bjorn Andersson on them.

Yours,
Linus Walleij
