Return-Path: <linux-gpio+bounces-26699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E51BAF45F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 08:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305D03BABA7
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 06:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC8026F443;
	Wed,  1 Oct 2025 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q6DFSWNo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D79FC0A
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759300985; cv=none; b=ZTaNZLoY/ncY39RvU8CjlwTBrSnjjN8GzptgdUWHAUhVP1Rl4BQeFaE8F9Q4IGcj2KexxkS1vzUUkEeRZdRk04/dGjUQMYw8iDR5KS+AWzPFaeQOOnlFqM+peRdYQ+/3uqyZFwNQI80yb3Tud+zBknZYY98Y8KqkLbFVBy9Ovho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759300985; c=relaxed/simple;
	bh=4wZOXi4yN6DQoWeaYXGEjN8KT4sqpMn+Ynqkcvpt1L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AojmMUlavQ08xEeIgqDdmkl+6KGleY+Aofa9twmLY4IrnVW9FD18vKWgkjDaekYTiccjb/SOa0XL57pLJlcLpgtMq8RFc78iul8VQvWimqChrD7JosPG6XhHdkJJekiWoiIHtzrQc+3GRtQCdBsgvw2X9CxMlKgYKQeAJqp/EWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q6DFSWNo; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-27edcbbe7bfso73867985ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759300983; x=1759905783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZjYdLjwH2ASq6xTq77Awkt7ruW9ubZFzks6JwJT1wM=;
        b=QdaSrS9YVVPbpp9pWVmxPa6m8jBKOX/s7E6lJWEHU4ST5sUEGKkQVvsfQi4i017Num
         E1TNm56B4vjJweDrQNwCIYkM9u7Ws1E1wtq3YX4PhkG6Yj2GHPDSuOqk66lQqFpnHgt5
         2Cgpo1vgBnOFvihgDhMS+R0nXqPypP+H4OT7TpP2JJ1OqlRA3JEgRMTgdfMBEIVW9H7s
         GHiBpVIAVRX58d47oS/gpCAkt5A6Yio1ctKzyxTSOjNNKvuLUO0NLrC7ZEGDnF2IyMl9
         nmXYNFHAmFlxIaasfiqM4FETawIAdI2+2UNHc4HdZggPdTsF0tZJM9QTPEGehtmee7hF
         NYFg==
X-Forwarded-Encrypted: i=1; AJvYcCXRkXLRwskXbUwsXE/OHLFUr3j43JVgxAAPm5tpt6BfC8MHzPlW/sykBSbKq6tX3ALAHc/mXdN5SiCs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6xaCH/9vyLXZqL1l3b2BRSmRTdde2IWP+tcggClhMkdEfqjOB
	/HM5nfxMvhH6VTHk+13emN2CV3GrS7lTkWbi+Lca563LH9/C1ZjaU34/CMvh0qrggZmiNEv9k+4
	8W2CJ8p6NgiNyX9nuoMeemIHh3CL8TK8WekUBEIqaqkrHOJr0I02M7WTIKQVxdRi+JAbhAAUtE+
	fyd8QtcXY84Q56720wusVTFGXSmtty+qTOKZ+HyVcdapph0QFGoK8nZO7RzOnN99t3zY3toCqnZ
	ON6lacvtKx5SJSxWQ==
X-Gm-Gg: ASbGncuD7fH2KlXp7P5g+LNYnflT9IYiELJp0RpSQnzjLO9q6NoJNnPCYI15k6w08K0
	OOgcL7njmPJGrMrEOzh0W4c193DGgtgY50ZJvViV0kXJW4UPq3ub4e5PW0dXTndLjf3Fl0E9OQb
	DWRhsb+OarOL54ZKYX9mEf3WnanFWyvvfigv+L3paSnINDyglV+tXxY4aLXZmFDuA9Zgk8RnXJw
	Iwaycv4MfLEn/GixBdgf2+Mi76FRia4jCWBrBZMkrOFberqw/3t1ZQl13ydWr0H/0HGRkgRZZay
	HNhFJ9pXowWpIGR94QQZk2YipB0GCoYAp1pWyxRvpEiyyCzQbFFDaJjT+BGBhXn3OjeuZgDoXWk
	QBeJaV32pg701pHFbRskLe4xhxY3uHrHfUtj8rRHL38FL2pSUTfSH+FkHT6yT7Ewfm3vLDeG74g
	7igSAgnXqM
X-Google-Smtp-Source: AGHT+IEVz/aBiXz5L4IqgX/LX4bUEtSLl0EzNUYNp+Fkmp4lYvfgXUfkYpiIH1PW+/yX6Ax5b//iU/Cw8O6V
X-Received: by 2002:a17:902:cecd:b0:25e:37ed:d15d with SMTP id d9443c01a7336-28e7ecaf7e2mr30122015ad.0.1759300982570;
        Tue, 30 Sep 2025 23:43:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed683154dsm14580435ad.65.2025.09.30.23.43.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Sep 2025 23:43:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-745c3f7e569so61252527b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759300981; x=1759905781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jZjYdLjwH2ASq6xTq77Awkt7ruW9ubZFzks6JwJT1wM=;
        b=Q6DFSWNonQqtBIR1q4SQcdONOQ1jCZiqAo3orcqy0J/IknWubpqyeNNoxtTG4NiBf1
         177okMlWaeMdGXZe4+fyPuGUNv4Bd43wTACHhtK8uxukfBqkcHek30Z1o4lKoEFMtFKX
         b7smWi+DV4swtuyRGl5dh6HHF2+heM0kKs+Qs=
