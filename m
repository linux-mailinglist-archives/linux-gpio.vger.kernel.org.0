Return-Path: <linux-gpio+bounces-36132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOr2E0i7+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:41:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B535D4C9F97
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C95FB300A7E2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760DB321F2D;
	Tue,  5 May 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZBs8fin"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF1313534
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974049; cv=none; b=kZcoiJ3kXqica5uSQE1fsuwgb7tIurLCBR4mIyIGfv5I1Zyt/HZ1sA7k5iwTgx6FfvrV2C3g6JxGrfHSRCL10wTypkPiqVgK/8Y2xxbNgaduSL43hhXLjLk+qLBEkP1Pck6zlAzzmskLV7WIQ5RqX70yiBEuqoqwVyOKoSMf2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974049; c=relaxed/simple;
	bh=btt3LPn7ucCrKf0Lb9GfmZp0KdJIpb2em47qMoSmkIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CE3ys3Q6fIITbjFaa2joioQCuYEb2zbfmMMLA18DVntinbG0hCFEs9NfT0Y5mz+bY1/8MqUTkCYLl0NUmUWqlrpfjR6BZGx9ouic4FxVBwapMFr5xnTizvbV77s05fRq2jlXhn3gT1Vc41sBk62dw9WDWEuasKQgtjm7k4Az7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZBs8fin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3D1C2BCB4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974048;
	bh=btt3LPn7ucCrKf0Lb9GfmZp0KdJIpb2em47qMoSmkIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JZBs8finZojelW8zs0jJKB2I/bgN2ubfMMT+W5fpvj96627aInhWe8pQSHe8FOTkM
	 O45iiTWLL7JpvAfbJUxJsWhoPKepFw2joB0WwMIgWembJF7rFwHOk2MayGbIjosg2I
	 3p/dsekCH4HTnzaiHqhv7SfLP5Uo6Nrj9+KWkEzbQTYUAtMch25rk4ICn02b4hV1M3
	 GpLEgvcST4ujFxxCVAXWRERGckNcPZFBxU+4PRTOhEOh3tIBDD/p8iAcXLh0wodhda
	 UaIK29YRb64LHrFye/Ga25XCMV/nt4YlUUrTW8o6Dwrq7gKZxa2M3qKWQx4XlvCTPL
	 kjxzZMCD5vfGw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7d984096so56690471fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:40:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8UpJjaZdue6s1hTCDhZj0LgvbdiEOS3p6VKaumC/KgICY7kaIu0f1F8dzeUDCuy7AWh5EHgY1/d48O@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLFnS6Z3Snbt82Y7Gbm9rq6eI/ZhIovmo/lh9SJLln2PPJ2YG
	z+zxBniFaeSZt/iMgkc6RZ4XoeQ22otifVZRQp9g8Zpx8vErIMlzdrTVUaScMo8JK9xjzL8IqhA
	g9qnNdHvyOdMto4bE7rhnsruJ31tNSAA=
X-Received: by 2002:a2e:9606:0:b0:38c:6b42:3d83 with SMTP id
 38308e7fff4ca-393784e0818mr37572761fa.15.1777974047654; Tue, 05 May 2026
 02:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429080312.15561-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260429080312.15561-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:40:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkoUYiabhFKmbYVabcNKGMzk0qegcYpVCSBLQH40d4jXg@mail.gmail.com>
X-Gm-Features: AVHnY4IRqxo7AOjBjZowgqaNuyQXlgKJ5Xl7s6e9iMFswkOuFoJOmz-gSACa2Os
Message-ID: <CAD++jLkoUYiabhFKmbYVabcNKGMzk0qegcYpVCSBLQH40d4jXg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: add a Kconfig dependency on SYSFS
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B535D4C9F97
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-36132-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]

On Wed, Apr 29, 2026 at 10:03=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> gpio-sim is unusable without sysfs. Add a Kconfig dependency to its
> entry.
>
> Closes: https://sashiko.dev/#/patchset/20260428113439.9783-1-m32285159%40=
gmail.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

