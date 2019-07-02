Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01A85D6FF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2019 21:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfGBTlS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 15:41:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33158 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfGBTlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 15:41:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so18194388ljg.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2019 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYo3fqkgckZ01WAJt3EqS51tHEujjvkKZjkmoWDUa9A=;
        b=Xpi3vAPbwBAlVsv0euo5n4oQ6uuO0hk1xXNMSeCj4fUnq4AY25PEkmkkI++aTo2Jw6
         VJwf1SKbDpivAthOmK8wEUGxRyBzWbKmFvdQL/QKpH03GQa9FORJz3/kIm2l6tdlaxfh
         ZVStIPp9g7LN3Aj+SAe5pG+D9WKFIA/iFRIzuR/XbnJJ6rby72ncCB/IxAtewnquIwVp
         /lpu5mCEpcVKdkFRRaOpI7ciD3GB+R7FpPV5XY/LLm1zFLw8BcgTlwMQhs6ZVP6mzKMx
         jrU8gqcGwPkF/D2xuzoRmYeWk1aR2Szmd6ehrRYJGi7AAsXu87HzRwGNLW3CP4QasQ6i
         vDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYo3fqkgckZ01WAJt3EqS51tHEujjvkKZjkmoWDUa9A=;
        b=cR9h7hyzc11BY17AZRf2dyRk48JQ7oMS5gyZR2W663T2RvsMx27rxBAV1g8BgIiswC
         il3CsSPMi4mtB8aGm/4NkI7TJfEcGBPzS9grw2hhBtVz9rEeTxgWfxrIvyJqqLgy0wIM
         OSnsdkufnHPREcXNpurck++jl+NYAMW0A/CPQdKj+Rml5vAmKgLz4EYckwVevFYaslyy
         c+6NqwjfZcvi4a91dL0/lszxgMdGFGnIMbg1gprnNDTjq5Vk3yzzcsWKG58IboxTx1VG
         SfCinKnwdXp8CcejssObvacpgc4eXBWyZuTXGj2x0WXyVHWHCbOQMEm7d9VehdP6ivP+
         Cz3A==
X-Gm-Message-State: APjAAAWd1k9CNKmNIj81q9lPeUKE7L+6o766cJSYiEDvddMXHtkaQdeI
        /di1WHcaF8ddy7s6CBNcqZb19InhsKj0uBsecVmPqyTQ
X-Google-Smtp-Source: APXvYqzlfSQ2odWRbFfHpnUHsDrMaxebp6ZbRHkkCp3wBOqoPBe3KPJAJ7knDKlNyx6IHJexgvlVZtuUd8j5oYh2UUo=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr18257301ljs.54.1562096476358;
 Tue, 02 Jul 2019 12:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190701172517.31641-1-linus.walleij@linaro.org>
 <20190702113914.GH2793@sirena.org.uk> <CACRpkdbng1M=5BnzFuiubRaqM1Bu4eLxqKvb3fCQuqyKsVcBjg@mail.gmail.com>
In-Reply-To: <CACRpkdbng1M=5BnzFuiubRaqM1Bu4eLxqKvb3fCQuqyKsVcBjg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Jul 2019 21:41:04 +0200
Message-ID: <CACRpkdZ=FTUc2xTx9JJtU1c8x0s8N3c_=wbUzJpCRq=_xV9HKw@mail.gmail.com>
Subject: Re: [PATCH] Revert "spi: gpio: Don't request CS GPIO in DT use-case"
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi <linux-spi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 2, 2019 at 3:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> I am trying to rootcause it, I suspect I was just the first to try this
> on real hardware actually.

Ha! I found it. Only affects active high CS GPIO users.
A nasty one. Sent a patch.

Yours,
Linus Walleij
