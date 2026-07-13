Return-Path: <linux-gpio+bounces-39955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b07MJMqlVGofowMAu9opvQ
	(envelope-from <linux-gpio+bounces-39955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:46:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE2748E2D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:46:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K3Hr9zRM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39955-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39955-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B693E3019E78
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA673B2FC6;
	Mon, 13 Jul 2026 08:36:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418A3B3BF1
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:36:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931808; cv=none; b=GhWle8/UZodxQQotFl+l3WEMVmkgiPUigmnhMReZYi4MmIfuDhYpifgcoy+aN0cBPqPiDMhVQ8P6+zSLIA3zEn9yACEK4EzwhBYNBxNF5aNm926PKfJq+tE3ik0adRdqQ5kXXK+5An2vFx28y25BUxG9NE05JI5ltj/IAtzYUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931808; c=relaxed/simple;
	bh=MEuCQaKRK2OCSg8z1iZ2XH/k0/fcxzSJg5RBF3JnQCM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdaGTh+tC/0fIZEgbmevmIp7ZoVmu5sJ7WReVomRCDX//2SJQX9e5KQ0t+MoUzddNcq1hazoMQn0WcL+/1Hreg8NGOLqR4sz3rHx91n/By+W5YirWaqAaMnUop8yVtYN9v2qWeqUzXVe7JSAmHKFWHMWdNwL6H3yrbMrY93Mu2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3Hr9zRM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A521F01558
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783931806;
	bh=QBeUwJIXJms3/6Tic9aQZqS3Njj0/svqOV1cGNy95II=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=K3Hr9zRMcNTI5GjZ6L5a+cFlj1T79JGXmuZhghDtZz1YX2Kjd9j4LLCbJucd+qW4d
	 +m3Y4Vp1p8diMdQ5Vl/sKFGNomnYNJSFGf6F6+YrXs7jDmvLE2DA3XTVdrXbCJnvLO
	 MbE/s0YO/xAuZZiVobtI/6Q2LHAMS6k4TbSNH98rGL0/8CM5sW1LBn9e5DMqpMTogj
	 VntKmvGKI3EQLLqmopls/eDDjzX7WaM0pttTLxLLr2+H627GNunRSkG6kZLuja5lhM
	 uRYIe3rg4rCrlGIA764FX3le5ZuGsPVWEmxExJDcq7rC+mVjYMfVtkZigwy3e9Ainv
	 UAvxi1xb5WazQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c86945164so22132761fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 01:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpLfyfX4OZlbV9ktWyuWmwPTjJM1wg12es7LSzuZtPiOuSVuKSo2kBEvTU+UHjt0vNIQjoKxkz3JJed@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxd5AfrJR2V0YitOlw27q5emZ7lmOjR0OS6gaTCicYnKShmvd
	ciOkzT9rjOg180CcOcsMUzFk2wX8xaphC+sRD78uiGgV8gVa8ZgjGZ+O+sDaacZAXyXK38u+Ixv
	Cv1bmOYUERXdLm2r/Gf3KCZWzTghFJB0wbj0A8mnaQg==
X-Received: by 2002:a05:651c:154d:b0:391:1570:b6c6 with SMTP id
 38308e7fff4ca-39ca78e3b6dmr17345291fa.2.1783931805473; Mon, 13 Jul 2026
 01:36:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:36:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 01:36:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com> <20260711210131.236025-3-marex@nabladev.com>
Date: Mon, 13 Jul 2026 01:36:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
X-Gm-Features: AVVi8Cfsa0ItDBiNodG26S3_9jGGx3yuP-hiAD8ff_raWb2IPrBsLFiM5IVJVOQ
Message-ID: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
To: Marek Vasut <marex@nabladev.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39955-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30FE2748E2D

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

I applied this. I would have sent a b4 notification but got this instead:

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

Bart

