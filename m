Return-Path: <linux-gpio+bounces-37468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBCYInlQFGrmMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:36:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 226045CB3DD
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3889301FFBB
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A79385D90;
	Mon, 25 May 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImC4QDd9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90258384CFF
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716036; cv=none; b=qMTgxsO+O6Cz0pHui3vJkyGgN55Eh90i0l5cjaub5EBc86V2KpFVE7Os8CqRXRx2w3ZaGVj+yv6kv+RbONEbvlYu/B11eYoESHpqQB+SHquunO+Y7tfshoImdPZ4TPQE7CUVbDLHO3t2NE2Rohy5+oeYT428KnbsS8N25/rk3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716036; c=relaxed/simple;
	bh=yXjR39UKYmK7Ftm8JdxQ+BfSkZzmP0FxKPmu/ezlwIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxhdMJMnLWz/zUbpX5hqg/pf5jr0E2KUXGqWxAPZoNnQ8rwNO6GpX7V/xj8fEj9dhyNh7RR6X3Fos14xiJapIT+HQ/Dohi96uBY2rf8HxBZOeL30ns4RRDVg/bSn/sjmn3ju8pVobi4tJmvpvxSeeYEGrmUXhV4qcvNYVykKEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImC4QDd9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6284D1F00A3F
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716035;
	bh=yXjR39UKYmK7Ftm8JdxQ+BfSkZzmP0FxKPmu/ezlwIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ImC4QDd9N/qMM/+EsFYKpOHt3uAn6d7BfNVhkArLzzNSpaIdyFpSVCAGB6tC9IMUB
	 1+Edf3Th2sM4TMGdB28fxYVFvtH1yGvCwrNkGe5rH2Yyc7+KS0AItEa0R8O/prbaxs
	 fV35iBEvqUH44iWEU74K1CJMdY0pASB1I2hRZzCoHyKliVhYp0uhkPhSj01RUcU3c6
	 j0RN6afeWRuap7GolLcynsFaLmBDqBMrSczmzOapHXsD5JY5G+q6/6zwmF/ZUoHJgm
	 hTs8WTr4Hz1sGzFc4a44rwKbYdrAYR9++vf3xvzXhMUcwqIk4EgGtGP5JAmclc6u87
	 h3+IpGXoTS59w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so11803720e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 06:33:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ82xXWzYPOAfLZEv6+1VkMR7NOHME0gQBxUcOO0bqxu+qzWSeAYzKnPzN1dRHqBpYs39Ylzn3dUijwW@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/uUGT9227TEdP+fUWzbSEssWU4TO+sPpCtntWfzlOZNBYEXQ
	1pHsYONviZh5cgQNXvCbOmlU8YqLI2VR6QbEqxnopUwQ4LSQNAkBFRtT+B7y3u2YrFYS7mKm4sL
	FgHu6+U0lfpbqwh7MgnjBo6Fn3Of3KPs=
X-Received: by 2002:a05:6512:31cb:b0:5a8:eaec:7567 with SMTP id
 2adb3069b0e04-5aa323e0206mr3807272e87.35.1779716034141; Mon, 25 May 2026
 06:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:33:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmvNjH3VR_NtYvyxZCC65erLTwE+6C=FhD8BwR+zj4ozQ@mail.gmail.com>
X-Gm-Features: AVHnY4La1m4efgg6hiAwQ80txwuh9ZpKCSnT1M4A29KgQlSeCx4QcGhOal7zcFE
Message-ID: <CAD++jLmvNjH3VR_NtYvyxZCC65erLTwE+6C=FhD8BwR+zj4ozQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: add kunit tests for GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org,vger.kernel.org,googlegroups.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37468-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 226045CB3DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 3:42=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
>
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

