Return-Path: <linux-gpio+bounces-32321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLRZJpa8oWmswAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:47:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 259351BA3A8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA81C30432FC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D176343DA4E;
	Fri, 27 Feb 2026 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OmgDNYZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513243DA43;
	Fri, 27 Feb 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207079; cv=none; b=PHq6e0gSeroz7mb17lJ4ckHjy+c+G/gTA0m2poaH9J3r3oT06dvtcdRLN2A0CjhZDU1oLwrIY6afARQttAbw/PvJkoJ8r7Gp616jfKGuWDF1wir5H9jyKBE01+k/mSytGb2hd8NIWWRQK3YMCZma4l6eac+IrXElxYgwtZ/LRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207079; c=relaxed/simple;
	bh=WlPAv+AvajISywu8uQzV9J05krbV7A8bT4LhP66uMaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IOQsEmWV3v2dWXYWJLeXMZy3Lhu+R6PSdpdY9SpKCkrTC2ugKQGdVU3Xr9iMd1783jxw6Cr/M5AkuxGuzIBb2MLYpLkXK8VYsBOYPhBPRwDTZVZphCPYEYxAaLH9ZUstgXIGKw5E9X1ng+SetbQYTfb5mkouVTUnKLXLqL0Ayqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OmgDNYZX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F2E64E419C1;
	Fri, 27 Feb 2026 15:44:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DBF05FE46;
	Fri, 27 Feb 2026 15:44:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 703EC10369387;
	Fri, 27 Feb 2026 16:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772207075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bxnefaYiI0l3MBaq7T5nAwIQDzb/FxqbwmQ8wxKQARs=;
	b=OmgDNYZXz2zz9xIicR2/ne/e4UYgFEIDOHPalHp4t1LtFvCw25L6VzXD/dVn2BH4hHiZvO
	hgbZdq1g/02pZF1u5lwvuvSpju+xxOONa+mhS8KNace+qoy3XLjAUOJGhczgKPjub2IxG0
	Vk4CxK/8XEKvwCjCkT9yFGz/+BFq6yMTerkUh71015qKoyPqpUHx94+V6r/SjeM7H8ygOB
	R6j/yW9zbP0RUqwIvk8sFISsN3bS0BspEiTc6kHzwu/WUo8Pl2AdV8sDSAbMYPHbryGtWR
	Nc4nBhH71XKjiGTvjvDSEKghPzdh6K2agDUg8UMUe6d84GJ+qtv3/F99miP3eg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Richard Cochran <richardcochran@gmail.com>,
  Gregory CLEMENT <gregory.clement@bootlin.com>,  Marek =?utf-8?Q?Beh?=
 =?utf-8?Q?=C3=BAn?=
 <kabel@kernel.org>,  linux-gpio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl:
 add missing items keyword
In-Reply-To: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
	(Gabor Juhos's message of "Fri, 27 Feb 2026 15:15:54 +0100")
References: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 27 Feb 2026 16:44:28 +0100
Message-ID: <87y0kenqcj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bootlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32321-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.53.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 259351BA3A8
X-Rspamd-Action: no action

On 27/02/2026 at 15:15:54 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Even though the type of the 'groups' property of a pinmux node is
> specified as string-array in pinmux-node.yaml, but trying to use
> multiple strings causes dtbs_check warnings.
>
> For example, checking the following dts ...
>
>   $ cat arch/arm64/boot/dts/marvell/armada-3720-test.dts
>   /dts-v1/;
>
>   #include "armada-372x.dtsi"
>
>   &pinctrl_nb {
>           pwm-gpio-pins {
>                   groups =3D "pwm0", "pwm1", "pwm2", "pwm3";
>                   function =3D "gpio";
>           };
>   };
>
> ... results in this warning:
>
>   arch/arm64/boot/dts/marvell/armada-3720-test.dtb: pinctrl@13800 (marvel=
l,armada3710-nb-pinctrl): pwm-gpio-pins:groups: ['pwm0', 'pwm1', 'pwm2', 'p=
wm3'] is too long
> 	  from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada3=
710-xb-pinctrl.yaml
>
> Add the missing 'items' keyword to the schema to allow using multiple
> strings without such warnings. Also adjust the indentation of the next
> statements accordingly.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!
Miqu=C3=A8l

