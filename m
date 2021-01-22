Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E23300493
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbhAVNwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbhAVNwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:52:43 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9ACC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:52:03 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id q20so3702165pfu.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0CdidXL9JqNASCWuJRmNf4tnrFhZ2Ys482HTC2wueeU=;
        b=eC5U90fghxE+n7CKNa61zlt/x+toKTPUKMHPD58h8ct+ARa5CJJ3MLoHsqR1sGY6po
         sjdAV4QjW9rKBFqbBlhJ8yMmsnMbe0ven0xG8CX6DYnaRFrjAA4P96wHvMHBd6Vj6XU6
         xy/rfetnkfrrTdV/j7+97xOUlMg6e5Bw0rKfT7b+DuH+q3gaWtcYg24qmqx9wmjAqXSk
         mtwaa9A6IOOtEwAaWna4M0cCTkEYUKV+rVraChYFJtkYb+9J3KqLyg2adleiqo702QHm
         9M5lPjT1k6seAB5LZz1p9P5gYm/D+T8Uk1uj8WIQ6Y9IKPv4AG739uqhUWAes0Zik6we
         NsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0CdidXL9JqNASCWuJRmNf4tnrFhZ2Ys482HTC2wueeU=;
        b=PdcKU1cLEiKc28L1QsCJV2APNPGh4/hdC1asn89r/nK1Un+V4HANaK7ef9UpCgNZ7h
         BI0kZHPrsHCyam9n8S4UXgnsksGcHZu1THDyj+mFFMkYDoks98iNtIlzlVy8XUz0dxWl
         3Z9RtY/v0FI2OtTZ+jpSSHrvTvqDBY1Md0kad0LB7wUoCoukl4liBVLWowICLgQ7mjm9
         jvDRBCDvBF2qbvBm7gUmyfqfWp88Z4G9p3n8g6Ngo/OcA/fOxUs2VIqe8nMwYkqTI2Jp
         SxF0FwcIhHRwaH78vccA+JMHRe45K+r8glkYDLFnniUNyc4ZXYmzHQmG+Zq691ik89YX
         8Wzg==
X-Gm-Message-State: AOAM532nmlkm1ZY1GSXzSjFq3qdQhvMlsAHnbQdLjql1gmmb7itrFbY+
        +OiN85REQ1XFGGWTtF4/bLYs
X-Google-Smtp-Source: ABdhPJxoSgjsOi7KJvW0fiz+egsgCeN7n5OWTeHOlCuGtfnw/Wy6J3Ex3Apm3cGyw6U2OXiWp0ieKw==
X-Received: by 2002:a63:1e56:: with SMTP id p22mr4842928pgm.70.1611323522493;
        Fri, 22 Jan 2021 05:52:02 -0800 (PST)
Received: from work ([103.77.37.137])
        by smtp.gmail.com with ESMTPSA id f3sm2135041pfb.119.2021.01.22.05.51.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 05:52:01 -0800 (PST)
Date:   Fri, 22 Jan 2021 19:21:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Subject: Re: [PATCH] pinctrl: actions: Add the platform dependency to drivers
Message-ID: <20210122135158.GB32437@work>
References: <20210121062547.27173-1-manivannan.sadhasivam@linaro.org>
 <CACRpkdYDB883r7RRa-i1T_aWvDW1n3c_LvScigQVnt5TsPbPCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYDB883r7RRa-i1T_aWvDW1n3c_LvScigQVnt5TsPbPCg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 02:19:07PM +0100, Linus Walleij wrote:
> On Thu, Jan 21, 2021 at 7:26 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > The Actions Semi pinctrl drivers are a mix of both ARM32 and ARM64
> > platforms. So let's add the correct platform dependency to avoid them
> > being selected on the other.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Are you not opting out of build tests when you do this?
> 
> What about:
> 
> depends on ARM64 || COMPILE_TEST
> (etc)
> ?
> 

Oh yeah, I missed it. Will send v2.

Thanks,
Mani

> Yours,
> Linus Walleij
> 
> Yours,
> Linus Walleij
