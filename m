Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77601D0ABC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 11:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfJIJPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 05:15:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46357 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfJIJPB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 05:15:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id d1so1655317ljl.13
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xQdw4R3yd8uY4S0AtwkeNETH9sjE+3/5zjSKDJPgdeE=;
        b=TIgenNV5yjiuaPo8U4iDSsdkJpOwEyS2e7UUrQX2nTTWYVsQB4Htt02bvBiEe6BbQp
         i86i29qVWjmb/JPgBrJ6OER5+lvhqH6FgTCOs/IOqooN/OKMWpkug8tHGF+pyL5Lp7Cl
         UT5Rw/hlVPjaoO7C5CofjZQqsK4fkQP2kSrhekmXnPUOJMLpM9zI7Y7jFr3FEB6fYR6V
         ovsoIfeMEN8xPf5LltPze2Y4SuVcLJXYy/O2m39ul3t648SV1rsqMZ0Sz/cyBRniF5x7
         SJ/1Uk1aJNdvG42tH55iwL27WB+Fwtvr63zcOzLI/yereccG3BD8t0w3v97rZ7ntnAm5
         8/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xQdw4R3yd8uY4S0AtwkeNETH9sjE+3/5zjSKDJPgdeE=;
        b=oJwmE/TYsYjZZwnlbyteu5ClyALcrbzHedzVBu6KzsIlKydBseMZVFhxgnRm+8DfTv
         DclFYT1DX5yZjsyBzA6x9SGjkozN5MrANmCqxMHKsjiAJAOskEzWvE8JRvSp7h/yZUbY
         4jaKgF7zN1Q8ozltrr9KXCIEfcE1BIA4JKFrHbI2o+E7CYvtiGYDSWY5J13uIEHgCk4g
         b9Q/Jl+bViQLPfBu8wwlutURunyiMOYIe3bgHaRXYRxeAofZ02T39M4qnFWkPlnsxSGL
         QX0rAYqURa1YphEdXN6JrPJBczbvZG/IkpQDa6fqjB9loaxOquSKEOeUTV/q9Sbp6Fx7
         Chvw==
X-Gm-Message-State: APjAAAWtG2FBSDumW54arSySP2lsWQXmh/GVLspwSVSUI0c7PXrXxoC2
        g/FB9wJhfpvV4ky1sULm/gjwSovtwodxMkXRyIYDIg==
X-Google-Smtp-Source: APXvYqycTPdHDVThk2pK4GG2ep2AmGYzjIumLcOCNe4xXDx0G71eKy3H+MRX39MjAYgpKolX5namsNiR8Yb4NF+D/Q8=
X-Received: by 2002:a2e:481a:: with SMTP id v26mr1567972lja.41.1570612499161;
 Wed, 09 Oct 2019 02:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191004164059.10397-1-j.neuschaefer@gmx.net> <20191004164059.10397-2-j.neuschaefer@gmx.net>
In-Reply-To: <20191004164059.10397-2-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 11:14:47 +0200
Message-ID: <CACRpkdbxgqpQwLFGh1woq3cyY_Y=rBkkBafXJGW4_jtZae-42A@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: driver-api: bt8xxgpio: Revive dead link
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michael Buesch <m@bues.ch>, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 6:42 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> www.bu3sch.de has been unusable for several years, but the same
> information is available on bues.ch.
>
> Cc: Michael Buesch <m@bues.ch>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied.

Yours,
Linus Walleij
