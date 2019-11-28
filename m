Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E053510C8A2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 13:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfK1MYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 07:24:21 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:43721 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1MYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 07:24:20 -0500
Received: by mail-lj1-f171.google.com with SMTP id a13so5129100ljm.10
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8S/M4qf8t2C/IOyeDHtP/oo1MfjxZSmptwPc8+v6Tcg=;
        b=gDnzr6zGfZ/Hu38TGU69vxvwhBhYH8dWFyk+ALpS6d+103E75XeQWFi8tbkpomhIop
         PTY/AhEAVcjf5lFxlVDC2WmEsIAkJ1EZ60UeklvtS3AAIDMuyZskD1PzlGw4GAkOF1ub
         qHFN1sKVrKDhwNUDS9/3yqEVDeJ4/fFVFRSIcgoe648cq5R1QOz4NfN1v5xKdbPzfRgg
         +r+k+mMBZ//F0NxmVNKNRS+P4z064wVffEyFf+cWgd6J/F4QOpICnFCZeGJQ1UuRsPDY
         MnMk3/mvJZpwtKLk5XBjVS78FOC7W0FpPlAk09xAfyGpC26Tt0dd0gaNDul03MlbbsDm
         ofGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8S/M4qf8t2C/IOyeDHtP/oo1MfjxZSmptwPc8+v6Tcg=;
        b=e0v//O3eSxeedNgsAlnYzhxm8eTwSp9ehfXjwHDs/AO1u6QmCSqgFTyUd3nHFTi063
         VPHgOnqbUuc0iimVhZNwvjTGblAyrYSjHyK2OCaN1Ate/YDVmhMNKuzeKkjXe3+Hj2p1
         toyVBLrjrgAzrXliv5B8IhCIDaZZmqwvYS3ogINn8egbzpzhvZHV8Mad3RoiSzVwK71y
         rKJU+i4vooJXV44ckQkLDm9jNPJWocq4n7NVwMA50JJ+HalanBoA4GX/h03KpcFtCRaS
         ZzelWIIwg985OZxRPNV5lpxbjckLoTddwDlrl8+ygKNQKO03spP+hz1GUH2sjp39/Kjm
         lPuQ==
X-Gm-Message-State: APjAAAWu0bTZ1UTLT5wkC1+TcXjGO9gZIhfG5AQ9Q07VOk70XMW1AEB+
        tcXMaOcJo10Ltsxu3sAuxZVeGheB1u9GiyEWu1BZBA==
X-Google-Smtp-Source: APXvYqzO5ZSdPwGslcWS25E66KWPxoqrLgkUcadAdV4iioFDGxvqhe3aWpyH3tEpQtMYlYfED3u899egNXINANcYQeY=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr33240954ljb.42.1574943857219;
 Thu, 28 Nov 2019 04:24:17 -0800 (PST)
MIME-Version: 1.0
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
 <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com> <77b3a320-20a3-5993-b7cb-e3d6f171cd56@raspberrypi.org>
In-Reply-To: <77b3a320-20a3-5993-b7cb-e3d6f171cd56@raspberrypi.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:24:05 +0100
Message-ID: <CACRpkdZhoms7+gdM742=r+AsVyNPZkb2zcR3-yrTujvBFR0mCg@mail.gmail.com>
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
To:     Phil Elwell <phil@raspberrypi.org>
Cc:     Phil Reid <preid@electromag.com.au>,
        Jason Kridner <jkridner@gmail.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2019 at 10:25 AM Phil Elwell <phil@raspberrypi.org> wrote:
> [Me]
> > By introducing such child nodes it gets possible to reference
> > these chips by phandle <&mcp1 ...>;
> >
> > Notice use of reg attribute to address subchip.
>
> I've not spent enough time in this area to know all of the rules and
> conventions, but it strikes me that if you treat the parent as a kind of
> bus and the "reg" properties as being the addresses (rather than
> indexes) then you no longer need the present mask.

Indeed, that would involve deprecating the present mask and
use the reg =<> property to figure out which chips are
connected instead.

Yours,
Linus Walleij
