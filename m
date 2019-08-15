Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B398E5EE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 10:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfHOIG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 04:06:27 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:42409 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfHOIG1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 04:06:27 -0400
Received: by mail-lj1-f182.google.com with SMTP id l14so1493538ljj.9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 01:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73F1RWTjtoDH0YMurZwyReUOfFqcGBxxzX2oPyGi3d0=;
        b=lMiHXhJpRPHG1x8vW8u232vchz2Cuc55hAUrL3YOhrh8InmYnfkZ4g7+jtmmV2xHCI
         Gv9O6svAQLbUVrqPApaRtbPnl/IodjRI+2N97py5SKlpFiGnitu/RA2cO3LNU/dvyAEr
         OsiQUShIgJmUGfLlmvuM+Tjo2VfgHbWgiuNQ3dJh1aqxmeJ5D95AZ40hVZ7wC5EHNgK6
         DMLGW6NKgUNANy6xwWAWyAV+IZxsGREcuopKQxolsR+o+8EhC9IUkvy1cTEaaWRZ0ZdR
         LY3VhYjYj1mAkVWkutrgih78j6Dgql92317dhVALxkw77rMGz9+Yf8FRaAiXa/8K3B6D
         QKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73F1RWTjtoDH0YMurZwyReUOfFqcGBxxzX2oPyGi3d0=;
        b=mDnnCQy5HUkjw2P77ApUC6iXcU5TpdDyJkZkQwNN+PKovxsuhl+7+xF/9dEDkZ9aSj
         RK9yBSdYvXFc6bky3SiRArVeZYrvjF1R6DiPbVwZ7vNfohH9VX4w8lXE9bzDP8+413et
         EWEzCi3StUs/+0HMOjcRXy2O3JIT8djQobFLriTTP//XsC6cXR3v+KLBTkEAaDCNhXF4
         K+IKG0CA4tCzsQw0N4M2ANLa5QY+qxfhD0CgFiXO8nXmOb1hKrZ2lNeIh8R+cnes/E7j
         Ou94aZ/mQVahLRR6dc3XZ9vdrReNF4htEltBEJaVlVBK6z2VArcI6TvciUCk8WLQwV1I
         khUQ==
X-Gm-Message-State: APjAAAW+vf8ZWau7rEDYjZfAwTW284fo1t07wypyURrMaPCdfR9t73E0
        Xq8NC6Q/EpQPtNpSRHdsj71qzomZZWwoMSoEjm0M2huvofI=
X-Google-Smtp-Source: APXvYqw3rJeoSfx755V9bsRR5yXrH0RjTgPnUjgpj0XwOWqTa/LR+7nJn4qE7igk6LtdoQI/6TsLrDjnihMw+Z23WOY=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr1993712ljc.28.1565856385593;
 Thu, 15 Aug 2019 01:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190813135053.GA30120@smile.fi.intel.com>
In-Reply-To: <20190813135053.GA30120@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 10:06:14 +0200
Message-ID: <CACRpkdYhF3GYjqp69z=uMuTuRGkDdnRp4Dn=d1rtYR79XFp0YA@mail.gmail.com>
Subject: Re: Intel GPIO / pin control repositories for next
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 3:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Can you, please, include the following repositories for your linux-next bunch
> for getting better coverage?

Excellent initiative Andy!

When it feels the branches are solid just toss them over to me.

Yours,
Linus Walleij
