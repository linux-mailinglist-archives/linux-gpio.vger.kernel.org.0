Return-Path: <linux-gpio+bounces-32248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO1KI8fCoGmEmQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:01:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AC1B0234
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB1FE303EFF6
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 22:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4382F12AF;
	Thu, 26 Feb 2026 22:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt3E2KPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC430F93C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772143291; cv=none; b=dIdAlm5IkyBnLJ4GECXTFacXzKZZPdKycP79fpgc+nYYUZQVmKg9eodGoinjHIcKMQv0wLi1sHkuNOCyueH0F8bdANX1/i/GGzPbElS9pnnrAGqelmG4c2+Wq2L7ZJngwnrhU4oXCJDiT53NEuu929Y6Nfi1Q3OK+9IVdGf8oM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772143291; c=relaxed/simple;
	bh=f9P0wFnQuxeEnqq1zN+Y4wlkKrZpB/q8+2B+SdGuUSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cfwma+vA05bSuB3xFvDui6n5XoF6N9MfJJVNxPk6Z7UUhXsxsVKagnlvqNy4nGcU27ojUVBsY6NJQrI0hhqiAHDq3FjPcWkpRKK71dE1OasXE0vSuATfWV7yzTJKDcEMXmYW6s4c8lOg9/3tLLqzupUWnNY8K21u0jfSExfsoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt3E2KPT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD333C116C6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772143291;
	bh=f9P0wFnQuxeEnqq1zN+Y4wlkKrZpB/q8+2B+SdGuUSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tt3E2KPTj91usmJEWHUzxJnFOJCLusOP1tAhQxUDxxquYiH1mfgOA2FHkArh7vy6y
	 OuSersK+uFiHKedICODKTS66VIXJQyMN5SGCmt3C6OZVUMyMYjS3WfX0Lbt5UyuL+4
	 eKqpLqYxZ+t6AGLebYK/bEeGi87sNZAhXvExWhoOjzwax7QPu0Tm0DES2W+sOfr85H
	 +4YMctaliCWV0QmMwkad3Gl2A/Cst5W7+qB4BJzl4cszpJvtHie9UuEEe7USyeAlgU
	 7CIF894AQUmOZLgvzqZj7S8flT+IB5qnyRESXW5mDkNre2VuMWjOBAWLL/gc8jd5vC
	 pYLiEPxzfP+fA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79495b1aaa7so12815497b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:01:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvWYoIVtgtwZrwKupFEnZRKy/SteuPGQOatanWaEJ9NXhYifwCyFvHw3McTL/Kz/O1hLpaZcxR06LJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYF+imtLbgTBn5GEESqro9UNIWsTnooOZOCZgdbwrg0I80whRP
	X0NASYyI9p2JM24caZz4/qzIpdKzsNBzy6cU/OakK2ZV44emf31Lp/DcOlC42cDohF0wzlvtfPX
	EkZ1aBC3ZCyoGJpotMq/tJqdioaUvAcM=
X-Received: by 2002:a05:690c:480a:b0:798:7821:8b63 with SMTP id
 00721157ae682-7988564cf72mr6202487b3.62.1772143291072; Thu, 26 Feb 2026
 14:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:01:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jVyrgVNevw=pXvR2oY_AdOLSnJqePbkE84gRJ0u4=ig@mail.gmail.com>
X-Gm-Features: AaiRm51ODHq2G6rOIaC5HEL7AXTABVU5RqpyCwnbdIDWGbLJu3fiI8qsj-VLJ0g
Message-ID: <CAD++jL=jVyrgVNevw=pXvR2oY_AdOLSnJqePbkE84gRJ0u4=ig@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: generic: Don't use 'proxy' headers
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32248-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 071AC1B0234
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:20=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

