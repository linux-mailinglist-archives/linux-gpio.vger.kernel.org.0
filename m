Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83689B1DCF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 14:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbfIMMkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 08:40:32 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34495 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 08:40:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id r22so10711861lfm.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ft1I1EhDI1L0SLNIAxqP/sRjQ+TDSkpzKaCR7f/5tTQ=;
        b=DhJ0J0+esdIXuLHa2dKyB3ccBOpjg13waz6LGkvKMrCNjiOg9XY2WXNAKAOHtFzbPM
         gMDd9ktyt4l4LSdETLZnNtnLXzt5iIrFgpi+g0lELJRFi06i1Hxofhu3N/QsSZ/+3p7R
         8Uppb1VhjVGnr9ycEQo+FdWI4CaAaeHorHF8U6Ei8GA9sKbyd5ikMo6eixRv7ORk/8j0
         rlO/VSaeocmEmT2TAIn1g8JUkzILeCap1hJZT8vRcgwYkRKQTU+crYH4He9STSmauPo0
         kXpR96kXUEg9ew0hPHjoD3wMCKI+og9JdzoxVYXW8ktU4rxcx62/x8ZhlU0cxL35z3Me
         Qt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ft1I1EhDI1L0SLNIAxqP/sRjQ+TDSkpzKaCR7f/5tTQ=;
        b=kzfwwrZIQNXgiSneqNBNVQ7HNSpsSN/H7XzCvX+L8gL/ikr7mUSZMhN+x1yIsq2mZQ
         cGED0gQii/PDsx12ZukhDcgA6PkpNJcAc0ZuD99oAbcRLpyCedVn+omsYRGbZL7m0sGe
         u8IOmjhUyZH9N+rJPyKveJe5qog3wOBZPexcNBJkIbUSoX1l8HWplEydc8q4kei1Tja1
         BEIBuowGVPJIiOPBwq03avqd4Z+7meJUwxZ3yARf1bInqF+PZrmOLnFSxk1Nir4JW+Br
         gmtdT583925fnbCPY+xiIKSIXkaZgDb6Gm8H7swMnNvT8QMyWQyCMeHUKy40JP6uQokU
         CvrA==
X-Gm-Message-State: APjAAAXpd3yX+VsInjykwYLitaCDLfLNQefYDsk8xlhMZMXYWJxgZJ5f
        cxM0pLkbQ82gTCFJrjuLYABLSYOjGmUQEOnnlVPe2OI3BcxvTA==
X-Google-Smtp-Source: APXvYqxZTmRAR02Om/GqFM9es0KUGaifiZo59JD20QRZ1o6rbYRiJs1AArPBBL1PDYlmiWlPOBvJn8GEoQUhxS+kdlM=
X-Received: by 2002:a19:117:: with SMTP id 23mr31578340lfb.115.1568378430947;
 Fri, 13 Sep 2019 05:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
 <1567663210.1324.3.camel@mtkswgap22> <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
In-Reply-To: <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Sep 2019 14:40:19 +0200
Message-ID: <CACRpkdZSAMmiZ6thznAR3GFSw170fV5d2=VLrs63O41ZE+x+oA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 3:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> > v2 is the same as v1 except that commit message is corrected according
> > to Linus' comment for v1:
> >
> > 1. remove Change-Id lines
> > 2. correct sysfs as debugfs
>
> Patches applied with Sean's ACK.

Pulled all patches out again because they don't compile. No big deal,
let's just rebase and fix it up,

Yours,
Linus Walleij
