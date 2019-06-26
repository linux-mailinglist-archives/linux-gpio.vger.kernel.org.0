Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACBA563C8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfFZHzD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:55:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42286 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfFZHzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 03:55:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id x144so881160lfa.9
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uxdb5wlFiHBkF0SzBr5FCoS6f7qiRJDmJ1nDITQi0Dw=;
        b=m4n+hEZBjSl7z0DhNNkX163BSsqoZWM4Vv+1gORRGXGEyJ7mgvy8Zc8GCjHlf4UKZz
         SzMf+PwcnfQVBQlF5KWvIDwyzUIxJ7y8dF0ZlSMbLEux5PVwVzK4/wbX9p4C8vgQ/cLs
         OUbHAOtvtatcVcy7T1n4ClVtN3VfJxaFeTz9bcmjm4NswEVlKTTEOdLN3B2cSJv7ML0f
         dvtb1Yp4GYrbdmAvQMxiXVkk1qnZ3vPnuwsJuJsMmiLyQuiZlld8WbxJpyxD51HVUsuJ
         2K7Yy6aTQwOkloLhCUNTijNxeAkHbkDQA7u5SUW/B8m94CyiFyIogZRFeit4jthgmS/Y
         vi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxdb5wlFiHBkF0SzBr5FCoS6f7qiRJDmJ1nDITQi0Dw=;
        b=kzomn13Oltx1YRT2hAFii2jaAeQuC6CWQfnr+VU/dDincSgK5l9bEIXmkqLdngdBcI
         BqYQnC1jeKDdUuaGGr4nsTJ8m19WGbF6kPFS/b/Uow88QDt82EN2ghHPxelucdgFfHgR
         vJahlrCeKHdUdX2oS3FAWxx5ehK46iSl7PJHKQtnc0X28rzD0Zm/G52lgBHUu9bVg2Nv
         ZsGOr0gpdbznUOHmAnuGOtdhYyvFhDoPzcJmQBKwraVMoSRK9Z9dRkvPToW0nRjZS9dE
         KMFrutpowK0ifb5Mce5OA8FnOyG6e7wIpEB7Dt0Lqg8iqNLcYJZi4Zoz1rfdrNfDrEel
         M0Tw==
X-Gm-Message-State: APjAAAWUDm060puGIAIC7SVGds5ytWWa7ompYzJj3qJIKNt0UxX8Vr62
        VeNxUU66OqB6hjDWKTK95Z3xAZ62kVoSqJ58/6D7ZQ==
X-Google-Smtp-Source: APXvYqzo+qALg1dJHN8BZKGNryj1b2QPxrO2/Ylr70oC8XJ11Le0Cn/eflBCqD0MzHpKgDWXJ6rrs+q++1xhp5JnKPs=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr1916988lfm.61.1561535701468;
 Wed, 26 Jun 2019 00:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 09:54:50 +0200
Message-ID: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.

All looks good to me, but Rob should have a glance at the DT bindings
and YAML syntax before I proceed to apply them.

Yours,
Linus Walleij
