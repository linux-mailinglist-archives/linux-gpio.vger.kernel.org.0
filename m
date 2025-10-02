Return-Path: <linux-gpio+bounces-26757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F13BB29F9
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 08:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9184235A6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 06:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21FD288C9D;
	Thu,  2 Oct 2025 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G7zVAslg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881D265CBB
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 06:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759386899; cv=none; b=tlFQ81uXc3GPOaPMa42JEOVHd/zLZnneWeb4IMk+IDAh+1NTlOqjjIdLgQzDacgxJ2t4fB7yMWftPgUeI7/NrdMkeGyiAOo8KYJ+CqLz0YsiWG+Uyin/iOwacwAwxY21qlMyQa6v8Dd2UuRw24VCwiOVRAYzZjPP4Ndm3D2VzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759386899; c=relaxed/simple;
	bh=DzqI+UU+gi8vb9GB9R646wUwpfR6wO3uc+R5z6Ah+RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGFu6OGw+vBydGbXb7hu1k/Wo8ZyTyKPfOXkRGA4OuErZdroNFFHcOCNsY1OPsqmbBDlSkRI3LgPh6yC7PZqjXWNcq+nSKZrFUyzl+hZ1A8Nz1IJeCenvg4XA6PCVWpUIQhORLdmPFGw7QWuZUrXaKQqmbZfcBInCEkT/upboZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G7zVAslg; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3307de086d8so677946a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 23:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759386897; x=1759991697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eDGGMch5R7+C65V3PJc6p7YmgUsTkJuae9xJwNnsBqo=;
        b=QO1RXxYqtRzg/j+itFqEZpIsikWXp5eoWTqBhZlJdvOK02azphsBIClxILe1/vUo9U
         kcWHL2QRHhJ/mrbmpKS60gha/S6Li5iG7fDjMD3sFwOLEdowwVuHi3O4IOvWKRtJ1mbl
         NKQGCLu8MWfUJT7Pc1zGNZCBGRk4soyyhvsKSBACktjc4BSy/Cfbs1xvQr/vMcKz1+c6
         6M0qG2AGyY94spizn7Vw0qD/rkvnzcyJhalzbmXq5++rtHrFcl9Hhh7zynUabY3x5DKT
         X2mHH2oj1n6kLUSNVdqXF/8nvnz7DeYXml76Piss5I8pS2taJEOAhHm3DL8bE1g079R0
         sNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNvf6s/bD+A6wGD6kHkPvH/xohGqeajYvzhvkOz2/4lICRFo7uk9+nGvcky6bvhjKiPI3ROMyHF8mZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPiSajhSBSJkyvzdeIpGYbmrhRLEzd+51byQCB7ZYufB/0Grz
	7FW2by2wjLeNQHE5LjWtS2TLn4T1n/NHRkDMH/7DG4PT4Vvsjd40M6sJZ1W67RwPZR3zEnMiQfq
	uhc1L8M5BcD6XzTj3vulzs99tw/wdEcjnxYUD2fi+iFZAS4Cc45GqBfEeYfvIFmsabIcpD1USfm
	/6CJn07IOmq/Vsiz0be8djop/deKr8VLmBq/sny6tvaUihC91TV+GdbqwzP/ycsIQagezhtyxql
	zyP+rIBNw2M9s4hgg==
X-Gm-Gg: ASbGncszB6rAGsJH/G1BBQ9IsSoINq5dZ2On7ru57UqcEG94llF2rcWrM+0kcF0+ZYf
	a/r5i5rOfs8iu79tRwWPVENv0c71SpLLJ5ShO5vBAohQzArdj2dO68ZYY0o/j9+P+z5/gWoH2G9
	bsqq2yztYnqmPCbLrmWSGOvHkW5lUxNGup59LBza5+ZejSYRhQlw3pe5Q4GKUqouBlXyu7jC6mg
	rddqJp20UC0nbrjr2UJU5HMbU1vCfamHwJITe2Qhk0hilYpdTFt5vll7BuYv6weehvM46+Fm1wN
	upCzL/LNeBhVkKkEzrOw4JGnRP/rULiLP5nmN4LfLTBmEyYX7vvMDSl/plK4G6EbNxrXpEOgmkz
	Alse8ka4SYgAN6XDY7aThRVXj8HNhB6ivA8ANjF47HioxJgfLpVVt+zs61N4+cX8VPmPaVUl4Lh
	xAAsg=
