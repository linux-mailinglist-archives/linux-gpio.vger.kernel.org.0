Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A913A240B59
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 18:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgHJQtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 12:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgHJQtc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 12:49:32 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5FAC061756
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 09:49:32 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x1so8137147ilp.7
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8K+MnnzIGv5bHtvqP/ZE62rAin/7bTnQTNjrUQE5AUw=;
        b=L8enDe8mkMcpzVxxgrb8sMW+HRdfMNvBZp9dgHJJfe2WV98pzWy+EVnj4LIp4r88pF
         M3Y80cRHFhZnwVV4EnrtiASs2ZgYYBbdILUpSZcznmeRsdzTrQKTV0gPi42HN9q0m9kZ
         1JCHM1dlkTPVPslYgQbos2NFGnD4/kh6eHpbDa3uRtcwtcj7tU1CZZbnrz+yRXd80Qwh
         XUwR7nb+7v/SAmHfrS9KiDScmlic3uihi9T4zfO15/myQl/yoVL0uy6lN80rVfaC8Plv
         yEUQbNq38F5soAkMMmvQV5eRsRITrdrfdGGiN1Awhp8C1c8tjGWR+pM6P3D0P+v2K7UT
         fOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8K+MnnzIGv5bHtvqP/ZE62rAin/7bTnQTNjrUQE5AUw=;
        b=lz0dorbUpaAey82NuAPjwrxTXc69kq//bfH0AH/zgQZ/PZv/5eJOZQvDZQcYsLNKMT
         472Yfb51V/h90h9A/2DfvIVCwTMWvWTze3ukeRnmFQqfBF1UvrjKpTjf9P9L3vrzDU2N
         ApEsSXD7qyZJbwNZBLOFbaX/sDnQO8S92jOX0MF9hg1A7iy+AJPGqysSXrKBZlrcrSOK
         QRihLHt6KuUyljY7ZFAwt3tYhSdD6W9F6u+xXlc3hVmYWhuuDJ21f6Iembra7Dv82x/j
         ccJiCsmgC+M2M77mqcqWgknBakVAShMWLWSstsBvnjIgvD/0amwRMaQM2j7786ymwlQD
         EfNg==
X-Gm-Message-State: AOAM530g/LWlifFsc+P5+faJTWjqKHYVX03z4PBEOtyiHJXD0OgOqch4
        CNx2k7DZUHVXnoT0VcmEzyKXMDfW/YPXOcpbd1dkFn8q
X-Google-Smtp-Source: ABdhPJylZ4A00C5gWyVugBAIGtTcx4xhx3TbURA+X6kKzzdmK6CuYOyuYIzcOwtWFDQoao68JD2eus/pTaZR7v37FBI=
X-Received: by 2002:a05:6e02:d86:: with SMTP id i6mr19562261ilj.6.1597078171994;
 Mon, 10 Aug 2020 09:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Aug 2020 18:49:21 +0200
Message-ID: <CAMRc=MeVKBHgU6u5gVjzaysQuwrudo3Zun+AHDb74pGXzkB4dg@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 0/5] Documentation improvements
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 8, 2020 at 12:06 PM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> Hey,
> this changeset improves the document generation by reducing warnings
> as well as supporting building doc out of tree now.
>
> Alexander Stein (5):
>   doc: Fix doxygen warnings
>   doc: Use autotoolized Doxyfile
>   doc: Fix doxygen warning
>   doc: Remove obsolete PERL_PATH
>   doc: Add @file to headers
>
>  .gitignore              |  1 +
>  Doxyfile => Doxyfile.in |  8 ++++----
>  Makefile.am             |  4 +---
>  bindings/cxx/gpiod.hpp  |  6 +++++-
>  configure.ac            |  1 +
>  include/gpiod.h         | 30 +++++++++++++++++-------------
>  6 files changed, 29 insertions(+), 21 deletions(-)
>  rename Doxyfile => Doxyfile.in (93%)
>
> --
> 2.28.0
>

Thanks for sending those! I guess I don't see any of the warnings you
mention because doxygen on my laptop is too old (1.8.13)?

Bartosz
