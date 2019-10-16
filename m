Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEB5D900F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 13:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392860AbfJPLwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 07:52:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37791 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392849AbfJPLwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 07:52:23 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so17235695lff.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V6YdXQcJKoGShMqI3meu7thi6SVojkNDq4q5Q658lX4=;
        b=Xdv5I327YjWZa3Nm+H1+4rToFnyvUW+/gh+fodN4AKk/8IiX4RbxZpoijiRotq5AO2
         +23rbPzeXxet7G6jM4ddTaNFLmbDW6BbbAvWkUAcmfla5LmPlMlRRRT2GwOmKvSRkGqL
         Y4gWdoWYqbP02cVUvO7m6JMt8hcBAGurUPVd2k4NjnqsRrMC7kT8t+lYkUd14Z8LPdfQ
         kP5fm0KBmuxjHB6bK67OfWBON0MJMeJL8VUD2T98PfCoG8AWb49JFwAW+b0w+la93MFS
         34rGuUYN5fTyBge3ttvTAuARlbZKi3hZhnioEmrM+ky2HYUoHsDOJN00xUwTJqbfqmN/
         j2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V6YdXQcJKoGShMqI3meu7thi6SVojkNDq4q5Q658lX4=;
        b=ZuDWzV2Su90yKYC7nPk0cxwhjQUQK/OEQRLh3gA+z0iFWNtRfZjeTb0WwAlnVWFDv3
         128tqRIJtorsQH9njDzcKOwigwsxA5bGHJilsnX3muYGMjt63DNYTF9wCCnbTOEYk0IQ
         KcFBbDJYzPIW8aV8o9jq/cV19oo4TDAKm50zuRtR6tLk1O7OZcMHYlYwTB9zuVYNhHq0
         Px8ld76uFkNWWDWA5w9hdVqPxDyS7zvwUmT0hFI8BoSSsTlNSPzhaAAEE+nXwD/HW6ec
         FE2PEHVtkmnwLpyoVdN/dknJy/f7toEpBYefgkg+PyjmFOKEGCyooWeABtlvjts4tI1i
         3NTw==
X-Gm-Message-State: APjAAAWyClzozXVxOprKu3mEY2GilCB0BJ3yEHMylQakUlaeOv07pv1Y
        oLK6mOv9n1NyUsbHyR4zRMJaJi5HHBvYf1U9zAicfA==
X-Google-Smtp-Source: APXvYqyafxODfliPqr6HCbdQrUM3eRMnPtQeCPNIN0jpSFzT4brd84bTSliJpWltnkD/FvgLbeu+a8Pfm6NbAZW1nLk=
X-Received: by 2002:a19:c505:: with SMTP id w5mr24643827lfe.115.1571226741070;
 Wed, 16 Oct 2019 04:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154650.1749-1-warthog618@gmail.com> <CAMRc=Mfkop3poFn7vaotxZfCJn=L+6w9uzNVCXTfa4AuVEmm1g@mail.gmail.com>
 <20191012005340.GA4059@sol> <CAMRc=MfqezSoanCuAuJhsn-PyQ8Z8+wDHtYsD0Ux0RztGPRo-g@mail.gmail.com>
In-Reply-To: <CAMRc=MfqezSoanCuAuJhsn-PyQ8Z8+wDHtYsD0Ux0RztGPRo-g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:52:09 +0200
Message-ID: <CACRpkdbXEJ8mNDbSKVyXxSBJyZ4BLLS9++2teBqGtsTh3O28ew@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: expose pull-up/pull-down line flags to userspace
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 12, 2019 at 7:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> sob., 12 pa=C5=BA 2019 o 02:53 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):

> > Should the updated series be a reply to this email (yours), or a new
> > v2 thread?
>
> In general every new version of a series should start a new thread.

It's actually a very tricky problem and we discussed it at the lates
maintainers summit and decided that some elaborate tooling to
track patch series is needed going forward.

See:
https://lwn.net/Articles/797613/

> OK I've got your v2 - looks like something I can apply on top of
> v5.4-rc2, so I'll try to review it tomorrow morning.

I give Bart some slack to look at the patches but I feel
we can apply them when everyone is aligned.

Yours,
Linus Walleij
