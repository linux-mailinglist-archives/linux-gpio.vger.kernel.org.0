Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76AFD5F413
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfGDHqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:46:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35915 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfGDHqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:46:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so5189992ljj.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FbowtTXJF3QFhJ+0g3CanF/mErH/8mwP+8HtXFh3lcU=;
        b=JJTwPDrnOaJhqi5LfDKpVC6A4J6s/xgYjGmVsxsNAfBJx54YwIp1Q5SEY5yhOS6m8F
         l7JwbLFP41q855m/5ZZVp45EX3qVmQfsBZfdGAp3wbCjRHhG6IEmMlCDwNnVpHCrCrcA
         MRa6MP4wchKhRQy4C1wMh8mO16q/YzH3HnzGm+0vyPLMDWsyVC4hFcxhl6koNh7W/D98
         Msw/H2o7jzcS1Uhr3wmHJMUuaiPgheSDyjPC13FX5Q/s/B3OR9V5g7QSkJxXLtnG++hv
         JVy6fZZn1uHAr6KybCjG7j0kxx0v3ECcED7PJ91Dp0NlKSmR4tuFyFGYKVm4Ark/kZ+M
         5lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbowtTXJF3QFhJ+0g3CanF/mErH/8mwP+8HtXFh3lcU=;
        b=m1Pw+O1m6HYftuy2FPajcZMgeLYeJe/9G3HLhX3csOXX82H9Q68cXC0fBn+mtUKzic
         RX2YvOQq+AvRv+/7RS4nTrokJMdiV7lEhrAAEaWTQ57r1w9s5+2MZhb/18a4vdf+j34j
         c1raMu0PcA8nifdCrq9GEeWpVonyLqDVKN1gauJshfR8hJpWLUHw9MvUtwdCzo0LYfYo
         xQB+MrOuzBYBpCaQJXBdRXyJitlNlhMHLSLt1PzDtzGXIEj8ioEjP/VTQqwMxyHJBdUR
         8ao5Ozp0zA8/rOtLkVMSQnw/7lrP0TqKMp8xZiLGDTbg6+CkL6UtehYDz3Cgqk7J5IFp
         +C7g==
X-Gm-Message-State: APjAAAVdiQ1Z642A3GOevoynjtAN6A3O9X3NbZGF6iQT4hIJynP8KCCs
        e5K4Ms5cYfiXio2O/W12UVQDYpXkNKaViIYXtxMlNA==
X-Google-Smtp-Source: APXvYqzqg5P2vMEvtlnyJnlnLPgWS8atGO17WX4nId84bAvMCyKUN49Rj0v1zHwWQYFxM9dFj68ZveRig2GhLolmJSQ=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr2128406ljg.37.1562226413734;
 Thu, 04 Jul 2019 00:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190702105045.27646-1-vkoul@kernel.org> <20190702105045.27646-3-vkoul@kernel.org>
In-Reply-To: <20190702105045.27646-3-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:46:42 +0200
Message-ID: <CACRpkdYuhUNggeVQ-urVKkV-Pa64zy_hJEb5d3wJ2K3MvBQB8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 2, 2019 at 12:54 PM Vinod Koul <vkoul@kernel.org> wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> Add the binding for the TLMM pinctrl block found in the SM8150 platform.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> [vkoul: add missing nodes of gpio range and reserved
>         rewrote function names and order them]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
