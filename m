Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518E816607A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbgBTPI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:08:26 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43453 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgBTPI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:08:26 -0500
Received: by mail-qt1-f196.google.com with SMTP id g21so3056753qtq.10
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 07:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uir4OVevldp1wThZux2Eqf4CnyMNFusoxceRzmHuytw=;
        b=dWZ9cFb+OVo/cF6mQw5Wc9qXd+oZuBF1ClW1/kwKSZ2RpU0uGNqhTL5b5jbw6M2z/U
         v8H6yUg9FS8LSP2C7XuVchwHGTZ3LkQVPmjBMA/t6jl4qB1+fFDyJpKwrC4Pk7eEZf46
         VsxBx1nPlq4D/GHpEXQHE9tE4s3uGjKpsfYeKSq0p64pVXEjcqr4RWkTX3Zoty/t0pGs
         Gejm+Ah1vsv3iaj3Vrix/XFL0oOl7OdRQhaPOrBt4DkU7vdk0k8VhausgpCmxi9of0lE
         WNHJuPgTnFiKg8Bc99LHfO+OsL2bqWbdtj9kOFxAzCKmQtFmSHv8GjE3fGv85ZxgCYcw
         UVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uir4OVevldp1wThZux2Eqf4CnyMNFusoxceRzmHuytw=;
        b=rTxmt44FujrQikOKir2MyEikBGxXraZ+yVMJwb9mpX36pCjEaap5G464wQsMmCaYZp
         wsXYiPnIrAirwxc1UhOOCeOIfA/dnZ96Cu0tbimcJv3SO5zVkszoLMtVhiQA2vEAA6t6
         WZBypeK0y1Tkzibt63g3+eJk5ddAMytAk2AVrSGhictAWxYIm/8AbfUHHFAN9EQMv9D3
         iBZyw4lALZ2Yicz1TONH9PMLg/i4Yn23VPnod5uQUhfOtaosrNkLSKoqyS+NS1nxQdMq
         fVkZXllTxnVeB0soCJYp5NWj0rA5gAw2NmREEP2s5axzAg7Zne3o+YRxLgXf548jVbIa
         uv2Q==
X-Gm-Message-State: APjAAAV3f/8ySgI1kO1CgqUhgKEYo6HKsoYVYicwI3kMn+ZaYaFQLfMW
        LBcVYoBRYcYOTIOGJ+k6kZ20BkY+gHKvyEduJ/xd5A==
X-Google-Smtp-Source: APXvYqyUD+kKXzdHLhp9VkjdgGZZtdHJsMk1f82wmVAlLki7R4OTLmiOMaXS0wbtWFYj1XhpjmEraQeAbEExbN9x17I=
X-Received: by 2002:aed:36a5:: with SMTP id f34mr25795355qtb.57.1582211305367;
 Thu, 20 Feb 2020 07:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20200220150250.46226-1-linus.walleij@linaro.org>
In-Reply-To: <20200220150250.46226-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 16:08:14 +0100
Message-ID: <CAMpxmJVP2_YZQyAtEbF+cFD1nDJ9zB7BSnjnb=APHOhToJJEig@mail.gmail.com>
Subject: Re: [PATCH] gpio: Switch timestamps to ktime_get_ns()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 20 lut 2020 o 16:03 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> The existing use of ktime_get_real_ns() in the timestamps from
> the GPIO events is dubious.
>
> We have had several discussions about this timestamp, and it is
> unclear whether userspace has ever taken into account that a
> timestamp from ktime_get_real_ns() can actually move backwards
> in time relative the previous timetamp, and userspace is more
> likely to expect a monotonic counter.
>
> Background:
> https://lore.kernel.org/linux-gpio/CAK8P3a1Skvm48sje8FNDPLYqyz9Lf8q0qX1QE=
TWtyZTxuX4k1g@mail.gmail.com/
> https://marc.info/?l=3Dlinux-gpio&m=3D151661955709074&w=3D2
>
> The change is ABI incompatible, but incompatible in a way that
> is IMO more likely to fix future bugs rather than break current
> userspace. To the best of my knowledge all userspace expects
> a monotonic timestamp and users are just lucky that they very
> seldom move backwards in time.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

I too am in favor of this change.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
