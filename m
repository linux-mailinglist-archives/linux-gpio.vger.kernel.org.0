Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532A67C766B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 21:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442009AbjJLTKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 15:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441905AbjJLTKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 15:10:36 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD61383
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:10:34 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4526a936dcaso574150137.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697137834; x=1697742634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pomX1w2WgeB5WW7tgCy2p9CdEdyTGeDobeCiyw2koDw=;
        b=wzooeSMuKnh9tfQttv9dY2wZlUVXTdBaw8N2VgUKpp3VpFPZzFFsJptpiatoYMoMma
         8ow3/3gXxPuYqNulO2YJcpGo0m4gTAYBvWW5MPZxub77mhfkq8bMgSkiJxbV4gNicJ1x
         jG2YCAvGhOIvBR/42Wb7ehR9JiCjSXqmEgOEY4dYwgi27Wt5bzxnk5HoJ++l6H3bBqQK
         nWNhye2210ohAHB09depaz+m3x3NmXCe6IDNbEP7sYaZ8mICbSxs4e4dM/2E0zp2ikys
         p8VnmFlW1ezHpr/5l2FgdLdfWWUcEWDOXAUKlb9YS/24/T0pGdACjgolJ7E47VH/Jn1u
         xdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697137834; x=1697742634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pomX1w2WgeB5WW7tgCy2p9CdEdyTGeDobeCiyw2koDw=;
        b=aZk0c8u+ArbfSZGHUmTGGmzaQrI5OTRfnwuL/nMZNWhhyJU2spgplWSuJ+cPTnTgej
         H9c7FwbeqCROdKIbtjA2PijkVkN77Rf5pbnkIl9/vz4zkLOzntMbd4MNWybF0SzQge+/
         rH7pt+UE9XQCIP8404N+Hql1LkmpRwv1izheZtVYKQh+RX3INle1OHOYBHmar/9iFYvB
         oy9xhNvN3mp7L5CNCaju5d26/ujOk4Wct/o9kQAPhpff9ZcNoUlgwOPc+nWonUvRhcIB
         WkTaThy0LwmGu6ryTwYnUhZn/XDdCbl8zONAErlUK9Wg/537eTSTj46hQvJSHQUOb/uM
         v0GQ==
X-Gm-Message-State: AOJu0YwBSjCoYPV5vI6+jIblQ72OaLaHOkCT9aRnzvbGBKnTq0OKydpj
        wPwaxlUoYWZeXR0zhepgLEMLjscK0gDaSuyWBBk9sg==
X-Google-Smtp-Source: AGHT+IEIWG2Beh6kPlr0Dd7tLlf0nGgxdwYkiJW2Q7DzJdd5V7CjupefddByxZcidBLedjsz1yTrs+mzU+6YiiSyh3M=
X-Received: by 2002:a67:ea18:0:b0:452:f119:20f with SMTP id
 g24-20020a67ea18000000b00452f119020fmr22780912vso.8.1697137833829; Thu, 12
 Oct 2023 12:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231011121246.9467-1-phil@gadgetoid.com> <20231011121246.9467-3-phil@gadgetoid.com>
In-Reply-To: <20231011121246.9467-3-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 21:10:23 +0200
Message-ID: <CAMRc=MftA25nZ19qr=Y4mW5W_n+yi0gh0Justs9pkZ-qBEJAaw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] bindings: python: add pyproject.toml, pep 518
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 2:13=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> Add pyproject.toml to prevent spurious deprecation warnings from pip.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/pyproject.toml | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 bindings/python/pyproject.toml
>
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.t=
oml
> new file mode 100644
> index 0000000..d1e6ae6
> --- /dev/null
> +++ b/bindings/python/pyproject.toml
> @@ -0,0 +1,2 @@
> +[build-system]
> +requires =3D ["setuptools", "wheel"]
> --
> 2.34.1
>

Please add licensing and copyright headers like what you see in all
the other files. I know this is a very small configuration file but
otherwise `reuse lint` complains.

Bart
