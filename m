Return-Path: <linux-gpio+bounces-37439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGhwOfAPFGpeJQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:01:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395A5C8451
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 11:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D387301E951
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07053E3DBE;
	Mon, 25 May 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afX2nWbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651623E4C85
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699419; cv=none; b=PCxtbEmRXE61OSkt7xpmfKO3NnAtFuyJ5Ust/Fh7SqD4TWXvGyy1IV6k3je2JupxkOsy3fYceaVw/ZwZIetQIQlncOnmJDGBKQ5Vs9S446kZdpzWwR8AONoFYQLJllRsZ/9tpzb3NLqbEgybdwqX/qcJzUDYXosV4ROMEcYBojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699419; c=relaxed/simple;
	bh=7PvwyQllz/pjQymDAzG0DdH6jfnX3fKrrEx3IT04oDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqJDfXsrVyMUqNuFfZjTJrZqidwWgJOWWsFCAvNtz7N+2pV6TRuiIuTrGEWgSeD6NeYuO660IW/okR6dOCtgr7NDYau4ssbMlXU3pbms6ttwwGJ5AgYSiv80cRRJeOIXD3lV0VRV6r3enyAZGOyCdNQvBKXxyEfCquPTvxZKd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afX2nWbi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0F41F00ACF
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699418;
	bh=7PvwyQllz/pjQymDAzG0DdH6jfnX3fKrrEx3IT04oDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=afX2nWbiFCbDz6PnnrS4+QAZf0GARg6ufmCva7Lo1C1L8uxDo/U/sJ0K+011DdNyl
	 xtlG2dpEeMpaUokvP/LNucXbYmuCGBDW+uy0xdcLkPCBPH56sYMzfB9STwCeTdTtSW
	 T2h1S6Ypb5QJNIwUtJBfC0S/ybri9K/YoiYpZ8VoMzQqFX6WKcSZcDmE09gGCGv4WL
	 1omYkY6UbeHiOg3pF1kiSSjbyCQcvc/qd37DYtGqG12maVHnWzOQmk4q+rUzoIDjU6
	 2Qhzu49q6owNlWwlMzuKaYl7YYK0gIpule4vfv6GfzL6+buWvIRQZcSQDYCeYsfPOz
	 yOQHVl3YLg5pQ==
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e615efd7d7so1893356a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GgXiKKZKiYI4paZHECdDa3/Xb61UG08cUDa8oheP7ianUU99Bp7CQvDSNHKdiXbuoexv69edJR/2e@vger.kernel.org
X-Gm-Message-State: AOJu0YwRB+Td8IYDjFlTPwmBv6DZVhfCbWgmqtt596WaWq52Kv6A1T+H
	whuRA/AGkoa1FNxmGDFvWeIh16tycujIkrYloNCdtYNLk+ZIk+6E9e5wkh5I27ck6xrj9h4csO2
	JIf3xEUfm0yUHxCzzt33oiQyS/JDfuDs=
X-Received: by 2002:a05:6830:67eb:b0:7e3:d199:3164 with SMTP id
 46e09a7af769-7e5fedf1913mr9444576a34.11.1779699417451; Mon, 25 May 2026
 01:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:56:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLn5VCye-B7hFj2O+w4v2fJ+Anv20AXNpi6+gnetQ0z76g@mail.gmail.com>
X-Gm-Features: AVHnY4KcQDk0adPJPzy4UzxdMwWacFrk2st2duRbr0oE9NOwculfoeTBCKJMzrs
Message-ID: <CAD++jLn5VCye-B7hFj2O+w4v2fJ+Anv20AXNpi6+gnetQ0z76g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37439-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6395A5C8451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 7:13=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series of patches converts rsk7203 to use static device properties
> for its devices, including gpio-keys and gpio-leds, and removing
> dependency on legacy gpio API (in favor of gpiod API).

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

