Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5109015D615
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgBNKxD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:53:03 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39163 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729026AbgBNKxC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:53:02 -0500
Received: by mail-lj1-f195.google.com with SMTP id o15so10212154ljg.6
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dmXBxtcRLICtzwgZ3OCHwhlAUoLlqfCjRdgQsoa3cQM=;
        b=i7P4JHQYzbWgeDCH/qEsnhVGFoNbR8YTsibvLQ5Gz2grZi1RnZHO9d2b0J8i0pX5kc
         hOHxGfP2Y2jKoYkVrmvJXaZmyj8cJTtYz7pEQxx64WbdQ0iiLlctTf5gstYQq9M+E+MM
         wnYmqwClLsuf2Jv6lxBhUSQwyd7/VQrMaRaaqylVKJOa7FSjyCeEU5ctVuLZE3AIwHh5
         djSSlOBcCGWQ6Rb7AL7MkIwPAh2KFnrPHg9SifPU1lZnlsnUO1Ja+AUwWTQFdXyiLm06
         mtkMyKPOHeUijUT0xuW2w/Defz87HWQgvFMVaZnmLt2SZ+NYt8QX+dSmLSgF06QMQlo+
         uRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmXBxtcRLICtzwgZ3OCHwhlAUoLlqfCjRdgQsoa3cQM=;
        b=hkGm2FPyy+0SEEO6p0l1tj5rvlBV/9TdXbQ9Mv+1K0EIHuF9gb/sKNpScw3yLOsu65
         tf8HfzLYWMPjn8ddMy+G3Ptxnb6s+2HfJB3Y4Vu3hnnX79TYeDYec+3glbdLyuzML9Be
         4KF4IphG3fk2mT2tI6Soo+/j4I6Mwf6etSgaTA9kKGJd5kb6AO3hUXlXCObJm9x4qElp
         pCwtt4JfvnhakEHDcSelUXDgX8xkp/1cGqjjWZcOxVKXm/HriZ0OAxhGb6D4MGfYt+vR
         nwfpweP2RkL24bO/88WB8UZLfAmhfUtGJpdXlHskMtG89b9A/Rcy46IWDqOUFGpq5BkM
         +UWA==
X-Gm-Message-State: APjAAAVAdsx8pG+rAcD6xx1foL1PflVwXwGGYi6lG6EAPpj/2vdZ5bk8
        THYeE5V0pr2qgDw8IdOEFUqkLRSu5fC1wSIv3DU9U68vhYw=
X-Google-Smtp-Source: APXvYqzDSVkecoiUG64A0GYLEsyhTMtqZtiidtYileJhxzBLZH4QpmSjW/RAXuiYfw8zcj3ACEkWgpbtT707QMjX75g=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr1672900ljq.258.1581677580442;
 Fri, 14 Feb 2020 02:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20200128154949.66521-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200128154949.66521-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:52:49 +0100
Message-ID: <CACRpkdYaySh+3FoD6bTsUEDDvNERjA4XUaM1_CPR4nvMkPD90Q@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Sort entries in database for PIN CONTROLLER
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 28, 2020 at 4:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Run parse-maintainers.pl and choose PIN CONTROLLER records.
> Fix them accordingly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
