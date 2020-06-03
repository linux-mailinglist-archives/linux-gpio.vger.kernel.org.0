Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A6E1ED2A9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 16:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFCOyx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 10:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgFCOyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 10:54:53 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48781C08C5C0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 07:54:53 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b201so1784586pfb.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 07:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yr+eJmdtLSMenK3IAzifWgZEHLzkT+uAQKIBhfldqP4=;
        b=IzP7hSwYlpILU4o5tr3+XQkA94SAEcEYqu6vfAbBEdlhHRDPYnENMFVyh3wAcIhhjp
         V7nRKzczpKvfBUmPZ7IjSzR+LiyLNqG2opDT9peDOc3GlWS0EhWq1Pl79QUS5PxXqWYE
         vch1j0uVxYL0b24gmsLZTrJaHuCzK7bAlfWyVUfcikgUmBabZSZzPN4SV6S/i83jdPIb
         1tRVHoGGyeu0y3CIQ82pkAOqmCkc0l/A6D1mgX5NqLk8A78WmO/AgGwEt4JrDzGatxif
         wfdIwyRIwfUdJuYsjs0Y18DckMb58j0+WlX2k8I4khLSp6TJdXq6owbCNII/4QLULqOR
         hzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yr+eJmdtLSMenK3IAzifWgZEHLzkT+uAQKIBhfldqP4=;
        b=uVv4OFEorW1CUPSaPzLr9XbbLxHqytgaKTQsey6gtNaw+zM1ZvbCtraJlpWFpN67i/
         Gg8bSkXVB7f3RPFbwBBGxf8H4i8QzFUEcNJSKdhEe6w/fw5PANyf4ZqykJK2VpJT/Wse
         GcjXWCaaavruRVwMUnepiQwph02JBtactirFqMuExxE6FJfA0du3uk8xwdeoGMgtEn+T
         vYb4fSZj9e078ACVFy0orELU8uB/jyxOzNRyCH8DXBWKQeFY30SLRO79aH/b14mPTeCK
         RyDrN/N/noI1kHzvCp8JOhie4MzY4TKXLunFJJeko+kG8kyTXT2h0f1lbsLvViBA6hbb
         FMsQ==
X-Gm-Message-State: AOAM531HVA3M0XBrVi/NMqDmozKEB39aNRsdsvI2ZuGuxw5nAwxc3evx
        RTWshuuMfRLPqe4DcTMVf9Xb08qdFVE=
X-Google-Smtp-Source: ABdhPJxdwI67HD6+kc/PhymmpsinwILXOpDA4KPhlqd3u3g1lxLg1X0F2WhJtVKE2anq16zFWndI2Q==
X-Received: by 2002:a17:90a:3321:: with SMTP id m30mr97962pjb.20.1591196092575;
        Wed, 03 Jun 2020 07:54:52 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id a12sm2980212pjw.35.2020.06.03.07.54.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 07:54:51 -0700 (PDT)
Date:   Wed, 3 Jun 2020 22:54:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Ryan Lovelett <ryan@lovelett.me>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Polling precision/order
Message-ID: <20200603145447.GA26614@sol>
References: <c5498c40-7e80-4dc5-bff3-3ab8efd4898f@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5498c40-7e80-4dc5-bff3-3ab8efd4898f@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 01, 2020 at 09:59:07PM -0400, Ryan Lovelett wrote:
> I am trying to use libgpiod to listen for falling edge events to determine rotation direction for a rotary encoder and the values I'm reading seem unstable. I am starting to wonder if either my approach is flawed or libgpiod/Linux cannot be used for this purpose.
> 

Your approach isn't ideal.  It would be better to receive interrupts on
both edges of one line, and compare the phase of the the two lines
at that time to determine direction.  Depending on the responsiveness of
your platform you may be able to do that from userspace - depends on
how the interrupt rate compares to the interrupt latency to userspace.

> Rather than post my code and go with that I think I can explain the problem using the provided tools. Specifically, gpiomon, 
> e.g., gpiomon --falling-edge --active-low gpiochip0 3 4. Here I've hooked up the rotary encoder clock and signal gpio pins 3 and 4. Spinning one direction should make 3 go low before 4 and spinning the opposite should make 4 go low before 3. Looking at the signal on the oscilloscope shows exactly that behavior.
> 

The GPIO uAPI does not guarantee ordering of events across multiple
lines, so mis-ordering is possible.  Also, the interface to userspace is
buffered and it is possible for the buffer to overflow so events can be
lost.  Obviously either of those would play havoc with your algorithm.

What the uAPI does provide is timestamps on the events, and if I were
you I would be looking at those.  That would provide you with ordering
and spacing, and probably provide some clues as to the underlying
problem.  e.g. if the timestamps are jumbled then you are getting
mis-ordering.  If the spacing is less than you are seeing on your scope
then you may have noise.  If the spacing is greater than you are seeing
on your scope then you may be losing events...

> Unfortunately, I do not see that in the gpiomon output. It is erratic and order is not always guaranteed. Is this just something that is not going to work on Linux due to the nature of interrupts on Linux? Is this a bug? Or just not supported use case?
> 

I'd rather not speculate - more information required.
It certainly isn't a use case that the GPIO uAPI is ideal for.

Also, gpiomon could be part of your problem. If it is too slow dumping
events to wherever stdout goes, it will certainly cause events to be
lost...
Maybe redirect that to a file in RAM while you perform your test, then
examine the file afterwards.

Cheers,
Kent.
