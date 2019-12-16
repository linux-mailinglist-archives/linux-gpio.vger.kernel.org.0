Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF773120135
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 10:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfLPJcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 04:32:12 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:58533 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfLPJcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 04:32:12 -0500
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mnq0K-1hwDVg2Tko-00pNfa; Mon, 16 Dec 2019 10:32:10 +0100
Received: by mail-qk1-f178.google.com with SMTP id c16so913797qko.6;
        Mon, 16 Dec 2019 01:32:10 -0800 (PST)
X-Gm-Message-State: APjAAAURBT63jHZGbAxLG+4gel0Af7Kksn3HXxB1/oovVJ3+Ex29BHac
        WBqJ90Fdw/bK9Tvae2rGcd7EaWoS48A3ZglC7Ic=
X-Google-Smtp-Source: APXvYqwuzamOhZBYiDPEQvUuH61OaN//oHdb3a5zh9ui1Ily7sfB3Sje5/4gH8Qq5N4AYR9tRtDkKEXgkMXoCI4p5kE=
X-Received: by 2002:a37:2f02:: with SMTP id v2mr4724084qkh.3.1576488729412;
 Mon, 16 Dec 2019 01:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
 <20191211192742.95699-2-brendanhiggins@google.com> <CACRpkdarwQT=6iSvjaTufSF9O7KcSkFxBwcvmchQ67xRddLs2g@mail.gmail.com>
In-Reply-To: <CACRpkdarwQT=6iSvjaTufSF9O7KcSkFxBwcvmchQ67xRddLs2g@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 16 Dec 2019 10:31:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1o0y5zWj3kye4o2uDVVJE6ejG0yGDJGDfZ4BK3t_rKMA@mail.gmail.com>
Message-ID: <CAK8P3a1o0y5zWj3kye4o2uDVVJE6ejG0yGDJGDfZ4BK3t_rKMA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        davidgow@google.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JHstVbsiEQaem3jKkTdXCgTL1iRXxMz44kwzucz558Tbw6cgbIC
 OK1WVZEfNpPcVxbxrw5ANQubG0KABGhq624pEn95No88CQcXNeyss7QzEERNDdb2gg4Xppn
 kyhUaiP/z54vAX1ELDveTlrOw56Al7Hq/vb6yQ/2Mmm6wibdI/7Owsh5uRdl9DEGJQJbSHx
 Uu+NJnTGa0YXlK/XenJSw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rL8UdgnoY1w=:pOXosBNYrORhyNt/kYp/A1
 ckekIzuBOupsptQPfBXOofLec3E0yKLOiPwiLMlxzv0UQWzDp7SnNAywueQkaxqcAdhF7iJid
 VtqasuiEkuwiF+l0zq+eSHTy2CWQ3Hihhqsyi7PFAXgy2/eU4HKbdm5dv7T/5eA20GCmqnuw1
 O7QC/E+8tPVHGydcawWXjJ4y3XAW62aWAJgnr0LlYrjr7UzX5CVn9O66i19rskvsHHt3Ztzqn
 Ukt6qHpx4Iq5Y/jexmnWEGbebOLT2kg+9vsHO4VkjvgNYw8/fH4bq9S4tqnhgKj4VxowHMo5r
 IrKvbckYlWQcPYDFU7bvvYzRIv8KhcFfX3IaJEwNDAHrhLAy2p7pLmnySQFY2VDOdj70w1wWs
 XLE2HN0m3yf+0RJHMBnEqVRAEOhwDrpYCj+uC+OAMa8mhqG7c+0P6MwZHE5AWaiHibJTWtgpy
 95NaujfbIBe4qXIpHd82otoyZVnjbWYLBHGWQxYLt00sRsPneb1aYuzM6LaqLNlJrpJLnTOmr
 g1hx8Yj3aFfBFrSxfRpnkeF7RFlDLVKAQURSj+qVEceRVsqltvbr4Ih4fSg4zma2L0GAXaRm4
 KJW5UlX5v8JUKzufQ8hbo589pMoOItVeIK6MtQ0gwzLXYzTL8C+8E+vr+Kv0IXyu3ylJjboRl
 X24Mrzp8iwr0W5/GmnCly61I1f4ZiFUY5Wh3RyYp5lAQp9jd1mYSZTk5xv3U179taUiw1FcAW
 VoXHWxjdsW2IIS3FgCqgi2LXcG/sQu7OI+o3bzQSqnqB+A9Mm+u+a1Q2wI60CVV9EIT/A8f1G
 jJm3qW0qY43kouV6fJ/OIXqRWpgzGMlFeRIbMvuojLZEN+IGGUGg7EHj+a8GZ4UGQaFmoWjod
 rAPmjimDz6qWNlLTMy1w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 16, 2019 at 9:42 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Dec 11, 2019 at 8:28 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
>
> > Currently CONFIG_PINCTRL_EQUILIBRIUM=y implicitly depends on
> > CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> > the following build error:
> >
> > ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `eqbr_pinctrl_probe':
> > drivers/pinctrl/pinctrl-equilibrium.c:908: undefined reference to `devm_platform_ioremap_resource'
> > ld: drivers/pinctrl/pinctrl-equilibrium.c:223: undefined reference to `devm_ioremap_resource'
> >
> > Fix the build error by adding the CONFIG_HAS_IOMEM=y dependency.
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> We recently fixed a compile error by adding
> depends on OF
> and I think OF implies HAS_IOMEM so this should be fixed
> now.
>
> Can you confirm?

I'm fairly sure it does not, so both patches are needed.

      Arnd
