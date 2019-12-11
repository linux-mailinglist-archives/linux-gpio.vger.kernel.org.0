Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2176611BAF8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 19:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbfLKSEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 13:04:15 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:36800 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730828AbfLKSEP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 13:04:15 -0500
Received: by mail-il1-f193.google.com with SMTP id b15so20283507iln.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 10:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lk2kHwOIGMIgDPaSWiDXXQawNgoxO/02PTT5MTHKBSk=;
        b=oBg4iX5BFblswDGY+ml4KpSu9P9MZzXv04sTj8aWJf/VNEZfCNpb1QRgyiF4L+TAhq
         vRmS0y1d6uDaeh07IjDEuYCwYKbW/ysvqPeXzgbvXkAczQYlCltxJedTvXM+OTPEFvu/
         XneacJuDxO1F0RmpEFe5D17tm1Gpq2YxaFOK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lk2kHwOIGMIgDPaSWiDXXQawNgoxO/02PTT5MTHKBSk=;
        b=rvK9tTWRtm9v37gQBIy8TAeTlZnQMTbb6gNIzatCe+HKqXu6jjdiGzXuLP8gfpTd+e
         P0f0PtTfgZaAGIMKHCblT3FUse2CA39ttzL6myBB/UmtZboFqVTEOOo7mErHII5mN6NI
         duGBNSje7zjvBDfSXSpdCxM3+qGfhvbYG0tLpagZVVeADDJD8xDY2C8Agy0DWpo/D58B
         Yo/aEOP+7qhRcccMAc1+5AjMQfDO20n1hYwWoTr4EhqRqcrw8+g9iS7v39q8j1q8WcmT
         f2VYexiYPkKpzADVpUjWejOrR3NP9aRKU6bvS+7Xihgf4GQBZ3iyQ+X2M6AgGgWEGsJN
         v8xw==
X-Gm-Message-State: APjAAAXAOCF2Nhh30uWYj5DzubATg4spN3adOezToz1phkoJOgi6ZsA6
        ehCd+KU9PKjMSIL6E8FAJlQ1KSabeP0=
X-Google-Smtp-Source: APXvYqwUAXYP2Bw3zXRZBiwH76Xn6q90SjtsIg3MKewPP1rbKt6Uad6irPkdaKWVLys5l/mPV7CaiA==
X-Received: by 2002:a92:d183:: with SMTP id z3mr4121301ilz.214.1576087454832;
        Wed, 11 Dec 2019 10:04:14 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id q9sm658852iod.79.2019.12.11.10.04.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:04:13 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id a22so8664233ios.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 10:04:13 -0800 (PST)
X-Received: by 2002:a6b:5503:: with SMTP id j3mr3620512iob.142.1576087452757;
 Wed, 11 Dec 2019 10:04:12 -0800 (PST)
MIME-Version: 1.0
References: <1576041834-23084-1-git-send-email-rnayak@codeaurora.org>
 <0101016ef36a9118-f2919277-effa-4cd5-adf8-bbc8016f31df-000000@us-west-2.amazonses.com>
 <20191211063829.GC3143381@builder> <0101016ef3c8e061-462507db-9d6f-4ead-8740-73b08ed97574-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef3c8e061-462507db-9d6f-4ead-8740-73b08ed97574-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 10:04:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHaFYsqt+3-jgJo8JWKxfRvgR_D-qP5e=TGq8h_f43EA@mail.gmail.com>
Message-ID: <CAD=FV=VHaFYsqt+3-jgJo8JWKxfRvgR_D-qP5e=TGq8h_f43EA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7180: Add new qup functions
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 11:07 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On 12/11/2019 12:08 PM, Bjorn Andersson wrote:
> > On Tue 10 Dec 21:24 PST 2019, Rajendra Nayak wrote:
> >
> >> on sc7180 we have cases where multiple functions from the same
> >> qup instance share the same pin. This is true for qup02/04/11 and qup13.
> >> Add new function names to distinguish which qup function to use.
> >>
> >> The device tree files for this platform haven't landed in mainline yet,
> >> so there aren't any users upstream who should break with this change
> >> in function names, however, anyone using the devicetree files that were
> >> posted on the lists and using these specific function names will need
> >> to update their changes.
> >
> > I don't think this paragraph adds value to the git log, but the patch
> > looks good.
>
> Right, I should have mentioned that bit after the --- so its not in the
> changelog :/
>
> Linus, do you want me to resend with that paragraph moved below --- ?

Personally I find this type of info useful even in the changelog
itself.  Without it someone inspecting this change would wonder why it
was OK to change the device tree bindings without an attempt at
backward compatibility.  I suppose they could always go back to the
mailing list and track down the history, but why is it bad to be in
the changelog?

In any case, if everyone hates it in the change log I won't stand in
the way, so regardless of which way folks go on that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