X-Forwarded-Encrypted: i=1; AJvYcCWBT887WP/9P2SwGXboBghiqt8gVlm4n4tCzgbIv6oSOjDoMRITKnq+A8tLFTpZNEkX7yGsL5ZN1ieF@vger.kernel.org
X-Received: by 2002:a53:da45:0:b0:635:4ed0:5762 with SMTP id 956f58d0204a3-63b700a1dc4mr2979087d50.48.1759300980963;
        Tue, 30 Sep 2025 23:43:00 -0700 (PDT)
X-Received: by 2002:a53:da45:0:b0:635:4ed0:5762 with SMTP id
 956f58d0204a3-63b700a1dc4mr2979070d50.48.1759300980574; Tue, 30 Sep 2025
 23:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Tue, 30 Sep 2025 23:42:48 -0700
X-Gm-Features: AS18NWCXvxGLKyEQgr2Nd1fciwsYnfKhiMewwotlBr1P5wwD_rJpN6xY7XfzDOE
Message-ID: <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com>
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
	boundary="0000000000000c83290640132e26"

--0000000000000c83290640132e26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for posting this series.  It is really good to refactor and
use the bcmbca generic driver for the same chip family which I always
wanted to do but never got the chance to actually do it.   I
understand you are based on the existing 4908 pinmux driver design and
want to use the same type pinmux dts binding.   But the current
implementation requires manually entering all the pin,function,group
arrays in pinctrl driver source code, binding yaml and chip.dtsi(which
I don't see the update of 6846.dtsi in your series).  This is quite
some work and can be error prone.

I believe you have the access to Broadcom reference software and there
is a pinctrl driver we
use(bcmdrivers/opensource/misc/bca_pinctrl/impl1/pinctrl-bcmbca.c) in
ref sw.  The advantage of that driver is that we automatically
generate all the pinmux pin and function info into the
<soc>_pinctrl.dtsi and the pinctrl driver is designed in very generic
way and does not have per chip pinmux function/group info in the
driver code but rather from the device tree.  So for every chip, all
we need to do is just generating the pinctrl.dtsi and no source code
change is needed.  I understand this is not what a typical upstream
pinctrl driver does but it does the job.   Have you looked into that
ref sw driver and what do you think that approach versus the current
upstream driver?  Do you see any issue with that driver?  As far as I
can tell,  it should work but we may have to leave 4908 with the
existing driver and pinmux binding.

Thanks,
William




On Tue, Sep 30, 2025 at 5:03=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> This refactors the BCM4908 pin control driver into a generic
> BCMBCA driver and adds the BCM6846 SoC.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (6):
>       pinctrl: bcm: Rename bcm4908 to bcmbca
>       pinctrl: bcm: bcmbca: Parameterize pins, groups, funcs
>       pinctrl: bcm: bcmbca: Prefix all BCM4908 data
>       pinctrl: bcm: bcmbca: Use a guarded mutex
>       dt-bindings: pinctrl: Add binding for BCM6846 pinctrl
>       pinctrl: bcm: bcmbca: Add support for BCM6846
>
>  .../bindings/pinctrl/brcm,bcm6846-pinctrl.yaml     |   82 ++
>  drivers/pinctrl/bcm/Kconfig                        |    9 +-
>  drivers/pinctrl/bcm/Makefile                       |    2 +-
>  drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  564 ----------
>  drivers/pinctrl/bcm/pinctrl-bcmbca.c               | 1114 ++++++++++++++=
++++++
>  5 files changed, 1202 insertions(+), 569 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250930-bcmbca-pinctrl-deb82d571e13
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

--0000000000000c83290640132e26
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
CZJjcPsuR17GUEaM6yK7l8BmidIuNq+kNlAxymNmmgcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUxMDAxMDY0MzAxWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAMuHApmPTNaZ8eG6YtLimAxN98aKjyttYehSh
iml340yKUWl3BRx8vHVZ800m9t8pCTmaf/2gWGplAOWksMjwV9e0bcX4MSwrnFAtMBOKcAXHHYXn
LzFiMJ58FPvMSxlXSZtGtGyg9qq74QWXC/BMGQZilXG238e0N2Hv1eV5ATTgy1NOplDRFHJBkyYB
TBCK9P76gN+cb6Q9HE9dmNK1Kcr2fRWyaYVxr/hb+BUSupLdwB84fp2h76klBLmHtvphDlQ/KVrI
GmG5tTZwK80UI5fih3Auf9ynUlhv8SBSUlkW/68r9OWprGtUHZrzs6attrPd5EksHVbo8ca+tlZF
Ng==
--0000000000000c83290640132e26--

