Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221DC22621B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgGTO2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:28:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36372 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTO2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:28:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id dg28so12922443edb.3;
        Mon, 20 Jul 2020 07:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H+HOdv0Iwx4SJS7pU46h8figf2eeiPI7mJjo5qsQTjM=;
        b=sbPL4mearqwAawnhsKGzWlh3TWCA4qrr9Oz68ScddUIwaDzykVyl+pVNSTqwi8A5v9
         amSR23+u4fdMw1s+T0ua9YpH3GF92Gh1lo06rFGroEVZ3UT3Q2j0h3fkXDEcUNeJHycV
         Y6diKm5oGdG/T5AqoI+0DzKKi0ruRAltVFUsPpk4o5iVJvBQGhakGiAO8ZIpMSEssfVT
         O5Drfu626WXrwUaKZQaoSou6hQ2nLUQPtVFhxxdOgmCdLp3JYoDLlfjr/sr/Ybj0Ycnv
         J2m1t6k3hoqCVJL1xt1wppvtmI2wEDrz0PEtfXBEddkDLW0DG+Ueo58KvT9OfnbDH1AS
         c2nw==
X-Gm-Message-State: AOAM530y2/UhYq+V8mbHP07FdL15qipFiObOfMO1JmfafQNkmvxu5xzd
        RXU600aeOlM5UcKlVdy076j/x07pBmIyFQ==
X-Google-Smtp-Source: ABdhPJylz0Nk0hfgFk95k/OhFgpGdomfuGo3Jtt1Ad9YhcjjZAV5M/GdROa+dvfgBlDEmhpsXsUymg==
X-Received: by 2002:aa7:cd52:: with SMTP id v18mr20782665edw.196.1595255323711;
        Mon, 20 Jul 2020 07:28:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id be2sm15448599edb.92.2020.07.20.07.28.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:28:42 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:28:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: Replace HTTP links with HTTPS ones
Message-ID: <20200720142840.GA1163@kozik-lap>
References: <20200718104717.7493-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200718104717.7493-1-grandmaster@al2klimov.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 18, 2020 at 12:47:17PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
> 
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 2 +-
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 2 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.c       | 2 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h       | 2 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.c      | 2 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.h      | 2 +-

Thanks, applied.

Best regards,
Krzysztof

