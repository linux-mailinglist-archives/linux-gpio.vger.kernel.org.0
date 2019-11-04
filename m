Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9AAEE3F1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfKDPf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:35:58 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43070 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:35:58 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so6570742plm.10
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PxsttfmxN82hsGrlbIS0nXxJLoNcUoc64Sh0Dgc5TQU=;
        b=D+ieLJHNSsNIFvs7/emIfHxF+DVo7iV7XJPRC10qhbrgKLvoFzSoT/f+u6E6LegfX9
         cikCs2/Qis/ucDUKMdMXL8RKUvIl2uHO9WZktG7lVEM/OXXruwZU7eOEPUOTqNV5xqF7
         KFTW6DiuI4AGS4QGmw1ld9oLF3BYAPwMWthHvMGF34QNl5EK9qmchuRsGp1b3DYuL3UO
         BpSpLBRpnls/n1q84wkEmxPOD+8TT8elC7qbe+kCpKMUxRUnPUfMHvAd4Hy1V4XG9Mll
         1nLmgA4/R/YYrpVzOwctkh4VWg1LmR2lIq+qpfie4NdVRwYsoaD7kQuU2HDgm58JiC48
         ECzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PxsttfmxN82hsGrlbIS0nXxJLoNcUoc64Sh0Dgc5TQU=;
        b=mPnGioSrAAWN3w8p+VrFfgRtY6gtzuTS42sdgTQrSVyk7mmSpdmvRdPV37zWWuoqus
         avT5OD/83hY0CBiKS9o8K4mxXd5uTzAIapS9CDi29zxU1Y/a3mwrwxauLk/8u0FudxtG
         gXXsts/zwLagDIStZw3D823Md1OkwIf0ZwTG+rKUxkmudC58bma3gZsbBzbwh1NeVO+3
         hOV24IO1hZSELqkoQZ8WM+ruAfG3tHZ9JL6wQc0OM2cHzOSL3XWUJEWdYWo/7fqWtlCW
         bPanhSkLxgio2hv0A5p6PhO81d3d3xQKyKBbONhD6Rs0MOTK+ddbgSJ05XzsMnHWBxtU
         KMpQ==
X-Gm-Message-State: APjAAAUnvNSPQA+d2CQGChQKyDQp+nTT/GW3tzV5oCCbuaNKvjHThDf9
        9WLXv2mu1IUDoqEiVxUWWeo=
X-Google-Smtp-Source: APXvYqyBKPr5awhmFd52Y4C3Z6d+EGSx+lEWv/MjofUShEVoxGKUgpr097Gm7+9PPKSCocin0ONwCw==
X-Received: by 2002:a17:902:7e45:: with SMTP id a5mr4406551pln.315.1572881757459;
        Mon, 04 Nov 2019 07:35:57 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id q34sm20259885pjb.15.2019.11.04.07.35.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 07:35:56 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:35:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
Message-ID: <20191104153550.GA16789@sol>
References: <20191028073713.25664-1-warthog618@gmail.com>
 <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
 <20191104010736.GA9134@sol>
 <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
 <20191104111148.GA3648@firefly>
 <CAMpxmJWqsZxK-C7UYz_PbgFA=bNVz6xvbCXEoxgbVZQ7znk86w@mail.gmail.com>
 <20191104142229.GA13556@sol>
 <CAMpxmJV7Z0yXAU0xqMLpcJnArGf1hANnoTHDyyKqAX=Ut8zRjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJV7Z0yXAU0xqMLpcJnArGf1hANnoTHDyyKqAX=Ut8zRjQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 04:20:03PM +0100, Bartosz Golaszewski wrote:
> 
> Linus mentioned during the ELCE that this release may take 8 release
> candidates, so we should be good, but it would be great to have it in
> for-next by the end of this week. But I was actually referring to
> related libgpiod changes - in this case I'd like to do a release as
> soon as v5.5 is out which will be in around 3 months anyway, so we
> have time.
> 

OK, I'll send out v5 shortly.

I have the bias changes for libgpiod completed - just need to tidy them 
up into a patch.  Still have to do the SET_CONFIG though.  Should have
a first pass of that in the next day or two.

Cheers,
Kent.
