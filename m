Return-Path: <linux-gpio+bounces-35672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJq/OCWA8GlSUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:38:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E95481A15
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 536F130E47F9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AC03A9D9F;
	Tue, 28 Apr 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+1LBpPe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AEA3D47A6
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368721; cv=none; b=SRrD1Kv8h6ykadbsVM4SZXt2oiOs3eBf45Bq+WQ6m+a2C3YmoLcvAuf20Kx/IHB1eHyzBa+uISnz8LKZBK4Zrg93ai45A/4MPTmi7hjGLH+Y2DTV1LD0fCPKUZxxRzjDuN9eAoHWGlKshoT+S/j5BIa5WlFpfv4MbekuybmnfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368721; c=relaxed/simple;
	bh=qseaOoxgE30N9aoiBtgI2SdD0BLW/ZwaYr29OrB4Gmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSxjP1DU2s5PAwZjufB+/8Q8eJzMfHM+Bhsrex2dkGWXWPtHc1IN8a71B/U5jDOw8z3LVUahYF7XIbzwIMVwppVUAUNeH6VW1ktmXq+NGAXY7J8s47n79UnVLYD7NKiTRa8I1Z3eH3yt54qA05O3eLhYJ1VljZ9YnRNKwoolmII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+1LBpPe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15F5C2BCC9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368720;
	bh=qseaOoxgE30N9aoiBtgI2SdD0BLW/ZwaYr29OrB4Gmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S+1LBpPec0Gebhbb8PFljz8bFrGBCVs/hiiuhSMNHdjOVgKaWZxQIgNTIIs3yHI7y
	 xLf/OGOyyUfZpiUgVgyWdhefzIpF/C1rSstsIDtGBtlatwfyKWYOPm6ER0vK4fWHJN
	 KLzWR0zAqPsVSOxROxFXSP1xMrnJaXDokRWUn0bjtXEjmsPLmMwO0oD+DxJed/8hcU
	 ArK5ad+NM2c2ABGebSQgsPH3sHjLoGhmSs93cNOlUJ2kFsR8J6K4JNNn/PJZb6x7fn
	 1b34TuydZbrVpbIwaoiSwWbuEWxyYZ/w0TPLpAomDvxqZb8TGBYIV8AioEVLNS7X7h
	 vhCiQzQ5M7tsw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7d984096so123502121fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:32:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YwjrZ0QTTZgEYj+yTEXp4watUEldF+YMtMzTRu3B5mHVZB1gZP9
	Q71GVntQoOGp4ufS0RsrmlS2zw4kixcnNzl1HeyI1IOXPZkBinxP9zeW5e44yPn0a5KKHUxt+lO
	304jh+eaX3dkSu1oCYyigN/TE7k4+IGA=
X-Received: by 2002:a05:651c:4355:10b0:38e:9ece:61e9 with SMTP id
 38308e7fff4ca-39240fbfda2mr5696631fa.25.1777368719515; Tue, 28 Apr 2026
 02:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418191125.26925-1-yashsuthar983@gmail.com>
In-Reply-To: <20260418191125.26925-1-yashsuthar983@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:31:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvObGOyHxhXUoDCT=Y-_vwh+aTgKBcSitcyi3OFcGchA@mail.gmail.com>
X-Gm-Features: AVHnY4JUdzrEru4XnqwErNsjOsCEK0FAbjeu9kPrx-t3z5GWgyv90MtRVCqWCdo
Message-ID: <CAD++jLnvObGOyHxhXUoDCT=Y-_vwh+aTgKBcSitcyi3OFcGchA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Use kmemdup_array() over kmemdup()
To: Yash Suthar <yashsuthar983@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 95E95481A15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35672-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Sat, Apr 18, 2026 at 9:11=E2=80=AFPM Yash Suthar <yashsuthar983@gmail.co=
m> wrote:

> using kmemdup_array instead of kmemdup ,as it is more
> readable and matches the intent of the api.
> tested with w=3D1, no new warnings introduced.
>
> Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>

Patch applied!

Yours,
Linus Walleij

