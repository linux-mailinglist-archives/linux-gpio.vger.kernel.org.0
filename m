Return-Path: <linux-gpio+bounces-39103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K+/5BIZKQmqk4AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:35:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD96D8F88
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:35:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ceezZL/O";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39103-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39103-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181463005D32
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4979D3B8D5C;
	Mon, 29 Jun 2026 10:33:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3012A38D011
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729188; cv=none; b=LvzzyKGLZpnkFwc6ZxaW6Vca3u5wMKVQhAK7gW9eyI8qMP6JdGl/j/44q08+9W5Mo1VLEH80kJwT6zQoIt8PSweya2GbqRY9ag2wtj8/dU1zxK9qA+HhAW9Er3vFbNfMIJG1Bz9VQ83PRgbjkuuBI0uWfrZqW89SzJcpaJ8+CZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729188; c=relaxed/simple;
	bh=IPf7npHKpKVPUHjTIUCVByl196Hnkbb+w8joYF7Efsg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMdKFf07nqXghdeluGKrg0LyhKJW0Zn7+LfOkRksT4y7R7TgtzF60bkk2yNKv8xZYbnQogCNtSfBMS/tnhS79vPGAmyU5WEYnK09uDXZfxyrYzCbq+j2uvX5OVWs8io9l4x0W/c5JrKHNrZ+swo3lkuM7dimc7SYDanDDL2bUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceezZL/O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25C11F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729186;
	bh=IPf7npHKpKVPUHjTIUCVByl196Hnkbb+w8joYF7Efsg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ceezZL/O+++SnRnbMQA8GB0m+FFX0GaNrccyQCJTK4euAfAxed3aL+RAShYJIEan3
	 5qi1wRJcIoqYDooCwOWa0Jnknly5I1maVQxmdUinm7LGyuly7WLIe/wvcIj83p56K9
	 u0JwHqfekc/lYnTyPxIJ83bYi+MjJzkJ2W6NLMS2e5k33rAuqQWrPSOc2gNUqdwOWP
	 j31juQulWpfgBfb7GUZA0nB7OrJ+S3ftyl404urcPMydf5/CV47KQ3A+jD3HcBoVNl
	 y7NWYamSbXZX1lRiDoHIaMGZCpjWbuF9BeSRIlBGYTZTDAoAYLjbXlc/8g1USB0ZDm
	 kdzMCvqYImLQQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39957d210f4so26835511fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7he3WRYY79ifOfr5pjPJ5bPFFpfpOkz/9PBUS0JWe48UK9KYCoHjJgjNvnJ2sxOzwtlo+aD0jYvT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfshzpe4UeH2nL5AUPL1BEj1vI/1VOuaq2hbz+vREF+gCn0qSj
	yLGUZkcliw4/EgoLIJ8onOqLbWkGLGeF1oaXYWJop9gQIXfDTIB7EvLLxREcHH08wToQtTuemiM
	yZcYQlnM3N1k6B5lPjNpOL8UI2i+U6gcfY+AQY7r41Q==
X-Received: by 2002:a05:651c:1597:b0:38f:20cc:2bb0 with SMTP id
 38308e7fff4ca-39acb6b61bdmr37128281fa.23.1782729185701; Mon, 29 Jun 2026
 03:33:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 03:33:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 03:33:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629060526.3638272-25-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629060526.3638272-1-jgross@suse.com> <20260629060526.3638272-25-jgross@suse.com>
Date: Mon, 29 Jun 2026 03:33:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdO7nKsLLRJuygcb49iNEgviUd9TAOJ+NG5LqweodQ6QQ@mail.gmail.com>
X-Gm-Features: AVVi8CdysbreubTgRkFDPe6zcyMEAaN06tO1HAMpwWVA0R4ZbE7AL9NonK4pCFU
Message-ID: <CAMRc=MdO7nKsLLRJuygcb49iNEgviUd9TAOJ+NG5LqweodQ6QQ@mail.gmail.com>
Subject: Re: [PATCH 24/32] drivers/gpio: Stop using 32-bit MSR interfaces
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39103-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:email,qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61DD96D8F88

On Mon, 29 Jun 2026 08:05:15 +0200, Juergen Gross <jgross@suse.com> said:
> The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
> removed. Use the related 64-bit variants instead.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

