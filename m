Return-Path: <linux-gpio+bounces-26734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C5BB160C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 19:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1691B4C3B6B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 17:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7A62D24AE;
	Wed,  1 Oct 2025 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LodCWCnR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B72D239B
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759340296; cv=none; b=JHcW6qj3NtryelkRJ1sLKJbssZni4mKnys8Qjepb3NqGAwXSaMqOCOoxniBqr/GwXF01T5QwChYOP4LSOB2x3BBOQW4qRT+q3U3DtsK9At8VJr+rk8PXhZ7x/xJBRzEDGM7QK781XVNX5bHiku+FmXCnVNy5r3VRBWq86Sgp6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759340296; c=relaxed/simple;
	bh=bEr9NabWGv9uZTpZR4IUnuGL8ClxXXWv8CM+QZdbBqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMCQFrJKTk1GfwGUyXhjceSDE0/TUmuADztWHs/szfDXotnxUtIcGEO5QJXSzoftY2oqYNuQzTitBZxEu2Rb0w2Zwdf1L0vKLrfUU6bYuc6XY6Yo4HghlNjDmHyscDamRc4ANz/KOnJVJNBUUc9hBN0RGboDe5NgBbNDmKtfNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LodCWCnR; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-551b9d94603so45967e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 10:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759340293; x=1759945093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LXmExbDnARKY+xW5H6oOuj3NOxd2ouwZ2KjUzxqsR5c=;
        b=ra+QEgAYTasnMpoQhEJX7N3wUCHa+vpdWwyM/h9YwAGPZihMitZEOo0G5HncGkFZD6
         efSGkVxshplUeF/XjsJ/hLgjTRfidL43K83ACe8ur6iOdXHNEKVVUCeJyrc81sVUkxkT
         +mghqwW9jqIiYpN21qAp1iSRb1JeJ0pbI+NjtN8cwvwKnpEzYkEF8p3bXGqsY2zddWdp
         4UGUPjuwD4fbw7Lv2aIxv0LFz4jcFwmG+ZVv3ogejU5iDySFcaU0kH9w383Un0qBx3Db
         JPH5qVlPCVCr+zMSmUNsU6r8CJnf4wn/ClWjmoK5O1XiVqQMrd4eFR3THtovozYk0b9r
         /EuA==
X-Forwarded-Encrypted: i=1; AJvYcCVdyTCRBlxoXNcU8eXr2pl+xt0PRxWpNsnSku6Z9RPzirhhXg/Cz44hMxpw6dd5IFGESBudfXW+7HQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzCH1VX1PVZG6zv8VsAHfVb11Z18AfcDENfZJyCldsGZVj+gxte
	sUMUolm2upTXAseSIPJP63cTPig0wzzQXpgyLMCUsBxVY+6s1L8gomWHaGcGXLT2L+JZgJsSVel
	465t/vykisSOuoqzLigfTrudsn5gQrFLjux1hm6OYJT3R79i9lukCUqrQ052CV5smDx4RLb7Xoc
	FYrQ02t30ykqTKaMY8APhIt11OZR0hdNTEzm/H6Rg6tECAQId/Nqk8+5str1CSbhPbX95OpJU5L
	BOSqvi9WmtXwUnJXg==
X-Gm-Gg: ASbGncvIso4rNQaHKam1tANzj554AXIUD6XFcli3Mnfl6LF6jwUaZHPH4lKWVwOB5zz
	DB7wZPk/IQOfG5h4HlQ5nZ25Nrkywto3K24wlIO3q+BJSGIEOGv69Din12R58DhsXxM3tKv+31R
	hodKbN6wfcYfuUvHKapEZWfJX48tXyFArnn6Rme5XIc8SOeiPLoLsesyYG+Hqx4A24pBUa8h3xg
	cZ8ii4P8h0suS9ZNgrrKMpUrJy7E+6mOnGipa34G4X9E53t4FRcdhElzQUcwUiRKTaTaYy/SVbu
	at9N2HPvscqfTJoYv9s+ptlhrqU1jWWdWd2aqHIjS9Pw68mOlS7aTkQAo4qiOUKPUtzlGVakqms
	XfKiI8aWguzSl3CHcgndzo9+FqbtkGfQnHqaaw+0dWP8VnTKoa8d575jK1fdnnIh6EkSqRVa7Qq
	UiFF+RhZfh
