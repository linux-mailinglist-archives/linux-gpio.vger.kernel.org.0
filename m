Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4112E294BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 13:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439384AbgJUL11 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 07:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439421AbgJUL1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 07:27:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A34DC0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 04:27:24 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id l2so985750pjt.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1csRWgxZVDHQ05kiLJgmNDUfa3LsWHB7oDZvtkWY7TY=;
        b=tmp141bsyhd84nmSdDXwDjnAYUZXm67p7b8m4ccmuIBGA4l0Xh3I92TpNaAAakV/kR
         /UHEhSy6zLkQRdqHcP0kCRfdHn6EGtd57XEzeQCNgNLIwXrxkLckeHBKhp+G/T6tAEer
         /RVnnFjYB0G3ARjtrOYp0e5fF9E11PPAFn1GIOAkEMStJ+Zdbi1/XFujnkv6NQRkFrkQ
         qw+X3Uh2PiX5+zxPF2xVW2AasEVDTLubHaODKqE9xLJqJiF3C4Qp/DO8juzCuMc9vwRM
         nDyOkOAR17y0fnN9WHvOWFumViPoAOhTdohv0vbn+Ggv2BykH+klDR2IrOYHEQs/0s5d
         ymuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1csRWgxZVDHQ05kiLJgmNDUfa3LsWHB7oDZvtkWY7TY=;
        b=ASuJp744yWnH8diyhAqFlrh3I7TkKWhhP3OFzUHapmudLEfk1Nerir7fOItmedmoC6
         Pt4xORYun9dGCxOJ5oSBOWxTJg6265P1sjMeK1DjegYGaQdXVnlv06afkCkXAhoF03Ox
         1N/o31yk9kBvg/+yCzwvGukAdhXwhHoPDDONF+LoEPiJhwF5NK4cpnuy2EgMx/KRDp/b
         9sVe/Mm3VNFfpxWY9i4EzvyND1C1tEpgFvJYoJ1xASKwrXNyZjHwHAtbUW8Cmye8SGm4
         r1ppNBg2fJ+qbRhDlibkMYV6r6bnLHz38zVOgS//YYwIk0qmfYhdbdlMUu09X+I/+/1N
         y6KA==
X-Gm-Message-State: AOAM5321OH3gvqa7WoshfrN9D1ZyEGLjfN5G2EcR8sWAzzEwNT8bzRoQ
        lKi8ty0Rr8Rp+uK4RAvsQ9pKohM38r/emg==
X-Google-Smtp-Source: ABdhPJxnVq83/SXHN/XV06+z4a8C678tClYJny4xOg3YAO5PYT7e9L6Z8Or31RxI/pwMGbWLJUoEHQ==
X-Received: by 2002:a17:902:c395:b029:d3:f156:ef0c with SMTP id g21-20020a170902c395b02900d3f156ef0cmr3287847plg.55.1603279643412;
        Wed, 21 Oct 2020 04:27:23 -0700 (PDT)
Received: from sol (106-69-190-250.dyn.iinet.net.au. [106.69.190.250])
        by smtp.gmail.com with ESMTPSA id f204sm2238643pfa.189.2020.10.21.04.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 04:27:22 -0700 (PDT)
Date:   Wed, 21 Oct 2020 19:27:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Why is the /dev/gpiochip line event kfifo so small?
Message-ID: <20201021112718.GA26073@sol>
References: <20201021090938.GA13202@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021090938.GA13202@laureti-dev>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 11:09:40AM +0200, Helmut Grohne wrote:
> Hi,
> 
> I was looking into using the /dev/gpiochip API to detect pulses. In my
> application, the crucial bit is to precisely identify the start time of
> the pule and the API mostly helps doing that by providing high precision
> kernel timestamps. However, it stuffs them into a kfifo with 16 entries.
> When your hardware is not properly debounced (which it always should,
> but often isn't), that space can fill quickly. Is there a reason to
> limit the API to such a small number of events?
> 
> A single event is 16 bytes. So for every line, we incur 256 bytes of
> kfifo space. This space is only incurred for lines that are actually
> being watched. It seems to me that bumping up this size would not hurt
> badly. Non-realtime applications could then read events after-the-fact
> with a smaller risk of missing ones. I've encountered a full kfifo a
> number of times now.
> 

Debounce support is added in GPIO uAPI v2, as is configurable event buffer
size. And sequence numbers in events to help detect buffer overflows.

Btw, uAPI v2 is currently in train to be included in Linux v5.10.

Cheers,
Kent.

