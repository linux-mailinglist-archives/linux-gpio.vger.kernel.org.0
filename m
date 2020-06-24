Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABBA2074EE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391067AbgFXNyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391062AbgFXNyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:54:10 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0E0C061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:54:10 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id z1so1720773qtn.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NQkrsxjDdsmZEVxqxY+8ufwWus4F7B1Od4+L9++jURM=;
        b=YTQ2sWvOoPM2vQR7+lyfwWEExK+4ZvBkqBaulOwGNu3XDUTwalaF56D+5SYCBDNAXn
         1svBlVQdpFrYUfyIUqhWeqKSNNTtcq+JXd27nIK/FTFMezR7qMx3MrK8OOis/qbVZWpk
         c1ImTfp7UE62pdQVk1QO6d5GWAIXqfqZFcQkvcWfDA7YsdzA1GcbpSeGi9rHObuwwpbP
         L1GokQ0XQBDxDqSCBCHyDFfNJ9KPBo9kzNFvyCmXvPe9HLnUe6CwkbIKcVGCDk2MvhJZ
         A+2Lt0REfh1DDU8PO09p+U2fqsBs6bslJdrHXk/nq6qeu/QghSct2AGya7RU0llG5QHr
         8G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NQkrsxjDdsmZEVxqxY+8ufwWus4F7B1Od4+L9++jURM=;
        b=Eq9WvF76RR0ysJSIFQSrbA61Np4lOFINEyNSiLSN+fSXk1itfIez03fZG0wQB5os4m
         dwV5T/yfEn+dpuC1cmku2ozMMuq36q70y1Scfon2QrocJD8MNFYcqseqJvhID4CxJYaD
         E815E7eLL/BzfnYidV0CuWPf3VoMQRjhfSaIrXY/8TOlG5zraB1VUEq438DooHIlbPXL
         CzvvNXTBhtquN6zX2P2gUvKSMcYMUWGMxw/5Vc/jPbrLz/so89PumsXiwG8XSLnkPfFE
         bVpQ5SW7tmAlreiI9XH5LgbHNwkghczxU1ssVVnOf+Udd89yc1ACl/TcxRLSO4uMHo2G
         BJGg==
X-Gm-Message-State: AOAM531SE62YZNaeBNDyKJRSXj6IuLGmkTX94xKcWec3GlA+eFQQuTHB
        mKk6yNPS9Mfm4Pbs0fkPz4UgTq9IWUsCMrSV9n4ONA==
X-Google-Smtp-Source: ABdhPJwcHIikenXP1O+2YczuwWCzJOygplvP6C/CH5w1IHNKGD5NlVsw8prqjeL4PK2NNrrxL+PW48GOXE6r6+Mow60=
X-Received: by 2002:aed:2a75:: with SMTP id k50mr11067272qtf.27.1593006849420;
 Wed, 24 Jun 2020 06:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-8-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-8-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:53:58 +0200
Message-ID: <CAMpxmJXNakO6Lu0XFUnKS4tc2pg9D39iLs_Y3+jx+tUkovsmjg@mail.gmail.com>
Subject: Re: [PATCH 07/22] gpiolib: cdev: remove pointless decrement of i
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Remove pointless decrement of variable, and associated comment.
>
> While i is used subsequently, it is re-initialized so this decrement
> serves no purpose.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
