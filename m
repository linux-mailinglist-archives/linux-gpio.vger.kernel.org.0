Return-Path: <linux-gpio+bounces-36985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BqHFiWcCWpHhQQAu9opvQ
	(envelope-from <linux-gpio+bounces-36985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 12:44:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0658560924
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 12:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A36300CBC7
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C5C35F184;
	Sun, 17 May 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbPKp5z0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9235BDB2
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014680; cv=none; b=AYokVpuf7s2bh+wSqbKuYyDz7brv7i9bmiB8xRbU4h6A1PKrOBy3TfhT5PgVXV80R/cTe1+AAWriUEWiu7gj5nE7TdbQDYs21F6w6VjleteSPo2/jwgoAOxO7nrRYyBGe6LKxKw5BXigXxACSTBRwWzoTGwWEpbtA1aLZXvn/Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014680; c=relaxed/simple;
	bh=NKgBvtdxZXByhazq/jWIBzKN5aXVZCRe1HDn4CdDzrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qA5CvVlA8XHqAOkIOYvHG5Qxlr611+ZQeErXblUNAz9FCelHAYqV+BbiYxY9W55jImRDMRvOmOG5Mf6LtRkPuJWDFe6O1uyy/kcAbYt6ZXSJhq/V+0qcyymq89uJX0UIc5KqaSTgYYB8qeakSMAeZbYZsQJR/89Vo0lzAQ0sDH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbPKp5z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E2EC2BCF7
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779014680;
	bh=NKgBvtdxZXByhazq/jWIBzKN5aXVZCRe1HDn4CdDzrU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hbPKp5z02331fBlD+oTpgWi6l8Q0TDyAjRwsQyjHImfPjkHSlTooE+0uve6NRmiFi
	 2KxKGokwVEQe0F8c2l2ysZe5YqdcoZJ60Tp1SoJsju9oEBFL87b8P3odZFBu6nrd9H
	 SX/d6zFhkTNSzis8bUf5LGI7q8pg0L83YMIRy3zMNrAmqwMEVgLS+vnicAzT4IpAzl
	 p3rsMVjT9JllcEf+7tipZwtPeuGpPgWkBQcqlf8fbc7hMQXqdN/iMYL5QmcBScMO8V
	 jGEtNn3ts7aOVK+0Tx9lndZx+PQ4nXqCQeWXw9Io/6cM5s4Yb2G45ClXsHsZOc6uiW
	 vppm1IocoCRpQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so1514488e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 03:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8N2Q1wypAL8jzJ4D+z9AjQuY3GakZAMfeLBWwPcYaeBhXk6bbUFNyd6OFZP05gIsq+Hw0KqwBZ7cyj@vger.kernel.org
X-Gm-Message-State: AOJu0YyGo0G217tjCwfBdXkHPuPm9b2knJ+Ykpq5t+98oVaO/6G8aozr
	JwcEn/aGX3cnfH/bRiig1AAC1PgjCyGhq1vqhSLWADUXdLkr1D90c89jeRIChUNro6e3dXARwIo
	XM5MYL0/4AjXPPVIrYMc0IEEQrLiMseU=
X-Received: by 2002:a05:6512:10c2:b0:5a8:89ad:e172 with SMTP id
 2adb3069b0e04-5aa0e742357mr2819131e87.37.1779014679272; Sun, 17 May 2026
 03:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 17 May 2026 12:44:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com>
X-Gm-Features: AVHnY4KcJvQqyALWA-N59W5M_RE1X3XTIoTuBsqq7gVwhaUyQq70O1xKLiW2oz8
Message-ID: <CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwmon: (pmbus/adm1266) adm1266_gpio_get_multiple() fixes
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Guenter Roeck <linux@roeck-us.net>, Alexandru Tachici <alexandru.tachici@analog.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E0658560924
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36985-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nexthop.ai:email,sashiko.dev:url]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 10:45=E2=80=AFPM Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:

> Two pre-existing bugs in adm1266_gpio_get_multiple() that landed
> together when GPIO support was first added (commit d98dfad35c38).
> Both are reachable any time userspace queries multiple ADM1266 GPIO
> or PDIO lines at once via the gpiolib char-dev or sysfs interfaces.
>
> Patch 1 caps the PDIO scan loop at ADM1266_PDIO_NR (16) instead of
> ADM1266_PDIO_STATUS (0xE9 =3D 233, a PMBus command code that ended up
> in the bound by mistake).  As written, the scan walks
> find_next_bit() up to bit 242 across a 25-bit caller mask, reading
> out of bounds and -- if any of that incidental memory contains a
> set bit -- driving a corresponding out-of-bounds write to the
> caller's bits array.  Flagged by sashiko in review of an unrelated
> fix series [1].
>
> Patch 2 drops a redundant "*bits =3D 0" reset that sits between the
> GPIO and PDIO halves of the function.  As written, the GPIO bits
> the first loop populates are immediately discarded before the PDIO
> loop runs, so any caller asking for a mix of GPIO and PDIO lines
> sees the GPIO half always reported as 0.
>
> [1] https://sashiko.dev/#/patchset/20260515-adm1266-fixes-v1-0-1c1ea1349c=
fe@nexthop.ai
>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Reviewed-by: Linus Walleij <linusw@kernel.org>

The better option would be to:

1. Convert this driver to use regmap
2. Extend gpio-regmap with get/set_multiple()
3. Convert the driver to use gpio-regmap

So if you feel adventurous and have time on your hands,
consider it! :)

Yours,
Linus Walleij

