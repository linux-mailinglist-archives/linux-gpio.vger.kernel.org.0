Return-Path: <linux-gpio+bounces-31758-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKueGeB1lGlmEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31758-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:06:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B854E14CFB2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F14DD3018089
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47736C0B2;
	Tue, 17 Feb 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeBB/uJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10436C0AD
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337178; cv=none; b=ZlUmaAf3XiMcNTFEl6EKsXZTgPxhYmO8ocnV5Yfnqhw8xiF5vgpMWmDDyzYItxP5kMSFWygBgjj9PRuZZ/oAm1aTWlVZ2x3tG3c9XBnpoP5Lno8fHnUuIPZi/PHqMFh8uhkYVNLBj+pEemFwcM/1YG1qsgVefHY+oNuRVgWm044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337178; c=relaxed/simple;
	bh=jBz7t3I1DgJfYQpYN6QbdYGDrdNBkEnRWUIkLkg8cbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFzC/uGQ+qm3W+eP+FZeYRUXnC7bf/+Ln58pwH7puHGW2fNde9k62qTdTEBZic1d+3jLMgd9CDXYEeCyaD9YOgbXpqjbrwLXkfxiWGEKDc0yMXAPKD1y5CCVq4gy0knZ0tUhxd+TZFZPe6qjbJ6DP+xTK+zH8PjhOxsa4YP5IBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeBB/uJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E519C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771337178;
	bh=jBz7t3I1DgJfYQpYN6QbdYGDrdNBkEnRWUIkLkg8cbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FeBB/uJbUt5ZpgC49WWNxrdwZ6iCPD9RZCaW8j5RE51VT6IywlxM5QcArqbZqwRT6
	 Jb976S76WIrJdNrYI8D4C3p4UGxGYvZeWcbzA6q9ugd+EQ5p6eKE9bOKkYizzh0WHa
	 KTxkJRnFtexIcro0J4A0pJ1b4YDn7Nlb6BJtkIiFCILZm6BKedgbrB81kvlRnYD8hP
	 M5sxI5gBQF/oPtqSX2IJ86wmeR3/zfn97PzJBnNNwxMKfOIbnkMHgJI7HzyICr6xgm
	 KBvfEztjiSgf0cUQLI4ubVg27vxlGbiTQrgUJ6g/icdFjL7jp6/xKKPETtQh9/m1dz
	 s/96UpwU5ByWA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dea72099eso4916584e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 06:06:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyGHw4bnmramMXlwo3PtEoEHKRv9bKpc4an4hqsXpENrRDGPeML8OLRme4Ya6d6ivkprqtgA7kghPq@vger.kernel.org
X-Gm-Message-State: AOJu0YyILlptXj1MxAKR8VigRq6HIsDEGuUwsaaiQ0Yk4O9bJdynjAAe
	PFW+TSOtAbPRoP/r26Iy5A3Ud93ruB0FVRNwEIMATA1YdZKgYXReBsaaCNfFPbIr0xyQQokEZe5
	0+dkqROV1KfjHJVh/Y47FWG2SrdVYISFep7oOMF5Fog==
X-Received: by 2002:a05:6512:3b27:b0:59d:dd50:f2e6 with SMTP id
 2adb3069b0e04-59f6d3590b7mr3186497e87.21.1771337177032; Tue, 17 Feb 2026
 06:06:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081431.1208351-1-pshete@nvidia.com> <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
 <0e0588c6-3c5e-4458-bca2-0e6ba935c7b5@nvidia.com>
In-Reply-To: <0e0588c6-3c5e-4458-bca2-0e6ba935c7b5@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Feb 2026 15:06:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me=KFG1x-OkNVq3uZ5E8xzLnoXbmKV6byDej-Czf4LfhA@mail.gmail.com>
X-Gm-Features: AaiRm529yUgSQMMvSW_z6Pn69G1bQKJtNc4MUopu4BpIYFT0g6WRwy1ZlZ5KaEA
Message-ID: <CAMRc=Me=KFG1x-OkNVq3uZ5E8xzLnoXbmKV6byDej-Czf4LfhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, thierry.reding@gmail.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31758-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B854E14CFB2
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 2:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >
> > I'm perfectly fine with patch 2/2 but this one is giving me a hard time=
. What
> > are we really gaining other than some questionable obfuscation? Keeping=
 the
> > dash in the format string makes more sense to me and if we ever reuse t=
he
> > prefix, we'll need to remember about it trimming it. I would drop this =
patch
> > and keep just 2/2.
>
> What we are gaining is by adding the '-' to the prefix directly in the
> tegra_gpio_soc structure, is that we no longer need the if-else clause
> in the code to add the dash if the prefix is valid. And this allows us
> to use the ternary operator instead.
>
> If we drop this patch, then after patch 2/2, we will end up with nested
> if-else clauses to handle the prefix and multi-socket cases.
>

I see. Ok, will pick this up after v7.0-rc1.

Bart

