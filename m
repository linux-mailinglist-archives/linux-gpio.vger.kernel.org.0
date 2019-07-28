Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D1F781A9
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 23:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfG1VFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 17:05:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42694 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG1VFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 17:05:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so56524439lje.9
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbYUROrHITxIN82QRRbZwtsLIkrS39sNPo21T6P/YBw=;
        b=k6eLH3/Hzwjs9PM4FyNrgPbFZPttB9ESyhqVJopodSTPeXO5ditj+t7EAUcUzREeNi
         zrGPU4E0XBdA+umRWJxSrd05jhXzOrOQmRSN68983rnDeX6eEA0WUWvEn7KySUlcMb8W
         IpsS6Bsht6uugDfXpi3WTNJN5ItaWn4Bk3/YP8mPycS0Rwc2aIUNEok4cxnpKD4cJ9YD
         EYl4U6PAfwEEoqF+5DL0RLr5K0u/KQyND8TjlTbe8EZXpOFSEkj1kUBB3F7bsJnKd+W2
         oDMbs5K4bej3MB5kWIpOdu+pGFg2sks3f17jMa7ooBD51Nlzh9E9LgbSdUPi0CpmNpd9
         Y3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbYUROrHITxIN82QRRbZwtsLIkrS39sNPo21T6P/YBw=;
        b=KG4YuIC+8eR9fuqfkXAdV3Fnp6/tiggy9frThHsSRpMIyCkcQUN+lz7zDwdnN/dVed
         U6ZbMdTKubhI7YdcGRYx8KU5kCr7iIaupsWe8Ah/gNqkqpdZbRKFO38Uw6sNedcuUJuf
         Hs4F/C8IoCqY1AuCk6qBgN2eLbpXT4Xnk2OBpoum6wZEZRkkUBygu5tHpdlA30e42ZBi
         zinVOTglW0jAVIRReXwUnAQ1DA/istDqT5zHAoNilZ0jOEE9glLxuAqgwSHYR3SmoAu5
         l3YkOcVbiTKTLcjLnllA1SQZzq5gp9hJ85ZmFRaVR+zp6djfsLKpWDP0YDP5SNUYojAc
         DPxA==
X-Gm-Message-State: APjAAAWR5cdA7Tr5TOyCOkKr5Fkar3JQJcEbLrigjHt2CKlzz5v7sLhg
        xI/k7u+n2DrID1UnL9X9+BswQBzPDaXpLYHomi7x3fqy
X-Google-Smtp-Source: APXvYqyhLx6bROH1Eu+NuXzvD8gNmsJKrqcniX+V5fMUvIJdgp2UyaYW408hicxJrLrffJ3xR4dKiXHU1HUu2Nhumc8=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr7231014ljc.28.1564347911957;
 Sun, 28 Jul 2019 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190728105635.25057-1-brgl@bgdev.pl>
In-Reply-To: <20190728105635.25057-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 23:05:00 +0200
Message-ID: <CACRpkdbLUKB5Pnna6Am30=ruy23UNciRWDwFTQj=BN4U+9-5fQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.3-rc3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 28, 2019 at 12:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I guess it's too late for rc2 so I'm aiming these at v5.3-rc3. Please
> pull.

Pulled in for fixes!

Yours,
Linus Walleij
