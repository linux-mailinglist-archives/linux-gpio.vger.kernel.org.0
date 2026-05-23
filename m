Return-Path: <linux-gpio+bounces-37404-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZNZSJ1F1EWq5mQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37404-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:37:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E158A5BE372
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C2030131EC
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C2F37189D;
	Sat, 23 May 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqWQgYrf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE71FB1
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529038; cv=none; b=u7jPIrhEpuePVvCaDAM5l3rCLThQSHO3LD+i9Zhzh7xVmsqnRpfq97w3LIfof2HjoWiX7/ug0ukUIdfW2Mwk8jGKORo5Iycx1V03jJprY9LkVBJMyEBJiMeeLq8shMheLWOR+Y3xs61UTXsmso1jMgqWNc+PvxnQu/X/UI3TPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529038; c=relaxed/simple;
	bh=11e6tmUF+BcQmt36bxrCztET5YUxkRxYcIMrH1p1AxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItLLIUc4V0HN35V53BzDpsnsvNuWqLHieMl8jMsx1mQMf7bonDxkE2rIoR5raNTFOz692Fo4gcClKw9FflYrmeHELOl8ATMQCoqV9aCKAPcbW/UCMwiTp65PIvIkJGCPA133A8gVAetr3HqD1ROrOMbrGOgs3K7fMHXKYp+Alps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqWQgYrf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3911F1F00A3D
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779529037;
	bh=11e6tmUF+BcQmt36bxrCztET5YUxkRxYcIMrH1p1AxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RqWQgYrfdGQEWSkw6614n5xbO9htsJcfX17wLts7sxwK3ZVBWek7fJz2fcnShBVP8
	 8r4nH2cBVYUnZFOw3Sx4gPF5AgTcPwJ7EEDBSipEmYUoTme4tx6kqlenRY5VI+eW4j
	 5ebVkNspes1QDCvsSFT+oz+S4RI9PzvgImbL9WfuklcsKMZVt8cN5ijliNAdRPauY4
	 N7jKFOq144jc+sTZn7ETXzE/Lf/GzJlv2UGe9+aA9p0r74S8hbU5umvGFnKrtYo3SR
	 2YLasifsnjciz/2LCejnzE//aUrf/R7pZ6tCpBHyKlMX2kN6T46LOhtkpZik2NepEL
	 295BEiHLB9fSg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3942e9977a5so84169581fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bM6eigUYT/AVKLRmR6yxjcYcs64G7lQWUo+0HLlCaGj6oX4tqCb/gn4x6ijuqMSWoKDu+JOpYkwAF@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBEnyLv8Wfxz1Lm1A5oF54NLCl0QSuwxLUk3MCQyM40kyRv1Y
	zkssALi9M06nqESaOLaKGalL5GjUL0tK8i1HF4B196cMEnekx1QYQqJN+5mF/Y6X2EbPg8JcCSR
	20rG+2rfbfIfL9GVOZWya9V1EASFR1Wk=
X-Received: by 2002:a05:6512:114e:b0:5a8:7eda:7d8f with SMTP id
 2adb3069b0e04-5aa2ba85a0cmr3647436e87.12.1779529036009; Sat, 23 May 2026
 02:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515160537.115808-1-o.rempel@pengutronix.de> <20260515160537.115808-4-o.rempel@pengutronix.de>
In-Reply-To: <20260515160537.115808-4-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:37:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLntC2_v68z6dcCCzvdLPQNo8ZYEru8=vO7hxQA9AvV6zA@mail.gmail.com>
X-Gm-Features: AVHnY4Kz-M5FI-BNqQ24DfcoYzQbAVYXn57oRkLed4jVFTFJSmUTkuoY7Iv6os0
Message-ID: <CAD++jLntC2_v68z6dcCCzvdLPQNo8ZYEru8=vO7hxQA9AvV6zA@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] pinctrl: core: Make pin group callbacks optional
 for pin-only drivers
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37404-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E158A5BE372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 6:05=E2=80=AFPM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Currently, the pinctrl core strictly requires all drivers to implement
> .get_groups_count and .get_group_name callbacks in their pinctrl_ops.
>
> However, for simple pinctrl drivers that act purely as GPIO controllers
> and pin-specific configuration proxies, without any concept of muxing or
> pin groups, this strict requirement forces the implementation of dummy
> callbacks just to satisfy pinctrl_check_ops().
>
> Relax this requirement for pin-only drivers by making the group callbacks
> optional when no muxing or group pin configuration support is provided.
> Update the core and debugfs helpers to check for the existence of these
> callbacks before invoking them.
>
> Drivers that provide muxing or group pin configuration operations still
> must implement group enumeration and naming callbacks, and are rejected
> at registration time if they do not.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Since it's unlikely that the rest of the series will be merged for v7.2
I just applied this one patch to the pinctrl tree, because why not.

I stripped off the controversial Sashiko review tag until we know
what to do with these.

Yours,
Linus Walleij