X-Google-Smtp-Source: AGHT+IGqiznsQSdEdphMZ/DHbAQYPjMOzLPSNUvH/gdM/AmeQIeujGWw/1w3Uy2ggUNi3kiZzp9GthiQgGNC
X-Received: by 2002:a05:6102:41ac:b0:58c:aceb:1e3a with SMTP id ada2fe7eead31-5d3fe524993mr2187723137.11.1759340292925;
        Wed, 01 Oct 2025 10:38:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5d40c54d810sm12527137.1.2025.10.01.10.38.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 10:38:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6354a81ecf6so207755d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759340292; x=1759945092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LXmExbDnARKY+xW5H6oOuj3NOxd2ouwZ2KjUzxqsR5c=;
        b=LodCWCnRLXov4kSB1SYmjaPnIbS1ecg6bNZcd1CaqEeZR1dAz/5Mjhy8NFSbzTplWM
         xfiAwaihCQwld8sLW5p/vETA7eYA8rp0zRoykpJ9eaGS3oT/N/6w1PvI02eNrWSqSZVO
         E1P1rl9Xh15P3dP+lq/VFse4HbyqNRru++/yU=
X-Forwarded-Encrypted: i=1; AJvYcCUlSB4HNHEQE6hOO75uJ3ODEBWgAqScG45p2R8P/z2gX3MSFKY3XMEC8ixsncGcdajIQbEkN0sGdYlK@vger.kernel.org
X-Received: by 2002:a05:690e:4285:20b0:635:4ecc:fc26 with SMTP id 956f58d0204a3-63b6ff755c0mr5143854d50.46.1759340292073;
        Wed, 01 Oct 2025 10:38:12 -0700 (PDT)
X-Received: by 2002:a05:690e:4285:20b0:635:4ecc:fc26 with SMTP id
 956f58d0204a3-63b6ff755c0mr5143815d50.46.1759340291477; Wed, 01 Oct 2025
 10:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
 <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com> <CACRpkdaAUXpYi7Z+zgZDhLiJiSUAndLhPMA5YOvnk2GGYOoj4A@mail.gmail.com>
In-Reply-To: <CACRpkdaAUXpYi7Z+zgZDhLiJiSUAndLhPMA5YOvnk2GGYOoj4A@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 1 Oct 2025 10:37:59 -0700
X-Gm-Features: AS18NWA6pejbS7tvlHJRtmGCtfW4_YPokKJYEjqHmo4ZNMA4_3jLY2KTt9SQtKc
Message-ID: <CAHi4H7EzydzKRZPMM-VGOJ8A2RxfEYb5umuBvBEceiwj-8KTrA@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: bcmbca: Refactor and add BCM6846
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002d200d06401c5508"

--0000000000002d200d06401c5508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 12:59=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 1, 2025 at 8:43=E2=80=AFAM William Zhang <william.zhang@broad=
com.com> wrote:
>
> > I believe you have the access to Broadcom reference software and there
> > is a pinctrl driver we
> > use(bcmdrivers/opensource/misc/bca_pinctrl/impl1/pinctrl-bcmbca.c) in
> > ref sw.
>
> Yes I have looked at it, I generated the pin control groups from the
> device tree used with this driver.
>
> That driver is in a very bad shape, e.g. (just as an example):
> static int bcmbca_pmx_set(struct pinctrl_dev *pctldev, unsigned
> func_selector, unsigned group_selector)
> {
> #define LOAD_MUX_REG_CMD        0x21
> #define PINMUX_DATA_SHIFT       12
>
>     struct bcmbca_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
>     volatile u32 __iomem *test_port_block_data_msb =3D pc->base;
>     volatile u32 __iomem *test_port_block_data_lsb =3D
> test_port_block_data_msb + 1;
>     volatile u32 __iomem *test_port_cmd            =3D
> test_port_block_data_lsb + 1;
>     u32 tp_blk_data_lsb;
>
>     tp_blk_data_lsb =3D group_selector;
>     tp_blk_data_lsb |=3D (func_selector << PINMUX_DATA_SHIFT);
>     *test_port_block_data_msb =3D 0;
>     *test_port_block_data_lsb =3D tp_blk_data_lsb;
>     *test_port_cmd =3D LOAD_MUX_REG_CMD;
>
>     return 0;
> }
>
> This is not using writel() macros etc. Essentially the same code is found
> in the bcm4908 driver, but cleaned up.
Obviously a few places need clean-up and fix-up to meet the upstream standa=
rd.

>
> > The advantage of that driver is that we automatically
> > generate all the pinmux pin and function info into the
> > <soc>_pinctrl.dtsi and the pinctrl driver is designed in very generic
> > way and does not have per chip pinmux function/group info in the
> > driver code but rather from the device tree.  So for every chip, all
> > we need to do is just generating the pinctrl.dtsi and no source code
> > change is needed.
>
> But if you can generate say 6846_pinctrl.dtsi, I guess from some
> HW data that the public has no access to, then why can't you
> generate bcm6846.c with the same contents as C structs?
>
We could but we don't prefer to do that because we want the driver to
be generic and not requiring any change to support a new chip

