Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA4F4B71A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 13:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfFSLet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 07:34:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36285 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSLet (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 07:34:49 -0400
Received: by mail-ot1-f66.google.com with SMTP id r6so18916388oti.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2019 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRJsEYMCxjB/gQmt8AuT+dGCwVbVNWbR34Uqa5PFHNc=;
        b=uvvJ6rQGY+is/2WOoc+TaiQfocmKFXSueUKUbErRcEGulHR9krcQw2bU6UimtemwP8
         zVc8MPxJe5j39eMsjRfY2XzY0d0+FAYlaltFpmQ5nDLp+MUsGlGJuKOMbWaGpDwnQOz1
         tei2q28xx1Reh4dudfFm6a+llFMQMOOY6gqboPKeAthSJ9U6lrYi0wVt2p4/dK8oBBbb
         dWyuNdumCx+X0lLEwfKl/FzTB22lWjc9+iUabFgS8jKrReTDHcZ7OH0Y7QVXCHIwe76i
         ISpiF2709549xZDgbq7l5lrPKPYUDlIyA7o2rFtBnZG/+a3xNtm17Vf4NxDvC1GHwdoK
         gleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRJsEYMCxjB/gQmt8AuT+dGCwVbVNWbR34Uqa5PFHNc=;
        b=PFDBFRxVC59zA22Q4nlzJ+Uh59sqTt5jyot3qS1usRio/YBfBdIH01qvZWxVUeLRqb
         6kt5g2LtZGV8WQ8k4G7taCg14M+w0kTWGZ3Sr50/BNpFWWA/JgGFM37G0T699wtz92p5
         zhRt3cJAgwUw8H91aStr8iRvic5732g9HFyVZhTVSVmAVVxgkZg3fTiomkjHlpAY2R5Y
         kttP7hXmAApvFwbuC+CyUK8ALR/pW32BoSRPVfyOOZ1EgN7qXt0qRpe2aBqHObeAtjJG
         VRtVtDOlvU1sg8QFzxtdM5D2V7kBI5GZ22Urujgz+mwzFU2VI6/gKkpwEqrXRlP8PRnX
         i7nA==
X-Gm-Message-State: APjAAAWwe8sDJNcfJtNpmyzNshpzcWaX3k8cXWykA+e5TtcY0VhWLGtc
        ODWZo+jbiPUdxLg6dEjjleJbXZs6tIC6eOEY9TXdHg==
X-Google-Smtp-Source: APXvYqxoNAySE1fcoRZVkDaS2fHorMGb2u+HB0o+Gefw2u3xcm9sT8x6X/jnWHGXb08ZdcR4xMdOeQSCmvU8ioo8sdE=
X-Received: by 2002:a9d:1718:: with SMTP id i24mr50671024ota.269.1560944088861;
 Wed, 19 Jun 2019 04:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-3-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-3-git-send-email-info@metux.net>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Wed, 19 Jun 2019 19:34:37 +0800
Message-ID: <CAMz4ku+3A=fcYpp++owPv8N5dbatHYTKNRtUiOrHqbXVONRn+w@mail.gmail.com>
Subject: Re: [PATCH 3/7] drivers: gpio: eic-sprd: use devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, 18 Jun 2019 at 00:49, Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Thanks.

Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

-- 
Baolin Wang
Best Regards
