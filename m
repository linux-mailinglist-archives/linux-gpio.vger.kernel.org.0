Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2B240D2D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgHJSwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 14:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgHJSwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 14:52:32 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB536C061756
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 11:52:31 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id t4so8484475iln.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r8q+8tRLCIFBDrJsyXUroKyjA3IhmgqJGNJb2F7Zqds=;
        b=HG7DJ0hoqfB9vkNjWbB0FV8TWyMHJEZsrBf3YdTQR0yrHT7rT0CYPMJaQmlsdyR+3o
         LYO79K0UrMVy3VlRXLz/N15tDZnMuIL9fO/ooBdHu1rbj1tjHPX05JJGlCt1AfHyE6Vh
         ua8euIiAG+B8miFeX3vgiUDZ58ScIBqe8jsOiHJJJyX0GO5kwAOpZfO0uUt5xc3Tya+c
         DmeIKRqhcgCLYt2k90nG3mXYdtMWe5jjQ/ZssBdE1LugivznE23GAL1gYmebKAqO4/Is
         HJc2FWnNDLzPCKoY3F2Il2ddEtamc2Oy0dEF2qj9/61FrCU9ytXImgPJ+dyGH/SFlT5b
         +nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r8q+8tRLCIFBDrJsyXUroKyjA3IhmgqJGNJb2F7Zqds=;
        b=VLXetMO7inDBGPIGb+P69J9boiE79Nez95xgxFxt2FqhVbKWB2k1Z1ly6AdB66Q78j
         q8e1c4tqiqZ5OAzNUfXjB4RPF4nS10VkAYI7ltqrpc+X/rHSOTL3QyEcgXDVMeR1fvnT
         ROz5ieDx6XfjCCVo2ekHpMyTtcbeIahox+GsOSaaO0azOZ5ZuMiCkY1W2D+j3lf7yA6t
         6h+QfV4WII10fIMPaFvyBxHZTnyGbMmbv7TRlmAFZt2/ExjFAGRuGtLmUtgCJ8+H/U2X
         ziLrGRpmKVhMwnRD3s+Cps9TcnXaiep/VhASelIP5OkEHYwY7ER2eo7JSoI1zCy2rplO
         BgrA==
X-Gm-Message-State: AOAM533xki29r7XRBg4zV4ZHrH8kdU0+dhX3NCZUGIn8PIi+b4ZBK12Q
        0meqdYWom+tyEOlcCsQSZny2H5y5QFOhADP65x3FJQ==
X-Google-Smtp-Source: ABdhPJyD23Zd3puh5TI4AeQT1Shl9WXXKkn7iErmFQ1HNIuF25ntdzrcSgWHJH+L3cGrJLQy19b0AmQeU73Y7HnADiI=
X-Received: by 2002:a92:9118:: with SMTP id t24mr18387531ild.220.1597085549393;
 Mon, 10 Aug 2020 11:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <1411c83c-a247-b1ed-ef57-983104630d2d@gmail.com>
In-Reply-To: <1411c83c-a247-b1ed-ef57-983104630d2d@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Aug 2020 20:52:18 +0200
Message-ID: <CAMRc=Mf917Sme3X+DqYx_05zU7P5GwfMaaUVbV4ZujSfA4gy0w@mail.gmail.com>
Subject: Re: [libgpiod] general libgpiod inquiry
To:     R C <cjvijf@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 5, 2020 at 7:50 PM R C <cjvijf@gmail.com> wrote:
>
> Hello,
>
> I don't know if this is the right spot, but I didn't really see any
> 'community' with the libgpiod topic as an interest
>
> I was wondering if there is a mailing list specifically on "libgpiod",
> like on other topics, with a users / dev list etc?
>
>
> thanks,
>
>
> Ron
>

Hi Ron,

Sorry for the late reply.

The discussion usually happens here but mostly it revolves around
patches. I think you can post your misc questions here as well.

Bartosz
