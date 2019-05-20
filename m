Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773982400F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 20:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfETSIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 14:08:50 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41625 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfETSIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 14:08:50 -0400
Received: by mail-oi1-f196.google.com with SMTP id y10so10699511oia.8;
        Mon, 20 May 2019 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=p0rilSq2HK/3GLFdIsM3W0esD1E70bZ4ap80QtZkmUwFik8fQLlRneXhyF69OUOLTR
         +dptkfa5Qvgd5BuCPhZZJ6NhjUlWda9smxTObo/ubrx/1pV9kduFim2wv9XuGdXkgFy1
         8KcMIcnNIk22Anzc2GO/iwhtyM2zEE4Zrz/dMqMHY8naFqRBrVx5TAgQZM0S4PSjINd+
         +CLOU8blq8nhhgJTo2gr5j8xEPZtjhn1ykKcN13D7C1dqAusMCsn+QwJXPwArwS9oMTq
         +m0t6bsGevtfOUgJjwVD1uKt7KLnb0WudnzeKk9ADP09ux2mdWfxK14WGgz3wmAfx2VR
         XlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=R04hCYeUzT6/Ie7dx/AtG9eZ/6UYG/B0X+zA/OcQr/T81y3DJR2V4DTQQroikaeJbR
         1JGMuwPTyyJBU3vkg/Fqv+2eL8vjsUl4piOlTaI6Wr64oVlsRmFwF9xPiul9ywONuVFu
         vz+xJHR/mG1DsrzYNJLEMn/DUaTl2c3ZFGKtHmpms1ghT1VrZvoM1iopSKe/RoYc7W3u
         Z73THZM8R6aBEcOaVeFodcynJCsxWiM6ArWCn3Shl65NHd6j7mVJ6LetWpBewlta/s7B
         3TRAjtsp0/UkHgXSZJxyT7ByjbPeKYuPmz/xlTMUG9zbvlD8gB2pH01zJRECq1VQiR/5
         pQzg==
X-Gm-Message-State: APjAAAVU7jVqQzMoHw+tjM3dfSZLj2PqNWzcnozprATNAUdOpgCQzwBm
        +OBDyO0QBNxZ7GFNYg9CkxQH+Z3GVYb2pvu/ffQ=
X-Google-Smtp-Source: APXvYqwo63kXnxppc/g8GoRRU2jASvWNgeVjHOKQoTWH78i0rEmmwsrELvB7RuW8hSB4HTgDUfOK0kTXRZAhylYphKE=
X-Received: by 2002:aca:f144:: with SMTP id p65mr322071oih.47.1558375728938;
 Mon, 20 May 2019 11:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com> <20190520144108.3787-6-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-6-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 20 May 2019 20:08:37 +0200
Message-ID: <CAFBinCBV_TYz_gf91iMBFk8bWBwx4kpAQ+d0n7wJQ=Xo5xKmOw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: meson8b-gpio: update with SPDX
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
