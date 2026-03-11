Return-Path: <linux-gpio+bounces-33156-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOxeL1uAsWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33156-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:46:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C474265A61
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 090243074A17
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2708B3CE4AB;
	Wed, 11 Mar 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnkKJ6El"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65083C1973
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240197; cv=none; b=X7/V6U0INLGlKahCdN/Fvqubwd8a2CIuZbprLuwUHc86uVj/gweNE+n0zhFmvLOTz/lG3oEm6DK9BycgQKtTRtmYEAN301j25TZQV8cWyfyqrmLxuwWps/sD1errqyy1DYPkbpNfU5uIuASsergDlBW7FSJ37QuAEAdO7kEozFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240197; c=relaxed/simple;
	bh=h1qh8lhkzfA+PMkFQIu0wSCErLYzDUkyJ28erHfSD00=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+2Rie7QnBztYD6gqWSdiBR7ESJRWG1l/n6LgDoU6twLd7NTS0/KRzl1deXjIrFieri78q58t4kz66SmS9WcSRMZaAIVaXLfUWWETABDB2spd8CELTTTgJhV7FtDQ/AO+84wkk5xAE68r0TG/C7FzSLloULbbpkvy5OF1MJsveo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnkKJ6El; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B280C2BCB0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240197;
	bh=h1qh8lhkzfA+PMkFQIu0wSCErLYzDUkyJ28erHfSD00=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=LnkKJ6ElZjDpz6fqIEF1LxEl6Qe/3p5SoNoKvbf0mvnBSZbWym72qNPoccODUkgii
	 BZ2tKj4N+WKBOtNchsxTtux14Ia2YWyYqG2rje6IDEf665X8ZOqnIsGaDdsbxUQ4fr
	 8TzRjUPKVMGgPiBYqs7JQgZzop3OVxoW/9iD22dYzXk5ZbHKqPLuqFiYgDmC89H9nA
	 RwEIjChpg9RhZ9wdV/MLBP12XFotfY41f7j1T7COxLYe8dgHREdZNepNnqCT8we6kk
	 01nqaA5SpWGciaUrM7Ce1wVQ3IXAPpU5kwm7jrHUPEhEFtgLHpfJzClSmIFqUo1/+K
	 ODwMlT3iIENHw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so7923291fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:43:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOG4RbmRZo24bMUU1sY/Y3s2hB9+pQS8MxKAtNrpww6lpynaqf
	dGd1aEV/pu3n20F+ejEI4kZeed9zR4rOGjLgN9GMDTDtgdbWH9p+udAuwVmhjfYH3LGrqZAHx3o
	YC+NKXW3PzsRvZdV6D+tneSkt7Kcw4Lv9+bHNQmCeug==
X-Received: by 2002:a2e:a448:0:b0:389:e3ad:40b7 with SMTP id
 38308e7fff4ca-38a5cf8b964mr20212751fa.2.1773240196294; Wed, 11 Mar 2026
 07:43:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:43:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:43:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311131910.835513-6-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311131910.835513-1-antti.laakso@linux.intel.com> <20260311131910.835513-6-antti.laakso@linux.intel.com>
Date: Wed, 11 Mar 2026 07:43:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfCK-_bgQjiaNXRmqkm54Rt0QS=f36GetQk_FLS2B9_kQ@mail.gmail.com>
X-Gm-Features: AaiRm52awUAstoY3ZdbmnIlGlfUbAopGihciRJIAINz3hkZdyqoe4MjBJPlwEDo
Message-ID: <CAMRc=MfCK-_bgQjiaNXRmqkm54Rt0QS=f36GetQk_FLS2B9_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] platform: int3472: Add MSI prestige board data
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, dan.scally@ideasonboard.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org, 
	hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com, 
	kees@kernel.org, ribalda@chromium.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33156-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C474265A61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 14:19:10 +0100, Antti Laakso
<antti.laakso@linux.intel.com> said:
> Define regulators and gpio for ov5675 in MSI Prestige 14 AI EVO+ laptop.
>
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

