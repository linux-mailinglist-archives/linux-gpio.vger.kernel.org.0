Return-Path: <linux-gpio+bounces-37144-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOtGK/dDDGrQcQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37144-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:05:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8E57D296
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 871C33068473
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D38405C4B;
	Tue, 19 May 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnEswBOe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIBI4RV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D03F4DEE
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187838; cv=pass; b=AANzqK+MsoORXPltXJigbzoEi1AkVcFkHu33GZuY6svk9LL9ZQkYR39T1qNAQnpbFpeN5xR4SYU8BdqLW3k1BnnvcSBcIvhV2r20i1bvisHY5sr2+RWW8rv6I6NTi2Dw/dTgJZ5a227o2nQl3f+2jxjhVF88gGEeCDb5P4eLmM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187838; c=relaxed/simple;
	bh=cyC64b1IdudV6BmVyvS2FCZeravUj92HSF7yWMV8NGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOMAFtFMivMvqDNf9q1ktQEg8NQ90Qvp0ZIEP3RJrVH434HqJ9ojoLVg8slPBixY2fmXt8clrvw/u3reyB3CDE2T+ZuhtWxsXsJE1WDSJY4SjCuOABXnhhTE+03kV5P2BuLylPq5GVRQLH1W2utSO7RRHOIgLLCuy5IaIQsIrm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnEswBOe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIBI4RV6; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779187835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNYjy48Qe/rJr9n5fbbJJkzIk+utflxbYUG55L8i+pw=;
	b=fnEswBOeNwTBUJsJQjwbZjXZi0BFIQsEhgjd3NBNfXPZMz3xpbBLK3JIw79jUT11G0zxdi
	YxB5gOgU7WShXGdSFIFQYkO+TrVNzjymD0WUdVA1Ci4QybdJWVseAHbkcjjRetMN5dO5AW
	7gM/sfbjEW94SH7YyHtTnhO895p3IIg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Fi38xxO_NeyS16hXMX9zKw-1; Tue, 19 May 2026 06:50:33 -0400
X-MC-Unique: Fi38xxO_NeyS16hXMX9zKw-1
X-Mimecast-MFC-AGG-ID: Fi38xxO_NeyS16hXMX9zKw_1779187832
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a86f40bffaso82295e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 03:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779187832; cv=none;
        d=google.com; s=arc-20240605;
        b=BQxYOEVdB9Rj/YckTJ0hYdflYQXLVmC5xaMxkTpGUtfzMXCDa0QIUp/ObsW4c9+Yz+
         uXYWmtHzsWOg4N51wTOMpm3bByevMUlHOmXB8HHmVQP1s0eDULOeIKoi1RUfG/GkG74z
         I3Pnbs8S7KMeI7R755JSeDiG1j3zjRGNfL4RkxxVclhQ51e4/KbHxCmHOKPZpe2W203g
         ZS6vb1+QK3STM6tCuzJgGW93aWZYRQXR6vKvedCENNvkwOxX2Vinuy1AawK1+CWzRCRG
         YDbHNw8XVNtbj4i06IT3RUab14OahkKTiO6Lm/1bQ9WgwWPH4b0vCJsnXXKD13HR+REm
         dcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNYjy48Qe/rJr9n5fbbJJkzIk+utflxbYUG55L8i+pw=;
        fh=fH4De4L9u/Hn8OjZkxs7R6ZOhlAsUubXRv7HdAzrJT8=;
        b=cMVUQQOSHEol2zR5y7YtAGVagStvEwgOK+XzyRwyAv6h8dOBP4cDOF9yA7hilaIKmY
         Ez9AEVrR7nhAegrzO2jMC304UJZCnJ5hTDIOGwzEI9haWXvjUKiBQZ/y1dNqflQs+15L
         TvPO1iWvae8qh94c0uMO31dt3MGdIF5YgaaoX/09NkRa1s/ebUoU2/wpuCQnlZQWDC89
         NPbAK30gNsd75NMzBeARp+RtnUFB/kW+sVaqjDQejy02x/TTMsScjQdsjl5e7+9Jn5OB
         PIsLT8bVpB7VSmad0R7rA9KVJGUWkS9oO4Zv8UrsgGhRAc3B2cYnt5oWlwbeKDbJeP9F
         YYGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779187832; x=1779792632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNYjy48Qe/rJr9n5fbbJJkzIk+utflxbYUG55L8i+pw=;
        b=gIBI4RV68fM/B0DhDpJuML3g8Pi0XEUrEzOU7S3ZF97L6kZMRBvS9P0QFCnBkIW7ZQ
         Vas4ya1PYktiYtAHYpbC/k8Ubr7d0zDWWfbdBu5xsjgHsT8ZdKCEOptQU4C31UlBdVmH
         ZQv7E28iHvgWEVGzE+1xeR3e099blQ6JMiis5Z7Flnl685pFxC5EUmk4R8mcwcBoqaaQ
         4vpnrQ0fMewlCgvPZcnOh4afNn8yhQg+gKFtmJahZZRZwSTd/dqZYrdWWctYXTfpmvD6
         R9oP2JMpBj5wzmdcMLIqOl7ChGPEciBr/FZI4PlUTkxanoW+Gvntl4wpNSqeekiw5RzB
         QrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187832; x=1779792632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNYjy48Qe/rJr9n5fbbJJkzIk+utflxbYUG55L8i+pw=;
        b=iSu6x14w9Jzm3SwuGwGRMVc7pKjg58ZSePdGCgOYYkghfe6VVbaY4byTaTgxVb6yqq
         Tlj31ZVZH3jIZm9E1ec7u7R6fl2m+iFhT5/tkWqUmmLvaDAmpDSEtWw8czknKpF/SPPC
         Hf2VZDovtldA4ds9aytiC1Agf3ILdxBvUpRBNXtkpFOyeWCttWc6h1H0tD7gYyXBCkUF
         uNI10N6Kghb2I4az6mgSd1DCgUxDcpPiiTkM/ESSdAJ5p+aFUqRYWBnz7YKiroTKZh6z
         LQWWtk2yLNdp7smDok4Q0jfzAmzhMtlXEBu/vY/SONaqmdaEpW+Phbs4LHsUpk6XFVyn
         sYmg==
