Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA2045B8F2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 12:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240482AbhKXLQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 06:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbhKXLQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 06:16:21 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AD3C061574
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:13:12 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id g17so6110626ybe.13
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QjNJ02lc778e8NCeig5ZXCX2p4eMdfva2K1a/hYk4Dg=;
        b=pf4H3xRpPO6jxraQnRHvGfgzYSY4jjfggue0r7fwzJNBfpDeONSZmei0OdPTocskAx
         yq5GXKOdbt9igry9IZ4XXfxh3j1FMX9Er6R2r1BKAmGPjW8xbLhl9NWQ0Ao4Co6ImGGa
         ptJYcjZ5eQhM5XWyHJcQ7MKg74Z7nNI2IcttH0fQfsoxAHW+rb+KAz9ETrVUQtxwGFpG
         7NlOxm22PldD9M825c2EXQ+lFWuVMbFps5vpB37JBiJA2TDJplT9d6JxI/5q8VXTZiSL
         nlljPh7GvNPDFpWsASM2B52LCIyPEl2ZZRSr0DcjEnnEr+R5Q268XQGpH1fGtNrSWx3b
         qOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QjNJ02lc778e8NCeig5ZXCX2p4eMdfva2K1a/hYk4Dg=;
        b=qa2WWme0EYhjY3jzy5dDF59vIuOu4t239eP2Usq8Njtip0N54tczHQ0jeuZHuH1IoX
         P+5AqrSZ7FR+/vqqmWmsfOpjehz3LZuOPGjNtRXH3+MyBrjvTtlHyuRouGYG19MBMeBi
         xLKrNsXRL/aBeCHFSh4d3TOlEK3uyx8mwZBJoBvG+4XyVWZW78uHrKE1A50XQ9dSHY+/
         0R6Z6As1RxLHbQPOvuo9gA9RHwc0UoZWkZwcEegzESJA2I6TCdB4rhoHPnladsQ05auI
         mrjf8pux1tkyA0uEpc7O1RmD3t3VPuV2+C8yew51sNjLQZ8SunQP8W7RfSZnVZpiSGWD
         eZuQ==
X-Gm-Message-State: AOAM5304xtAhBqiMjGPVvfBsyLif04bhfn0dE/tHw5IqLNEKu8JW4/sg
        fsYd97DFfd5kO3xwBxX4ZiDHdaeeej1EJfya9lmfhoU=
X-Google-Smtp-Source: ABdhPJw5VyOhG3DzuiOHlFTUiwlmdqgCCfRL/HlGnmNVXY9SgcRsSk/Bpmx7XR0ad7ke8TdAeqLlLZvWuy1kQqrBGgY=
X-Received: by 2002:a25:2395:: with SMTP id j143mr15234092ybj.415.1637752391653;
 Wed, 24 Nov 2021 03:13:11 -0800 (PST)
MIME-Version: 1.0
References: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
 <CAMRc=McOuJkAFg02+HWDtTxOYm+5io994G8AafnxY32eJJi4+g@mail.gmail.com>
 <CAEdwc-TS-yTdgg+sLag10jCT+O4H_m4sMANX6mg5oxsTRir8EA@mail.gmail.com> <CAMRc=Mdgk9hhKgznaH3ftmXNmLORAzrtVr7gE-qr7U6EpjtuFQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdgk9hhKgznaH3ftmXNmLORAzrtVr7gE-qr7U6EpjtuFQ@mail.gmail.com>
From:   Thomas Williams <thomas.hugo.williams@gmail.com>
Date:   Wed, 24 Nov 2021 11:13:00 +0000
Message-ID: <CAEdwc-Ra-cB85+q_sXG7cF5-7fVH7eNvuzEOCdCpncaMEaF3uA@mail.gmail.com>
Subject: Re: Confused as to what is going on with libgpiod v2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Bart,

Thank you for taking the time to answer my questions, I think you've
cleared up most (hopefully all?) of the confusion.

> > MMBasic, a *very* niche BASIC interpreter that is usually at home on
> > microcontrollers, to Linux. The language has an array of inbuilt
> > commands for controlling digital and analogue pins, SPI, I2C, etc. and
> > libgpiod seems like the natural match for implementing the former.
> >
>
> I can't help you with that.

I didn't expect you to, it was simply the context.

Best wishes,

Tom
