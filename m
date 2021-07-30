Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BF13DB6AA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbhG3KEC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238425AbhG3KDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:03:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE49AC06179F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:02:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h14so16791383lfv.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrQFmPSsOocu2SRwmrh+oMoqHYk78zWUjrW9sn+KFu8=;
        b=oYxd3h6+XDaGKJsgHhkayzoJMa7ogz8odwMrcV4t1ibAg04dNdvJLETsYmmfrkSseV
         fxC/+cc/g5SPKMCajUrG9GAdrHha0IDA+oh25ufXCtSGPbhjJgS/lHTfN+PWvDaNZbAd
         YnUOJSt/covDyIQWEoSx7UeltkeZ1gsyidlXfXeH+PC/MV90c2nV+3LPejmS+xIfmF5X
         j6bKumV6Vc1tQ98o7B/06dQH9eO80WArYKzCamWiSFuOQSDmSDIToN9zLD405Invsy4z
         YT88a57yRD9YucDPaTPDdG8Kr3ogscFeED3zOjI7M7nSrQz585OFskj4YIGXGgezNdZU
         LTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrQFmPSsOocu2SRwmrh+oMoqHYk78zWUjrW9sn+KFu8=;
        b=rh6wxj6emZgAWAr2Rmk+dcfW7kLjAYIb8nr5rSkOUpg9bB4W6TMPB9FJxZeiFWy52r
         BNHzcLvJjXx7F8TJi+lt+B1UqPBDPX3I00MkwK/MgUd21fCIrU0X7UD/r+yjfwZC4oRk
         qVh02K1A1PQFuk+3NVJqhJD/RPrCvCLoYivJRoaYc1pPlys2a8gKVLDefrq/MfQB3tB/
         THFuIdlrD4PGCD2gNx3fQzJeXgG/rXXEYM84ZnLOkaq70rc74WYwi9JfRxeb542HNwxe
         28RXhrRrrnQx0wskVf13fktV9BdNFV1PPKBU0b14CRju3OBF95BRrFwt8h2BNU0T1UYV
         9WGA==
X-Gm-Message-State: AOAM530JXamc+ZKwKAQa3k/5UfZcU2VtX6WWjsFxyZCTKke1F4UFHevo
        4zOChENTiGtGk+dQsQqQ68a4ONjsos1RySzY9q7fog==
X-Google-Smtp-Source: ABdhPJx3kzOTrIVzHNFiv5EZ/V73fXl2Hn/oaV3vs0g/lVAyoet+DXaSEX4BPoAvgqkaX+OYaNJkKMx3tMkX3MJDMq8=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr1253533lfh.649.1627639343457;
 Fri, 30 Jul 2021 03:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626987605.git.quic_vamslank@quicinc.com>
In-Reply-To: <cover.1626987605.git.quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:02:12 +0200
Message-ID: <CACRpkdbqyi93Ncr4ANCV4ZVeZzNMMxumTJ4byu2vFZa=_0WhRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for SDX65
To:     quic_vamslank@quicinc.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 22, 2021 at 11:19 PM <quic_vamslank@quicinc.com> wrote:

> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
>
> Changes from v1:
>  - Addressed all Bjorn's comments
>
> This patch series adds pinctrl bindings and tlmm support for SDX65.

Looks good to me but waiting for Bjorn's review!

Yours,
Linus Walleij
