Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DD5390EE2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 05:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhEZDdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 23:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhEZDdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 23:33:44 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AE4C061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 20:32:12 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id p39so8846196pfw.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wxfbfuufhoTIGsjrsGFVu7acYSXGtnsJ5ICdHv95D9o=;
        b=jGSFp5iSkMv39rgM1G1FN3ktf9i7NTuOcXy+xnIPw5C5clWkJ3/VPEAEQ2iNYo++PP
         M412ErWcC2+LQy+QQHLL25UEHWtFxiufaoc3CbSR4jMDpKuZmZvKi1rGl5OGjvSMJSHp
         P65agmEXr029ohl7fi4+f/hih6fN5DNqnYHTcil7IRsF5PUuKFTh0+swfYuo15dC9/dY
         Zbbr61EekjienrJngs7BzlYYbirCT3Z4lD6PqXvg2horsw99f5Pkstas5F3fHi9nRnjm
         DDvJlXXVoNz/+7L+oX+R3spUYNWk5eVw6jdW2FtVs94lDOLkS0RcLP/xFnxzQKecSjcO
         QfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wxfbfuufhoTIGsjrsGFVu7acYSXGtnsJ5ICdHv95D9o=;
        b=sFjgoKib/z3j3ku6Ae0HXVAiLI4OboaM4VNcemT+uaSrbDK3nD9wJFBmhaDxQ2v51i
         a1tGcVymYCFMpHZbIknhobUd9RX9KqVEq9eQogwsNhVzUIYPL5LHEMWClq8eLqOHkVIg
         suF+mI2MMGudsvaQBkIjfp5y5Ns5e0jGB6voEik+B/PXtBNvQblALbIybcvy5LrQ51sg
         AXi3PzjLj+8vdZc3QaA5gtlrIy6W3DqkVe4+kzIVtl+VwgZ/L7jY3mHR3XEFaoZ261YW
         /vFWr2QFdbpJOQ+/MHwzm2rvpX0/mnPBJ49gfMKKhwlubyI2HJMbHPTy204/YeePDX50
         rsug==
X-Gm-Message-State: AOAM530M7GqC8Ujwy03/QxWdyg1lly2JRBwgygU4v25+CQD0HgdPo4Gg
        0QdcPcu2ozyCSMOyWbUyWHp74A==
X-Google-Smtp-Source: ABdhPJwwqmv5fOuZj2gTLWm1aPGOBcATAqRwutccEC1CahZaBcTt4uDeBD2JIpgKq+kcTEidz8j5qQ==
X-Received: by 2002:a63:3e8c:: with SMTP id l134mr22645757pga.202.1621999931722;
        Tue, 25 May 2021 20:32:11 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id 23sm16088688pgv.90.2021.05.25.20.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 20:32:09 -0700 (PDT)
Date:   Wed, 26 May 2021 09:02:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210526033206.5v362hdywb55msve@vireshk-i7>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> On 24.05.21 13:27, Viresh Kumar wrote:
> 
> Hi,
> 
> 
> > We (Linaro's Project Stratos
> > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> >   are interested in this stuff. I was trying to look at the last status
> > of all this. Few
> > questions for you:
> > 
> > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > very first step before
> > we merge the code.
> 
> I had posted some spec quite some time ago, but it wasn't in the form
> of patches against the .tex documentation files yet. It's been laying
> aside for quite a while, since I've been busy w/ other things.

Will you be fine if I take that up and restart the thread ?

-- 
viresh
