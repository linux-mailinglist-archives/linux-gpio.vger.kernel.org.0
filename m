Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAC732AD0F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbhCBVTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575725AbhCBPfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:35:10 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7368BC0611C1
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:31:11 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p21so31864181lfu.11
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fL0AumZD+ZV7RDH5XqYhmB5OulPM6pG2ol2pOztokaY=;
        b=yG3i7iz/rEBxhg/9yaFCE017PRiu8UQYzvqpTXVz7+qqlbWT8yIxJ+4AsNwt4++VTj
         H8BwQsDP0JkYDinVG4+5nmWp4lyFKLEyBJ0L4z5YNMvCFDxlqhrAkleFkoFzuhldfqPe
         vq/ngnv+tGJKyYuqxSV8uzVfPKIrTrjuW6LbAFeAZ5qqcM41wv9fdYR4yELa/aAwUS31
         2leRshpu4SxH91IwatuegYY+ZQZJosi/oTJiqJS3XkdWjXUMbw49xGKB/vSgJt6sfXzc
         vlYF2ATOgXIIj+z0WWnRNJDrBYLoM3hcEhRfM90c208VKTsMz2OFeVpDVG2/3DnLpFWN
         bU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fL0AumZD+ZV7RDH5XqYhmB5OulPM6pG2ol2pOztokaY=;
        b=XcOILMGpeuyxhJ+hMoEZVHh6+jTkqk+RB+QhGgEdqiFMJ5qhkBH3t9f8vPazu+Mb90
         KdNPLiRaGq2Pg2UOJVkiVgaUlNpJ3bHLqPPmQGujTllZ7a9ltPmiBXKTas003XEpPQk9
         qLuTvz5o7EQusNFTUL6YYmzd4O5FfREtF3Jgt+O9XtN0cHm21B7oKCQFP/iKPodTGZkH
         5HWeMVdKelqCl0dLlOi+9yOdOUm7ZnGB660DsV7mWox2KwSgMSKoRbZVAwMa38aN4UBm
         B/19pJp7iYWFdCG7OvsKy4L4NYBjGt54XS4Ca5mNUA+BjXpZeLrQqQYG1MLXxXMQMGha
         S2tg==
X-Gm-Message-State: AOAM531xiMX58VETVBgXREKHy1Ajkb/RLQFmki4O4KS5ueU/3RwB/yA0
        M1I6nA7u7CJMW041QNiq0+JU80tGUvbiV9VUldRZ6g==
X-Google-Smtp-Source: ABdhPJyF/0gX8VnffeJrG1RyJd6Yz/yaX9phga01OuwC40B8O7VAx0FsD7hVckpnvKypLK4OM9edN/3JLx6x9C20ZLU=
X-Received: by 2002:a05:6512:74a:: with SMTP id c10mr12816686lfs.586.1614699070004;
 Tue, 02 Mar 2021 07:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-7-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-7-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:30:59 +0100
Message-ID: <CACRpkdYvkr_8mJMjUsLWq09HYaOey7cmWivOxscnX9jrhA-E=Q@mail.gmail.com>
Subject: Re: [PATCH 06/12] pinctrl: add a pincontrol driver for BCM6362
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add a pincotrol driver for BCM6362. BCM6362 allows muxing individual
> GPIO pins to the LED controller, to be available by the integrated
> wifi, or other functions. It also supports overlay groups, of which
> only NAND is documented.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Same comments as the other drivers!

Yours,
Linus Walleij
