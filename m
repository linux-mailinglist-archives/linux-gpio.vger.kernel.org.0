Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAE063910
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 18:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfGIQIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 12:08:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbfGIQIh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jul 2019 12:08:37 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F28921707;
        Tue,  9 Jul 2019 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562688516;
        bh=7G04If6utmtPjNzVDfxUufKY34dDgpvovPzQqyazXb8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cTrgdmMJcvTCuNw1nfm04tZ5/5CpDMD5AhFJoEF2tsh6UPKJ5ToYiTbvx2IU2Gil/
         UQ9NlU+6Mlh94lnUVLQGrfUqhDPBzkjCfhd3aHNzxo3CnoGw3dQrh1yKSfUy9DgGAE
         Ad9Ez7HNcYjBLlVPZUz7wS56OK/nfjfcCHs6px4I=
Received: by mail-qk1-f177.google.com with SMTP id d15so16430068qkl.4;
        Tue, 09 Jul 2019 09:08:36 -0700 (PDT)
X-Gm-Message-State: APjAAAU40XUJy8jk/OtECED4ZGyZ36ON/uUj1/nx+i10nmqqqly+wLpi
        QDtFfFu93MNRpmMPfMcNOLQDr7b1Kek+iZ7DAw==
X-Google-Smtp-Source: APXvYqyArqBcWiLb04f/lmcNo1mBs4Ui/VJwoNEOVLGeCirWfaiYQyFlnPu1fW9GNCsgvVbCvwbAlnXBHnQu5FtG0M0=
X-Received: by 2002:a37:6944:: with SMTP id e65mr17596167qkc.119.1562688515464;
 Tue, 09 Jul 2019 09:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com> <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
In-Reply-To: <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 9 Jul 2019 10:08:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
Message-ID: <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 8, 2019 at 11:25 PM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
>
> Hi Rob,
>
>
> On 09/07/19 4:06 AM, Rob Herring wrote:
> > On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
> > <harish_kandiga@mentor.com> wrote:
> >> Document the device tree binding for the inverter gpio
> >> controller to configure the polarity of the gpio pins
> >> used by the consumers.
> >>
> >> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> >> ---
> >>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >> new file mode 100644
> >> index 0000000..8bb6b2e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> >> @@ -0,0 +1,29 @@
> >> +GPIO-INVERTER
> >> +======
> >> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
> >> +allows to properly describe the gpio polarities on the hardware.
> > I don't understand. Please explain this in terms of the hardware, not a driver.
>
>
> gpio inverters can be used on different hardware to alter the polarity of gpio chips.
> The polarity of pins can change from hardware to hardware with the use of inverters.

Yes, I know what an inverter is.

> This device tree binding models gpio inverters in the device tree to properly describe the hardware.

We already define the active state of GPIOs in the consumers. If
there's an inverter in the middle, the consumer active state is simply
inverted. I don't agree that that is a hack as Linus said without some
reasoning why an inverter needs to be modeled in DT. Anything about
what 'userspace' needs is not a reason. That's a Linux thing that has
little to do with hardware description.

Rob