> > I understand this is not what a typical upstream
> > pinctrl driver does but it does the job. Have you looked into that
> > ref sw driver and what do you think that approach versus the current
> > upstream driver?  Do you see any issue with that driver?  As far as I
> > can tell,  it should work but we may have to leave 4908 with the
> > existing driver and pinmux binding.
>
> The downstream pinctrl-bcmbca.c driver is mostly using a
> "one group per pin" approach.
>
> This is very convenient for people doing development from HW
> descriptions and thinking about pins as being muxable on an
> individual basis.
>
> Some drivers use this approach, the most notorious being
> pinctrl-single.c.
>
> But it has some real downsides, because it totally ignores
> the fact that the hardware is *clearly* designed to mux pins
> in groups and not individually.
>
> This is one example from 6846_pinctrl.dtsi:
>
>         i2c_scl_pin_68: i2c_scl_pinmux {
>             pins =3D <68>;
>             function =3D <0>;
>         };
>
>         i2c_sda_pin_69: i2c_sda_pinmux {
>             pins =3D <69>;
>             function =3D <0>;
>         };
>
> Why would you want to mux these two pins individually? They
> are clearly not meant to be muxed individually, especially given
> that they can only be muxed out on pins (68, 69), nowhere
> else! If you want SCL then you want SDA as well and it's clearly
> thought to be muxed in a pair by the HW designer.
>
> But the DTSI description, from wherever it is generated, does not
> create a group out of this.
>
> In other cases, it is done properly:
>
>         rgmii_pins: rgmii_pinmux {
>             pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
>             function =3D <1>;
>         };
>
> OK so this muxes all the pins for RGMII into function 1 in one go.
>
> In my driver this becomes:
>
>         pins_rgmii: rgmii-pins {
>                 function =3D "rgmii";
>                 groups =3D "rgmii_grp";
>         };
>
> The contents of rgmii_grp is contained in the driver, and this is
> roughly equivalent to just putting the data in C instead of in a DTSI.
>
> If all pins were properly grouped in the DTSI file such as
> the RGMII pins, I could generate my .c file from the DTSI
> file, but right now I can't,
>
> So clearly the DTSI generator is either not entirely sound or
> using dubious HW info. Information has been lost in the design
> system. Someone had a good vision of how this should work but
> it is broken somewhere in the design information flow process.
>
> I understand why Rafal went with the group-oriented approach because
> clearly there are groups in the hardware, but the generated .dtsi is in
> most cases not properly describing these groups.
>
> If someone in Broadcom is interested in right now starting to actively
> work on all the BCA drivers using automatic generation of groups
> and include files, perhaps C files as suggested, I'm happy to help
> out and integrate this with my driver. But then that needs to be
> active and seeking advice from the actual HW designer on
> what the grouping should actually be, so this is properly
> reflected all the way, not just giving the illusion of a generated
> HW description flow which in practice loses all the group
> information.
>
> I personally can't work with your HW data generator which is
> clearly faulty and I need this supported now, so for me the best
> approach is currently to do the BCM4908 approach and encode the
> groups manually by inspecting this bogus DTSI file and correct it to
> what was probably the HW designers intention, such as
> the I2C pins being muxed together as a group. Reverse-engineering
> is sometimes necessary.
>
You are absolutely right that the current dtsi does not group the pin
properly for certain interfaces such as i2c. The tool has the same
goal to combine interfaces in the group whenever possible. It is just
we don't have the correct group config for certain interface when
generating the dtsi.   If I fix all these group issues and provide the
new dtsi files and I will be the contact if you have any question
regarding generator files,  would it be possible for you to use and
upstream that driver?

> Yours,
> Linus Walleij

--0000000000002d200d06401c5508
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
dTfl0Sbvftt9xPE0AD22dItMek4nv0+yxua0J2O9DGcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUxMDAxMTczODEyWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAJ/yk/B5ZQ7rUblgcJDhTJC/j56gwULNlyW82
U9xKYeWMz/nIhinrH3G9hoKt9K+2IpM36KPfWqkTsRCtZB6IpYiHfSS62GorLv3+pI+qhmTEg1rd
nNAlShD0Xpk6px/gGRqvh4x4u4zpMTNB8pz+EnH2XnPUxj8YNOvZW7ijhT87RmrjYoUH6uywuDwm
UUF92UC/QmsRmi0FqjlHCU+Fs1mpVinm3CDGz1YSJmbOmeQd03hWAZnN6rf4IFMY5lry44qPccTI
rSuEAjk48HnWjICzH9GbIn5yKmVNw89xU36e5sGW1WmSnsdpMvKVjDZTdgO36XvvfcgllASIWtk8
Rg==
--0000000000002d200d06401c5508--

