Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBB52074B6
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389940AbgFXNi1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389611AbgFXNi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:38:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBA1C061573;
        Wed, 24 Jun 2020 06:38:26 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so1424836pgk.11;
        Wed, 24 Jun 2020 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n6EYyU9tNzUm8LFJOQnnjUbafppZgzLv5whLAcpT2NE=;
        b=kQ3xrZhwikYwYkyEYeV1PA8+PGUTRnCUbUpJwG386cgNfJJpRF7qU82T+ylKSvQO2x
         sKhX4ehW4QApUrnZSSF1JwjBzcLE4KF7ZxN2Sbut5/6FB4F0y96tJVBe1q+Z2Mt5mwhz
         u71wdiGL7LHOYPhod16LLoBEnqjHxzm1Rus/VC4f7EjAqDB6cMAROhTJO1KcVG9RXPuv
         jsM9teJD+3NH1k5XsmFzlVOPuiNktuQkoH35cmq5oSYWNJB3xl0yCC8fZffhvGMRSHw/
         jntxl3pfYYKFGzFCVsdMXgaxcQ4GWNZ8ja3CHmyGTDyA9usFHvmpmOPMeLEOGXrQubun
         tZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n6EYyU9tNzUm8LFJOQnnjUbafppZgzLv5whLAcpT2NE=;
        b=JP8ksVFEPDqMytaS0b1zM6DeKBXy+2EVurTCXSdwnXPpCvWsHIJgpeWHFA1sb6jsw9
         RejbPfJVe5EMW/2K955B+QMd3ww2xMgPFoqd6FmDNN7ihFyWC+6sVYwFNKhzailKshbY
         UTWIwFH0EOZd05yxJ0Z0yENLcY+4EKFNtdE/baeLnaY2XTq1K13p1Vr321LNeaFJ31Ol
         RexCLE3RqRmpkzb+YKOUNtlvC7EgihGzb4NTRGxij5j2A40W+CurAyVYvdyaeGYFtoLy
         MVEtPDBusZUL6SV99TvEqtG3qi3dhiiS2bHljAjjhkKoak8ejkQ/1BXzDfbHtdMsBcnM
         bdAQ==
X-Gm-Message-State: AOAM533h/Qrvm7FbPx6BiDZ51iOJDQaItUdfYB/eDPoTg8Jkc1iztzgp
        jmvVAEUdzHHyFY9XNRolF9al6WyebeQ=
X-Google-Smtp-Source: ABdhPJx1yLCnVxeqUgUWiyUlsAkBOmQuo1NgHEIgkHHs+I7rsePPGv1pcbDvmg93oQPpQ3h+dw/zGw==
X-Received: by 2002:a63:f806:: with SMTP id n6mr12625342pgh.346.1593005906184;
        Wed, 24 Jun 2020 06:38:26 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id 130sm19929367pfw.176.2020.06.24.06.38.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 06:38:25 -0700 (PDT)
Date:   Wed, 24 Jun 2020 21:38:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/22] gpiolib: move gpiolib-sysfs function declarations
 into their own header
Message-ID: <20200624133820.GA5742@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-2-warthog618@gmail.com>
 <CAMpxmJXF94CM4DdnZW+gsjj=qRF7u9bV2Oy+ndznSbtD=eV8UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXF94CM4DdnZW+gsjj=qRF7u9bV2Oy+ndznSbtD=eV8UA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 03:34:11PM +0200, Bartosz Golaszewski wrote:
> wt., 23 cze 2020 o 06:01 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Move gpiolib-sysfs function declarations into their own header.
> >
> > These functions are in gpiolib-sysfs.c, and are only required by gpiolib.c,
> > and so should be in a module header, not giolib.h.
> >

Of course now I see the typo - it should be gpiolib.h

> > This brings gpiolib-sysfs into line with gpiolib-cdev, and is another step
> > towards removing the sysfs inferface.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> 
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
