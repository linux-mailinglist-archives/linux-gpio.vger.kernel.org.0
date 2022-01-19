Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883984932AF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 03:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350843AbiASCE6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 21:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350404AbiASCE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 21:04:58 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E52FC061574
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 18:04:58 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id q75so927987pgq.5
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 18:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1V+p1Yq+eXMZCzFEYvtGwPmOOZ8dgWHAsoo9fHqxNUg=;
        b=gn+nuMrHu5YEiajSBJ/Tvb8kqdPDSBXfQ0gvnPuFOxFZ2lmQcpgFrs15YN4hysuP7v
         1eNedy0jxuWVwMrpEmBG3vCZPMHNnL8qrTEi7XktgUcEXG+7Yt5rxzgqgXnXPTugYpvJ
         kjllwC8URU89pbFRH1hagMFXSOEDAtle0PO5g8gtpLXvZKj18CpNB4UmMQqWw7cr2qH7
         yGwrMXc0o9ryD6NAF8Eh1xk90HoWH3zXRX4inqHVoN7XceuUsVVIOOf8NlezNxU4uJ0J
         mSd1aNEkZGFZqL+mxBu/RX52zGwTTYNwznFGGUJf3B9Dkci/jIq+Jemd+5HSA/I0yrsx
         MlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1V+p1Yq+eXMZCzFEYvtGwPmOOZ8dgWHAsoo9fHqxNUg=;
        b=Y8GG3rSdpTZ8LzZkjj04T87JAP1afQ89wOD0pAPYEpkXxNT/4ATjYNRrxYSH4MPUCO
         YncJ2qpMFTtlxeICV3JvRYOa8/7dEiYwPC0w5EiJ8k9aM/zXwVfEoIpUXe0KyjEcjQO6
         j34MJ3hAFPMxnzrDI26UzF9yLGQiTZkDXqCjOKtzCQL19jcJIuOuRpST28lFvvkAXHbH
         oZ9d50k/Q+wwUxnrimnxj/2YEHj6k4QPV7fKhwYCGWhauB7j90PzlcC7qKgwqSKa9VPV
         AmGShetnaW8UsOwJz//Y9JZbSKuFnRHTcQ6KXruFtkMkIDJYAizXWctqt8xJPJEKP8Em
         MmAQ==
X-Gm-Message-State: AOAM533RInKUHvnFX2AMgNfX4FyOxaPwUKfAWEBA86Mg2ysXMO0njKP1
        iPDmpNqywWlCO7B145YFK80=
X-Google-Smtp-Source: ABdhPJwTrPjyUKbGiqi3Ytxn7Tux7emVQeIoFkrgiV5Z7sUZ3QbysR/SQD+AijwvdV0B66eULxZ54A==
X-Received: by 2002:aa7:9e5a:0:b0:4bf:32da:b179 with SMTP id z26-20020aa79e5a000000b004bf32dab179mr28263696pfq.1.1642557897910;
        Tue, 18 Jan 2022 18:04:57 -0800 (PST)
Received: from shinobu (113x37x72x24.ap113.ftth.ucom.ne.jp. [113.37.72.24])
        by smtp.gmail.com with ESMTPSA id c19sm18489085pfo.91.2022.01.18.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 18:04:56 -0800 (PST)
Date:   Wed, 19 Jan 2022 11:04:52 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Jose Paez <jose.m.paez@icloud.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Ubuntu 20.04 GPIO Issue
Message-ID: <YedxxHuD3uCc4+IZ@shinobu>
References: <87A74AAB-198B-4A87-9403-2840810C541D@icloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R0BpYZ5SOGiD7OGg"
Content-Disposition: inline
In-Reply-To: <87A74AAB-198B-4A87-9403-2840810C541D@icloud.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--R0BpYZ5SOGiD7OGg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 05:33:58PM -0500, Jose Paez wrote:
> Good evening guys,
>=20
> Recently, I installed an Ubuntu upgrade to the Linux kernel that must hav=
e had an update to the GPIO driver. As of now, Ubuntu fails to boot unless =
it is in safe mode. This was not an issue with kernel 5.11.0-44 but it is a=
n issue in 5.11.0-46 and above.
>=20
> I was not sure what the problem was because the issue happens early after=
 selecting a kernel from GRUB. It hangs without me being able to see any lo=
gs as to what=E2=80=99s going on in the background. Disabling `quiet splash=
` didn=E2=80=99t yield any information either. However, attempting to boot =
Ubuntu from a USB stick yields the following error right off:
>=20
> ```
> Gpio gpiochip2: (gpio_aaeon): tried to insert a GPIO chip with zero lines
> Gpiochip_add_data_with_key: GPIOs 0..-1 (gpio_aaeon) failed to register, =
-22
> ```
> Nothing happens after this. I don=E2=80=99t appear to be the only one aff=
ected, as there=E2=80=99s this useful entry in stackexchange about it:
>=20
> https://unix.stackexchange.com/questions/665526/what-gpio-gpiochip0-kerne=
l-error-means-and-how-to-solve
>=20
> If it helps of anything, my setup is as follows:
> - TUF B550 Plus Wifi Motherboard
> - 16GB Memory
> - AMD 5700G
> - Dual boot Ubuntu/Win11
>=20
> Feel free to reach out if there=E2=80=99s anything I can help with.
>=20
> Kind regards,
>=20
> Jose M Paez
> Pittsburgh, PA
> jose.m.paez@icloud.com

Hi Jose,

Canonical maintains their own Ubuntu patches on top of the mainline
Linux kernels. It may be more appropriate to contact the Ubuntu kernel
team first to report this issue to see if it's something specific to
their kernel: https://lists.ubuntu.com/

William Breathitt Gray

--R0BpYZ5SOGiD7OGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmHnca4ACgkQhvpINdm7
VJJkLBAAybtCpAPsQohMJzgxyEkMbdyOq4a/cxJQxyghrQDYACn9CUChFAXgorgD
Gb2Mbk0w+zcZlz0F6zdLBto9wSCOxJRTtzvalxpSuhaOua5k2fZ2m5uEtu3z5qZ+
SEZ9MeFm9DxeXc+mH7kwuCBFuHH31nCmHg8HgIbJ6j3gbU2mLsqqiEHvpziX9Gsc
HwizMonKwb9p5LmQnKT9uN3+2oKX5no8QH1aqBtyIpoR+UcTYhuzt6/0I7yE1qAO
AV+u2HwFmfjFGDHpGY502UUjn0vLDYbdMR5F4M4wjVqwk96iUe+9gP7Mrd6qwWaY
KdKQobAGp35PlhsjfwqzwRrxTwrSqKSmgpiX47S2WzOJWK9qIJ6zSQP6AK6pYyo/
2kG/8aIeKokOvys2qZwc/D3bdrIsu7FJDcZMHLYQSsUPwr1llDZDt3jtmajl4bVm
qVL+hPJp5Ht3dti+2n3hLlFYwa7+D2KE4iiRmW3a2ErokwwssouTQKTAp9Cy+rck
qaeoX5fGSFfGTI2+LtO2Zdj7dW/z987HSaRDfGdxv94xKaBTxJ/Wu40IjrDpMG+R
v5rP+8l/7IXIJzZAacXEz/VfBSKv5AjHGFY+ElK8uAnr7limysg7pV8AP4ZGu5tq
eRWmSMpod+RhSXny3UG/59fjPBpb6rQcWVOQb2DeXq6UrUI9nDQ=
=/rhf
-----END PGP SIGNATURE-----

--R0BpYZ5SOGiD7OGg--
