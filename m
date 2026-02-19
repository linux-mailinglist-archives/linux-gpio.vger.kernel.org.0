Return-Path: <linux-gpio+bounces-31886-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPyfE7FJl2m2wQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31886-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:34:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AF16143E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74738303EAAA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63B034F48F;
	Thu, 19 Feb 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMT+LQ0J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995434F250
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522418; cv=none; b=C3oTG+njIheo26BsC4AoNfN9aZWujqh/KBHH3AHIlg6TOz+9WBH8TvieqWzMeF6zm82a+dxkfmfzql7fXPV6fp5p3ai5tdAmbLyVf748XuI7YtARYmDKkTE9nKAH6RwhjRCy0l7Jr8bYwK6OgJPpCqsRfGh62aVq6+rGXKfg7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522418; c=relaxed/simple;
	bh=AguPlO6wrS2D0qkHalzAdcfZl23Z+NKLu0kgdArlN8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpWJKL2IXfjpClbhg9pz5Bdizr8OL9MumY5GRsmH9OA9mlXbGsjRQpLw5mO6uU539hhJUWMNJKIawbQuN5k3H1wESy5lIa3crOWWit75S16nWVKEkllekliN4lQ/JIZe82EZbLV/XQhJxOOott1I9hmyijTT8K5fpV2uHFV08M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMT+LQ0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C60C4AF0B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522418;
	bh=AguPlO6wrS2D0qkHalzAdcfZl23Z+NKLu0kgdArlN8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DMT+LQ0J+GyV6s2yu/AAirt396r2WVxKuY9Fak1cvnHhTTY0XmXnMJxH7QtXpGjnn
	 juQbsFvXAmmRKfgAzEII34XOYbR0Qq8kGirPcqfMNJokTWvKRI+FDOBr0ZW277Vd3c
	 yyuFgvWAN8x2WyrKffdoqHodeoctAzw/eWo+kBHdth7AvJ0KsLZN/hHWT1eOQDUzcC
	 fG/Jtfhs0QSOe2aTDLluwihgoLEG4j3iwR8scejvx7iiwUOFa/s7HbW6tn9JhyPVkj
	 m3KHuvSbJNh9LwrvKVmmXUIB5/c4Cap14sl27eIN3ilwJsTxPJEov0K/FFMeCq8vRS
	 0Lsp3Wdb6gcjQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79430ef54c3so10276847b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:33:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSjo4e47m8uyNiqdP+2/upHPk2Uk+pmQIbb7wXCh1QE3N6zMPsaoWXTD/CtSKiNvKCr0aMgj654eqI@vger.kernel.org
X-Gm-Message-State: AOJu0YxVG3nYqzXIXB1ffz6Yt9BOXLLmfr+HFjm5w3vuamswiCmeqOEB
	UKyAYwBH7LLg76czSs9tPX2QEyDdJ9k7DtGei15FknJAUJSCXL7S5uIADYS7WOoGk0+u2hQDbUc
	XQNvpNsy+JfskbM/uSca8yGEhZvy0XzY=
X-Received: by 2002:a05:690c:6a0d:b0:794:baaa:cca7 with SMTP id
 00721157ae682-797ac52275dmr138089237b3.20.1771522417569; Thu, 19 Feb 2026
 09:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219134647.2258593-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260219134647.2258593-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:33:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9Qcrib2T29f9XgH0Qy6P12unQJrec2nd9X06BOKc=tQ@mail.gmail.com>
X-Gm-Features: AaiRm52UC27FegNFTJvt0bsxmlYxxIA4zznIp_QH6naXxgNVX3DAKldv3VcJ6Ew
Message-ID: <CAD++jL=9Qcrib2T29f9XgH0Qy6P12unQJrec2nd9X06BOKc=tQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: ts4800: Remove duplicate code to handle
 'ngpios' property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31886-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: A49AF16143E
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 2:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The gpio_generic_chip_init() handles the 'ngpios' property and
> assigns the respective field in struct gpio_chip either with
> the value of it, or, if not found, with the default based on
> the register size. There is no need to repeat this in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That's right.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

