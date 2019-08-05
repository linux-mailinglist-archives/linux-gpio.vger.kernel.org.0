Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384F88183E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfHELfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:35:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32778 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfHELfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:35:50 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so57777226lfc.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PA5LKqLUZg6N/15oENr417+maCymYksiJN1leg5uDv0=;
        b=bK1ttl7iKTWceqtx19Sa/7+DM3zapBwSA9/ODu5KX3kw1ViYsxO9FzDhuFhtu4Aj0O
         uvOO4Lr5/qCu/BnfldETVo9wEXNSTiYLl1E6BI+PA8iNoaCFM7V4mLGiPtDueh/7QeX1
         0KZMMyDinoMb5DuxX91zavTTt5WuGGXQRBP6AZxT9TjOHQsMbwofrPVhJU8A1JtJX22V
         hUBJx7XXThV0mbzKr9FWPaVVLRtElVwiERrWn+ctopnWdVw+kUrj/vsas0MNCrA+3pe2
         T+r9Qq6eoZVNJ4I3L5I0e23wL8LCzQLzqDETEUxcMTYet8+SfCKJ0RBJpbh8sXIMBiFT
         NX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PA5LKqLUZg6N/15oENr417+maCymYksiJN1leg5uDv0=;
        b=J4b4daFYqDoeZV3I/W91jzCDCQLXIZNlwH9fz6iNLRBz1ZUu5x2PVfY8hY8ZZKatMK
         qs4af0iImcvpS+wkBQA2X0idqWTlcZlgVChM2a4Ktb6x1uSF1q8w6ANge1qaVjVJAqLq
         AQ7I31YfBnAhV6ZLHp2hX67SbaEcbS1UiCAUbZmZk8vMAYw4ngrc2nIaUXNDZUYxYI3q
         /R6FS7uXjKLnQzy7s5XsJRf5qtBhxETQ/tgcQzns55cEese8dQhoxCY47q6QMo6feK8K
         qmENFMEl/ng3zMMQ4S8sdWTy3n1ZpOn5Ziwhrv+djuGtNbD7YEEc5tH9QWDxtRC/oZgg
         l/9g==
X-Gm-Message-State: APjAAAX+qbsNuItOsu9lRbL0Xb0WDtKJTLvO6hxtxsQ/o7agVSaS2t2v
        X1NywXxc4mZpwWO+SOagPJyg0ycRAZF0KvMspT6ARQ==
X-Google-Smtp-Source: APXvYqxpziKgKxkC0CLx9svUiuECS9qp3k4Ke29MQa+w28OfxT6UG3D8k/lLoKpht7+O8PeX6bA1nQoVqBuP0bOPSsc=
X-Received: by 2002:a19:e006:: with SMTP id x6mr69629944lfg.165.1565004948937;
 Mon, 05 Aug 2019 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190801100717.23333-1-rnayak@codeaurora.org> <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
In-Reply-To: <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:35:37 +0200
Message-ID: <CACRpkdaoOuyUmysb3OmErbLJ6zZuHGGt7RRzG9wULDkg=hLCAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl binding
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 1, 2019 at 12:07 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> > From: Jitendra Sharma <shajit@codeaurora.org>
> >
> > Add the binding for the TLMM pinctrl block found in the SC7180 platform
> >
> > Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > [rnayak: Fix some copy-paste issues, sort and fix functions]
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>
> Patch applied with Bjorn's ACK.

Ooops there is v2 and even v3 coming, OK I wait for v3 and
backed this out.

Yours,
Linus Walleij