X-Forwarded-Encrypted: i=1; AFNElJ+ioxZiVEksXkA6pldM4zFdOA97oo036G5aiJya/CjxWJ+VTtYC4TOQBIFHPeR62QM/in/gVhzonsqy@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZXRwSZ7ExNR0CJ8dZaaA+91pbMsx7oteAfn6HT+5yBK8mWtU
	ZQ0TpdearKgY72+zAduAtjRD3/f9K6tgMzfZTdJLcQxVbvNNXc9qr5KQpoY9HBdssy7f92KVA9O
	O+gXb23PiKo3ttAlunbQOG8GMMbQeZ8iYb3g0TTgTEnYxlrcvuBpdObS5OvsKSV0OZxeEXs/0Pt
	WG+tGfxptLGne2OU2e19kvPdq5SVkVBkyT6pvQqw==
X-Gm-Gg: Acq92OF+C7gdqg7ueutuJvEVVpZQIy9upZiTpa08zvxWcS5gwCest4C3D+ZQ1nYS4uX
	A3FQhXODMRT/kCfkRUV6VvHeebOH4GljZzb0blbV30iwM1I5JVeWs5kcIjMD68FWuPrAOXdDs8S
	sjzoMXfU6qm42EbCSy+f35rkoYAnp7HTEoRp2GDrgRIUtIRORubCt/J4vZeRlUz6HXPedK2zwbs
	XPNyNCoXKH4XHRc
X-Received: by 2002:a05:651c:e19:b0:38e:2183:2287 with SMTP id 38308e7fff4ca-39561da3d23mr11613931fa.6.1779187831967;
        Tue, 19 May 2026 03:50:31 -0700 (PDT)
X-Received: by 2002:a05:651c:e19:b0:38e:2183:2287 with SMTP id
 38308e7fff4ca-39561da3d23mr11613641fa.6.1779187831311; Tue, 19 May 2026
 03:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 12:50:19 +0200
X-Gm-Features: AVHnY4LAnrM7CYLVC2t872uBzKbq5fK7Xe0LmiuWNlKH-VqYUuotXoVDaWFXXlg
Message-ID: <CALE0LRv3WrwdKhQ=drkco-7AFsgPC-cMc8rvE7TxkgUQvYCfOw@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37144-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eballetb@redhat.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: B6B8E57D296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Thank you to send these patches upstream

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> This patch series adds support for basic GPIO
> operations(set, get, direction_output/input, set_config).
>
> There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
> However, this driver exports both as a single GPIO driver.
> This is because the interrupt registers are located only
> in SIUL2_1, even for GPIOs that are part of SIUL2_0.
>

