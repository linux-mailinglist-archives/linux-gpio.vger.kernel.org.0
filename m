Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D32424202A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbfFLI6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:58:32 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:44570 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731313AbfFLI6b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:58:31 -0400
Received: by mail-lj1-f173.google.com with SMTP id k18so14367888ljc.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PKauJBPQOqxGtVzNuf3fprEZzBxC6KXL4WG2Nxgkiks=;
        b=nnx+CuUK3eR2qMPr6GAKKvG0mkxPze1gLGjt+fq4RsDs4UUOoegAmM8XnLC3fnGQgW
         GTyqhslKNfo/iN3MHt0Zkvz4IqfR0N6rbMucbW0h2QpKLOE1944ZRLyzomjSZPncB4oB
         JdxHik6NRZooJbbcRYM8KsNh2VMSsKY6Br4iawfVt6D/w+eqx+VC7seuAfYo8l2rkyNY
         n6E0NgG//tOXiD7O6bo+tDyHU269Jh7/rKJm27EMXHQ4E4e4uoqiXyod6YS8/FQRssQq
         RxZZWrIoYGP/LrZaJcCtp3zHGIRLVAMIifqQZht5xZ4udl03rTMJAqgboklPlsWDanWr
         rwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PKauJBPQOqxGtVzNuf3fprEZzBxC6KXL4WG2Nxgkiks=;
        b=FXEtHSTNI3QG/7wFAXLppEWQLoLiBjRjD9ZnwyUAL+BvqP3+7rB0KNcmfQRGW4Xrk1
         zo5h27570/wViRgyv+kYsviaphRQBTjL8+mU7vqzwcm1lqwuxRILfRMoP+DVMCcCD9bN
         mhhUUoH2pvxkPLS+4+WO/dbedOQMmcUoQ979CPj/5uEuEPZcZCgpLmn582hbnk7pc1ip
         TBByWd+KZCQKTWYy21geteO5f6TFvio3uCgzncr2M/wySAvwR9HSrvZrun6MHEB2dsXr
         JGg/UN3RiRu4t0XBeG0yM9lUBRb4KLoF1P3Yq4pxvaHUsdJIpwUwoTWLdXATKh5UANr7
         +49Q==
X-Gm-Message-State: APjAAAVn/ticXRC5B/uO2dUK4yF5xznf63QLp3Hmr+O+6QyFuhm2pJif
        6rLSWUTg2DL3hLPt16oqEzFl821v1RzDeV0c9/3q7w==
X-Google-Smtp-Source: APXvYqzAY9mtYPmypf1H3gmCAmSQiLenTibAeELDBFfuArXscCYTvhyZ71qp7kWngsG+U17kzAzSUBBfpqdbrkoZuoc=
X-Received: by 2002:a2e:2f12:: with SMTP id v18mr42095554ljv.196.1560329909819;
 Wed, 12 Jun 2019 01:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-19-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-19-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:58:18 +0200
Message-ID: <CACRpkdbELs-gZVeCCnFBaXOqzWQ74E+SF2ZCXOy4deGA+Bx9Tw@mail.gmail.com>
Subject: Re: [PATCH-next 18/20] gpio: gpio-omap: clean up wakeup handling
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
