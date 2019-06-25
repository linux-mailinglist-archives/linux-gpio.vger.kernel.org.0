Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F554E41
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfFYMEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:04:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46568 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYMEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:04:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so12394067lfh.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/f28aOrleoqvEJ4bHiEApOEKhIHy1kX+iAJZIMQ4U9Q=;
        b=z5L7R/RHQ8gi6kmdrSF+HFirS1VB7C5YI2Qog1AcaZ2uB7ENqcpmCaNfSQ1HbUcSSw
         anA3Ao+KibkpTeYsrrpvLX5azepaGkFdyjbEq1zy8aYdGFpL2qGGPzl8ixWZy0gA11Sh
         iZDQRoV25xY+M1el8CxVRlxvP/b5HZ5GEbv6LhIlMg05w5Onyd/9ZsGmi0dvxOKLHj0k
         gerU1H7y94Tq9tVKHeiVzmAT7+61RQ6h1UDxYN2jKT2NUrYwSuTDN+Z65KRniCOVp3kp
         TwjSPaEfM3w2Q7kdLV4soj47Ha4+dnbh/HAhyf2aMMqDqc/iIA3LdFXKIwZe2S8W+d9x
         2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/f28aOrleoqvEJ4bHiEApOEKhIHy1kX+iAJZIMQ4U9Q=;
        b=AYMxHKg+eemRrQMSqVJC6HANaiFqnxnK5m+nLC0Xg3eGEZQ7kZJzsJEZnNOkppL7Tu
         FBvYna/46OtYG3KOmyotE/TesfUG6IygYzqB5RHHriz10AkQrFJaSVEwAkxHP1MAif8W
         szxGV584KBKRk1+OKt1EGp7jn1N3dpI7Ii++G9SLj1I4imTDQDMpgYkvf80q+BNUbr8E
         D39fQTmTykLsFsLcszVF4s+e3gjipRYasuUTA983kqG5Y8fSe6ZuqVOLZEY8pfmRAMYX
         h14K3LnZy33f7uEe7jnM8GGlDydKSASkn5Ch6R2CGjl0ljmH07lrvgLtVFIE3sVeFd7s
         TP/w==
X-Gm-Message-State: APjAAAVUO/fykxMrTmQa4Df2+gZqOT9ERLgIbiMuSHGT0pO05gYyPESe
        mKcKhN1xjFEDnkCjM+0wo92X47w+m5HxPNDQT+EEwvnx
X-Google-Smtp-Source: APXvYqzNxR9cJAP4Uogl1051fZWl8BhQWMHJTzIVqKCqjWVlLKzkndXO2hB3c3GS+CgH+LiOvJBRYTewv4Y05BvbVo8=
X-Received: by 2002:a19:7616:: with SMTP id c22mr24949459lff.115.1561464284131;
 Tue, 25 Jun 2019 05:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190624144956.32354-1-geert+renesas@glider.be>
In-Reply-To: <20190624144956.32354-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:04:32 +0200
Message-ID: <CACRpkdaeXoL7cvrKMjAsp4U0jHdoC=JK9jRJ8JLXk5LV_jv3eQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Sort GPIO drivers in Makefile
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 4:49 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Sort the definitions for the individual GPIO drivers in the Makefile, by
> object file name.  Align all entries while at it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
