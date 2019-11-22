Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31D31072AD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfKVNBt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:01:49 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33608 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfKVNBt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:01:49 -0500
Received: by mail-lf1-f65.google.com with SMTP id d6so5482589lfc.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 05:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dn2Q+lxc2hD365R8dpx/qDcvh0SW6iReRcimhdnvJVs=;
        b=T3iDSlAsyuLG+UJUCmoncxR1Bu/bnkXL+KTq5dtWsOPEk5RpZ8edNc98Onwl6slav+
         /6e8hX+pTkWaSIXGqEuy9X9rZyNwmY4TERtxiAfEDekog4Gkz38xdZQ0RSgGTrgjfXWm
         Owq4J8pZTVADQ/t5uY4imCraJJ2dIrTT2uwE0EY2E3x+Uro8T1zF0BkVxkc8pF0FsqBl
         y6GKP5K6axb8BQ38YAG8H8sPZiX4W7XuFOsvWqrZ1MviJOCm684lRjpNZpMzH8na0jOx
         wqdeYsaHigtxhdjowwJZrUBM8VUa8C/SZB2DM3PbahSmncXpmbcvjBgy4Xy+mo3eR0h4
         1WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dn2Q+lxc2hD365R8dpx/qDcvh0SW6iReRcimhdnvJVs=;
        b=QevOo0Vfe+zNzn6g9j9M4/wd36rgdlARRPkQM8lDNZccyxIGLUrhRtyok4ikBWs9zS
         5mU0bb80GBrNo54Ggn5PxxHi2I/wuS6yoOgN2Y4pYKXgNe4CZShOcsXHr2tO88GZQjCC
         QetKXLLhR/8HLzFlmFJbN1Z7Ahrm7/iNXRRVBn1GHXomRKmztAlmF3fO/kWoYZv2ZMtY
         sI+5KD4qZOOgTusyRlczDRQjaNQ2fFixtqoBVjeAuks44bltKnNS768IbwRHDjhjn4UU
         DmbPwGrjQgFNyGXfFdj5CAAqiYUjnrvI0u8fUXD57QRFyBNLyVukKUKxWm4KPOSRs80E
         9+UA==
X-Gm-Message-State: APjAAAXKR1QyeBZ8hSHfaztR6FYiEPD4jdy2pL9PihuNolKsqDu76lXv
        xgCnwgcYHFRMXEuiJEP8ZEh6vmsq6ar3ZS6eH4Wnzg==
X-Google-Smtp-Source: APXvYqzo/k0rIsJGGL399pE+GzotZ33QW/YQlNt/JpZVm7SU204RwrS3/eFE+xu+DFtDva5eWFhzGzqC/njjDmo3YqM=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr11596350lfi.93.1574427707515;
 Fri, 22 Nov 2019 05:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20191122061839.24904-1-hui.song_1@nxp.com>
In-Reply-To: <20191122061839.24904-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 14:01:35 +0100
Message-ID: <CACRpkdYhLoGdGQt_jzj5aFa-EY_kMimoVShi7QFLG3sZbC436w@mail.gmail.com>
Subject: Re: [PATCH v1] gpio : mpc8xxx : ls1088a/ls1028a edge detection mode
 bug fixs.
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 22, 2019 at 7:18 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> On these boards, the irq_set_type must point one valid function pointer
> that can correctly set both edge and falling edge.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied!

Yours,
Linus Walleij