With gpioinfo I see

> There are two gaps in the GPIO ranges:
> - 102-111(inclusive) are invalid

line 102: unnamed          input consumer=3Dkernel
line 103: unnamed          input consumer=3Dkernel
line 104: unnamed          input consumer=3Dkernel
line 105: unnamed          input consumer=3Dkernel
line 106: unnamed          input consumer=3Dkernel
line 107: unnamed          input consumer=3Dkernel
line 108: unnamed          input consumer=3Dkernel
line 109: unnamed          input consumer=3Dkernel
line 110: unnamed          input consumer=3Dkernel
line 111: unnamed          input consumer=3Dkernel

> - 123-143(inclusive) are invalid
>

line 123: "PH_11"          input consumer=3D"kernel"
line 124: "PH_12"          input consumer=3D"kernel"
line 125: "PH_13"          input consumer=3D"kernel"
line 126: "PH_14"          input consumer=3D"kernel"
line 127: "PH_15"          input consumer=3D"kernel"
line 128: "PI_00"          input consumer=3D"kernel"
line 129: "PI_01"          input consumer=3D"kernel"
line 130: "PI_02"          input consumer=3D"kernel"
line 131: "PI_03"          input consumer=3D"kernel"
line 132: "PI_04"          input consumer=3D"kernel"
line 133: "PI_05"          input consumer=3D"kernel"
line 134: "PI_06"          input consumer=3D"kernel"
line 135: "PI_07"          input consumer=3D"kernel"
line 136: "PI_08"          input consumer=3D"kernel"
line 137: "PI_09"          input consumer=3D"kernel"
line 138: "PI_10"          input consumer=3D"kernel"
line 139: "PI_11"          input consumer=3D"kernel"
line 140: "PI_12"          input consumer=3D"kernel"
line 141: "PI_13"          input consumer=3D"kernel"
line 142: "PI_14"          input consumer=3D"kernel"
line 143: "PI_15"          input consumer=3D"kernel"

> Writing and reading GPIO values is done via the PGPDO/PGPDI
> registers(Parallel GPIO Pad Data Output/Input) which are
> 16 bit registers, each bit corresponding to a GPIO.
>
> Note that the PGPDO order is similar to a big-endian grouping
> of two registers:
> PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.
>

I can also read the correct values from an input pin connected to a
external switch.

]# gpioget "PB_05"
"PB_05"=3Dinactive
]# gpioget "PB_05"
"PB_05"=3Dactive
# gpiodetect
gpiochip0 [4009c240.pinctrl] (191 lines)
gpiochip1 [0-0022] (24 lines)

So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

