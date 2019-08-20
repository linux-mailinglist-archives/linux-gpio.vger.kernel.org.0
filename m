Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B2595A06
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 10:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbfHTInN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 04:43:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44498 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbfHTInN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 04:43:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id e24so4323680ljg.11
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=egHBSirWhA2tRzNEWS7EA8za7W+H564H69VCEGAVeaE=;
        b=t7oeuosE0kuKEQ1QqhRjL3+IpFNYRQjOUdUe5VesaqrHuf4GmLpAFEHV9vlJCk30IW
         NEf9h8c94viE18QIzV9U7jaOfhB1cyDfgF3IN5dLurjOYRy9RRu+cJPIMChjQnGuzC5a
         H19OubPTOvv673TAmQd4B2xcfYnDs/6DpkMc5w2MgA7KxDyR7/PNDKU4Zp/NFHTpg1hg
         OhGdziIsZzjH3gFYk/6HQYzIZSKWdPnqhyBnG5UxFkmEaVvrBm7UYlC795+SIdTfbAlG
         rJxDMiGTtOYiEW2YbfK0baZpkzcyR+xWx++eBi4jWLDRT5CPpcG9FcmN6yLy6+uTuX/u
         h/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=egHBSirWhA2tRzNEWS7EA8za7W+H564H69VCEGAVeaE=;
        b=GMh+WeBl+G9f4G9MN3lqeF9cFOnEb+7eUxxag5/0L9eObA2vI+eZBIJBaIEOtGit9+
         lXRw5NPDCJ+x6J97MKA1uHblbcNO86MSjfkw0+TVZZeHodb+2Tr0kMdOwRCZjd9seAnQ
         2tB2Mjbn6EtQNFbDWbCKd978e2yYGf1bkako3RtN9AyrHNwoheI3tMMRo2d8sW+WqvFC
         UlPh1XLlHnWOL9uXUuuDW+GXw0PhiNAm/8ah3CLnyxh72j/C/6sHzVDIxoccSu8mUJv6
         bfGZcmejgExAMnVUvAcfi8hnW+NGj5imWJBDA4MAbzvnBMmUXd/ncno98JTbJuNFZ31F
         5unQ==
X-Gm-Message-State: APjAAAVDbd0RWiSyRe/HyyAg2pxZW1O+ZT8izsPg5XnAZ66lfDoBfqTE
        fml4MiyVwE9mWaZJ1+3MbKpP/vloOVQEcUx1pvUbjg==
X-Google-Smtp-Source: APXvYqzFE5kHFt/VehcwbLVEeDEbpHou3gDhcuoJtQ74qkWhFAy0+ftrTMwrrXJfrpm/a4c4WKhqe9GC8AZo0VqdN/4=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr13541792lji.37.1566290591070;
 Tue, 20 Aug 2019 01:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131002.14597-1-uwe@kleine-koenig.org> <9d01ed54-4c20-a4d3-f5b1-8ec2aac09ea0@kleine-koenig.org>
 <CACRpkdYjeNFP0KrF+RpFOvWWzmY5iKcRK9EOPqMX3t_6vwhbeA@mail.gmail.com> <76951bc1-24a2-0d90-c977-55dfeb71d056@kleine-koenig.org>
In-Reply-To: <76951bc1-24a2-0d90-c977-55dfeb71d056@kleine-koenig.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 10:42:59 +0200
Message-ID: <CACRpkdYVuZJJMXQmGsMVvEwRxr2e+SuBGFgFz6_8aGDpTVjJrQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: don't depend twice on GPIOLIB
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 19, 2019 at 7:49 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
> On 8/15/19 10:15 AM, Linus Walleij wrote:

> > I downloaded from lore.kernel.org and applied, thanks!
>
> Thanks for that. Though I'm not entirely happy with that as this
> procedure messed up my name in my S-o-b. Would you mind to fix that?

Grrr lore.kernel.org can't be trusted to handle UTF-8 right...

OK fixed it by hand, thanks for pointing it out.

Yours,
Linus Walleij
