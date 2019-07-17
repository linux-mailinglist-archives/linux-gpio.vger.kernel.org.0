Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8216B6BBCB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 13:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfGQLsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 07:48:45 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43949 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfGQLso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 07:48:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so11039780pgv.10
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IX1oEKhWMcbZ3ftDa5lhCYFdP6n0csBetOxwFU3RYp8=;
        b=FWrcoX9tCqnjF6fms56lVrS+b6oK2EEjPMoGVMBlr7D4Q099BprcDD2PDRq/l13OR3
         zBU1baA2oyQbtWYUkxzvNgePX8rqn8sO7Ngyl+ukSJXLzzJC7vKT4R2uCa+2ZThJxJx2
         q/u3ReCF6FVVuNxtfn63IszRerJn/XFhKyrd9aJqigBc/7wjAdAp0IifB/rGyU/g3rAa
         AjGPsmWeuumoOrvyZ/Xm0SSK8lekd293oy7+lOJuJ8Uf2TmxD2pH/Kn2QhI0zORpGzRY
         1y4GfXKYWKd8Cu+O+Mt1eIHOthNyS8bIJp9uTWOH4UdjxJ3CdfXuQ6aNeodmdS7ZQw2w
         WjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IX1oEKhWMcbZ3ftDa5lhCYFdP6n0csBetOxwFU3RYp8=;
        b=H2IOMY7bX+lpGIbHAjaIOeIl55/acH+c2aDm5e+9TudEhVwC1Dl51GCe1IaqRrJY8k
         3KdiQxglpzVcjXa5i14C6kE9HMqTHpgFPy1ASkJg/PJzGFYsq/UBhQpAFfTdGrJN2mZd
         dVbscNDhCCsRB6R7259+teGju/Ksy1DC6TGdzo/hRhgaB82zZaX3yTM0szq9rmBxaYks
         /5j3/ozNtqkbQGernXmY0b3eGBpcQbELP2qG+llHIPtRMbtFH6kY5IEsQEa0qZLVHEEq
         1JfXij1Qg4+DsMg4gtA3HeKMKV31zilB1YucOFCUT8x4xTbsMam9w0qdl9an0JSFHlQi
         Qlzg==
X-Gm-Message-State: APjAAAUi+1WcwGc5FGk/vnOFXXtFmO/Zjp95leIAMnAbQPi9VrTEmATX
        BCJAGI3YaNivggYQ1k6/y8zEUtgp0KSYeQnn8l90rw==
X-Google-Smtp-Source: APXvYqzm84uaNKukWdMrxaNW5HMVvKm5YJnrbNb8pYtDjKLTdFo76TKc18tucDMSzlTHxjR2vxi9m+SoB7VXfMmFtsw=
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr43106787pjp.47.1563364123675;
 Wed, 17 Jul 2019 04:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a55d7d058d51ad4f@google.com> <CACRpkdYbuJ_yJ+UKtvWrkmBCbQzfk-1mn1-A836dkNMrmTtZow@mail.gmail.com>
 <20190717091621.GC16694@localhost>
In-Reply-To: <20190717091621.GC16694@localhost>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 17 Jul 2019 13:48:32 +0200
Message-ID: <CAAeHK+x4KAy2koonjij26iowtPuj67F=Mx+g0kYF968Zr-h8xg@mail.gmail.com>
Subject: Re: WARNING in gpio_to_desc
To:     Johan Hovold <johan@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>,
        Vincent Cuissard <cuissard@marvell.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Samuel Ortiz <sameo@linux.intel.com>
