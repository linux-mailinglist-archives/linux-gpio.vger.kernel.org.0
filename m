Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D12619B3C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfEJKPu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 06:15:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43362 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfEJKPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 06:15:49 -0400
Received: by mail-ot1-f65.google.com with SMTP id i8so5059802oth.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MA9DqZv2wVVvPaR3kSHR58gL6n2YL6qcCNc1pwmaEJI=;
        b=TPks0ifDQZ3nT35liwRF+tK3sNIfDtgokD0iFfFhneEpB8FF7IX0OaTUv51YBB/1My
         1kKYy72xwPUB9TmJiQqlsC0TP/b/eUnsoFwhxxW32vyeIlwJFG7UCeJ8CX2br0TEQ5yN
         eWBzfjJsdtv0ysOFhSH3JKaOsBOdeDRGQB5VK8ahytERyAF65AirML9lBcYPub2SNMhq
         yBcztr8DgQ0XzE0CIttJ2CC3dnutoyaCMp2WrKYr7VQNzXJ2blF3IiPLkpJqIra14GvO
         tnNhn6IIQ/0sB2yZt+44koT3ubUI6AzjedfK+HN4LbkI264+jIze8+PFnFX4DQAfLGHU
         Z14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MA9DqZv2wVVvPaR3kSHR58gL6n2YL6qcCNc1pwmaEJI=;
        b=LcvQpXrNY8RKGeD9zvlhKn2bTkdFZDEdcArqBtXrBcF5dIpMQJn+WcomeSVpvFC/cU
         aO1jyleqpAaLHw2u+ufCxEslYiDL43vCpDPP3SJnGTH5BX/87j/q9DMb38iNqpFfoYKL
         qjkRu4rvBN3Jf4ooagoueVZqiJOqivlR+KadHhmRSv/PP35Dz73boBeXuIMb6c6f9VUZ
         Q4H5nRWeYejDMQgJ6rEU5Qs8VzBjysv/tXmKM+siwQ0Yj3Ed7wBCptEtlUoQ5wv0f4fo
         fE24sUqe0/ZVLjIyCr49xWgotZDcIi3H8+Cu4Ja5s5DefaC71r1wc2SBsPBLWmhBsaML
         gSAQ==
X-Gm-Message-State: APjAAAW1208j9vPCQaACaMsvbBdsmuyFNrBiuVyLor96kpwAAEwoCdqd
        0bm8EPZd01Fg8RbvEZGPGksTUNzw9yiYO4ByKCOaWQ==
X-Google-Smtp-Source: APXvYqxpSXrCqItfrCcS2nSV9PIZRAscdLHolOCXw/vgl8E82wsBriT7/Di2HQIbCiqs8inoIakH2KH3C1u48B0drwA=
X-Received: by 2002:a05:6830:20c4:: with SMTP id z4mr5843008otq.27.1557483349137;
 Fri, 10 May 2019 03:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190510090339.17211-1-luca@lucaceresoli.net>
In-Reply-To: <20190510090339.17211-1-luca@lucaceresoli.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 10 May 2019 12:15:38 +0200
Message-ID: <CAMpxmJVL3KLqgu9oRQOFmdAHq1jDbCCXxxq=cE1XyxX83zNgzg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: remove duplicated lines
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 10 maj 2019 o 11:03 Luca Ceresoli <luca@lucaceresoli.net> napisa=C5=82=
(a):
>
> The 'default (active high)' lines are repeated twice. Avoid people stare =
at
> their screens looking for differences.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 5e4d8aa68913..23d68c321c5c 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -283,8 +283,6 @@ To summarize::
>    gpiod_set_value(desc, 1);          default (active high)  high
>    gpiod_set_value(desc, 0);          active low             high
>    gpiod_set_value(desc, 1);          active low             low
> -  gpiod_set_value(desc, 0);          default (active high)  low
> -  gpiod_set_value(desc, 1);          default (active high)  high
>    gpiod_set_value(desc, 0);          open drain             low
>    gpiod_set_value(desc, 1);          open drain             high impedan=
ce
>    gpiod_set_value(desc, 0);          open source            high impedan=
ce
> --
> 2.21.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
