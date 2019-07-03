Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF605E4A5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 14:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfGCM52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 08:57:28 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45914 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCM52 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 08:57:28 -0400
Received: by mail-ot1-f65.google.com with SMTP id x21so2187423otq.12;
        Wed, 03 Jul 2019 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Almj/mPu2GGnzdAauKcQzrTaJcvUxIHQhCGQ8lryKk=;
        b=YKHtBzDUjhxaZ28aPgECznKWhEmMjsPYoA0rjIqlStH4xfxBMJSjkrVCLzE29wBoUh
         /3YCQocdYjHDiFtyb0w0cxPatipE8ciQqO1uaVhuS4DJzbDM5O587UYoL0MLqkZgymGe
         PRzf5+n0/5bVCBmQtEe2aaDVCej3UAoKuuar8f3MebbwiyOdjUwJFHWiE/B9hWPfY7B7
         DTC7cbppK7jJTCYbCERDMBHTvJfgoV7/wHcTn8LP44lhNbwd4+kOgG2E+omW5B3hh0ic
         e/tGwhZYLB0qP9Z7ZROtzzv8SXriY+sbCoBiObrpeBU0bJXIB4dbA2IJk+rfSFwgNH8x
         wrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Almj/mPu2GGnzdAauKcQzrTaJcvUxIHQhCGQ8lryKk=;
        b=KxTv0QS3JTlia2PjXRIKVuqhC6JsTVS1XBuenrCHi29pwpxiiYqk18ooFwJGBqmUie
         0+yG4IwM6j7XSlQjzDHw0k/GFzXTlxcMohZ0YYS/pjwnOMR88oHtUVyQrZnQAqZDVrXN
         wTIoxUWpdccCgSw48eAJGdi1V5BZL+gGSd3whjDj9MBfRMCj8qDIjUA4vtbYRjOfhuJL
         RYzp7jNUQgfXY4cjCSgk40Nn4a1FFlfx2Y09gA5XYWvBoeq6wKWAmrOV9UBTI41C14ep
         0hSY8f7xsMoL0RczeHjQJoENKb9FV5ednboBH1dKCx3OfhkxAVJdW7LkIAZJzU97hJOE
         e6Rg==
X-Gm-Message-State: APjAAAXEMAQ7ULNctcMI4KLfHPOP9GIBjlVkPbCCfLB6qE1kRSjwtR4j
        TtygDLQ7nD1OjKtsU5PbR4rIsnfx2wV1Sd2rYQw=
X-Google-Smtp-Source: APXvYqwx8FO+d2S1YP0ZeOa6b/jwOvDRoFFG8LiT5wh9lheOLPk0uLlsHBYrkyTFF84DqkcEiFFiIuupCEIeurWzIqw=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr27944279ota.42.1562158647652;
 Wed, 03 Jul 2019 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-5-narmstrong@baylibre.com> <CAFBinCA1gUUbEj=++1rGcFQ1RdyxSheofAo=TKw3-UaenFAcug@mail.gmail.com>
 <301695b6-52ba-92b1-ca1a-d4d587b33eeb@baylibre.com> <1jo92b70ko.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jo92b70ko.fsf@starbuckisacylon.baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 14:57:16 +0200
Message-ID: <CAFBinCA5RrTM8Ws_0goDqipi90KbhaXhwKGPVXj+dCoi7P-OFA@mail.gmail.com>
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        amergnat@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 2:40 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Wed 03 Jul 2019 at 13:45, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> > On 03/07/2019 01:16, Martin Blumenstingl wrote:
> >> +Cc Alexandre Mergnat
> >>
> >> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>>
> >>> Add a setup() callback in the eeclk structure, to call an optional
> >>> call() function at end of eeclk probe to setup clocks.
> >>>
> >>> It's used for the G12A clock controller to setup the CPU clock notifiers.
> >>>
> >>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> this will probably work fine, but I want do double check first
> >>
> >> are we planning to get rid of meson-eeclk (mid-term)?
> >
> > AFAIK no, but maybe I'm not aware of it !
> >
> > Neil
> >
> >> Alex has some patches to get rid of all these IN_PREFIX logic.
>
> The prefix logic will go away with Alex's rework, so are the input clock
> But meson-eeclk, which is just a common probe function do avoid
> repeating the same things over and over, will stay
OK, thank you for clarifying this

> >> I'm asking because if we want to get rid of meson-eeclk it may be the
>
> May I ask why ?
I only remember that Stephen asked us to get rid of something in our clock code
I was under the impression that it was meson-eeclk, but I cannot find
it anymore (that means I'm mixing it up with some other topic)
