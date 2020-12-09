Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9532D3E88
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 10:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgLIJVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 04:21:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgLIJVb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 04:21:31 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D12C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 01:20:51 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y22so1408452ljn.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mr09ffXdVmc89p6dDRlCyEcatrToejix5SUivzuIsk=;
        b=axTtZsMbIWlnygCChz8g7xt2gAeXugayM40N/ag0rKiUwvn83qmt+qsPuXls5upxmu
         3qBtic4iapQFl7fhO8ICfG2eGCtKBz8ZuR86zE6Jf/O19m3X/NESm2UaHFr8vQm6lz99
         nL2LFqsJLJNwlcLW/Ortk8aJT1fe+N62rIvQTdl3VCZGaAxxg0ZDsahdwDz8Bv4rbrIB
         tVoAav+6gJBEI42Rc1iJJF/AAAVXsMVDLYp1BvT+XqF08AGxMa5Qhe/mgIkAI/6pz2I2
         6z4CyvrbVeScRKYO1wkUxKCDJo7dnZFQWkW/jlez9ychli6QTYEM8SrA26t9VNupVheq
         oGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mr09ffXdVmc89p6dDRlCyEcatrToejix5SUivzuIsk=;
        b=KNdTw4KY2JnfHw/KZHVgATFB5BymDPjW5tXuHwd88i5/e1gXLX5TZFfSElovq6QkHV
         N9jWrw3/e12AzbQf3G+0EVc9ecOglMBbWMGnWSumwZ9njhubxXjxizucT5YKLjIm1Fc1
         diKbZ1hI8CMB4kSQDIzCCAEKKu6MRl3QDQpOOw16RdojcWY6BHnonWi1DaAmlHZiD1iV
         nYQAOuTDr/ecTR93F89hbe5yq/Ta8UWRhr1MqGm6TUemn0rHndyi1Egq90jjrO+ISmd9
         tqepFdVQ0zHmo3ZsHYUHxnx1YihSAAZOJAYM77nrQqAq8w18ipR4rp5nKczwIBVhZmBl
         tHEA==
X-Gm-Message-State: AOAM532HoZ7g+ywVpgWruT/mlslv1/jR7+wqOBkAh3nBFa1FqEoycPF0
        KCQSa2wx9pNOQF1DSLWce9NUBcxj61cjF4k/vIh9xg==
X-Google-Smtp-Source: ABdhPJyzvFZ5i/+cIo/v7GMXy5y7QF210K4A/VhM09QlXGBziof1oFuyBn/PxeMLTnvBvuKpDbiZHch59dU8k5OOBXk=
X-Received: by 2002:a05:651c:29c:: with SMTP id b28mr697854ljo.368.1607505649530;
 Wed, 09 Dec 2020 01:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20201204164739.781812-1-maz@kernel.org> <X841xwCChUEqi5Ad@localhost>
 <73d57fe9fefe50955771846ea52004fb@kernel.org> <X85FVc07Hc7LQQU8@localhost>
 <d5fa2065009d5854b4c719003ebcb255@kernel.org> <X85O9GoDcbiDp97j@localhost>
In-Reply-To: <X85O9GoDcbiDp97j@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 10:20:38 +0100
Message-ID: <CACRpkdZ06vWY+mqR7bYd_WcEM6+N6v5GgTAYhr0p0KkNLa3Qnw@mail.gmail.com>
Subject: Re: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
To:     Johan Hovold <johan@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 4:48 PM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Dec 07, 2020 at 03:34:23PM +0000, Marc Zyngier wrote:

> > If they claim that their lines are available, and then refuse to
> > let the user play with it, that's just a bug willing to be fixed.
>
> My point was that this is how *all* gpio drivers work, and that muxing
> is somewhat orthogonal to the gpio controller implementation.

This is true. It's because it is orthogonal that the separate subsystem
for pin control including pin muxing exists.

Should I be really overly picky, the drivers that can mux lines like
this should be implementing the pin control mux driver side as
well just to make Linux aware of this. But if the muxing cannot
be changed by the kernel (albeit with special tools) then it would
be pretty overengineered for this case. Things would be much
easier if this wasn't some flashing configuration but more of a
runtime thing (which is kind of the implicit assumption in pin
control land).

We don't really have many drivers that are "muxable by
(intrusive) flashing" as opposed to "muxable by setting some
bits" so in that way these FTDI drivers and siblings are special.

So this needs some special considerations to become user
friendly I think.

Yours,
Linus Walleij