Content-Type: multipart/mixed; boundary="0000000000003f9b95058ddf1388"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--0000000000003f9b95058ddf1388
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 17, 2019 at 11:16 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 16, 2019 at 11:52:19PM +0200, Linus Walleij wrote:
> > On Wed, Jul 10, 2019 at 1:07 PM syzbot
> > <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com> wrote:
> >
> > > HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> > (...)
> > >   __gpio_set_value include/asm-generic/gpio.h:104 [inline]
> > >   gpio_set_value include/linux/gpio.h:71 [inline]
> > >   nfcmrvl_chip_halt+0x4e/0x70 drivers/nfc/nfcmrvl/main.c:259
> > >   nfcmrvl_nci_register_dev+0x2d4/0x378 drivers/nfc/nfcmrvl/main.c:176
> > >   nfcmrvl_probe+0x4e9/0x5e0 drivers/nfc/nfcmrvl/usb.c:344
> >
> > This bug is somewhere in the drivers/nfc/nfcmrvl* code handling
> > GPIOs.
>
> Right, and it's my bug.
>
> > It should be converted to GPIO descriptors and fixed up, see
> > drivers/gpio/TODO for details on how to do this.
>
> Conversion will have to wait, let's fix the regression first. :)
>
> > Johan/Vincent, tell me if you want me to forward the full fuzzing
> > robot crash dump.
>
> No need, thanks. I got it the report.
>
> Something like the below compiles and should fix it. Vacation starts
> today so I'll revisit and send a proper patch in a couple of weeks.
>
> Perhaps someone can feed it to the bot meanwhile (no time to play with
> it right now).

#syz test: https://github.com/google/kasan.git usb-fuzzer

