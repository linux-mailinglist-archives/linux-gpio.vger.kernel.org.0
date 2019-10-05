Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBD0CCA0C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 15:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfJENN3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 09:13:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34021 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfJENN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 09:13:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id y35so5396066pgl.1;
        Sat, 05 Oct 2019 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D02XwruZDpbXhu4SpHS6aZc8ZEW5m8aJlRs9G8fSG+8=;
        b=IIZmrJhtUeAYuVJFX/V/z1cMg1gev4viS8IXRlUcYyShqG+2vd3i3LUKH9S0SZdYFo
         c5XUmMqA2fl5VJH7r7dYyoSeW7VvT+CNWl3OKJvvyN6h2TCv9u0DYu4MLDh++i7tXcql
         FSZ+cHQqBmKi3Kr6GTFNMXeNGhbp8QkLFPp9bNl68GMgOLthqNJA7QDur14UpbycR0K0
         wpyyRjCfvaDg5SFeVyhA39PAXJLe/RlOGOyxMp/s55QIQg2YVVGgSiu0jqEzqQYUaDdS
         1diEsb3xDaBXSJaOVE1tiyGOURNt3DLKzpil/LLlAwhn6/SMMKwIYdgG1WR8zMwM+WrH
         yq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D02XwruZDpbXhu4SpHS6aZc8ZEW5m8aJlRs9G8fSG+8=;
        b=fg4PlAT3E8s+HBGRsymrOVD4OYE6HL+jh/SR7fZy29ZFwhEAqrGh4F7dBvwxVCMZ1f
         pqSEB9sTaMigUEVQAJmJ1xxzY48PN1oNpkYq2vnHxXr+SN7XEWYtxK+YHTRhyDLV7CFM
         ZQPyH3EBG5BJEaMIBvvMMNboqM8l8l/qaTKrk8HQvNJIb7pAWA988lJCMeUuuuvg1NlU
         ELVG5eLlbORkn8oDnTx0TBAt0vWVZ+Kd3sFyijWYrOHojn+uAZKswDQwJ3WIqR770fsA
         GS3VQVDHqTHdcqBiaV+KotElmziTbO46DN2IGD8GK7+/LkxqGCVlUvMMRXrv71Uq4ajl
         PXOA==
X-Gm-Message-State: APjAAAVrGBqqHUAfnqdaCEttZes+zDOG4BJMgS+Isjh6VPqeLBIwYN0Q
        ZhuI71deYMVZ2x7nqsXUJf2hd75MdU9FkMQg3Go=
X-Google-Smtp-Source: APXvYqxV5/Ef+xmY57r4tfo6LDG9kpbmsW9+Bz5x/aWIRIcnNyX+O4oJkW9kIY15ntqffEd6Y81CQZLmEE0srNGRLpI=
X-Received: by 2002:a63:dd0c:: with SMTP id t12mr20108554pgg.82.1570281206460;
 Sat, 05 Oct 2019 06:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com> <55a5ab0a-9a34-a7b0-cffe-9dab59f2c0ef@ti.com>
In-Reply-To: <55a5ab0a-9a34-a7b0-cffe-9dab59f2c0ef@ti.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sat, 5 Oct 2019 22:13:15 +0900
Message-ID: <CAC5umyhqL7PdHXaiD3cwvpxY=a_wCYh0xbgkbS7Nx2cra-oxVw@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2019=E5=B9=B410=E6=9C=885=E6=97=A5(=E5=9C=9F) 0:40 Dan Murphy <dmurphy@ti.c=
om>:
>
> Akinobu
>
> On 10/4/19 10:34 AM, Akinobu Mita wrote:
> > Currently, GPIO LED driver allows the GPIO properties to contain one GP=
IO
> > phandle.  This enables to contain more than one GPIO phandle and the
> > brightness of the LEDs is proportional to the number of active GPIOs.
>
> How would this work with the Multicolor framework?
>
> We have not adapted the GPIO LED driver to this yet so with this
> framework this patch may need to change.
>
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D412400

If I understand the multi color framework correctly, I think we can add the
multi color framework and the multi brightness level support separately
into the GPIO LED driver.

Do you prefer to support the multi color framework firstly?