> v9 -> v8
> - remove the SIUL2 syscon child nodes from the
> device tree and DT bindings
> - remove syscon child handling from the MFD
> and pinctrl drivers
> - remove the MFD driver and use a single monolithic
> pinctrl/gpio/irqchip driver
> - add a new compatible for the pinctrl+gpio binding
> while keeping the previous compatible for the legacy
> pinctrl-only binding
> - update bindings to include the PGPDO/PGPDI and
> IRQ register regions in the DT node for the
> pinctrl/gpio/irq binding
> - add IRQ-related entries in the bindings to
> document the intended hierarchy; IRQ support
> itself will be added in a future patch series
> - update DT nodes to match the new hierarchy and
> compatible scheme
> - fix dtb warnings
> - reorder commits: bug fixes, API changes, DT bindings,
> driver implementation, DTS changes
> - split commits further to separate minor
> style-only adjustments
>
> v8 -> v7
> - remove all ': true' lines from properties in dt bindings
> - remove NVMEM MFD cell from SIUL2 in dtsi
> - remove NVMEM driver and configs
> - expose SoC information via syscon cells SIUL2_0
> and SIUL2_1 in MFD driver
> - add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
> - add patternProperties for "^siul2_[0-1]$" for syscon nodes
> - update example to include syscon cells with proper format
> - remove `reg` property from pinctrl node in dt binding
> - update Kconfig help text to reflect new syscon structure
> instead of NVMEM for SoC information
> - squash deprecated SIUL2 pinctrl binding with new MFD binding
> - dropped "nxp,s32g3-siul2" from MFD driver match table
> - fixed commit messages
> - fixed dtb warnings
>
> v7 -> v6
> - fixed MAINTAINERS wrong file path
> - add unevaluatedProperties, change siul2 node name, remove
>   jtag_pins label in the device tree schema
> - change compatible definition in schema
> - change node name in dtsi
> - mentioned binding deprecation in commit messages
> - split mfd cell conversion commit in two: one for the
>   previous refactoring, one for the mfd cell conversion
> - removed Acked-by: Linus Walleij from commit:
>   "pinctrl: s32: convert the driver into an mfd cell"
>   because of changes to that commit
> - deprecate the nxp,s32g2-siul2-pinctrl binding
> - add NVMEM MFD cell for SIUL2
> - made the GPIO driver not export invalid pins
>   (there are some gaps 102-111, 123-143)
> - removed the need for gpio-reserved-ranges
> - force initialized pinctrl_desc->num_custom_params to 0
>
> v6 -> v5
> - removed description for reg in the dt-bindings and added
>   maxItems
> - dropped label for example in the dt-bindings
> - simplified the example in the dt-bindings
> - changed dt-bindings filename to nxp,s32g2-siul2.yaml
> - changed title in the dt-bindings
> - dropped minItmes from gpio-ranges/gpio-reserved-ranges
>   and added maxItems to gpio-reserved-ranges
> - added required block for -grp[0-9]$ nodes
> - switch to using "" as quotes
> - kernel test robot: fixed frame sizes, added description
>   for reg_name, fixed typo in gpio_configs_lock, removed
>   uninitialized ret variable usage
> - ordered includes in nxp-siul2.c, switched to dev-err-probe
>   added a mention that other commits will add nvmem functionality
>   to the mfd driver
> - switched spin_lock_irqsave to scoped_guard statement
> - switched dev_err to dev_err_probe in pinctrl-s32cc in places
>   reached during the probing part
>
> v5 -> v4
> - fixed di_div error
> - fixed dt-bindings error
> - added Co-developed-by tags
> - added new MFD driver nxp-siul2.c
> - made the old pinctrl driver an MFD cell
> - added the GPIO driver in the existing SIUL2 pinctrl one
> - Switch from "devm_pinctrl_register" to
>   "devm_pinctrl_register_and_init"
>
> v4 -> v3
> - removed useless parentheses
> - added S32G3 fallback compatible
> - fixed comment alignment
> - fixed dt-bindings license
> - fixed modpost: "__udivdi3"
> - moved MAINTAINERS entry to have the new GPIO driver
>   together with other files related to S32G
>
> v3 -> v2
> - fix dt-bindings schema id
> - add maxItems to gpio-ranges
> - removed gpio label from dt-bindings example
> - added changelog for the MAINTAINERS commit and
>   added separate entry for the SIUL2 GPIO driver
> - added guard(raw_spinlock_irqsave) in
>   'siul2_gpio_set_direction'
> - updated the description for
>   'devm_platform_get_and_ioremap_resource_byname'
>
> v2 -> v1
> dt-bindings:
> - changed filename to match compatible
> - fixed commit messages
> - removed dt-bindings unnecessary properties descriptions
> - added minItems for the interrupts property
> driver:
> - added depends on ARCH_S32 || COMPILE_TEST to Kconfig
> - added select REGMAP_MMIO to Kconfig
> - remove unnecessary include
> - add of_node_put after `siul2_get_gpio_pinspec`
> - removed inline from function definitions
> - removed match data and moved the previous platdata
>   definition to the top of the file to be visible
> - replace bitmap_set/clear with __clear_bit/set_bit
>   and devm_bitmap_zalloc with devm_kzalloc
> - switched to gpiochip_generic_request/free/config
> - fixed dev_err format for size_t reported by
>   kernel test robot
> - add platform_get_and_ioremap_resource_byname wrapper
>
> Andrei Stefanescu (2):
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: implement GPIO functionality
>
> Khristine Andreea Barbulescu (5):
>   pinctrl: s32cc: use dev_err_probe() and improve error messages
>   pinctrl: s32cc: add/fix some comments
>   pinctrl: s32cc: remove inline specifiers
>   dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
>   arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
>     node
>
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++-
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
>  drivers/pinctrl/nxp/pinctrl-s32.h             |  15 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c           | 646 ++++++++++++++----
>  drivers/pinctrl/nxp/pinctrl-s32g2.c           |  25 +-
>  6 files changed, 707 insertions(+), 138 deletions(-)
>
> --
> 2.34.1
>


