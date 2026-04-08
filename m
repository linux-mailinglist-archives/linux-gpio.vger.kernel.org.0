Return-Path: <linux-gpio+bounces-34864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK7gHXQC1mlsAAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:23:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3023B80EB
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42C0D3015E10
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 07:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6458237FF4D;
	Wed,  8 Apr 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICum8upv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6E377EB2
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632813; cv=none; b=HL3RfdkCcZxDRZIEwfptPMDWc5LuusuR57HpuwQ+6B78InHLlZ/OjyeZlxabf0gSqTngeZ9nd1i3hcBNelRIpisRisk88uvssmmgZY5XoCf1oTYeNBRJqlPtjljJxKLMk4pzlws1u0j+68KCBYhQCLSqMOBs4eLPbj5orEnGEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632813; c=relaxed/simple;
	bh=vQQRzvuKVOEeuzDANaerK8guZGkuHGOWY6CJg112n1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzMdNiGDW2hTz4tnEtU7s0ekXxKdTq5RNXyL+W5MYdlhkeCKaLVemoYCkCMVoQ058uIecNzrLc56+H9ird927MRtZMvbjULQ6M2PGYgeSVpZN9ZAQwfhNyT6qokMiunycLy4hMebMqvrqqCSpa99W62CyrqAEAgiEHUEcnY+wH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICum8upv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D68C2BCC4
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632812;
	bh=vQQRzvuKVOEeuzDANaerK8guZGkuHGOWY6CJg112n1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ICum8upvZOUXykuOhN9aXqsuGRX9OLnAOMdlYMDinvSA7/2ptjSfE2fntqpU2+0/x
	 Bg3Da7vAaclGLZQ1VAle8Tr2GQHU6lZmiG+KYJ+yUN4TfM0Aq9JtQqLA2a6Heb2mCQ
	 GJ9oz+Sg8/1rUESv4/XMXk91/sVfGsFivVBjAbxF6Nh63hH+m1U6VbzSIT7bijyFK+
	 B0Z4XP8+V8PNuET/fqNKEcmEJZPgG28bdkh8deuqe1J6jDgj7IaRA47j2Q9Nzk97dF
	 Bohy0uqHs9lZxwvkWf2Jdg2cAbt5S7bR1mx5beaijwkkareP2BC+dnaStkXgaD4gJG
	 EkWDB/qvsN1dg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso6106768e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 00:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKSVNsrFlNHENYtWOQRysZtzJuT5/IZJEXxl+NkSvEWDVfTpbsljsEcW4OltKLidShvbEnq23GhC3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnkPbe6kUUQDbAL9FS6Umz9Jrmv4xRvi9zXg+JW7ilC2G70ge
	NL1hrj5VcmbXPucWz5DbwFy/UjR/y5X9p9tUS/qhFqZHb+SGNtTCNvTv0pX1GxyKPDRmpo29Oy/
	zQty+wCQwM98qTHyVTaNHqsP/fNSsTsX7vp2cAlnhDg==
X-Received: by 2002:a05:6512:224f:b0:5a3:cd17:8d71 with SMTP id
 2adb3069b0e04-5a3cd178dd9mr7417144e87.21.1775632811510; Wed, 08 Apr 2026
 00:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com> <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
In-Reply-To: <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 8 Apr 2026 09:19:59 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
X-Gm-Features: AQROBzBCj7JqwaHPPnoLthJA6owUVGcRqQISKVXzppqDGxU8U2cLLlP3S_fk-F0
Message-ID: <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34864-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CE3023B80EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
>
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use
> -ENOTCONN to indicate the software node is "not connected".
>
> Acked-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Danilo!

With Andy's Ack, do you think you could still queue this for v7.1? I'd
then take the GPIO patch (2/2) independently and it would make further
work next cycle much easier.

Thanks,
Bartosz

