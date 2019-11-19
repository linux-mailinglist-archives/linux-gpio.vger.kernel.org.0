Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44A2910278F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSPDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:03:11 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37564 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfKSPDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 10:03:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so23703248ljl.4
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 07:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PbOCer/DbEIDkV9HM4Ua32e1t8DBngr+pDXysIFGRg8=;
        b=ghhb7CWnwNxAbrzbSuXvrfTWrUaikmjOuxcxbZzhekhweUFV9we26m0KktjuUT12cy
         DozWtpM03n61uITyiCInX3tY4YBxpKlEOG2nSGKyK5N9nZYuhQI7I8nlgr7v9u4WTAiC
         azEp+p7C9AEL7DBegmAPPbrND76N9Jjf0OWzfEkUmTdIa55WHk3ybiz29nshZn4Gtits
         Bc0GjA0BnNBYKZpWPx7MQIa9cxGUQeloQ3M7jYsv2LvZQFDeLGf0L2qUnJTskweJCjCu
         156mBCrJ72nFj2G7luKBxfO5xwCFDuJ3NdbRLreV7CtFnrHx/itCksfMS1Fxmfo83llm
         eq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PbOCer/DbEIDkV9HM4Ua32e1t8DBngr+pDXysIFGRg8=;
        b=E21sMlFB7JIcYeUiVTwkcXQTWa5qOuA3NKVmLNAgEAD379PZUlgs11waQZT4X43MWa
         IyDDHri7ScOjuAUYY2O8Hw1I2769PjWeATgaraps1WCcbAPfb8EAcZs4K9tmYHn9gDLI
         FiaxI2UpsVKlM8rlCK5dxaYTX2+E0Xv6pmmz6CCeScGpBEc/YHK/tFALMv9zPHaQIU7K
         jjSOKYrk3AGm5ZoQzjFhDPiwNW7MtY6raTYBgRPxxTji2aFLzWydQUukcFRIEzD4LF32
         D/ADMNteezqAl37yJn+npHjCc7wF0MTapMasfZn7dj6R4+MEiX4Qf95pqKmrbLE+6aVn
         HfwQ==
X-Gm-Message-State: APjAAAUAX17zgF+wWmJipkE/09ro10zsYHOvAeuSAkX8xiJ9VA2KWFZf
        rqWwR1g38TUhSNFPY6XaUg5zHxVbanpcogmkEmZp9g==
X-Google-Smtp-Source: APXvYqxK4BLaj4M+k3bwc7DPGWsPytu2MBOD+HBWoGml8EjxWn/fiVfiTHJU/tL8gTg0U5x+X6BHUCC0vamRMq4wY+M=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr4384572lji.218.1574175787982;
 Tue, 19 Nov 2019 07:03:07 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com> <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
 <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
In-Reply-To: <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Nov 2019 16:02:56 +0100
Message-ID: <CACRpkdb9KKPsu7dkjVmHbgQcdo1Zx9uC_jtd6HFwM+RO2EA4nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yash Shah <yash.shah@sifive.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 11:15 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 18 lis 2019 o 11:03 Yash Shah <yash.shah@sifive.com> napisa=C5=82(a=
):

> > As suggested in the comments received on the RFC version of this patch[=
0], I am trying to use regmap MMIO by looking at gpio-mvebu.c. I got your p=
oint regarding the usage of own locks is not making any sense.
> > Here is what I will do in v2:
> > 1. drop the usage of own locks
> > 2. consistently use regmap_* apis for register access (replace all iowr=
ites).
> > Does this make sense now?
>
> The thing is: the gpio-mmio code you're (correctly) reusing uses a
> different lock - namely: bgpio_lock in struct gpio_chip. If you want
> to use regmap for register operations, then you need to set
> disable_locking in regmap_config to true and then take this lock
> manually on every access.

Is it really so? The bgpio_lock does protect the registers used
by regmap-mmio but unless the interrupt code is also using the
same registers it is fine to have a different lock for those.

Is the interrupt code really poking into the very same registers
as passed to bgpio_init()?

Of course it could be seen as a bit dirty to poke around in the
same memory space with regmap and the bgpio_* accessors
but in practice it's no problem if they never touch the same
things.

Yours,
Linus Walleij
