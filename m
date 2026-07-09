Return-Path: <linux-gpio+bounces-39702-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m/tRB5tHT2q6dQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39702-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 09:02:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DEE72D70D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 09:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=WVIIl3yk;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39702-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39702-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22CE6301DC7D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 07:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148EF35E925;
	Thu,  9 Jul 2026 07:02:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6593D9688
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 07:02:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580555; cv=pass; b=AGVaQBsvwF2BE4HVyqNsFsD6xhhClByJ1wIzqIzF0S9O7cHsRYIOq/mQyPAitwm1z4zgvMFGzQ5Cldbhn9PmbocVYig4D+vDvFepECbET1Fk+NwjhPUoP6WeSqLy6dOV3kgjYGpCjI0bw6UJrB5q7fNk08ZtkzGFBJiQMT8W9Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580555; c=relaxed/simple;
	bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtaMRxQEUpvbJwLZfjmnGh7Fgc582UXKl1LDzQlBFtv0E0XCU6iN2iR0/AqKqjeSzfYra6/F7yYFTZPEjDgjFknVUUh1/jlFyftvecI9ninp8MwuivMRNMuAfIJ1JKcPgBbogn4a7iiKi7h5w5H6xHiA7Hp+gRAwCa5KLqqKNi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WVIIl3yk; arc=pass smtp.client-ip=74.125.224.44
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-667bae10ba3so155868d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 00:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783580551; cv=none;
        d=google.com; s=arc-20260327;
        b=bHGEA/9cw8HNtsPtCb8DLkGufccn79E8pH10J8N+OQnoyiKTZYcjd6hp4DIYKZlOIG
         a3kq/Wkfj1k+8AB9KwtijgohXsVOXrtLQvv1HHEmiBc/M2YW1aOsznSQ5bZZz2cEwX3H
         J0bhje9jWKt6/dTy15i4rBow7WBgYrDWprI03tGiKgo2tn/IUrEN1xRJlzIXhHFh059A
         kUo44UxiSkWW5b74VyE6LUlNU5rfBn4oUzeTBBzV1FzE9fAU298xJv/sC5AFocPMxH+l
         iztehR275ICh2wF2NQVr9npqMYmPzeDDEOlfGsNvwcNSmoi7AYwzYl8kyLDk1bBDFX/k
         Hvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        fh=NJOb0cb9pTRYKkTwqfkEaaoMYbkiDNY/Wcz5F36lsOc=;
        b=AIFSES3dntm24soL+wcYur/Pa/wKQ6G/LX6p/PuoNRsbXaAf7/YFnCmzybdCf84rtI
         wNAzFjVaY/wvSsExUi82UfX+geM9mDTk29U+x7uoFf2f2hufQT3bi1NT7EgR2YMvhFHO
         iQdy1cyksp5TnnkiKp8Z5TbY9sK7lI2zIjabr0pjqpRCqunFoTzZVdIowUUKDO3hMuFy
         d6+iE/gmiQyW6oRf17QKyo7fT1kRbeItMN5ASmSdvaIprFP/5KtZPh3KC3svjjAz5riS
         807TWIAcPqzPFOsjeaxCyg5CgQf2EcM4iAEIFGaayfYabVsaxyPmDeHQ0iOor9RJAXlH
         9DDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783580551; x=1784185351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=WVIIl3yk+VbV30oHmqXf1jD9Aaaar4oyWQNHozfaCam7YXMVmdcWExpEptsR4R9Zt3
         rfRJz9Qmhg4gBiZ2kYayh8hbOjNJpQox+JHyCGxoJgqJcMS4Hzhiz+U0cr9j0IcesNCY
         vgbz+w2F9sw1wWbXim5OMz12p8rHvuSJg+IkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580551; x=1784185351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD6Osf6Z82OsRPDVnF3a4ym/ndZXwELdg64JuzBVz90=;
        b=H79CxUudfYLgtp33ZpIGxuACkbzx86vd2+ayXbIRAmTeTRQVPjoSY6gTE97xAysF8N
         l6xFZRIcuV3yw4yfv6xWDx5cPIbhjJxANaDTOXSdPay49YiBN4PWQaqGGfS8UZsAZUDl
         VWqrc966HILDfIABY2oit/3O6M4Op8IJLWDCi5Tv/0I6x33lY/EucBm7rrWhLF3+4u8v
         Yh++zwu320dU9IQq0eKVf/GZ94KjPW4LAn1rtXQxO2yaa/UkvvgC1QBFKHmCx+w0Id45
         CzMsge4OViz5Hht48jXPqBkUdUOXmc7dLgdknSMXyH3l4sDfKqG/sZzUxyRCRHWEwbC0
         8PJw==
X-Forwarded-Encrypted: i=1; AHgh+RonS+u+bNDiODhqJUDCorze9CS8gP5tahY6z6ZJczJWPwL0iJnbWf+EHMKgu7w+TkG6XEO8aqSvGdcP@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7ciq05e/nmKXhFCh+Y9gGnoCZ4p7CE3Au0Gv3qyIaHnULlYf
	Mnu4MQ5OOEp4fZeCUtzxFM/dIFCSgz6PDdahucwFV5XjgeIVwyaVQL8xxSEok3ARDduBBW7e5JV
	lQalEN8El0F5024gnP5tp9jdqUG8hcG58o3CVLzSX/et8sjKfoSc=
X-Gm-Gg: AfdE7ckhv6lR8QVSmIcRWHyedp44DAq7EOeUbinR3PKfQtWg9990C78eY140iDwU7Dx
	VVGvPVRHq5m3MZXp6whrN/ye/MUzcg4VvvvmL4ZZfDy13/TLkoIumQMlPPTWGuUuAmErLoQ1QXx
	N2tEyARc15nx87WCJT9vT4atFA1x3d0K23a/VDdcppF+IS2YGtE9AjpkFBtMpaJqUL/GlnN6eWb
	QNPwkyEeDJ2M0qk1p5XyROCRM3zGHdJ0a19d+MG9UzvQPmBQOwUhlKRpZnL9QxZCcRI7Ys0mvyQ
	mcHxGeP38qQSdbWJ0MBGryH37RsnBWzkIZXNOA==
X-Received: by 2002:a53:cf41:0:b0:667:8b91:2436 with SMTP id
 956f58d0204a3-6679f2660e4mr3536586d50.101.1783580550797; Thu, 09 Jul 2026
 00:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-4-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-4-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 15:02:20 +0800
X-Gm-Features: AVVi8Cc-6951WW98xAGZ6jiAvP0W_Uwp4fM0w9OTetzj576Smn-XC53Uyv0aJbs
Message-ID: <CAGXv+5F3K+xpF8OVJPZgwd7cGJ6oWLZg3Qjh9hgdCop8bCMLEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform
 drivers from a single initcall
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39702-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:justin.yeh@mediatek.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,lists.infradead.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99DEE72D70D

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The MT7986 driver registers two separate platform drivers (mt7986a and
> mt7986b) and used to call arch_initcall() twice, once for each.
>
> This is fine while the driver is built-in, but a single translation unit
> can only provide one module_init(). Since arch_initcall() expands to
> module_init() when built as a module, having two of them would break the
> module build with a redefinition of init_module()/__inittest().
>
> Fold both platform drivers into a single driver array and register them
> from one initcall using platform_register_drivers(), matching the shape o=
f
> the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
> rolls back the first registration if the second one fails.
>
> No functional change for built-in builds; this is a preparatory cleanup
> for enabling module builds.
>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

