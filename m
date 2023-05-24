Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A037E70EECC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 09:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239784AbjEXHBX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 03:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239754AbjEXHA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 03:00:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBD91AC
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684911640; x=1716447640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ILGgtnYO8bqCPH+e44wyTX2q7Blfn7urX43DbhsdyVk=;
  b=Ha5B3SfPhhCs1FjuKkwnFMyZqNEyb+UwIfF75/BnyGGrqmyb0EZAP/Vl
   LwrjJH9n7SL/yDRO3e7/DhDWEiIb7XFXxlXWl2mWb2a+/3u4JJ8sgQnxP
   QkeujGMl2pEkVVlBRfNAh6V9Pc/N+vmgp6VHkMVfrYfRgpHaOa1WPVuiA
   36AlDWM4TjIqfcKTEzYMTHWiF6ECxtUK3y0vxwh/v6KSjBsEAc7V2x2lY
   vfZeYCu4NB9kpA+haqvP2BNkHcBMpGiwcAV4Ku7BoBVDpmZmWJzK4S9Eg
   JrrCm1OposLklEJM8wxPAzeTnuhc7tfgJMUky8JJSckFcF562PiClkjtX
   w==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681164000"; 
   d="scan'208";a="31062150"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 May 2023 09:00:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 24 May 2023 09:00:37 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 24 May 2023 09:00:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684911637; x=1716447637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ILGgtnYO8bqCPH+e44wyTX2q7Blfn7urX43DbhsdyVk=;
  b=AjI9Hpa/xJqY9ENq6nuUzzz6DH5zxYLE8QKXSIqlpVbc/HfIKMsHagTy
   nTnJZ21EqQnBVRmH5jvsTURbv2MN9SdsGhsX4UBfGyx42vyUbkYmm9ldT
   rF9FKFADSR9K/MfZkQ6IacEnyYw/7UOOiwi9NNePXIZyS1MO9/hwL6I+l
   aqF61PQkR++IBBHv1uM+R5CL0yKOSRchlSm0EYntBTds7eN6S/O0WgZTk
   Fkaf/lXQfI29Bz8sB3lZb0rh+5f/6ILKhtGzePzTDEy/zEnP2hCS8gRuI
   1rqhT4Z3kx3ynipCUGcS4TT7XnHXyNYGJ/aUXYmcKnxB6rUuAzfa1qhBD
   g==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681164000"; 
   d="scan'208";a="31062137"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 May 2023 09:00:31 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EDA79280082;
        Wed, 24 May 2023 09:00:30 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: change the interpretation of None in event wait
Date:   Wed, 24 May 2023 09:00:30 +0200
Message-ID: <9113444.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230523133427.194558-1-brgl@bgdev.pl>
References: <20230523133427.194558-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, 23. Mai 2023, 15:34:27 CEST schrieb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The docs don't mention it but currently passing None as the timeout to
> one of the event wait methods works like passing 0 to select() - the wait
> method returns immediately. Change it to a more standard behavior - None
> makes the method block indefinitely until an even becomes available for

Small typo: 'an event becomes'

Regards,
Alexander

> reading.
>=20
> This is a slight change in the behavior but let's hope nobody complains
> as libgpiod v2 is still pretty recent and its adoption is (hopegully)
> not wide-spread yet.
>=20
> Suggested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/gpiod/chip.py         | 3 ++-
>  bindings/python/gpiod/internal.py     | 3 ---
>  bindings/python/gpiod/line_request.py | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
> index 97ff340..52d0757 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -195,7 +195,8 @@ class Chip:
>          Args:
>            timeout:
>              Wait time limit represented as either a datetime.timedelta
> object -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. If set to 0, the
> +            method returns immediately, if set to None it blocks
> indefinitely.
>=20
>          Returns:
>            True if an info event is ready to be read from the chip, False=
 if
> the diff --git a/bindings/python/gpiod/internal.py
> b/bindings/python/gpiod/internal.py index 37e8b62..7b4598c 100644
> --- a/bindings/python/gpiod/internal.py
> +++ b/bindings/python/gpiod/internal.py
> @@ -7,9 +7,6 @@ from typing import Optional, Union
>=20
>=20
>  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] =3D None=
) ->
> bool: -    if timeout is None:
> -        timeout =3D 0.0
> -
>      if isinstance(timeout, timedelta):
>          sec =3D timeout.total_seconds()
>      else:
> diff --git a/bindings/python/gpiod/line_request.py
> b/bindings/python/gpiod/line_request.py index a0f97b7..090467c 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -178,7 +178,8 @@ class LineRequest:
>          Args:
>            timeout:
>              Wait time limit expressed as either a datetime.timedelta obj=
ect
> -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. If set to 0, the
> +            method returns immediately, if set to None it blocks
> indefinitely.
>=20
>          Returns:
>            True if events are ready to be read. False on timeout.


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


