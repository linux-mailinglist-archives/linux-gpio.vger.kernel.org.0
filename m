Return-Path: <linux-gpio+bounces-36338-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA5bDAdI/Gk0NwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36338-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:06:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D34E47C5
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDBD301C942
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0136232C94A;
	Thu,  7 May 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8J1su0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E9330305
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141187; cv=none; b=CDF/7EisO3ukbdHkml3nOaRjzTkbmNuy054tXQq5ZmixNa9z4P6x5CkrETxWTXF0Z+zslWO/DXH+cPZPlgUdfDyp67Gdn8/1YVmhK7tbT0Z3XXYbWpGVZx8EHPTLLE1WCUlEqNzhRIZAlgWh6S5S+jpE0sw1ZnQCK60bReFeoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141187; c=relaxed/simple;
	bh=YngE8hl8cm930a03uKXxYmFMpBZpYFsXPrKTL8iEIN8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMlitJDnSuXMV+2NL+HQ4VVJZHYWmTae6h6Lh9e2In6dOb7bZzGH03QQngq/6HmTKx75mUqUWTPgVAH927ppu3Yjfcn/DdtJYeLV+GzLJuSkryBCgKGsxdNHlPa5peCVSCUpuEVFCo53uuLMWGF0abmYEtHdyzIfH/t44ku5Qlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8J1su0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F342C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778141186;
	bh=YngE8hl8cm930a03uKXxYmFMpBZpYFsXPrKTL8iEIN8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=R8J1su0u1yswHrLGVt7cvqj5rFitwuSY33C+aCBdaj829xPjiiGIJqym5RPPZYa/X
	 Ga8cSCDTO1Ns/Ec38xNG2L8gibYUJz7k+5YDtbVl1ObojI21alul68f9b/diRXNRW9
	 kFQMw5QoUUMg8gujgIepD5MUg7rxQVpqGApcatMViEf13oOnpDcm7tFCOa80EbHOYR
	 ZxdU98iMTYNQMOsORTa/dQ2lgp7vM1Pmsz7tUZ0c1Y/76LIEO61FZRJGEZ7fymlRj8
	 CRODP5HutrSycxd/EiIOAHxjFnCt0FnYWAnQS0VcDAhGcuMJWL9NG8P8QftJFBYvc2
	 6jIu8FSGMX3OQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393c93a01abso4393811fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 01:06:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJDKshalRumGh10+Gc+XL6rK12scPglSalgxGIhEwKxay3Uws4
	9hdPSyY7VjOfKNLIQ2Jr4CV63qPtwLo5uokN85BuSDgGusKta3NqmTcC2SbO4iZCjjLL6GKF91V
	S82KFe9IdlinoNUZZHWye6gWgkZcglXWgbNXyr9dDHQ==
X-Received: by 2002:a2e:870c:0:b0:38f:7fd0:1c53 with SMTP id
 38308e7fff4ca-393c41c7482mr18945791fa.19.1778141185021; Thu, 07 May 2026
 01:06:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 03:06:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 03:06:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cd44c71752347272ee836b469e77f26dfb44d06c.1778071745.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1778071745.git.sean@mess.org> <cd44c71752347272ee836b469e77f26dfb44d06c.1778071745.git.sean@mess.org>
Date: Thu, 7 May 2026 03:06:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc1wDP9NmcyZR1au5DfJ4KosCgnt0QBjvZTwMgXTTprAQ@mail.gmail.com>
X-Gm-Features: AVHnY4L9PSzRrdu8-ZTCTnSoBCCrTN05kPlmh6BOzuhOHOyIRY8lvDsPnhliaM8
Message-ID: <CAMRc=Mc1wDP9NmcyZR1au5DfJ4KosCgnt0QBjvZTwMgXTTprAQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] gpio: ts5500: Remove gpio driver as board no longer supported
To: Sean Young <sean@mess.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A06D34E47C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36338-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, 6 May 2026 16:42:50 +0200, Sean Young <sean@mess.org> said:
> Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
> this board is no longer supported. Remove the gpio driver too.
>
> Signed-off-by: Sean Young <sean@mess.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