X-Google-Smtp-Source: AGHT+IE1boIpT+Uih43fIrHdUsLJfE0aXS+AR7YTGOQ/5fLmqjgfIjUR64Sbp469HkLLZnp/iCT2kDAnDogj
X-Received: by 2002:a17:90b:3ece:b0:330:7f80:bbd9 with SMTP id 98e67ed59e1d1-339a6f3841cmr6395663a91.31.1759386896917;
        Wed, 01 Oct 2025 23:34:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-339a6f9705esm348587a91.7.2025.10.01.23.34.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 23:34:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-632edf1e41dso1499554d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 23:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759386895; x=1759991695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eDGGMch5R7+C65V3PJc6p7YmgUsTkJuae9xJwNnsBqo=;
        b=G7zVAslgFsYqEC5s/lNyTjZiuUBZxQ3ov+4CH2OyCblyo7KUtmO1qSgpSKiYbQaDAy
         gvTDMKdjs40G+quZxXs2BGsmxAlleuNsk84pV6p/Um5awNtR43swvhWF22W+0xJu56iJ
         lfhWnsRxwKr6lzWyYxBMl6gnKJg99FpqYLzts=
X-Forwarded-Encrypted: i=1; AJvYcCVZmlI/b9zL+6tbpCiRmNLseel9UqwSFG6lLMoUWqnuxoy4ZgIKIp4+AcYOv7F+xIzp6ym5250G9QJd@vger.kernel.org
X-Received: by 2002:a05:690e:428e:20b0:636:d2d5:87dd with SMTP id 956f58d0204a3-63b6feb2b4bmr7880690d50.12.1759386895482;
        Wed, 01 Oct 2025 23:34:55 -0700 (PDT)
X-Received: by 2002:a05:690e:428e:20b0:636:d2d5:87dd with SMTP id
 956f58d0204a3-63b6feb2b4bmr7880681d50.12.1759386895049; Wed, 01 Oct 2025
 23:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
 <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com>
 <CACRpkdaAUXpYi7Z+zgZDhLiJiSUAndLhPMA5YOvnk2GGYOoj4A@mail.gmail.com>
 <CAHi4H7EzydzKRZPMM-VGOJ8A2RxfEYb5umuBvBEceiwj-8KTrA@mail.gmail.com> <CACRpkdbmM0nND05ODmEa4J2y6JS6getB9s7h9TXywyED5gqh0A@mail.gmail.com>
In-Reply-To: <CACRpkdbmM0nND05ODmEa4J2y6JS6getB9s7h9TXywyED5gqh0A@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 1 Oct 2025 23:34:42 -0700
X-Gm-Features: AS18NWDYx2wrXoCRecHf_wIYVwB0dy-hppm8FlCmH81SbOL8wcFb9Qe3S450H2A
Message-ID: <CAHi4H7GnCP3H--111gwMrEjEoLkupEfRYWCR9f-H-KDZf_jJLg@mail.gmail.com>
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
	boundary="000000000000f531200640272ecd"

--000000000000f531200640272ecd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 3:43=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, Oct 1, 2025 at 7:38=E2=80=AFPM William Zhang <william.zhang@broad=
com.com> wrote:
>
> > > But if you can generate say 6846_pinctrl.dtsi, I guess from some
> > > HW data that the public has no access to, then why can't you
> > > generate bcm6846.c with the same contents as C structs?
> > >
> > We could but we don't prefer to do that because we want the driver to
> > be generic and not requiring any change to support a new chip
>
> But you will be generating big DTSI files.
>
The current DTSI files include many pins that are not really used and
it can be cleaned up to reduce the size for sure.

