Return-Path: <linux-gpio+bounces-39854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBdkDqRMUWphCAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:48:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDC73DEF5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:48:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KHubEODI;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39854-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39854-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 445FA300B06A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D96338E8BE;
	Fri, 10 Jul 2026 19:48:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870332E5B29
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:48:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712907; cv=none; b=tpZ2rpmuqc60QGupzjT5LcIxkjwbOKeKT96+7HJccAy44C30BPqFv7VqXqwcvNM0T4ukU/jr90mHe3txnK1TjDo0AWvXDmxAbJqnUzniUTgnsDZM3BjfS0mPm4I3UW7xc1EHG8aUSF00vxFkatr3g5ePgyquZ/oj6V8Tm5a80q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712907; c=relaxed/simple;
	bh=r1Zf4djkyVsGdqHiqgT2yCHA+1xehfGqV1emcYl1I6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9L+pgzia2FDjLV2wm7E9JNyDO61vESYVE+E0OBDHJo3a10B2RKUH/azwez73Np02UiADxNJ1soYfnnNYywFAOtV4Q9B0SenRhthOQmwXq2Uezr0GBAbxA2gmxylNZTvWnzHt/9p4iLr0yDafCtpoXtlxtAvbil73oGVDwhha2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHubEODI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE761F0155A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712905;
	bh=r1Zf4djkyVsGdqHiqgT2yCHA+1xehfGqV1emcYl1I6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KHubEODI5OK2JjTzLoacd+Xr01Bdn2djdhyaYl/074SiQhy7GiltXk3uOVmqYK+Jx
	 gaIBB4JvCVLuVWPwYbajMX4wyLMe20zpe2yvO2E3Zf+M/jCxYCtOb96KZAZxJygLu6
	 LdIjuylf2OpzLru6fOiYnIeUqX4b1688vkKDiuc/Clwpgiu9XPvMV7U6eLhfHANeUj
	 svnCfvd5/BhdvmEos+dlaiaungyCXAz4FGHwtAWGlWWynv1es0W6tunrIph+PFAp1c
	 dy4llZLsfp/AE70Xrsxq5ev2pLwZe9Z+2hWF2+joPs1FeVyde3GT8lRFUGCmZxJcjx
	 plVtsxTqbfDZA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb5829fd5so1189605e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 12:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJmimRqIqdW1KXNuQq5HSfEjfm7NdK4/qJ2yPzOS4zFACKUYB1bY47keod5zRI3LHbc8cl+jyOOIr1@vger.kernel.org
X-Gm-Message-State: AOJu0YxbDj064Lig/4sUlA+oAZ1Yj3tYjPhz90IeASHrUYCoTp3NTq5b
	rXJWAjlxdPTDbXKxmoQrNoipqZhLzWY3KZzwkcSJNwFMES8BU/zLkjUlo7e31ZOrKQcQAVAFwav
	6rYqUym240sLRN6364BcAs1cwjtvQ0L0=
X-Received: by 2002:a05:6512:2c0e:b0:5ae:aeaa:140b with SMTP id
 2adb3069b0e04-5b0236a5c9fmr98033e87.43.1783712904103; Fri, 10 Jul 2026
 12:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:48:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKYrW3LzEWj47Mmi7DYL=cGZNLRzbF3w91GTs7FBCsjA@mail.gmail.com>
X-Gm-Features: AUfX_mwDu5nHkfrpKW31EzIHDBbQz-W_XVTsCEkvJgwgFKC10BW3wqwVZ3eoWUg
Message-ID: <CAD++jLnKYrW3LzEWj47Mmi7DYL=cGZNLRzbF3w91GTs7FBCsjA@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: pinctrl: apple,pinctrl: Add t6030 and
 t6031 compatibles
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39854-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:j@jannau.net,m:sven@kernel.org,m:neal@gompa.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:kettenis@openbsd.org,m:andi.shyti@kernel.org,m:ukleinek@kernel.org,m:k@chaosmail.tech,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCBDC73DEF5

On Thu, Jul 9, 2026 at 9:31=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:

> The pin controller on Apple silicon M3 Pro, Max and Ultra SoCs is
> compatible with the t8103 (M1) one. Add "apple,t6030-pinctrl" for M3 Pro
> and "apple,t6031-pinctrl" for M3 Max and Ultra as per-SoC compatibles.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

This patch 7 applied to the pinctrl tree.

Yours,
Linus Walleij