>
> Note that this issue has been there since 4.12, so guess no one uses
> these devices...
>
> Johan
>
>
> From e9d9d0ef5ffd6b306cffb2f4e2514f503aa626a5 Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Wed, 17 Jul 2019 11:07:13 +0200
> Subject: [PATCH] NFC: nfcmrvl: fix gpio-handling regression
>
> FIXME
>
> Fixes: e33a3f84f88f ("NFC: nfcmrvl: allow gpio 0 for reset signalling")
> Not-Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/nfc/nfcmrvl/main.c | 4 ++--
>  drivers/nfc/nfcmrvl/usb.c  | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
> index e65d027b91fa..529be35ac178 100644
> --- a/drivers/nfc/nfcmrvl/main.c
> +++ b/drivers/nfc/nfcmrvl/main.c
> @@ -244,7 +244,7 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
>         /* Reset possible fault of previous session */
>         clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
>
> -       if (priv->config.reset_n_io) {
> +       if (gpio_is_valid(priv->config.reset_n_io)) {
>                 nfc_info(priv->dev, "reset the chip\n");
>                 gpio_set_value(priv->config.reset_n_io, 0);
>                 usleep_range(5000, 10000);
> @@ -255,7 +255,7 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
>
>  void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
>  {
> -       if (priv->config.reset_n_io)
> +       if (gpio_is_valid(priv->config.reset_n_io))
>                 gpio_set_value(priv->config.reset_n_io, 0);
>  }
>
> diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
> index 945cc903d8f1..888e298f610b 100644
> --- a/drivers/nfc/nfcmrvl/usb.c
> +++ b/drivers/nfc/nfcmrvl/usb.c
> @@ -305,6 +305,7 @@ static int nfcmrvl_probe(struct usb_interface *intf,
>
>         /* No configuration for USB */
>         memset(&config, 0, sizeof(config));
> +       config.reset_n_io = -EINVAL;
>
>         nfc_info(&udev->dev, "intf %p id %p\n", intf, id);
>
> --
> 2.22.0
>

--0000000000003f9b95058ddf1388
Content-Type: text/x-patch; charset="US-ASCII"; name="usb-gpio.patch"
Content-Disposition: attachment; filename="usb-gpio.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jy76mgo90>
X-Attachment-Id: f_jy76mgo90

RnJvbSBlOWQ5ZDBlZjVmZmQ2YjMwNmNmZmIyZjRlMjUxNGY1MDNhYTYyNmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+CkRhdGU6
IFdlZCwgMTcgSnVsIDIwMTkgMTE6MDc6MTMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBORkM6IG5m
Y21ydmw6IGZpeCBncGlvLWhhbmRsaW5nIHJlZ3Jlc3Npb24KCkZJWE1FCgpGaXhlczogZTMzYTNm
ODRmODhmICgiTkZDOiBuZmNtcnZsOiBhbGxvdyBncGlvIDAgZm9yIHJlc2V0IHNpZ25hbGxpbmci
KQpOb3QtU2lnbmVkLW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvbmZjL25mY21ydmwvbWFpbi5jIHwgNCArKy0tCiBkcml2ZXJzL25mYy9uZmNtcnZs
L3VzYi5jICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZmMvbmZjbXJ2bC9tYWluLmMgYi9kcml2ZXJz
L25mYy9uZmNtcnZsL21haW4uYwppbmRleCBlNjVkMDI3YjkxZmEuLjUyOWJlMzVhYzE3OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZmMvbmZjbXJ2bC9tYWluLmMKKysrIGIvZHJpdmVycy9uZmMvbmZj
bXJ2bC9tYWluLmMKQEAgLTI0NCw3ICsyNDQsNyBAQCB2b2lkIG5mY21ydmxfY2hpcF9yZXNldChz
dHJ1Y3QgbmZjbXJ2bF9wcml2YXRlICpwcml2KQogCS8qIFJlc2V0IHBvc3NpYmxlIGZhdWx0IG9m
IHByZXZpb3VzIHNlc3Npb24gKi8KIAljbGVhcl9iaXQoTkZDTVJWTF9QSFlfRVJST1IsICZwcml2
LT5mbGFncyk7CiAKLQlpZiAocHJpdi0+Y29uZmlnLnJlc2V0X25faW8pIHsKKwlpZiAoZ3Bpb19p
c192YWxpZChwcml2LT5jb25maWcucmVzZXRfbl9pbykpIHsKIAkJbmZjX2luZm8ocHJpdi0+ZGV2
LCAicmVzZXQgdGhlIGNoaXBcbiIpOwogCQlncGlvX3NldF92YWx1ZShwcml2LT5jb25maWcucmVz
ZXRfbl9pbywgMCk7CiAJCXVzbGVlcF9yYW5nZSg1MDAwLCAxMDAwMCk7CkBAIC0yNTUsNyArMjU1
LDcgQEAgdm9pZCBuZmNtcnZsX2NoaXBfcmVzZXQoc3RydWN0IG5mY21ydmxfcHJpdmF0ZSAqcHJp
dikKIAogdm9pZCBuZmNtcnZsX2NoaXBfaGFsdChzdHJ1Y3QgbmZjbXJ2bF9wcml2YXRlICpwcml2
KQogewotCWlmIChwcml2LT5jb25maWcucmVzZXRfbl9pbykKKwlpZiAoZ3Bpb19pc192YWxpZChw
cml2LT5jb25maWcucmVzZXRfbl9pbykpCiAJCWdwaW9fc2V0X3ZhbHVlKHByaXYtPmNvbmZpZy5y
ZXNldF9uX2lvLCAwKTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZmMvbmZjbXJ2bC91c2Iu
YyBiL2RyaXZlcnMvbmZjL25mY21ydmwvdXNiLmMKaW5kZXggOTQ1Y2M5MDNkOGYxLi44ODhlMjk4
ZjYxMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmZjL25mY21ydmwvdXNiLmMKKysrIGIvZHJpdmVy
cy9uZmMvbmZjbXJ2bC91c2IuYwpAQCAtMzA1LDYgKzMwNSw3IEBAIHN0YXRpYyBpbnQgbmZjbXJ2
bF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAogCS8qIE5vIGNvbmZpZ3VyYXRp
b24gZm9yIFVTQiAqLwogCW1lbXNldCgmY29uZmlnLCAwLCBzaXplb2YoY29uZmlnKSk7CisJY29u
ZmlnLnJlc2V0X25faW8gPSAtRUlOVkFMOwogCiAJbmZjX2luZm8oJnVkZXYtPmRldiwgImludGYg
JXAgaWQgJXBcbiIsIGludGYsIGlkKTsKIAotLSAKMi4yMi4wCg==
--0000000000003f9b95058ddf1388--
