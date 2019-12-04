Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27097112BDE
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbfLDMqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:46:01 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35246 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbfLDMqB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:46:01 -0500
Received: by mail-pl1-f193.google.com with SMTP id s10so3149349plp.2;
        Wed, 04 Dec 2019 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7KRyugQkUo1uugWvFUnJA54Xc08BpIiKwl8qPG7HyXI=;
        b=Hk5xGXTlyDmBDUPDKmXASJB5PmhzzcuKE+nEmqt9PciCUeNJJQVFgIl7W7TGqr17GR
         a49gzV5UP20H961EF6e+CNubW4ctF5diI8L2q3bQ4z/FW9/t7hHZ+M28MJmSATQhYdy2
         CieHfUXgz7glYYd27j4iQRiniB5IGXdpdmVCw7mOgX4MW6xVAexnZdYxDYUhWmMOrqOe
         bCZeZ0fNCqR4x7+Q+WWEfExljhS0pTapWWerIrf9eb5EOTw0upfUhgOz9O8rcVUcucxz
         /g9PbIK0mMHTrP6nZOTtdlsg0CSTKoR6pxn7WrMlt7XWd5r2J61KjTxYiWlr8FslOy8q
         WKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7KRyugQkUo1uugWvFUnJA54Xc08BpIiKwl8qPG7HyXI=;
        b=Qd5YTX8flTEeyA2B9bnIPuceGq8/LYKF9VJTBrHGi2l/n5gM2FQ0arJQsZay4IOkh+
         8QF5GkeIoNiqQJiWkeyJxwkrYD0cwP21Uwp9P3wn7f7KBNVrk2gsPeT0of9dicsy1oia
         WMWkwDpmfAwct98Qy65wBRgwoYXfKN7HcugGKbaAjNAkQflCoH6K/lkaantL7P9R7dkV
         FxGppZGRt1ylXex7EGXW+PSM3lZ2l/C3RlSbhfE/aalOtkXW0rb3dnHprewqr8NX591c
         rRILQZa3YYT46EXm5VpAK2pa9vmHb1bfe5GvW5wipLt5ndFqsJTOV1GjPGaukyf2EM5f
         jENw==
X-Gm-Message-State: APjAAAWKWrRoz+vnDv/oObWceOblUCDU96Ufch7hHyAniiQMWzOzFULR
        WO10kPNqfLjKnrP6HfTngEXLfCtJzxeCGYPdcFg=
X-Google-Smtp-Source: APXvYqx5iQSiV1wQnkV4BNF3rmbOCPq+eI8fHf5jbJrBDG2+C4r89XluCNntE3UR+ht2Yoe7YWM3aa6is42jDhhTFKg=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr3195916pjq.132.1575463560991;
 Wed, 04 Dec 2019 04:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-6-cleger@kalray.eu>
In-Reply-To: <20191204101042.4275-6-cleger@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 14:45:51 +0200
Message-ID: <CAHp75VcqqqAv1iiwjNqGVcadmdzbjHt8f_ap7DKd3LWC=wwkhw@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl
To:     Clement Leger <cleger@kalray.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
>
> Since the driver has been moved to pinctrl and now supports it, move the
> documentation into pinctrl folder. In the same time, add documentation
> for pinctrl properties such has snps,has-pinctrl and description of pin
> alternate functions.

> +- snps,has-pinctrl : If present, register the pinctrl controller.

I'm wondering why we can't always assume pin control?

> -F:     Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> +F:     Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt

I guess this should be a part of patch 2 when you move driver w/o
changes to a new folder.

-- 
With Best Regards,
Andy Shevchenko
