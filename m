Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F48130F9C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 10:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgAFJiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 04:38:17 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:36749 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFJiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 04:38:17 -0500
Received: by mail-io1-f66.google.com with SMTP id d15so4511942iog.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k2+obkL6rebOtdriVSVT+QmM5oPrNk9dBLg/jYY+wfo=;
        b=D1o966MxyHxQctJ7rWTwJMt3NjGv7Dvvox7er9lgSNNvWFHHGJwcWONCfWtZi6gN+G
         sRs4vR0DB2EcpFyAOnNBrO6Ga7QtFeR72FBTF9427T+497Qzcfm+8pl2pbBszlc9JvVQ
         5lkYYgLVWA+odDpMbgsGqK5RaUIs7BmqtrPT75mjcq5Cps8QL2hw57ZZN4r24h+9vHFL
         a+0FUA2QZ2/EndxTc3PDJardW9IZ7lhDOn+2+dkqYDe/IvqXD733Uy0eoMyHFCObNslD
         T6Kj74zvZbASdqOn7QT7jqwZ2Hbx2etpk6CtUIx5rIfvpbv2lv5teqA/qj36BoqxsUw4
         LIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k2+obkL6rebOtdriVSVT+QmM5oPrNk9dBLg/jYY+wfo=;
        b=rvgqZaiTyCPRXu0LUP/leNjo7MIA6vTC7+caLSGa82DO+RonZvSHSowlrVTrkuDh/g
         NDTLJR7SEJp6COB0h/Rr63fjFySjQ6nKtRtUnTL4Xi9josPRxDdOCt+2k+GKW9vKFm4Q
         fAaq28R3Fqj2LnwLOrRcYKOVe8U7hb/C+i2GCnB6wEdCrl0Bxnjvf5UqFOVW+onLrThD
         cXysQOQFmpJyBS2hLPeY2wZNpu+PQBuPeRCxRdE3usvW1gZUH9eYEB/PbJmBCf3BSbDt
         9RSKqRhyKrOJNrurvhnaNEytbGw1+nvJgLbYzncKsVLisNdnmA5nfkumkC7xDuXOMT01
         +Txg==
X-Gm-Message-State: APjAAAX6ey2kYLhXOtd65L7X9kqFXSYGiMyhpqb+ZhrCkK8uIDPag4lS
        KjkHnN3ffHd5PyRiIZOG5aJyjr8AoM7tf9JPVD+wnw==
X-Google-Smtp-Source: APXvYqzE32XYz3+At4KghXnJsLBu7odv7vp28Pnk5lZat2Vp4MBrZzHnDvUV6gAXMdReOEfzJCGFp0QdxKmkLf29OSM=
X-Received: by 2002:a5d:9dd9:: with SMTP id 25mr58696986ioo.287.1578303496369;
 Mon, 06 Jan 2020 01:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Jan 2020 10:38:05 +0100
Message-ID: <CAMRc=MeTC8X9wDV7bowEvjPxjUNH8hXSJC79iy9s9W9Yn6Fh8A@mail.gmail.com>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code check
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        devicetree <devicetree@vger.kernel.org>,
        alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        linux-crypto@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 6 sty 2020 o 06:00 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
>
> 'PTR_ERR(p) =3D=3D -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
>
> The semantic patch that generates this commit is as follows:
>
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) =3D=3D - error_code)
> +PTR_ERR(ptr) =3D=3D - error_code
> // </smpl>
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For GPIO:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
