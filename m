Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B81192978C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391088AbfEXLuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:50:08 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40136 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390920AbfEXLuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:50:07 -0400
Received: by mail-lf1-f67.google.com with SMTP id h13so6915046lfc.7
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AL2d0pjlVBmIWRs6fr455brLUAHkmqGB07RrA1F6UsQ=;
        b=h4/4vz3LD2ZII4MSJYVeGvEjd8RGbaXMRdluTLEVzPBGwfPTSo43vsYoHYH/xySLNX
         V3rGq013VRND/0yAuj7v5uqA7np6Ia3LuEJ6wQ25a8Wtm78bve/xXkyTWTs0vJJsXk7K
         PNhUmZcnHMsLAxNUFohIKBAKVFCyISAmeJe80Tox/KO2IeSu/8Jx4IWxl4SsrBCoU7CT
         AOyrklKJAz8x5PVopaL4hoIOkev5AbUTo1Jz/q03XW38IygBl/52Jwk3PZIfyKlRDDAU
         J81VG4MVmf005/SerSCAeZwN7SndZOQlGCaigSqqUn2XzmvwgxU/qS3+d0xxB1jItMgH
         8dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AL2d0pjlVBmIWRs6fr455brLUAHkmqGB07RrA1F6UsQ=;
        b=dUblIMFj6sBUFmvpvzU+TjslbBF9yJfwEP2zWS65SUFW91ZargO0uIE8iEQ7AuKhOR
         LTyqLs9QrAhYFIi4PKK3e2mH95hE3K6vfAhe+ZMfplvG1hEgWv501SOEQtpgI9TjJSdc
         JK9e1iiATldJed3K+GO8GifsfOnuWw4PBOVe8TspZq1fM1gYb6yVSa2nIiz0glWWZveO
         M4+nFcUDJOZwX1gKFe6PgqD9NOLGhyI1MmX8cH+P1o+OuTtnDvACMy9KezWzn8YPqar2
         yuQOm5SHRIQ6MmGIX+UXUSjtx3VOBpIglqNmqjDf7DoUJK9713gjazhga52oLeEPySKp
         saKg==
X-Gm-Message-State: APjAAAV016TRVy7ydGDrbDxLYlCLzI39fNFO3daRor2au3trHLgB1gfc
        3lkwqCIT4I+EQCPWSVC0wpEBeDw4QlcTwH3qWsI8Iw==
X-Google-Smtp-Source: APXvYqwbOkonOaKhd8YCRIfmv8xAdTAD2vdgJCKAFZSw069Ovzk2VCRpvhyKKNBx3bpZuWAcz7AuNGltRgMJWnNejjw=
X-Received: by 2002:a19:4cd5:: with SMTP id z204mr5666594lfa.113.1558698606083;
 Fri, 24 May 2019 04:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190516151339.25846-1-jbrunet@baylibre.com> <20190516151339.25846-3-jbrunet@baylibre.com>
In-Reply-To: <20190516151339.25846-3-jbrunet@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:49:54 +0200
Message-ID: <CACRpkdbxudSAD8rHbzpPFSAhxmd39=Jt62AKEXQV2CaDEZZQGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: meson: add output support in pinconf
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 5:13 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add pinconf support for PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT
> in the meson pinctrl driver.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
