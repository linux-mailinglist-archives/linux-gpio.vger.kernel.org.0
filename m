Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E85258173
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 13:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfF0L0X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 07:26:23 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37635 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfF0L0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 07:26:23 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so1327619lfb.4
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yf/4QsQz71xnsufXmplIhM5PQjWjtA8iRNvCLywUsCI=;
        b=HiozRSV9jjoEd8lgVneXDXnUBP1+IEYIg+jfVj3yu3YE2rDCh0mQf6PCltXafOZuRQ
         wgzquUBxyhWo7PDBS9m/LWFwnCANPBpvCZrQYE2oHj20GZq/2E9ThKk3E8NPw81Lz1IR
         6wqLETMA8WyJzKNmXnDzqbNY6sUIuKzxUMVE+GnlYNfor+m9ZCB+VLKecag/t5wKJ6Jd
         T9zmH0RwA2Aq86TTmuzE2Qjhpw0IXYMX8T1nY+VIb685SluVHK84SiGlfHixp33uk0NX
         kmZSALvd+oLO52Ab1ZdDT5vg1sdlJ8tHsJXVo/3VFxdWskcobVYms8f/hqACvEI3a+uf
         LmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yf/4QsQz71xnsufXmplIhM5PQjWjtA8iRNvCLywUsCI=;
        b=BsubYQjOc4ltWwkZ6DyoKTgSN4MAZPgYZpNKDJ3BHqbVFuysWaiMnm762DZvSoDpum
         b4M4Bp6APKzYqwNUkhgkVZkqbPmtLWrb3HCxTBCi+ZJ61SJMB3nqKxKPx6jT94N90+co
         sM8Ff/iv9KSLs80Kx5FtXwakGtjH+b0QpzvFbvMubF10+GsdOSAg7dqyS+uuV3jlPU+J
         MUBcj7l2UcEp5nbWcepD/BfDVGrn/8TMy5bvnlls6gPcisIopmTj9Psy+nzAn65L8CQE
         Ot8AswB01J0R/W/907YsgQ8WIXw4hd+M71JphQ2v8QCmDD4RYAU/KEppZBquY2ebY4Lh
         NhEA==
X-Gm-Message-State: APjAAAXWPQAxZsFCvqyrdfOdyIfbSWGp2le5Ty9XdMyfEBg0NJvhCgAO
        eAwMIPWI6JfngtK7e6MouKpZBeLSz3FiiVFXk02rKg==
X-Google-Smtp-Source: APXvYqzeLT9m0qZPhFXMQe7bGeM0G0YNhFKZNBdroL1getpvV13XvxWgav2h1PfavnIunwZFc7NAtBe9miLt5qxA34s=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr1687908lfg.152.1561634781537;
 Thu, 27 Jun 2019 04:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au> <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
In-Reply-To: <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:26:10 +0100
Message-ID: <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document
 in two
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 27, 2019 at 4:32 AM Joel Stanley <joel@jms.id.au> wrote:

> I think we can use this as an opportunity to drop the unused g4-scu
> compatible from the bindings. Similarly for the g5.
>
> Acked-by: Joel Stanley <joel@jms.id.au>

I assume I should wait for a new version of the patches that does
this?

Yours,
Linus Walleij