> And it is not really the ambition of the device tree to be used as a hard=
ware
> abstraction layer containing a lot of per-SoC information. The device
> tree is supposed to describe and configure the hardware, not
> abstract it. There is a difference.
>
> (The DT maintainers can hit me in the head about this but I have
> certainly heard things like this before.)
>
> Alas, there is no hard definition of what this means and indeed
> some drivers in the kernel does define groups and functions
> in the device tree instead of using C files. So that happens too.
>
> > You are absolutely right that the current dtsi does not group the pin
> > properly for certain interfaces such as i2c. The tool has the same
> > goal to combine interfaces in the group whenever possible. It is just
> > we don't have the correct group config for certain interface when
> > generating the dtsi.   If I fix all these group issues and provide the
> > new dtsi files and I will be the contact if you have any question
> > regarding generator files,  would it be possible for you to use and
> > upstream that driver?
>
> I assume you fear having to follow the pattern and hand-code
> a C file for every BCA SoC and never get done. I understand that.
> Also I try to live by the stance "rough consensus and running
> code" and not be too strong in pushing things my way.
>
> We can do this if the files follows some basic process.
> You still need to use proper bindings.
> This:
>
> >         rgmii_pins: rgmii_pinmux {
> >             pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
> >             function =3D <1>;
> >         };
>
> This isn't proper bindings.
> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> describe the bindings you can use.
>
> properties:
>   function:
>     $ref: /schemas/types.yaml#/definitions/string
>     description: The mux function to select
>
>   pins:
>     oneOf:
>       - $ref: /schemas/types.yaml#/definitions/uint32-array
>       - $ref: /schemas/types.yaml#/definitions/string-array
>     description:
>       The list of pin identifiers that properties in the node apply to. T=
he
>       specific binding for the hardware defines whether the entries are i=
ntegers
>       or strings, and their meaning.
>
>   groups:
>     $ref: /schemas/types.yaml#/definitions/string-array
>     description:
>       the group to apply the properties to, if the driver supports
>       configuration of whole groups rather than individual pins (either
>       this, "pins" or "pinmux" has to be specified)
>
>   pinmux:
>     description:
>       The list of numeric pin ids and their mux settings that properties =
in the
>       node apply to (either this, "pins" or "groups" have to be specified=
)
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>
>   pinctrl-pin-array:
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>
> function cannot be a number like that, it is intended to be string such a=
s
> "spi" or "uart0".
>
> E.g.
>
>          rgmii_pins: rgmii_pinmux {
>              pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
>              function =3D "rgmii";
>          };
>
Thanks for pointing this out.  I didn't realize that function has to
be a string.  But I did see some other vendor use something like
<vendor>,func =3D <1> but I guess it is not encouraged any more.
But using a string for the function also means we have to add the
table/mapping in the driver code to translate the string to the
function number.  Then this defeats the goal of not changing the code.

> This also makes sense for at least BCM6846 because the include file
> have things like this:
>
>         b_wan_early_txen_pin_4: b_wan_early_txen_pinmux {
>             pins =3D <4>;
>             function =3D <1>;
>         };
>
>         b_wan_nco_1pps_sig_pin_6: b_wan_nco_1pps_sig_pinmux {
>             pins =3D <6>;
>             function =3D <2>;
>         };
>
> Completely different function numbers, still both are related to WAN,
> which is what pin control refers to as a function.
>
Well this is just how the SoC assigns the pin and its internal
function.  Although they both are related WAN block, they serve
completely different purposes and probably for different type of WAN
interface and may not be used at the same time.  So different function
numbers seems reasonable to me.

> I do understand that the "function" number is actually just a mux setting
> for that pin. But this isn't very standardized or very helpful.
>
> Also, we don't really want to see more custom properties such as
> brcm,function  =3D <2>; here either.
>
> What you can do, if you insist to just use magic numbers is to combine
> them.
>
> #define BCA_PINMUX(function,pin) ((function << 16)|pin)
>
>          rgmii_pins: rgmii-pinmux-pins {
>              pinmux =3D <BCA_PINMUX(1,42), BCA_PINMUX(1, 43),
> BCA_PINMUX(1, 44) ....>;
>          };
>
> This type of pattern in creating per-pin 32bit values in the pinmux
> attribute is acceptable and found in other drivers, and the driver
> can then decompose this and use it to poke the registers.
>
> If your tool can output something like that then it can be done.
>
Yes I can certainly enhance the tool to generate this format of pinmux
info.  It seems to be a viable path to make the pinmux driver generic
while still meeting pinctrl dts binding requirement.   I can provide
you with an updated the 6846_pinctrl.dtsi file as soon as I can,
hopefully tomorrow.   Would you be willing to try it out?

> Yours,
> Linus Walleij

--000000000000f531200640272ecd
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
pa2bLQWsR0scbpxqJpEal6TISgWmfIgvvgK+HjzQdtUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUxMDAyMDYzNDU1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAKqCDeWvcNZc2bFmRGJzs/i2ULIfIGOopjXJq
0vegFp9Tt8jg62XIgbxjFFufB5tb2G0K1uPZg5GbwJOCSlFaEd1UdyaAJgr1sMta//6bY1HS15i/
hcYiGSV3tBOn31Ja5cZNy/W2XRtc7YYKH5pZuuRBHkTWTl2dEmmgkyUDdGd9fviFBQ0cS5ealObi
VFyriYY3JUiZlMr9oDDotwfH03GmklJjIQ0uOjlVaV8YZUNtMz9qLu+NWAbWA6idunWLiffC3UnM
v9N/+FX5igw06W71a7Mr+YftAzBVj6jOPQTK94LsWruNkNhHhYynjiIXnLXYB4ws/zxx42wGKdAD
KA==
--000000000000f531200640272ecd--

