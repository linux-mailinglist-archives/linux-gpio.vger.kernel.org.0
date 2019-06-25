Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E955654EBF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbfFYMZ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:25:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41750 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730427AbfFYMZ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:25:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so12483758lfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXFxBqw289PiWNcgire0HT3ql8msXi7Wbz9KDkqpi9s=;
        b=MRAi30L3bCnSstOAPK/5ckcFQXdc0wInrW51IaGWdmmXBFt61il5F8ZihENHrES6Sz
         A2gfTv6F6/mUQ1hGF0IliwV+O0FoVXmnwA27MN1197oDkrwe0Hi/euIeh0I/e8zRwLgI
         B96q10pu6xOvJvT96ewCQmj7xRCeReAq/kigc7RqYiguG/g1LmS2U+Jqm5eZcB10V30P
         n1xKUvlYhN7Wnj+Yn6gNqa//q0nip2EJKCYm4ov9IZvxiKcc17gouzhVRXMZya7Iff4C
         lW2YQjDxDHSucaIJuJ9qvDTzQoa0DUBHFUUnsRd1LRv4Ks9d9wHsSNTg7RA2sbTLxnRZ
         +rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXFxBqw289PiWNcgire0HT3ql8msXi7Wbz9KDkqpi9s=;
        b=aQFVdxa4VJAFgKNn4ypRGSkOcrqhAUdRQ1H+vDEJjtl+uEKp+ga07DU9hyyXktFKZ4
         NgUkxlODQkmEZ6uB8LBMLFso6DZoFG6vHbQp6bDU3H00zG5MIualQ+mnH7AopedlR2M2
         xSUrOAQCuGUV9qkJFGq1lgUw/wirnpFStsRO9b34xzgcII0gtxnUeCPJw+uz7Kh+Z3pn
         EuJcHpYHE6XqiFFXU3GqnZr0QFixcbLXhzNTTYdPWvcBIXAPmfpY7vudwNLOPj0sG9/F
         zSwP4Gh9f0flCHfb/Y2MiW63Ygg7UXLXpQyz+5/F9Jn9G2ya9mV03I684+xGmLFBy3ZD
         C/cQ==
X-Gm-Message-State: APjAAAW+sIXgP8Z4HnWSps9v28bsPC1y99UaMOdJ8EzL09DkIeXQVlaC
        m/sw8j9CHpJK76N21cYrZLCc3fh4zLbrMQiNruGk9A==
X-Google-Smtp-Source: APXvYqwMJafEsEK9ql82gdFybiq+Gag7JQbBkAhot7eiscPpABkzdiTqqeOrWV0XFwZvPlNTuzHyscjkjG+lDDOrlRA=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr13951212lfu.141.1561465526510;
 Tue, 25 Jun 2019 05:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:25:15 +0200
Message-ID: <CACRpkdbg3ewD0gexLk3+nF0ihyhnPPpWj13YDqxgvT_4urhbzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 11:55 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The 98DX1135 is similar to the 98DX4122 except the MPP options differ.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Patch applied as uncontroversial.

Yours,
Linus Walleij
