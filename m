Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5E8327A60
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbhCAJFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbhCAJF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 04:05:26 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E81BC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 01:04:45 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id m11so17628767lji.10
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=moD2Bdyb2T8MfmJZBIlIYzfxm5CdyB0xIbsQnTWSPR8=;
        b=LOaMXpVnE8hA/6DWa7au2DpCAqwkiQKO7db2fFhYNdXcXo6EuJFJMFPFXRp6AbD/SZ
         KDJ7rlZ/vU3xhYCCdMEUzcN/VxHZYULxH+nWb5D3qg+DM4CGOIHLRaFBd/Wp7Z5xTakP
         7j/xuA3k2hUyzKe12xmLHpQ0k081fyws8IgkxPc+PiWuLRxVIs9jvoQkBbuYOqAxlfn4
         CzN6Y0hgNAnEXSdiX1Y/9x7rPUPgBYX2bQ9ir7J7iwpf2BhEBvIKeYoq8MTXcAYopsJO
         5Cl8xxnBkcL0XQc3gqwyu3kaN6DpeNIk6h4FgVMPoGpa8rIDiuc/oQehCpa+gBHG7R7v
         YJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moD2Bdyb2T8MfmJZBIlIYzfxm5CdyB0xIbsQnTWSPR8=;
        b=F/d2GtV/AiKkI3Az1ng90uPzjYpbopgan13i7bnKQGHzXukJ+OC16I1w98ZSpGmUKp
         aJSQorTv+8EZOmMSbL60gKiasAZgudhmo56QZeOCgnAS8O25MzsI7YloD23BDLIKQ+CY
         d6F4ya/7xFOod3IS+G0CUOwNQRumWhOia1RaON2K8hKG0/eagemG7HEWR71cQEz3dh2L
         qGIloq/mV0E+Bh92dOgyKutUm0cCABJy8T7JKDSnBkGcB/SuRtwgg4AZmmK0LngHcoqN
         iQ3LZ7C74foAsSd37/c2b/1/7koVCgYF4XkIQgXU1ANobgEMU2k7Fc8R/r5gi4Dhf7E7
         WaNw==
X-Gm-Message-State: AOAM5300eDK89rBWy1vwTtIEHDDGHwKWDfg7bWjHkFWPK8JysJawEBWr
        h7bWsNnZ6muDMB7XNjXfmKoNqAxiuVQvoTu9e6J3NA==
X-Google-Smtp-Source: ABdhPJykzbxUIYmdBeweyOS17day9++BKDJZetDZ8M+30ZfaHO9RvDEqDtTaE0iKvg2rH4GWP2uEKqF+i8NiJLgNcAs=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr6474861ljj.200.1614589484033;
 Mon, 01 Mar 2021 01:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20210218014042.GC12952@sol>
In-Reply-To: <20210218014042.GC12952@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Mar 2021 10:04:33 +0100
Message-ID: <CACRpkdbZ3pZ+6vWW6jGZz5mytV4Xbc=82Pehi=Ov4s0LLj7jCA@mail.gmail.com>
Subject: Re: strace 5.11 released - now decodes GPIO ioctls
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 18, 2021 at 2:40 AM Kent Gibson <warthog618@gmail.com> wrote:

> Just a quick note that, as of v5.11, strace now supports decoding of GPIO
> cdev ioctls, both v1 and v2.

Wow thanks for fixing this tool Kent!

Yours,
Linus Walleij
