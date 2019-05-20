Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6980524008
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfETSI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 14:08:26 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41595 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfETSIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 14:08:25 -0400
Received: by mail-oi1-f196.google.com with SMTP id y10so10698575oia.8;
        Mon, 20 May 2019 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=S5lhTJjk1JM8F3MChsDAaNPBFAAzb+VJOQcrH0rejoHveFbzcIJBygcZJdx2ZV4nE1
         TMIrYhLucObzjuFi6Ntxdfxij4z584vDkieAn7BGZkQCKmKaFkQnp2Q6VDQ6d/btWOtr
         fulD+1SmKsKPsK//XobMGm1IXOfcK4tf+MdBWy5vor+kf2CCmDHpiirMv1y714BhCSQ9
         bXwxqItek3Zf5xvuwXOWAKDvRwegrSeveAJJ+C5W4hqmo+31GMqcYcyeawbdy/DXoH6Q
         GinLLTa7TIv+TGfwng/1zMS3Omxd7l6MsuPf33CurK1xdFtTi7ehtwrwdwZ5sqir/a7q
         Cilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=I4So5nkgUcUsfFKC36Olj2SqxzJtb0gH+QXlQWKfQIaDPlFQjsU8FHRiyNXPJf94u8
         4TcYBvnNGeFxI2KmxKp/uaaF2/nF4dXdo3/tcGKDHjFIqMUFupSRaT+cc6oHuUcAn1PS
         JEKw2j6t+Im4OKNYRmTN9OuKnSOfg+pK35mSmeQPp0xheMnl+wM9zBmTj1cPAx8/tw8Z
         wUSk6y9Lh8u++mlOLVqVNmphge3Cb83fGA+H73nfnyDHVlmC0Rs/pl3UxwjCFxuoZ6dS
         /+7N+Z3+gX/99EV3iFqobjBN866OjLCVVgsEvbzjaMN0i6d40xVTVidp/66aPFKv5bid
         EXxg==
X-Gm-Message-State: APjAAAVu9MxNHDmNshErro9iViXeImfKGEf/eFwtkSz9OPlN49hX3nKm
        Bjcsdn1osUNYuqecGDiVkQELAtmQJM/+6RPGoP4=
X-Google-Smtp-Source: APXvYqxetly1U1fJxWeZJ6raUWEzl44Gr/x8YSeYU6030Ob5STwKOyUVYlZoKkTRxwgN7u6aFA943TQuzEMZYLH8YHw=
X-Received: by 2002:aca:f144:: with SMTP id p65mr320683oih.47.1558375705180;
 Mon, 20 May 2019 11:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com> <20190520144108.3787-4-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-4-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 20 May 2019 20:08:14 +0200
Message-ID: <CAFBinCBXU5CHa_+7rW5xUHwUTH24rc8A1yO=sKWqPvprbCUELQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: gpio: meson-gxl-gpio: update with SPDX
 Licence identifier
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 4:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
