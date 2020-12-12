Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89472D838A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 01:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437827AbgLLAnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 19:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437795AbgLLAnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 19:43:23 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931A2C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:42:42 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id w13so15872490lfd.5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 16:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JSeQxyyLK0Dk77OSQFmi+qaj29cbpZTyl22M1kcfmrA=;
        b=UmMWRCoe6pF/vjA4dWtgAZ0BIY0yhp8tXZlJSrp7YWFPsz62oDIWfBbodQ4a8mrh8c
         +fV188G+4MPI8sLjU8bUpFU1ESKnBKdLherNOuteRqhr98m3MEDL+q2OebA8gllbgcax
         3mUc27fuYOu1yzENRCQTRNBcnP/17XDpcZb1K7drRzyKxQU9zIqy3QqWTTrjvUlyBmA6
         Yw1pfxtAJVVKYdzezAObx1XuqvzfaqGYdZeaqZNwHIC/ShJB/wTzWyH+fQzN4FtAU60y
         Rj9UC3HRtcDHS+M1B+ktFzBSP6Nh1Da0v9zMjxqt0iR4zkxdGhlNqcZPiuzJ1AZTTfYr
         rwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSeQxyyLK0Dk77OSQFmi+qaj29cbpZTyl22M1kcfmrA=;
        b=bsQdu+L45metIIi29sJSED3QIe6Y9BLCIG/ty2PFp3NlvepvUXBcbfY5JhFYQ5PPsZ
         rnd9CLSwk9lZOGSWIrWEMzLnPYtgSIBfqqfvv6b/lKGUmszAUp0RkZaLplNiRnY48jxP
         QvBafxjkH9QoDnGjh5e/WzQuKsdHkcOYikE/uf67IqVCf8Cc+URyD+UNRxKVkvv1Exa+
         VizpYa0mLMYgHo6LPNTo7ruLMme4boNb2lZOM8vXO6D6BSryb9RzP7V21nYNIRUHqJOP
         XTCp4x1JtXG2sg3kFXxcJRK8n+gpcjdmgU30alOM15AH0piy2sr/oQxprrf01jdXDRDa
         4eyQ==
X-Gm-Message-State: AOAM532dEZOcnZwJVEKvZ/qB3I5q5PwvspfpoWFZnDwpE2IZRwWsDJia
        ln2ep7UgCenCI9DYtkPfdo0CeRNQdVNsKm+yqFiZeg==
X-Google-Smtp-Source: ABdhPJw7ohYOdmTo2QhObVg+jdtBqsCg03Az5b9eew3VpL5VYdjdPUhuKfaVeuiP/SE0hYFmuHVoqtNHiHuoa2UP++I=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr5744709lfe.29.1607733761006;
 Fri, 11 Dec 2020 16:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20201210135746.1492-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201210135746.1492-1-zhengyongjun3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 01:42:30 +0100
Message-ID: <CACRpkdaM4vU+iEqXYJ+u1w=_FKmt8mmGUYdhENv3ggGp5LrHMQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl/spear: simplify the return expression of spear300_pinctrl_probe()
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 2:57 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Patch applied.

Yours,
Linus Walleij
