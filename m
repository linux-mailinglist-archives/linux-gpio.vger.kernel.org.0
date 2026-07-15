Return-Path: <linux-gpio+bounces-40101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UAlrJnFCV2oMIQEAu9opvQ
	(envelope-from <linux-gpio+bounces-40101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:18:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DF75BCDC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 10:18:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Y+vkypAF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40101-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40101-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 442FD30022AA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E08C3CC323;
	Wed, 15 Jul 2026 08:18:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AE3C4B6A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103527; cv=none; b=Y9UDzSj4V5QsqhKYapXddT+Au3ZJBmXtxSGv3+lLTlZ18kxlfoPwBu9xkCIVx8f8mkyYBLFo+AAleABXM3QJggDaa01NIFOqeJAoDFQrTNldEdlwrqkOSxxqzttGlxAwphmM7v0WNeQzbOMO9V1Nekf9ijCv6XfkWXVkvqz1lMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103527; c=relaxed/simple;
	bh=tL9ke4GV6oGp+YWHUNQKE8E8soXN35upf5Ca2OWsGO4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/Mzk8+cKTBfuX7BJFPlNrDe0h1fYz1qPrm2GjuhorNg+rBCgUXRT9PpJTch59OjGSgfOVakXuzcsbbOKHAO4okcrAhT4pypvWbG0/jzTEkvDZSFmVwyjIVGMkKNi+d02+nsTBmlkmO0lX9zo5aMk7W+btuO0abiG9GNiMDa2Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+vkypAF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204121F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103525;
	bh=8hGVZh4PoHLjhUPeUZDk7YT9r2Csoy+q60RG1t1sPcs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Y+vkypAFF2VaKmeNBsJM168DosyIXULOV/1fpLuzsTul1sgGvXaBR4KZ6xOeIC+2j
	 Ci+eiuoe5uMuHswoUkQiT4cMDUrKyJHoTFFQmF37me/jk2bry6CyrZbFe4/+NfwFcX
	 SG7ighaYJUwUSjtA22Qc2YIC4pFU+ExRU41dvQRVxxFMEEaWzAjIETlABGoFhH67vD
	 hcmZwvOC5bee6CUqAe029xw9LtrSlXAKvUsDYQycVXhHx0+E6TaxSvcfjZ5xskzofp
	 L3QcfMeKA0I8rSRy0J4LVEzwZYEL7usUigDcxEmdjKlPkyB9vRYGbpTIPLxVrXraLs
	 6i7e19kgfMjHw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso27600271fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 01:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrhe0KwhvPBUep90l8fYRF8mh22EClKnS/IuLkzMhLGSFPC3zWNT8+nEQU/cFy+Zo7F6SElatRDabwg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/e9LlL5CoJEWvyeQgTbh3hyqZc9EEvLCEdzymfHWKoD3Ypc47
	8O8gC5inVQCnCPGMCSyxN3+Ynm5sDU0/ml2K3GhH6qGWtt3DUWCuubezUhH6N+tKkeVB4ArAVBx
	fe4XZzDJPzRunv0KpCAKjrrj2Wq4KCgnBM+wroTeJgg==
X-Received: by 2002:a2e:a58f:0:b0:39c:7919:fcf1 with SMTP id
 38308e7fff4ca-39db6d81975mr4644921fa.33.1784103523816; Wed, 15 Jul 2026
 01:18:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com> <20260711210131.236025-3-marex@nabladev.com>
Date: Wed, 15 Jul 2026 01:18:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
X-Gm-Features: AUfX_mwKBsfMiGTO8O5kdCZA1clS20B1ees3zGV3oL0u74_c0uWhHuUReKtAFA8
Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
To: Marek Vasut <marex@nabladev.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40101-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:konstantin@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,vger.kernel.org:from_smtp,dh-electronics.com:email,st.com:email,mail.gmail.com:mid,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stormreply.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D7DF75BCDC

On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4f955f855e1ab..4631388a7d914 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -22,6 +22,9 @@ properties:
>        - items:
>            - const: diodes,pi4ioe5v6534q
>            - const: nxp,pcal6534
> +      - items:
> +          - const: kinetic,kts1622
> +          - const: ti,tcal6416
>        - items:
>            - enum:
>                - exar,xra1202
> --
> 2.53.0
>
>

Hi Konstantin!

I applied this patch with b4 and tried to generate the .thanks email. It failed
like so:

$ b4 ty -all
Auto-thankanating commits in gpio/for-next
Found 9 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH 00/10] arm64: dts: st: Add support for DH
electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
DHSBC
---
Generating 1 thank-you letters
  Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
Traceback (most recent call last):
  File "/usr/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
    b4.ty.main(cmdargs)
    ~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
    auto_thankanator(cmdargs)
    ~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
    with open(outfile, 'wb') as fh:
         ~~~~^^^^^^^^^^^^^^^
OSError: [Errno 36] File name too long:
'./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'

The name is under the 255 byte limit, is this a b4 bug/limitation?

Thanks,
Bart

