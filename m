Return-Path: <linux-gpio+bounces-31633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEofJzvDjWlt6gAAu9opvQ
	(envelope-from <linux-gpio+bounces-31633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 13:10:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EFF12D513
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 13:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93071306374C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8EC3570CC;
	Thu, 12 Feb 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LnRIhYQt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx-relay03-hz1.antispameurope.com (mx-relay03-hz1.antispameurope.com [94.100.132.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4934AAF9
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898208; cv=pass; b=biozVjpzML0pRk4zqiU8w/LZRwVNAXPC9yLAklXtGf2UsqAz5rIZn03HyHBK9li+hEQ9gkeogtEyr1F+U10fyItd2tGnEjtdyMCHHnaPOwsdccf6DxkGclofulO3Yy8z+ReWJhspudym5HkJrtBjf7bwVTwEA4Vl5ymjbdETaRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898208; c=relaxed/simple;
	bh=V8m1B3IMyBJaCsV1ehUqof4TcE092MGRa4DqV/Ym2r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvLv+37W2FDDFIwNZ/kjq2ves50EViZIhufCBqF/10hS+/498iNqelLsIvOaHLH443heUxv5tToR/dy8ZAt+J65IX591BH6cUbHm5PIIeQHIzeG8D/65fu5AyXxV6cHr6mJvi7+/fQSs9Rp1UsFQpFng0eakrzSCPAt6TQJKGq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LnRIhYQt; arc=pass smtp.client-ip=94.100.132.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate03-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=C2s9Uwik4ey0QPF0cFc9vjorOTrHfL+ie5knWjmxYxE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770898169;
 b=fYhHOig4kNJolqRVu/91Tw+PtbQwsShWxmdZ1k5AHHXTHXUhVDkkgm/DXjIoRbflYNqiAGgz
 PCTjGws3FGv5mHsb49InSZG16KyNsuK788S+Jjx0qs+jHBRGEzSz03fFea0MsR46y+xtHRxgioj
 dyUtfZG1rCep2wiIU3/u8nMD2Z63fhCOYnLJfNO+mrNF4mzMqzyvyxjEMTvhOl9l/sr02O3oFIO
 Sig4SW0mJ9vG2ubQinKxH7MlrLapMEUX4rsx/MxuG3gVDFbDGpv4yAQTDqSKAoFDlzR3PEKeub1
 ilMzGbM3+7Zifn7044b8gMpV3VM/cGIe20nrdGnxyozoA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770898169;
 b=KUJAqiRgytzkPzGCkOMoNQgJrBeMCZZyWRoPHySBHEIxJswDmQLlIDDNb53waTjzG5XKVWXH
 4/EuwmyYWZpYE8WVFzTW0qtnbUdL9ntgx2J90DktqypY1Gbt96OH/LFOtStKZtHQwgYPEFcTkhj
 GxsI4nIvb64cUEe+I6dnld3KZnZj/lYNqwnaGZa8E/qzkXx6xmKiFUil1hTGt9ZNIrJX9peuzxe
 KjHPR6LlDM4WwO41ri7rKY3UHNHHYrPyJFrCX9XRjORIXAc+cwoU3cjrcAiXvXffy7BFohI6GXQ
 akFyIn4mqFC0LtChtNZWmA9PHUHSduynqC6s7Escg88+w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz1.antispameurope.com;
 Thu, 12 Feb 2026 13:09:29 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5DB84CC0D2A;
	Thu, 12 Feb 2026 13:09:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Use Alexander's email
Date: Thu, 12 Feb 2026 13:09:14 +0100
Message-ID: <4284138.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-gpio@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz1.antispameurope.com with 4fBYxl6JyfzdkLB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:81aa4e1a7eaddeddcc84b29bae09efa0
X-cloud-security:scantime:1.861
DKIM-Signature: a=rsa-sha256;
 bh=C2s9Uwik4ey0QPF0cFc9vjorOTrHfL+ie5knWjmxYxE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770898168; v=1;
 b=LnRIhYQtlPmaXKnC+237dwz0pNwuXQwybCq/zYpU2VKzavTFFskcFIq+pF3e0x6V8pobVmcV
 Fpkz7Sy6UyMcHSNcFha4m9e/owpO2BvUtJkQvVy3bSz/59rVhEZj6fr7WHBpzh0KeveM7dIRpen
 /uGOm3Z6/KsJxap2LskIXneWvKmo9mYCFZA7SyLA2Z86nI6BpeVVf0oEulUE2Gq48KixCS6172+
 tpsGZyTg1z2JNkNiUNcL5DPqP0moYe/O4SYBvXt/FreokLEz0iFwsvh8qQkG18dTJ9eSNyR0Hn9
 1IcN+d0FVgl8gMCZFjNvSfOAi513Hi8hw5iM1P5BOI3cQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31633-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,devicetree.org:url,tq-group.com:url,tq-group.com:email]
X-Rspamd-Queue-Id: 39EFF12D513
X-Rspamd-Action: no action

Hi,

Am Donnerstag, 12. Februar 2026, 12:09:06 CET schrieb Krzysztof Kozlowski:
> Group/anonymous mailboxes are not accepted for bindings maintainers, so
> switch from such linux @TQ mailbox to Alexander's email.

Is this stated somewhere?

>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-delay.yaml
> index 1cebc4058e27..b99ceff6c5f6 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: GPIO delay controller
> =20
>  maintainers:
> -  - Alexander Stein <linux@ew.tq-group.com>
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> =20
>  description: |
>    This binding describes an electrical setup where setting an GPIO output
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



