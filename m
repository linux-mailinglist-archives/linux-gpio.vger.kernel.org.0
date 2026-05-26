Return-Path: <linux-gpio+bounces-37498-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKYHO0BcFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37498-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:39:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA75D28B1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7132300C31C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216683CC7F1;
	Tue, 26 May 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr0UtFXX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98B2C181
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784765; cv=none; b=JR6YAAZ/9BpA+4eFVPYWo8fvwrpSwzJYVtEzlbW2ZRUptIdYh1wsX3sIMBk11diVtb7P1fSP9VjZLRxRL+SqfOSYYXq9Xg7VffAMmJb+lBBzvbSGnZf2HOzxuMtWRYGOlQiXfOsLv60Olnc5/5dpRlEWbczzJs/FMakneKiafeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784765; c=relaxed/simple;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTfZNNYEaMcXzKpfJzF+IlgzoVwffoTmiNOxg7RcAVgQ9lqbCW5QY4xG8Zg1CDZ8qd849V3WIpCpFKVbxMGMsx/Ja6C5+uEXpcI5tlNaU+xvtCLjTUIbKrBVwEWArkBJ6QXka76yoJJwGPUlWspJKhTokpl0JAFOiakKCnCB+vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr0UtFXX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A841F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779784763;
	bh=exUQGs186Aq+Vzbz4if6JSgxOypH0DW9dazCN5aVGK4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kr0UtFXXJPEtIyeAWU2iQjM7xblfpXmolip0IC6jg2bGMHE7ihBWJtNH49ZFf8fIL
	 FXxBICA4Y5gGdyl0jTfBt+p1GleLU8NlOI3fiMO5cUGFXUwkERW9qcEVQHk6iH1hwA
	 XXCPlk+qsflOAcxTXcv/KOgB9yyRUfrF0H+gjoVRmixzOJLjIgRGsPmYper3XfxNUO
	 FaB+jDZfaLtB8HFV3WENG7Cxdugp2Rxp7Z4GAzDk/CJA0wxMSjMfQ6I/wlSPCm0OW8
	 syyo9oSEEknju8cflqizHRFUXAphhNnE0p1YBQWsIJ/qFUFqHAsvrsuaeBuBC4Q8mX
	 fUhXhHBaQxTxg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393c93a0166so97216621fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fS/r5RKuYoVWOH0t3Te/dP3kFAM29AM36M44a8OFiAE4agEHzNzzFEHcB5xRwYJDlfBP1QGG2L4P2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlLnBqzGYZzUwkCxVP1nG5MF0M6RQJdDrvYpG/yyRF+2VagSc
	73S+/Iva5IjZX5uw71CtOImvPmujoKuGZs0RTViMLkgTTImQ6FQumMiGPW6hv4HgRFFwsKWlAF2
	CDU+3q2I9pi42xnbDCt8Mz74+FUfqlfbX3/GTM13Ojg==
X-Received: by 2002:a2e:b8cd:0:b0:393:a5ed:7dca with SMTP id
 38308e7fff4ca-395d8c08274mr63525631fa.10.1779784762028; Tue, 26 May 2026
 01:39:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:39:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
Date: Tue, 26 May 2026 04:39:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
X-Gm-Features: AVHnY4Jsw9CI6wuy_ristr08_BrJrSKHzuLkXDIWO8DXMOBNmupoP0enp6DIEeQ
Message-ID: <CAMRc=MdnmwvZkgW9yiMJDMKRXAmirQS_XQa8TnJsQOEGo8OQig@mail.gmail.com>
Subject: Re: [PATCH v2] media: camif-core: Drop GPIO handling
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-37498-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83DA75D28B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 09:55:42 +0200, Linus Walleij <linusw@kernel.org> said:
> The driver and platform data refers to the legacy GPIO API,
> doesn't really use it, and also calls some GPIO-related functions
> passed as platform data.
>
> This platform data is not used anywhere in the kernel.
>
> I'm not outright deleting the driver, just deleting the bogus
> GPIO handling. If outoftree developers want to fix up the
> driver the GPIOs should be defined in some kind of firmware
> node and be obtained using the gpiod_get*() APIs directly
> in the driver, but I don't even know what these GPIOs are
> since they are hidden in platform data that is not in the
> mainline kernel, so what can I do.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

